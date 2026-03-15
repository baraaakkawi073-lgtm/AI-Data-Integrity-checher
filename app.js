document.getElementById("runBtn").addEventListener("click", () => {

  const input = document.getElementById("inputData").value;
  const output = document.getElementById("output");

  if (!input) {
    output.innerText = "Please enter data first.";
    return;
  }

  // Example simulation (replace with your TS logic)
  const result = analyze(input);

  output.innerText = result;
});


function analyze(text) {

  // Example logic (change per project)
  if (text.toLowerCase().includes("error")) {
    return "⚠️ Potential issue detected.";
  }

  return "✅ Data looks safe.";
}
