//
//  HoedownSwiftSampleTests.swift
//  HoedownSwiftSampleTests
//
//  Created by Safx Developer on 2015/03/17.
//  Copyright (c) 2015年 Safx Developers. All rights reserved.
//

import UIKit
import XCTest
import HoedownSwiftSample

class HoedownSwiftSampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        XCTAssertEqual("<ul>\n<li>わたしの名前は</li>\n<li>中野です</li>\n</ul>\n", render("* わたしの名前は\n* 中野です")!)
    }

    func testPerformanceExample() {
        self.measureBlock() {
            for var i = 0; i < 10000; ++i {
                render("* わたしの名前は\n* 中野です")
            }
        }
    }
    
}
