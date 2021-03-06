use warnings;
use strict;
use diagnostics;
use FileHandle;

my $inputfile  = FileHandle->new;
my $outputfile = FileHandle->new;
my @hosts;

open($inputfile, "<", "input.txt")
        or die "cannot open < input.txt: $!";
        @hosts = <$inputfile>;
close ($inputfile) || warn "close failed: $!";

qx(touch output.txt);

open($outputfile, ">>", "output.txt")
        or die "cannot open > output.txt: $!";

foreach my $hosts (@hosts) {
	print $outputfile $hosts."\n";
        $hosts = qx(host $hosts);
        print $outputfile $hosts."\n";
}

close ($outputfile) || warn "close failed: $!";
