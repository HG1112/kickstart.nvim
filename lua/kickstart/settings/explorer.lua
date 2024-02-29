local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.5 -- You can change this too

local tree_api = require 'nvim-tree'
local tree_view = require 'nvim-tree.view'

tree_api.setup {
  view = {
    float = {
      enable = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * WIDTH_RATIO
        local window_h = screen_h * HEIGHT_RATIO
        local window_w_int = math.floor(window_w)
        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
        return {
          border = 'rounded',
          relative = 'editor',
          row = center_y,
          col = center_x,
          width = window_w_int,
          height = window_h_int,
        }
      end,
    },
    width = function()
      return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    end,
  },
}

vim.api.nvim_create_augroup('NvimTreeResize', {
  clear = true,
})

vim.api.nvim_create_autocmd({ 'VimResized' }, {
  group = 'NvimTreeResize',
  callback = function()
    if tree_view.is_visible() then
      tree_view.close()
      tree_api.open()
    end
  end,
})

local api = require 'nvim-tree.api'
api.events.subscribe(api.events.Event.FileCreated, function(file)
  vim.cmd('edit ' .. file.fname)
end)

local function open_nvim_tree()
  -- open the tree
  require('nvim-tree.api').tree.open()
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })
