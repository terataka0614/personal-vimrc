" ==================================================
" dein.vim取得
" ==================================================
let s:dein_dir = expand('~/.vim/dein')
if !isdirectory(s:dein_dir)
	echo s:dein_dir . " が作成されていないため、処理を中断します。作成後に再度vimを立ち上げてください。"
	finish
endif
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
set backspace=start,eol,indent    " バックスペースキーの動作設定
set fileencoding=utf-8            " 文字エンコード
set fileformat=unix               " 改行エンコード
set tabstop=4                     " タブの空白数
set shiftwidth=4                  " 自動インデントの段階ごとの空白数
set noexpandtab                   " タブ入力自に空白を無効
set number                        " 行数を表示
set nosmartindent                 " 高度な自動インデントの無効化
set autoindent                    " 自動インデントの有効化
set showmatch                     " 対応する括弧のハイライト表示
set list                          " 不可視文字の表示
set listchars=tab:\¦\_,trail:~    " 不可視文字の表示設定
set showcmd                       " コマンドの可視化
