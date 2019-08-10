#! /usr/bin/env perl6

grammar SPLIT
{
  regex TOP  { <Char>+ }
  regex Char { (.) $0* }
}

sub MAIN (Str $string, :$quote = '"')
{
  my $result = SPLIT.parse($string);

  $result
    ?? $result<Char>.map({ $quote ~ $_.Str ~ $quote }).join(", ").say
    !! print "\n";
}
