#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use XSFun qw(reverse_list_arr reverse_arr_list reverse_list_list);

{
    my @r1 = reverse_arr_list([qw(a b c d)]);
    is_deeply(\@r1, [qw(d c b a)]);

    my @r2 = reverse_arr_list([]);
    is_deeply(\@r2, []);
}

{
    my @r1 = reverse_list_list(qw(a b c d));
    is_deeply(\@r1, [qw(d c b a)]);

    my @r2 = reverse_list_list();
    is_deeply(\@r2, []);
}

{
    my $r1 = reverse_list_arr(qw(a b c d));
    is_deeply($r1, [qw(d c b a)]);

    my $r2 = reverse_list_arr();
    is_deeply($r2, []);
}

done_testing();
