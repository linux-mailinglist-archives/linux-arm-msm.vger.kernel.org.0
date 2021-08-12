Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4C7E3EAAA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 21:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232315AbhHLTJv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 15:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230424AbhHLTJv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 15:09:51 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC15C061756;
        Thu, 12 Aug 2021 12:09:25 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id f5so9690449wrm.13;
        Thu, 12 Aug 2021 12:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ALF3spy01uCB2Y9+oMc38hneuTm1l+w0EonCm4bcZFk=;
        b=A/l3ImB7fASHRe4BkKBvDPFmj6KFPwHyEUg9Vs9meUTwtNtYHjM0Ogm2PFCPj9cLJg
         hf/9lqAz1bHdZ6Ycg4153fdAnv6s6xFEPhGfCSKCq/sV24FFfckwX1xJZIkF/DWHQmyX
         FgtUTeaU0YyEYb3vzMrvSYcHuAl77P+Hmv2kwHL3bDULA6Slz87GQ5kXWVDjESC4XAws
         UZRDC0iTP0GzF9kxDcK929Lj74pNBMmB7SlpOHrkbkgRh651y0HvX9Q60+LTT2n+Iref
         M+Jfwf+2N+eOn8d5e+kN795BvdGEoJjFMdAydJR0DA55dIblPvrDUL1zHiyNm65Ge3xi
         xcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ALF3spy01uCB2Y9+oMc38hneuTm1l+w0EonCm4bcZFk=;
        b=hIwAApksraryOlKUmJwwv3sYZJXngtqDk5f6+tu5C45WBfv3Dn8nqhvI/qIVraWfNZ
         GDkl6jaf07/JZHP1eov3Bmj9VFWh97Rvo2sCAu7sK4b6WET5rcs0NlC7KEebyC7HhbdB
         Fzw3URM3Ria/uHkS/jorkCjXcwqYrpQ1QnwaR0FiQ7w5EAUxdTYNL7862qo8DYTM8/Fg
         zwW7ynRFl64ZolyOzvV2pC8uDxOzkHbXiNgnHfO1N9D38Z0+XbZYLNonquToWQQv65Y+
         vOOPL+e9LB6g1s7hi+njpbfAAU+TLbJRPN8vZv7ccFlvgAvkhtXQafbroc0MIgC69xDA
         RJlQ==
X-Gm-Message-State: AOAM5327eChqsqGyYS5wuIV/2xpuMQ7XWZZBCUd5nX+AN2EDXkf8wzDu
        EktLZvSRGohOlQQeOcDaZDNf5rNGTTZFf4e/TQ8=
X-Google-Smtp-Source: ABdhPJzVMAS60V6BHu0/bworS1aO8/6F5SqRyaXwBYmpnib7FDK0t2nY1lAbky+WX5C3LdqeOmTzbLhrJVeSg/7t2CE=
X-Received: by 2002:adf:f90e:: with SMTP id b14mr5918171wrr.28.1628795364221;
 Thu, 12 Aug 2021 12:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210811235253.924867-1-robdclark@gmail.com> <20210811235253.924867-4-robdclark@gmail.com>
 <YRVr/3A6UJIFiVWj@pendragon.ideasonboard.com>
In-Reply-To: <YRVr/3A6UJIFiVWj@pendragon.ideasonboard.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 12 Aug 2021 12:09:12 -0700
Message-ID: <CAF6AEGs8g2miQz=upd0LMPg109JR7gMeEGyd1u1jQ2WYR=oWtQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/bridge: ti-sn65dsi86: Implement bridge->mode_valid()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 12, 2021 at 11:44 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> Thank you for the patch.
>
> On Wed, Aug 11, 2021 at 04:52:49PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > For the brave new world of bridges not creating their own connectors, we
> > need to implement the max clock limitation via bridge->mode_valid()
> > instead of connector->mode_valid().
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 24 +++++++++++++++++++-----
> >  1 file changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 5d3b30b2f547..38dcc49eccaf 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -595,6 +595,15 @@ static struct auxiliary_driver ti_sn_aux_driver = {
> >       .id_table = ti_sn_aux_id_table,
> >  };
> >
> > +static enum drm_mode_status check_mode(const struct drm_display_mode *mode)
> > +{
> > +     /* maximum supported resolution is 4K at 60 fps */
> > +     if (mode->clock > 594000)
> > +             return MODE_CLOCK_HIGH;
> > +
> > +     return MODE_OK;
> > +}
> > +
> >  /* -----------------------------------------------------------------------------
> >   * DRM Connector Operations
> >   */
> > @@ -616,11 +625,7 @@ static enum drm_mode_status
> >  ti_sn_bridge_connector_mode_valid(struct drm_connector *connector,
> >                                 struct drm_display_mode *mode)
> >  {
> > -     /* maximum supported resolution is 4K at 60 fps */
> > -     if (mode->clock > 594000)
> > -             return MODE_CLOCK_HIGH;
> > -
> > -     return MODE_OK;
> > +     return check_mode(mode);
>
> Do we need to implement the connector .mode_valid() operation, given
> that the bridge is linked in the chain ?

My understanding is that we need to keep it for display drivers that
are not converted to NO_CONNECTOR..

But AFAIK snapdragon is the only upstream user of this bridge, so
after the drm/msm/dsi patch lands we could probably garbage collect
the connector support.

BR,
-R

> >  }
> >
> >  static struct drm_connector_helper_funcs ti_sn_bridge_connector_helper_funcs = {
> > @@ -763,6 +768,14 @@ static void ti_sn_bridge_detach(struct drm_bridge *bridge)
> >       drm_dp_aux_unregister(&bridge_to_ti_sn65dsi86(bridge)->aux);
> >  }
> >
> > +static enum drm_mode_status
> > +ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
> > +                     const struct drm_display_info *info,
> > +                     const struct drm_display_mode *mode)
> > +{
> > +     return check_mode(mode);
> > +}
> > +
> >  static void ti_sn_bridge_disable(struct drm_bridge *bridge)
> >  {
> >       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> > @@ -1118,6 +1131,7 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> >  static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
> >       .attach = ti_sn_bridge_attach,
> >       .detach = ti_sn_bridge_detach,
> > +     .mode_valid = ti_sn_bridge_mode_valid,
> >       .pre_enable = ti_sn_bridge_pre_enable,
> >       .enable = ti_sn_bridge_enable,
> >       .disable = ti_sn_bridge_disable,
>
> --
> Regards,
>
> Laurent Pinchart
