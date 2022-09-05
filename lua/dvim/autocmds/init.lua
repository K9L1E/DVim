local augroup = require("dvim.vim.augroup")
local autocmd = require("dvim.vim.autocmd")
local autocmds = require("dvim.autocmds.functions")

augroup("DeathVimAutocmds", function()
  if dvim.focus then
    autocmd("BufEnter", "*", autocmds.buf_enter)
    autocmd("BufLeave", "?*", autocmds.buf_leave)
    autocmd("BufWinEnter", "?*", autocmds.buf_win_enter)
    autocmd("BufWritePost", "*/spell/*.add", "silent! :mkspell! %")
    autocmd("BufWritePost", "?*", autocmds.buf_write_post)
    autocmd("FocusGained", "*", autocmds.focus_gained)
    autocmd("FocusLost", "*", autocmds.focus_lost)
    autocmd("InsertEnter", "*", autocmds.insert_enter)
    autocmd("InsertLeave", "*", autocmds.insert_leave)
    autocmd("InsertLeave", "*", "set nopaste")
    autocmd("VimEnter", "*", autocmds.vim_enter)
    autocmd("VimResized", "*", 'execute "normal! \\<c-w>="')
    autocmd("WinEnter", "*", autocmds.win_enter)
    autocmd("WinLeave", "*", autocmds.win_leave)
  end

  autocmd(
    "TextYankPost",
    "*",
    "silent! lua vim.highlight.on_yank {higroup='Substitute', on_visual=false, timeout=200}"
  )

  if dvim.format_on_save then
    -- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
    autocmd("BufWritePre", "<buffer>", vim.lsp.buf.format)
  end
end)
