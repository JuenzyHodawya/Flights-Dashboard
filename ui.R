# Flight-Dashboard using Shiny. 
# Written by : Juenzy Hodawya
# Department of Business statistics, Matana University
# Notes: Please don't share this code anywhere (It's just for my lecturer and my friends)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

source("global.R", local = TRUE)

ui <- dashboardPage(title = "www.NYC-flights.com",
                    skin  = "green",
                    
      # Header
      dashboardHeader(title = "New York City Flights",
                      titleWidth = 230,
                      tags$li(class = "dropdown",tags$img(src = "Matana.png", height = 47, width = 47))),
                    
      # Side bar of the Dashboard
      dashboardSidebar(
        selectInput(
          inputId = "airline",
          label = "Destination Airports:",
          choices = airport_list,
          selectize = FALSE),
        
      # Side menu of the Dashboard  
      sidebarMenu(
        selectInput(
          inputId = "month",
          label = "Month:",
          choices = month_list,
          selected = 99,
          size = 13,
          selectize = FALSE),
        actionLink("remove", icon = icon("trash-alt"),"Remove detail tabs"),
        menuItem("Source Code", icon = icon("github"), href = "https://github.com/JuenzyHodawya/Flights-Dashboard"),
        menuItem("About Me", icon = icon("linkedin"), href = "https://www.linkedin.com/in/juenzy-hodawya-a310ab1a3/"),
        menuItem("Video", icon = icon("youtube"), href = "https://www.youtube.com/watch?v=vZR_2hhvsu4")
        )
      ),
      
      # The body of the dashboard
      dashboardBody(
        tabsetPanel(id = "tabs",
          tabPanel(title = "Main Dashboard",
          value = "page1",
        fluidRow(valueBoxOutput("total_flights"),
                 valueBoxOutput("per_day"),
                 valueBoxOutput("percent_delayed")),
        fluidRow(column(width = 6,d3Output("group_totals")),
                 column(width = 6,d3Output("top_airlines")))
      )
    )
  )
)
