// Copyright (c) 2018 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/test;
import ballerina/http;

// Common request Payload
json requestPayload = {
    "ArrivalDate":"12-03-2018",
    "DepartureDate":"13-04-2018",
    "Location":"Changi"
};

// Client endpoint
endpoint http:Client clientEP {
    url:"http://localhost:9092/hotel"
};

// Function to test resource 'miramar'
@test:Config
function testResourceMiramar () {
    // Initialize the empty http requests and responses
    http:Request req;

    // Set request payload
    req.setJsonPayload(requestPayload);
    // Send a 'post' request and obtain the response
    http:Response response = check clientEP -> post("/miramar", req);
    // Expected response code is 200
    test:assertEquals(response.statusCode, 200,
        msg = "Hotel reservation service did not respond with 200 OK signal!");
    // Check whether the response is as expected
    string expected = "{\"HotelName\":\"Miramar\", \"FromDate\":\"12-03-2018\", " +
        "\"ToDate\":\"13-04-2018\", \"DistanceToLocation\":6}";
    json resPayload = check response.getJsonPayload();
    test:assertEquals(resPayload.toString(), expected, msg = "Response mismatch!");
}

// Function to test resource 'aqueen'
@test:Config
function testResourceAqueen () {
    // Initialize the empty http requests and responses
    http:Request req;

    // Set request payload
    req.setJsonPayload(requestPayload);
    // Send a 'post' request and obtain the response
    http:Response response = check clientEP -> post("/aqueen", req);
    // Expected response code is 200
    test:assertEquals(response.statusCode, 200,
        msg = "Hotel reservation service did not respond with 200 OK signal!");
    // Check whether the response is as expected
    string expected = "{\"HotelName\":\"Aqueen\", \"FromDate\":\"12-03-2018\", " +
        "\"ToDate\":\"13-04-2018\", \"DistanceToLocation\":4}";
    json resPayload = check response.getJsonPayload();
    test:assertEquals(resPayload.toString(), expected, msg = "Response mismatch!");
}

// Function to test resource 'elizabeth'
@test:Config
function testResourceElizabeth () {
    // Initialize the empty http requests and responses
    http:Request req;

    // Set request payload
    req.setJsonPayload(requestPayload);
    // Send a 'post' request and obtain the response
    http:Response response = check clientEP -> post("/elizabeth", req);
    // Expected response code is 200
    test:assertEquals(response.statusCode, 200,
        msg = "Hotel reservation service did not respond with 200 OK signal!");
    // Check whether the response is as expected
    string expected = "{\"HotelName\":\"Elizabeth\", \"FromDate\":\"12-03-2018\", " +
        "\"ToDate\":\"13-04-2018\", \"DistanceToLocation\":2}";
    json resPayload = check response.getJsonPayload();
    test:assertEquals(resPayload.toString(), expected, msg = "Response mismatch!");
}
