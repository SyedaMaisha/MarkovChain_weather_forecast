install.packages("markovchain")
install.packages("diagram")
install.packages("pracma")
library(markovchain)
library(diagram)
library(pracma)
library(expm)

# Transition Matrix
Weather <- matrix(c(.5, 0, .5, .25, .25, .5, .5, .25, .25), nrow = 3, byrow = TRUE)

# creating the Discrete time Markov Chain (DTMC)
dtmcA <- new("markovchain", transitionMatrix = Weather, states = c("Rainy", "Snow", "Sunny"), name = "Weather")
dtmcA

# Transition Matrix
stateNames <- c("Rainy", "Snow", "Sunny")
row.names(Weather) <- stateNames
colnames(Weather) <- stateNames
Weather

# Current state (There is Snow)
initialState <- matrix(c(0, 1, 0), nrow = 1, byrow = TRUE)
# Weather of tomorrow given that there is snow today
initialState %*% Weather
# Weather of day 2
dtmcA^2
# Weather of day 3
dtmcA^3
# Weather of day 4
dtmcA^4
# Weather of day 5
dtmcA^5
# Weather of day 6
dtmcA^6
# Weather of day 7
dtmcA^7
# If there is snow today then the probability of the three states after 7 days
Weather7 <- initialState %*% Weather^7
Weather7
# Verifying the steady state
steadyStates(dtmcA)

Weather7 <- Weather %^% 7
Weather7 <- round(Weather7, 3)
plotmat(Weather7,
      pos = c(1, 2), lwd = 1, box.lwd = 2, cex.txt = 0.8,
      box.size = 0.12, box.type = "circle", box.prop = 0.7, box.col = "light blue",
      arr.length = .4, arr.width = .2, self.cex = .6, self.shifty = -.01,
      self.shiftx = .17, main = "Weather Forecast after 7 days"
)
