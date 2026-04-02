--[[
  james' neo vim config
]]

vim.g.mapleader = ' '

-- Plugins (built-in vim.pack manager, :h vim.pack)
-- https://github.com/coder/claudecode.nvim
vim.pack.add({
  'https://github.com/coder/claudecode.nvim',
})

local o = vim.opt
o.number = false
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.signcolumn = "yes"
o.winborder = "rounded"

-- Custom rulerformat shows special characters status
vim.opt.rulerformat = '%=%l,%c,%p%% %=%{%&list?"tabs visible":"tabs normal"%}%='

-- Enable list mode to show select whitespace characters
o.list = true
o.listchars = {
  tab = '→\\ ',  -- Shows tabs as '→   ' (double backslash for proper escaping)
  trail = '⍽',   -- Shows trailing spaces as '⍽'
  nbsp = '⍽'      -- Shows non-breaking spaces as '⍽'
}

-- Toggle list (whitespace visibility) with <Leader><Tab>
vim.keymap.set('n', '<Leader><Tab>', function()
  o.list = not o.list:get()
end, { desc = 'Toggle whitespace visibility' })

vim.keymap.set('n', '<Leader>0', ':update<CR> :source<CR>') 

-- Configure COPY and PASTE for the system clipboard
  vim.opt.clipboard = "unnamedplus"
  vim.keymap.set({'n', 'v', 'x'}, '<Leader>d', '"+d') -- cut to system clipboard
  vim.keymap.set({'n', 'v', 'x'}, '<Leader>y', '"+y') -- copy to system clipboard
  vim.keymap.set({'n', 'v', 'x'}, '<Leader>p', '"+p') -- paste from system clipboard
  -- :checkhealth provider
  -- determin your window manager: echo #XDG_SESSION_TYPE
  -- fix for X11: sudo apt install xclip
  -- fix for Wayland: sudo apt install wl-clipboard
