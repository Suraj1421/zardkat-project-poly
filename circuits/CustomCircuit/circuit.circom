pragma circom 2.0.0;

// Define the custom circuit template
template CustomCircuit() {
  // Signal inputs
  signal input a;
  signal input b;

  // Final signal output
  signal output q;

  // Component gates used to create custom circuit
  component andGate = AND();
  component notGate = NOT();
  component orGate = OR();

  // Circuit logic
  andGate.a <== a;
  andGate.b <== b;
  notGate.in <== b;

  orGate.a <== andGate.out;
  orGate.b <== notGate.out;

  q <== orGate.out;
}

// Import templates (no changes)
template AND() {
  signal input a;
  signal input b;
  signal output out;

  out <== a * b;
}

template NOT() {
  signal input in;
  signal output out;

  out <== 1 + in - 2 * in;
}

template OR() {
  signal input a;
  signal input b;
  signal output out;

  out <== a + b - a * b;
}

// Create a main component using the custom circuit
component main = CustomCircuit();