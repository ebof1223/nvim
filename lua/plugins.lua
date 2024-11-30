local plugins = {
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.completion.spell,
          null_ls.builtins.hover.dictionary,
          null_ls.builtins.diagnostics.html_lsp,
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Configure HTML-LSP
      lspconfig.html.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        filetypes = { "html", "javascriptreact", "typescriptreact", "javascript.jsx", "typescript.tsx" },
      })
    end,
  },
}

return plugins
