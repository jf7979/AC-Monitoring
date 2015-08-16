import pifacedigitalio as p
p.init()
out_put = p.digital_read(0)
print "%d" % (out_put)
# This just reads the switch state of input 0 and echoes it out