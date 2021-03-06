#' Convert data frame to JSON
#'
#' Given a data frame, converts each row to a JSON blob and returns the results
#' in a list, to make it easier to iteratively validate data with
#' [check_schema_df()].
#'
#' @param df A data frame
#' @return A list of JSON blobs
#' @export
#' @seealso check_schema
#' @examples
#' dat <- data.frame(
#'   x = c(NA, 1L)
#' )
#' df_to_json_list(dat)
df_to_json_list <- function(df) {
  result <- vector("list", nrow(df))
  for (i in seq_len(nrow(df))) {
    result[[i]] <- jsonlite::toJSON(jsonlite::unbox(df[i, , drop = FALSE]))
  }
  result
}
