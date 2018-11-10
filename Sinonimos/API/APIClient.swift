//
//  APIClient.swift
//  Sinonimos
//
//  Created by 古賀ミッシェル on 2018/11/11.
//  Copyright © 2018 古賀ミッシェル. All rights reserved.
//

import Foundation

enum Either<V, E: Error> {
	case value(V)
	case error(E)
}

enum APIError: Error {
	case apiError
	case badResponse
	case jsonDecoder
	case unknown(String)
}

protocol APIClient {
	var session: URLSession { get }
	func fetch<V: Codable>(with request: URLRequest, completion: @escaping (Either<V, APIError>) -> Void)
}
