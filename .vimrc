set nocompatible              " be iMproved, required
filetype off                  " required
""colorscheme elflord
colorscheme molokai
set t_Co=256
let g:molokai_original=0
syntax on
syntax enable

set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set nobackup
set noswapfile
set history=1000
set undolevels=500
set wildignore=*.swp,*.bak,*.pyc,*.class
set hlsearch
set colorcolumn=80
set noic
set termencoding=utf-8
set fileencodings=utf8,cp1251
set encoding=utf8
set wildmenu
set wildmode=longest,list
"set noautoindent

nmap <silent> <F9> :w<CR>:!%:p<CR>
vmap <silent> <F9> <esc>:w<CR>:!%:p<CR>
imap <silent> <F9> <esc>:w<CR>:!%:p<CR>


" Tab autocompletion
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-space>"
    endif
endfunction

imap <tab> <c-r>=InsertTabWrapper()<cr>
set complete=""
set complete+=.
set complete+=k
set complete+=b
set complete+=t
set completeopt-=preview
set completeopt+=longest


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
""set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim/
call vundle#rc()
" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'
Bundle 'hdima/python-syntax'
Bundle 'klen/python-mode'
Bundle 'rkulla/pydiction'
Bundle 'vim-scripts/molokai'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'Lokaltog/powerline-fonts'
Bundle 'Lokaltog/powerline'

"""""""""""""""'
let python_highlight_all = 1
" b:python_version_2
" :Python2Syntax
"  :Python3Syntax
"
filetype plugin indent on     " required
inoremap <C-Tab> <C-X><C-F>

""let g:pydiction_location = '/home/plushka/.vim/bundle/pydiction/after/pydiction/complete-dict'
let g:pydiction_location = '/home/plushka/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 20

map <C-n> :NERDTreeToggle<CR>
map <C-S-Left> :tabprevious<CR>
map <C-S-Right> :tabnext<CR>
noremap <A-Left> :bp<CR>
noremap <A-Right> :bn<CR>
map <F2> :tabnew<CR>

autocmd  BufNewFile *.sh 0r ~/.vim/headers/sh_header.txt
autocmd bufnewfile *.sh exe "1," . 20 . "g/File Name :.*/s//File Name : " .expand("%:t")
autocmd bufnewfile *.sh exe "1," . 20 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.sh execute "normal ma"
autocmd Bufwritepre,filewritepre *.sh exe "1," . 20 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.sh execute "normal `a"
autocmd bufnewfile *.sh exe "1," . 20 . "g/Created By :.*/s//Created By : " .system("whoami")
"autocmd bufnewfile *.sh exe "1," . 20 . "g/AUTHOR :.*/s//AUTHOR : " .system("whoami")


autocmd BufNewFile *.py 0r ~/.vim/headers/py_header.txt
autocmd bufnewfile *.py exe "1," . 17 . "g/File Name :.*/s//File Name : " .expand("%:t")
autocmd bufnewfile *.py exe "1," . 17 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.py execute "normal ma"
autocmd Bufwritepre,filewritepre *.py exe "1," . 17 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.py execute "normal `a"
autocmd bufnewfile *.py exe "1," . 17 . "g/Created By :.*/s//Created By : " .system("whoami")
"autocmd bufnewfile *.sh exe "1," . 20 . "g/AUTHOR :.*/s//AUTHOR : " .system("whoami")
"
"

set laststatus=2
let g:airline_enabled = 1
set guifont=Liberation\ Mono\ for\ Powerline\ 10
set fillchars+=stl:\ ,stlnc:\
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_enable_fugitive=1
let g:airline_enable_syntastic=1
let g:airline_enable_bufferline=1
""let g:airline_theme='dark'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_linecolumn_prefix = '¶ '
let g:airline_fugitive_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'
let g:airline_section_c = '%t'
let g:Powerline_symbols = 'unicode'

if has("autocmd")
    set viewoptions=cursor,folds
    au BufWinLeave * mkview
    au BufWinEnter * silent loadview
endif

