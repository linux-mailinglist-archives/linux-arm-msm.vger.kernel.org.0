Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD8C446EDDC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 17:54:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241387AbhLIQ5f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 11:57:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241429AbhLIQ53 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 11:57:29 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B3DC061B38
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Dec 2021 08:53:55 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id w14so5417676qkf.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Dec 2021 08:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7e5IwLXDcnVxLSB4R+f6+X1HWOq4wGxDFCBmZFjLBmE=;
        b=NU2Uwiz7WVME0WS3o8uog1Izcjg27/QNtqmeR6SCL4cRk6gxj6UHE5JxdyV6SJh4lU
         PUOJpRlLuxnfODyKHmio2Be4+DIJp6tVkJBPtMlIEPPB5xEU/sOznApNc7P5YONUc3J+
         55qcRwtga7SVfve2u8aLk56kIE7RMzw2b0aAm/EoVMC9Qq9HqemYa8qIEO6YDmajst7y
         HnLzoZx+THqzzoqi+Q7/mI15C5EoE5ZJGrTTIJwN5I/RAEfV3NGXzTWPeg7G6ZikBvuL
         8mr4Q0/qb3CQ7cehIHpONzHHtQjgm37XbfGTiWG1LUpDeKL9ir4FqkMIBGOoIKycYyFH
         Ljpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7e5IwLXDcnVxLSB4R+f6+X1HWOq4wGxDFCBmZFjLBmE=;
        b=uKK5roNzdjF3MKEFki511lx1frx61O/4+q2ToFbqzgzmZuxgOytQWvhgWk/NzeNPeu
         N0319uJ27FyHTvoRYf0hMtrJr7lDqZFG9Hm+jdpe80pwa4ZJgFYCi9sXEOlGi+4sdvIv
         AIybaUV0HH+Tv2uvJsgu3sKeuk4tWMz++0R104J8osPIX0UUuJFO9w8ZAmV/MmUtPPOC
         AXWyqg6JBo8X2wGufh/ecmpM5tzUlUpRkRGqQP1ER6VdUTHcI1qpKsqOLLpEw8tmvq2J
         2OVyShjyp5Kf2qjKTcdfhGSwaoG/vB3XmfRT9Qh8aLZKGHTFnZAmGYjPo9MmsUvE325i
         KPaQ==
X-Gm-Message-State: AOAM532x9Hhkm3MrUW6dAlpsu/q4qp/NQu53wHKJd9pFtA14N4fn+AvW
        iN43PhIJLLQtBOJaVFrldrldmKVayFABBqYsSXGfig==
X-Google-Smtp-Source: ABdhPJxzM04eajeUiL2h9GaGeHxzfl/dU1qgt/ORL/Yyt27nedtrgGnX3a45dK/48RFT+DueFMcE/gJNRbaGkJ9BNiQ=
X-Received: by 2002:a05:620a:c50:: with SMTP id u16mr15322380qki.203.1639068834695;
 Thu, 09 Dec 2021 08:53:54 -0800 (PST)
MIME-Version: 1.0
References: <20211126003227.1031347-1-dmitry.baryshkov@linaro.org> <CAPY8ntBrhYAmsraDqJGuTrSL6VjGXBAMVoN7xweV7E4qZv+v3Q@mail.gmail.com>
In-Reply-To: <CAPY8ntBrhYAmsraDqJGuTrSL6VjGXBAMVoN7xweV7E4qZv+v3Q@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 9 Dec 2021 19:53:43 +0300
Message-ID: <CAA8EJpoDw1R=gBrtMM9_AjufViJE3h10dYoEic19wE6mSKMxvg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/ bridge: tc358762: move bridge init to enable callback
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        DRI Development <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

On Fri, 26 Nov 2021 at 14:56, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Dmitry
>
> On Fri, 26 Nov 2021 at 00:32, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > During the pre_enable time the previous bridge (e.g. DSI host) might be
> > not initialized yet. Move the regulator enablement and bridge init to
> > te enable callback (and consequently regulator disblement to disable).
>
> Except that in the enable callback the DSI host has video enabled too,
> so the data lanes may be in HS mode too, and the bridge may not be
> prepared to accept that during power on / initialisation. That means
> you've got a race condition over how quickly the composition hardware
> starts producing pixel data vs when this enable callback is called. I
> suspect that is why we had [1] for the rare case when the race
> condition failed.
> There's also seems to be no guarantee that a host can do LP commands
> between HS video packets (eg sunxi [2])

I see.

>
> This is the same issue that was being hacked around in [3], and is one
> of the questions I'd raised back in July [4].
> The DSI support is broken when it comes to accommodating
> initialisation sequences, but in trying to ensure all possible
> sequences can be accomodated, all currently proposed solutions have
> been shot down.
> Some platforms have worked around it by powering up the DSI host in
> mode_set (dw-mipi-dsi),

Looks like this approach is supported by panel-bridge, so I have
proposed a similar change to the msm dsi driver. [5]

> others have broken the bridge chain apart so
> their pre_enable gets called first (exynos and currently vc4) except
> that approach is broken for the atomic API.
>
> There is a need for some form of resolution, even if it is only
> documenting the correct hack to implement in the DSI host driver.
> Hacking bridge or panel drivers to try and workaround it seems wrong.

Thank you for this lengthy explanation, background and pointers. This
helped a lot.

It really looks like we need a separate callback between pre-enable
and enable (or before pre-enable, but that would break the 'clocks not
enabled' constraint.

Another option would be to move video mode enablement from bridge ops
to dsi host interface, making the panel/bridge implicitly tell the
host to switch from LP to HS mode.
This way the bridge's enable() callback would start with the DSI host
powered up, but not sending the video, so the DSI device can send
setup commands. Then it'd enable the video/cmd mode on the DSI host
and then make final adjustments (like enabling the backlight/etc, so
that the video is visible/sent to the next item in a chain. WDYT?

> [1] https://lists.freedesktop.org/archives/dri-devel/2021-September/322119.html
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c#n776
> [3] https://lists.freedesktop.org/archives/dri-devel/2021-November/332003.html
> [4] https://lists.freedesktop.org/archives/dri-devel/2021-July/313576.html

[5] https://patchwork.freedesktop.org/patch/465764/?series=97688&rev=1

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/tc358762.c | 20 ++++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
> > index 7104828024fd..ebdf771a1e49 100644
> > --- a/drivers/gpu/drm/bridge/tc358762.c
> > +++ b/drivers/gpu/drm/bridge/tc358762.c
> > @@ -64,7 +64,7 @@ struct tc358762 {
> >         struct drm_connector connector;
> >         struct regulator *regulator;
> >         struct drm_bridge *panel_bridge;
> > -       bool pre_enabled;
> > +       bool enabled;
> >         int error;
> >  };
> >
> > @@ -125,26 +125,26 @@ static int tc358762_init(struct tc358762 *ctx)
> >         return tc358762_clear_error(ctx);
> >  }
> >
> > -static void tc358762_post_disable(struct drm_bridge *bridge)
> > +static void tc358762_disable(struct drm_bridge *bridge)
> >  {
> >         struct tc358762 *ctx = bridge_to_tc358762(bridge);
> >         int ret;
> >
> >         /*
> > -        * The post_disable hook might be called multiple times.
> > +        * The disable hook might be called multiple times.
> >          * We want to avoid regulator imbalance below.
> >          */
> > -       if (!ctx->pre_enabled)
> > +       if (!ctx->enabled)
> >                 return;
> >
> > -       ctx->pre_enabled = false;
> > +       ctx->enabled = false;
> >
> >         ret = regulator_disable(ctx->regulator);
> >         if (ret < 0)
> >                 dev_err(ctx->dev, "error disabling regulators (%d)\n", ret);
> >  }
> >
> > -static void tc358762_pre_enable(struct drm_bridge *bridge)
> > +static void tc358762_enable(struct drm_bridge *bridge)
> >  {
> >         struct tc358762 *ctx = bridge_to_tc358762(bridge);
> >         int ret;
> > @@ -157,7 +157,7 @@ static void tc358762_pre_enable(struct drm_bridge *bridge)
> >         if (ret < 0)
> >                 dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
> >
> > -       ctx->pre_enabled = true;
> > +       ctx->enabled = true;
> >  }
> >
> >  static int tc358762_attach(struct drm_bridge *bridge,
> > @@ -170,8 +170,8 @@ static int tc358762_attach(struct drm_bridge *bridge,
> >  }
> >
> >  static const struct drm_bridge_funcs tc358762_bridge_funcs = {
> > -       .post_disable = tc358762_post_disable,
> > -       .pre_enable = tc358762_pre_enable,
> > +       .disable = tc358762_disable,
> > +       .enable = tc358762_enable,
> >         .attach = tc358762_attach,
> >  };
> >
> > @@ -218,7 +218,7 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
> >         mipi_dsi_set_drvdata(dsi, ctx);
> >
> >         ctx->dev = dev;
> > -       ctx->pre_enabled = false;
> > +       ctx->enabled = false;
> >
> >         /* TODO: Find out how to get dual-lane mode working */
> >         dsi->lanes = 1;
> > --
> > 2.33.0
> >



-- 
With best wishes
Dmitry
