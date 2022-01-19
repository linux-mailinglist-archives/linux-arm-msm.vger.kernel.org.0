Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B21A4938CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jan 2022 11:45:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347702AbiASKp3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jan 2022 05:45:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237771AbiASKp3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jan 2022 05:45:29 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03862C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jan 2022 02:45:29 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id h15so1952319qtx.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jan 2022 02:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZidLKkoheKRYLmmfEotcPaxUfoxZgUV1LWEsp7lDFdc=;
        b=lnA4G3/jwO4voNXe+aJMQmbpH4FApD/JL4id7vyRg6CVyEJd2s4ReZq1ea05XU2ZEh
         F0cQ024a6g7LEktS0tkvnoV4NF2rc1lR1vT2fSoLdYtWj7cX4WAaIqKCaPDSempGnOOf
         Pk03flYZptCG50Ui3CuPL5jM6IbMBl1nB8JdvKSZAJOnXAOf0EWHff3clPTZyDoDihA7
         JAnYhVVoaBkrY+IrgGcV7ol6cyT34s38nxHYLIHm4erxUdXM5iM3qyqc3gLFvfnOybMv
         0+qr4F9QbonvwmNxntNqziLWF/VxAhsrY1ypr60NiadNMJsnjNvtGVz3+IN0NUQgvHkl
         X4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZidLKkoheKRYLmmfEotcPaxUfoxZgUV1LWEsp7lDFdc=;
        b=Q4XqDXhN7RZJ/QDmpIhleVL3RtI7XEHAg6bpac/iWav4sho4eBdgqRZ/+ZZaFz0/53
         V9Iznd06Nih+GrNxiTmN2LiNwVE6OdS3VMgFbgfUScJ3T7EvAjHHOiczpsHQH92c0cna
         7mxwfn88uMONxTw4ROe/mY88YsOFKcvdUDcLqTFkxPL/7YQfn+oGd0mNSenFQhzQUvFp
         1V2l4gI8evNkhXO+Zfs+/m2F+tcj6lNb4jMQWGpEiw6bBeWaauA7ktDSd1u8MeaEMyRq
         YpA2l9kHBdVnFv+mK1luh1824nJvwnDceUraOpnbSzIkdSdbcbcRRHHWmWrWJkv4bWhd
         amEw==
X-Gm-Message-State: AOAM530JS6QuNyaxA7eDYIz6fr2FtykEhZhrLOyS8NR9O0mLtqbPtNT8
        A/VArIR4EUqqogpB/eK41D4UPcBCNgCz29OQZDrxGOUFWV5vjQ==
X-Google-Smtp-Source: ABdhPJyrhQhf649Wu624owHj63nPowoFr/QpGZNTIddHpKzIdmNM36ujOtEkzpL9YpRl0qVHmA/pcIhNrZ1KDonp1to=
X-Received: by 2002:a05:622a:241:: with SMTP id c1mr8669437qtx.295.1642589128097;
 Wed, 19 Jan 2022 02:45:28 -0800 (PST)
MIME-Version: 1.0
References: <1642586079-12472-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1642586079-12472-1-git-send-email-loic.poulain@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 19 Jan 2022 13:45:17 +0300
Message-ID: <CAA8EJpro3OQB4bcXu78xfP=MUfLbh8Spkb4Kh_NyQbnEo+d5vQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Fix byte clock interface rate for 14nm PHY
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     robdclark@gmail.com, sean@poorly.run, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 19 Jan 2022 at 12:42, Loic Poulain <loic.poulain@linaro.org> wrote:
>
> According to downstream driver, byte intf clk rate should be half the
> byte clk only with DSI PHY verion above 2.0 (14nm):
> https://source.codeaurora.org/quic/la/platform/vendor/opensource/display-drivers/tree/msm/dsi/dsi_display.c?h=LA.UM.8.12.3.1#n3991

This is a bit strange. We have other 14nm DSI PHYs, which are thought
to be working (msm8996, sdm660). Not tested by me, though.
And msm8916 has 28nm-lp, which according to CAF's patch should also use

>
> This change introduces a no_byte_intf_clk_div phy property, used to
> control byte clk intf divider.
>
> This fixes DSI sync issues on 14nm based DSI Phy platorms.
>
> Tested with:
>     - QCM2290 (14nm phy) + tc358767 DSI/DPI bridge
>     - QCM2290 (14nm phy) + lontium lt9611uxc DSI/HDMI bridge
>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c         | 5 ++++-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      | 1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 3 +++
>  3 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 428641e..1f8287a 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -172,6 +172,8 @@ struct msm_dsi_host {
>         /* from phy DT */
>         bool cphy_mode;
>
> +       bool phy_no_byte_intf_clk_div;
> +

Ugh. I'd suggest adding this kind of field to
msm_dsi_phy_shared_timings and then passing shared timings to
link_clk_set_rate callback.

>         u32 dma_cmd_ctrl_restore;
>
>         bool registered;
> @@ -484,7 +486,7 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
>
>         if (msm_host->byte_intf_clk) {
>                 /* For CPHY, byte_intf_clk is same as byte_clk */
> -               if (msm_host->cphy_mode)
> +               if (msm_host->cphy_mode || msm_host->phy_no_byte_intf_clk_div)
>                         byte_intf_rate = msm_host->byte_clk_rate;
>                 else
>                         byte_intf_rate = msm_host->byte_clk_rate / 2;
> @@ -2196,6 +2198,7 @@ int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,

Note there is no msm_dsi_host_set_src_pll() anymore. Could you please
rebase on top of msm-next?

>         int ret;
>
>         msm_host->cphy_mode = src_phy->cphy_mode;
> +       msm_host->phy_no_byte_intf_clk_div = src_phy->no_byte_intf_clk_div;
>
>         ret = msm_dsi_phy_get_clk_provider(src_phy,
>                                 &byte_clk_provider, &pixel_clk_provider);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 4c82575..06d2284 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -103,6 +103,7 @@ struct msm_dsi_phy {
>         enum msm_dsi_phy_usecase usecase;
>         bool regulator_ldo_mode;
>         bool cphy_mode;
> +       bool no_byte_intf_clk_div;
>
>         struct clk_hw *vco_hw;
>         bool pll_on;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 7414966..f4849e6 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -897,6 +897,9 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy *phy)
>
>         phy->vco_hw = &pll_14nm->clk_hw;
>
> +       /* For PHY version <= 2.0 (14nm), byte_intf_clk = byte_clk */
> +       phy->no_byte_intf_clk_div = true;

This setting can go into constant phy configuration instead. And also
note that there are other <= 2.0 PHYs (20nm, 28nm).
Do they share this property?


-- 
With best wishes
Dmitry
