within Noise.Distributions;
function Uniform
  "A random number with a uniform distribution in a given interval"
  extends Noise.Utilities.Interfaces.Distribution;
  input Real[2] interval = {0,1}
    "The interval from which the uniformly distributed random number is generated"
   annotation(Dialog);
algorithm

  // Retrieve uniformly distributed random number
  (rand,stateOut) := generator(stateIn=stateIn);

  // Transform limits of distribution
  rand              := rand*(interval[2] - interval[1]) + interval[1];
  annotation (Icon(graphics={Line(
          points={{-80,-80},{-80,60},{60,60},{60,-80}},
          color={255,0,0})}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end Uniform;
