//
//  SwiftLintPlugin.swift
//  
//
//  Created by Francisco Javier Trujillo Mata on 21/12/21.
//

import Foundation
import PackagePlugin

@main struct SwiftLintPlugin: BuildToolPlugin {
    /// This plugin's implementation returns a single `prebuild` command to run `swiftlint`.
    func createBuildCommands(context: TargetBuildContext) throws -> [Command] {
        let swiftLintConfigFile = context.packageDirectory.appending(".swiftlint.yml")

        // Return a command to run `swiftgen` as a prebuild command. It will be run before
        // every build and generates source files into an output directory provided by the
        // build context. This example sets some environment variables that `swiftgen.yml`
        // bases its output paths on.
        return [
            .prebuildCommand(displayName: "Running SwiftLint",
                             executable: try context.tool(named: "swiftlint").path,
                             arguments: [
                                "config", "run",
                                "--config", "\(swiftLintConfigFile)"
                             ])
        ]
    }
}
