function foo(x: int): int {
  return x + 1;
}

function bar(x: int): int {
  return foo(x) + 1;
}

function baz(x: int): int {
  if (x == 0) {
    return 0;
  } else {
    return bar(x - 1);
  }
}

function main(): void {
  var x = baz(5);
  echo x; //expected output: 7
}
This code is a bit tricky because of how Hack handles function calls. Baz calls bar recursively until x is 0.  Each time, the call to foo is incrementing the value of x. Thus, after the 5 recursive calls of baz, we would expect x to equal 7. However, there is an unusual error related to the way Hack handles the return value.