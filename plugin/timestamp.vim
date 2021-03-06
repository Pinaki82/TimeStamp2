" Last Change: 2015-07-29  Wednesday: 08:46:46 PM
" modified by: Pinaki Sekhar Gupta

function! TimeStamp(...)
    let sbegin = ''
    let send = ''
    if a:0 >= 1
        let sbegin = a:1.' '
    endif
    if a:0 >= 2
        let send = ' '.a:2
    endif
    let pattern = sbegin . 'Last Change: .\+' . send
    let pattern = '^\s*' . pattern . '\s*$'
    let row = search(pattern, 'n')
    let now = strftime('%Y-%m-%d  %A: %I:%M:%S %p', localtime())
    let now = sbegin . 'Last Change: ' . now . send
    if row == 0
        call append(0, now)
    else
        call setline(row, now)
    endif
endfunction

au BufWritePre _vimrc,*.vim   call TimeStamp('"')
au BufWritePre *.c,*.h        call TimeStamp('//')
au BufWritePre *.cpp,*.hpp    call TimeStamp('//')
au BufWritePre *.cxx,*.hxx    call TimeStamp('//')
au BufWritePre *.ino,*.pde    call TimeStamp('//')
au BufWritePre *.java         call TimeStamp('//')
au BufWritePre *.rb           call TimeStamp('#')
au BufWritePre *.py           call TimeStamp('#')
au BufWritePre Makefile       call TimeStamp('#')
au BufWritePre *.php          call TimeStamp('<?php //', '?>')
au BufWritePre *.html,*htm    call TimeStamp('<!--', '-->')

