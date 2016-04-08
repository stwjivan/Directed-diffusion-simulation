#!/bin/bash
delay=(delay/delay1sender.txt delay/delay5sender.txt delay/delay10sender.txt delay/delay15sender.txt delay/delay20sender.txt)
energy=(energy/energy1sender.txt energy/energy5sender.txt energy/energy10sender.txt energy/energy15sender.txt energy/energy20sender.txt)
pair=(1 5 10 15 20)
#=======================delete old files========================================= 
for i in 0 1 2 3 4
do
	rm ${delay[$i]}
	rm ${energy[$i]}
done
#======================Simulation start============================================
for loop in 0 1 2 3 4 
do   
	for seed in 1.0 10.0 100.0 1000.0 10000.0 100000.0 1000000.0 17560000.0 100000000.0 1000000000.0
	do  
		ns genDiff.tcl -nn 49 -seed $seed -nsrc ${pair[$loop]} > network
		ns simulation.tcl
		awk -f energy1.awk output.tr >> ${energy[$loop]}
		awk -f Avg_Del-new.awk output.tr >> ${delay[$loop]}
	done
	echo "loop $loop fininshed\n"
	echo "  " >> ${energy[$loop]}
	echo "  " >> ${delay[$loop]}
done
echo "finished" 
