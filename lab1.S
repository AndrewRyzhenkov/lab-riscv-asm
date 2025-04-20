.data
M:
.word 4
N:
.word 4
matrix:
    .word 1, 2, 3, 4       
    .word 5, 6, 7, 8       
    .word 9, 10, 11, 12    
    .word 13, 14, 15, 16   
res:
    .word 0                


.text
main:
    la a2, M       # Address M (a2)
    la a3, N       # Address N (a3)
    la a4, matrix  # Address array (a4)
    la a5, res     # Address res (a5)
    
    call process

    call print

    li a0, 10  # syscall exit
    ecall


print:
    lw a1, res
    addi a0, x0, 1 # syscall print_int
    ecall


process:
    lw t1, 0(a2) # M
    lw t2, 0(a3) # N
    
    addi t5, x0, 0 # result to save
    addi t3, x0, 0 # i = 0

i_loop:
    bge t3, t1, end_i_loop # i < M
    addi t4, x0, 0 # j = 0
    j j_loop

j_loop:
    bge t4, t2, end_j_loop # i < N

    beq t4, t3, add_res # i == j
    sub t0, t2, t4 # n - j
    addi t0, t0, -1 # n - j - 1
    beq t3, t0, add_res # i == (n - j - 1)

    addi a4, a4, 4 # increment array pointer
    addi t4, t4, 1 # j++
    j j_loop

add_res:
    lw t6, 0(a4) # load element of array in t6

    add t5, t5, t6 # count sum
     
    addi a4, a4, 4 # increment array pointer
    addi t4, t4, 1 # j ++
    j j_loop

end_j_loop:
    addi t3, t3, 1 # i++
    j i_loop

end_i_loop:
    sw t5, 0(a5) # save result
    ret    