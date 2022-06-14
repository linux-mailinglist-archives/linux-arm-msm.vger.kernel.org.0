Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9D8954AC1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jun 2022 10:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355436AbiFNIjc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jun 2022 04:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356241AbiFNIjE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jun 2022 04:39:04 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0992E43EF4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jun 2022 01:38:12 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1014b2752c1so4624914fac.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jun 2022 01:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=utIOJeHG0w8xs3SdDFyTFAYjLdnYVwoFoYTnpKxafwQ=;
        b=PpOH0MNv6SWnsCve6x76GZ2a7kc2QZ0KWbrdW6PwdMuxBBXd7x7jmWZJ9Why9wWUlZ
         mo3tuBIoV7efRGdIejyHvqTtg//3/Ea/6842v6XznIBCTIdLIF5P0UHz/RWKAikYCH6T
         z60XTX8aSPx5UJmA8TfiQvgJ/E9L0dM3B9oBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=utIOJeHG0w8xs3SdDFyTFAYjLdnYVwoFoYTnpKxafwQ=;
        b=2UII81IgigthaUJPMRsoY4Rfkl4QiofjG3yFZSIJoNTaPRzOWBhiiAEH4EnXO98aw5
         Ybu6QRvWtzxZXZCoTHjkqRyBJThPFANFhfFo1ElD2IBNrr8EgofMH3j4w95/beTBMfh9
         knnXE/LwKiLeP7GSCXT1cHr+/qHZ+2R0aY7jzpTdwIPIcyK1b1pW2G8CB+wcpFcNOz7i
         vkOEso2hJ9LFd9chm2Ws0est6KQDoQ4wDGiqPsrbVBq6Xoe9JJp+ZSZejQfWXOulyNUq
         woB0QDnUwVcD85LhtOWkZXI6C7wCPO3OxIISlpts96F2VerXfeAGFQUv8hfNxbMsoA/J
         zA1A==
X-Gm-Message-State: AJIora/u9EyKfs1tz+c+uSx7uK3WYnobqHjA7aCskSvisezVRKAEVWB6
        GTxFnH3JC+40Wqa0f+QZA7lXGbPJ4bLOOszbvvxuyg==
X-Google-Smtp-Source: AGRyM1tIQCOd0lHpGAf9UboG4z86U6be0GMGv1Fy2kiXMRApvUT1XTQs3EslrPM7sbRGeKYe8XQa6rgpoSs+KeBwBEQ=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr1683897oap.63.1655195889918; Tue, 14 Jun
 2022 01:38:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 Jun 2022 01:38:09 -0700
MIME-Version: 1.0
In-Reply-To: <1655156917-21726-1-git-send-email-quic_khsieh@quicinc.com>
References: <1655156917-21726-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 14 Jun 2022 01:38:09 -0700
Message-ID: <CAE-0n50Z92PM+j7S_wmTeLcmu5cVO3YBT+viLeoLs5QhgXZMoA@mail.gmail.com>
Subject: Re: [PATCH v5] drm/msm/dp: force link training for display resolution change
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-06-13 14:48:37)
> During display resolution changes display have to be disabled first
> followed by display enabling with new resolution. Display disable
> will turn off both pixel clock and main link clock so that main link
> have to be re-trained during display enable to have new video stream
> flow again. At current implementation, display enable function manually
> kicks up irq_hpd_handle which will read panel link status and start link
> training if link status is not in sync state. However, there is rare
> case that a particular panel links status keep staying in sync for
> some period of time after main link had been shut down previously at
> display disabled. Main link retraining will not be executed by
> irq_hdp_handle() if the link status read from panel shows it is in
> sync state. If this was happen, then video stream of newer display
> resolution will fail to be transmitted to panel due to main link is
> not in sync between host and panel. This patch force main link always
> be retrained during display enable procedure to prevent this rare
> failed case from happening. Also this implementation are more
> efficient than manual kicking off irq_hpd_handle function.

How is resolution change different from disabling and enabling the
display? The commit text talks about resolution changes, but the code
doesn't compare resolutions from before and after to know when to
retrain the link. Can the code be made to actually do what the commit
text says? It would be clearer if the code looked for actual resolution
changes instead of hooking the dp_bridge_enable() function.

>
> Changes in v2:
> -- set force_link_train flag on DP only (is_edp == false)
>
> Changes in v3:
> -- revise commit  text
> -- add Fixes tag
>
> Changes in v4:
> -- revise commit  text
>
> Changes in v5:
> -- fix spelling at commit text
>
> Fixes: 62671d2ef24b ("drm/msm/dp: fixes wrong connection state caused by failure of link train")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  6 +++---
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
>  3 files changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index af7a80c..bea93eb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1551,7 +1551,7 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
>
>         ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
>         if (!ret)
> -               ret = dp_ctrl_on_stream(&ctrl->dp_ctrl);
> +               ret = dp_ctrl_on_stream(&ctrl->dp_ctrl, false);

Does this even matter if it's true or false? The 'sink_request' has
DP_TEST_LINK_PHY_TEST_PATTERN set from what I can tell, and then
dp_ctrl_on_stream() bails out before calling dp_ctrl_link_retrain()
anyway. It would be nice if we could split dp_ctrl_on_stream() so that
the part after the check for the sink request is a different function
that is called by dp_display.c and then this code can call the 'prepare'
function that does the first part. Then we can ignore the testing path
in the code, and possibly remove the conditional in dp_ctrl_on_stream()?

>         else
>                 DRM_ERROR("failed to enable DP link controller\n");
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c388323..370348d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -872,7 +872,7 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
>                 return 0;
>         }
>
> -       rc = dp_ctrl_on_stream(dp->ctrl);
> +       rc = dp_ctrl_on_stream(dp->ctrl, data);
>         if (!rc)
>                 dp_display->power_on = true;
>
> @@ -1654,6 +1654,7 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>         int rc = 0;
>         struct dp_display_private *dp_display;
>         u32 state;
> +       bool force_link_train = false;
>
>         dp_display = container_of(dp, struct dp_display_private, dp_display);
>         if (!dp_display->dp_mode.drm_mode.clock) {
> @@ -1688,10 +1689,14 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>
>         state =  dp_display->hpd_state;
>
> -       if (state == ST_DISPLAY_OFF)
> +       if (state == ST_DISPLAY_OFF) {
>                 dp_display_host_phy_init(dp_display);
>
> -       dp_display_enable(dp_display, 0);
> +               if (!dp->is_edp)

I didn't see any answer to my question about why edp is special on v4.
Can you at least add a comment to the code about why edp doesn't need to
unconditionally retrain, but DP does?

> +                       force_link_train = true;
> +       }
> +
> +       dp_display_enable(dp_display, force_link_train);
>
>         rc = dp_display_post_enable(dp);
>         if (rc) {
