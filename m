Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E73A360C2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Apr 2021 16:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233518AbhDOOtF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Apr 2021 10:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232954AbhDOOtE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Apr 2021 10:49:04 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D44C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Apr 2021 07:48:41 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id ef17so6127033qvb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Apr 2021 07:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eQFFIM7pSZ3rNVADx3v3MXfqo0UYnXyfAUTQM2K5W9I=;
        b=YqgXOwr2Mt6Lvo/hqtmAeXPCGz6u5wu+SrcecmjKDQyC9GQaTDWQnPOyH2k0mtcoYP
         SASBrNZwIWRJ+0dEC/2PIl51tsk9Y5EvAh5TCAuBRYYfg+qfJ3ESXVTDrCbNGPaJAIXd
         G+E8vdMCY9dWUF8rh+b/jhgukZDc3iNNEg/+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eQFFIM7pSZ3rNVADx3v3MXfqo0UYnXyfAUTQM2K5W9I=;
        b=a5hCf3eJBtJ8CIQpR/rtme+0XJGCtOIu02LSezqHHxDlmXxo/5MzokhDvUzEZHsZPa
         2K9PUDmFtN+ZhOpltzunCKcQj2dVJtfPNt3LTeALYaFrHZJ9qFHC8YZeXle/pjpj0R8J
         3IifDYuR2zT8AIPP57/AEZDoEp6zzCGvkOXTZPmGWUz6BMx4pvANmnxEc+kbnlH48HK9
         qQSvXaEB4cEQTvwYbAKsYfA2dgXzJm6a+E3Ss60MXaQinJIXcP/+usQ0Kr3fAvcM2GZU
         1JhjR4sVzFcyRrWTn5i7FIpZahPZEWPpLOoU1qF0qyQG1YX/OM0qD5plRbZ7A5Y1qwRS
         45HA==
X-Gm-Message-State: AOAM5306Wf+JQFAQwq3WIa7K8w28FNNPv0dmm161kU+5lth1ill46iVz
        4FEFtMJlG3nRXvGIJYZAhGD+Ju1Mh0aiVQ==
X-Google-Smtp-Source: ABdhPJxPcPIBV8E05ZlTOOixLeaOoZ+BPUPCJrAI4CfT+jrdAgU7ernOxrU/wMauwhC1hbqI3WF/3w==
X-Received: by 2002:a0c:e950:: with SMTP id n16mr3472555qvo.43.1618498120571;
        Thu, 15 Apr 2021 07:48:40 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id k26sm2138344qkg.120.2021.04.15.07.48.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Apr 2021 07:48:38 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id g38so26414284ybi.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Apr 2021 07:48:38 -0700 (PDT)
X-Received: by 2002:a25:d847:: with SMTP id p68mr4882363ybg.345.1618498117948;
 Thu, 15 Apr 2021 07:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.1.If62a003f76a2bc4ccc6c53565becc05d2aad4430@changeid>
 <YGpeo9LV4uAh1B7u@pendragon.ideasonboard.com> <CAD=FV=UN38EiYMiwNjysBS6dReKDaf+g2GcgaVt9iF1mTRKg7A@mail.gmail.com>
 <YHedYnUrcnhRDnie@pendragon.ideasonboard.com>
In-Reply-To: <YHedYnUrcnhRDnie@pendragon.ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 15 Apr 2021 07:48:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UhqCe1r1kqVdmYOmy75j_v73RSjP0d0MX0q5zq2GVJoQ@mail.gmail.com>
Message-ID: <CAD=FV=UhqCe1r1kqVdmYOmy75j_v73RSjP0d0MX0q5zq2GVJoQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] drm/bridge: Fix the stop condition of drm_bridge_chain_pre_enable()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Apr 14, 2021 at 6:56 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Doug,
>
> On Wed, Apr 14, 2021 at 06:19:13PM -0700, Doug Anderson wrote:
> > On Sun, Apr 4, 2021 at 5:50 PM Laurent Pinchart wrote:
> > > On Fri, Apr 02, 2021 at 03:28:35PM -0700, Douglas Anderson wrote:
> > > > The drm_bridge_chain_pre_enable() is not the proper opposite of
> > > > drm_bridge_chain_post_disable(). It continues along the chain to
> > > > _before_ the starting bridge. Let's fix that.
> > > >
> > > > Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> > > > ---
> > > >
> > > > (no changes since v1)
> > > >
> > > >  drivers/gpu/drm/drm_bridge.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > > > index 64f0effb52ac..044acd07c153 100644
> > > > --- a/drivers/gpu/drm/drm_bridge.c
> > > > +++ b/drivers/gpu/drm/drm_bridge.c
> > > > @@ -522,6 +522,9 @@ void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
> > > >       list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> > > >               if (iter->funcs->pre_enable)
> > > >                       iter->funcs->pre_enable(iter);
> > > > +
> > > > +             if (iter == bridge)
> > > > +                     break;
> > >
> > > This looks good as it matches drm_atomic_bridge_chain_disable().
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > Thanks for your review here and several of the other patches. Can you
> > suggest any plan for getting them landed? It would at least be nice to
> > get the non-controversial ones landed.
>
> Do you have commit access to drm-misc ? If not, given your
> contributions, I think you qualify for it.

No, I don't have access. I searched for how to get it and read through
the qualifications and, you're right, I think I do. I've hopefully
followed the right flow and created an issue to give me ssh access:

https://gitlab.freedesktop.org/freedesktop/freedesktop/-/issues/348

Is that something you (or someone else on this CC list) approves?


> > > I'm curious though, given that the bridge passed to the function should
> > > be the one closest to the encoder, does this make a difference ?
> >
> > Yes, that's how I discovered it originally. Let's see. So if I don't
> > have this patch but have the rest of the series then I get a splat at
> > bootup. This shows that dsi_mgr_bridge_pre_enable() must be "earlier"
> > in the chain than my bridge chip. Here's the splat:
>
> Right, I think it's caused by a later patch in the series calling this
> function with a different bridge than the one closest to the encoder.

Yup! I still wanted this patch to be first in the series, though,
since it's a bugfix that we'd want to land even if the later patches
changed in some way.

-Doug
