set nu rnu
set nofoldenable
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
" ---------- change <Leader> key to <space> ------------
nnoremap <SPACE> <Nop>
let mapleader=" "

" ------------- auto indent cursor --------------
set autoindent
set cindent
inoremap { {<CR>}<up><end><CR>
