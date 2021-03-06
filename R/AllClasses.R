#' The TravelSurvey class
#'
#' This class defines the format for the travel survey data
#'
#' @name TravelSurvey
#' @rdname TravelSurvey
#' @aliases TravelSurvey-class
#' @exportClass TravelSurvey
setClass(Class = "TravelSurvey", representation = representation(person = "data.frame", trip = "data.frame"),
         prototype = prototype(person = data.frame(houseID=NA,subjectID=NA,sex=NA,age=NA,location=NA), trip = data.frame(houseID = NA, subjectID = NA, duration = NA, mode = NA)),

         validity = function(object){

             msg <- NULL

             if( length(names(object@person)) == 0 ) msg <- "Person data frame needs columns."
             if( is.null(msg) && !identical( names(object@person), c("houseID","subjectID","sex","age","location"))) msg <- "Person data frame has the wrong column names (or wrong column order.)"

             if( length(names(object@trip)) == 0 ) msg <- "Trip data frame needs columns."
             if( is.null(msg) && !identical( names(object@trip), c("houseID","subjectID","duration","mode"))) msg <- "Trip data frame has the wrong column names (or wrong column order.)"

             if(is.null(msg)) TRUE else msg
         }
)
