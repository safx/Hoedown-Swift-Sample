//
//  hoedown.swift
//  HoedownSwiftSample
//
//  Created by Safx Developer on 2015/03/17.
//  Copyright (c) 2015年 Safx Developers. All rights reserved.
//

import Foundation

public func render(markdownText: String) -> String? {
    return markdownText.withCString { cstr in
        var renderer = hoedown_html_renderer_new(hoedown_html_flags(0), 0)
        var document = hoedown_document_new(renderer, hoedown_extensions(0), 16)
        
        let inputLength = UInt(markdownText.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let inputChars = UnsafePointer<UInt8>(UnsafePointer<Void>(cstr))
        var outputBuffer = hoedown_buffer_new(inputLength)
        hoedown_document_render(document, outputBuffer, inputChars, inputLength)

        hoedown_buffer_putc(outputBuffer, 0);
        let output = String(UTF8String: UnsafePointer<CChar>(UnsafePointer<Void>(outputBuffer.memory.data)))

        hoedown_buffer_free(outputBuffer)
        hoedown_document_free(document)
        hoedown_html_renderer_free(renderer)

        return output
    }
}
