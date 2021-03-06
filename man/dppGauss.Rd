\name{dppGauss}
\alias{dppGauss}
\title{Gaussian Determinantal Point Process Model}
\description{
  Function generating an instance
  of the Gaussian determinantal point process model.
}
\usage{dppGauss(\dots)}
\arguments{
  \item{\dots}{arguments of the form \code{tag=value} specifying the
    parameters. See Details.} 
}
\details{
  The Gaussian DPP is defined in (Lavancier, \Moller and Rubak, 2015)
  The possible parameters are:
  \itemize{
    \item the intensity \code{lambda} as a positive numeric
    \item the scale parameter \code{alpha} as a positive numeric
    \item the dimension \code{d} as a positive integer
  }
}
\value{An object of class \code{"detpointprocfamily"}.}
\author{
  \adrian
  
  
  \rolf
  
  and \ege
  
}
\references{
  Lavancier, F. \Moller, J. and Rubak, E. (2015)
  Determinantal point process models and statistical inference
  \emph{Journal of the Royal Statistical Society, Series B}
  \bold{77}, 853--977.
}
\examples{
m <- dppGauss(lambda=100, alpha=.05, d=2)
}
\seealso{
  \code{\link{dppBessel}},
  \code{\link{dppCauchy}},
  \code{\link{dppMatern}},
  \code{\link{dppPowerExp}}
}

