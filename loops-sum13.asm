# This problem adds all the numbers from the array nums in all instances unless the number at arr[i] is 13


.globl sum13
.text


#public int sum13(int[] nums, int size) {
#	if (size == 0) {
#		return 0;
#	}
#	
#	int sum = nums[0];
#	
#	for (int i = 0; i < size; i++) {
#		int num = nums[i];
#		
#		if (num != 13) {
#			sum += num;
#		}
#	}
#	
#	return sum;
#}



# t0 = sum = num[0], t1 = num, t2 = 1, t3 = i < size, t4 = addr or next arr, t5 = 13

sum13:

	beq $a1, $0, lenZero

	addi $t0, $0 0
	addi $t1, $0, 0
	addi $t2, $0, 0
	addi $t4, $0, 0
	addi $t5, $0, 13

	For:
		slt $t3, $t2, $a1	      # i < size, 1 = true 0 = false
		beq $t3, $0, forEnd	    # break to done if i >= size
		sll $t4, $t2, 2		      # i << 2 = i * 4
		add $t4, $t4, $a0	      # (i * 4) + Base Address = Next address
		lw $t1, 0($t4)		      # Set num to nums[i]
		beq $t1, $t5, num13	    # break if the value at num is 13
		add $t0, $t0, $t1	      # sum = sum + num
		addi $t2, $t2, 1	      # i++
		j For
	
	
	num13:
		addi $t2, $t2, 2	      # i+=2, i++ plus the for increment
		j For

	lenZero:
		addi $v0, $0, 0		      # returns 0 if the array size is 0
		j done
	
	forEnd:
		addi $v0, $t0, 0        # returns the sum
		j done

	done:
    jr $ra
	
