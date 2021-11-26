Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C156645EDE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 13:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377313AbhKZMc5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Nov 2021 07:32:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233178AbhKZMa4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Nov 2021 07:30:56 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C0C9C08E802
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Nov 2021 03:56:52 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id c6-20020a05600c0ac600b0033c3aedd30aso6597797wmr.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Nov 2021 03:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zpmD/szeurZGIwM/QvP/48iu2ppcqqQWf+7vaCbDPxk=;
        b=RGENqsPbZrrHZa220+wFAFjFgPxuIOB4I6sAS9Bvy29aYWkakbBKD/MlRQuTdANYXG
         yAAa4D3882kGUIMKbrjFXIq79/5Z/RhwHTMa2Mw+f7TquOwvf0gAlv5GAGAqkFoHU2iM
         q+OV3CTL590VJcU2NgXzyRve/GLYi6P2GS7x061WAfkrm1I2aLB7ZtiXMPWtPkc5Z8qS
         siaKU3hnsDosq9vblzOnxPFVeKkP0heISPKPU0S91t7Ebt3BLiQIXgNy6Nt9nZH1wVpf
         mi3uE3kJbKsvo7qhIOeDI+bu4iU5XNJK0TOrwo9zXOQGHCXWm3FrbhCpejKKNORueaUm
         TaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zpmD/szeurZGIwM/QvP/48iu2ppcqqQWf+7vaCbDPxk=;
        b=5ZtGhnfHU6I8UJobdj62ZWxj7rY1hKA6NMxkuqGi/n1nGP1tjjOQvQRUxtw5nfNX12
         W/hflR4EU2+ommevB9Qvtf9txCb1+YKU+349af4qC0pQX16WqFkovxBqSDYonNBfi1pr
         fL3/hOh48uNN0rFyYZnNG0RekcGTb0Y/sLbZvnUQCwTqw5zqzckv7NrDJ9BA+cWI1Y5z
         +NQYagzCheGp8f4cmM7dG6KzFT1R+h3sd94Kfu+42sGB3pmSC/NXyAFcpvxFvH70IZSb
         jrXPzJexMTJfvvxysh6lHGCIz1J3YXbf8N5o8Ee8gkFMiOVRWsPxGhWnxUGrWfqy3zC6
         n71A==
X-Gm-Message-State: AOAM532Ln/+eK4V3b6hYVO7HbdtIWJoA74i9/ScfMTarc4lktJHwE5LN
        lDOwVi1vGMibOiiWOapUOF7Y9ZqnbNb0M7jDYLiBRQ==
X-Google-Smtp-Source: ABdhPJyRzV3x6rMLqEPj0ibZLUh05JPkxyliqaMr7MXxrf+zd77znnvM3P1P9UmYcKnBeToGMwGbtbT5iLSQ8Z1DK1Q=
X-Received: by 2002:a05:600c:358a:: with SMTP id p10mr14475605wmq.180.1637927810950;
 Fri, 26 Nov 2021 03:56:50 -0800 (PST)
MIME-Version: 1.0
References: <20211126003227.1031347-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20211126003227.1031347-1-dmitry.baryshkov@linaro.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 26 Nov 2021 11:56:36 +0000
Message-ID: <CAPY8ntBrhYAmsraDqJGuTrSL6VjGXBAMVoN7xweV7E4qZv+v3Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/ bridge: tc358762: move bridge init to enable callback
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry

On Fri, 26 Nov 2021 at 00:32, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> During the pre_enable time the previous bridge (e.g. DSI host) might be
> not initialized yet. Move the regulator enablement and bridge init to
> te enable callback (and consequently regulator disblement to disable).

Except that in the enable callback the DSI host has video enabled too,
so the data lanes may be in HS mode too, and the bridge may not be
prepared to accept that during power on / initialisation. That means
you've got a race condition over how quickly the composition hardware
starts producing pixel data vs when this enable callback is called. I
suspect that is why we had [1] for the rare case when the race
condition failed.
There's also seems to be no guarantee that a host can do LP commands
between HS video packets (eg sunxi [2])

This is the same issue that was being hacked around in [3], and is one
of the questions I'd raised back in July [4].
The DSI support is broken when it comes to accommodating
initialisation sequences, but in trying to ensure all possible
sequences can be accomodated, all currently proposed solutions have
been shot down.
Some platforms have worked around it by powering up the DSI host in
mode_set (dw-mipi-dsi), others have broken the bridge chain apart so
their pre_enable gets called first (exynos and currently vc4) except
that approach is broken for the atomic API.

There is a need for some form of resolution, even if it is only
documenting the correct hack to implement in the DSI host driver.
Hacking bridge or panel drivers to try and workaround it seems wrong.

  Dave

[1] https://lists.freedesktop.org/archives/dri-devel/2021-September/322119.html
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c#n776
[3] https://lists.freedesktop.org/archives/dri-devel/2021-November/332003.html
[4] https://lists.freedesktop.org/archives/dri-devel/2021-July/313576.html

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/tc358762.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
> index 7104828024fd..ebdf771a1e49 100644
> --- a/drivers/gpu/drm/bridge/tc358762.c
> +++ b/drivers/gpu/drm/bridge/tc358762.c
> @@ -64,7 +64,7 @@ struct tc358762 {
>         struct drm_connector connector;
>         struct regulator *regulator;
>         struct drm_bridge *panel_bridge;
> -       bool pre_enabled;
> +       bool enabled;
>         int error;
>  };
>
> @@ -125,26 +125,26 @@ static int tc358762_init(struct tc358762 *ctx)
>         return tc358762_clear_error(ctx);
>  }
>
> -static void tc358762_post_disable(struct drm_bridge *bridge)
> +static void tc358762_disable(struct drm_bridge *bridge)
>  {
>         struct tc358762 *ctx = bridge_to_tc358762(bridge);
>         int ret;
>
>         /*
> -        * The post_disable hook might be called multiple times.
> +        * The disable hook might be called multiple times.
>          * We want to avoid regulator imbalance below.
>          */
> -       if (!ctx->pre_enabled)
> +       if (!ctx->enabled)
>                 return;
>
> -       ctx->pre_enabled = false;
> +       ctx->enabled = false;
>
>         ret = regulator_disable(ctx->regulator);
>         if (ret < 0)
>                 dev_err(ctx->dev, "error disabling regulators (%d)\n", ret);
>  }
>
> -static void tc358762_pre_enable(struct drm_bridge *bridge)
> +static void tc358762_enable(struct drm_bridge *bridge)
>  {
>         struct tc358762 *ctx = bridge_to_tc358762(bridge);
>         int ret;
> @@ -157,7 +157,7 @@ static void tc358762_pre_enable(struct drm_bridge *bridge)
>         if (ret < 0)
>                 dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
>
> -       ctx->pre_enabled = true;
> +       ctx->enabled = true;
>  }
>
>  static int tc358762_attach(struct drm_bridge *bridge,
> @@ -170,8 +170,8 @@ static int tc358762_attach(struct drm_bridge *bridge,
>  }
>
>  static const struct drm_bridge_funcs tc358762_bridge_funcs = {
> -       .post_disable = tc358762_post_disable,
> -       .pre_enable = tc358762_pre_enable,
> +       .disable = tc358762_disable,
> +       .enable = tc358762_enable,
>         .attach = tc358762_attach,
>  };
>
> @@ -218,7 +218,7 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
>         mipi_dsi_set_drvdata(dsi, ctx);
>
>         ctx->dev = dev;
> -       ctx->pre_enabled = false;
> +       ctx->enabled = false;
>
>         /* TODO: Find out how to get dual-lane mode working */
>         dsi->lanes = 1;
> --
> 2.33.0
>
