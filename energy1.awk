#energy.awk
BEGIN{
	requests=0;
	send_packets = 0;	
	recv_packets = 0;	
	total_energy = 0;
}
{ 
	id=$5;
	source_ip=$14;
	agent = $4;
	action = $1;
	
	i=0;
	if(($6=="-e"&&$1=="N"))
	{
		  energy[$5]=$7;
	    #i++;
	    #printf("%.9f,%d,%.9f\n",$7,$5,energy[$5]);
	}
  	if(action == "r" && $3 == "_24_" && agent == "AGT"){
	      recv_packets++;
	}
	
}
END{ 
	for(j=0;j<49;j++){
		total_energy=total_energy+energy[j];
  }
  printf("%.9f\n",((1000*49)-total_energy)/recv_packets);
}
