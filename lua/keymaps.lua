local keymap = vim.keymap
local keymapmedium = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

----------------------craftdog config---------------------
keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set("n", "te", ":tabedit")
-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")
keymap.set("n", "<leader>e", ":NvimTreeToggle<Return>")

-- Move window
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

---------------------alph2phi config ---------------------

-- Better escape using jk in insert and terminal mode
keymapmedium("i", "jk", "<ESC>", default_opts)
keymapmedium("t", "jk", "<C-\\><C-n>", default_opts)

-- Center search results
keymapmedium("n", "n", "nzz", default_opts)
keymapmedium("n", "N", "Nzz", default_opts)

-- Visual line wraps
keymapmedium("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
keymapmedium("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

-- Better indent
keymapmedium("v", "<", "<gv", default_opts)
keymapmedium("v", ">", ">gv", default_opts)

-- Paste over currently selected text without yanking it
keymapmedium("v", "p", '"_dP', default_opts)

-- Switch buffer
keymapmedium("n", "<S-h>", ":bprevious<CR>", default_opts)
keymapmedium("n", "<S-l>", ":bnext<CR>", default_opts)

-- Cancel search highlighting with ESC
keymapmedium("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Move selected line / block of text in visual mode
keymapmedium("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymapmedium("x", "J", ":move '>+1<CR>gv-gv", default_opts)

-- Resizing panes
keymapmedium("n", "<Left>", ":vertical resize +1<CR>", default_opts)
keymapmedium("n", "<Right>", ":vertical resize -1<CR>", default_opts)
keymapmedium("n", "<Up>", ":resize -1<CR>", default_opts)
keymapmedium("n", "<Down>", ":resize +1<CR>", default_opts)
keymapmedium("n", "<leader>q", ":bd<CR>", default_opts)

--keymapmedium("", "<Space>", "<Nop>", { noremap = true, silent = true })
--g.mapleader = " "
--g.maplocalleader = " "
local builtin = require("telescope.builtin")
--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.api.nvim_set_keymap(
	"n",
	"<Leader>ff",
	":Telescope find_files find_command=rg,--no-ignore,--hidden,--files prompt_prefix=🔍<CR>",
	{}
)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
