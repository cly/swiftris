//
//  Array2D.swift
//  swiftris
//
//  Created by Charlie Liang Yuan on 9/27/14.
//  Copyright (c) 2014 Bloc. All rights reserved.
//

import Foundation

// Class called Array2D.
// Generic arrays are of type struct, not class.
// structs are passed by value, class objects are passed by reference.
// game logic requires a singleton.
class Array2D<T> {
    let columns: Int
    let rows: Int
    
    // Backing data structure. <T?> means optional of type T.
    var array: Array<T?>
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        
        // Initialize array size.
        array = Array<T?>(count: rows * columns, repeatedValue: nil)
    }
    
    // Custom subscript to allow access by array[column, row]
    subscript(column: Int, row: Int) -> T? {
        get {
            return array[(row * columns) + column]
        }
        set(newValue) {
            array[(row * columns) + column] = newValue
        }
    }
}