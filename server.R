library(shiny)
library(tm)
shinyServer (
  function (input, output)  {
  }
)
###############################
library(shiny)
library(data.table)

setwd("C:\Users\Dan\Desktop\Test")
# 
(englishVCorpus_Con <- VCorpus(DirSource("C:\Users\Dan\Desktop\Test", encoding = "UTF-8"),readerControl = list(language = "en")))

to_ascii <- function(string)
  gsub("[^\x01-\x7F]", "", string) #Hexadecimal range for 127 ASCII character set
removeQuote <- function(string)
  gsub("\"","", string)
removeUnwantedCharacters <- function(string)
  gsub("[#$-?,'\\!]", "", string)

englishVCorpus_Con <- tm_map(englishVCorpus_Con, content_transformer(to_ascii))
englishVCorpus_Con <- tm_map(englishVCorpus_Con, content_transformer(removeQuote))
englishVCorpus_Con <- tm_map(englishVCorpus_Con, content_transformer(tolower))
englishVCorpus_Con <- tm_map(englishVCorpus_Con, content_transformer(removeUnwantedCharacters))

corpusToString <- function(corpus) {
  #initiliaze an empty character string
  character_string_list <- character()
  
  i <- 1
  while( i <= length(corpus)) {
    character_string_list <- c(character_string_list, as.character(corpus[[i]])) 
    i <- i + 1
  }  
  character_string <-paste(character_string_list, collapse=" ")
  
  return (character_string)
}
englishVCorpus_Con <- tm_map(englishVCorpus_Con, content_transformer(to_ascii))
englishVCorpus_Con <- tm_map(englishVCorpus_Con, content_transformer(removeQuote))
englishVCorpus_Con <- tm_map(englishVCorpus_Con, content_transformer(tolower))
englishVCorpus_Con <- tm_map(englishVCorpus_Con, content_transformer(removeUnwantedCharacters))
dtm_con_samp <- DocumentTermMatrix(englishVCorpus_Con)
dtm_con_samp
wordDataFrame <- as.data.frame(as.matrix(dtm_con_samp))

writeCorpus(dtm_con_samp, "C:\Users\Dan\Desktop\Test")

shinyServer(
  function(input, output) {
    ## Various output variables
    #         output$osentenceInputVar <- renderText({
    #             input$submitButton
    #             sentence <- isolate(paste(input$sentenceInputVar))
    #             })
    
    ## Near the VERIFY button: text that tells you that you are unverified, or that you need to double-check your credentials
    output$oWordPredictions <- renderText({
      input$submitButton
      #             if (nchar(input$sentenceInputVar) == 0)
      #                 paste("Please type a sentence, then press 'Submit'")
      #             else if (nchar(input$sentenceInputVar) > 0 &
      #                          nchar(gsub(pattern = '[ !"#$%&???\\(\\)]', replacement = "", input$sentenceInputVar)) == 0)
      #                 paste("Please type more than just spaces", input$sentenceInputVar)
      #             else
      results <- getNextOneWordPossibilities <- function(corpus, phrase) {
        character_string <- corpusToString(corpus)
        
        phrase <- gsub("\\s", "\\\\s", phrase)
        pattern <- paste(phrase, "\\s([^\\s]*)", sep = "")
        #pattern <- paste(phrase, "\\s([^\\s\\S.*..])", sep = "")
        print(pattern)
        # print(character_string)
        matches <- str_match_all(character_string, pattern)
        # print(matches)
        return(matches[[1]][,2])
      }
        )
        )
      ))
    })
  })