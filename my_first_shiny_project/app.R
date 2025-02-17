library(shiny)
library(shinyWidgets)
library(dslabs)
library(tidyverse)
library(plotly)


data("us_contagious_diseases")
disease <- us_contagious_diseases
disease <- mutate(disease, percapita = count/(population/100000)) %>% 
  pivot_longer(cols = c(count, percapita), 
               names_to = "data", values_to = "value")

ui <- fluidPage(
  
  titlePanel("Diseases in the US 1928-2011"),
  sidebarLayout(
    sidebarPanel(
      # inputs
      # selectizeInput()所有状态名称创建一个下拉菜单
      selectizeInput("stateInput", "State",
                     choices = unique(disease$state),  
                     selected="Virginia", multiple =FALSE), 
      # checkboxGroupInput()来创建复选框
      checkboxGroupInput("diseaseInput", "Disease",
                         choices = c("Hepatitis A",
                                     "Measles",
                                     "Mumps", "Pertussis",
                                     "Polio", "Rubella", 
                                     "Smallpox"),
                         selected = c("Hepatitis A", "Polio")),
      # sliderInput()创建可以滑动的刻度条
      sliderInput("yearInput", "Year", min=1928, max=2011, 
                  value=c(1928, 2011), sep=""),
      radioGroupButtons("dataInput", "Data",
                        choiceNames = list("Count", "Per capita"),
                        choiceValues = list("count", "percapita"))
    ),  
    
    mainPanel(
      plotOutput("diseaseplot"),
      br(), br(),
      verbatimTextOutput("stats"), 
      br(), br(),
      plotlyOutput("distplot")
    ) 
  )   
)   

server <- function(input, output) {
  
  #读取变量，过滤数据文件
  d <- reactive({
    disease %>%
      filter(state == input$stateInput,
             disease %in% input$diseaseInput,
             year >= input$yearInput[1],
             year <= input$yearInput[2],
             data == input$dataInput)
  }) 
  
  
  #输出文件：折线图
  output$diseaseplot <- renderPlot({
    
    ggplot(d(), aes(x=year, y = value, color=disease)) +
      geom_line() + 
      theme_bw() +
      xlab("Year") +
      ylab(input$dataInput) +
      ggtitle("Cases over time")
  })
  
  #输出文件：数据
  output$stats <- renderPrint({
    
    aggregate(value ~ disease, data = d(), sum)
    
  })
  
  #输出文件：箱线图
  output$distplot <- renderPlotly({
    
    box <- plot_ly(d(), y = ~value,
                   color = ~disease, type = "box")  %>%
      layout(title = "Distribution of cases over different years",
             yaxis = list(title=input$dataInput))
    
  })
  
}

shinyApp(ui=ui, server=server)