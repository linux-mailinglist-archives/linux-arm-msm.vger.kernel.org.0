Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 726BB4C40E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 10:05:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238886AbiBYJFV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Feb 2022 04:05:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238874AbiBYJFQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Feb 2022 04:05:16 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE20F22EDD3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 01:04:43 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id bc10so1859001qtb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 01:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ANkPRwKigf48wBa9qho3ykHLHum+ZyEFDRigpWv6FrM=;
        b=H/EQT8/o/JTTZ+SqZ/MSQCOcwUQ734BhzIf5rQ5FoQPx2s45VIDpvJQjvnoC5gAaGy
         L3gfC7hYMpOGHWFxWSgHEEy5ZCvEfNaRmdgeAvFfp7nLIoYURyLBvJVGaEl42nGj6ILJ
         mNjC4xiobn62k9HQTHfMQmtozwn0CMLlGhqm9RyRoVkshcRxz7MiJ+F5nBD5I+Nb3t6u
         RX3rfF1q4uDSvSYEOOBL/ooxDJTy15V/j4c5La8fgotEJKkEy1XarC4jCOIyxZqeFO1z
         eDytHvcTL0J0ESwbEwrs/sMklxzdXRcd/d16IYhSnTLvAun6xv/nXHDhqHgydoCtKtUr
         OBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ANkPRwKigf48wBa9qho3ykHLHum+ZyEFDRigpWv6FrM=;
        b=F7GHVNotrN/fF1wwWVuvxeZP+G4Y+gHdCTZ5I3rsaH+g8W/y+xt1N2CQwFk/lAUrt9
         PsbGWke9DLXXbt0PpNZOZKi4C1JoMHdRwFNbulMPP7cE3c2GyGUDaZ+n7GFAKgiAqns9
         rRliiH+/mTcBKoAlh11wGPghv5azpPI9N7OYKV9T8RYYkHD1WXa/lpEVFJrsVXU5PG6N
         4qp1RU5L15gyXx0FfWUXGIXMFYrjE5/+XXocRTpL5bfKNOYC28J5jgDWTMRj1hu89mOm
         BkQQB4R9bUe+j4bTrbyOY4J1hAs6Ja4wpbjT5pW0sSE1t23XU9TAxY1KSCS19f6+2Mik
         ulGA==
X-Gm-Message-State: AOAM5324fExFrwqPc6vjBeEU4vuQoxLLX/hurK0D34GIdVLfHE+v7Be3
        U+boJs+i98T7cOSadSvswuqukXa8O/3s5akVHfqfaA==
X-Google-Smtp-Source: ABdhPJwee7YOxlUpJV+mKKucwqbVN46Dj8k3X7kuW7mb/thX6qfdYuy3gT46ysbZfschWrCslEMnMdYhiOsnKbxh0GE=
X-Received: by 2002:ac8:5713:0:b0:2de:4e16:5b25 with SMTP id
 19-20020ac85713000000b002de4e165b25mr5875633qtw.682.1645779883043; Fri, 25
 Feb 2022 01:04:43 -0800 (PST)
MIME-Version: 1.0
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-2-dmitry.baryshkov@linaro.org> <CAE-0n52iHFtHppZj-g0V1UP5oWzXjbNDjpOd-hgR+F=TqFzjVg@mail.gmail.com>
 <a1b1d3ef-4131-b8a9-5300-89092bce271b@linaro.org> <a219b978-21a8-a2d6-62c0-69c451b10c09@quicinc.com>
 <CAA8EJpp5RjazoHD3GEE-1wJZtG3hZV9PRc3TtsBFFCcsB4zCNg@mail.gmail.com>
 <9398567b-6517-8eb3-f5d5-d8c88cb10814@quicinc.com> <CAA8EJpp2KrHfNN0F7s6iNOd8Zh1w-1dBMfAXff4Yy4UAdpPGUA@mail.gmail.com>
 <aaf172c9-d645-10ed-68ab-1d3c0296af3b@quicinc.com>
In-Reply-To: <aaf172c9-d645-10ed-68ab-1d3c0296af3b@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 25 Feb 2022 12:04:31 +0300
Message-ID: <CAA8EJprvtia+x7em1FwSGmkChJmrSvOwqXzsGi2Gobuwv3tTXw@mail.gmail.com>
Subject: Re: [Freedreno] [RFC PATCH v2 1/5] drm/msm/dp: fix panel bridge attachment
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 25 Feb 2022 at 07:45, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/24/2022 8:22 PM, Dmitry Baryshkov wrote:
> > On Fri, 25 Feb 2022 at 05:01, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2/24/2022 12:41 PM, Dmitry Baryshkov wrote:
> >>> On Thu, 24 Feb 2022 at 21:25, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 2/18/2022 6:26 PM, Dmitry Baryshkov wrote:
> >>>>> On 19/02/2022 02:56, Stephen Boyd wrote:
> >>>>>> Quoting Dmitry Baryshkov (2022-02-11 14:40:02)
> >>>>>>> In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
> >>>>>>> enable and disable") the DP driver received a drm_bridge instance, which
> >>>>>>> is always attached to the encoder as a root bridge. However it conflicts
> >>>>>>> with the panel_bridge support for eDP panels. The panel bridge attaches
> >>>>>>> to the encoder before the "dp" bridge has a chace to do so. Change
> >>>>>>
> >>>>>> s/chace/chance/
> >>>>>>
> >>>>>>> panel_bridge attachment to come after dp_bridge attachment.
> >>>>>>
> >>>>>> s/panel_bridge/panel bridge/ possibly? And maybe clarify that dp_bridge
> >>>>>> is the "DP driver's drm_bridge instance created in
> >>>>>> msm_dp_bridge_init()"?
> >>>>>>
> >>>>>> My understanding is that we want to pass the bridge created in
> >>>>>> msm_dp_bridge_init() as the 'previous' bridge so that it attaches the
> >>>>>> panel bridge to the output of the DP bridge that's attached to the
> >>>>>> encoder.
> >>>>>
> >>>>> Thanks! I'll update the commit log when pushing the patches.
> >>>>
> >>>> Please correct if i am missing something here.
> >>>>
> >>>> You are right that the eDP panel's panel bridge attaches to the encoder
> >>>> in dp_drm_connector_init() which happens before msm_dp_bridge_init() and
> >>>> hence it will attach directly to the encoder.
> >>>>
> >>>> But we are talking about different encoders here. DP's dp_display has a
> >>>> different encoder compared to the EDP's dp_display.
> >>>
> >>> The encoders are different. However both encoders use the same
> >>> codepath, which includes dp_bridge. It controls dp_display by calling
> >>> msm_dp_display_foo() functions.
> >>>
> >
> >>>> So DP's bridge will still be attached to its encoder's root.
> >>>
> >>> There is one dp_bridge per each encoder. Consider sc8180x which has 3
> >>> DP controllers (and thus 3 dp_bridges).
> >>>
> >>
> >> Sorry, but I still didnt follow this.
> >>
> >> So for eDP, dp_drm_connector_init() will attach the panel_bridge
> >> and then msm_dp_bridge_init() will add a drm_bridge.
> >>
> >> And yes in that case, the drm_bridge will be after the panel_bridge
> >>
> >> But since panel_bridge is at the root for eDP it should be okay.
> >
> > No. It is not.
> > For both DP and eDP the chain should be:
> > dpu_encoder -> dp_bridge -> external (panel) bridge, optional for DP
> > -> [other bridges] -> connector
> >
> > Otherwise drm_bridge_chain_foo() functions would be called in the
> > incorrect order.
>
> Agreed. For drm_bridge_chain_foo() ordering to be correct, for eDP chain
> the order should be what you mentioned and panel_bridge should be at the
> end ( should be the last one ).
>
> For the above reason,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> I still didnt understand what gets affected by this for the
> msm_dp_display_foo() functions you mentioned earlier and wanted to get
> some clarity on that.

They should be called at the correct time.

> >
> > Thus the dp_bridge should be attached directly to the encoder
> > (drm_encoder) and panel_bridge should use dp_bridge as the 'previous'
> > bridge.
> >
>
> Agreed.
>
> > For example, for the DP port one can use a display-connector (which
> > actually implements drm_bridge) as an external bridge to provide hpd
> > or dp power GPIOs.
> >
> > Note, that the current dp_connector breaks layering. It makes calls
> > directly into dp_display, not allowing external bridge (and other
> > bridges) to override get_modes/mode_valid and other callbacks.
> > Thus one of the next patches in series (the one that Kuogee had issues
> > with) tries to replace the chain with the following one:
> > dpu_encoder -> dp_bridge -> external (panel) bridge -> [other bridges]
> > -> drm_bridge_connector.
> >
> >>
>
> So originally the plan was always that the DP connector layer intercepts
> the call because panel-eDP file did not support reading of the EDID ( we
> have not provided the aux bus ). So it was intended that we did not want
> to goto the eDP panel to get the modes. Not an error but something which
> we wanted to cleanup later when we moved to panel-eDP completely.

panel_edp_get_modes() correctly handles this case and returns modes
specified in the panel description. So the code should work even with
panel-eDP and w/o the AUX bus.

>
> Till then we wanted the dp_connector to read the EDID and get the modes.
>
> So this was actually intended to happen till the point where we moved to
> panel-eDP to get the modes.
>
> Hence what you have mentioned in your cover letter is right that the
> chain was broken but there was no loss of functionality due to that today.
>
> Now that these changes are made, we can still goto panel-eDP file for
> the modes because of the below change from Sankeerth where the mode is
> hard-coded:
>
> https://patchwork.freedesktop.org/patch/473431/
>
> With this change cherry-picked it should work for kuogee. We will
> re-test that with this change.

I suppose he had both of the changes in the tree. Otherwise the
panel_edp_get_modes() wouldn't be called.

> >> Your commit text was mentioning about DP.
> >>
> >> For DP, for each controller in the catalog, we will call modeset_init()
> >> which should skip this part for DP
> >>
> >>     if (dp_display->panel_bridge) {
> >>           ret = drm_bridge_attach(dp_display->encoder,
> >>                       dp_display->panel_bridge, NULL,
> >
> > as you see, NULL is incorrect. It should be a pointer to dp_bridge instead
> >
> >>                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >>           if (ret < 0) {
> >>               DRM_ERROR("failed to attach panel bridge: %d\n", ret);
> >>               return ERR_PTR(ret);
> >>           }
> >>       }
> >>
> >> Followed by calling msm_dp_bridge_init() which will actually attach the
> >> bridge:
> >>
> >> drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >
> > And this bridge should be attached before the external bridge.
> >
> >>
> >> Now, even for 3 DP controllers, this shall be true as there will be 3
> >> separate encoders and 3 dp_displays and hence 3 drm_bridges.
> >>
> >> What am i missing here?
> >>
> >>>>
> >>>> So what are we achieving with this change?
> >>>>
> >>>>>
> >>>>>>
> >>>>>>>
> >>>>>>> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
> >>>>>>> enable and disable")
> >>>>>>> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>>>> ---
> >>>>>>
> >>>>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >>>>>>
> >>>>>>>     drivers/gpu/drm/msm/dp/dp_drm.c | 21 +++++++++++----------
> >>>>>>>     1 file changed, 11 insertions(+), 10 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c
> >>>>>>> b/drivers/gpu/drm/msm/dp/dp_drm.c
> >>>>>>> index d4d360d19eba..26ef41a4c1b6 100644
> >>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> >>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> >>>>>>> @@ -169,16 +169,6 @@ struct drm_connector
> >>>>>>> *dp_drm_connector_init(struct msm_dp *dp_display)
> >>>>>>>
> >>>>>>>            drm_connector_attach_encoder(connector, dp_display->encoder);
> >>>>>>>
> >>>>>>> -       if (dp_display->panel_bridge) {
> >>>>>>> -               ret = drm_bridge_attach(dp_display->encoder,
> >>>>>>> -                                       dp_display->panel_bridge, NULL,
> >>>>>>> -                                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >>>>>>> -               if (ret < 0) {
> >>>>>>> -                       DRM_ERROR("failed to attach panel bridge:
> >>>>>>> %d\n", ret);
> >>>>>>> -                       return ERR_PTR(ret);
> >>>>>>> -               }
> >>>>>>> -       }
> >>>>>>> -
> >>>>>>>            return connector;
> >>>>>>>     }
> >>>>>>>
> >>>>>>> @@ -246,5 +236,16 @@ struct drm_bridge *msm_dp_bridge_init(struct
> >>>>>>> msm_dp *dp_display, struct drm_devi
> >>>>>>>                    return ERR_PTR(rc);
> >>>>>>>            }
> >>>>>>>
> >>>>>>> +       if (dp_display->panel_bridge) {
> >>>>>>> +               rc = drm_bridge_attach(dp_display->encoder,
> >>>>>>> +                                       dp_display->panel_bridge,
> >>>>>>> bridge,
> >>>>>>> +                                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >>>>>>> +               if (rc < 0) {
> >>>>>>> +                       DRM_ERROR("failed to attach panel bridge:
> >>>>>>> %d\n", rc);
> >>>>>>> +                       drm_bridge_remove(bridge);
> >>>>>>> +                       return ERR_PTR(rc);
> >>>>>>> +               }
> >>>>>>> +       }
> >>>>>>> +
> >>>>>>>            return bridge;
> >>>>>>
> >>>>>> Not a problem with this patch, but what is this pointer used for? I see
> >>>>>> it's assigned to priv->bridges and num_bridges is incremented but nobody
> >>>>>> seems to look at that.
> >>>>>
> >>>>>
> >>>>> That's on my todo list. to remove connectors array and to destroy
> >>>>> created bridges during drm device destruction.
> >>>>>
> >>>
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
