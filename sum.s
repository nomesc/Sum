.data
 v:.word 2, 1, 3, 2, 3  # the array
 n:.word 5              # how many elements it has
 i:.space 4             
sum:.space 4
.text
main:
 sw $zero,i             # i:=0
 sw $zero,sum           # sum=0
 lw $t0,n
 beq $t0,$zero,exit     #if there are no elemnts exit
#loop
entry:
 lw $t0,i
 lw $t1,n
 bge $t0,$t1,exit       # if i>=n exit
 add $t0,$t0,$t0
 add $t0,$t0,$t0     
 lw $t0,v($t0)          # $t0:=v[i]
 lw $t1,sum
 add $t1,$t1,$t0
 sw $t1,sum
 lw $t0,i
 addi $t0,$t0,1
 sw $t0,i               # i++
 j entry
exit:
li $v0,10
syscall