call plug#begin('/home/xifost/.config/nvim/plugged')

" Icons
Plug 'ryanoasis/vim-devicons'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Intellisense
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

" Themes
Plug 'joshdick/onedark.vim'

" Statusline theme
Plug 'itchyny/lightline.vim'

" Fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'

" Git plugin
Plug 'tpope/vim-fugitive'

" Python indent fix
Plug 'Vimjas/vim-python-pep8-indent'

call plug#end()

" To have VIM jump to last position when reopen file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

filetype plugin indent on

set number
set relativenumber
set cursorline
set laststatus=2
set tabstop=4
set shiftwidth=4
set path+=** " pathing all files/directories on the machine
set wildmenu " display menu option with shift/S+shift to select
set hidden
set noshowmode
set mouse=a


let g:lightline = {}
let g:lightline.colorscheme = 'onedark'
let g:lightline.separator = {'left': '', 'right': ''}
let g:lightline.subseparator = {'left': '', 'right': ''}
let g:lightline.component_function = {'filetype': 'MyFiletype', 'fileformat': 'MyFileformat'}
let g:lightline.tab = {'active':['filename', 'modified'], 'inactive': ['filename', 'modified'] }

" Built in :nohls macro key = <C-l>

" To open new tab without entering the command
nnoremap <silent> te :tabedit .<Return>

" To change tabs in vim
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" To close current tab
nnoremap <silent> tc :tabclose<Return> 

" Open buffer
nnoremap <S-b> :b<Space>

" Open finder Alt/Meta + f
nnoremap <M-f> :Files<Return>

" Open shell
nnoremap <F5> :shell<Return>

" Quick command
nnoremap <Esc>q :q<Return>
nnoremap <Esc>w :w<Return>

colorscheme onedark

function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
	return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

luafile ~/.config/nvim/lua/plugins/cmp-config.lua
