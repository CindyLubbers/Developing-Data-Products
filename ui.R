library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram of the normal distibution with the standard normal distribution as default
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Your own normal distribution!"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("mean",
                  "Mean:",
                  min = -50,
                  max = 50,
                  value = 0),
      sliderInput("stdv",
                  "Standard deviation:",
                  min = 0,
                  max = 10,
                  value = 1)
    ),
    
    
    
    # Show a plot of the generated distribution
    mainPanel(
      h4("Choose your mean and standard deviation of the normal distribution."),
      h4("10000 samples are drawn from both the standard normal distribution and the normal distribution of your choice."),
      h4("As a result your distribution and the standard distribution are plotted, so you can clearly see the differences."),
      plotOutput("distPlot")
    )
  )
))