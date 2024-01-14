local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
    {
        "folke/tokyonight.nvim",
        config = function()
            require('user/plugins/tokyonight')
        end
    },
    {
        'glepnir/dashboard-nvim',
        dependencies = { {'nvim-tree/nvim-web-devicons'}},
        config = function()
            require('user/plugins/dashboard-nvim')
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        after = 'folke/tokyonight.nvim',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "nvim-telescope/telescope-live-grep-args.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
        },
        keys = {
            {'<leader>f', "<cmd>lua require('telescope.builtin').find_files()<CR>"},
            {'<leader>F', "<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>"},
            {'<leader>b', "<cmd>lua require('telescope.builtin').buffers()<CR>"},
            {'<leader>g', "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>"},
            {'<leader>h', "<cmd>lua require('telescope.builtin').oldfiles()<CR>"},
            {'<leader>s', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>"},
        },
        setup = function()
            require('user/plugins/telescope')
    end
    },
    {
        "tpope/vim-commentary",
        keys = {
            {'gcap', "my<cmd>norm vip<bar>gc<cr>`y"},
            {'gcc', "<Plug>Commentary"},
        },
    },
    "tpope/vim-surround",
    "tpope/vim-eunuch",
    "tpope/vim-unimpaired",
    "tpope/vim-sleuth",
    "tpope/vim-repeat",
    "christoomey/vim-tmux-navigator",
    "farmergreg/vim-lastplace",
    "nelstrom/vim-visual-star-search",
    "jessarcher/vim-heritage",
    "williamboman/mason.nvim",
    { "whatyouhide/vim-textobj-xmlattr", dependencies = 'kana/vim-textobj-user' },
    {
        "karb94/neoscroll.nvim",
        config = function()
            require('neoscroll').setup()
        end
    },
    {
        'famiu/bufdelete.nvim',
        config = function()
            vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
            vim.keymap.set('n', '<Leader>Q', ':bufdo Bdelete<CR>')
        end
    },
    {
        "AndrewRadev/splitjoin.vim",
        config = function()
            vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
            vim.g.splitjoin_trailing_comma = 1
            vim.g.splitjoin_php_method_chain_full = 1
        end
    },
    {
        "sickill/vim-pasta",
        config = function()
            vim.g.pasta_disabled_filetypes = { 'fugitive' }
        end
    },
    {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('user/plugins/nvim-tree')
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        after = 'tokyonight.nvim',
        requires = {
            'arkav/lualine-lsp-progress',
            'kyazdani42/nvim-web-devicons',
        },
        config = function()
            require('user/plugins/lualine')
        end
    },
    {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        after = 'tokyonight.nvim',
        config = function()
            require('user/plugins/bufferline')
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        setup = function()
            require('user/plugins/indent-blankline')
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                signs = {
                    add = { text = '⢕' },
                    change = { text = '⢕' },
                },
            })
            vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
            vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
            vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
            vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
            vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
            vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
        end
    },
    {
        'tpope/vim-fugitive',
        requires = 'tpope/vim-rhubarb'
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        dependencies = {
            'nvim-treesitter/playground',
            'JoosepAlviste/nvim-ts-context-commentstring',
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            require('user/plugins/treesitter')
        end
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'b0o/schemastore.nvim',
            'jose-elias-alvarez/null-ls.nvim',
            'jayp0521/mason-null-ls.nvim',
        },
        config = function()
            require('user/plugins/lspconfig')
        end
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            -- 'hrsh7th/cmp-copilot',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'onsails/lspkind-nvim',
        },
        config = function()
            require('user/plugins/cmp')
        end
    },
    {
        'phpactor/phpactor',
        ft = 'php',
        run = 'composer install --no-dev --optimize-autoloader',
        config = function()
            vim.keymap.set('n', '<Leader>pm', ':PhpactorContextMenu<CR>')
            vim.keymap.set('n', '<Leader>pn', ':PhpactorClassNew<CR>')
        end
    },
    {
        'vim-test/vim-test',
        config = function()
            require('user/plugins/vim-test')
        end
    },
    {
        'github/copilot.vim',
        config = function()
            vim.cmd([[
    imap <silent><script><expr> <M-CR> copilot#Accept("\<CR>")
    let g:copilot_no_tab_map = v:true
  ]])
        end
    },
    {
        'NvChad/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup({
                user_default_options = {
                    names = false,
                }
            })
        end
    }
})
