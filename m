Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7813803F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 May 2021 09:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232575AbhENHEu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 May 2021 03:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232013AbhENHEu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 May 2021 03:04:50 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F4DC06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 May 2021 00:03:39 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id t10-20020a05683022eab0290304ed8bc759so4581025otc.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 May 2021 00:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=t/erlS0KSM8vCio7Ok8bLMUZqEf2SFqD0+lTW1WVjb0=;
        b=XFVDbfbb/JY7synsDmjIJVMDAKGuCXMsAP2qZIxfGYDIxMUPeqpsA8es62Up5zMtjI
         ezhtKdtBN2rc5+5X5OPBWqRrFczHyNnxwxXEfoo6N+joR4hXnerFPW2Zbw+SWqjwOu5Y
         iYrkWwVfiCOajba0X+vbVp9q1JWGA1Q9yzRHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=t/erlS0KSM8vCio7Ok8bLMUZqEf2SFqD0+lTW1WVjb0=;
        b=sJiazn8iNKtl/bE/FRl6/iFNhmm44TvXEyi8DM/8VTcJczBKZ124FMd8QRqc1KeQa5
         f86qzaOb3sCIvPbXctL7Ht+6MPVIa3oq3TzZ+83j1dJXulIBE64563ECzN3vjxWWjYoe
         k+rDO036D8oenzK+uNwLv77T3sUKH2+kTOxCJGDCvGjmN+MhE9xxBSgS2U7XUPlxX+ul
         EjS5fnbtWJD9sORrW+/i8+jbdR+cdObMP11kFedViHqHtdibVyNrJgqZWPFvUexHRtd3
         u59xbOU4BLwobN4xUtXJBk0Cjv5y5ruukY0WWLnYmU06AfKVlfKXW/vBEoPpPmWJybmD
         ldvg==
X-Gm-Message-State: AOAM533rdnOPz/fqI38NdpmZGX1iOWWmfY9A/US6iYUTGQZzZFCtUI1C
        C7lkODDsbtOuR4PfQlArrG9/4FxXaqEeHcdK//lIOw==
X-Google-Smtp-Source: ABdhPJxqNL/YMpX++PfY8q6b7kVFtbe6P871ZUDuytU5EYikWR22m6n/N/8HvyA4vP4kN6nrUl6tj1pWy2QsnazMBkY=
X-Received: by 2002:a05:6830:1556:: with SMTP id l22mr38502367otp.34.1620975818621;
 Fri, 14 May 2021 00:03:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 May 2021 02:03:37 -0500
MIME-Version: 1.0
In-Reply-To: <1620862199-19514-1-git-send-email-khsieh@codeaurora.org>
References: <1620862199-19514-1-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 14 May 2021 02:03:37 -0500
Message-ID: <CAE-0n53V661ir2hTpPYA2CAq3HLgXQYL+O-nnJy8vHYKPzynzw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/msm/dp: handle irq_hpd with sink_count = 0 correctly
To:     Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-05-12 16:29:59)
> irq_hpd interrupt should be handled after dongle plugged in and
> before dongle unplugged. Hence irq_hpd interrupt is enabled at
> the end of the plugin handle and disabled at the beginning of
> unplugged handle. Current irq_hpd with sink_count = 0 is wrongly
> handled same as the dongle unplugged which tears down the mainlink
> and disables the phy. This patch fixes this problem by only tearing
> down the mainlink but keeping phy enabled at irq_hpd with
> sink_count = 0 handle so that next irq_hpe with sink_count =1 can be

s/irq_hpe/irq/hpd/

> handled by setup mainlink only.
>
> Changes in v2:
> -- add ctrl->phy_Power_count
>
> Changes in v3:
> -- del ctrl->phy_Power_count
> -- add phy_power_off to dp_ctrl_off_link_stream()
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c |  5 ++--
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 54 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 ++
>  drivers/gpu/drm/msm/dp/dp_display.c | 46 ++++++++++++++++++++++++-------
>  4 files changed, 94 insertions(+), 13 deletions(-)
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
> index 8d59eb9..41c122c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1811,6 +1811,60 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>         return ret;
>  }
>
> +int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
> +{
> +       struct dp_ctrl_private *ctrl;
> +       struct dp_io *dp_io;
> +       struct phy *phy;
> +       int ret = 0;

Please don't assign ret and then reassign it without testing it first.

> +
> +       if (!dp_ctrl)

Does this ever happen?

> +               return -EINVAL;
> +
> +       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +       dp_io = &ctrl->parser->io;
> +       phy = dp_io->phy;
> +
> +       dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
> +
> +       ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, false);
> +       if (ret)
> +               DRM_ERROR("Failed to disable pixel clocks. ret=%d\n", ret);

Why do we continue instead of returning with a failure?

> +
> +       ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
> +       if (ret)
> +               DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);

Same, why do we continue?

> +
> +       phy_power_off(phy);
> +       phy_exit(phy);
> +
> +       /* aux channel down, reinit phy */

So we need to call exit/init to reinitialize the phy? I wonder if there
could be some phy_reinit() function that combines those.

> +       phy_init(phy);
> +
> +       DRM_DEBUG_DP("DP off link/stream done\n");
> +       return ret;

Except here we return with a failure.

> +}
> +
> +void dp_ctrl_off_phy(struct dp_ctrl *dp_ctrl)
> +{
> +       struct dp_ctrl_private *ctrl;
> +       struct dp_io *dp_io;
> +       struct phy *phy;
> +
> +       if (!dp_ctrl)

Does this ever happen?

> +               return;
> +
> +       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +       dp_io = &ctrl->parser->io;
> +       phy = dp_io->phy;
> +
> +       dp_catalog_ctrl_reset(ctrl->catalog);
> +
> +       phy_exit(phy);
> +
> +       DRM_DEBUG_DP("DP off phy done\n");
> +}
> +
>  int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>  {
>         struct dp_ctrl_private *ctrl;
