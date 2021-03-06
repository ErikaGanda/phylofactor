% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PhyCA.R
\name{PhyCA}
\alias{PhyCA}
\title{Performs Phylogenetic Principal Components Analysis}
\usage{
PhyCA(Data, tree, ncores = NULL, ncomponents = NULL,
  output.edges = F, tol = 1e-05, quiet = T, ...)
}
\arguments{
\item{Data}{Positive-valued data matrix whose rownames are tip-labels in the input \code{tree}.}

\item{tree}{phylo-class object whose tip-labels cover the rownames of Data.}

\item{ncores}{optional number of cores for built-in parallelization. Be cautious of memory - each worker is sent a copy of the dataset and tree, producing ncores+1 copies of the dataset & tree.}

\item{ncomponents}{integer indicating number of phylogenetic components to extract}

\item{output.edges}{Logical, whether or not to output the edges in the input \code{tree} corresponding to phylogenetic components}

\item{tol}{tolerance for compositional matrix. Rounding error in large datasets can lead to columns of compositional data not summing to 1.}

\item{quiet}{Logical, whether or not to quiet warnings.}

\item{...}{additional input arguments to \code{\link{PhyloFactor}}}
}
\value{
PhyCA object containing Data, tree, basis, and edges of the phylogeny corresponding to each split.
}
\description{
Performs Phylogenetic Principal Components Analysis
}
\examples{

library(phylofactor)
data("FTmicrobiome")

Data <- FTmicrobiome$PF$Data
tree <- FTmicrobiome$PF$tree
X <- FTmicrobiome$X
taxonomy <- FTmicrobiome$taxonomy
clr <- function(A) apply(A,MARGIN=2,FUN=function(a) log(a)-mean(log(a)))
pf.heatmap(tree=tree,Data=clr(Data))


phca <- PhyCA(Data,tree,ncomponents = 2)
phcaPAR <- PhyCA(Data,tree,ncomponents=2,ncores=2)

pf.heatmap(tree=tree,Data=clr(Data))
}
