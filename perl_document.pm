# Test1: add
sub add {
	my ($param1, $param2) = @_;
	return $param1 + $param2;
}



# Test2: centuryFromYear
=head description
+ Nếu số năm chia hết cho 100 => return int(year/100)
+ Nếu số năm không chia hết cho 100 => return int(year/100) + 1
=cut

use integer;
sub centuryFromYear {
	my ($year) = @_;
	return ($year%100) == 0 ? ($year/100) : (($year/100) + 1);
}



# Test3: checkPalindrome

=head description
+ Kiểm tra xem thứ tự đảo ngược của chuỗi có bằng với chuỗi ban đầu hay không
+ Nếu đúng trả về giá trị true
+ Nếu sai trả về giá trị false

=cut

sub checkPalindrome {
	my ($inputString) = @_;
	return $inputString eq reverse($inputString);
}



# Test4: adjacentElementsProduct

=head description
+ duyệt các phần tử thứ 1 đến thứ length-1 gắn giá trị tích max
+ đưa ra kết luận
=cut
#inputString: [3, 6, -2, -5, 7, 3] 
sub adjacentElementsProduct {
	my ($inputString) = @_;
    
    my $max = 
	my @inputString = @$inputString;
	my $max = $inputString[0]*$inputString[1];
	for($i=1; $i<scalar(@inputString)-2; $i+=1){
		if ($inputString[$i]*$inputString[$i+1] >$max){
			$max = $inputString[$i]*$inputString[$i+1];
		}
	}

	return $max;
}

# Other solution
sub adjacentElementsProduct {
	my (@inputArray) = @_;
	
	my $biggest = $inputArray->[0]*$inputArray->[1];
	for (1..$#inputArray - 1){ # $#inputArray: Lấy chỉ số của mảng
		my $product = $inputArray->[$_] * $inputArray->[$_ + 1]; #$_: chỉ số được duyệt và đây là kiểu để mặc định
		$biggest = $product if $product > $biggest;
	}

	return $biggest;

}



# Test5: shapeArea

=head description
+ Đưa ra số lượng hình vuông với một kích thước cho trước 
+ công thức: return (n-1)**2 + n**2
=cut

sub shapeArea {
	my ($n) = @_;
	return ($n-1)**2 + $n**2;

}


# Test6: makeArrayConsecutive2

=head description
+ cho một dãy chứa các phần tử liên tiếp nhau mỗi phần tử hơn nhau 1 đơn vị, tuy nhiên 
bị thiếu một vài phần tử
+ Tìm số lượng phần tử còn thiếu để nó có thể trở thành  một dãy hợp lệ
+ Giải thuật: tìm số lượng phần từ - số lượng phần tử đang có trong mảng
=cut

use List::Utill qw( min max);
sub makeArrayConsecutive2 {
	my ($statues) = @_;

	my $min = min @$statues;
	my $max = max @$statues;
	my $length = scalar @$statues;

	return ($max - $min + 1) - $length;
}


# Test7: almostlncreasingSequence 

=head
+ Yêu cầu: kiểm tra một dãy có phải dãy tăng hay không với điều kiện là nỏ đi một phần
tử của mảng
+ Thuật toán:
   - duyệt mảng tìm ra vị trí không thỏa mãn tăng trong dãy
   - xóa phần tử đó kiểm tra => đúng => kết luận
   - xóa phần tử sau nó => kiểm tra => kết luận
=cut

sub check {
	my (@process) = @_;
	my $length = scalar(@process);
	foreach $i(0..($length-2)) {
		if ($process[$i] >= $process[$i+1]) {
			return $i;
		}
	}
	return -1;
}

# Chú ý : tại phần nhận giá trị gửi vào sử dụng dấu ($name_value) để có thể chạy đúng
sub almostIncreasingSequence {
	my ($sequence) = @_;
	my @process = @$sequence;
	my $length = scalar @process;
	my $index = check(@process);

	if ($index == -1) {
		return 1;
	}

	my @process1 = (@process[0..($index-1)], @process[($index+1)..($length-1)]);
	if (check(@process1) == -1) {
		return 1;
	}

	my @process2 = (@process[0..$index], @process[($index+2)..($length-1)]);
	if (check(@process2) == -1) {
		return 1;
	}

	return 0;
}



# Test 8: matrixElementsSum

=head
The codeBots decide to move into a new building together
Each of the rooms has a different cost , and some of them are free 
but there's a rumour that all the free rooms are haunted
+ Resolve:
 + duyệt cột thứ nhất nếu khác 0 thì cộng vào tổng nếu gặp 0 break ra khỏi vòng lặp ngay lập tức  
   - duyệt theo thứ tự nếu = 0 cho vào mảng
   - nếu khác 0 cộng vào tổng
 + duyệt tiếp từ cột thứ 2-> hết: tương tự như trường hợp duyệt hàng thứ 0
   
=cut

sub matrixElementsSum {
	my ($matrix) = @_;
	my@matrix_process = @$matrix;

	my $rows = @matrix_process;#get rows of array 
	my $rows1 = @matrix_process[0];
	my $columns = @$rows1;#get columns of array 
	my $sum = 0;

	foreach $i(00..($columns-1)){
		foreach $j(00..($rows-1)){
			if ($matrix_process[$j][$i] != 0){
				$sum += $matrix_process[$j][$i];
			} else {
				last;
			}
		}
	}

	return $sum;
	
}



# Test 9: allLongestStrings

=head description
+ yêu cầu; thực hiện đưa ra danh sách các chuỗi có độ dài lớn nhất trong mảng chứa các chuối
+ thuật toán: 
   - duyệt mảng tìm ra phần tử chuỗi có độ dài lớn nhất
   - duyệt mảng đưa ra các chuỗi có độ dài bằng với độ dài lớn nhất vừa tìm ở trên

=cut

sub allLongestStrings {
	my ($inputArray) = @_;
	my @inputArray_process = @$inputArray;
	my @result = ();
	my $max_length = 0;

	foreach $i(@inputArray_process) {
		$max_length = length($i) > $max_length ? length($i) : $max_length;	
	}

	foreach $i(@inputArray_process) {
		if (length($i) == $max_length) {
			push @result , $i;
		}
	}

	return \@result; #chú ý : ở đây trả về giá trị tham chiếu của mảng kết quả nếu trả về dạng mảng như ở perl kết quả sẽ cho là null
}



# Test 10: commonCharacterCount

=head description
+ yêu cầu: tìm số lượng ký tự mà cả hai đều có
+ thuật toán: 
   - duyệt chuỗi 1 nếu có phần tử nằm trong chuỗi 2 tăng tổng lên 1 và thực hiện xóa phầ tử đó ra khỏi chuỗi 2

=cut

sub commonCharacterCount {
	my ($s1, $s2) = @_;
	my @s1 = split('', $s1);
	my @s2 = split('', $s2);
	my $length = undef
	my $sum = 0;

	foreach $i(@s1) {
		$length = scalar @s2;
		foreach $j(@s2) {
			if ($i eq $s2[$j]) {
				$sum += 1;
				splice(@s2, $j, 1);
				last;
			}
		}
	}

	return $sum;


}



# Test 11: isLucky 

sub isLucky {
	my ($n) = @_;
	my @process = split('', "$n");
	my ($sum1, $sum2) = (0, 0);

	while (@process) {
		$sum1 += shift @process;
		$sum2 += pop @process;
	}

	return $sum1 == $sum2;
}



# Test 12: sortByHeight

=dead description
Some people are standing in a row in a park.There are trees between them which cannot be moved
Your task is to rearrange the people by their heights in a non-descending(giảm giần) order without moving, the trees
+ Remember:

    - sort @list : sặp xếp mảng chứa các chuỗi ký tự dựa theo bảng mã ASCII
    - sort { $a cmp $b } @list : Comparison function 
         + cách hoạt động: Thực hiện đặt giá trị của biển bên trái vào biến $a
         đặt giá trị bên phải vào trong biến $b sau đó thực hiện gọi hàm so sánh
         cmp  =>  + -1  : nếu $a ở bên trái
                  + 1   : nếu biến $b ở bên trái
                  + 0   : no mastter không quan trong vị trí chúng vì là như nhau
	- ví dụ :
			+ thực hiện sắp xếp dãy số nếu chỉ sự dụng sort @list thì sẽ không được kết quả như mong muốn bởi vì
			 => Khi thực hiện so sánh theo dạng mặc định nó sẽ sắp xếp theo kiểu kí tự theo bảng mã ASCII 

			 => Perl does not magically understand that you want to order these values or numbers
			 => No problem thought as we can write a comparison function that will compare the two values as numbers
			   + Các toán tử sử dụng so sánh số: ==, !=, <=>, >, <, >=, <=
			   + Các toán tử sử dụng so sánh chuỗi : It, gt, le, ge, eq, ne, cmp
=cut


=head This under task is talking about connecting perl with sql using DBI
	+  2 API:
		+ 1: Lấy thông tin trong csdl ra và trả về phía cleint
		+ 2; thực hiện lọc đầu vào nhận được từ phía client 
=CUT