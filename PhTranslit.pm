package Lingua::RU::PhTranslit;
                                                                                            
=head1 NAME

Lingua::RU::PhTranslit -  Phonetic correct translit (for Cyrillic)

=head1 SYNOPSIS

  use Lingua::RU::PhTranslit

=head1 DESCRIPTION

The folowing functions include in this package

  koi2phtr, phtr2koi
  koi2win, win2koi
  koi2alt, alt2koi

koi - KOI8-R
win - Windows-1251, CP1251
alt - CP866

=head1 History

    0.1  ()		- initial release;
    0.2  (2001-10-12) 	- �� ���������� � koi2win;
    0.3  (2003-03-28)	- missing test added;

=cut

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw( &koi2phtr &phtr2koi &koi2win &win2koi &koi2alt &alt2koi);
#@EXPORT_OK = qw();
$VERSION = '0.3';

sub koi2phtr
    { ($_)=@_;

#
# koi8-r to Phonetic correct translit
#

s/��/S\'h/; s/��/s\'h/; s/��/S\'H/;
s/�/Sh/g; s/�/sh/g;

s/���/Sc\'h/; s/���/sc\'h/; s/���/SC\'H/;
s/�/Sch/g; s/�/sch/g;

s/��/C\'h/; s/��/c\'h/; s/��/C\'H/;
s/�/Ch/g; s/�/ch/g;

s/��/J\'a/; s/��/j\'a/; s/��/J\'A/;
s/�/Ja/g; s/�/ja/g;

s/��/J\'o/; s/��/j\'o/; s/��/J\'O/;
s/�/Jo/g; s/�/jo/g;

s/��/J\'u/; s/��/j\'u/; s/��/J\'U/;
s/�/Ju/g; s/�/ju/g;

s/�/E\'/g; s/�/e\'/g;
s/�/E/g; s/�/e/g;

s/��/Z\'h/g; s/��/z\'h/g; s/��/Z\'H/g;
s/�/Zh/g; s/�/zh/g;

tr/
������������������������������������������������/
abvgdzijklmnoprstufhc\"y\'ABVGDZIJKLMNOPRSTUFHC\"Y\'/;

return $_;

}

sub phtr2koi
    { ($_)=@_;

#
# Phonetic correct translit to koi8-r
#

s/E\'/�/g; s/e\'/�/g;
s/E/�/g; s/e/�/g;

s/Jo/�/g; s/jo/�/g;
s/J\'o/��/g; s/j\'o/��/g; s/J\'O/��/g;

s/Sch/�/g; s/sch/�/g;
s/Sc\'h/���/g; s/sc\'h/���/g; s/SC\'H/���/g;

s/Ch/�/g; s/ch/�/g;
s/C\'h/��/g; s/c\'h/��/g; s/C\'H/��/g;

s/Sh/�/g; s/sh/�/g;
s/S\'h/��/g; s/s\'h/��/g; s/S\'H/��/g;

s/Ja/�/g; s/ja/�/g;
s/J\'a/��/g; s/j\'a/��/g; s/J\'A/��/g;

s/Zh/�/g; s/zh/�/g;
s/Z\'h/��/g; s/z\'h/��/g; s/Z\'H/��/g;

s/Ju/�/g; s/ju/�/g;
s/J\'u/��/g; s/j\'u/��/g; s/J\'U/��/g;


tr/
abvgdzijklmnoprstufhc\"y\'ABVGDZIJKLMNOPRSTUFHC\"Y\'/
������������������������������������������������/;

return $_;

}

#
# Next functions added for Windows users
# Each function translate "\n" to "\n" - this in no bug.

sub koi2win
    { ($_)=@_;

tr/
�������������������������������������ţ��������������������������/
�����Ũ����������������������������������������������������������/;
return $_;
    }

sub win2koi
    { ($_)=@_;

tr/
�����Ũ����������������������������������������������������������/
�������������������������������������ţ��������������������������/;
return $_;

    }

sub alt2koi
    { ($_)=@_;

tr/
��������������������������������������������������������������������������������������������������������������������������������/
�����������������������������������������������Ѐ��������������������������������������������������������������ъ���������������/;
return $_;

    }

sub koi2alt
    { ($_)=@_;

tr/
�����������������������������������������������Ѐ��������������������������������������������������������������ъ���������������/
��������������������������������������������������������������������������������������������������������������������������������/;
return $_;

    }

1;

__END__

=head1 AUTHOR

CPAN -at- Basov -dot- net<Mikhail V. Basov> 

=head1 SEE ALSO

perl(1).

=cut
