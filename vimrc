set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"Plugin 'Valloric/YouCompleteMe'

Plugin 'fatih/vim-go'

"Plugin 'brookhong/cscope.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

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

" color darkblue
" color zellner
" color torte
" My Own Vimrc

"" Not Like Vi
set nocompatible " 不要使用vi的键盘模式，而是vim自己的
set nobackup     " 多一个~后缀的备份文件
set nowritebackup
set backspace=indent,eol,start " 不设定此项的话在插入状态无法用退格键
                               " 和 Delete 键删除回车符

"" Set search
set incsearch        " 搜索时，输入的词句的逐字符高亮
set hlsearch         " 让查找到的字符串高亮显示 (：nohlsearch可关闭)
set noignorecase     " 在搜索的时候区分大小写


"" Set the View
set background=light " 设置背景为亮色调
set ruler            " 在编辑过程中，在右下角显示光标位置的状态行
set showmode         " 在屏幕的右下角显示追加模式信息
set showcmd          " 在状态栏显示目前所执行的指令, 未完成的指令片段亦会显示出来
set nonumber         " 不显示行号
set display=lastline " 长行不能完全显示时显示当前屏幕能显示的部分。默认
                     " 值为空，长行不能完全显示时显示 @
set laststatus=1     " 2为显示状态栏 (默认值为 1, 无法显示状态栏)
set nomodeline       " the FreeBSD Security Team 的安全建议
"set nocursorline     " 不显示当前行
set nu
set nocursorcolumn   " 不显示当前列
set t_Co=256

set mouse=a


"" File Type Detection
filetype on          " 侦测文件类型
filetype indent on
filetype plugin on


"" Syntax Highlighting
set shiftwidth=8     " 设置自动缩进量 " 设定 << 和 >> 命令移动时的宽度
set tabstop=8        " 设置<tab>键在vim中的移动量
set showmatch        " 显示配对括号
set matchtime=3      " 匹配括号高亮的时间(单位是十分之一秒)
syntax enable
syntax on            " 让语法高亮显示


"" Set the Smart syntax highlighting
set nocp incsearch
set cindent


"" Set encoding
set encoding=utf-8   " 设置字符编码
set fileencodings=utf-8,cp936  " 文件编码集。vim 启动时会按照它所列出的
                               " 字符编码方式逐一探测即将打开的文件的字
                               " 符编码方式，并且将 fileencoding 设置为
                               " 最终探测到的字符编码方式。因此最好将
                               " Unicode 编码方式放到这个列表的最前面。
" 设定默认解码
set fenc=utf-8                 " XXX 不可以有任何的空格，= 和 , 都不能有空格
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
                               " 设置文件编码检测类型及支持格式


"" 打开文件时光标放在上次关闭时的行上
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exec "normal! g'\"" | endif
endif

"" 绑定复制到系统剪切板快捷键
vmap <c-c> "+y

map <Space> <c-d>
"" 代码折叠
""set foldmethod=indent


"" 显示隐藏字符
" 区分colors中的SpecialKey与这里的，两者含义不同
" SEE MORE: http://usevim.com/2013/02/27/understanding-listchars/
" SEE MORE: :help listchars
set list listchars=tab:\|\ ,trail:·
highlight SpecialKey ctermfg=brown ctermbg=NONE cterm=NONE

" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim... 
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        if (matchstr(expand('%:p'), $CSCOPE_DIR . "/", 0) != "")
            cs add $CSCOPE_DB $CSCOPE_DIR
        endif
    endif

    " show msg when any other cscope db added
    set cscopeverbose  


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif

