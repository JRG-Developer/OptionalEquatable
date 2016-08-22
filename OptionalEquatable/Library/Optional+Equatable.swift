//
//  Optional+Equatable.swift
//  OptionalEquatable
//
//  Created by Joshua Greene on 8/21/16.
//  Copyright © 2016 Joshua Greene. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


import Foundation


// MARK: - OptionalConvertible

/**
 *  @brief  `OptionalConvertible` allows `Optional` types to be used as a Generic type constraint.
 *
 *  @see  Attribution:  https://stackoverflow.com/questions/33436199/add-constraints-to-generic-parameters-in-extension
 */
public protocol OptionalConvertible {
  
  /**
   The wrapped value type.
   */
  associatedtype WrappedValueType
  
  /// The underlying optional value
  var optionalValue: WrappedValueType? { get }

  /**
   Whether or not the underlying value is `nil`
   
   - returns: `true` if the underlying value is `nil` or `false` otherwise
   */
  func isNilValue() -> Bool
}

extension Optional: OptionalConvertible {
  
  /// An alias `Wrapped` associated value
  public typealias WrappedValueType = Wrapped
  
  /// Returns `self`
  public var optionalValue: WrappedValueType? { return self }
  
  
  public func isNilValue() -> Bool {
    return self == nil
  }
}


// MARK: - OptionalConvertible Equality

public func ==<T: OptionalConvertible where T.WrappedValueType: Equatable>(lhs: T, rhs: T) -> Bool {
  
  if lhs.isNilValue() && rhs.isNilValue() { return true }  
  return lhs == rhs
}


// MARK: - Optional Dictionary Equality

public func ==(lhs: NSDictionary?, rhs: NSDictionary?) -> Bool {
  
  if lhs.isNilValue() && rhs.isNilValue() { return true }
  guard let lhs = lhs, let rhs = rhs else { return false }
  return lhs.isEqualToDictionary(rhs as [NSObject : AnyObject])
}

public func ==(lhs: Dictionary<String, AnyObject>?, rhs: Dictionary<String, AnyObject>?) -> Bool {
  return (lhs as NSDictionary?) == (rhs as NSDictionary?)
}
