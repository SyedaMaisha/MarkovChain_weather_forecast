install.packages("markovchain")
install.packages("diagram")
install.packages("pracma")
library(markovchain)
library(diagram)
library(pracma)
library(expm)

# Transition Matrix
Subscription <- matrix(c(.6, .4, .5, .5), nrow = 2, byrow = TRUE)

# creating the Discrete time Markov Chain (DTMC)
dtmcA <- new("markovchain", transitionMatrix = Subscription, states = c("Active", "Disabled"), name = "Subscription")
dtmcA

# Transition Matrix
stateNames <- c("Active", "Disabled")
row.names(Subscription) <- stateNames
colnames(Subscription) <- stateNames
Subscription

# Current state (User is active)
initialState <- matrix(c(1, 0), nrow = 1, byrow = TRUE)
# Subscription state of next month
initialState %*% Subscription
dtmcA^1
# Subscription state of month 2
dtmcA^2
# Subscription state of month 3
dtmcA^3
# Subscription state of month 4
dtmcA^4
# Subscription state of month 5
dtmcA^5
# Subscription state of month 6
dtmcA^6
# Subscription state of month 7
dtmcA^7
# Subscription state of month 8
dtmcA^8

# Verifying the steady state
steadyStates(dtmcA)
# expected number of months before a customer shifts choices
meanFirstPassageTime(dtmcA)

Subscription7 <- Subscription %^% 7
Subscription7 <- round(Subscription7, 3)
plotmat(Subscription7,
      pos = c(1, 1), lwd = 1, box.lwd = 2, cex.txt = 0.8,
      box.size = 0.12, box.type = "circle", box.prop = 0.7, box.col = "light blue",
      arr.length = .4, arr.width = .2, self.cex = .6, self.shifty = -.01,
      self.shiftx = .17, main = "Subscription Prediction"
)
