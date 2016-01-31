# Calculates the Mandelbrot set (https://en.wikipedia.org/wiki/Mandelbrot_set)
# through the first 20 iterations of the equation z = z^2 + c plotted for
# different complex constants c.

install.packages("caTools")
library(caTools)  # for write.gif
jet.colors <- colorRampPalette(c("green", "blue", "red", "cyan", "#7FFF7F",
                                 "yellow", "#FF7F00", "red", "#7F0000"))
m <- 1000  # define size
C <- complex(real=rep(seq(-1.8,0.6, length.out=m), each=m),
             imag=rep(seq(-1.2,1.2, length.out=m), m))
C <- matrix(C,m,m)  # reshape as square matrix of complex numbers
Z <- 0
X <- array(0, c(m,m,20))  # initialize output 3D array
for (k in 1:20) {
  Z <- Z^2+C  # the central difference equation
  X[,,k] <- exp(-abs(Z))  # capture results
}
write.gif(X, "Mandelbrot.gif", col=jet.colors, delay=900)
