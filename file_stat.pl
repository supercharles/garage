#!/usr/bin/perl -w
use strict;
use Time::localtime;
use File::stat;

my %hash;
my $file = $ARGV[0];
my $st = stat($file) or die "No $file: $!";
my @name = 
qw/dev ino mode nlink uid gid rdev size atime mtime ctime blksize blocks /;
for my $index ( 0 .. @$st-1 )
{
    $hash{$name[$index]} = $st->[$index] ;
}
printf "File name: %s\nsize: %d KB\nperm: %04o\natime: %s\nmtime: %s\nctime: %s\n" ,
$file ,
$hash{size} / 1024 ,
$hash{mode} & 07777 , 
ctime($hash{atime}),
ctime($hash{mtime}),
ctime($hash{ctime});
