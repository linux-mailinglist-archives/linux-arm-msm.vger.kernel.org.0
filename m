Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDBA333C1AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 17:26:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhCOQ0K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 12:26:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233046AbhCOQZx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 12:25:53 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB04C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 09:25:52 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id t5so8043963qvs.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 09:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gyX83kAa8oRejOZLV48wckGtIGElbXGSYHKaHN6E+p0=;
        b=ZBvjVpW3JnjKWDeZQoLJQE2P2NOJJbjOljq078wY2bs65Hf2knpWsYWw2hyTqXfkkC
         aI/kYs2CQptNa/XWZ1cOBj6pyqb8IHziouehroZSs6B7Si7WIE81qcumXqNBh4vMUCTz
         bfOrG0dhxWdtGYcRuTyUuzjh00/D8kCzUUaSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gyX83kAa8oRejOZLV48wckGtIGElbXGSYHKaHN6E+p0=;
        b=sQzNu+z+gLcK4xn1TEFUaytjYwsEoFI6hFl0nytztTtyfKiBnIro/c6+6i2XDeoLcu
         pbaJDru1KkR7PkOL0vH2rVKLkd0/xhutMqa0aKikqXO1miceCkM65cwFJYrnmtvV0gQc
         xmmP90dw5zsjrMTRxWHZd1CoBIFGX9mjdfFiE3u88Akoy4v0pHXIt9UOMVyA/tu6mJn7
         NshNa4EwqvTV8ZV+vlu/SwQ74IWxA2JjpnJ1zsbd9eh+OykxD/itOv8ghsKp4TOuD26H
         tZpoM9ZbfilF2N/UOx5NQJuYRkOpQdVUuVTWtl43bcYqlFT6F8ocPekmzY+JgRXuQpTv
         JkmA==
X-Gm-Message-State: AOAM532Jc4AACjvbaWrkCrxB5ZPzje5MJSjGaBHinCi4JMf6CHrRI7I5
        w2uCtdtBA1WyUFAxM3ZGYjcvGPY7/wxoIw==
X-Google-Smtp-Source: ABdhPJyspWUiD5iLcVIz2gQFqc1qQDClGRPUkRBnPlPToCxDEIGAHKiNPH9budnXGrgGg1SrdwTMYw==
X-Received: by 2002:a05:6214:f6d:: with SMTP id iy13mr11725462qvb.24.1615825551413;
        Mon, 15 Mar 2021 09:25:51 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 124sm1524139qke.107.2021.03.15.09.25.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 09:25:49 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id b10so33846964ybn.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 09:25:48 -0700 (PDT)
X-Received: by 2002:a25:cf88:: with SMTP id f130mr709797ybg.476.1615825548355;
 Mon, 15 Mar 2021 09:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
 <20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid> <YE0ru4JpXfX/4Awe@pendragon.ideasonboard.com>
In-Reply-To: <YE0ru4JpXfX/4Awe@pendragon.ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 15 Mar 2021 09:25:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UY_S8jPkXwK6AGs99XrE=pno2sCgLE7qcPWfmoyYVXiw@mail.gmail.com>
Message-ID: <CAD=FV=UY_S8jPkXwK6AGs99XrE=pno2sCgLE7qcPWfmoyYVXiw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi86: Properly get the EDID, but
 only if refclk
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, robdclark@chromium.org,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Mar 13, 2021 at 1:17 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Doug,
>
> Thank you for the patch.
>
> On Thu, Mar 04, 2021 at 03:52:01PM -0800, Douglas Anderson wrote:
> > In commit 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over
> > DDC") we attempted to make the ti-sn65dsi86 bridge properly read the
> > EDID from the panel. That commit kinda worked but it had some serious
> > problems.
> >
> > The problems all stem from the fact that userspace wants to be able to
> > read the EDID before it explicitly enables the panel. For eDP panels,
> > though, we don't actually power the panel up until the pre-enable
> > stage and the pre-enable call happens right before the enable call
> > with no way to interject in-between. For eDP panels, you can't read
> > the EDID until you power the panel. The result was that
> > ti_sn_bridge_connector_get_modes() was always failing to read the EDID
> > (falling back to what drm_panel_get_modes() returned) until _after_
> > the EDID was needed.
> >
> > To make it concrete, on my system I saw this happen:
> > 1. We'd attach the bridge.
> > 2. Userspace would ask for the EDID (several times). We'd try but fail
> >    to read the EDID over and over again and fall back to the hardcoded
> >    modes.
> > 3. Userspace would decide on a mode based only on the hardcoded modes.
> > 4. Userspace would ask to turn the panel on.
> > 5. Userspace would (eventually) check the modes again (in Chrome OS
> >    this happens on the handoff from the boot splash screen to the
> >    browser). Now we'd read them properly and, if they were different,
> >    userspace would request to change the mode.
> >
> > The fact that userspace would always end up using the hardcoded modes
> > at first significantly decreases the benefit of the EDID
> > reading. Also: if the modes were even a tiny bit different we'd end up
> > doing a wasteful modeset and at boot.
>
> s/and at/at/ ?

Sure, I can correct if/when I respin or it can be corrected when landed.


> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 491c9c4f32d1..af3fb4657af6 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/pm_runtime.h>
> >  #include <linux/regmap.h>
> >  #include <linux/regulator/consumer.h>
> > +#include <linux/workqueue.h>
> >
> >  #include <asm/unaligned.h>
> >
> > @@ -130,6 +131,12 @@
> >   * @ln_assign:    Value to program to the LN_ASSIGN register.
> >   * @ln_polrs:     Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
> >   *
> > + * @pre_enabled_early: If true we did an early pre_enable at attach.
> > + * @pre_enable_timeout_work: Delayed work to undo the pre_enable from attach
> > + *                           if a normal pre_enable never came.
>
> Could we simplify this by using the runtime PM autosuspend feature ? The
> configuration of the bridge would be moved from pre_enable to the PM
> runtime resume handler, the clk_disable_unprepare() call moved from
> post_disable to the runtime suspend handler, and the work queue replaced
> by usage of pm_runtime_put_autosuspend().

It's an interesting idea but I don't think I can make it work, at
least not in a generic enough way. Specifically we can also use this
bridge chip as a generic GPIO provider in Linux. When someone asks us
to read a GPIO then we have to power the bridge on
(pm_runtime_get_sync()) and when someone asks us to configure a GPIO
as an output then we actually leave the bridge powered until they stop
requesting it as an output. At the moment the only user of this
functionality (that I know of) is for the HPD pin on trogdor boards
(long story about why we don't use the dedicated HPD) but the API
supports using these GPIOs for anything and I've tested that it works.
It wouldn't be great to have to keep the panel on in order to access
the GPIOs.

The other problem is that I think the time scales are different. At
boot time I think we'd want to leave the panel on for tens of seconds
to give userspace a chance to start up and configure the panel. After
userspace starts up I think we'd want autosuspend to be much faster.
This could probably be solved by tweaking the runtime delay in code
but I didn't fully dig because of the above problem.


-Doug
