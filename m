Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D940D747C1B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jul 2023 06:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjGEEpk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jul 2023 00:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjGEEpj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jul 2023 00:45:39 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C77910F5
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 21:45:38 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-636274ce31eso45969926d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 21:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688532337; x=1691124337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvfvXAVyob3htxlBCjHDC3d0cF9EwxU5FiwqJrsNIFQ=;
        b=h85RDU5faMJMQFRpL11aGFUvNF/ofs+2e1lUAoBYP8SLsCQG3po2qN0EcgfzDFwIBW
         BzJNoYc7bPOIh3frqeehvRErPNng/ZJBR2F39EflnmYKKm6DTzb/3bJcr9hAhBhde9m0
         zwEjKFR+OYjRIakJntOIQn1gpnPMeYhebdCLAlsSV1hbUwow1dZC0oJ0jFqPyyaVnVys
         /XhUDt1TCqEjSEyTswOrSLWS9xN1FOQ1NJQ5gU2oY4dS3UbKAnZ2tXnDtRrX9DXHhJch
         dHAfi/nlrITlGVNXKe0zxMCLQH6gJ4jzJBZZMFPtOQftUYfdDCv8RiuLOu1NQw5RfO9V
         xrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688532337; x=1691124337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZvfvXAVyob3htxlBCjHDC3d0cF9EwxU5FiwqJrsNIFQ=;
        b=XoMG4HlzIVSOxQygXxFwQ/uMiraAq/n5SsPN9HghamI2fH71nI8Q272kHtNv+WvfqM
         ugKv4PJpVfJJDyg6F1KCNw41G42Bidlw/s2J0+e+hwLwEWBTjB3D16M1MeJPeIDGsw4w
         VTtXmUDtEdAHEH8zY14aH8y26ZY0omSSIKPl/LwvrJoFlDv0RIkYLx4lYkxGdGniTCtW
         XCPgW2mlXsfO1tRMkkm6S9+ILbcPInHJgFzC61eINtG+8git6WNtlgkrWo1s9Syt4/WU
         XdMrs6A9rpjVakC4RqXWJLoYUw5GdefF56y2DmieMQ5Gy3gdE+fPHTT4KldDCA9TLXOj
         Goxw==
X-Gm-Message-State: ABy/qLa3V9M8hJa5cQd8Aktf8XSMEUB7lkJw0xYIWbT0WXngkEIUzJ0p
        B6KQYBHXm/VYfHl4wzZNNlDpWrB+8T8CdHSTxSfvvw==
X-Google-Smtp-Source: APBJJlGJ2wHlfkfB3ZQ1QzikScAKQ6X408nThkn6EJ0gQwXU34hiTOLxSmGlh70SM1vVx/GFl+3ylm2hqxwKnXlu9vc=
X-Received: by 2002:a05:6214:27c4:b0:635:df49:719c with SMTP id
 ge4-20020a05621427c400b00635df49719cmr19427849qvb.22.1688532337691; Tue, 04
 Jul 2023 21:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230403221233.500485-1-marex@denx.de> <20230403221233.500485-2-marex@denx.de>
In-Reply-To: <20230403221233.500485-2-marex@denx.de>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Wed, 5 Jul 2023 10:15:01 +0530
Message-ID: <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
To:     Marek Vasut <marex@denx.de>
Cc:     dri-devel@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Michael Walle <michael@walle.cc>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marek,

On Wed, 5 Jul 2023 at 01:48, Marek Vasut <marex@denx.de> wrote:
>
> Do not generate the HS front and back porch gaps, the HSA gap and
> EOT packet, as these packets are not required. This makes the bridge
> work with Samsung DSIM on i.MX8MM and i.MX8MP.

This patch broke display on Dragonboard 845c (SDM845) devboard running
AOSP. This is what I see
https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-display/PXL_20230704_150156326.jpg.
Reverting this patch fixes this regression for me.

Regards,
Amit Pundir

>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index a25d21a7d5c19..151efe92711c4 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -774,7 +774,9 @@ static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
>         dsi->lanes = 4;
>         dsi->format = MIPI_DSI_FMT_RGB888;
>         dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> -                         MIPI_DSI_MODE_VIDEO_HSE;
> +                         MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO_NO_HSA |
> +                         MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP |
> +                         MIPI_DSI_MODE_NO_EOT_PACKET;
>
>         ret = devm_mipi_dsi_attach(dev, dsi);
>         if (ret < 0) {
> --
> 2.39.2
>
