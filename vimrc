" ==================================================
" dein.vim取得
" ==================================================
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repos = s:dein_dir . '/dein.vim'
if !isdirectory(s:dein_repos)
	execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repos
endif

" ==================================================
"  dein.vim初期設定
" ==================================================
set nocompatible                      " vi設定の無効化
set runtimepath+=~/.vim/dein/dein.vim " dein.vimの読み込み

" ==================================================
" プラグイン読み込み
" ==================================================
call dein#begin('~/.vim/dein')        " プラグイン読み込み開始

    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/vimproc.vim', {'build': 'make'})
    call dein#add('Shougo/unite.vim')
    call dein#add('scrooloose/nerdtree')
    call dein#add('michalbachowski/vim-wombat256mod')

call dein#end()                       " プラグイン読み込み終了

if dein#check_install()               " 未インストールのプラグインがあればインストールする
    call dein#install()
endif

" ==================================================
" その他
" ==================================================
syntax on
command NT NERDTree

" ==================================================
" カラースキーム設定
" ==================================================
highlight clear
autocmd ColorScheme * highlight Normal ctermbg=none   " 背景色をなしに変更 (colorschemeよりも先に宣言)
colorscheme wombat256mod
set t_Co=256

" =================================================
" php syntax error
" ==================================================
autocmd FileType php set makeprg=php\ -l\ %
autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif | redraw!

" ==================================================
" vim基本設定
" ==================================================
set number                              " 行番号表示
set tabstop=4                           " タブの半角スペース数
set backspace=indent,eol,start          " バックスペースの有効化
set showcmd                             " 入力中コマンドの表示
set fenc=utf-8                          " 文字コードの指定 [UTF-8]
set fileformats=unix                    " 改行コードの指定 [LF]

