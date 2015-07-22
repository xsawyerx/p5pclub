#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use XSFun qw(reverse_list_arr reverse_arr_list reverse_list_list);
use Devel::Peek;

my @v1 = qw(a b c d);
{
    my @r1 = do {
        my @values = qw(a b c d);

        reverse_arr_list(\@values);
    };
    is_deeply(\@r1, [qw(d c b a)]);

    my @r2 = do {
        my @values;

        $values[3] = 'd';
        reverse_arr_list(\@values);
    };
    is_deeply(\@r2, ['d', undef, undef, undef]);

    my $r = \(reverse_arr_list(\@v1))[0];
    $$r = 'bleh';
    is(Internals::SvREFCNT($$r), 1);
}

my @v2 = qw(a b c d);
{
    my @r1 = do {
        my @values = qw(a b c d);

        reverse_list_list(@values);
    };
    is_deeply(\@r1, [qw(d c b a)]);

    my @r2 = do {
        my ($a, $b, $c, $d) = qw(a b c d);

        reverse_list_list($a, $b, $c, $d);
    };
    is_deeply(\@r2, [qw(d c b a)]);

    my $r = \(reverse_list_list(@v2))[0];
    $$r = 'bleh';
    is(Internals::SvREFCNT($$r), 1);
}


my @v3 = qw(a b c d);
{
    my $r1 = do {
        my @values = qw(a b c d);

        reverse_list_arr(@values);
    };
    is_deeply($r1, [qw(d c b a)]);

    my $r2 = do {
        my ($a, $b, $c, $d) = qw(a b c d);

        reverse_list_arr($a, $b, $c, $d);
    };
    is_deeply($r2, [qw(d c b a)]);

    my $r3 = reverse_list_arr(@v3);
    $r3->[0] = 'bleh';
    is(Internals::SvREFCNT($r3->[0]), 1);
}

is_deeply(\@v1, [qw(a b c d)]);
is_deeply(\@v2, [qw(a b c d)]);
is_deeply(\@v3, [qw(a b c d)]);

done_testing();
