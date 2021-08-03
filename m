Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDBCE3DF51C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 21:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239363AbhHCTFW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Aug 2021 15:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239392AbhHCTFW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Aug 2021 15:05:22 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDCC6C06175F
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Aug 2021 12:05:09 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id o20so29302960oiw.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Aug 2021 12:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=aM8MsizluJ07UnlTpF+aEL3WsBrVhDLpeT++KkyjHek=;
        b=adyN6qzxtZdUQzENMLDG12zaz8zsrL114h9lU0G9//qw1S2ODvXz/ISUg4V1XEZiem
         263Tb21aV18FyqxRnnzWY+S0ltP/fCiher+Tjw/JQECap6o7A1sKOl3/DRzgZSDPmiLF
         33PIk7Zj1TkdTQWUsSn19XRaWIOxifE1LXDEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=aM8MsizluJ07UnlTpF+aEL3WsBrVhDLpeT++KkyjHek=;
        b=LgTWMENI1XgfGNVC9z1f2snA4LbIudOeNsJ5iqIRFzsK4nV3krqG1XnnvortgkcR9s
         ZD6UNWorEiQ29fXr+TD3+p2rOD8SG8tQ6VSWjRucEmT5JmcqGYn45o/by4zbOTT2xdUm
         mWRoTK1WwkTRM78rrx9is2c3Yy4n+A9fVQeHLAhACOods67pkN8GK7QMIIRTPWPQ23La
         jitBi0ljniEMk8aagP3n8w9rA8NCdMOrXPvDBmg/IAZQB4IPYhCIXR97XlJUq0WWAVts
         eBD6Nt/iFPBu9MnihVld4dPENaWkbmmBmtg5o+/n9NWWJQIYgazalzm5nBuK3h/MQJSu
         3o0Q==
X-Gm-Message-State: AOAM533iAQehG6dfOtfjC3XiXEM44GOxYEhMJrssOt7LV9nek4aq4ho9
        Fh7M7Wb3+UbcwbcmO9N9TdJG2yE3HFrpE83n2k3I+w==
X-Google-Smtp-Source: ABdhPJyanTbkyGw6bqxxe32BU35yQ3o5OTvmWdRLDEDn+Ge0Th1Q/eQzOsgoO7rz6Vg1n+lXDcvWL1gYbdIpBNeH7eI=
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr15907348oiu.19.1628017509265;
 Tue, 03 Aug 2021 12:05:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Aug 2021 12:05:08 -0700
MIME-Version: 1.0
In-Reply-To: <1628007913-29892-1-git-send-email-khsieh@codeaurora.org>
References: <1628007913-29892-1-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 3 Aug 2021 12:05:08 -0700
Message-ID: <CAE-0n51yNrmrqgDrkj2+c2Bx-bYxNs1m2pQBxvVkSpBH2hxzoA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: update is_connected status base on sink
 count at dp_pm_resume()
To:     Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-08-03 09:25:13)
> Currently at dp_pm_resume() is_connected state is decided base on hpd connection
> status only. This will put is_connected in wrongly "true" state at the scenario
> that dongle attached to DUT but without hmdi cable connecting to it. Fix this
> problem by adding read sink count from dongle and decided is_connected state base
> on both sink count and hpd connection status.
>
> Changes in v2:
> -- remove dp_get_sink_count() cand call drm_dp_read_sink_count()
>
> Changes in v3:
> -- delete status local variable from dp_pm_resume()
>
> Fixes: d9aa6571b28ba ("drm/msm/dp: check sink_count before update is_connected status")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 78c5301..0f39256 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1313,7 +1313,7 @@ static int dp_pm_resume(struct device *dev)
>         struct platform_device *pdev = to_platform_device(dev);
>         struct msm_dp *dp_display = platform_get_drvdata(pdev);
>         struct dp_display_private *dp;
> -       u32 status;
> +       int sink_count = 0;
>
>         dp = container_of(dp_display, struct dp_display_private, dp_display);
>
> @@ -1327,14 +1327,26 @@ static int dp_pm_resume(struct device *dev)
>
>         dp_catalog_ctrl_hpd_config(dp->catalog);
>
> -       status = dp_catalog_link_is_connected(dp->catalog);
> +       /*
> +        * set sink to normal operation mode -- D0
> +        * before dpcd read
> +        */
> +       dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> +
> +       /* if sink conencted, do dpcd read sink count */

s/conencted/connected/

This also just says what the code is doing. Why do we only read the sink
count if the link is connected? Can we read the sink count even if the
link isn't connected and then consider sink count as 0 if trying to read
fails?

> +       if (dp_catalog_link_is_connected(dp->catalog)) {
> +               sink_count = drm_dp_read_sink_count(dp->aux);
> +               if (sink_count < 0)
> +                       sink_count = 0;
> +       }
>
> +       dp->link->sink_count = sink_count;
>         /*
>          * can not declared display is connected unless
>          * HDMI cable is plugged in and sink_count of
>          * dongle become 1
>          */
> -       if (status && dp->link->sink_count)
> +       if (dp->link->sink_count)
>                 dp->dp_display.is_connected = true;
>         else
>                 dp->dp_display.is_connected = false;
