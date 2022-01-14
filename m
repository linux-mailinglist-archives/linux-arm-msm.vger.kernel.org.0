Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8175A48F215
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 22:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbiANVlq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jan 2022 16:41:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbiANVlq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jan 2022 16:41:46 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1539C06161C
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 13:41:45 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id g205so14067196oif.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 13:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=EiF4kxaLYYslVsSU2sOxDU0qaE58YW7xc6wp1g7lJQQ=;
        b=aJyozUrkyudyCMwztwokNGSEAVnw6wQjjRztzVHW4JAvcr8WI07NRwpnWsK0diRUPt
         Fg6IeQRZP9g8Ds56ymeldBaTBbQqvfd81JsjFfxduSl/Fq9np23NPioUWZ99mkBngw4z
         XrI1d2GSV/i8mv1RJQoL4rGUg51B6kowqwvtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=EiF4kxaLYYslVsSU2sOxDU0qaE58YW7xc6wp1g7lJQQ=;
        b=tIeT2Kxr2yskn9Z/2XQQm8QSWYROybCBHJsopIJNSX+QwJkADEn+gvJwBw/snlJHnj
         WqzwyNLUGM7ey/JJJW5fG2dIuNm7OeviUSk0z4abdnjWbvVaZpaqENKQK+UAdKWvWobi
         VDIIqQ8drAzrQHuu7nH14Er9blhmMr6td5Gr5zfGmMG2LJkMptIb8CzQtmT3aRFubmMK
         KAnpTVwSj8xRAHx3Gq4bIgToKzDELMRSE96HdbYEus0Hxla5iv5zNcR1jauG0PCkWxZR
         fF2GdZhWjDHVmoRwSDX6hEnV1/wV5tWolLJVCOLj65GofzZNx4Lym7R8CoL6oDlyu2BM
         wL5w==
X-Gm-Message-State: AOAM531dUdJ1hkJF+x8sW0f/HPmL5DObIHj2kz0aPS1VVSXh9+8U0jU2
        pPD0sbmI5GL+i91Kxl9XrC6CPUyRJbKH5r0JS5ULrA==
X-Google-Smtp-Source: ABdhPJxqXjmHGTouafQMbaFEPOTUQrNELWzSofFuBmD0rN8FxXai9W9dtNego1w9Wr2rWHHHSY+XGSIvw1IVJXLBDn4=
X-Received: by 2002:aca:4382:: with SMTP id q124mr9068196oia.64.1642196504991;
 Fri, 14 Jan 2022 13:41:44 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Jan 2022 15:41:44 -0600
MIME-Version: 1.0
In-Reply-To: <1642194710-2512-2-git-send-email-quic_khsieh@quicinc.com>
References: <1642194710-2512-1-git-send-email-quic_khsieh@quicinc.com> <1642194710-2512-2-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 14 Jan 2022 15:41:44 -0600
Message-ID: <CAE-0n52UYBajrqGFqppun5oK82V3ppjvQxANU27kL95gCZtURg@mail.gmail.com>
Subject: Re: [PATCH v15 1/4] drm/msm/dp: do not initialize phy until plugin
 interrupt received
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, aravindh@codeaurora.org,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-01-14 13:11:47)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7cc4d21..7cd6222 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -696,12 +699,9 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>          * dp core (ahb/aux clks) must be initialized before
>          * irq_hpd be handled
>          */
> -       if (dp->core_initialized) {
> -               ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
> -               if (ret == -ECONNRESET) { /* cable unplugged */
> -                       dp->core_initialized = false;
> -               }
> -       }
> +       if (dp->core_initialized)

When is this condition false? The irq isn't unmasked until the core has
been initialized. On the resume path I suppose the irq is enabled in
dp_display_host_init() calling dp_ctrl_reset_irq_ctrl(), and then we
could immediately get the interrupt but it will block on the event_mutex
lock.

> +               dp_display_usbpd_attention_cb(&dp->pdev->dev);
> +
>         DRM_DEBUG_DP("hpd_state=%d\n", state);
>
>         mutex_unlock(&dp->event_mutex);
> @@ -1363,14 +1373,16 @@ static int dp_pm_suspend(struct device *dev)
>                 if (dp_power_clk_status(dp->power, DP_CTRL_PM))
>                         dp_ctrl_off_link_stream(dp->ctrl);
>
> +               dp_display_host_phy_exit(dp);
> +
> +               /* host_init will be called at pm_resume */
>                 dp_display_host_deinit(dp);
> +       } else {
> +               dp_display_host_phy_exit(dp);

I fail to see where this condition happens. Can we suspend the device
without the irq being installed?

>         }
>
>         dp->hpd_state = ST_SUSPENDED;
>
> -       /* host_init will be called at pm_resume */
> -       dp->core_initialized = false;
> -
>         DRM_DEBUG_DP("After, core_inited=%d power_on=%d\n",
>                         dp->core_initialized, dp_display->power_on);
>
