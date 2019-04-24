% 161018 	Gary 	edgar [dot] granados [at] itam [dot] mx
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{tesisITAM}[2018/10/16 v1 Template Tesis ITAM]

%%%%%%%%%%%%%%%%%%%%%%%%%% Opcion para declarar tesina %%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\@thesis{TESIS}
\DeclareOption{tesina}{\renewcommand{\@thesis}{TESINA}}

\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{report}%
}

\ProcessOptions\relax

% Clase base: report
\LoadClass{report}

% Paquetes:
\RequirePackage{graphicx}
\RequirePackage{amsopn}
\RequirePackage{fancyhdr}
\RequirePackage{import}
\RequirePackage[utf8]{inputenc}

% babel
\PassOptionsToPackage{english}{babel}
\PassOptionsToPackage{spanish}{babel}
\RequirePackage{babel}

% Cambiar la bibliografía a REFERENCIAS
\addto{\captionsspanish}{\renewcommand{\bibname}{REFERENCIAS}}

\RequirePackage{Aux_files/macros}

% Espaciados 
\parskip 1ex
\renewcommand{\baselinestretch}{1.33}


% Usar numeros romanos en las subsecciones
\renewcommand\thesubsubsection{\Roman{subsubsection}}
\setcounter{secnumdepth}{3}

% Encabezados
\pagestyle{fancy}
\rhead{}
\lhead{\nouppercase{\textsc{\leftmark}}}
\renewcommand{\headrulewidth}{0pt}

\renewcommand{\chaptermark}[1]{\markboth{\textsc{\@chapapp}\ \thechapter:\ #1}{}}
\renewcommand\p@subsubsection{\thesubsection.}


% Definiciones de carrera
\newcommand{\@degree}{\ClassWarningNoLine{tesisITAM}{No Degree specified}}
\newcommand{\degree}[1]{\renewcommand\@degree{#1}}
% \newcommand\thedegree{\@degree}

% Definiciones de asesor
\newcommand{\@advisor}{\ClassWarningNoLine{tesisITAM}{No advisor specified}}
\newcommand{\advisor}[1]{\renewcommand\@advisor{#1}}
% \newcommand\theadvisor{\@advisor}

% Definiciones del año
\newcommand{\@thesisYear}{\ClassWarningNoLine{tesisITAM}{No year specified}}
\newcommand{\thesisYear}[1]{\renewcommand\@thesisYear{#1}}

% Portada 
\InputIfFileExists {Aux_files/portada.tex} {\ClassInfo {tesisITAM} {portada.tex loaded}} {\ClassError{tesisITAM}{Aux_files/portada.tex not found!}}


% Derechos itam
\InputIfFileExists {Aux_files/derechos.tex} {\ClassInfo {tesisITAM} {derechos.tex loaded}} {\ClassError{tesisITAM} {derechos.tex not found!}}

% Resumen(es)
\AtBeginDocument{\@ifpackageloaded{babel}{%
	\renewenvironment{abstract}[1]{%
		\thispagestyle{empty}\bigskip%
		\begin{center}\begin{otherlanguage}{#1}\bf\abstractname\end{otherlanguage}\end{center}
	}{\clearpage}
}{\ClassWarning{tesisITAM} {Babel package was not loaded.}}}

% Referencias 
\newenvironment{chapterquote}[2][2em]{%
	\setlength{\@tempdima}{#1}%
	\def\chapquote@author{#2}%
	\parshape 1 \@tempdima \dimexpr\textwidth-2\@tempdima\relax%
	\itshape}{\par\normalfont\hfill--\ \chapquote@author\hspace*{\@tempdima}\par\bigskip}
