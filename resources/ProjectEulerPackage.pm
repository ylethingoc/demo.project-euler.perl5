package ProjectEulerPackage;
use Data::Dumper;
use strict;
use warnings FATAL => 'all';


sub multiplesOf3And5 {
    my $repeat = <>;
    foreach (1 .. $repeat) {
        my $max = <>;
        my $sum;
        foreach (1 .. $max - 1) {
            $sum += $_ if ($_ % 5 == 0 or $_ % 3 == 0);
        }
        print "$sum\n";
    }
}

sub evenFibonacciNumbers {
    my $max = <>;
    my $next = 0;
    my $total;
    my @Fib = (1, 2);
    while (1) {
        $next = $Fib[-1] + $Fib[-2];
        last if ($next > $max);
        push(@Fib, $next);
    }
    foreach (@Fib) {
        $total += $_ if ($_ % 2 == 0);
    }
    print $total;
}

sub largestPrimeFactor {
    my $number = 600851475143;
    my $largest_prime_factor = 2;
    while ($largest_prime_factor < $number) {
        if ($number % $largest_prime_factor == 0) {
            $number = $number / $largest_prime_factor;
        }
        else {
            $largest_prime_factor++;
        }
    }
    print $largest_prime_factor;
}

sub largestPalindromeProduct {
    my ($i, $largest_palindrome_product);
    for ($i = 100, $i < 1000, $i++) {
        for (100 .. 1000) {
            $largest_palindrome_product = $_ * $i if ($_ * $i == reverse($_ * $i));
        }
    }
    print $largest_palindrome_product . "\n";
}

=head1 smallestMultiple()

The idea of to solve this problem as below:
- 2N is a divisor of a number so N is also a divisor of this number.
- Try to multiple all numbers from N to 2N
- Try to reduce the multiple number by divided

=cut

sub smallestMultiple {
    my $max = <>;
    my ($min, $term);
    my $i = 2;
    my $smallest_multiple = 1;
    $max % 2 == 0 ? ($min = ($max / 2) + 1) : ($min = ($max + 1) / 2);
    foreach ($min .. $max) {
        $smallest_multiple *= $_;
    }
    while ($i < $min) {
        $term = $smallest_multiple / $i;
        foreach ($min .. $max) {
            if ($term % $_ == 0) {
                $smallest_multiple = $term;
            }
            else {
                $smallest_multiple *= $i;
                $i++;
                last;
            }
        }
    }
    print $smallest_multiple;
}

sub sumSquareDifference {
    my $number = <>;
    my $sum = 0;
    my $square = 0;
    foreach (1 .. $number) {
        $sum += $_ * $_;
        $square += $_;
    }
    print $square * $square - $sum;
}

sub theN1stPrime {
    my $position = <>;
    my $count = 3;
    my $prime = 6;
    my $flag;
    while (1) {
        $flag = 1;
        for (2 .. sqrt($prime)) {
            if ($prime % $_ == 0) {
                $flag = 0;
                last;
            }
        }
        $count++ if ($flag);
        $count != $position ? $prime++ : last;
    }
    print $prime;
}

sub largestProductInASeries {
    my $series = "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450";
    my ($i, $j);
    my ($current_mul, $max_mul) = (1, 1);
    my @arr = split "", $series;
    for ($i = 0; $i < $#arr - 13; $i++) {
        if ($arr[$i] == 0) {
            next;
        }
        else {
            for ($j = $i; $j < $i + 13; $j++) {
                $arr[$j] == 0 ? last : ($current_mul *= $arr[$j]);
            }
            $max_mul = $current_mul > $max_mul ? $current_mul : $max_mul;
            $current_mul = 1
        }
    }
    print $max_mul;
}

sub specialPythagoreanTriplet {
    # a^2 + b^2 = c^2
    # a + b + c = sum
    # (a + b - 1000)^2 = c^2
    # sum*a + sum*b - ab = (sum * sum) / 2
    my $sum = <>;
    my ($a, $b, $c);
    for $a (1 .. $sum) {
        for $b ($a .. $sum) {
            if ($sum * $a + $sum * $b - $a * $b == ($sum * $sum) / 2) {
                $c = $sum - $a - $b;
                print "$a + $b + $c = $sum";
            }
        }
    }
}

sub summationOfPrimes {
    my $max = <>;
    my $sum = 10;
    my $prime = 6;
    my $flag;
    for $prime (6 .. $max) {
        $flag = 1;
        foreach (2 .. sqrt($prime)) {
            if ($prime % $_ == 0) {
                $flag = 0;
                last;
            }
        }
        $sum += $prime if ($flag);
    }
    print $sum;
}

sub largestProductInAGrid {
    my @grid = ('08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08',
        '49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00',
        '81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65',
        '52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91',
        '22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80',
        '24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50',
        '32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70',
        '67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21',
        '24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72',
        '21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95',
        '78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92',
        '16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57',
        '86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58',
        '19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40',
        '04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66',
        '88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69',
        '04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36',
        '20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16',
        '20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54',
        '01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48');
    my ($max, $current_max) = (1, 1);
    my @diagonally;

    # Find the greatest product by grow
    foreach (0 .. 19) {
        my @row = split " ", $grid[$_];
        $current_max = &isTheGreatestProductOfFourAdjacentNumbers(@row);
        $max = $current_max > $max ? $current_max : $max;
        $current_max = 1;
    }

    # Find the greatest product by column
    for my $i (0 .. 19) {
        my @column;
        foreach (0 .. 19) {
            my @row = split " ", $grid[$_];
            push(@column, $row[$i]);
        }
        $current_max = &isTheGreatestProductOfFourAdjacentNumbers(@column);
        $max = $current_max > $max ? $current_max : $max;
        $current_max = 1;
    }

    # Find the greatest product by diagonally
    for my $i (0 .. 16) {
        for my $j (0 .. 16) {
            for my $k (0 .. 19) {
                if ($k + $j < 20) {
                    if ($k + $i < 20) {
                        my @row = split " ", $grid[$k + $j];
                        push(@diagonally, $row[$k + $i]);
                    }
                    else {
                        last;
                    }
                }
            }
            $current_max = &isTheGreatestProductOfFourAdjacentNumbers(@diagonally);
            $max = $current_max > $max ? $current_max : $max;
            $current_max = 1;
            @diagonally = ();
        }
    }

    for my $i (0 .. 16) {
        for my $j (0 .. 16) {
            for my $k (0 .. 19) {
                if ($k + $j < 20) {
                    if ($k + $i < 20) {
                        my @row = split " ", $grid[$k + $j];
                        push(@diagonally, $row[19 - $k - $i - $j]);
                    }
                    else {
                        last;
                    }
                }
            }
            $current_max = &isTheGreatestProductOfFourAdjacentNumbers(@diagonally);
            $max = $current_max > $max ? $current_max : $max;
            $current_max = 1;
            @diagonally = ();
        }
    }
    print $max;
}

sub isTheGreatestProductOfFourAdjacentNumbers {
    my @array = @_;
    my ($max, $current_max) = (1, 1);
    foreach (0 .. $#array - 3) {
        for my $j ($_ .. $_ + 3) {
            $current_max *= $array[$j];
        }
        $max = $current_max > $max ? $current_max : $max;
        $current_max = 1;
    }
    return $max;
}

sub theFirstTriangleNumberToHaveOverNDivisors {
    my $n = <>;
    my $count = 0;
    my $i = 1;
    my $triangle = 0;
    while ($count <= $n) {
        $triangle = ($i * ($i + 1)) / 2;
        $count = 0;
        foreach (1 .. $triangle) {
            if ($triangle % $_ == 0) {
                $count++;
            }
        }
        print "$i $triangle $count\n";
        $i++;
    }
}

1;