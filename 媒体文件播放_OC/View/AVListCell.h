//
//  AVListCell.h
//  媒体文件播放_OC
//
//  Created by Space Zhong on 2020/8/11.
//  Copyright © 2020 Space Zhong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class AVListModel;
@interface AVListCell : UITableViewCell
@property(nonatomic,strong)AVListModel * model;
@end

NS_ASSUME_NONNULL_END
