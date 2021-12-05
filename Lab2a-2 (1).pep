;Adrineh Khodaverdian
;CS/IS 165
;Lab2a/ Fibonnaci 

br main

retval: .equate 6 ;#2d
n:     .equate 4  ;#2d
temp: .equate 0 ;#2d

;-------int fib( int n) --------
fib: subsp 2,i ;#temp
     ldwa n,s
     cpwa 0,i ;if n <=0
     brle ret0
     cpwa 2,i  ;if n <=2
     brle ret1
     br else

ret0: ldwa 0,i
      stwa retval,s
      addsp 2,i  ;pop #temp
      ret
ret1: ldwa 1,i
      stwa retval,s
      addsp 2,i  ;pop #temp
      ret  
else: suba 1,i ;n-1
      stwa -4,s ;push #temp
      subsp 4,i   ;#retval #n
      call fib 
      addsp 4,i  ;pop #n #retval 
      ldwa -2,s
      stwa temp,s
      ldwa n,s
      suba 1,i ;n-1
      stwa n,s
      subsp 4,i  ;#retval #n
      call fib
      addsp 4,i  ;pop #n #retval 
      ldwa -2,s
      adda temp,s 
      stwa retval,s 
      addsp 2,i   ;#temp
      ret

;-----------main function----------
val: .equate 2 ;#2d 
num: .equate 0 ;#2d    
rmsg: .ascii "Which fibonacci number? \x00"

main: subsp 4,i  ;#val #num
      stro rmsg,d
      deci num,s 
      ldwa num,s
      stwa -4,s
      subsp 4,i  ;#retval #n
      call fib
      addsp 4,i ; pop #n #retval
      ldwa -2,s
      stwa val,s
      deco val,s
      addsp 4,i ;#num #val

      stop 

      .end
    