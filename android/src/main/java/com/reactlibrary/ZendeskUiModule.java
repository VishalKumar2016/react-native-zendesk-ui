package com.reactlibrary;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import zendesk.core.AnonymousIdentity;
import zendesk.core.Identity;
import zendesk.core.Zendesk;
import zendesk.support.Support;
import zendesk.support.guide.HelpCenterActivity;

public class ZendeskUiModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    public ZendeskUiModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "ZendeskUi";
    }

    @ReactMethod
    public void initZendesk(String zendeskUrl, String appId, String clientId) {
        Zendesk.INSTANCE.init(reactContext, zendeskUrl, appId, clientId);

        Identity identity = new AnonymousIdentity();
        Zendesk.INSTANCE.setIdentity(identity);

        Support.INSTANCE.init(Zendesk.INSTANCE);
    }

    @ReactMethod
    public void showHelpCenter() {
        HelpCenterActivity.builder().show(reactContext);
    }

}
