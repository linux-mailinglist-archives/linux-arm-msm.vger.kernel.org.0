Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6357475099
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 02:50:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238979AbhLOBux (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 20:50:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238970AbhLOBuw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 20:50:52 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 899B0C06173E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 17:50:52 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso23017262otj.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 17:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=X8BNLsBux2AXya8Toe9pz3z2hfhJJ8ODRuIPLURO8n4=;
        b=hxOuAmS0GH3gTmzxlY2ckaN2Zd1HLGwM5os8kOAmtBFXwBpB0KORzQTVfduGvFW2M6
         R7Tmh4lmfXbJdpFEoW5Yt1rlLuMK6Z7/DlcgVNZ8EWUbyQxwMcVAhsz5c0nZtXtjSNXh
         V0jc3gzeOuIUg8h1NLBAb12d2BQqYXVg7o35s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=X8BNLsBux2AXya8Toe9pz3z2hfhJJ8ODRuIPLURO8n4=;
        b=bqAP4jlf1VWTe3XmKAF0rSUx783PUYTs0Ibx/ffOarOZx6aZwIyWUnJdMtIpG1ekTV
         aJ0k58o0sls8UFsajExdAcWLO2R1PrAmeZjcI2KhTqTA1DAjpa3/1CWvZ4gg2qgcdFxs
         Z7pAzNY7mETVLwHXPrPZcnL3FhCYbDdQ+z0Sc//39aT2H4XOtdNTgaGrPTQce0Hjkj98
         Rid5SJmhA3ozTI96uKwOAdI8B6YObxP8VBaRrtHtgKm+TYqzeONJqJUB6WS7m2h3DGik
         M9Hgfz90mNYK58oMG9k3psTh6JeGqywYGgiiqPiPwL3qhANfu+9gjm/hOF3MPNNTlZ5S
         VwtA==
X-Gm-Message-State: AOAM531NLD/dcHE0byJStc9zKP68CUcMU7Q2050Tg9g5koO4iLf8L3hx
        sXsHmLuenRmsUoHUZ1ujfWDRi9OMqDTcydly6+yoPgaFtc4=
X-Google-Smtp-Source: ABdhPJyXpuhWZ5m+m/2N9Y1iXuZP8AcuSjzJuNVAOm4SuBQtVSqPmW2e+rAaYwOg+X0ba7Sj5Ceq5UPVHtUml/aSv3c=
X-Received: by 2002:a9d:70ce:: with SMTP id w14mr6924071otj.77.1639533051758;
 Tue, 14 Dec 2021 17:50:51 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Dec 2021 02:50:51 +0100
MIME-Version: 1.0
In-Reply-To: <1639085707-27845-1-git-send-email-quic_khsieh@quicinc.com>
References: <1639085707-27845-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 15 Dec 2021 02:50:51 +0100
Message-ID: <CAE-0n51pbf3GqwA-wtTe5+rRvA_KMmb8kd6fqqDtZRX+X_3qiA@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] drm/msm/dp: do not initialize phy until plugin
 interrupt received
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, aravindh@codeaurora.org,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-12-09 13:35:07)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 0766752..cfbc5e4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -83,6 +83,7 @@ struct dp_display_private {
>
>         /* state variables */
>         bool core_initialized;
> +       bool phy_initialized;
>         bool hpd_irq_on;
>         bool audio_supported;
>
> @@ -371,21 +372,46 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
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

Is this check only here because we don't know when this function is
getting called? I see in the DP case we get here from
dp_display_usbpd_configure_cb() but in the eDP case we get here from
dp_display_host_init() and presumably again from
dp_display_usbpd_configure_cb() called by dp_hpd_plug_handle().

If at all possible, I'd prefer to not have another tracking variable and
call dp_display_host_phy_init() from the same place regardless of DP or
eDP. Doing that would make it symmetric, per the commit text.

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
>                 DRM_DEBUG_DP("DP core already initialized\n");
>                 return;
>         }
>
> -       if (dp->usbpd->orientation == ORIENTATION_CC2)
> -               flip = true;
> +       dp_power_init(dp->power, false);
> +       dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
> +
> +       /*
> +        * eDP is the embedded primary display and has its own phy
> +        * initialize phy immediately

Can we get some more details here? Why is it better to initialize the
phy here vs. when HPD goes high on the panel? The comment says what the
code is doing but it isn't telling us why that's OK.

> +        */
> +       if (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP)
> +               dp_display_host_phy_init(dp);
>
> -       dp_power_init(dp->power, flip);
> -       dp_ctrl_host_init(dp->ctrl, flip, reset);
>         dp_aux_init(dp->aux);
>         dp->core_initialized = true;
>  }
