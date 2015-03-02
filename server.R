library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    # set.seed(123)
    # draw 10000 samples from the normal distribution of choice
    x <- rnorm(10000, mean = input$mean, sd = input$stdv)
    x <- as.data.frame(cbind(x,rep("your choice", 1000)))
    colnames(x) <- c("ranval", "type")
    
    # draw 10000 samples from the standard normal distribution
    y <- rnorm(10000)
    y <- as.data.frame(cbind(y,rep("standard normal", 1000) ))
    colnames(y) <- c("ranval", "type")
    
    # put the two dataframes together
    xy <- rbind(x,y)
    xy$ranval <- as.numeric(paste(xy$ranval))
    
    # draw the histogram of both a sample of the standard normal distribution and the normal distribution of choice
    qplot(data=xy, ranval, fill=type, position = 'dodge', xlab = 'random number from normal distibution', main= 'Histogram of standard and your choice of normal distribution')
    
  })
})