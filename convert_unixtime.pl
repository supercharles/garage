#!/usr/bin/perl
##
## Script to convert Unix time to Human format:
#
die "usage: $0 unix_time \n" if $ARGV[0] && $ARGV[0] !~ /^\d{10}$/;
print scalar localtime(shift||time), "\n";
