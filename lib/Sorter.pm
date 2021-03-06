use strict;
use warnings;

package Sorter;

sub new {
    my $class = shift;
    my $self = { Values => \() };
    bless $self, $class;
}

sub set_values {
    my $self = shift;
    $self->{Values} = \@_;
}

sub get_values {
    my $self = shift;
    @{$self->{Values}};
}


sub quick_sort {
    my $class = shift;
    my $left = shift; 
    my $right = shift;
    my @values = @_;
    my $i = $left;
    my $j = $right;
    my $pivot = $values[($i+$j)/2];
    
    
    while ($i <= $j) {
	while ($values[$i] < $pivot) { $i++; }
	while ($values[$j] > $pivot) { $j--; }
	
	if ($i > $j) { last; }
	
	my $temp = $values[$i];
	$values[$i] = $values[$j];
	$values[$j] = $temp;
	
	$i++;
	$j--;
    }
    
    if ($left + 1 < $right) {
	@values = Sorter->quick_sort($left, $i-1, @values);
	@values = Sorter->quick_sort($j+1, $right, @values);
    }
    @values
}

sub sort {
    my $self = shift;
    my @values = $self->get_values;
    $self->set_values( Sorter->quick_sort(0, $#values, @values) );
}

1;
