Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 618A436DD4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 18:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241147AbhD1Qnq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 12:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhD1Qnq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 12:43:46 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB3AC061573
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 09:43:01 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id d12so9068195qtr.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 09:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=//UO2IjJqBIxaWSoAlfPA77HhIEosOhf6+vv78gfMgc=;
        b=Sb32zysRjoegxCScU/eqzs7T0aXi9ZWfG28GsmoYSJM387iS073EN9yXEQDCWId+uZ
         jsqHpX/Whj8LYUthaggplNBubdKnAh9Fxy+1nxIl/Dxe3W1PMsXoZjO4KnmBTLWuRfsq
         n5ht2NKrpOqDV2SXNDLOXW2w8oUlIroGk2FWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=//UO2IjJqBIxaWSoAlfPA77HhIEosOhf6+vv78gfMgc=;
        b=oFi9OHaYWaC+ENvK1eQt18ejlckIDtdT09gsQU8LrQ7nrFUMPJTblPJskwWQ8hxb08
         2kxJ+lrthE6BSbGnjESG8+7DNxiGMNv5/7b3u1pQPeA6CosdMKisTVl3gswYCWZLtU0H
         p5A3CJE6nxcTbPReBRTVekHrJB9zI4/HgFcXkYVDrvRnR/q8raCn67N6Swm6FSnKk5Hd
         ziSMSiw0v5DnZaK/A/OvGHjiRuhJO1WNEHGsDtCLdM5s7WwOpysGf9Bv4oG72jGdx/Ds
         /wrCreOyt6sT5XCXOcHoVK9at5tH7tMMJksda7l4cNLiwXaneCBwT9PYM6eIWdn/t85A
         hBBA==
X-Gm-Message-State: AOAM5307J+bI9T4Pzpn2uDfw3lJ6TAOOzE/1uETAfqMV0kdrCcujfzFL
        9nmCKO8xaBmLcvECqlPycEtWiwZGWdcmgw==
X-Google-Smtp-Source: ABdhPJw1GhTMp2+nno7D+kRpS5qu4yknLRRG2jIfQDW4L2w3u4y+Fc+6bHJ50vabsLWF2Bb3+eFBQA==
X-Received: by 2002:ac8:4896:: with SMTP id i22mr27978397qtq.114.1619628180224;
        Wed, 28 Apr 2021 09:43:00 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id e15sm154124qkm.129.2021.04.28.09.42.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 09:43:00 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id q192so21065464ybg.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 09:42:59 -0700 (PDT)
X-Received: by 2002:a25:382:: with SMTP id 124mr19716461ybd.25.1619627746944;
 Wed, 28 Apr 2021 09:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org> <20210423095743.v5.10.I40eeedc23459d1e3fc96fa6cdad775d88c6e706c@changeid>
In-Reply-To: <20210423095743.v5.10.I40eeedc23459d1e3fc96fa6cdad775d88c6e706c@changeid>
From:   Sean Paul <seanpaul@chromium.org>
Date:   Wed, 28 Apr 2021 12:35:09 -0400
X-Gmail-Original-Message-ID: <CAOw6vbJj327Y0vtzwm=aOqwyHScE5XYG2LDw6TxCh_N+rCJ9kQ@mail.gmail.com>
Message-ID: <CAOw6vbJj327Y0vtzwm=aOqwyHScE5XYG2LDw6TxCh_N+rCJ9kQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/20] drm/panel: panel-simple: Get rid of hacky HPD
 chicken-and-egg code
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>,
        robdclark@chromium.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 23, 2021 at 1:00 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> When I added support for the hpd-gpio to simple-panel in commit
> 48834e6084f1 ("drm/panel-simple: Support hpd-gpios for delaying
> prepare()"), I added a special case to handle a circular dependency I
> was running into on the ti-sn65dsi86 bridge chip. On my board the
> hpd-gpio is actually provided by the bridge chip. That was causing
> some circular dependency problems that I had to work around by getting
> the hpd-gpio late.
>
> I've now reorganized the ti-sn65dsi86 bridge chip driver to be a
> collection of sub-drivers. Now the GPIO part can probe separately and
> that breaks the chain. Let's get rid of the old code to clean things
> up.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/panel/panel-simple.c | 24 +++++-------------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 9746eda6f675..bd208abcbf07 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -366,8 +366,7 @@ static int panel_simple_unprepare(struct drm_panel *panel)
>         return 0;
>  }
>
> -static int panel_simple_get_hpd_gpio(struct device *dev,
> -                                    struct panel_simple *p, bool from_probe)
> +static int panel_simple_get_hpd_gpio(struct device *dev, struct panel_simple *p)
>  {
>         int err;
>
> @@ -375,17 +374,10 @@ static int panel_simple_get_hpd_gpio(struct device *dev,
>         if (IS_ERR(p->hpd_gpio)) {
>                 err = PTR_ERR(p->hpd_gpio);
>
> -               /*
> -                * If we're called from probe we won't consider '-EPROBE_DEFER'
> -                * to be an error--we'll leave the error code in "hpd_gpio".
> -                * When we try to use it we'll try again.  This allows for
> -                * circular dependencies where the component providing the
> -                * hpd gpio needs the panel to init before probing.
> -                */
> -               if (err != -EPROBE_DEFER || !from_probe) {
> +               if (err != -EPROBE_DEFER)
>                         dev_err(dev, "failed to get 'hpd' GPIO: %d\n", err);
> -                       return err;
> -               }
> +
> +               return err;
>         }
>
>         return 0;
> @@ -416,12 +408,6 @@ static int panel_simple_prepare_once(struct panel_simple *p)
>                 msleep(delay);
>
>         if (p->hpd_gpio) {
> -               if (IS_ERR(p->hpd_gpio)) {
> -                       err = panel_simple_get_hpd_gpio(dev, p, false);
> -                       if (err)
> -                               goto error;
> -               }
> -
>                 if (p->desc->delay.hpd_absent_delay)
>                         hpd_wait_us = p->desc->delay.hpd_absent_delay * 1000UL;
>                 else
> @@ -682,7 +668,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>
>         panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
>         if (!panel->no_hpd) {
> -               err = panel_simple_get_hpd_gpio(dev, panel, true);
> +               err = panel_simple_get_hpd_gpio(dev, panel);
>                 if (err)
>                         return err;
>         }
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
