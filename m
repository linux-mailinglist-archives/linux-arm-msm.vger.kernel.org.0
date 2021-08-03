Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68D8A3DE8FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 10:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234681AbhHCIzh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Aug 2021 04:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234697AbhHCIzh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Aug 2021 04:55:37 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE38C061764
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Aug 2021 01:55:26 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id z26so27400068oih.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Aug 2021 01:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=EsZwJNaFBYTAyGw1Pi5XpaVhjkvXKuF34mVyc2ioH2g=;
        b=IQMWqByHfAHErosenpOGw+Z00xebZ/uwdcJyLC9k0SMgw0Qz8mvFGTR9ZrCS7wDNJG
         NywBXlnKE3SSvaSXH2G9q56JAlZstr+y8CkEo+eq1XJoXbBV8YbhKqvec+sD4BkA4YDP
         ZqasbQQrUYT2J/E4jt1DxssJF1OACAU11iCZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=EsZwJNaFBYTAyGw1Pi5XpaVhjkvXKuF34mVyc2ioH2g=;
        b=pT3xQ3rfhkqkmi5eZimR+Ch1xutEQM/DQ05FXYkNX8aLUo8TFRNw0fEhpjelVl1m6m
         zzh9k2d0Kdfp4dnxxq40bOP1XBH4S8Loqx2IF7ybG8yaesEKA+1lEn7ADKWHsfbeUPSh
         2ufKJdmXvwjzuPyCuoDsLZq7ukaUGQAk5ecYhOAjUO6p7HBPzXQiGdVh/GYn9iSiFEX9
         mhvFtM1ZbHjU9E7I6bFvh99/bpeKyqGx55YAH0GDe7n5UNM7SM9Oz8dHAWPde7/iGPH8
         oRBVDFyzz9WBc8RRyUhtHLkUtok4KBfxWR78+qL7V9P9+8GTSFtpDPt+TIaiNrxRN10n
         FuQw==
X-Gm-Message-State: AOAM531d2MeUYBZmjiT7JUEePUWKNSaps3SP0bYo1dvNUD4r+j0rTr4w
        oJ1lQHzvtfwnnyCz4M9TBhFVWGQF8qLANm5oXOlnbA==
X-Google-Smtp-Source: ABdhPJzwpHkcVQ7Aar0ILGc3CwQvololSXJOgi1sdQHYLOY3sdJq+SQ3C6QiLVfDbKdEgtRgfxMFN8Uc2/Gok62IF7Y=
X-Received: by 2002:a05:6808:619:: with SMTP id y25mr2386771oih.166.1627980925750;
 Tue, 03 Aug 2021 01:55:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Aug 2021 01:55:25 -0700
MIME-Version: 1.0
In-Reply-To: <1627935655-4090-1-git-send-email-khsieh@codeaurora.org>
References: <1627935655-4090-1-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 3 Aug 2021 01:55:25 -0700
Message-ID: <CAE-0n51qc7LX-hWiFEGWRAZqNUgQAQ3XCxO6oEYWZh7wvkxs5Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: update is_connected status base on sink
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

Quoting Kuogee Hsieh (2021-08-02 13:20:55)
> Currently at dp_pm_resume() is_connected state is decided base on hpd connection
> status only. This will put is_connected in wrongly "true" state at the scenario
> that dongle attached to DUT but without hmdi cable connecting to it. Fix this
> problem by adding read sink count from dongle and decided is_connected state base
> on both sink count and hpd connection status.
>
> Changes in v2:
> -- remove dp_get_sink_count() cand call drm_dp_read_sink_count()
>
> Fixes: d9aa6571b28ba ("drm/msm/dp: check sink_count before update is_connected status")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 8b69114..6dcb78e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1403,6 +1403,7 @@ static int dp_pm_resume(struct device *dev)
>         struct msm_dp *dp_display = platform_get_drvdata(pdev);
>         struct dp_display_private *dp;
>         u32 status;

'status' is unused now, right? The compiler should be complaining about
unused local variables.

> +       int sink_count = 0;
>
>         dp = container_of(dp_display, struct dp_display_private, dp_display);
>  xlog(__func__, 1,0,0, dp->core_initialized, dp_display->power_on);
> @@ -1417,15 +1418,26 @@ xlog(__func__, 1,0,0, dp->core_initialized, dp_display->power_on);
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
> +       if ((status = dp_catalog_link_is_connected(dp->catalog))) {
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
> -xlog(__func__, 0x12,0,0, 0, dp->link->sink_count);
> -       if (status && dp->link->sink_count)
> +       if (dp->link->sink_count)
>                 dp->dp_display.is_connected = true;
>         else
>                 dp->dp_display.is_connected = false;
