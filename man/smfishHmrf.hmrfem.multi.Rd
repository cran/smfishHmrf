% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/smfishHmrf.hmrfem.R
\name{smfishHmrf.hmrfem.multi}
\alias{smfishHmrf.hmrfem.multi}
\title{Performs HMRF for multivariate normal distribution. Accepts R data structures as inputs. Accepts a single beta.}
\usage{
smfishHmrf.hmrfem.multi(
  y,
  neighbors,
  numnei,
  blocks,
  beta = 0.5,
  mu,
  sigma,
  err = 1e-07,
  maxit = 50,
  verbose,
  dampFactor = NULL,
  forceDetectDamp = FALSE,
  tolerance = 1e-60
)
}
\arguments{
\item{y}{gene expression matrix}

\item{neighbors}{adjacency matrix between cells}

\item{numnei}{a vector containing number of neighbors per cell}

\item{blocks}{a list of cell colors for deciding the order of cell update}

\item{beta}{the beta to try (smoothness parameter)}

\item{mu}{a 2D matrix (i,j) of cluster mean (initialization)}

\item{sigma}{a 3D matrix (i,j,k) where (i,j) is the covariance of cluster k (initialization)}

\item{err}{the error that is allowed between successive iterations}

\item{maxit}{maximum number of iterations}

\item{verbose}{TRUE or FALSE}

\item{dampFactor}{the dampening factor}

\item{forceDetectDamp}{will auto detect a dampening factor instead of using the specified one}

\item{tolerance}{applicable when forceDetectDamp is set to TRUE}
}
\value{
A list of prob, new mu, new sigma, unnormalized prob after iterations finish
}
\description{
This function performs HMRF \insertCite{Zhu2018}{smfishHmrf} on multivariate normal distributions. Different from other variations, this function accepts R data structures directly as inputs, and only accepts a single value of beta.

This function exists for legacy and compatibility reason. User should use \strong{smfishHmrf.hmrfem.multi.it.min} function.
}
\section{More information}{

Arguments mu and sigma refer to the cluster centroids from running kmeans algorithm.
They serve as initialization of HMRF.
Users should refer to \strong{smfishHmrf.hmrfem.multi.it.min} for more information about function parameters and the requirements.
}

\examples{
    data(seqfishplus)
    s <- seqfishplus
    res<-smfishHmrf.hmrfem.multi(s$y, s$nei, s$numnei, s$blocks, beta=28, 
    mu=s$mu, sigma=s$sigma, err=1e-7, maxit=50, verbose=TRUE, dampFactor=s$damp, 
    tolerance=1e-5)
}
\references{
\insertRef{Zhu2018}{smfishHmrf}
}
