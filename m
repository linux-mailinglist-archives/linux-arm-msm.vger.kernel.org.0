Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5667546D91B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 18:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237456AbhLHRE2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 12:04:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232702AbhLHRE1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 12:04:27 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DC2C061746
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 09:00:55 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id p19so2733788qtw.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 09:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=onSEYhphyrw5ksP9+mtXuqQI4y1ahf7sSwREYeqo+Vk=;
        b=U8ES09t94uicogVku+ptvUrOCG/mRsH6grOV+JzFSsbgAVaN/uwhgCyghkePkEVXLa
         zfzUfGDhzHAR4iRYrxBURVKWAIt6+iK/jSxeNoU5IEY5B5fgGugasWeUljP0oNPW0xlP
         rdnTKVEVJD86L2C9awUtXBciXklKczO86CEMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=onSEYhphyrw5ksP9+mtXuqQI4y1ahf7sSwREYeqo+Vk=;
        b=n6zmEj1hhL7adOPFGAvsMIgNaBuMbNuCsjXPR6EvMLwFCULqOTyKueUvqysjT2ZnYK
         sRTEiX6wyv+xZd1OJPkKs3w3EXGyuBoDj/VTbLJCa9jkCkaevz5TNKHdPLkkieGbjjrQ
         VnP2BXnA0GEnuFzwHvfvg+Lpqcm4cOM+dZeFLbReJswpJnxeYiOY3lqhQvkndq8JNJcB
         H8jCKSxu343VKyeYIhlbxTGs2iDN/7OQ4NMbEfDD73ZvG9lpPOUI2gRBRmjKbCnQEwwN
         XRkVIuD9JFrwNvnGTKm7yiWcVYbFOSHCvRFXrPSGdrJbGa7GWiStiAn6PYbxpwkEsMbu
         Vpqw==
X-Gm-Message-State: AOAM532ejP3/o0lRiBwlYyGULRJeCQ84jEaWFO/ETXWaGTMwZK5vNYCC
        GpoWVDGTF+VxAdxKTIjrmVnWzWMDxhIB8A==
X-Google-Smtp-Source: ABdhPJylxG7PI3HAmq9qH4+NmX9/RQCKkSpkhnUTOvjNsm5G+HhbVAJhkDJwkjhlhiGLAR2jQJomuw==
X-Received: by 2002:ac8:5a84:: with SMTP id c4mr9231424qtc.565.1638982854552;
        Wed, 08 Dec 2021 09:00:54 -0800 (PST)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id t15sm2058992qta.45.2021.12.08.09.00.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Dec 2021 09:00:54 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id v22so2762198qtx.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 09:00:54 -0800 (PST)
X-Received: by 2002:a05:6638:2585:: with SMTP id s5mr958081jat.68.1638982429052;
 Wed, 08 Dec 2021 08:53:49 -0800 (PST)
MIME-Version: 1.0
References: <20211207215753.635841-1-robdclark@gmail.com> <CAE-0n52gbwsJXG7=hdQhcttTbucjBv9SBq+kng2Ansc=TyqCKg@mail.gmail.com>
In-Reply-To: <CAE-0n52gbwsJXG7=hdQhcttTbucjBv9SBq+kng2Ansc=TyqCKg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 8 Dec 2021 08:53:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xg+C4U0NHC6D4HMDZ1uVVstHWdV7onHwxtTvB6yh=Ciw@mail.gmail.com>
Message-ID: <CAD=FV=Xg+C4U0NHC6D4HMDZ1uVVstHWdV7onHwxtTvB6yh=Ciw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: sn65dsi86: defer if there is no dsi host
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Dec 7, 2021 at 8:44 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Rob Clark (2021-12-07 13:57:52)
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Otherwise we don't get another shot at it if the bridge probes before
> > the dsi host is registered.  It seems like this is what *most* (but not
> > all) of the other bridges do.
> >
> > It looks like this was missed in the conversion to attach dsi host at
> > probe time.
> >
> > Fixes: c3b75d4734cb ("drm/bridge: sn65dsi86: Register and attach our DSI device at probe")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Doug Anderson <dianders@chromium.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>
> One more nit below
>
> > v2: Drop DRM_ERROR() in favor of drm_err_probe() and shift around the
> >     spot where we report the error
> > v3: Add \n and cull error msgs a bit further
> >
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 +++++++-----------
> >  1 file changed, 7 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 02b490671f8f..c2928a6409b1 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -740,10 +736,8 @@ static int ti_sn_attach_host(struct ti_sn65dsi86 *pdata)
> >         pdata->dsi = dsi;
> >
> >         ret = devm_mipi_dsi_attach(dev, dsi);
> > -       if (ret < 0) {
> > -               DRM_ERROR("failed to attach dsi to host\n");
> > +       if (ret < 0)
> >                 return ret;
> > -       }
> >
> >         return 0;
>
> This can be simplified further to
>
>         return devm_mipi_dsi_attach(dev, dsi);

Squahsed in Stephen's fix and pushed. Had to also remove "ret" which
was no longer used in this function after Stephen's change.

03848335b5b1 drm/bridge: sn65dsi86: defer if there is no dsi host

-Doug
