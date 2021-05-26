Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0353922BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 May 2021 00:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234414AbhEZWbo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 18:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234201AbhEZWbm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 18:31:42 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CABADC06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 15:30:10 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so2595356oto.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 15:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=bLv+JsKXeZGaaykGI4ifZQ2oax0+vSb1bwQWj+u5YH8=;
        b=cRhdaJHuD13kZGm9e4s/RfE6p5NXYn1cfcXxi7bNz9ZNYYSEjrxqXpg3fzrNo0aYmA
         edMmNYKj443cY/lnSbNiBAZVvmdUbalCwTGzDOaO4v2VPaF8niLktvm5jnx/fuhFURmP
         zrxk8uy43rVsYn7Wm2i+g6NCHFI7w9Qe6dNiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=bLv+JsKXeZGaaykGI4ifZQ2oax0+vSb1bwQWj+u5YH8=;
        b=tOyvydVucvaIlKP9QyPrf8jyYxVlUggyvm2e/vxEax76r18wL/KdrU+GewqktK0K5S
         D/aHht7Us5qnw4uN71aXjDTWiASt+nhqVxzzu9mjJA26jq+/T3m2QFqvG86aFu9Kp1yR
         aa15qH2MmCFiIlk2AN2BJBt6bi/rIIA2vM5Ztp6sy4KiT9ql1HH36dzGdAbMQfvpwbIz
         IXDAuEv3t9r3KZWkt6Ih2SUIYX5rcPxP9xuXeidlamozQwu7olWgZeQ8PmV2bd3gxGfn
         NBz/TRDhVrC2jQZN6v51wjTCAp4mS/wo6TAZL0BSlt/IMCbc10sRHAUNClAzCtCtFt6T
         Gb+A==
X-Gm-Message-State: AOAM533i41xV5skIhnO3/LpMlxUQ6O/YAcFDZyEKfswA56KeuoBnDcEQ
        iKT3apZRyXgkDx4IDrCV6rJqaL/H7hDhz7ctUlBQOQ==
X-Google-Smtp-Source: ABdhPJw0ZuSJ/bjsKrYTN4B3XofuVZOOvkQYChRi9Nenqb7Nei3nN+IOoKd3TCNXOMRC4TipVVgBy8OTUqzBnAXk5BY=
X-Received: by 2002:a05:6830:1f51:: with SMTP id u17mr421146oth.25.1622068209699;
 Wed, 26 May 2021 15:30:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 May 2021 18:30:09 -0400
MIME-Version: 1.0
In-Reply-To: <1622052503-21158-1-git-send-email-khsieh@codeaurora.org>
References: <1622052503-21158-1-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 26 May 2021 18:30:09 -0400
Message-ID: <CAE-0n53bGm4T7SE8sJWFgCbCs2uRYwKrXHxmKQ-0zHXQJpPKdw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: power off DP phy base on mainlink status at suspend
To:     Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-05-26 11:08:23)
> DP mainlink can be either enabled or disabled at the time of suspend
> happen. Therefore DP phy teared down at suspend should base on mainlink
> status at that instance.

Please add some more details here. The system crashes if you plug in the
HDMI cable during system wide suspend. That seems to be because the DP
phy isn't powered down during suspend if the HDMI cable is disconnected
so we try to process the hpd plug event on the path to suspend instead
of wait to bring up the phy and then the display?

I'm trying to find the case when we would be entering suspend and only
have called phy_init() without calling phy_exit(). What path is that? I
guess it is dp_ctrl_off_link_stream() called when the sink count goes to
0? So plug in HDMI cable to apple dongle, unplug HDMI cable to apple
dongle and phy_power_off() followed by phy_exit() followed by phy_init()
and then enter suspend so we want to call phy_exit(). Then we only call
phy_power_off() if we've called dp_ctrl_on()? I think I followed it all.

>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 5 ++++-
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    | 2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 ++++++++-
>  3 files changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index dbd8943..5115c05 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1398,7 +1398,7 @@ int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
>   * Perform required steps to uninitialize DP controller
>   * and its resources.
>   */
> -void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
> +void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl, bool mainlink_on)
>  {
>         struct dp_ctrl_private *ctrl;
>         struct dp_io *dp_io;
> @@ -1414,6 +1414,9 @@ void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
>         phy = dp_io->phy;
>
>         dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
> +       if (mainlink_on)
> +               phy_power_off(phy);
> +
>         phy_exit(phy);
>
>         DRM_DEBUG_DP("Host deinitialized successfully\n");
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 25e4f75..a23ee2b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -20,7 +20,7 @@ struct dp_ctrl {
>  };
>
>  int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset);
> -void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl);
> +void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl, bool mainlink_on);
>  int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
>  int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
>  int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index cdec0a3..88eeeb5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -104,6 +104,8 @@ struct dp_display_private {
>
>         bool encoder_mode_set;
>
> +       bool mainlink_on;
> +

Is there a reason why this can't be stashed away in dp_ctrl.c in the
'struct dp_ctrl'? It seems to follow closely with dp_ctrl_*() APIs.

>         /* wait for audio signaling */
>         struct completion audio_comp;
>
> @@ -353,11 +355,14 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>         dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>
>         dp_link_reset_phy_params_vx_px(dp->link);
> +
> +       dp->mainlink_on = false;

Isn't this too late to be setting it to false? i.e. it should be false
by default, and then set to false when a dp_ctrl_off() call is made?

>         rc = dp_ctrl_on_link(dp->ctrl);
>         if (rc) {
>                 DRM_ERROR("failed to complete DP link training\n");
>                 goto end;
>         }
> +       dp->mainlink_on = true;
>
>         dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>
> @@ -392,7 +397,7 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
>                 return;
>         }
>
> -       dp_ctrl_host_deinit(dp->ctrl);
> +       dp_ctrl_host_deinit(dp->ctrl, dp->mainlink_on);
>         dp_aux_deinit(dp->aux);
>         dp_power_deinit(dp->power);
>
> @@ -941,6 +946,8 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
>                 dp->core_initialized = false;
>         }
>
> +       dp->mainlink_on = false;
> +
>         dp_display->power_on = false;
>
>         return 0;

It would certainly help to keep it contained to one file instead of two.
