################################
#
# Coded By 1337r00t
#
# Instagram : 1337r00t
#
# Twitter : 1337r00t
#
################################
use LWP::UserAgent;
system('cls');
system('color 1e');
print qq(
Enter Emails File:
> );
$email=<STDIN>;
chomp($email);
open (EMAILFILE, "<$email") || die "[-] Can't Open The List Of Emails !";
@EMAILS = <EMAILFILE>;
close EMAILFILE;
foreach $E (@EMAILS) {
chomp $E;
my $ua = LWP::UserAgent->new;
my $url = "https://www.instagram.com/accounts/fb_linked_account/?check_email=$E";
my $req = HTTP::Request->new(GET => $url);
my $resp = $ua->request($req);
if ($resp->content=~ /"email_taken": true/) {
	print "==========================================
		Taken ($E)
==========================================\n";
	open(R0T,">>Taken.txt");
	print R0T "$E\n";
	close(R0T);
	
}
else {
	print "Not Taken ($E)\n";
}}
