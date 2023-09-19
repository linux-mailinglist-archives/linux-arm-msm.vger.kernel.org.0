Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1EBD7A5E92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Sep 2023 11:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbjISJug (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Sep 2023 05:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbjISJud (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Sep 2023 05:50:33 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F1D102
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Sep 2023 02:50:24 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-59c0281d72dso45245657b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Sep 2023 02:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695117023; x=1695721823; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wuzZSjTIbqsaJbuwHvoK1f5R5LgB3grDkNMH7fjrxE0=;
        b=VmjINvmH4BN/t/N2esE+wROWXqOqIrT+NHrImgRLeqAemdUnH6r4T8acbuwuTQvdZ2
         UDrM/7Lalmw/HCIuaf/ZIxydG0S53McptZ9wqGjbxUv7KhH0QKTzFzflOG7m63G7T4pd
         vXq5az3xTOzNJDSED5HhFZCRxMYjVp6lWMfwMt+GsXxOVml+Pi/meTb1K/swbtt9Zro9
         NOtKkgMk86PhWensXKcOpxulbGde6p/Vz+EHQV2JSHY2oyYyJbSGvnUIfqlHznpRiDAc
         QwlXaf10MkmQVKVCquDC+AWVvkMUMkQ++VWeT9ktdzNB93hp+grdgoCnUPfB1YLJ0UJZ
         ie4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695117023; x=1695721823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wuzZSjTIbqsaJbuwHvoK1f5R5LgB3grDkNMH7fjrxE0=;
        b=QeaQg2UZJ8fwWCqElrVsro3ZcNhAyvKS/1sBwlTOGDZTjB0VrxZxMugbfyrRLC1uCJ
         vzJzbVB/cZ1pjuM+9FyfoQ7R+cD7CQa+KH2BQwD/0MDzsULV75XmtANL5B6OBvU2/BbV
         r91QWmPFPp2BYKfdhJFJoX0vI22LCiI2vjyLyhR0niOmvV/BPNmmM8o8oVVz5ZZzwa8d
         OEi+mAhlTLpBfz/q6Iv9OgXAeyI0kVFFrwbsWzH+/d7RrZw8pYCfHp9FY5bWcRSvh6pU
         w3/AKxZ7CtPtyGHcQ9n1zcyBXUqZllMYmadTS/aOTYVofcYVgWF4YBRl4HX9teKP/sh2
         ZBwg==
X-Gm-Message-State: AOJu0Ywc9cxf9//0Ts6UcAzFXmHxLIsUpWrZw3kq+4LNwdzN5qSby+Mp
        X+CGvsqZBvz6eUhPOs7KxbzHddK7o9RnpdKG/EfuKQ==
X-Google-Smtp-Source: AGHT+IFiEdLEMjozmMGDm4MQSa6V1PjU/ezUpF88qM5J+vPAnjTAppGeVMAsZX0Vu0VjkJ01sBvsPZlhMy3KIRBPWCg=
X-Received: by 2002:a0d:eb0a:0:b0:59b:85c:404a with SMTP id
 u10-20020a0deb0a000000b0059b085c404amr12281921ywe.6.1695117023544; Tue, 19
 Sep 2023 02:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
 <1694813901-26952-7-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqPXoFX4LXyXYgfh07Vpxg-KgD8VBR6x5bXf4GOJmbOtw@mail.gmail.com> <2f98d5f1-57c1-d9fe-cb1c-b975db057287@quicinc.com>
In-Reply-To: <2f98d5f1-57c1-d9fe-cb1c-b975db057287@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 19 Sep 2023 12:50:12 +0300
Message-ID: <CAA8EJpr2wRq6Txi7YAQpJKa_9UGqH_nmHzvVOaAPkwOrtDg4Tw@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] drm/msm/dp: add pm_runtime_force_suspend()/resume()
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org, quic_abhinavk@quicinc.com,
        quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com,
        marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 18 Sept 2023 at 20:48, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 9/15/2023 6:21 PM, Dmitry Baryshkov wrote:
> > On Sat, 16 Sept 2023 at 00:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> Add pm_runtime_force_suspend()/resume() to complete incorporating pm
> >> runtime framework into DP driver. Both dp_pm_prepare() and dp_pm_complete()
> >> are added to set hpd_state to correct state. After resume, DP driver will
> >> re training its main link after .hpd_enable() callback enabled HPD
> >> interrupts and bring up display accordingly.
> > How will it re-train the main link? What is the code path for that?
>
> 1) for edp, dp_bridge_atomic_enable(), called from framework, to start
> link training and bring up display.

And this path doesn't use .hpd_enable() which you have mentioned in
the commit message. Please don't try to shorten the commit message.
You see, I have had questions to several of them, which means that
they were not verbose enough.

>
> 2) for external DP, HPD_PLUG_INT will be generated to start link
> training and bring up display.

This should be hpd_notify, who starts link training, not some event.

>
> >
> > I think this is a misuse for prepare/complete callbacks, at least
> > judging from their documentation.
>
> 1) dp_pm_prepare() is called to make sure eDP/DP related power/clocks
> are off and set hpd_state  to ST_SUSPENDED and nothing else.
>
> 2) dp_pm_completed() is called to set hpd_state to ST_ST_DISCONNECTED
> (default state) and nothing else.
>
> I think both are doing proper action.

Have you read the prepare() / complete() documentation? Does your
usage follow the documented use case?

>
>
> >
> >> Changes in v3:
> >> -- replace dp_pm_suspend() with pm_runtime_force_suspend()
> >> -- replace dp_pm_resume() with pm_runtime_force_resume()
> >>
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_display.c | 87 +++++--------------------------------
> >>   1 file changed, 10 insertions(+), 77 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index b6992202..b58cb02 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -1333,101 +1333,35 @@ static int dp_pm_runtime_resume(struct device *dev)
> >>          return 0;
> >>   }
> >>
> >> -static int dp_pm_resume(struct device *dev)
> >> +static void dp_pm_complete(struct device *dev)
> >>   {
> >> -       struct platform_device *pdev = to_platform_device(dev);
> >> -       struct msm_dp *dp_display = platform_get_drvdata(pdev);
> >> -       struct dp_display_private *dp;
> >> -       int sink_count = 0;
> >> -
> >> -       dp = container_of(dp_display, struct dp_display_private, dp_display);
> >> +       struct dp_display_private *dp = dev_get_dp_display_private(dev);
> >>
> >>          mutex_lock(&dp->event_mutex);
> >>
> >>          drm_dbg_dp(dp->drm_dev,
> >> -               "Before, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
> >> +               "type=%d core_inited=%d phy_inited=%d power_on=%d\n",
> >>                  dp->dp_display.connector_type, dp->core_initialized,
> >> -               dp->phy_initialized, dp_display->power_on);
> >> +               dp->phy_initialized, dp->dp_display.power_on);
> >>
> >>          /* start from disconnected state */
> >>          dp->hpd_state = ST_DISCONNECTED;
> >>
> >> -       /* turn on dp ctrl/phy */
> >> -       dp_display_host_init(dp);
> >> -
> >> -       if (dp_display->is_edp)
> >> -               dp_catalog_ctrl_hpd_enable(dp->catalog);
> >> -
> >> -       if (dp_catalog_link_is_connected(dp->catalog)) {
> >> -               /*
> >> -                * set sink to normal operation mode -- D0
> >> -                * before dpcd read
> >> -                */
> >> -               dp_display_host_phy_init(dp);
> >> -               dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> >> -               sink_count = drm_dp_read_sink_count(dp->aux);
> >> -               if (sink_count < 0)
> >> -                       sink_count = 0;
> >> -
> >> -               dp_display_host_phy_exit(dp);
> >> -       }
> >> -
> >> -       dp->link->sink_count = sink_count;
> >> -       /*
> >> -        * can not declared display is connected unless
> >> -        * HDMI cable is plugged in and sink_count of
> >> -        * dongle become 1
> >> -        * also only signal audio when disconnected
> >> -        */
> >> -       if (dp->link->sink_count) {
> >> -               dp->dp_display.link_ready = true;
> >> -       } else {
> >> -               dp->dp_display.link_ready = false;
> >> -               dp_display_handle_plugged_change(dp_display, false);
> >> -       }
> >> -
> >> -       drm_dbg_dp(dp->drm_dev,
> >> -               "After, type=%d sink=%d conn=%d core_init=%d phy_init=%d power=%d\n",
> >> -               dp->dp_display.connector_type, dp->link->sink_count,
> >> -               dp->dp_display.link_ready, dp->core_initialized,
> >> -               dp->phy_initialized, dp_display->power_on);
> >> -
> >>          mutex_unlock(&dp->event_mutex);
> >> -
> >> -       return 0;
> >>   }
> >>
> >> -static int dp_pm_suspend(struct device *dev)
> >> +static int dp_pm_prepare(struct device *dev)
> >>   {
> >> -       struct platform_device *pdev = to_platform_device(dev);
> >> -       struct msm_dp *dp_display = platform_get_drvdata(pdev);
> >> -       struct dp_display_private *dp;
> >> -
> >> -       dp = container_of(dp_display, struct dp_display_private, dp_display);
> >> +       struct dp_display_private *dp = dev_get_dp_display_private(dev);
> >>
> >>          mutex_lock(&dp->event_mutex);
> >>
> >> -       drm_dbg_dp(dp->drm_dev,
> >> -               "Before, type=%d core_inited=%d  phy_inited=%d power_on=%d\n",
> >> -               dp->dp_display.connector_type, dp->core_initialized,
> >> -               dp->phy_initialized, dp_display->power_on);
> >> -
> >>          /* mainlink enabled */
> >>          if (dp_power_clk_status(dp->power, DP_CTRL_PM))
> >>                  dp_ctrl_off_link_stream(dp->ctrl);
> >>
> >> -       dp_display_host_phy_exit(dp);
> >> -
> >> -       /* host_init will be called at pm_resume */
> >> -       dp_display_host_deinit(dp);
> >> -
> >>          dp->hpd_state = ST_SUSPENDED;
> >>
> >> -       drm_dbg_dp(dp->drm_dev,
> >> -               "After, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
> >> -               dp->dp_display.connector_type, dp->core_initialized,
> >> -               dp->phy_initialized, dp_display->power_on);
> >> -
> >>          mutex_unlock(&dp->event_mutex);
> >>
> >>          return 0;
> >> @@ -1435,8 +1369,10 @@ static int dp_pm_suspend(struct device *dev)
> >>
> >>   static const struct dev_pm_ops dp_pm_ops = {
> >>          SET_RUNTIME_PM_OPS(dp_pm_runtime_suspend, dp_pm_runtime_resume, NULL)
> >> -       .suspend = dp_pm_suspend,
> >> -       .resume =  dp_pm_resume,
> >> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> >> +                                pm_runtime_force_resume)
> >> +       .prepare = dp_pm_prepare,
> >> +       .complete = dp_pm_complete,
> >>   };
> >>
> >>   static struct platform_driver dp_display_driver = {
> >> @@ -1670,9 +1606,6 @@ void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
> >>
> >>          dp_display = container_of(dp, struct dp_display_private, dp_display);
> >>
> >> -       if (dp->is_edp)
> >> -               dp_hpd_unplug_handle(dp_display, 0);
> >> -
> >>          mutex_lock(&dp_display->event_mutex);
> >>
> >>          state = dp_display->hpd_state;
> >> --
> >> 2.7.4
> >>
> >



-- 
With best wishes
Dmitry
