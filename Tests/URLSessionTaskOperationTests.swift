//
//  URLSessionTaskOperationTests.swift
//  ADVOperation
//
//  Created by Guillaume Sempé on 16/06/15.
//  Copyright © 2015 Advanced Operation. All rights reserved.
//

import XCTest

class URLSessionTaskOperationTests: XCTestCase {
    
    let queue = OperationQueue()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let numberOfLines = 100
        let URLString = "http://httpbin.org/stream/\(numberOfLines)"
        let expectation = expectationWithDescription("Request should succeed: \(URLString)")

        var _url: NSURL?
        var _response: NSURLResponse?
        var _error: NSError?
        
        let url = NSURL(string: URLString)!
        let task = NSURLSession.sharedSession().downloadTaskWithURL(url) { url, response, error in
            _url = url
            _response = response
            _error = error
            expectation.fulfill()
        }
        
        if let task = task {
            let taskOperation = URLSessionTaskOperation(task: task)
            queue.addOperation(taskOperation)
        }

        waitForExpectationsWithTimeout(10, handler: nil)

        XCTAssertNotNil(_url, "URL should not be nil")
        XCTAssertNotNil(_response, "response should not be nil")
        XCTAssertNil(_error, "error should be nil")
    }
}
