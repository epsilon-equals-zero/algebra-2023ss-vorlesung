\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecture-notes}[2022/10/04 Custom LaTeX class]

%% PAGE LAYOUT %%
\LoadClass{scrreprt}

\RequirePackage{geometry}

\KOMAoptions{
  fontsize=11pt,
  paper=a4,
  parskip=half-,
  headsepline,
  chapterprefix=true
}
\setkomafont{disposition}{\bfseries}

\geometry{
  a4paper,
  left=2.5cm,
  right=2.5cm,
  top=2.5cm,
  bottom=2.5cm,
  footskip=1.5cm,
  marginparsep=0.3cm,
  marginpar=1.9cm
}

\AtBeginDocument {
  \hypersetup{
    pdftitle = {\@title}
    pdfauthor = {\@author}
  }
}

%% HEADINGS AND FOOTER %%
\RequirePackage{scrlayer-scrpage}
\RequirePackage{lastpage}

\newcommand\@shortauthor{}
\newcommand{\shortauthor}[1]{\renewcommand{\@shortauthor}{#1}}

\renewcommand{\chaptermark}[1]{\markboth{#1}{}}

\pagestyle{scrheadings}
\clearpairofpagestyles
\ihead{\leftmark}
\chead*{}
\ohead*{\ifcsname @notedate\endcsname \@notedate\fi}
\ifoot*{104.998 Algebra 2023S}
\ofoot*{Seite \thepage \,\,von \pageref*{LastPage}}


%% PACKAGES %%
\RequirePackage[utf8]{inputenc}
\RequirePackage[ngerman]{babel}
\RequirePackage{imakeidx}
\RequirePackage{hyperref}
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{nameref}
\RequirePackage[ngerman]{cleveref}
\RequirePackage{enumitem}
\RequirePackage{tikz}
\RequirePackage{marginnote}
\RequirePackage{tabto}
\RequirePackage[hypcap=false]{caption}
\RequirePackage{float}
\RequirePackage{xcolor}
\RequirePackage{intcalc}

\usetikzlibrary{shapes,arrows,chains,arrows.meta}
\usetikzlibrary[calc]

\crefname{figure}{Abbildung}{Abbildungen}

%% MARGINNOTES %%
\def\g@star@or@long#1{% 
  \@ifstar{\let\l@ngrel@x\global#1}{\def\l@ngrel@x{\long\global}#1}}

\newcommand{\notedate}[1]{
  \ifcsname @notedate\endcsname%
    \marginnote{
      \resizebox{\marginparwidth}{!}{
        \begin{tikzpicture}[align=right]
          \draw (0,0) -- (1.8,0);
          \draw (1.8,0) -- node[left] {\footnotesize \@notedate} (1.8,0.6);
          \draw (1.8,0) -- node[left] {\footnotesize #1} (1.8,-0.6);
        \end{tikzpicture}
      }
    }[-1cm]%
    \g@star@or@long\renew@command\@notedate{#1}
  \else%
    \g@star@or@long\new@command\@notedate{#1}
    \marginnote{
      \resizebox{\marginparwidth}{!}{
        \begin{tikzpicture}[align=right]
          \draw (0,0) -- (1.8,0);
          \draw (1.8,0) -- node[left] {\footnotesize \@notedate} (1.8,-0.6);
        \end{tikzpicture}
      }
    }[-0.5cm]
  \fi%
}

%% MATH SETTINGS %%

\newtheorem{thm}{}[section] % theorem counter

\theoremstyle{definition}
\newtheorem{definition}[thm]{Definition}
\crefname{definition}{Definition}{Definitionen}

\theoremstyle{plain}
\newtheorem{theorem}[thm]{Satz}
\crefname{theorem}{Satz}{Sätze}
\newtheorem{lemma}[thm]{Lemma}
\crefname{lemma}{Lemma}{Lemmata}
\newtheorem{corollary}[thm]{Korollar}
\crefname{corollary}{Korollar}{Korollare}
\newtheorem{proposition}[thm]{Proposition}
\crefname{proposition}{Proposition}{Propositionen}

\theoremstyle{remark}
\newtheorem{example}[thm]{Beispiel}
\crefname{example}{Beispiel}{Beispiele}
\newtheorem{remark}[thm]{Bemerkung}
\crefname{remark}{Bemerkung}{Bemerkungen}


\newcommand{\obda}{o.\,B.\,d.\,A.\ }
\newcommand{\dd}[1]{\frac{\text{d}}{\text{d}#1}}
\newcommand*\diff{\mathop{}\!\mathrm{d}}
\newcommand{\tagline}[1][]{\addtocounter{equation}{1}\tag{\theequation}\ifx\relax#1\relax\else\label{#1}\fi}

\let\vec\mathbf

\DeclareMathOperator{\Sub}{Sub}
\DeclareMathOperator{\End}{End}
\DeclareMathOperator{\Aut}{Aut}
\DeclareMathOperator{\id}{id}
\DeclareMathOperator{\lvl}{lvl}
\DeclareMathOperator{\var}{var}
\DeclareMathOperator{\Gl}{Gl}
\DeclareMathOperator{\Sl}{Sl}
\DeclareMathOperator{\ord}{ord}
\DeclareMathOperator{\sgn}{sgn}
\DeclareMathOperator{\ran}{ran}
\DeclareMathOperator{\chara}{char}
\DeclareMathOperator{\dom}{dom}
\DeclareMathOperator{\ggT}{ggT}

%% OTHER COMMANDS %%

\newcommand{\mailto}[1]{\href{mailto:{#1}}{\texttt{#1}}}

%% enum format %%
\newcommand*{\enumArabicDual}[1]{%
  \expandafter\@enumArabicDual\csname c@#1\endcsname
}
\newcommand*{\@enumArabicDual}[1]{%
  \protect{\@arabic\intcalcDiv{\intcalcInc{#1}}{2}\ifcase\intcalcMod{#1}{2}'\or\fi}%
}
\AddEnumerateCounter{\enumArabicDual}{\@enumArabicDual}{10'}

