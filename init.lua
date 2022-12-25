local init_path = debug.getinfo(1, "S").source:sub(2)
local base_dir = init_path:match("(.*[/\\])"):sub(1, -2)

if not vim.tbl_contains(vim.opt.rtp:get(), base_dir) then
  vim.opt.rtp:append(base_dir)
end

require("dvim.bootstrap"):init(base_dir)

if #vim.api.nvim_list_uis() == 0 then
  return
end

-- dvim.statusline = require("dvim.statusline")
-- dvim.statusline.set()

local settings = require("dvim.settings")
settings.load_defaults()

require("dvim.autocmds")
require("dvim.augroup")

local colorscheme = require("dvim.colorscheme")
colorscheme.apply_colorscheme(dvim.color.name)
colorscheme.highlight_lsp()
-- colorscheme.edit_colors()

local actions = require("dvim.core.actions")
actions.load_actions()

local filetypes = require("dvim.core.filetypes")
filetypes.load_default_filetype_settings()
filetypes.load_user_filetype_settings()

if dvim.lsp.active then
  local lsp = require("dvim.lsp")
  lsp.setup()
end

<<<<<<< ours
local keys = require("dvim.keymappings")

dvim.keys.normal_mode["<C-h>"] = ":TSBufDisable highlight | TmuxNavigateLeft<CR>:TSBufEnable highlight<CR>"
dvim.keys.normal_mode["<C-j>"] = ":TSBufDisable highlight | TmuxNavigateDown<CR>:TSBufEnable highlight<CR>"
dvim.keys.normal_mode["<C-k>"] = ":TSBufDisable highlight | TmuxNavigateUp<CR>:TSBufEnable highlight<CR>"
dvim.keys.normal_mode["<C-l>"] = ":TSBufDisable highlight | TmuxNavigateRight<CR>:TSBufEnable highlight<CR>"

keys.load(dvim.keys)
=======
-- Telescope Customizations
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "White" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "White" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = "#cbe272" })
vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = "#cbe272" })
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#fa8d6d" })
vim.api.nvim_set_hl(0, "TelescopePreviewLine", { fg = "#cbe272" })
vim.api.nvim_set_hl(0, "TelescopePreviewMatch", { fg = "#cbe272" })
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#b0202c" })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = "#cbe272" })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#4a90e2" })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#262626" })
vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#87afaf" })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#87afaf" })
vim.api.nvim_set_hl(0, "NvimTreeExecFile", { fg = "#1dc03b" })
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#1eab49", bg = "#121212" })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#ff9b21", bg = "#121212" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#d64147", bg = "#121212" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#373b41" })
vim.api.nvim_set_hl(0, "IncSearch", { fg = "#282a2e", bg = "#de935f" })
vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#af5f00" })
vim.api.nvim_set_hl(0, "NvimTreeGitStaged", { fg = "#3cb371" })
vim.api.nvim_set_hl(0, "DiffText", { fg = "#080808", bg = "#f18422" })
vim.api.nvim_set_hl(0, "DiffChange", { fg = "#555555", bg = "#bd420d" })
vim.api.nvim_set_hl(0, "lualine_c_normal", { fg = "#86b7e8", bg = "#080808" })
vim.api.nvim_set_hl(0, "Searchlight", { fg = "#afff5f", bg = "#5f8700" })
vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#464646" })
vim.api.nvim_set_hl(0, "rainbowcol1", { fg = "yellow", bg = "white" })
vim.api.nvim_set_hl(0, "MatchParen", { fg = "#80972e", bg = "#c1ff67" })
>>>>>>> theirs
