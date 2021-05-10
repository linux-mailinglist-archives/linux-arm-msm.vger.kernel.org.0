Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 120413796E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 May 2021 20:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhEJSQX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 May 2021 14:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbhEJSQW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 May 2021 14:16:22 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7235DC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 11:15:17 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id t17-20020a4a3e110000b02901fab2f46a48so3663067oot.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 11:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=rni/8nhHV7qXN2iY+BROqiZjKk32a9q0hZwNLgb5WwM=;
        b=G/xZOlZkRSIIpCpdw+K0oVxHNwIwADJP2EQPwUsmVDJ32K8/Q4k4vOR9Xdo3YTGkVO
         ZbEUvKqQ3xjibLhgKLxMgt00gqcV5dtLUYC27NWJeKHF8Vs76e5sBxCMZH5Uv8UBc7Qr
         kmTSSAQk5Gp+32ZkKSI+1J5Reubyn3NthQE4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=rni/8nhHV7qXN2iY+BROqiZjKk32a9q0hZwNLgb5WwM=;
        b=AtyXqSsgU7+WgnlBMP3GBgXQhIyVxoCntd3jj/H5hsjEjgaWoYsHQmygxZvJb/TRfj
         zMlEw1Xeiogt0MbV1x9txBZD8TSD+d0HJZop3puSzQq9+vqjW26Htd9rJ8NThqybTmuf
         joNXIQ14158BBrd7IziEc5kgJ48tjmwBW95tMih2HkDz0sa4crbHptjvQmMbgx2SotbM
         wLVpLWiSfK+68pUfVx/TB77POgJQgyNRWqJq2n9BSpGcbz++mNS8gkbdPedT5npe7UJs
         OAF1fpcYs7La/v4OFGm7iNXaMyu6paH1gYH5RlwPMWWnEN003bvQZdggIq42DwScGkCc
         f2jQ==
X-Gm-Message-State: AOAM532iu/y9bsdIjoqhplw/h/hSDDf/LwaaKDsGfBoW5XlBitQvH+/t
        LLluw9BP8jzCihRmUvM1Ieu3kAxqrjeT7q0faCQfBg==
X-Google-Smtp-Source: ABdhPJzhZvGhDZJYl9F/EOaunXHj/ckIOeOUKqiU34nSNZaVoUAUUF7RFS6usQYG/ft8eVEfBKUZYfMFkXVzyZ+nkrY=
X-Received: by 2002:a4a:1703:: with SMTP id 3mr20059748ooe.92.1620670516774;
 Mon, 10 May 2021 11:15:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 May 2021 11:15:16 -0700
MIME-Version: 1.0
In-Reply-To: <1620251521-29999-1-git-send-email-khsieh@codeaurora.org>
References: <1620251521-29999-1-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 10 May 2021 11:15:16 -0700
Message-ID: <CAE-0n50HUo0tm22xX+j8H-u+EDH+wBrdEvM68p-X3EyR8S_u3Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: handle irq_hpd with sink_count = 0 correctly
To:     Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-05-05 14:52:01)
> irq_hpd interrupt should be handled after dongle plugged in and
> before dongle unplugged. Hence irq_hpd interrupt is enabled at
> the end of the plugin handle and disabled at the beginning of
> unplugged handle. Current irq_hpd with sink_count = 0 is wrongly
> handled same as the dongle unplugged which tears down the mainlink
> and disables the phy. This patch fixes this problem by only tearing
> down the mainlink but keeping phy enabled at irq_hpd with
> sink_count = 0 handle so that next irq_hpe with sink_count =1 can be
> handled by setup mainlink only.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

It works for me, but I question the poking into phy internals below.

>  drivers/gpu/drm/msm/dp/dp_catalog.c |  5 +--
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 78 +++++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +
>  drivers/gpu/drm/msm/dp/dp_display.c | 47 +++++++++++++++++-----
>  4 files changed, 111 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index b1a9b1b..f4f53f2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -582,10 +582,9 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
>
>         u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
>
> -       /* enable HPD interrupts */
> +       /* enable HPD plug and unplug interrupts */
>         dp_catalog_hpd_config_intr(dp_catalog,
> -               DP_DP_HPD_PLUG_INT_MASK | DP_DP_IRQ_HPD_INT_MASK
> -               | DP_DP_HPD_UNPLUG_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, true);
> +               DP_DP_HPD_PLUG_INT_MASK | DP_DP_HPD_UNPLUG_INT_MASK, true);
>
>         /* Configure REFTIMER and enable it */
>         reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 8d59eb9..5922259 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1334,8 +1334,10 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
>         dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
>                                         ctrl->link->link_params.rate * 1000);
>
> -       phy_configure(phy, &dp_io->phy_opts);
> -       phy_power_on(phy);
> +       if (!phy->power_count) {
> +               phy_configure(phy, &dp_io->phy_opts);
> +               phy_power_on(phy);
> +       }
>
>         ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, true);
>         if (ret)
> @@ -1414,6 +1416,10 @@ void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
>         phy = dp_io->phy;
>
>         dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
> +
> +       if (phy->power_count)
> +               phy_power_off(phy);
> +
>         phy_exit(phy);
>
>         DRM_DEBUG_DP("Host deinitialized successfully\n");
> @@ -1445,7 +1451,6 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
>
>         dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>         opts_dp->lanes = ctrl->link->link_params.num_lanes;
> -       phy_configure(phy, &dp_io->phy_opts);
>         /*
>          * Disable and re-enable the mainlink clock since the
>          * link clock might have been adjusted as part of the
> @@ -1456,9 +1461,13 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
>                 DRM_ERROR("Failed to disable clocks. ret=%d\n", ret);
>                 return ret;
>         }
> -       phy_power_off(phy);
> -       /* hw recommended delay before re-enabling clocks */
> -       msleep(20);
> +
> +       if (phy->power_count) {

I don't believe members of 'phy' are supposed to be looked at by various
phy consumer drivers. Vinod, is that right?

> +               phy_configure(phy, &dp_io->phy_opts);
> +               phy_power_off(phy);
> +               /* hw recommended delay before re-enabling clocks */
> +               msleep(20);
> +       }
>
>         ret = dp_ctrl_enable_mainlink_clocks(ctrl);
>         if (ret) {
> @@ -1487,7 +1496,9 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
>                 DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
>         }
>
> -       phy_power_off(phy);
> +       if (phy->power_count)
> +               phy_power_off(phy);
> +

Given that init/power_on are both refcounted, maybe the code could call
phy_init()/phy_exit() when hpd changes, i.e. the link is up and
phy_power_on()/phy_power_off() when the mainlink is supposed to be
enabled (I guess when we're going to display bit to the screen?). That
way we don't have to check the counts.

>         phy_exit(phy);
>
>         return 0;
