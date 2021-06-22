Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABCB73B0D02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 20:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232572AbhFVSjT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 14:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232564AbhFVSjT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 14:39:19 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25EAEC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 11:37:03 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id c138so42096935qkg.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 11:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5hHHpcbuGzfoV+GfFLB8z1cKhHoFMqWAiFyD3G6YAko=;
        b=SqgfTNdOPOEae4ycnm65VuiFolDjL75QzhVcNDAYaB18+y6gC/dR2FGFGIRRYu1pnO
         6G/9w/gHa9kP4JXdIkgngJVl7pR9Q1k1pW/6bgLGCYUR69Fnfa/Go4hs4E81apxFVeYM
         CknYzB21+ZhhBxq4HsfpOUobGYuws4uDgpVZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5hHHpcbuGzfoV+GfFLB8z1cKhHoFMqWAiFyD3G6YAko=;
        b=GI0VfuHNjjrKLBVrBCr9ZsxAJcH624kuQ3EH63DNrPwM+2/iWEagu/PToAw2t6eyXM
         gZp8vf1ivJLZicHokWHrExT2g8o7LdTIU7i3ZNDDzuaievDsu/KMOIom7s6/KX51mFDz
         EiX6rDUdojR0bykKEujGiGgGZSB7d0dx1X/DTlz6gfxjVgX736x3y8txED557MDZekPt
         5YU4Nt2auwU9JlksDIbdJm4mx+VV+DMBlPYXATdpubMcBPx1uTmUZwMKRxXg44Sicwxn
         1Yw1wAknMSw++tuqYQfJG54dv6sVqBqC8W+cXr7pOawk6sfP7zt0h+K3bcn4xqEfsn3w
         qQgg==
X-Gm-Message-State: AOAM5332Oz3UfhDGBlEnaVjcAWGWxby2kRXBSZqbqxi+/49BnURsXnfh
        Fn/JUOTXzhYOrJaPe3LsEN4A7gJNBq6bww==
X-Google-Smtp-Source: ABdhPJyukDiIuelV2qf15IDc5T5qN9+mWIx6cJ3DGLAk/iPqikZ7HTyTerVIm/hyCOYl80vryygxWQ==
X-Received: by 2002:ae9:c219:: with SMTP id j25mr5831818qkg.313.1624387022159;
        Tue, 22 Jun 2021 11:37:02 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id v8sm2092809qtk.80.2021.06.22.11.37.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 11:37:01 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id bl4so6190861qkb.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 11:37:00 -0700 (PDT)
X-Received: by 2002:a25:60c1:: with SMTP id u184mr5281625ybb.343.1624387020330;
 Tue, 22 Jun 2021 11:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <1624099230-20899-1-git-send-email-rajeevny@codeaurora.org>
 <1624099230-20899-6-git-send-email-rajeevny@codeaurora.org>
 <20210620100147.GB703072@ravnborg.org> <CAD=FV=VP8hLHtpZ8F5KVGWoKiJBxyQVufg7V9A2CC0rwcAX-aw@mail.gmail.com>
 <20210621184157.GB918146@ravnborg.org>
In-Reply-To: <20210621184157.GB918146@ravnborg.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 22 Jun 2021 11:36:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wzz0yW8FPxSFRBQ+y0+PbO__g-fPU64kXwqBmi6zT6RA@mail.gmail.com>
Message-ID: <CAD=FV=Wzz0yW8FPxSFRBQ+y0+PbO__g-fPU64kXwqBmi6zT6RA@mail.gmail.com>
Subject: Re: [v7 5/5] drm/panel-simple: Add Samsung ATNA33XC20
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Rajeev Nandan <rajeevny@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Lyude Paul <lyude@redhat.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jun 21, 2021 at 11:42 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Doug,
>
> On Mon, Jun 21, 2021 at 08:34:51AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Sun, Jun 20, 2021 at 3:01 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Hi Rajeev
> > > On Sat, Jun 19, 2021 at 04:10:30PM +0530, Rajeev Nandan wrote:
> > > > Add Samsung 13.3" FHD eDP AMOLED panel.
> > > >
> > > > Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> > > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > >
> > > > Changes in v4:
> > > > - New
> > > >
> > > > Changes in v5:
> > > > - Remove "uses_dpcd_backlight" property, not required now. (Douglas)
> > > >
> > > > Changes in v7:
> > > > - Update disable_to_power_off and power_to_enable delays. (Douglas)
> > > >
> > > >  drivers/gpu/drm/panel/panel-simple.c | 33 +++++++++++++++++++++++++++++++++
> > > >  1 file changed, 33 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > > index 86e5a45..4adc44a 100644
> > > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > > @@ -3562,6 +3562,36 @@ static const struct panel_desc rocktech_rk101ii01d_ct = {
> > > >       .connector_type = DRM_MODE_CONNECTOR_LVDS,
> > > >  };
> > > >
> > > > +static const struct drm_display_mode samsung_atna33xc20_mode = {
> > > > +     .clock = 138770,
> > > > +     .hdisplay = 1920,
> > > > +     .hsync_start = 1920 + 48,
> > > > +     .hsync_end = 1920 + 48 + 32,
> > > > +     .htotal = 1920 + 48 + 32 + 80,
> > > > +     .vdisplay = 1080,
> > > > +     .vsync_start = 1080 + 8,
> > > > +     .vsync_end = 1080 + 8 + 8,
> > > > +     .vtotal = 1080 + 8 + 8 + 16,
> > > > +     .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
> > > > +};
> > > > +
> > > > +static const struct panel_desc samsung_atna33xc20 = {
> > > > +     .modes = &samsung_atna33xc20_mode,
> > > > +     .num_modes = 1,
> > > > +     .bpc = 10,
> > > > +     .size = {
> > > > +             .width = 294,
> > > > +             .height = 165,
> > > > +     },
> > > > +     .delay = {
> > > > +             .disable_to_power_off = 200,
> > > > +             .power_to_enable = 400,
> > > > +             .hpd_absent_delay = 200,
> > > > +             .unprepare = 500,
> > > > +     },
> > > > +     .connector_type = DRM_MODE_CONNECTOR_eDP,
> > > > +};
> > >
> > > bus_format is missing. There should be a warning about this when you
> > > probe the display.
> >
> > Sam: I'm curious about the requirement of hardcoding bus_format like
> > this for eDP panels. Most eDP panels support a variety of bits per
> > pixel and do so dynamically. Ones I've poked at freely support 6bpp
> > and 8bpp. Presumably this one supports both of those modes and also
> > 10bpp. I haven't done detailed research on it, but it would also
> > surprise me if the "bus format" for a given bpp needed to be specified
> > for eDP. Presumably since eDP has most of the "autodetect" type
> > features of DP then if the format needed to be accounted for that you
> > could query the hardware?
> >
> > Looking at the datasheet for the ti-sn65dsi86 MIPI-to-eDP bridge chip
> > I see that it explicitly calls out the bus formats that it supports
> > for the MIPI side but doesn't call out anything for eDP. That would
> > tend to support my belief that there isn't variance on the eDP side...
> >
> > Maybe the right fix is to actually change the check not to give a
> > warning for eDP panels? ...or am I misunderstanding?
>
> I have never dived into the datasheets of eDP panels so I do not know.
> The checks were added based on what we had in-tree and it is no suprise
> if they need an update or are just plain wrong.
> I expect you to be in a better position to make the call here - but we
> should not add panels that triggers warnings so either fix the warnings
> or fix the panel description.

Agreed. I'd support a patch that removes this warning for eDP panels
unless someone knows that it makes sense. I haven't been able to find
anything indicating that it does.

-Doug
