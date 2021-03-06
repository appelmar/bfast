\name{setoptions}
\alias{set_fast_options}
\alias{set_default_options}
\title{Set package options with regard to computation times}
\description{
  These functions set options of the bfast and strucchange package to enable faster computations. The fast options should return equal results but require a compatible version of the \code{strucchange} package with matrix-based functions. Notice that only some functions of the \code{bfast} package make use of these options.
}

\usage{
set_fast_options()
set_default_options()
}


\value{
  A list of modified options and their new values.
}

\author{Marius Appel}


\examples{

# run bfastmonitor with different options and compare computation times
library(zoo)
NDVIa <- as.ts(zoo(som$NDVI.a, som$Time))

set_fast_options()
system.time(replicate(100,  bfastmonitor(NDVIa, start = c(2010, 13))))

set_default_options()
system.time(replicate(100,  bfastmonitor(NDVIa, start = c(2010, 13))))

}

