" A customized init.vim for neovim (https://neovim.io/)     

" Install:
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" :PlugInstall
" :CocInstall coc-python

set nocompatible              " be iMproved, required
filetype off                  " required

" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'skbolton/embark'                         " Embark colorscheme
Plug 'itchyny/lightline.vim'                   " Lightline statusbar
Plug 'scrooloose/nerdtree'                     " Nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Highlighting Nerdtree  
Plug 'ryanoasis/vim-devicons'                  " Icons for Nerdtree
Plug 'frazrepo/vim-rainbow'                    " Rainbow brackets
Plug 'tpope/vim-surround'                      " Change surrounding marks
Plug 'vim-python/python-syntax'                " Python highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense

" Initialize plugin system
call plug#end()

" => General Settings
set path+=**			        " Searches current directory recursively.
set wildmenu			        " Display all matches when tab complete.
set incsearch                   " Incremental search
set hidden                      " Needed to keep multiple buffers open
set nobackup                    " No auto backups
set noswapfile                  " No swap
set t_Co=256                    " Set if term supports 256 colors.
set number relativenumber       " Display line numbers
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
syntax enable
let g:rehash256 = 1
colorscheme embark              " set colorscheme
set termguicolors               " enable truecolors

" => Status Line
let g:lightline = {
      \ 'colorscheme': 'embark',
      \ }

" Always show statusline
set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=32

" => Open terminal inside Vim (use fish)
map <Leader>tt :vnew term://bash<CR>

" => Mouse Scrolling
set mouse=nicr

" => Splits and Tabbed Files
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

" => Other Stuff
let g:python_highlight_all = 1

au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

