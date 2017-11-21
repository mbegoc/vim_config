" disable vi compatibility
set nocompatible
set t_Co=256

" activate plugins and indent based on file type
filetype plugin indent on
" encoding
set encoding=utf-8

" enable the pathogen plugin (plugins management)
call pathogen#infect()
call pathogen#helptags()
let g:miniBufExplSplitBelow=1  " Put new window below

" basic vim customisation
set nu
set nowrap
" search options
set hlsearch
set incsearch
set ic
" indent options
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set si
set colorcolumn=80
" theme
colorscheme leo

" mouse activation
set mouse=nvcr
" windows navigation easier
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
"removing trailing whitespaces on save
autocmd BufWritePre * :%s/\(\S\)\s\+$/\1/e

" use languages templates
autocmd! BufNewFile * silent! 0r ~/.vim/skel/tmpl.%:e

" shortcut to display the tagbar
nmap <s-F9> :TagbarToggle<CR>
nmap <F9> :NERDTreeToggle<CR>

noremap <Left> :bp<CR>
noremap <Right> :bn<CR>
noremap <Up> :blast<CR>
noremap <Down> :bfirst<CR>
noremap <C-Left> :tabp<CR>
noremap <C-Right> :tabn<CR>
noremap <C-Up> :tablast<CR>
noremap <C-Down> :tabfirst<CR>

" additional filetypes
au BufRead,BufNewFile *.yml     setfiletype yaml
au BufRead,BufNewFile *.yaml     setfiletype yaml

" status bar
" show the status bar all the time
set laststatus=2
" colorize the status bar
hi StatusLine term=reverse ctermbg=0 ctermfg=7
au InsertEnter * hi StatusLine term=none ctermbg=6 ctermfg=6
au InsertLeave * hi StatusLine term=reverse ctermbg=0 ctermfg=7
syntax enable

"hi ColorColumn ctermbg=Gray
hi Normal ctermbg=none
hi LineNr ctermbg=none
hi String ctermbg=none

" autoreload .vimrc on write
au BufWritePost .vimrc source ~/.vimrc

" disable the swapfiles
set noswapfile

set foldmethod=manual

" authorize to hide an unsaved buffer
set hidden
" not sure what it does
set showcmd
" improve the command completion
set wildmenu
set nostartofline
set ruler
set confirm

"nnoremap <C-s> :w<CR>
"nnoremap <S-s> :wa<CR>

" refresh
fun! Refresh()
    set noconfirm
    bufdo e!
    set confirm
endfun

" pull from mercurial and refresh
fun! PulRef()
    !hg pull
    !hg update
    call Refresh()
endfun

:let g:closetag_html_style=1
:source ~/.vim/scripts/closetag.vim
