#line 1 "inc/Module/Install/WriteAll.pm - /opt/perl-5.8.3/lib/site_perl/5.8.3/Module/Install/WriteAll.pm"
# $File: //depot/cpan/Module-Install/lib/Module/Install/WriteAll.pm $ $Author: autrijus $
# $Revision: #3 $ $Change: 1885 $ $DateTime: 2004/03/11 05:55:27 $ vim: expandtab shiftwidth=4

package Module::Install::WriteAll;
use Module::Install::Base; @ISA = qw(Module::Install::Base);

sub WriteAll {
    my $self = shift;
    my %args = (
        meta => 1,
        sign => 0,
        inline => 0,
        check_nmake => 1,
        @_
    );

    $self->sign(1) if $args{sign};
    $self->Meta->write if $args{meta};
    $self->admin->WriteAll(%args) if $self->is_admin;

    if ($0 =~ /Build.PL$/i) {
	$self->Build->write;
    }
    else {
	$self->check_nmake if $args{check_nmake};
        $self->makemaker_args( PL_FILES => {} )
            unless $self->makemaker_args->{'PL_FILES'};

        if ($args{inline}) {
            $self->Inline->write;
        }
        else {
            $self->Makefile->write;
        }
    }
}

1;
