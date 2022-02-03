
let mapleader = " "
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup      " no backup files
set nowritebackup
set noswapfile

" auto writing
set autowrite     " write when leaving buffer
set autowriteall  " write when leaving buffer (always)
autocmd FocusLost * :wa " write on loss of focus
autocmd BufLeave,FocusLost * silent! wall


" set tab width
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab

" Numbers
set number
set numberwidth=5

" http://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting
set re=1

" combined to ignore case when searching for lower case words: 'inner' - >
" matches 'inner', 'INNER', and 'Inner'
" case sensitive when upper case letter are used: 'Inner' ->
" matches 'Inner' only
set ignorecase
set smartcase
set nofixeol

call plug#begin('~/.vim/bundle')
Plug 'tpope/vim-vividchalk'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-rails'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'kchmck/vim-coffee-script'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'mwise/vim-rspec-focus'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-dispatch'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-bundler'
" Snipets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'
Plug 'tpope/vim-repeat'
call plug#end()

colorscheme vividchalk

set hlsearch
hi Search cterm=NONE ctermfg=black ctermbg=yellow

" Insert a debugger
let @b = 'Obyebug'

" File explorer
let g:netrw_liststyle=3
map <leader>k :Explore<cr>

" NERDTree
map <leader>[ :NERDTreeToggle<CR>
map <leader>{ :NERDTreeFind<CR>

" Set paste, paste from clipboard, unset paste
"map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
set clipboard=unnamedplus
nmap <silent> <leader>p :set paste<CR>"*p:set nopaste<CR>

" Clear highlighting
map <leader>n :noh<CR>

" copy
map <Leader>y :echo system('echo -n '.shellescape(@").' \| npaste')<CR>

" Strip whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
 
autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" vim-rspec-focus
:nnoremap <leader>ff :ToggleFocusTag<CR>
:nnoremap <leader>fa :AddFocusTag<CR>
:nnoremap <leader>fr :RemoveFocusTag<CR>
:nnoremap <leader>fd :ToggleDescribeFocusTag<CR>
:nnoremap <leader>fc :ToggleContextFocusTag<CR>
:nnoremap <leader>fi :ToggleItFocusTag<CR>
:nnoremap <leader>rf :RemoveAllFocusTags<CR>

" copy current file name (relative/absolute) to system clipboard
" relative path (src/foo.txt)
nnoremap <leader>cf :let @+=expand("%")<CR>

" absolute path (/something/src/foo.txt)
nnoremap <leader>cF :let @+=expand("%:p")<CR>

" filename (foo.txt)
nnoremap <leader>ct :let @+=expand("%:t")<CR>

let g:ale_linters = { 'ruby': ['rubocop'], 'eruby': ['ruumba'], 'javascript': ['eslint'] }


" Disable linting highlighting by default
"let g:ale_set_highlights = 1
" Disable linting every time a file is opened
"let g:ale_lint_on_enter = 0
"let g:ale_lint_on_text_changed = "normal"
"let g:ale_lint_on_save = 1

" let g:ale_lint_on_insert_leave

" ALE keybindings
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" FZF key mappings
nnoremap <C-b> :Buffers<CR>
nnoremap <C-g>g :Ag<CR>
nnoremap <C-f>l :BLines<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

set visualbell
let g:snipMate = { 'snippet_version': 1 }
