% -- Encoding UTF-8 without BOM

\ProvidesClass{cv-style}[2015/02/27 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{espanol}{\def\@cv@espanol{}}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage{xcolor,fontspec,parskip,polyglossia,hyperref}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage[left=1.2cm,top=1cm,right=1.2cm,bottom=1cm,nohead,nofoot]{geometry}

%% xcolor
\definecolor{white}{RGB}{255,255,255}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{awesome-emerald}{HTML}{00A388}
\definecolor{awesome-skyblue}{HTML}{0395DE}
\definecolor{awesome-red}{HTML}{DC3522}
\definecolor{awesome-pink}{HTML}{EF4089}
\definecolor{awesome-orange}{HTML}{FF6138}
\definecolor{awesome-nephritis}{HTML}{27AE60}
\definecolor{awesome-concrete}{HTML}{95A5A6}
\definecolor{awesome-darknight}{HTML}{131A28}

\colorlet{awesome}{awesome-darknight}
%% fontspec
\setmainfont[
  Mapping = tex-text,
  Numbers = OldStyle,
  Color = gray,
  BoldFont = tex-gyre-pagella.bold,
  ItalicFont = tex-gyre-pagella.italic,
  BoldItalicFont = tex-gyre-pagella.bold-italic,
  Path = fonts/]{tex-gyre-pagella.regular}
\newfontfamily\firstnamefont{Roboto-Regular}[Path=fonts/]
\newfontfamily\secondnamefont{Roboto-Thin}[Path=fonts/]
\newfontfamily\headingfont{RobotoCondensed-Bold}[Path=fonts/]
\newfontfamily\jobtitlefont{SourceSansPro-BoldIt}[Path=fonts/]
\newfontfamily\mottofont{Lato-LigIta}[Path=fonts/]
\newfontfamily\datefont{Raleway-Thin}[Path=fonts/]

\newcommand{\header}[3]{
  \centering{
	\sffamily
    \fontsize{40pt}{50pt}\color{awesome}\secondnamefont #1
    \fontsize{40pt}{50pt}\color{awesome}\firstnamefont #2
  } \\
  \vspace{5pt}
  \centering{\color{awesome}\fontsize{11pt}{14pt}\mottofont \textit{#3}}
  \noindent\makebox[\linewidth]{\rule{\paperwidth}{0.4pt}}
  \vspace{-15pt}
}

%% parskip
\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{
  {%
    \color{%
      \ifcase\value{colorCounter}%
        awesome\or%
        awesome\or%
        awesome\or%
        awesome\or%
        awesome\else%
        awesome\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

\pagestyle{empty}

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{
  \begin{flushleft}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{
  \end{tabular*}
  \end{flushleft}
}

\newcommand{\jobtitle}[3]{
  {\color{gray}\jobtitlefont #1}\\
  #2\vspace{\parsep}\\
  #3\smallskip
}

\newcommand{\job}[1]{
  \faArrowCircleRight #1\vspace{\parsep}
}

\newcommand{\entry}[4]{
  \scalebox{.8}[1.0]{#1}&\parbox[t]{0.85\textwidth}{
    \textbf{\color{darkgray} #2}
    \hfill{\footnotesize\addfontfeature{Color=lightgray} #3}
    \par\smallskip
    #4\medskip
}}

\newcommand{\sethyphenation}[3][]{%
  \sbox0{\begin{otherlanguage}[#1]{#2}
    \hyphenation{#3}\end{otherlanguage}}}

\newcommand{\CPP}{C\nolinebreak[4]\hspace{-.04em}\raisebox{.20ex}{\footnotesize\bf++}}

\newenvironment{mainframe}{
  \let\oldsection\section
  \renewcommand{\section}[1]{
    {\par\bigskip
      {
        \LARGE\headingfont\color{lightgray}%
        \@sectioncolor ##1
      }
      \color{awesome}\vhrulefill{0.9pt}
      \par\nobreak\addvspace{1ex}
      \par\medskip}
  }
  \begin{minipage}[t]{0.7\textwidth}
    \begin{flushleft}
}{
    \end{flushleft}
  \end{minipage}
  \let\section\oldsection
}

\newenvironment{subframe}{
  \let\oldsection\section
  \renewcommand{\section}[1]{
    {\par\bigskip
      {
        \LARGE\headingfont\color{lightgray}%
        \@sectioncolor ##1
      }
      \color{awesome}\vhrulefill{0.9pt}
      \par\nobreak\addvspace{1ex}
      \par\medskip}
  }
  \begin{flushleft}
}{
  \end{flushleft}
  \let\section\oldsection
}

%% polyglossia, textpos
\newenvironment{sidebar}{
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{gray} ##1\\}
  }
  \begin{minipage}[t]{0.25\textwidth}
  \begin{flushright}
}{
  \end{flushright}
  \end{minipage}
  \let\section\oldsection
}

% Date command
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\textblockorigin{0mm}{5mm} % start everyth
\newcommand{\lastupdated}{\begin{textblock}{60}(160,0)
    \fontsize{8pt}{10pt}\datefont
    Last Updated on
    \today
\end{textblock}}
