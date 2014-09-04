#!/usr/bin/perl -w
use strict;
use warnings;
use diagnostics;
use filehandle;

my $FH    = FileHandle->new;
my @hosts = <$inputfh>;

foreach my $hosts (@hosts) {
	print $outputfile $hosts."\n";
	print "Testing domain...\n"
        $hosts = qx(host $hosts);
        print $outputfile $hosts."\n";
	sleep (1); #Keep DNS servers happy
}
