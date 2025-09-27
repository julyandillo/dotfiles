-- =========================
-- Configuración básica Neovim
-- =========================

vim.opt.number = true            -- Mostrar números de línea
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"


-- =========================
-- Gestor de plugins: lazy.nvim
-- =========================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Tema Ayu
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      require("ayu").setup({ mirage = false })
      vim.cmd([[colorscheme ayu-dark]])
    end,
  },

  -- Barra de estado
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup { options = { theme = "ayu_dark" } }
    end,
  },

  -- Buscador
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Sintaxis avanzada
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "bash", "hyprlang" }, -- lenguajes que quieres
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },

})

vim.filetype.add({
    pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
