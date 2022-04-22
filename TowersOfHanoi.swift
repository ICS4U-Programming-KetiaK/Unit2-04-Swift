//
//  TowersOfHanoi.swift
//
//  Created by Ketia Gaelle Kaze
//  Created on 2022-04-14
//  Version 1.0
//  Copyright (c) 2022 Ketia Gaelle Kaze. All rights reserved.
//
// TowersOfHanoi program gives the user strategies on
// how to solve the tower of hanoi riddle.
import Foundation

func hanoi(numOfDisks: Int, startPeg: Int, middlePeg: Int, endPeg: Int) {

    // base case for when there is only one disk
    if numOfDisks == 1 {
        print("Disk 1 moved from peg \(startPeg) to peg \(endPeg)")
    } else {
        // find where the disks should be placed.
        hanoi(numOfDisks: numOfDisks - 1, startPeg: startPeg,
            middlePeg: endPeg, endPeg: middlePeg)

        print("Disk \(numOfDisks) moved from peg \(startPeg) to peg \(endPeg)")

        hanoi(numOfDisks: numOfDisks - 1, startPeg: middlePeg,
            middlePeg: startPeg, endPeg: endPeg)
    }
    return()
}
// exception at runtime error
enum MyError: Error {
  case runtimeError(String)
}

// function to catch error
func catchString() throws {
  throw MyError.runtimeError("Input is not a valid integer.")
}
// declaring variables
let firstPeg = 1
let middlePeg = 2
let lastPeg = 3

print("Towers of Hanoi\n")

// get user input
print("How many disks do you want to use?: ", terminator: "")
let numOfDisksStr = readLine()!

do {
  // convert user input from string to an int
  let numOfDisksInt = Int(numOfDisksStr) ?? -1
  if numOfDisksInt != Int(numOfDisksStr) {
    try catchString()
  }

  // ensuring the user enters an appropriate integer
  if numOfDisksInt <= 0 {
    // catch error for negative numbers and 0
    print("\n\(numOfDisksStr) is not a positive integer.\n")
  } else {
        // call function
        hanoi(numOfDisks: numOfDisksInt, startPeg: firstPeg,
            middlePeg: middlePeg, endPeg: lastPeg)
  }
  // catch invalid inputs
} catch MyError.runtimeError(let errorMessage) {
  print(errorMessage)
}
