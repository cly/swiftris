//
//  Block.swift
//  swiftris
//
//  Created by Charlie Liang Yuan on 9/28/14.
//  Copyright (c) 2014 Bloc. All rights reserved.
//

import Foundation
import SpriteKit

// Define number of colors.
let NumberOfColors: UInt32 = 6

// Enum of type Int and implements the Printable protocol.
// Classes, structures and enums which implement Printable are capable of generating human-readable strings when debugging or printing their value to the console.
enum BlockColor: Int, Printable {
    
    // Start 0 and goes to 5.
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    
    // Computed property. Like a variable but a code block invoked to generate value each time.
    // Returns the correct filename.
    var spriteName: String {
        switch self {
        case .Blue:
            return "blue"
        case .Orange:
            return "orange"
        case .Purple:
            return "purple"
        case .Red:
            return "red"
        case .Teal:
            return "teal"
        case .Yellow:
            return "yellow"
        }
    }
    
    var description: String {
        return self.spriteName
    }
    
    static func random() -> BlockColor {
        return BlockColor.fromRaw(Int(arc4random_uniform(NumberOfColors)))!
    }
}

// Hashable allows Block to be stored in Array2D.
class Block: Hashable, Printable {
    let color: BlockColor
    
    // Location of block and rendering.
    var column: Int
    var row: Int
    var sprite: SKSpriteNode?
    
    var spriteName: String {
        return color.spriteName
    }
    
    var hashValue: Int {
        // Xor.
        return self.column ^ self.row
    }
    
    var description: String {
        return "\(color): [\(column), \(row)]"
    }
    
    init(column: Int, row: Int, color: BlockColor) {
        self.column = column
        self.row = row
        self.color = color
    }
}

// Define custom operator for comparing one Block with another.
// Operator is required for Hashable protocol.
func ==(lhs: Block, rhs: Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.toRaw() == rhs.color.toRaw()
}