Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF5C327A51
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 10:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233744AbhCAJBw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 04:01:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233775AbhCAJA2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 04:00:28 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FBD5C061786
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 00:59:48 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id a17so18501376ljq.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 00:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AYs79IPnRt3qtzNnShKWZ7vyowWc2VUelHvdooVHnZg=;
        b=kcf6kcitYZpg70CypoUp8KXILwBgfW62DpbNjWslqlp4qw62fI7tzmXjPZQCmQxMc8
         y7E4AtX2Fmm4bNLcfXcEPW4KygtdDIAQoh7/Gppn2wuQW/GKYs0Umn4Wm46XccGHSmBe
         jy7uA45XkN8GMGoDoJDciHZsVQhSFIR5XDAoh0rW972s2s04adtjid+35nHXnoln8MA8
         FxCO26S/5xLKeLnx947E7nXZn0Rnap1zKbmn2OkkQ+VOi8uxBgu0gE1sSxomW3gthjJM
         ufu7iyDDX3VZgWZtHNc17YGxcgin7Xk21+hnZeVkHrui+fqknKWQ+8YcQvAzXeWUB5vl
         a9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AYs79IPnRt3qtzNnShKWZ7vyowWc2VUelHvdooVHnZg=;
        b=uiJ5IKstq9otewjaZhLdkt8muWBxoO+zGuNtt3Aqaa3E4+CHh98dg/03oAi14gs2WR
         Dl7T0m2zNxctJAISllfN4SZyguxH7Yeu8MtdLGR3nR97UUFZSvKJb1umju0trxCN34LL
         O+jVwz9XyMVqQCG3k7aTnklVPuNKSAB6DiR7W2n+/EQ0hvSQ5zpjPn5owKNo0zY4heEo
         RQy/6dbLCy5XqpEw+qAyOTLbyt4K8YW1Dp9U+QOTTjzSr6j4+kGH6gxINdvu2NWh+LtV
         CMcPfE5RYit/W/wpyVOHN6a0oG7FbFp2Mlp3yhVwWfEZ1yDjs5P1owJwFudmtjI84YaD
         txFQ==
X-Gm-Message-State: AOAM532DU58jzyAo1W5/BjTBuqZ/u6szPVfnA1YSYXwEQsQDzmoJ6EHp
        r16Gbh8Q6OPQglGfMNyN45AqA6z4JN8Mz0QgWGJ9xw==
X-Google-Smtp-Source: ABdhPJyj3pw+C0NXHPjoJdDWHXn0vLK/WBMS4zWE5j9GGEZHyMLzxq+OeogebxlDuBb2zgJuFq1OMvgpJB8dxst6o6c=
X-Received: by 2002:a2e:9754:: with SMTP id f20mr6463797ljj.200.1614589186573;
 Mon, 01 Mar 2021 00:59:46 -0800 (PST)
MIME-Version: 1.0
References: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
In-Reply-To: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 1 Mar 2021 09:59:35 +0100
Message-ID: <CACRpkdbQa3BZwgtp3=061cu+y+4qkMqtXQhXH_VuHB3KcLyDCA@mail.gmail.com>
Subject: Re: [PATCH] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling features
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Robert Foss <robert.foss@linaro.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.velikov@collabora.com>,
        Inki Dae <inki.dae@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Xin Ji <xji@analogixsemi.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 11, 2021 at 4:34 AM Nicolas Boichat <drinkcat@chromium.org> wrote:

> Many of the DSI flags have names opposite to their actual effects,
> e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> be disabled. Fix this by including _NO_ in the flag names, e.g.
> MIPI_DSI_MODE_NO_EOT_PACKET.

Unless someone like me interpreted it literally...

Like in these:

>  drivers/gpu/drm/mcde/mcde_dsi.c                      | 2 +-
>  drivers/gpu/drm/panel/panel-novatek-nt35510.c        | 2 +-
>  drivers/gpu/drm/panel/panel-samsung-s6d16d0.c        | 2 +-
>  drivers/gpu/drm/panel/panel-sony-acx424akp.c         | 2 +-

> diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
> index 2314c8122992..f4cdc3cfd7d0 100644
> --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> @@ -760,7 +760,7 @@ static void mcde_dsi_start(struct mcde_dsi *d)
>                 DSI_MCTL_MAIN_DATA_CTL_BTA_EN |
>                 DSI_MCTL_MAIN_DATA_CTL_READ_EN |
>                 DSI_MCTL_MAIN_DATA_CTL_REG_TE_EN;
> -       if (d->mdsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET)
> +       if (d->mdsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>                 val |= DSI_MCTL_MAIN_DATA_CTL_HOST_EOT_GEN;

If you read the code you can see that this is interpreted as inserting
an EOT packet, so here you need to change the logic such:

if (!d->mdsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
    val |= DSI_MCTL_MAIN_DATA_CTL_HOST_EOT_GEN;

This will make sure the host generates the EOT packet in HS mode
*unless* the flag is set.

(I checked the data sheet.)

> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> index b9a0e56f33e2..9d9334656803 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> @@ -899,7 +899,7 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
>         dsi->hs_rate = 349440000;
>         dsi->lp_rate = 9600000;
>         dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -               MIPI_DSI_MODE_EOT_PACKET;
> +               MIPI_DSI_MODE_NO_EOT_PACKET;

Here you should just delete the MIPI_DSI_MODE_EOT_PACKET
flag because this was used with the MCDE driver which interpret the
flag literally.

> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> index 4aac0d1573dd..b04b9975e9b2 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> @@ -186,7 +186,7 @@ static int s6d16d0_probe(struct mipi_dsi_device *dsi)
>          */
>         dsi->mode_flags =
>                 MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -               MIPI_DSI_MODE_EOT_PACKET;
> +               MIPI_DSI_MODE_NO_EOT_PACKET;

Same, just delete the flag.

> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> @@ -97,7 +97,7 @@ static int s6e63m0_dsi_probe(struct mipi_dsi_device *dsi)
>         dsi->hs_rate = 349440000;
>         dsi->lp_rate = 9600000;
>         dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> -               MIPI_DSI_MODE_EOT_PACKET |
> +               MIPI_DSI_MODE_NO_EOT_PACKET |
>                 MIPI_DSI_MODE_VIDEO_BURST;

Same, just delete the flag.

> diff --git a/drivers/gpu/drm/panel/panel-sony-acx424akp.c b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> index 065efae213f5..6b706cbf2f9c 100644
> --- a/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> +++ b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> @@ -450,7 +450,7 @@ static int acx424akp_probe(struct mipi_dsi_device *dsi)
>         else
>                 dsi->mode_flags =
>                         MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -                       MIPI_DSI_MODE_EOT_PACKET;
> +                       MIPI_DSI_MODE_NO_EOT_PACKET;

Same, just delete the flag.

These are all just semantic bugs due to the ambiguity of the flags, it is
possible to provide a Fixes: flag for each file using this flag the wrong way
but I dunno if it's worth it.

Yours,
Linus Walleij
