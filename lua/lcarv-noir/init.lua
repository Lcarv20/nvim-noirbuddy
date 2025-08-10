local M = {}

function M.setup(opts)
  opts = opts or {}

  vim.api.nvim_command("set termguicolors")
  vim.api.nvim_command(string.format("set background=%s", 'dark'))

  require('lcarv-noir.colors').setup(opts)
  require('lcarv-noir.theme').setup(opts)
  require('lcarv-noir.plugins')
  require('lcarv-noir.languages')

  vim.api.nvim_command(string.format('let g:colors_name = "%s"', 'lcarv-noir'))
end

return M
