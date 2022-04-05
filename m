Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCA3D4F4BC6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 03:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349066AbiDEXFK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Apr 2022 19:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1573706AbiDETuA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 15:50:00 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F8901408D
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 12:48:01 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id a17-20020a9d3e11000000b005cb483c500dso256606otd.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 12:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=iJPD9APzDqLjV+qOf9rpHBZiLlNyWx7WzJ1mV8UJe7c=;
        b=T1SO1Fz8TMPvB4YbIVayaKmOpzcbPI4uhFO6kGD5j3HJ59Foh+JcCdORHlXxNcIp4M
         ZRmNdNuLv2/hIhMjYpHLvwxRgzsdd0tVTV0FlesVlNWEbpgqofyxQUWkVDB398yx/KQa
         /szIDDLfRGu/b2gi8ib21FLRu7/H7mSRXrwrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=iJPD9APzDqLjV+qOf9rpHBZiLlNyWx7WzJ1mV8UJe7c=;
        b=c01Api3y3ziLezWehAkAH35G3uxTKZ5c34uSiq9N3i21GnTeCj7JwaN6c8/zMAZBJt
         Nt3/dJvAdzaXEvUSj2S/ryIhcxUJq08vqhd5bGul53l7n9eEphyGKQ+CD4iR/vqkABUx
         2lVl/12XW53txvn++hXaqxMDUY+1mjTB6oVh0/S3mSsZI6z+s32nb5QnlDcEKaz8tdh8
         iaYpCDstgtoFEfC+sJ8hmwElZP/J29Icn8a1EvlFp6WRIwyOJBGYYsD6G9kb+hchK9n6
         Grm2bYW6n3ukOEcBs4WPq0wYwHBSjUPW8ZTdyaD3mBomAw9ogiSebbhNzRz5TgDfaA6P
         WSVQ==
X-Gm-Message-State: AOAM531sv6q3ErvyUeMd9C0GzU5D6WNr0pu7cXNwSpdCTyNHh7QNBvwx
        7LdPM9L/RJUs+Z/rqb49f1+fYA1pzXGOQE10aRS+5A==
X-Google-Smtp-Source: ABdhPJwR0A33UiSi8THY8lPeRPmOOiXc6cK6GctfIZWfsKcwOKJxED9C+HA79JYDyXPCBgczoDzz7MJSwix/UYHlFvY=
X-Received: by 2002:a05:6830:61b:b0:5cc:e44:7dc3 with SMTP id
 w27-20020a056830061b00b005cc0e447dc3mr1771528oti.159.1649188080802; Tue, 05
 Apr 2022 12:48:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Apr 2022 14:48:00 -0500
MIME-Version: 1.0
In-Reply-To: <1649182627-8068-1-git-send-email-quic_khsieh@quicinc.com>
References: <1649182627-8068-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 5 Apr 2022 14:48:00 -0500
Message-ID: <CAE-0n50OYgSfhMcw2N_dd8LzxBXxoGhb0ToASsHGY=VPDa0zVg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: enhance both connect and disconnect
 pending_timeout handle
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-04-05 11:17:07)
> HPD plugin handle is responsible for setting up main link and depend on

Is "HPD plugin handle" a function? Can you use the function name?

> user space frame work to start video stream. Similarly, HPD unplugged
> handle is responsible for tearing down main link and depend on user space
> frame work to stop video stream. Connect_pending_timeout and disconnect_

Is 'Connect_pending_timeout' actually 'dp_connect_pending_timeout()'? If
so, it would be clearer if the function name is used.

> pending_timeout are fired after 5 seconds timer expired to tear down main
> link and video stream and restore DP driver state into known default
> DISCONNECTED state in the case of frame work does not response uevent

s/frame work/framework/
s/response/respond to/

> original from DP driver so that DP driver can recover gracefully.

This part of the sentence doesn't make sense to me.

>
> The original connect_pending_timeout and disconnect_pending_timeout were
> not implemented correctly. This patch enhance both timeout functions to

s/enhance/fixes/

> tear down main link and video stream correctly once timer is fired.
>
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
>

Nitpick: Drop newline.

> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 34 ++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
>  drivers/gpu/drm/msm/dp/dp_display.c | 48 +++++++++++++++++++++++++++----------
>  3 files changed, 68 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index dcd0126..3f4cf6d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1910,7 +1910,7 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>         return ret;
>  }
>
> -int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
> +int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
>  {
>         struct dp_ctrl_private *ctrl;
>         struct dp_io *dp_io;
> @@ -1926,7 +1926,37 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>
>         dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>
> -       dp_catalog_ctrl_reset(ctrl->catalog);
> +       ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
> +       if (ret) {
> +               DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
> +       }
> +
> +       DRM_DEBUG_DP("Before, phy=%x init_count=%d power_on=%d\n",
> +               (u32)(uintptr_t)phy, phy->init_count, phy->power_count);

Please don't recast pointer prints with %x. Use %p to print pointers.

> +
> +       phy_power_off(phy);
> +
> +       DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
> +               (u32)(uintptr_t)phy, phy->init_count, phy->power_count);

It doesn't look good to be peeking inside struct phy. I wonder why that
isn't an opaque struct. Either way, please don't print the struct
members.

> +
> +       return ret;
> +}
> +
> +int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
> +{
> +       struct dp_ctrl_private *ctrl;
> +       struct dp_io *dp_io;
> +       struct phy *phy;
> +       int ret = 0;

Drop useless assignment please

> +
> +       if (!dp_ctrl)

How is this possible? Please remove useless checks.

> +               return -EINVAL;
> +
> +       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +       dp_io = &ctrl->parser->io;
> +       phy = dp_io->phy;
> +
> +       dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>
>         ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, false);
>         if (ret)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 178b774..56bf7c5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -593,10 +593,16 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
>
>         mutex_lock(&dp->event_mutex);
>
> +       /*
> +        * main link had been setup but video is not ready yet
> +        * only tear down main link
> +        */
>         state = dp->hpd_state;
>         if (state == ST_CONNECT_PENDING) {
> -               dp->hpd_state = ST_CONNECTED;
>                 DRM_DEBUG_DP("type=%d\n", dp->dp_display.connector_type);
> +               dp_ctrl_off_link(dp->ctrl);
> +               dp_display_host_phy_exit(dp);
> +               dp->hpd_state = ST_DISCONNECTED;
>         }
>
>         mutex_unlock(&dp->event_mutex);
> @@ -645,6 +651,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>                 if (dp->link->sink_count == 0) {
>                         dp_display_host_phy_exit(dp);
>                 }
> +               dp_display_usbpd_disconnect_cb(&dp->pdev->dev);

The name of this function is very confusing. It would be nice to rename
it to something like dp_display_notify_disconnect() and skip

>                 mutex_unlock(&dp->event_mutex);
>                 return 0;
>         }
> @@ -661,19 +668,19 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>                 return 0;
>         }
>
> -       dp->hpd_state = ST_DISCONNECT_PENDING;
> -
>         /* disable HPD plug interrupts */
>         dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
>
> -       /*
> -        * We don't need separate work for disconnect as
> -        * connect/attention interrupts are disabled
> -        */

Why is this comment removed? Because a work is actually used? Why can't
we call dp_display_send_hpd_notification() directly?

>         dp_display_usbpd_disconnect_cb(&dp->pdev->dev);
>
> -       /* start sentinel checking in case of missing uevent */
> -       dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
> +       if (state == ST_DISPLAY_OFF) {
> +               dp->hpd_state = ST_DISCONNECTED;
> +

Drop extra newline please

> +       } else {
> +               /* start sentinel checking in case of missing uevent */
> +               dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
> +               dp->hpd_state = ST_DISCONNECT_PENDING;

It looks like dp_add_event() should check the event and change
dp->hpd_state sometimes. Then this code would be simply adding an event
and dp_add_event() would be changing the hpd_state while scheduling the
work.

> +       }
>
>         /* signal the disconnect event early to ensure proper teardown */
>         dp_display_handle_plugged_change(&dp->dp_display, false);
> @@ -695,10 +702,16 @@ static int dp_disconnect_pending_timeout(struct dp_display_private *dp, u32 data
>
>         mutex_lock(&dp->event_mutex);
>
> +       /*
> +        * main link had been set up and video is ready
> +        * tear down main link, video stream and phy

because disconnect event never came and we need to get back to a default
sane state?

> +        */
>         state =  dp->hpd_state;
>         if (state == ST_DISCONNECT_PENDING) {
> -               dp->hpd_state = ST_DISCONNECTED;
>                 DRM_DEBUG_DP("type=%d\n", dp->dp_display.connector_type);
> +               dp_ctrl_off(dp->ctrl);
> +               dp_display_host_phy_exit(dp);
> +               dp->hpd_state = ST_DISCONNECTED;
>         }
>
>         mutex_unlock(&dp->event_mutex);
> @@ -1571,6 +1584,12 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>
>         mutex_lock(&dp_display->event_mutex);
>
> +       state =  dp_display->hpd_state;

s/=  /= /

Drop extra space after '=' please.

> +       if (state == ST_DISCONNECTED) {
> +               mutex_unlock(&dp_display->event_mutex);
> +               return rc;
> +       }
> +
>         /* stop sentinel checking */
>         dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
>
> @@ -1588,8 +1607,6 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>                 return rc;
>         }
>
> -       state =  dp_display->hpd_state;
> -
>         if (state == ST_DISPLAY_OFF)
>                 dp_display_host_phy_init(dp_display);
>
> @@ -1638,13 +1655,18 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
>         /* stop sentinel checking */
>         dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
>
> +       state =  dp_display->hpd_state;

s/=  /= /

Drop extra space after '=' please.

> +       if (state == ST_DISCONNECTED || state == ST_DISPLAY_OFF) {
> +               mutex_unlock(&dp_display->event_mutex);
> +               return rc;
> +       }
> +
>         dp_display_disable(dp_display, 0);
>
>         rc = dp_display_unprepare(dp);
>         if (rc)
>                 DRM_ERROR("DP display unprepare failed, rc=%d\n", rc);
>
> -       state =  dp_display->hpd_state;
>         if (state == ST_DISCONNECT_PENDING) {
>                 /* completed disconnection */
>                 dp_display->hpd_state = ST_DISCONNECTED;
