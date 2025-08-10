local Color = require('colorbuddy').Color
local colors = require('colorbuddy').colors

local M = {}

function M.getColorPalette(palette)
  return require('lcarv-noir.colors.' .. palette)
end

function M.mergeWithPreset(palette, merge)
  return vim.tbl_extend('force', M.getColorPalette(palette), merge)
end

function M.all()
  local c = {}

  for name,_ in pairs(colors) do
    c[name] = colors[name]:to_vim()
  end

  return c;
end

function M.setup(opts)
  opts = opts or {}
  local palette = M.getColorPalette(opts.palette or 'default')

  if opts.colors then
    palette = vim.tbl_deep_extend('force', palette, opts.colors)
  end

  -- Set up background color
  -- Can be configured by preset or end user
  Color.new('background', palette.background)
  Color.new('foreground', palette.foreground)
  Color.new('comment', palette.comment)

  -- Set up primary and secondary flavor colors
  -- Can be configured by preset or end user
  Color.new('primary', palette.primary)
  Color.new('secondary', palette.secondary)

  -- Set up semantic color palette
  -- These are to be used sparingly, but have semantic meaning for things like lsp diagnostics, git diffs, etc.
  -- Can be configured by preset or end user
  Color.new('diagnostic_error', palette.diagnostic_error)
  Color.new('diagnostic_warning', palette.diagnostic_warning)
  Color.new('diagnostic_info', palette.diagnostic_info)
  Color.new('diagnostic_hint', palette.diagnostic_hint)
  Color.new('diff_add', palette.diff_add)
  Color.new('diff_change', palette.diff_change)
  Color.new('diff_delete', palette.diff_delete)

  -- Set up noir grayscale palette
  -- The rest of the theme is based on this grayscale palette, hence the name 'noir' buddy
  -- For dark themes: 0 is light and 9 is dark
  -- For light themes: 0 is dark and 9 is light
  Color.new('noir_0', palette.noir_0)
  Color.new('noir_1', palette.noir_1)
  Color.new('noir_2', palette.noir_2)
  Color.new('noir_3', palette.noir_3)
  Color.new('noir_4', palette.noir_4)
  Color.new('noir_5', palette.noir_5)
  Color.new('noir_6', palette.noir_6)
  Color.new('noir_7', palette.noir_7)
  Color.new('noir_8', palette.noir_8)
  Color.new('noir_9', palette.noir_9)

  -- Pure black and white for text on dynamic background colors
  Color.new('black', '#000000')
  Color.new('white', '#FFFFFF')
end

return M
