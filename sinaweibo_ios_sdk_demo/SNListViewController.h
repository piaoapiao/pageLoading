//
//  SNListViewController.h
//  sinaweibo_ios_sdk_demo
//
//  Created by wgdadmin on 13-1-30.
//  Copyright (c) 2013年 SINA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SNListViewController : UIViewController<SinaWeiboRequestDelegate,EGORefreshTableHeaderDelegate>
{
    int pageIndex;
}
@property (nonatomic,retain) SinaWeibo *weiBo;
@end
