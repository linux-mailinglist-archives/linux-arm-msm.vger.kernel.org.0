Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99EA23696E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 18:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhDWQb2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 12:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhDWQb2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 12:31:28 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69731C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:30:50 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id x11so50103244qkp.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bnPkOae3N3QNLfW2JXPw4qTg19P7LS7x3meffpeNsUc=;
        b=oOWzIy3mWuS6BWg8Zy0+TynqeZAiE3ZSt8ELRuOz1uAEN4ySjH+jCi7+4wq42lLCf6
         pWI21DpyBztpl1GpAjQ0VdUrs+7dOsKKgaUwYt3s0vy5q2UZ1TNduOSnPD4SoxJHEWfY
         5OltXJXVHWMShT/LiT6ZbueZcaIHry68371Iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bnPkOae3N3QNLfW2JXPw4qTg19P7LS7x3meffpeNsUc=;
        b=jPFE215+QSSG6At8Q9PI5pdTplA7uzCSdktezBO51WUUULEeJJAi0i/hBiZQXRyzGR
         sF83UL6FDqHkthhtOzTr8i2HOzwRTf8sQQbpOA26VE3zVLN+20GvSk7Ul38sRwbaJ2no
         72s3KTFIHTXXfio7Jg3dA3rHI/PQ06RtAKqw1oJNphNkC5JR6j7NLGvsQqr9JiCTQ5nU
         2stnuZ0LrFYEl86yYuPaIdwtkHSgVBuQS7IwnW5yHgxiMOC7EzXdQQ2xNOVMRUC0sYcW
         9GGMFPvnojhbCtES5aizeKd3ypRGZA8qbvGytXnkpUrGyUAGzALr6gSDmeyefuyS7PbZ
         tJOQ==
X-Gm-Message-State: AOAM531XSMJjWLSqBENDS+7FO0DAMj4zwgaQzbl52VlmW6yhkIHEmyhM
        GRjDkfnEMRgl1lcIR6k7UGXS/sSeGxpLuA==
X-Google-Smtp-Source: ABdhPJwtJ57Mo7VwL66v86upnZJaPOvI7hnrCelG2RW9taTNXF8bTM6WDRTR8Rww85DiWmJlkCQcRA==
X-Received: by 2002:a37:6f87:: with SMTP id k129mr4871541qkc.470.1619195449503;
        Fri, 23 Apr 2021 09:30:49 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id t18sm4738217qkj.75.2021.04.23.09.30.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Apr 2021 09:30:49 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id c195so56261402ybf.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:30:48 -0700 (PDT)
X-Received: by 2002:a25:2d0b:: with SMTP id t11mr2980774ybt.79.1619195448418;
 Fri, 23 Apr 2021 09:30:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.24.If050957eaa85cf45b10bcf61e6f7fa61c9750ebf@changeid> <YILx/iODs+DFWWwm@builder.lan>
In-Reply-To: <YILx/iODs+DFWWwm@builder.lan>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 23 Apr 2021 09:30:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UhOKcSC5FPPZgXiqfFCYOu4iFGrhtrgfGz_ovT8Qi-6w@mail.gmail.com>
Message-ID: <CAD=FV=UhOKcSC5FPPZgXiqfFCYOu4iFGrhtrgfGz_ovT8Qi-6w@mail.gmail.com>
Subject: Re: [PATCH v4 24/27] drm/panel: panel-simple: Cache the EDID as long
 as we retain power
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Apr 23, 2021 at 9:12 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 16 Apr 17:39 CDT 2021, Douglas Anderson wrote:
>
> > It doesn't make sense to go out to the bus and read the EDID over and
> > over again. Let's cache it and throw away the cache when we turn power
> > off from the panel. Autosuspend means that even if there are several
> > calls to read the EDID before we officially turn the power on then we
> > should get good use out of this cache.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > (no changes since v1)
> >
> >  drivers/gpu/drm/panel/panel-simple.c | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 40382c1be692..5a2953c4ca44 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -189,6 +189,8 @@ struct panel_simple {
> >       struct gpio_desc *enable_gpio;
> >       struct gpio_desc *hpd_gpio;
> >
> > +     struct edid *edid;
> > +
> >       struct drm_display_mode override_mode;
> >
> >       enum drm_panel_orientation orientation;
> > @@ -345,6 +347,9 @@ static int panel_simple_suspend(struct device *dev)
> >       regulator_disable(p->supply);
> >       p->unprepared_time = ktime_get();
> >
> > +     kfree(p->edid);
> > +     p->edid = NULL;
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
>
> But separate of this, shouldn't the driver have a pm_runtime_disable()
> in the remove path to synchronize the autosleep? Or is that not how that
> works?

Indeed! I'll add a patch to the start of my v5 (coming shortly) that
fixes this. Thanks for catching!

-Doug
