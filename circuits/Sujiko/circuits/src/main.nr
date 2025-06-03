// Create a 3 x 3 Sujiko Verifier circuit 

/// Question will be in the form of  
/// q[0]  q[1]
/// q[2]  q[3]

/// solution will be in the form of 
/// s[0]  s[1]  s[2]
/// s[3]  s[4]  s[5]
/// s[6]  s[7]  s[8]


fn main(question: pub [Field; 4], solution:[Field; 9]) {
    // Your solution starts here ..
    let mut map: [Field; 9] = [0; 9];
    for i in 0..9 {
        assert(solution[i] as u32 > 0 & solution[i] as u32 < 10);
        map[solution[i] as u32 - 1] += 1;
    }

    for i in 0..9 {
        assert(map[i] == 1);
    }

    assert(question[0] == solution[0] + solution[1] + solution[3] + solution[4]);
    assert(question[1] == solution[1] + solution[2] + solution[4] + solution[5]);
    assert(question[2] == solution[3] + solution[4] + solution[6] + solution[7]);
    assert(question[3] == solution[4] + solution[5] + solution[7] + solution[8]);
}

#[test]
fn test() {
    let question: [Field; 4] = [20, 22, 14, 20];
    let solution: [Field; 9] = [7, 9, 2, 1, 3, 8, 6, 4, 5];
    main(question, solution);
}

#[test(should_fail)]
fn test_fail() {
    let question: [Field; 4] = [20, 22, 14, 20];
    let solution: [Field; 9] = [7, 9, 2, 1, 3, 3, 6, 4, 5];
    main(question, solution);
}