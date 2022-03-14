projectName=jams
scriptName=$projectName.jmx
time=$(date "+%Y.%m.%d-%H.%M")
results=PerfTest_Results_$time
mkdir ./$results
mkdir ./HTMLTReport_$time
nohup sh apache-jmeter-5.4.3/apache-jmeter-5.4.3/bin/jmeter.sh -Jjmeter.save.saveservice.output_format=csv -n -t ./$sciptName -f -l ./$projectName.jtl -e -o ./HTMLReport_$time
./$results/nohup.txt 2>&1
sh apache-jmeter-5.4.3/apache-jmeter-5.4.3/bin/JmeterPluginsCMD.sh --generate.csv ./Aggregate_$time.csv --input-jtl ./$projectName.jtl --plugin-type AggregateReport
mv ./HTMLReport_$time ./$results
mv ./$projectName.jtl ./$results
mv ./jmeter.log ./$results
mv ./GrafanaResults.txt ./$results
mv ./Aggregate_$time.csv ./$results
mv ./$projectName.properties ./$results
echo "test finished find the results in folder $results"


