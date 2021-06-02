Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6358397E53
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 04:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbhFBCBu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 22:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbhFBCBu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 22:01:50 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F05EC061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jun 2021 19:00:07 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id c31-20020a056830349fb02903a5bfa6138bso1127157otu.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jun 2021 19:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=dEnLLx1tkRZoNKWtmVCz6hV85sEb57r1guLX8xpZjyo=;
        b=g6GirZuUiOk5ToppH7B4pWFsZdHwFM+mqHbMV3kUzl/EKBopUUPpTXsK+vJ8rcTO0B
         kFJa6AVebp/mYmG3+IR+zG/kCXhWEk3ZlfgeUIqS9kuQhY9U75I5A/KqWIjSwzicHfsF
         wgoM44oOLVW/400gxKU0C97CgTsIkHlkjkxXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=dEnLLx1tkRZoNKWtmVCz6hV85sEb57r1guLX8xpZjyo=;
        b=RhKyMzt5lzefomjUiFZy/v2xIDhYfSaTYpirgiKYZBRKAWMy+y9PPLcDnHJAJFvclv
         yaHMQynnMhGon6D18ohQYxn2vYGpLr3yX4B8du5Bjzng5uH9vqUMOP0K1s2Lq0n+ewKs
         XHN2YEsKgg3qLZl+6bKllcDVYmGTJsSICYw6f9NfuqJyB1OXTKrJDQOrRs5ffDizmmyK
         RV7u0Csv+R+qziunm1GUT1nuoWNRKT4N2H2ugmcL9nIvOelr98RZYTn4BmB09cILmBBm
         wpt6lWnUxowfARAN6mARYbp09oBUIxYdBxC3ORQph+LyCgU+SHrwKjOgMoeTCuRnTBe3
         0ebw==
X-Gm-Message-State: AOAM530uWvxb3N20Hrrg+4TSZHlQyWAAR+nrdHtfGxaVL5dSrFP1Chpq
        tGZ5hv38Vh3LefEcGhBjk+mo/metsmHPFFp1QVJPpg==
X-Google-Smtp-Source: ABdhPJyx3D5dt9HhEl4vjIYswJL7/b+W9JLEakEh7TMCg3c3Iq0lypuLPEbmafmsmlf4YjeBaSV75iQt/60XKjuXHsU=
X-Received: by 2002:a9d:18e:: with SMTP id e14mr5051666ote.34.1622599206303;
 Tue, 01 Jun 2021 19:00:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Jun 2021 19:00:05 -0700
MIME-Version: 1.0
In-Reply-To: <1622591408-5465-1-git-send-email-khsieh@codeaurora.org>
References: <1622591408-5465-1-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 1 Jun 2021 19:00:05 -0700
Message-ID: <CAE-0n52wAmQ1ZZ0pfGfXwsM23D+R5FFVBrpzr1a8YGDdWNb_gw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: power off DP phy at suspend
To:     Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Please add dri-devel@lists.freedesktop.org next time

Quoting Kuogee Hsieh (2021-06-01 16:50:08)
> Normal DP suspend operation contains two steps, display off followed
> by dp suspend, to complete system wide suspending cycle if display is
> up at that time. In this case, DP phy will be powered off at display
> off. However there is an exception case that depending on the timing
> of dongle plug in during system wide suspending, sometimes display off
> procedure may be skipped and dp suspend was called directly. In this
> case, dp phy is stay at powered on (phy->power_count = 1) so that at
> next resume dp driver crash at main link clock enable due to phy is
> not physically powered on. This patch will call dp_ctrl_off_link_stream()
> to tear down main link and power off phy at dp_pm_suspend() if main link
> had been brought up.
>
> Changes in V2:
> -- stashed changes into dp_ctrl.c
> -- add is_phy_on to monitor phy state
>
> Changes in V3:
> -- delete is_phy_on
> -- call dp_ctrl_off_link_stream() from dp_pm_suspend()
>
> Fixes: 0114f31a2903 ("drm/msm/dp: handle irq_hpd with sink_count = 0 correctly)
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 10 +++++++++-
>  drivers/gpu/drm/msm/dp/dp_display.c |  4 +++-
>  drivers/gpu/drm/msm/dp/dp_power.c   | 15 +++++++++++++++
>  3 files changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index dbd8943..8324a453 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1414,6 +1414,7 @@ void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
>         phy = dp_io->phy;
>
>         dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
> +
>         phy_exit(phy);
>
>         DRM_DEBUG_DP("Host deinitialized successfully\n");
> @@ -1457,6 +1458,7 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
>                 return ret;
>         }
>         phy_power_off(phy);
> +
>         /* hw recommended delay before re-enabling clocks */
>         msleep(20);
>
> @@ -1488,6 +1490,7 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
>         }
>
>         phy_power_off(phy);
> +
>         phy_exit(phy);
>
>         return 0;

None of these hunks are useful. Can we drop them?

> @@ -1816,12 +1819,16 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>         struct dp_ctrl_private *ctrl;
>         struct dp_io *dp_io;
>         struct phy *phy;
> -       int ret;
> +       int ret = 0;

Drop this.

>
>         ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>         dp_io = &ctrl->parser->io;
>         phy = dp_io->phy;
>
> +       /* main link is off */
> +       if (!dp_power_clk_status(ctrl->power, DP_CTRL_PM))
> +               return ret;

and then return 0?

> +
>         /* set dongle to D3 (power off) mode */
>         dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
>
> @@ -1894,6 +1901,7 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>         }
>
>         phy_power_off(phy);
> +
>         phy_exit(phy);
>
>         DRM_DEBUG_DP("DP off done\n");

Drop?

> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index cdec0a3..5abd769 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1327,8 +1327,10 @@ static int dp_pm_suspend(struct device *dev)
>
>         mutex_lock(&dp->event_mutex);
>
> -       if (dp->core_initialized == true)
> +       if (dp->core_initialized == true) {
> +               dp_ctrl_off_link_stream(dp->ctrl);

Why not just check here for dp_power_clk_status()?

>                 dp_display_host_deinit(dp);
> +       }
>
>         dp->hpd_state = ST_SUSPENDED;
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
> index 9c4ea00..980924a9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.c
> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> @@ -262,6 +262,21 @@ int dp_power_clk_enable(struct dp_power *dp_power,
>                         }
>                         dp_power->core_clks_on = true;
>                 }
> +       } else {
> +               if (pm_type == DP_CORE_PM && !dp_power->core_clks_on) {
> +                       DRM_DEBUG_DP("core clks already disabled\n");
> +                       return 0;
> +               }
> +
> +               if (pm_type == DP_CTRL_PM && !dp_power->link_clks_on) {
> +                       DRM_DEBUG_DP("links clks already disabled\n");
> +                       return 0;
> +               }
> +
> +               if (pm_type == DP_STREAM_PM && !dp_power->stream_clks_on) {
> +                       DRM_DEBUG_DP("pixel clks already disabled\n");
> +                       return 0;
> +               }
>         }

If this happens isn't something wrong? Like we've somehow lost track of
the proper state and no we're trying to disable clks when we don't need
to. And given that clks already manage their own refcount that would be
pretty obvious if it went wrong

>
>         rc = dp_power_clk_set_rate(power, pm_type, enable);
