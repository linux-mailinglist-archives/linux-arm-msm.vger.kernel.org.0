Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6A7648F19D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 21:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235529AbiANUlu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jan 2022 15:41:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239788AbiANUlt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jan 2022 15:41:49 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F426C06161C
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 12:41:49 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id t9so13787557oie.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 12:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=w8eYRN8DvaWrfxZ2Wz3wjJHXZl1sXzUmVItZvQrcpIU=;
        b=OKa3qW6WIsuRKuwVZNQaoh+x0FXafWzSaIVMiOJybsAilmpEY6W3EOaW9x2UgT2rw5
         7Z6ixaS6ITqghZ1bGqvYEroKq3/zGqHGcf6lImK8zDJvW3Mf+P2/aLm6KsTE0F3P8quV
         5MzfzisWUjGUiPZu535FQWvgGlcTrhsR26KJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=w8eYRN8DvaWrfxZ2Wz3wjJHXZl1sXzUmVItZvQrcpIU=;
        b=FgR9dmCQ4el1u4P1AquO0PgjwkxiSe3jgFJ9wnuGr+kRMzGG0sqPDeTUwZV8wZq1H4
         S3vfVd3F7HAG3NiTVo7mtpdP917CJHBXZQrrgQ/x4U36vUu3tAXA/2cPM7aYcgJtF/lq
         b5he3YUAeBzNRRIcwgTeZHzOD7i7Z2zthAhUy0huwz+tcxB9K1CyQInOWGuLgsaSUJfy
         CA9a9qaHVQCyZZKepPZQFf6yzgrB/8nh5l0Himpq7z3Z3SthGciWWvq5wfd39s4Scqbx
         tKUu9LlyvTtgjb1CmiVgC4t/izMaMMdnD50sLwQFbbymZKX3vZRyLajtE6H9PLsK6M3+
         c3PA==
X-Gm-Message-State: AOAM532P27lzasPx4TK+HVtsSB49kNfr1sR/FtVbETP5qTuW1a/aGe/M
        TBOExFSHyuiphwiDQLDmoc1CaoMz30NgIdleB6kgzg==
X-Google-Smtp-Source: ABdhPJyJdhcMkqImaSUxZ1WkeHPyT3tbME4n66V0rAr6S+Pk6ZlC3B9/0q6DsTjh/bqpzaqTLFTgaIaDVy4htwfjrno=
X-Received: by 2002:aca:4382:: with SMTP id q124mr8893398oia.64.1642192908901;
 Fri, 14 Jan 2022 12:41:48 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Jan 2022 14:41:48 -0600
MIME-Version: 1.0
In-Reply-To: <1642182874-27296-2-git-send-email-quic_khsieh@quicinc.com>
References: <1642182874-27296-1-git-send-email-quic_khsieh@quicinc.com> <1642182874-27296-2-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 14 Jan 2022 14:41:48 -0600
Message-ID: <CAE-0n52UntroUk9hzPorUOvkVty1=V5B2oznYghi_DM6=zyzrw@mail.gmail.com>
Subject: Re: [PATCH v14 1/4] drm/msm/dp: do not initialize phy until plugin
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

Quoting Kuogee Hsieh (2022-01-14 09:54:31)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7cc4d21..2616f7b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -372,21 +373,38 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>         return rc;
>  }
>
> -static void dp_display_host_init(struct dp_display_private *dp, int reset)
> +static void dp_display_host_phy_init(struct dp_display_private *dp)
>  {
> -       bool flip = false;
> +       DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
> +                       dp->core_initialized, dp->phy_initialized);
>
> +       if (!dp->phy_initialized) {
> +               dp_ctrl_phy_init(dp->ctrl);
> +               dp->phy_initialized = true;
> +       }
> +}
> +
> +static void dp_display_host_phy_exit(struct dp_display_private *dp)
> +{
> +       DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
> +                       dp->core_initialized, dp->phy_initialized);
> +
> +       if (dp->phy_initialized) {
> +               dp_ctrl_phy_exit(dp->ctrl);
> +               dp->phy_initialized = false;
> +       }
> +}
> +
> +static void dp_display_host_init(struct dp_display_private *dp)
> +{
>         DRM_DEBUG_DP("core_initialized=%d\n", dp->core_initialized);
>         if (dp->core_initialized) {

Can you remove this if condition too? I don't see how it ever happens.

>                 DRM_DEBUG_DP("DP core already initialized\n");
>                 return;
>         }
>
> -       if (dp->usbpd->orientation == ORIENTATION_CC2)
> -               flip = true;
> -
> -       dp_power_init(dp->power, flip);
> -       dp_ctrl_host_init(dp->ctrl, flip, reset);
> +       dp_power_init(dp->power, false);
> +       dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>         dp_aux_init(dp->aux);
>         dp->core_initialized = true;
>  }
