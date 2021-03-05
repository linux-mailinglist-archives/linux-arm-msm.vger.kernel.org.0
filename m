Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82A6E32E58C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 11:01:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhCEKBP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 05:01:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhCEKAt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 05:00:49 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BA4DC061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 02:00:49 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id p21so1020239pgl.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 02:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zM4DqE6Hrw5wtZ/qa2MXCbk3VS7NdIe2/69MXBddOcg=;
        b=UhHPWUALnp8w+UTOGVhHTQwOsIWoeo15caVdd2UFWdLE2oX5j3HRrNF5GAGfDL4t6c
         rtJ61SrO+ion4b0P2sixkQXxQno9yV21nd8TTwFSs2TYmHQq0o2toi+GWo9xqJYAlGeG
         AABaGomoC9TpXIN7T/EnQshVgqlXYQ4j2+VKn4u8gC7QOYsbWJJ26KlgK2DcNUxBbUBP
         pFAyEV1WaedenkUuj6P0mwXn8IPfo/157McmFzSrSOFfDbEtGYNba2Y6UQO0F3Uy1U88
         dG7Vutif6Sf1+W7gb98ABw9bAyYo1H5Mw2ciPtesZ3sKC94CNgWczqHg5oKtOzTxG/mm
         gLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zM4DqE6Hrw5wtZ/qa2MXCbk3VS7NdIe2/69MXBddOcg=;
        b=f/TzkpRTUz+7j+iv/N8CNVXeskrONCsCC6x8wtY/W/nHHv8JrRnyRocaC7djbuLpck
         4DBtcqeHIyzhlLPEcvPRWdYrvZ8cJXViYqyT1OdPXB1gHe2igODQOJnAmTHE51Eh/HIa
         P/RZtI9YqGckwYEsgYEUDlwvg1dnM82qC8+9dWX9BWbA6i3oMfG943zGR6vxJVl+hu3N
         ovipF5T00+ynpfE4vF1f+3E0eVQTFhtWWiav9LAKtCraTYaiHfPxmACYcIfUw9Op0bdg
         Ya0n2FauTkO5yZb8ia9CeKr8iDBqQu6et5ml5CTxVUVRKomm70S93wMxw6ptrTS6o9Lu
         co+w==
X-Gm-Message-State: AOAM531wY29I525DOGDfN1GeevQ3ZuKqctvY94yhCoZGMosaprrveLid
        sunB7PjZaB30uTPYFpIEVoIGxtQVEaiTw67PwU1beg==
X-Google-Smtp-Source: ABdhPJz2v5+iIAYVbS0AzdQGii15Z+uI7HWIYl2J0SS9mRh5uPZo3XJVQ5ZGk7+ApYyS4Hnz+Pga/d9jVXFd4i319Do=
X-Received: by 2002:aa7:9843:0:b029:1ed:cc86:fa0 with SMTP id
 n3-20020aa798430000b02901edcc860fa0mr8030981pfq.39.1614938448859; Fri, 05 Mar
 2021 02:00:48 -0800 (PST)
MIME-Version: 1.0
References: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
In-Reply-To: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 5 Mar 2021 11:00:38 +0100
Message-ID: <CAG3jFyuUodAKJJ2nkQ=JNRgxDPj99jMkJNrCetfbyb_35CWxYA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/bridge: ti-sn65dsi86: Simplify refclk handling
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        Stephen Boyd <swboyd@chromium.org>,
        MSM <linux-arm-msm@vger.kernel.org>, robdclark@chromium.org,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Douglas,

Thanks for submitting this cleanup, it looks good to me.

Reviewed-by: Robert Foss <robert.foss@linaro.org>


On Fri, 5 Mar 2021 at 00:53, Douglas Anderson <dianders@chromium.org> wrote:
>
> The clock framework makes it simple to deal with an optional clock.
> You can call clk_get_optional() and if the clock isn't specified it'll
> just return NULL without complaint. It's valid to pass NULL to
> enable/disable/prepare/unprepare. Let's make use of this to simplify
> things a tiny bit.
>
> NOTE: this makes things look a tad bit asymmetric now since we check
> for NULL before clk_prepare_enable() but not for
> clk_disable_unprepare(). This seemed OK to me. We already have to
> check for NULL in the enable case anyway so why not avoid the extra
> call?

I think this is fine. Since the refclk != NULL check in
ti_sn_bridge_set_refclk_freq is in order to determine other behaviour,
the asymmetry is required.

>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index f27306c51e4d..942019842ff4 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1261,14 +1261,9 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>                 return ret;
>         }
>
> -       pdata->refclk = devm_clk_get(pdata->dev, "refclk");
> -       if (IS_ERR(pdata->refclk)) {
> -               ret = PTR_ERR(pdata->refclk);
> -               if (ret == -EPROBE_DEFER)
> -                       return ret;
> -               DRM_DEBUG_KMS("refclk not found\n");
> -               pdata->refclk = NULL;
> -       }
> +       pdata->refclk = devm_clk_get_optional(pdata->dev, "refclk");
> +       if (IS_ERR(pdata->refclk))
> +               return PTR_ERR(pdata->refclk);
>
>         ret = ti_sn_bridge_parse_dsi_host(pdata);
>         if (ret)
> --
> 2.30.1.766.gb4fecdf3b7-goog
>
