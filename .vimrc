"
" ~/.vimrc - Vim Runtime Control file
"
" These are my handy-dandy settings for Vim
"
" author:    Geoff Franks <gfranks@synacor.com>
" created:   2013-03-04
" updated:   2014-02-04, mkomorowski several formatting changes; autoindent removal
"

"################################################################################
"#### GLOBAL PARAMETERS #########################################################

" Tabs are 4 columns wide, and use the TAB character
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" Disable all sorts of bells and visual alerts
set visualbell t_vb=
set novisualbell

"" Autoindent, I hate you
" filetype indent on
" set autoindent

" Add 'o' formatoption to continue comment characters during F2/F3
set formatoptions=tcqo

" Turn on search term highlighting
set hlsearch

" Print representations of trailing spaces, tabs and end-of-line
" highlight SpecialKey ctermfg=DarkGray
" highlight NonText    ctermfg=DarkGray
" set listchars=tab:>-,trail:.,eol:$
set listchars=tab:»·,trail:·,eol:¶

set list

" Show line numbers in Dark Gray, and use as little space
" as possible on the left margin for displaying them.
set number
set numberwidth=1
"highlight LineNr ctermfg=DarkGray

" Turn on syntax higlighting on a dark background.
" Some update must have turned this off, jrh - 2008-11-28
syntax on
"set background=dark
" ... and don't forget gvim
if has('gui_running')
	color slate
endif

" Turn on modeline processing, so we can force certain vim
" parameters when we don't match an autocommand.
set modeline

" Turn on marker foldmethod, to make things easier
" this does not seem to be supported, turning it back off 
" set foldmethod=marker

" Turn off stupid cindent rules, until I can figure out
" how to customize them to my coding style.
set nocindent

set laststatus=2
set stl=[%n]\ file:%-50F\ %y%r%m\ byte:0x%B%=line:%l:%c/%L\ %p%%

set wildmode=longest,list

"################################################################################
"#### MAPPED COMMANDS ###########################################################

""" ###   Custom Vim Environment Header Helpers   ############################
map <F7> :!/bin/sh -c 'clear && grep ^\"\"\" ~/.vimrc \| sed -e s/^...//'<CR>

"""
""" ###   File Creation / Update Header Helpers   ############################
"""
"""   F3 - insert a header line listing an update
map <F3> oupdated: <Esc>:read !date +"\%Y-\%m-\%d"<CR>kJA, gdf: 
"""   F9 - insert [ gdf, <date> ] at cursor
map <F9> A[ gdf,<esc>:read !date +"\%Y-\%m-\%d"<CR>kJA ]<Esc>o

"""
"""
""" ###   Copy/Paste Support   ###############################################
"""

"""   ;cp - Set for COPY mode (turn off non-printing chars)
map ;cp :set nonumber<CR>:set nolist<CR>

"""   ;pc - Opposite of ;cp - turns on non-printing chars
map ;pc :set number<CR>:set list<CR>

"""
"""
""" ###   Whitespace Management   ############################################
"""

"""   ;n - Collapse successive empty (spaces or tabs allowed) lines
map ;n GoZ<Esc>:g/^[ <Tab>]*$/.,/[^ <Tab>]/-j<CR>Gdd

"""   ;c - Clear leading spaces and enter insertion mode
map ;c :,s/^[ <Tab>]*//g<CR>i

"""   ;fws - Fix trailing whitespace issues
map ;fws :%s/\s\+$//

"################################################################################
"#### AUTOCOMMANDS ##############################################################

" Wrap text in git commit message at 72 characters, as I type.
au BufNewFile,BufRead .git/COMMIT_EDITMSG     set tw=72 wrap

" Catalyst Views should be ft=mason for syntax highlighting
au BufNewFile,BufRead *.tt set ft=mason

" YAML files get special tabbing settings
au BufNewFile,BufRead *.yml  set et ts=2 sw=2 sts=2
au BufNewFile,BufRead *.yaml set et ts=2 sw=2 sts=2

set nocompatible
set bs=2
set history=50
syntax on
set restorescreen
set viminfo='20,\"50
"hi Search term=reverse ctermfg=white ctermbg=blue guifg=white guibg=blue
if filereadable($VIMRUNTIME . "/ftplugin/man.vim")
        source $VIMRUNTIME/ftplugin/man.vim
endif
if filereadable($VIMRUNTIME . "/syntax/man.vim")
        source $VIMRUNTIME/syntax/man.vim
endif

set splitright
cabbrev man Man
