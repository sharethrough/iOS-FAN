//
//  FANNetworkAdapter.h
//  SharethroughSDK
//
//  Created by Mark Meyer on 8/19/16.
//  Copyright © 2016 Sharethrough. All rights reserved.
//


#if __has_include(<SharethroughSDK/SharethroughSDK.h>)
    #import <SharethroughSDK/SharethroughSDK.h>
#else
    #import <SharethroughSDK/STRNetworkAdapter.h>
    #import <SharethroughSDK/STRNetworkAdapter.h>
#endif

@interface FANNetworkAdapter : STRNetworkAdapter

@end
