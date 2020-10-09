
set guioptions=cMg "console dialogs, do not show menu or toolbar

if has('mac')
    set guifont=Menlo\ Regular:h22
elseif has('win32')
    set guifont=Consolas:h20:cRUSSIAN
else
    set guifont=DejaVu\ Sans\ Mono\ 12
endif

set background=light
color solarized8_high

let g:indent_guides_enable_on_vim_startup=1
