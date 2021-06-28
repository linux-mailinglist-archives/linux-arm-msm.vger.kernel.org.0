Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 351373B5CF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 13:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbhF1LND (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Jun 2021 07:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232781AbhF1LNC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Jun 2021 07:13:02 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0DE4C061767
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 04:10:36 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id d13so25072077ljg.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 04:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bWqtZ2im8bhpe7wgbjV8zsEbbfLVDc0iR3ke9Y3lfWw=;
        b=GWKNCASd9MPmyxEUsoGR9JzIVqWCjK0OSZF1l1oCdifzvEDMqh0KUYe3MV8Dgbr+PA
         la9gyUtlwDg0n3+3jlE9gokVLM6wdEqMHpYm1GUNKILSnuRdU+RgBU7sRxOUjljpyx1u
         zKT2T7iMjOJzomPtHeovnBESXt8hdlSg1o9l9GDzfxR/6G/S3tgN1K7+yyCGozJ1EgyI
         9PvkiqVsL1bXqLvS7gQ+U/3JwHmPIo1Hy4i7AHzDiPuPyOEXwm7HJstY+KYKcy+at9Yg
         H1VQ4aM1iq7p8brNaOJS61SqZPEocFRr1bHCErosV2zAZJTQ2DzKJf/Yr1Gt16mOzVxo
         1abQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bWqtZ2im8bhpe7wgbjV8zsEbbfLVDc0iR3ke9Y3lfWw=;
        b=ErpSdAfgmNsFpyGZ6hl6eI1+yUzZmviVTJZG8qxyiySph4oHyB9cWUDFCBv1UkeYrz
         v/v9jjeZh4L1gO6ssOMBkbVBeI21Lh0OwjibHYo6xuOyw/J9AdfMwHYnj45m2yf5zON0
         ZNgWcjE0YXEY40lVzLIOR/udMGLyqJSiz105pGQ6IwxJqYUmhLKxgLbkXn5Ty7M2AgjQ
         zz1k/WAhz+Ai19qot3FZc5AR+dOJ+O+Cq2bAQOsl2occYPZdc0SLsIy8qS6dlV+ltggJ
         NFidz5MlcoTkyOUJqO+ReeXFPhBcgBiUu+F4LTSK2BDnB+luo9+xonbzRRGD9Uimrfdv
         nV5g==
X-Gm-Message-State: AOAM533ljcFiF5bbJhGZeSfHBSbRF5RwmWqjbSNNTBU9n6l7AqTWz8iY
        DKfh+990ARgC7aiUkSqkERh39KCLBlecuvUa7najYg==
X-Google-Smtp-Source: ABdhPJzyEQpk+qVTQTN61ga94Up2dG17/tdSZ8ryGBxDStAhbzvUPZemkx4xWP9DPdoHPznWcXaHK8zDx3IUoLZtJDU=
X-Received: by 2002:a2e:9483:: with SMTP id c3mr19694556ljh.273.1624878635125;
 Mon, 28 Jun 2021 04:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
 <CACRpkdbQa3BZwgtp3=061cu+y+4qkMqtXQhXH_VuHB3KcLyDCA@mail.gmail.com> <CANMq1KAsvXZAjmYCMQsAUwpkzuA9-PRnNWkpsLuNbOkP6DixGA@mail.gmail.com>
In-Reply-To: <CANMq1KAsvXZAjmYCMQsAUwpkzuA9-PRnNWkpsLuNbOkP6DixGA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 28 Jun 2021 13:10:23 +0200
Message-ID: <CACRpkdYK3nw890YFNxgtrwDvxcoeNVu7MxqUw94NN_6PiYxkJQ@mail.gmail.com>
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

On Wed, Mar 3, 2021 at 11:31 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
> On Mon, Mar 1, 2021 at 4:59 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> > >                 dsi->mode_flags =
> > >                         MIPI_DSI_CLOCK_NON_CONTINUOUS |
> > > -                       MIPI_DSI_MODE_EOT_PACKET;
> > > +                       MIPI_DSI_MODE_NO_EOT_PACKET;
> >
> > Same, just delete the flag.
> >
> > These are all just semantic bugs due to the ambiguity of the flags, it is
> > possible to provide a Fixes: flag for each file using this flag the wrong way
> > but I dunno if it's worth it.
>
> Wow nice catch.
>
> I think we should fix all of those _before_ my patch is applied, with
> proper Fixes tags so that this can be backported to stable branches,
> even if it's a no-op. I can look into it but that may take a bit of
> time.

This is fixed now, please will you proceed with this patch, because I
really like it!

Yours,
Linus Walleij
