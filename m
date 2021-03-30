Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB7F334DEEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 04:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbhC3C52 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 22:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbhC3C5V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 22:57:21 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1865EC061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 19:57:20 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id c6so10968506qtc.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 19:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cxay6FlHRSJBcHnRsAPE6LIZ5EwuFLA1D75XOP/1yw8=;
        b=Rxyfz1b9FAnZKOn9WInbM1Q9jzMo0+uNBQs9kvY8UIXW/wmArOJB+2SssyFq+lD9Cl
         OOgZezFD8udfExokzGwpTwuXrLEyI33lrZ+u0SU1gjYN4Npju1XSWspYQ+Gh8Zfl0Cjk
         cC36+I7Hayxwa0DT+Qk8lZ0JrIQFOGxZ+kJQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cxay6FlHRSJBcHnRsAPE6LIZ5EwuFLA1D75XOP/1yw8=;
        b=q0AklCxud94sHQl8QdErixw6qbn8PzLhn6e88ONzJGFMdwOT5aFu/3bk0gsEDS+KOB
         B3zkmjBhkBhDSMnhvA8H7iomW9isA0Cs2t+B7DIdjIiwRin/3R6wXQ39O0LKtAiw3WQF
         xaZdRyZ4aWEOWg5gXAS2YB8HWRRCqNA9TCttR11HbAIXtUGeCoMvHjOm6UppT2piDONJ
         RCEdk9154Rq3sfivofAJMVxWFwVmw3JG0lxNg6lB1ZLD9OJQX8NlV353Z4edtBx2SvLz
         9LGyJHpKO5tjKOJsiIU9v6STgVNNceXjdsxt46I5WKrXPVx7YgeoaVrSr6bAh6lBHwIX
         vbGw==
X-Gm-Message-State: AOAM5327nB8mAvjGwK12vg/3EDy3H/v0iTyQH3bSwEFQRSD9vreTdwAl
        +DK+6vz/MYRc1g0eTzljep6UcXCcxBSTKw==
X-Google-Smtp-Source: ABdhPJw3j6k/o5sezMadZf204mZ7D5amCfGxvOjXf21Mn7d+kuToDJER844iS83d9ASV4+7CnJXdIw==
X-Received: by 2002:ac8:46c9:: with SMTP id h9mr14107769qto.283.1617073038889;
        Mon, 29 Mar 2021 19:57:18 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id r7sm12279922qtm.88.2021.03.29.19.57.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Mar 2021 19:57:17 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id x189so15862754ybg.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 19:57:17 -0700 (PDT)
X-Received: by 2002:a25:74ca:: with SMTP id p193mr20204173ybc.405.1617073036989;
 Mon, 29 Mar 2021 19:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
 <20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid>
 <YE0ru4JpXfX/4Awe@pendragon.ideasonboard.com> <CAD=FV=UY_S8jPkXwK6AGs99XrE=pno2sCgLE7qcPWfmoyYVXiw@mail.gmail.com>
 <YFEnKgwEOWdeQBK6@pendragon.ideasonboard.com> <CAD=FV=W5fpyEf4AqJ+dZ7i_rD_PE40MyNsYNydhPi4BHkEfQcQ@mail.gmail.com>
In-Reply-To: <CAD=FV=W5fpyEf4AqJ+dZ7i_rD_PE40MyNsYNydhPi4BHkEfQcQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 29 Mar 2021 19:57:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UOk-PUREc-UOPqUDuhPAEUsBfx0LOAQHd9KkLAhpr7Tg@mail.gmail.com>
Message-ID: <CAD=FV=UOk-PUREc-UOPqUDuhPAEUsBfx0LOAQHd9KkLAhpr7Tg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi86: Properly get the EDID, but
 only if refclk
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Mar 16, 2021 at 5:44 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Mar 16, 2021 at 2:46 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Doug,
> >
> > On Mon, Mar 15, 2021 at 09:25:37AM -0700, Doug Anderson wrote:
> > > On Sat, Mar 13, 2021 at 1:17 PM Laurent Pinchart wrote:
> > > > On Thu, Mar 04, 2021 at 03:52:01PM -0800, Douglas Anderson wrote:
> > > > > In commit 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over
> > > > > DDC") we attempted to make the ti-sn65dsi86 bridge properly read the
> > > > > EDID from the panel. That commit kinda worked but it had some serious
> > > > > problems.
> > > > >
> > > > > The problems all stem from the fact that userspace wants to be able to
> > > > > read the EDID before it explicitly enables the panel. For eDP panels,
> > > > > though, we don't actually power the panel up until the pre-enable
> > > > > stage and the pre-enable call happens right before the enable call
> > > > > with no way to interject in-between. For eDP panels, you can't read
> > > > > the EDID until you power the panel. The result was that
> > > > > ti_sn_bridge_connector_get_modes() was always failing to read the EDID
> > > > > (falling back to what drm_panel_get_modes() returned) until _after_
> > > > > the EDID was needed.
> > > > >
> > > > > To make it concrete, on my system I saw this happen:
> > > > > 1. We'd attach the bridge.
> > > > > 2. Userspace would ask for the EDID (several times). We'd try but fail
> > > > >    to read the EDID over and over again and fall back to the hardcoded
> > > > >    modes.
> > > > > 3. Userspace would decide on a mode based only on the hardcoded modes.
> > > > > 4. Userspace would ask to turn the panel on.
> > > > > 5. Userspace would (eventually) check the modes again (in Chrome OS
> > > > >    this happens on the handoff from the boot splash screen to the
> > > > >    browser). Now we'd read them properly and, if they were different,
> > > > >    userspace would request to change the mode.
> > > > >
> > > > > The fact that userspace would always end up using the hardcoded modes
> > > > > at first significantly decreases the benefit of the EDID
> > > > > reading. Also: if the modes were even a tiny bit different we'd end up
> > > > > doing a wasteful modeset and at boot.
> > > >
> > > > s/and at/at/ ?
> > >
> > > Sure, I can correct if/when I respin or it can be corrected when landed.
> > >
> > > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > > index 491c9c4f32d1..af3fb4657af6 100644
> > > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > > @@ -16,6 +16,7 @@
> > > > >  #include <linux/pm_runtime.h>
> > > > >  #include <linux/regmap.h>
> > > > >  #include <linux/regulator/consumer.h>
> > > > > +#include <linux/workqueue.h>
> > > > >
> > > > >  #include <asm/unaligned.h>
> > > > >
> > > > > @@ -130,6 +131,12 @@
> > > > >   * @ln_assign:    Value to program to the LN_ASSIGN register.
> > > > >   * @ln_polrs:     Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
> > > > >   *
> > > > > + * @pre_enabled_early: If true we did an early pre_enable at attach.
> > > > > + * @pre_enable_timeout_work: Delayed work to undo the pre_enable from attach
> > > > > + *                           if a normal pre_enable never came.
> > > >
> > > > Could we simplify this by using the runtime PM autosuspend feature ? The
> > > > configuration of the bridge would be moved from pre_enable to the PM
> > > > runtime resume handler, the clk_disable_unprepare() call moved from
> > > > post_disable to the runtime suspend handler, and the work queue replaced
> > > > by usage of pm_runtime_put_autosuspend().
> > >
> > > It's an interesting idea but I don't think I can make it work, at
> > > least not in a generic enough way. Specifically we can also use this
> > > bridge chip as a generic GPIO provider in Linux. When someone asks us
> > > to read a GPIO then we have to power the bridge on
> > > (pm_runtime_get_sync()) and when someone asks us to configure a GPIO
> > > as an output then we actually leave the bridge powered until they stop
> > > requesting it as an output. At the moment the only user of this
> > > functionality (that I know of) is for the HPD pin on trogdor boards
> > > (long story about why we don't use the dedicated HPD) but the API
> > > supports using these GPIOs for anything and I've tested that it works.
> > > It wouldn't be great to have to keep the panel on in order to access
> > > the GPIOs.
> >
> > The issue you're trying to fix doesn't seem specific to this bridge, so
> > handling it in the bridge driver bothers me :-S Is there any way we
> > could handle this in the DRM core ? I don't want to see similar
> > implementations duplicated in all HDMI/DP bridges.
>
> Yes, it is true that this problem could affect other drivers.  ...and
> in full disclosure I think there are other similar workarounds already
> present. I haven't personally worked on those chips, but in
> ps8640_bridge_get_edid() there is a somewhat similar workaround to
> chain a pre-enable (though maybe it's not quite as optimized?). I'm
> told that maybe something had to be handled for anx7625 (in
> anx7625_get_edid()?) but that definitely doesn't look at all like it's
> doing a pre-enable, so maybe things for that bridge just work
> differently.
>
> One thing that makes me hesitant about trying to moving this to the
> core is that even in sn65dsi86 there is a case where it won't work. As
> I mentioned in the patch I'm not aware of anyone using it in
> production, but if someone was using the MIPI clock as input to the
> bridge chip instead of a fixed "refclk" then trying to get the EDID
> after just "pre-enable" falls over.  Said another way: I can say that
> with this particular bridge chip, if you're using a fixed refclk, you
> can read the EDID after the pre-enable. I don't know if that's always
> true with all other bridge chips.
>
> So I guess in summary: I think I could put my code in the core, but I
> don't _think_ I can just make it automatically enabled.
>
> * In sn65dsi I'd have to only enable it if we have a fixed refclk.
>
> * Maybe in ps8640 I could just always enable it and replace the
> existing code? I'd have to find someone to test.
>
> * In anx7625 things look totally different.
>
> Can you give me any advice on how you'd like me to proceed?

OK, I've got something that maybe looks better. You can tell me what
you think [1]. I did manage to use PM Runtime to avoid some of the
complexity and I put that usage in simple-panel. We'll see if I get
yelled at for adding more to simple-panel. ;-P

[1] https://lore.kernel.org/dri-devel/20210330025345.3980086-1-dianders@chromium.org/
