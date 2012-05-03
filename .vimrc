" ~/.vimrc

set nocompatible

" Use pathogen?
" XXX: set this up later

" Change the mapleader from \ to ,
let mapleader=","

" Editing behaviour {{{
set showmode
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set shiftround
set smarttab
set backspace=indent,eol,start
set autoindent
set smartindent
set copyindent
set showmatch
set smartcase
set scrolloff=1
set hlsearch
set incsearch
set gdefault

set nolist

" Use normal regexes in search
nnoremap / /\v
nnoremap / /\v

" Scroll one line at a time with C-j / C-k, in normal mode.
" To scroll by half a page, use the usual CTRL-U / CTRL-D.
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>

" }}}

" Folding rules {{{
"set foldenable                  " enable folding
"set foldcolumn=2                " add a fold column
set foldmethod=marker           " detect triple-{ style fold markers
set foldlevelstart=0            " start out with everything folded

" which commands trigger auto-unfold
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo

" customize the text displayed for a closed fold
set foldtext=MyFoldText()
function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
    return line . ' …' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
" }}}

" Vim behaviour {{{

set hidden
set switchbuf=useopen
set history=1000
set undolevels=1000

set wildmenu
set wildmode=list:full

set title
set visualbell
set noerrorbells

set showcmd

set modelines=5
set modeline

set ttyfast

" }}}

" Highlighting {{{

set synmaxcol=2048

" }}}

" Shortcut mappings {{{

" Swap ` and '
nnoremap ' `
nnoremap ` '

" Remap j and k to act as expected when used on long, wrapped lines
nnoremap j gj
nnoremap k gk

" Complete whole filenames/lines with a quicker shortcut key in insert mode
imap <C-f> <C-x><C-f>
imap <C-l> <C-x><C-l>

" Quick yanking to the end of the line
nmap Y y$

" Jump to matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" Folding
nnoremap <Space> za
vnoremap <Space> za

" Reselect visual block after changing its indent
vnoremap < <gv
vnoremap > >gv

" }}}

" Miscellaneous settings {{{

" Restoring indent after typing hash
" http://vim.wikia.com/wiki/Restoring_indent_after_typing_hash
inoremap # X<BS>#

" Don't let cindent muck with ':' in insert-mode
set cinkeys-=:

" Disable keyword lookup in normal mode.
nmap K <nop>

" Restore cursor position upon reopening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" }}}


set background=light
