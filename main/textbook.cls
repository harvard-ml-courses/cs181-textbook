\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{textbook}

% Use book as the base document class
\LoadClass[10pt,twoside,letterpaper,openany]{book}
% \usepackage[fontsize=9pt]{scrextend}

% Required packages
\RequirePackage[margin=1.5in]{geometry}  % define margins
\RequirePackage{xcolor}                  % for custom colors
\RequirePackage{environ}                 % for custom environments (mlcube, derivation, etc)
\RequirePackage[most]{tcolorbox}         % for styling custom environments
\RequirePackage{hyperref}                % for links and autorefs
\RequirePackage{float}                   % for in-place tables and figures
\RequirePackage{booktabs}                % prettier tables
\RequirePackage{caption}                 % prettier captions
\RequirePackage{amssymb}                 % math symbols
\RequirePackage{bookmark}                % add Title and Contents to PDF bookmarks
\RequirePackage{bm}                      % italic boldface mathmode
\RequirePackage{sansmath}                % sans serif mathmode
\RequirePackage{subcaption}              % sans serif mathmode
% \RequirePackage{longtable}               % breakable tables
\RequirePackage{changepage}               % adjust width
\RequirePackage{times}               % times font
\RequirePackage{wallpaper}

% Package setups
\captionsetup{labelfont=bf, width=.8\linewidth}
\graphicspath{{../figures/figs}}

% Notational shortcuts
\newcommand{\E}{\mathbb{E}}
\newcommand\T{^{\mathrm T}}
\newcommand\cvec[1]{\begin{bmatrix}#1\end{bmatrix}}
\DeclareMathOperator{\Cov}{Cov}
\DeclareMathOperator{\Var}{Var}

% Custom colors
\definecolor{red1}{RGB}{250, 189, 189}
\definecolor{red2}{RGB}{225, 84, 84}
\definecolor{red3}{RGB}{132, 26, 26}
\definecolor{green1}{RGB}{203, 246, 187}
\definecolor{green2}{RGB}{123, 191, 100}
\definecolor{green3}{RGB}{41, 88, 39}
\definecolor{blue1}{RGB}{198, 190, 250}
\definecolor{blue2}{RGB}{102, 83, 224}
\definecolor{blue3}{RGB}{41, 27, 133}

% Custom environments
\newcommand{\@elifempty}[3]{%
  \if\relax\detokenize{#1}\relax%
    #2%
  \else%
    #3%
  \fi%
}

\newcounter{def}[section]
\newcommand*{\defautorefname}{Definition \thesection.\!\!}
\NewEnviron{definition}[1][]{
  \begin{tcolorbox}[
        enhanced,%
        breakable,%
        colback=white,%
        colframe=black,%
        boxrule=0.07em,%
        arc=0.1em,%
        left=0.5em, right=0.5em, top=0.7em, bottom=0.7em,%
      ]%
    \refstepcounter{def}
    \textbf{Definition \thesection.\thedef\@elifempty{#1}{}{ (#1)}:}
    \BODY
  \end{tcolorbox}
}

\newcounter{derivation}[section]
\newcommand*{\derivationautorefname}{Derivation \thesection.\!\!}
\NewEnviron{derivation}[1][]{
  \begin{tcolorbox}[%
        enhanced,%
        breakable,%
        colback=white,%
        colframe=blue3,%
        boxrule=0.07em,%
        arc=0.1em,%
        left=0.5em, right=0.5em, top=0.7em, bottom=0.7em,%
      ]%
    \refstepcounter{derivation}
    \textbf{Derivation \thesection.\thederivation\@elifempty{#1}{}{ (#1)}:}\par
    \BODY
  \end{tcolorbox}
}

\newcounter{example}[section]
\newcommand*{\exampleautorefname}{Example \thesection.\!\!}
\NewEnviron{example}[1][]{
  \begin{tcolorbox}[%
        enhanced,%
        breakable,%
        colback=white,%
        colframe=blue2,%
        boxrule=0.07em,%
        arc=0.1em,%
        left=0.5em, right=0.5em, top=0.7em, bottom=0.7em,%
      ]%
    \refstepcounter{example}
    \textbf{Example \thesection.\theexample\@elifempty{#1}{}{ (#1)}:}\par
    \BODY
  \end{tcolorbox}
}

\NewEnviron{mlcube}[4][]{
  \begin{tcolorbox}[
      enhanced,%
      breakable,%
      colback=white,%
      colframe=green2,%
      boxrule=0.07em,%
      arc=0.1em,%
      left=0.5em, right=0.5em, top=0.7em, bottom=0.7em,%
      enlargepage flexible=2\baselineskip,
    ]%
    \textbf{ML Cube\@elifempty{#1}{}{ (#1)}:}\par
    \BODY
    
    \vspace{0.5em}
    \begin{center}
      \begin{tabular}{ccc}
      \toprule
      \textit{\textbf{Domain}}                       & \textit{\textbf{Training}}                     & \textit{\textbf{Probabalistic}}                \\ \hline \\[-0.9em]
      \begin{tabular}[c]{@{}c@{}}#2\end{tabular}     & \begin{tabular}[c]{@{}c@{}}#3\end{tabular}     & \begin{tabular}[c]{@{}c@{}}#4\end{tabular}     \\ \hline   
      \end{tabular}
    \end{center}  
  \end{tcolorbox}%
}

\NewEnviron{warning}{
  \begin{tcolorbox}[
    enhanced,%
    breakable,%
    colback=white,%
    colframe=red2,%
    boxrule=0.07em,%
    arc=0.1em,%
    left=0.5em, right=0.5em, top=0.5em, bottom=0.5em,
    ]%
    \small\textit{Note:} \BODY%
  \end{tcolorbox}%
}
