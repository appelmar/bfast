.onLoad <- function(libname, pkgname) {
  op <- options()
  op.bfast <- list(
    bfast.prefer_matrix_methods = FALSE,
    bfast.use_bfastts_modifications = FALSE,
    strucchange.use_armadillo=FALSE
  )
  toset <- !(names(op.bfast) %in% names(op))
  if(any(toset)) options(op.bfast[toset])
  
  invisible()
}



set_fast_options <- function() {
  env.strucchange = as.environment("package:strucchange")
  
  # check existence of required strucchange functions
  flist = c("monitor.matrix","efp.matrix","mefp.matrix",
            "breakpoints.matrix", "root.matrix.crossprod")
  if (!all(sapply(flist, function(x) exists(x, envir = env.strucchange))))
  {
    stop("failed to set fast options, please reinstall strucchange from http://github.com/appelmar/strucchange")
  }
  return(options(strucchange.use_armadillo=TRUE, 
                 bfast.prefer_matrix_methods=TRUE,
                 bfast.use_bfastts_modifications=TRUE))
}



set_default_options <- function() {
  return(options(strucchange.use_armadillo=FALSE, 
                 bfast.prefer_matrix_methods=FALSE,
                 bfast.use_bfastts_modifications=FALSE))
}