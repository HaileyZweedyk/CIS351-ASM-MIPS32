# Simple function that takes inputs A and B and returns the number closest to 10, if they're the same distance it will return 0

.globl close10
.text

# a0 = a, a1 = b, t0 = aTen, t1 = bTen, t2 = T/F, v0 = return

close10:
	addi $t0, $0, 0
	addi $t1, $0, 0
	
	# get aTen and bTen
	addi $t0, $a0, -10		# a - 10
	addi $t1, $a1, -10		# b - 10
	
	abs $t0, $t0			# abs(a - 10)
	abs $t1, $t1			# abs(b - 10)
	
	beq $t0, $t1, equal		# breaks to equal if aTen == bTen
	slt $t2, $t0, $t1		# sets t2 to 1 if aTen < bTen, 0 if bTen < aTen
	beq $t2, 1, aCloser
	addi $v0, $a1, 0
	j end
	
equal:
	addi $v0, $0, 0
	j end
	
aCloser:
	addi $v0, $a0, 0
	j end

end:
	jr $ra
