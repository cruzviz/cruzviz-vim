set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugins on GitHub repos
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'JulesWang/css.vim'
Plugin 'ap/vim-css-color'
Plugin 'itchyny/lightline.vim'
Plugin 'Glench/Vim-Jinja2-Syntax'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ========================================================================
" NON-PLUGIN STUFF STARTS HERE ::::

" syntax highlighting
syntax on

" get rid of default status line since we are using lightline
set noshowmode

" Emmet settings - only enable it for HTML/CSS in normal mode; Tab expands
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_mode='n'
let g:user_emmet_expandabbr_key = '<Tab>'

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" my own Syntastic shortcuts
nnoremap :lq<CR> :lclose<CR>
nnoremap :ln<CR> :lnext<CR>
nnoremap :lp<CR> :lprevious<CR>

" get lightline plug-in working and in the right colorscheme
set laststatus=2

" basic lightline setup
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

" utf encoding
set encoding=utf-8

" show incomplete commands
set showcmd

" highlight search, search incrementally as characters entered
set hlsearch
set incsearch
" shortcut \<sp> to turn off the old search highlight
nnoremap <leader><space> :nohlsearch<CR>

" convert tabs to 4 spaces - important for *.py files!
set expandtab
set tabstop=4
set shiftwidth=4

" use system clipboard
set clipboard+=unnamed

" let HTML files be wider than usual
autocmd Filetype html set columns=120 colorcolumn=110

" specify correct syntax highlighting for Markdown (.md != modula2)
au Bufread,BufNewFile *.md set filetype=markdown

" visual autocomplete for command menus
set wildmenu

" highlight matching brackets
set showmatch

" line numbers
set number
set numberwidth=4
set cpoptions+=n

" set window size - PEP8 says max line length = 79
set lines=100 columns=90 colorcolumn=80

" set colorscheme
colorscheme desert
highlight ColorColumn guibg=Grey40
highlight LineNr term=underline ctermfg=3 guifg=Grey40 guibg=black
highlight CursorLineNr term=bold ctermfg=7 gui=bold guifg=white

" set font
set guifont=Hack:h12
