-- opts = {}
-- local function open_tab_silent(node)
--   local api = require 'nvim-tree.api'
--   api.node.open.tab(node)
--   vim.cmd.tabprev()
-- end
--
-- vim.keymap.set('n', 'T', open_tab_silent, opts 'Open Tab Silent')
--
---- global
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true, noremap = true, desc = 'Explorer Toggle View' })

-- on_attach
-- vim.keymap.set('n', 'l', edit_or_open, opts 'Edit Or Open')
-- vim.keymap.set('n', 'L', vsplit_preview, opts 'Vsplit Preview')
-- vim.keymap.set('n', 'h', api.tree.close, opts 'Close')
-- vim.keymap.set('n', 'H', api.tree.collapse_all, opts 'Collapse All')
