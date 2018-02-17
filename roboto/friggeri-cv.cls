% !TEX root = resume.tex
% !TEX program = xelatex
\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage[left=2cm,
                top=2cm,
                right=2cm,
                bottom=2cm]
                {geometry}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}
\definecolor{black}{RGB}{0,0,0}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\colorlet{headercolor}{darkgray}

\colorlet{textcolor}{darkgray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\newfontfamily\bodyfont[Color=textcolor]{Roboto-Regular}
\newfontfamily\thinfont[Color=textcolor]{Roboto-Thin}
\newfontfamily\namefont[Color=textcolor]{Roboto-Thin}
\newfontfamily\subtitlefont[Color=textcolor]{Roboto-Thin}
\newfontfamily\headingfont[Color=headercolor]{Roboto-Medium}
\newfontfamily\positionfont[Color=textcolor]{Roboto-Black}
\newfontfamily\institutefont[Color=headercolor]{Roboto-Regular}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Roboto-Light}

%\setmathfont{XITS Math}

%%%%%%%%%%%%
% Geometry %
%%%%%%%%%%%%

\def\footerheight{1.5}
\def\headerheight{2}
\def\footerleft{2.35} %extra 0.15cm from somewhere
\def\footerright{2.35}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}
\usetikzlibrary{calc}




%footer stuff
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\chead{}

\RequirePackage{tikz}
\usetikzlibrary{calc}

\newcommand{\header}[3]{%
    % \vspace{-3cm}
    {\begin{center}
     \color{headercolor}
      \fontsize{40pt}{72pt}%
      {\namefont #1} \\
      \vspace{1em}
      \fontsize{15pt}{24pt}%
      {\subtitlefont #2}  \\
      \vspace{-0.1cm}
      \fontsize{10pt}{24pt}%
      {\thinfont {#3}}%
    \end{center}
    }

    % \begin{tikzpicture}[remember picture,overlay]
    %   %header
    %   %\node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=\headerheight cm] (box) at (current page.north){};
    %   \node [anchor=north] (name) at ($ (current page.north) + (0,-\headerheight) $) {\shortstack{%
    %     {
    %       \fontsize{40pt}{72pt}\color{headercolor}%
    %       {\thinfont #1} \strut %was bodyfont
    %     }   \\ \\
    %     {
    %       \fontsize{15pt}{24pt}\color{headercolor}%
    %       {\thinfont #2}% \strut
    %     }   \\ \\ \\
    %     {
    %       \fontsize{10pt}{24pt}\color{headercolor}%
    %       {\thinfont {\shortstack{#3}}}%
    %     }
    %   }};
    % \end{tikzpicture}

  \lfoot{#1}
  \rfoot{page \thepage{} of \pageref{LastPage}}
  \vspace{1em}
  % \vspace{-1cm}
  % \vspace{\headerheight cm}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    #1
  }
  {
  {\color{headercolor}\\
  \vspace{-0.25cm}\hrule }}
  \vspace{0.25cm}
  \par\vspace{-\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headercolor} #1}
  \par\vspace{.25\parskip}%
}

\renewcommand{\subsubsection}[2]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headercolor} #2}
  \par\vspace{.25\parskip}%
}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\RequirePackage{ifthen}

\setlength{\tabcolsep}{0pt}

% \renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%\header

    {\textbf {#2}}%
    \hfill%
    #1 \\%
    {\institutefont #3}
    \ifthenelse{\equal{#3}{}}{}{\\}
    {#4}%\vspace{\parsep}
}


%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%



\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=false,
    citecolor=false,
    filecolor=false,
    urlcolor = false}

% A fix for \href{}{} colors not working with fontspec
\makeatletter
\def\HyColor@@@@UseColor#1\@nil{\addfontfeatures{Color=#1}}
\makeatother
