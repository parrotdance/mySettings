set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'posva/vim-vue'
Plugin 'wincent/command-t'
Plugin 'yonchu/accelerated-smooth-scroll'
Plugin 'mattn/emmet-vim'
call vundle#end()            " required

" ------ NERDTree setting {{{
  autocmd vimenter * NERDTree
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " git plugin
  let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ 'Ignored'   : '☒',
      \ "Unknown"   : "?"
      \ }
" }}}

" ------ Airline setting {{{
  let g:airline_theme='luna' " status bar theme
  let g:airline#extensions#tabline#enabled=1
  let g:airline_section_c='ParroT => %.35F'
" }}}

  filetype plugin indent on    " required

" omni completion setting
  filetype plugin on
  set omnifunc=syntaxcomplete#Complete

" ------ base setting {{{
	au! BufNewFile, BufRead *.wxml setf html
	au! BufNewFile, BufRead *.wxss setf css 

	autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
	autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
  colorscheme molokai
  set ruler                   " 设置标尺
  set showcmd
  syntax on                   " 好像语法高亮是这样设置的 绝了
  set autoindent              " 设置自动缩进
  set hlsearch                " 高亮搜索的关键字
  set background=dark         " 设置背景色为黑色
  set helplang=cn							" 帮助文档语言为中文
  set encoding=utf-8					" 设置默认编码为utf-8
  set number                  " 显示行号
  set numberwidth=5
  set confirm                 " 处理未保存的文件时弹出确认
  filetype indent on          " 特定文件类型缩进
  " highlight StatusLine guifg=SlateBlue guibg=Yellow
  " highlight StatusLineNC guifg=Gray guibg=White
  set showmatch								" 高亮匹配的括号
  set ignorecase							" 搜索时忽略大小写

  " 设置状态栏显示的内容
  " set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")}

  " 统一缩进为2
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2

  " 不换行
  set nowrap
" }}}
" ========== CUSTOM KEY-MAP ===========
  let mapleader = "-"

" In normal mode ↓↓↓↓↓↓↓↓↓↓
  nnoremap ZZ :wq<cr>
  nnoremap <leader>ev :vsplit $MYVIMRC<cr>
  nnoremap <leader>sv :source $MYVIMRC<cr>
  nnoremap <leader>t :NERDTreeToggle<cr>
  nnoremap <leader>bp :!clear; python3 %<cr>
  nnoremap <s-l> >>
  nnoremap <s-h> <<
" buffer control
  nnoremap zj <c-w>j
  nnoremap zk <c-w>k
  nnoremap zh <c-w>h
  nnoremap zl <c-w>l
  nnoremap z, <c-w><
  nnoremap z. <c-w>>
  nnoremap z- <c-w>-
  nnoremap z= <c-w>+

" In visual mode ↓↓↓↓↓↓↓↓↓↓
  vnoremap <s-l> >
  vnoremap <s-h> <

" In insert mode ↓↓↓↓↓↓↓↓↓↓
	inoremap jj <Esc>
	inoremap ( ()<Left>
	inoremap () ()
	inoremap [ []<Left>
	inoremap [] []
	inoremap { {}<Left>
	inoremap {} {}
	inoremap {<cr> {<cr>}<Esc>O
	inoremap ' ''<Left>
	inoremap '' '' 
	inoremap " ""<Left>
	inoremap "" ""
