// swift-tools-version:5.1
//
//  Package.swift
//  Perfect-MariaDB
//
//  Created by Rockford Wei on 10/04/16.
//	Copyright (C) 2016 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PackageDescription

let package = Package(
    name: "MariaDB",
	platforms: [
		.macOS(.v10_15),
	],
    products: [
        .library(
            name: "MariaDB",
            targets: ["MariaDB"]),
    ],
    dependencies: [
		.package(url: "https://github.com/Aranatha/Perfect-CRUD.git", .branch("master"))
    ],
    targets: [
        .systemLibrary(name: "mariadbclient",
            pkgConfig: "libmariadb",
            providers: [
                .apt(["libmariadb-dev"]),
                .brew(["mariadb-connector-c"])
            ]
        ),
        .target(
            name: "MariaDB",
            dependencies: ["mariadbclient", "PerfectCRUD"]),
        .testTarget(
            name: "MariaDBTests",
            dependencies: ["MariaDB"]),
    ]
)
