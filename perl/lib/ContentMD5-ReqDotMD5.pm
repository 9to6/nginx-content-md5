# nginx Embedded Perl module for adding a Content-MD5 HTTP header
#
# This perl module, will output an MD5 of a requested file using the
# Content-MD5 HTTP header, by pulling the hex hash from a file of the
# same name with .md5 appended to the end, if it exists.
#
# Author: Matt Martz <matt@sivel.net>
# Link: https://gist.github.com/1870822#file_content_md5_req_dot_md5.pm
# License: http://www.nginx.org/LICENSE

package ContentMD5;
use nginx;

sub handler {
	my $r = shift;
	my $filename = $r->filename;

	return DECLINED unless ( -f $filename && -f "$filename.md5" );

	my $content_length = -s $filename;

	open( MD5FILE, "$filename.md5" ) or return DECLINED;
	my $md5 = <MD5FILE>;
	close( MD5FILE );
	$md5 =~ s/^\s+//;
	$md5 =~ s/\s+$//;
	$md5 =~ s/\ .*//;

	$r->header_out( "Content-MD5", $md5 ) unless ! $md5;

	return DECLINED;
}

1;
__END__
