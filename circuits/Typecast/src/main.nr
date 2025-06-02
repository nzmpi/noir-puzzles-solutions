use std::convert::AsPrimitive;

// The goal is to modify the main function to return true if the value of "x" is
// greater than the value of "y". However, fields cannot be directly compared in
// Noir. To make the comparison work, you must cast them to a valid uint type
// first. Then, perform the comparison and return the result.

fn main(x : Field, y : pub Field) -> pub bool {
    //y.lt(x)
    let x_num: u128 = x.as_();
    let y_num: u128 = y.as_();
    x_num > y_num
}

////////////////////
//     TESTS      //
////////////////////
#[test]
// Do not modify this function
fn test_main() {
  assert(main(1, 2) == false); 
  assert(main(188, 32) == true); 
  assert(main(20, 20) != true); 
}
