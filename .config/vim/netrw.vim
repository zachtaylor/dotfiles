" netrw.vim

let g:netrw_keepdir = 0                          " sync current dir w browsing dir
let g:netrw_banner = 0                           " default banner off (I)
let g:netrw_liststyle = 3                        " tree view (i)
let g:netrw_altv = 1
let g:netrw_winsize = 25                         " 25% width
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'   " default hide hidden

map <C-_> :Lexplore<CR>

augroup ProjectDrawer
  autocmd!
  autocmd TabNew * :Vexplore!
" autocmd VimEnter * :Vexplore

augroup END

function! NetrwMapping()
  nmap <buffer> h -^
  nmap <buffer> l <CR>
  nmap <buffer> ff %:w<CR>:buffer #<CR>
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END
