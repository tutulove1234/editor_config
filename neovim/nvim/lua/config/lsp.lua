require("lspconfig").clangd.setup({
  cmd = {
    "clangd",
    "--header-insertion=never",
    "--compile-commands-dir=.",
    "--query-driver=/usr/bin/g++",
    "--all-scopes-completion",
    "--completion-style=detailed",
    "-std=c++17",
    "-I/usr/include/c++/13",
    "-I/usr/include/x86_64-linux-gnu/c++/13",
    "-I/usr/include/x86_64-linux-gnu",
    "-I/usr/include",
  },
})
