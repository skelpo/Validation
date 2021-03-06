import XCTest
@testable import Failable

internal struct USPhoneNumber: RegexValidation {
    static let pattern = "1?-?\\(?[0-9]{3}\\)?-?[0-9]{3}-?[0-9]{4}"
}

final class StringTests: XCTestCase {
    func testUSPhoneNumber()throws {
        var number: Failable<String, USPhoneNumber> = try "731-943-4316".failable()
        
        try number <~ "(731)-943-4316"
        try number <~ "1-731-943-4316"
        try number <~ "7319434316"
        
        try XCTAssertThrowsError(number <~ "")
        try XCTAssertThrowsError(number <~ "943-4316")
        try XCTAssertThrowsError(number <~ "1-800-EAT-MEAT")
        try XCTAssertThrowsError(number <~ "4316-943-731")
    }
}

