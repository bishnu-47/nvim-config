:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set clipboard=unnamedplus
:set foldmethod=syntax
let mapleader = "," " map leader to comma

call plug#begin()

Plug 'tpope/vim-surround' " Surrounding ysw)
Plug 'preservim/nerdtree' " NerdTree
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'vim-airline/vim-airline' " Status bar
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'neoclide/coc.nvim'  " Auto Completion
Plug 'ryanoasis/vim-devicons' " Developer Icons
Plug 'tc50cal/vim-terminal' " Vim Terminal
Plug 'preservim/tagbar' " Tagbar for code navigation
Plug 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'sheerun/vim-polyglot' " enhanced syntax highlighting
Plug 'Chiel92/vim-autoformat' " syntax formatter
Plug 'wakatime/vim-wakatime' " wakatime to track coding time
Plug 'jiangmiao/auto-pairs' " auto close brackets
Plug 'junegunn/fzf.vim' " fuzzy file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'mattn/emmet-vim' " emmet 
Plug 'SirVer/ultisnips' " snippets
Plug 'honza/vim-snippets' " snippets

set encoding=UTF-8

call plug#end()

" key-maps
" vim-autoformat
noremap <F3> :Autoformat<CR>

" NERDTree
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" vim-snippets
let g:UltiSnipsExpandTrigger="<S-Tab>"
" list all snippets for current filetype
let g:UltiSnipsListSnippets="<c-l>"


" coc
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

" tagbar
nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

:colorscheme PaperColor


" vim-autoformat
let g:python3_host_prog="/usr/bin/python3"

" air-line
let g:airline_powerline_fonts = 1
"
" PLUGIN: FZF
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>f :GFiles<CR>

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" running different programming languages
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac -d ./classes %"
        exec "!time java -cp ./classes %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!brave-browser % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!brave-browser %.html &"
    endif
endfunc
