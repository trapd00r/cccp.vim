" Vim global plugin for adding a colorcolumn at the cursor position
" Maintainer: Magnus Woldrich
"       Date: 2022-04-29

" Toggle a colorcolumn at cursor position.

" Display a visual aid when lining things up
" disable colorcolumn entirely if
" - cursor is in the first column
" - cursor is in the same column that &colorcolumn is set to

if exists("cccp")
    finish
endif
let loaded_cccp = 1

" Configure these to your liking
" nnoremap <silent> <leader>cc :call CCCP()<cr>

function! CCCP()
  let column = col('.')
  if exists(&colorcolumn) || column == 1 || column == &colorcolumn
    setlocal colorcolumn&
  else
    let &colorcolumn = column
    if &cmdheight > 0
      echohl ModeMsg
      echo 'Colorcolumn set at column ' . column
      echohl None
    endif
  endif
endfunction
