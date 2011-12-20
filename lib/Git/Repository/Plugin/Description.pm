package Git::Repository::Plugin::Description;
use strict;
use warnings;

use Git::Repository::Plugin;
our @ISA      = qw( Git::Repository::Plugin );
sub _keywords { qw( description ) }

our $VERSION = '0.01';

sub description {
    my $self = shift;

    open my $fh, '<', $self->{git_dir} . '/description';
    my $desc = <$fh>;
    close $fh;

    chomp $desc if defined $desc;

	return $desc;
}

1;
__END__

=head1 NAME

Git::Repository::Plugin::Description - Class representing repository description

=head1 SYNOPSIS

  use Git::Repository qw/Description/;

  my $git = Git::Repository->new(git_dir => $gitdir);
  my $descripion = $git->description;
  print "$description\n";

=head1 DESCRIPTION

Git::Repository::Plugin::Description is a class whose instances reprensent description from description file.

=head1 AUTHOR

Wataru Nagasawa E<lt>nagasawa {at} junkapp.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
