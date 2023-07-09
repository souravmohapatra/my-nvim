-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  -------------------------------------------------------------------------
  use 'wbthomason/packer.nvim'

  -- A fuzzy finder
  -------------------------------------------------------------------------
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }


  -- A theme
  -------------------------------------------------------------------------
  use ({ 
	  'rose-pine/neovim', as = 'rose-pine'
  })

  -- Treesitter for language specific highlighting
  -------------------------------------------------------------------------
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- Nerd tree and associated plugins
  -------------------------------------------------------------------------
  use ({
	  'preservim/nerdtree',
	  -- configure NerdTree to start automatically on starting vim and put cursor in the other window 
	  config = function()
		  vim.cmd [[autocmd VimEnter * NERDTree | wincmd p]]
		  vim.cmd [[autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif]]
	  end
      })
  use ('Xuyuanp/nerdtree-git-plugin')
  use ({
	  'ryanoasis/vim-devicons',
	  config = function()
		  vim.cmd('set encoding=UTF-8')
	  end
      })
  use ('tiagofumo/vim-nerdtree-syntax-highlight')

  -- Vim + tmux navigator
  -------------------------------------------------------------------------
  use ('christoomey/vim-tmux-navigator')

  -- Vim fugitive - a git thingy
  -------------------------------------------------------------------------
  use ('tpope/vim-fugitive')
end)

