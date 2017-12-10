.data
sum: .space 4
 v:.word 2, 1, 3, 2, 3  # the array
 n:.word 5              # number of elements
 i:.space 4             

.text
main:
 sw $zero,i    # i:=0
 move $t4,$zero
#loop
entry:
 lw $t0,i
 lw $t1,n
 bge $t0,$t1,exit  # if (i>=n) exit
 add $t0,$t0,$t0
 add $t0,$t0,$t0     # $t0=4*i
 lw $t0,v($t0)       # $t0=v[i]
 add $t4,$t4,$t0
 lw $t0,i
 addi $t0,$t0,1
 sw $t0,i            # i++
 j entry
exit:
sw $t4,sum
li $v0,10
syscall