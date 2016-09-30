library (shiny)
shinyUI (pageWithSidebar (
  headerPanel ("Data science FTW!" ),
  sidebarPanel (
    h3 ('Sidebar text')
  ),
  mainPanel (
    h3(' Main  Paneltext')
  )
))
###############################
## Sample code https://github.com/polong-lin/text_prediction-shinyApp 
## Sample functioning shiny app https://rpubs.com/jhedbergfd3s/74960 
## The quickest way is to send (or put on github or gist or dropbox or whatever) someone the app directory and they can then call runApp
library(shiny)
# Read in data Note: Not sure how to upload data????
shinyUI(fluidPage(
  titlePanel("Text Prediction App"),
  fluidRow("Note: Please allow 10-20 seconds for the app to load."),
  hr(),
  fluidRow("In the space below:"),
  fluidRow("1. Type a sentence"),
  fluidRow("2. Press Submit"), 
  fluidRow("Wait a few seconds... and then you will see a few words that are likely to come next!"),
  hr(),
  textInput('sentenceInputVar', 'Type here:'),
  actionButton('submitButton', 'Submit'),
  fluidRow('(Example: "I want to go" or "She used to")'),
  verbatimTextOutput("oWordPredictions"),
  
  hr(),
  
  fluidRow("This app uses a very simplified version of the Kneser-Ney smoothing algorithm."),
  hr()
)
)