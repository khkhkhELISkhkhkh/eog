\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  title = "Christ Is the Saviour of Sinners"
  subsubtitle = "(Showers of Blessing. P. M.)"
  %meter = "P.M."
  poet = "H. Wreford"
  composer = "J. McGranahan"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=70 }
tb = { \tempo 4=35 }

patternAA = { c8 c8 c8 c8 c8 c8 | c4. c4. }
patternAB = { c8 c8 c8 c8 c8 c8 | c4. c4( c8) }
patternAC = { c8 c8 c8 c8 c8 c8 | c4. c8[ c8 c8] }

patternBA = { c8 c8 c8 c8 c8 c8 | c2. }

patternCA = { c4.( c8) c8 c8 | c4. c4. }
patternCB = { c8[ c8] c8 c8 c8 c8 | c4. c4. }
patternCC = { c4 c8 c8 c8 c8 | c4. c4. }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature #'style = #'()
  \time 6/8
  \override Score.MetronomeMark #'transparent = ##t % hide all fermata changes too
  \ta
  \key bes \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { f f f f g a | bes f }
  \changePitch \patternBA { a a a a bes c | bes }
  \changePitch \patternAA { g g g bes a g | f bes }
  \changePitch \patternBA { bes bes bes bes a bes | c }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternCA { d d cis d | bes f } >>
  \changePitch \patternBA { d' c bes bes a bes | c }
  \changePitch \patternAA { d d d c bes g | f bes }
  \changePitch \patternBA { a a a a bes c | bes }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d d d ees ees ees | d d }
  \changePitch \patternBA { f f f ees ees ees | d }
  \changePitch \patternAA { ees ees ees g f ees | d f }
  \changePitch \patternBA { g g g g fis g | a }

  \changePitch \patternCB { bes f f | f e! f | d d }
  \changePitch \patternBA { f ees d f ees d | f }
  \changePitch \patternAB { f f f ees ees ees | d d f }
  \changePitch \patternBA { ees ees ees ees ees ees | d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAB { bes bes bes a bes c | bes bes d }
  \changePitch \patternBA { c c c c g a | bes }
  \changePitch \patternAA { bes bes bes bes bes bes | bes bes }
  \changePitch \patternBA { d d d d d d | ees }

  \changePitch \patternCB { d bes bes bes bes bes | f bes  }
  \changePitch \patternBA { bes f f f f f | a }
  \changePitch \patternAC { aes aes aes g g bes | bes f bes d }
  \changePitch \patternBA { c c c c g a | bes }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternAA { bes bes bes f' f f | bes, bes }
  \changePitch \patternBA { f' f f f f f | bes, }
  \changePitch \patternAA { ees ees ees ees ees ees | bes d }
  \changePitch \patternBA { g g g d d g | f }

  \changePitch \patternCC { bes, bes bes bes bes | bes bes }
  \changePitch \patternBA { bes bes bes d c bes | f' }
  \changePitch \patternAA { bes, bes bes ees ees ees | bes bes }
  \changePitch \patternBA { f' f f f f f | < f bes, > }

}
}

Refrain = \lyricmode {

Sav -- iour of sin -- ners, \bar "."
Sav -- iour of sin -- ners like me, \bar "." \break
Shed -- ding His blood for my ran -- som, \bar "."
This is the Sav -- iour for me. \bar "." \break

}

wordsA = \lyricmode {
\set stanza = "1."

Christ is the Sav -- iour of sin -- ners, \bar "."
Christ is the Sav -- iour for me; \bar "." \break
Long I was chained in sin’s dark -- ness, \bar "."
Now by His grace I am free. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

Now I can say I am par -- doned,
Hap -- py and just -- i -- fied, free,
Saved by my bles -- sed Re -- deem -- er,
This is the Sav -- iour for me.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Just as I was He re -- ceived me,
Seek -- ing from judg -- ment to flee,
Now there is no con -- dem -- na -- tion,
This is the Sav -- iour for me.

}

wordsD = \markuplines {

\line { Loved with a love that’s unchanging, }
\line { Blessed with all blessings so free, }
\line { How shall I tell out His praises! }
\line { This is the Saviour for me. }

}

wordsE = \markuplines {

\line { Soon shall the glory be dawning, }
\line { Then when His face I shall see, }
\line { Sing, O my soul, in thy gladness, }
\line { This is the Saviour for me. }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\noPageBreak

\markup { \fill-line { %\column {
  \hspace #0.1
  \line{ \bold 4 \column { \wordsD } } %\vspace #0.4
  \hspace #0.1
  \line{ \bold 5 \column { \wordsE } } %\vspace #0.4
  \hspace #0.1
} } %}

\pageBreak

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
