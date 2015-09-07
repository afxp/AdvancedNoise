within AdvancedNoise.Examples;
model SignalBasedCorrelations
  "Tests for uncorrelated noise signals using signal-based generators"
  extends Modelica.Icons.Example;

  Sources.SignalBasedNoise
                         noise1(
    samplePeriod=0.01,
    useAutomaticLocalSeed=false,
    fixedLocalSeed=11,
    useTime=false)
    annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Sources.SignalBasedNoise
                         noise2(
    samplePeriod=0.01,
    useAutomaticLocalSeed=false,
    useTime=false)
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Statistics.CorrelationTest crossCorrelationTest
    annotation (Placement(transformation(extent={{20,40},{40,60}})));
  Statistics.AutoCorrelationTest autoCorrelationTest
    annotation (Placement(transformation(extent={{20,0},{40,20}})));
  Modelica.Blocks.Sources.RealExpression inputSignal(y=time)
    annotation (Placement(transformation(extent={{-100,40},{-68,60}})));
equation
  connect(crossCorrelationTest.u1, noise1.y) annotation (Line(
      points={{18,56},{0,56},{0,70},{-19,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(crossCorrelationTest.u2, noise2.y) annotation (Line(
      points={{18,44},{0,44},{0,30},{-19,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(autoCorrelationTest.u, noise2.y) annotation (Line(points={{18,10},{0,10},
          {0,30},{-19,30}},       color={0,0,127}));
  connect(inputSignal.y, noise1.u) annotation (Line(points={{-66.4,50},{-54,50},
          {-54,70},{-42,70}}, color={0,0,127}));
  connect(noise2.u, inputSignal.y) annotation (Line(points={{-42,30},{-54,30},{
          -54,50},{-66.4,50}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),           Documentation(revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Sep. 4, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>", info="<html>
<p>This example demonstrates the auto and cross correlation using different seeds.</p>
<p><img src=\"modelica://AdvancedNoise/Resources/Images/Examples/SignalBasedCorrelations.png\"/></p>
<p>Both p-values for corss- and autocorrelation are high. This means, we can assume uncorrelated signals; between two different seeds as well as within a single noise signal.</p>
</html>"),
    experiment(StopTime=100));
end SignalBasedCorrelations;
