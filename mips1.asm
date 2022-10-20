.data


msg_read_sreg:	.asciiz "Enter three digit octa number \n"
msg_read:	.asciiz "Enter the number \n"
msg_enter_ab:	.asciiz "Enter a and b:\n"
msg_print_sreg:	.asciiz "octa to decimal \n"
.globl newline
newline:	.asciiz "\n"
lastline:	.asciiz ""

	
.text
.globl main
	
main:



  				# printf("Enter initial values for registers $s0-$s7\n");
  li	$v0, 4
  la	$a0, msg_read_sreg
  syscall

  				# printf("Enter the numberf \n");
  li	$v0, 4
  la	$a0, msg_read
  syscall
  				# read values for registers $s0-$s2here
  li	$v0, 5
  syscall
  move	$s0, $v0
  
move $t2,$s0
  
  ########################################  OCT to decimal #######################################
  
      #the octal number is $t2
    li $t6,0 #remainder
    li $t7,0 #final octal number
    li $t8,1 #placeInNumber
    octalToDecimalLoop:
        rem $t6,$t2,10
        div $t2,$t2,10
        mul $t6,$t6,$t8
        add $t7,$t7,$t6
        mul $t8,$t8,8
        bnez $t2,octalToDecimalLoop
    
  #################################################################
 

				# printf("octa to decimal  \n");
  li	$v0, 4
  la	$a0, msg_print_sreg
  syscall
  move $a0, $t7				# print thwe answer
  li	$v0, 1
  syscall
  

exit_from_main:
    ori     $v0, $0, 10     	# System call code 10 for exit
    syscall                 	# Exit the program
end_of_main: