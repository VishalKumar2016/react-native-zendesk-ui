#import "ZendeskUi.h"
#import <SupportSDK/SupportSDK.h>
#import <ZendeskCoreSDK/ZendeskCoreSDK.h>

@implementation ZendeskUi

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(initZendesk:(NSString *)zendeskUrl zendeskAppId:(NSString *)appId zendeskClientId:(NSString *)clientId)
{
    [ZDKZendesk initializeWithAppId:appId clientId:clientId zendeskUrl: zendeskUrl];
    [ZDKSupport initializeWithZendesk:[ZDKZendesk instance]];

    id<ZDKObjCIdentity> userIdentity = [[ZDKObjCAnonymous alloc] initWithName:nil email:nil];
    [[ZDKZendesk instance] setIdentity:userIdentity];
}

RCT_EXPORT_METHOD(showHelpCenter)
{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        UIViewController *helpCenterUI = [ZDKHelpCenterUi buildHelpCenterOverviewUi];
         UINavigationController *navController  = [[[UIApplication sharedApplication] keyWindow] rootViewController];
        [navController pushViewController:helpCenterUI animated:true];
    }];
}

@end
