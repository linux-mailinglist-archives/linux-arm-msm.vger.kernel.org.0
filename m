Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F182321079
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 06:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbhBVFcP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 00:32:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbhBVFcJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 00:32:09 -0500
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A70CC06178A
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Feb 2021 21:31:29 -0800 (PST)
Received: by mail-ua1-x932.google.com with SMTP id r19so3663595uak.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Feb 2021 21:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gu/fKr3GRAQ+ErLkQJBUlVQcwe14YTdgKKhXg0Cv4l4=;
        b=nKDy+b2+V7fS2f7mnoG/Ss5+uvRYBQnercKoIeTycpfWKJxx6kOPPx2ZeMe5ucP5Iv
         50sS1bwNYdUpsm04AudIWrPnD+CNDRIBtKgv/9JUPjkbQlh1RAybhdP7pPk7uV3lZTxy
         I4/U2OZz5f4aafI7BWCv88whwJWIfvn83D3IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gu/fKr3GRAQ+ErLkQJBUlVQcwe14YTdgKKhXg0Cv4l4=;
        b=lSKLIAS2FjLGDW2D4j7VXu6ksx38gzJxDbkUrUluY7Mgl4SycB+rvMyD9zR6JUxtXX
         jjEMv50AClVCX/2zMn45cIGAUraiHjt58TtVTJwSTOiFSd3z5jt1RF9j2en8N0QwQn/P
         h+YovNK5bhmRqc+erWph6/Bx314EydaZna9kgfuKxM8VaJdbOFw57DX4zsBbZj1bx1n6
         xmONPj1/27ftyNcxbK7W1hObPcWA+dyAg5NyyP0t4VK4QHn9KafOx9C0rXi1YE2rRllq
         Vo7mJCn884uVXJl/ru9MwIo+y8m83H0E5ItpQtEkmfMANnjCyy1vLf6DKiIUXIv19iv4
         dhtw==
X-Gm-Message-State: AOAM531Eq6m8vfXvvxo7egccyJ3vkn7NEwX9iT65ZWFNkkACT5EOgh5c
        XyEvBlVC4vXNcUmlXfNpWucqLLG9c4uRbEpcsb72yA==
X-Google-Smtp-Source: ABdhPJys5c+rCVxUlnAkJ7c+Jss6rAjW1MoFOcoVaCF3S96QpX3HiNwsT/MLRIitrpXf+DKZerK3D3cbUQdqljXKnGs=
X-Received: by 2002:ab0:1052:: with SMTP id g18mr3262401uab.74.1613971888653;
 Sun, 21 Feb 2021 21:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
 <YDKvm1QmdJtJbaN6@pendragon.ideasonboard.com>
In-Reply-To: <YDKvm1QmdJtJbaN6@pendragon.ideasonboard.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Mon, 22 Feb 2021 13:31:17 +0800
Message-ID: <CANMq1KALq+C2GD2uRohKpwvkDC05-fHyo=_WoHwnsKNjgcSfEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling features
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
        Linus Walleij <linus.walleij@linaro.org>,
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
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 22, 2021 at 3:08 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Nicolas,
>
> Thank you for the patch.
>
> On Thu, Feb 11, 2021 at 11:33:55AM +0800, Nicolas Boichat wrote:
> > Many of the DSI flags have names opposite to their actual effects,
> > e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> > be disabled. Fix this by including _NO_ in the flag names, e.g.
> > MIPI_DSI_MODE_NO_EOT_PACKET.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
>
> This looks good to me, it increases readability.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Please however see the end of the mail for a comment.
>
> > ---
> > I considered adding _DISABLE_ instead, but that'd make the
> > flag names a big too long.
> >
> > Generated with:
> > flag=MIPI_DSI_MODE_VIDEO_HFP; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HFP/" {}
> > flag=MIPI_DSI_MODE_VIDEO_HBP; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HBP/" {}
> > flag=MIPI_DSI_MODE_VIDEO_HSA; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HSA/" {}
> > flag=MIPI_DSI_MODE_EOT_PACKET; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_NO_EOT_PACKET/" {}
> > (then minor format changes)
>
> Ever tried coccinelle ? :-)

Fun project for next time ,-)

>
> >  drivers/gpu/drm/bridge/adv7511/adv7533.c             | 2 +-
> >  drivers/gpu/drm/bridge/analogix/anx7625.c            | 2 +-
> >  drivers/gpu/drm/bridge/cdns-dsi.c                    | 4 ++--
> >  drivers/gpu/drm/bridge/tc358768.c                    | 2 +-
> >  drivers/gpu/drm/exynos/exynos_drm_dsi.c              | 8 ++++----
> >  drivers/gpu/drm/mcde/mcde_dsi.c                      | 2 +-
> >  drivers/gpu/drm/mediatek/mtk_dsi.c                   | 2 +-
> >  drivers/gpu/drm/msm/dsi/dsi_host.c                   | 8 ++++----
> >  drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c | 2 +-
> >  drivers/gpu/drm/panel/panel-dsi-cm.c                 | 2 +-
> >  drivers/gpu/drm/panel/panel-elida-kd35t133.c         | 2 +-
> >  drivers/gpu/drm/panel/panel-khadas-ts050.c           | 2 +-
> >  drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c   | 2 +-
> >  drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c   | 2 +-
> >  drivers/gpu/drm/panel/panel-novatek-nt35510.c        | 2 +-
> >  drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c   | 2 +-
> >  drivers/gpu/drm/panel/panel-samsung-s6d16d0.c        | 2 +-
> >  drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c     | 2 +-
> >  drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c    | 2 +-
> >  drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c        | 4 ++--
> >  drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c      | 2 +-
> >  drivers/gpu/drm/panel/panel-simple.c                 | 2 +-
> >  drivers/gpu/drm/panel/panel-sony-acx424akp.c         | 2 +-
> >  drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c     | 2 +-
> >  include/drm/drm_mipi_dsi.h                           | 8 ++++----
> >  25 files changed, 36 insertions(+), 36 deletions(-)
> >
> > []
> > diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> > index 360e6377e84b..ba91cf22af51 100644
> > --- a/include/drm/drm_mipi_dsi.h
> > +++ b/include/drm/drm_mipi_dsi.h
> > @@ -119,15 +119,15 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
> >  /* enable hsync-end packets in vsync-pulse and v-porch area */
> >  #define MIPI_DSI_MODE_VIDEO_HSE              BIT(4)
>
> We're mixing bits that enable a feature and bits that disable a feature.
> Are these bits defined in the DSI spec, or internal to DRM ? In the
> latter case, would it make sense to standardize on one "polarity" ? That
> would be a more intrusive change in drivers though.

Yes, that'd require auditing every single code path and reverse the
logic as needed. I'm not volunteering for that ,-P (hopefully the
current change is still an improvement).

Hopefully real DSI experts can comment (Andrzej?), I think the default
are sensible settings?


>
> >  /* disable hfront-porch area */
> > -#define MIPI_DSI_MODE_VIDEO_HFP              BIT(5)
> > +#define MIPI_DSI_MODE_VIDEO_NO_HFP   BIT(5)
> >  /* disable hback-porch area */
> > -#define MIPI_DSI_MODE_VIDEO_HBP              BIT(6)
> > +#define MIPI_DSI_MODE_VIDEO_NO_HBP   BIT(6)
> >  /* disable hsync-active area */
> > -#define MIPI_DSI_MODE_VIDEO_HSA              BIT(7)
> > +#define MIPI_DSI_MODE_VIDEO_NO_HSA   BIT(7)
> >  /* flush display FIFO on vsync pulse */
> >  #define MIPI_DSI_MODE_VSYNC_FLUSH    BIT(8)
> >  /* disable EoT packets in HS mode */
> > -#define MIPI_DSI_MODE_EOT_PACKET     BIT(9)
> > +#define MIPI_DSI_MODE_NO_EOT_PACKET  BIT(9)
> >  /* device supports non-continuous clock behavior (DSI spec 5.6.1) */
> >  #define MIPI_DSI_CLOCK_NON_CONTINUOUS        BIT(10)
> >  /* transmit data in low power */
>
> --
> Regards,
>
> Laurent Pinchart
