## stienen.R
##
##  Stienen diagram with border correction
##
##  $Revision: 1.8 $ $Date: 2015/10/21 09:06:57 $

stienen <- function(X, ..., bg="grey", border=list(bg=NULL)) {
  Xname <- short.deparse(substitute(X))
  stopifnot(is.ppp(X))
  if(npoints(X) <= 1) {
    do.call(plot,
            resolve.defaults(list(x=Window(X)),
                             list(...),
                             list(main=Xname)))
    return(invisible(NULL))
  }
  d <- nndist(X)
  b <- bdist.points(X)
  Y <- X %mark% d
  gp <- union(graphicsPars("symbols"), "lwd")
  do.call.plotfun(plot.ppp,
                  resolve.defaults(list(x=Y[b >= d],
                                        markscale=1),
                                   list(...),
                                   list(bg=bg),
                                   list(main=Xname)),
                  extrargs=gp)
  if(!identical(border, FALSE)) {
    if(!is.list(border)) border <- list()
    do.call.plotfun(plot.ppp,
                    resolve.defaults(list(x=Y[b < d],
                                          markscale=1,
                                          add=TRUE),
                                     border,
                                     list(...),
                                     list(bg=bg),
                                     list(cols=grey(0.5), lwd=2)),
                  extrargs=gp)
  }
  return(invisible(NULL))
}

stienenSet <- function(X, edge=TRUE) {
  stopifnot(is.ppp(X))
  nnd <- nndist(X)
  if(!edge) {
    ok <- bdist.points(X) >= nnd
    X <- X[ok]
    nnd <- nnd[ok]
  }
  n <- npoints(X)
  if(n == 0) return(emptywindow(Window(X)))
  if(n == 1) return(Window(X))
  rad <- nnd/2
  if(!all(ok <- (rad > 0))) {
    eps <- min(rad[ok], shortside(Frame(X)))/100
    rad <- pmax(rad, eps)
  }
  delta <- 2 * pi * max(rad)/128
  Z <- disc(rad[1], X[1], delta=delta)
  for(i in 2:n) Z <- union.owin(Z, disc(rad[i], X[i], delta=delta))
  return(Z)
}
