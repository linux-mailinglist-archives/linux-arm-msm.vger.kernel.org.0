Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6F5F5D44
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2019 04:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbfKIDrV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 22:47:21 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:46879 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbfKIDrV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 22:47:21 -0500
Received: by mail-io1-f66.google.com with SMTP id c6so8508990ioo.13;
        Fri, 08 Nov 2019 19:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h2SQyHk4OQR7AxFi3CbCcGVXnvbVftYqGAUdD/StU5o=;
        b=E9p3eCxp1KAq1fkVs/GTTwxsf0/Mf9rqaiKFftUMTZERrn6nwEly3asPys28sFAjUM
         gIuBZQzvWryeMWSz1DCLueQfdeSIo64XWS7zg6hIjLJLYgT/LZDRohX65EvZPQcuRTa9
         xh0H/ZrZbPN6wSv1JhPkZnwgCJA8Z+vRPdjlHP3NtPpqoQIa18juliZxgmRF2H7m1Hw3
         fzRC8V/5NB1NA0Z38kncafhzpIDQXiDWymwx98gjd41zzZVP/s3JCdEtFEE+dKpU8wBL
         SvkMwwdfAMVUc/coMpKRy1F9+laPDaFusZMeOlWGv4yuYDtDV3CZ5lMqqi6ZyZojWDh7
         xRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h2SQyHk4OQR7AxFi3CbCcGVXnvbVftYqGAUdD/StU5o=;
        b=ByL1oQhnos1NUPRWggM9QB+ir1lrk3UzUgGVJDrk1d0RnNFGTzoGNSnKyRJ7CaX9G6
         m5w7iodzj47HhY29aeYIBj7GfFgvKXeSs22K/k4JjLKv3L1uPhCQkUL75OAgA2xUu8DA
         t/Z7PvOivf+9LDspPtWLMQuBRrOodDVOl8LmkOq18Hfw9ksZfq9W98q92xo5X+Tm/kLO
         zYOExp0PMtzn0br6b92o3d8KDLrwWftIzZDfMlX0IxCcDjgZIGjUhpH1wgiT0SY2ekBr
         0NxD2sAKwhEz/zakZpnjuadkzkBZS8dtIIsXUVT/5iFMLaFU74hlDWndrKCvN6lrDVbx
         j+3Q==
X-Gm-Message-State: APjAAAXPgcVWDZuMuvRgBTX1ZZDM8wAEQr7DOWalg18/hsAMPlfTKIpx
        P/fsL4CwEb6z90sdiDdcl9alrKF1Rcp+v3aZVweCyQ==
X-Google-Smtp-Source: APXvYqy+aE7LG6DaM3sK816nVMFNM+1dgmSai5gO5QCnC92d4dMrDobegUoGx6PPNR1WC4EE7RxmeCpZO1flaSpz0Do=
X-Received: by 2002:a02:6a24:: with SMTP id l36mr14717803jac.46.1573271239729;
 Fri, 08 Nov 2019 19:47:19 -0800 (PST)
MIME-Version: 1.0
References: <20191108212840.13586-1-stephan@gerhold.net> <CAOCk7No7r6Frdu8jSbdBCroXeF+HY=kqEQoJnK0HbkyjLse5Rg@mail.gmail.com>
 <20191108234654.GA997@gerhold.net>
In-Reply-To: <20191108234654.GA997@gerhold.net>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 8 Nov 2019 20:47:08 -0700
Message-ID: <CAOCk7NqvidvNrYKm-iCw6g6wM9NOaa17nqq75W1nQdPBDhijig@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: Delay drm_panel_enable() until dsi_mgr_bridge_enable()
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Jasper Korten <jja2000@gmail.com>, David Airlie <airlied@linux.ie>,
        Sean Paul <sean@poorly.run>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        MSM <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Hai Li <hali@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 8, 2019 at 4:47 PM Stephan Gerhold <stephan@gerhold.net> wrote:
>
> On Fri, Nov 08, 2019 at 03:12:28PM -0700, Jeffrey Hugo wrote:
> > On Fri, Nov 8, 2019 at 2:29 PM Stephan Gerhold <stephan@gerhold.net> wrote:
> > >
> > > At the moment, the MSM DSI driver calls drm_panel_enable() rather early
> > > from the DSI bridge pre_enable() function. At this point, the encoder
> > > (e.g. MDP5) is not enabled, so we have not started transmitting
> > > video data.
> > >
> > > However, the drm_panel_funcs documentation states that enable()
> > > should be called on the panel *after* video data is being transmitted:
> > >
> > >   The .prepare() function is typically called before the display controller
> > >   starts to transmit video data. [...] After the display controller has
> > >   started transmitting video data, it's safe to call the .enable() function.
> > >   This will typically enable the backlight to make the image on screen visible.
> > >
> > > Calling drm_panel_enable() too early causes problems for some panels:
> > > The TFT LCD panel used in the Samsung Galaxy Tab A 9.7 (2015) (APQ8016)
> > > uses the MIPI_DCS_SET_DISPLAY_BRIGHTNESS command to control
> > > backlight/brightness of the screen. The enable sequence is therefore:
> > >
> > >   drm_panel_enable()
> > >     drm_panel_funcs.enable():
> > >       backlight_enable()
> > >         backlight_ops.update_status():
> > >           mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
> > >
> > > The panel seems to silently ignore the MIPI_DCS_SET_DISPLAY_BRIGHTNESS
> > > command if it is sent too early. This prevents setting the initial brightness,
> > > causing the display to be enabled with minimum brightness instead.
> > > Adding various delays in the panel initialization code does not result
> > > in any difference.
> > >
> > > On the other hand, moving drm_panel_enable() to dsi_mgr_bridge_enable()
> > > fixes the problem, indicating that the panel requires the video stream
> > > to be active before the brightness command is accepted.
> > >
> > > Therefore: Move drm_panel_enable() to dsi_mgr_bridge_enable() to
> > > delay calling it until video data is being transmitted.
> > >
> > > Move drm_panel_disable() to dsi_mgr_bridge_disable() for similar reasons.
> > > (This is not strictly required for the panel affected above...)
> > >
> > > Tested-by: Jasper Korten <jja2000@gmail.com>
> > > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > > ---
> > > Since this is a core change I thought it would be better to send this
> > > early. I believe Jasper still wants to finish some other changes before
> > > submitting the initial device tree for the Samsung Galaxy Tab A 9.7 (2015). ;)
> > >
> > > I also tested it on msm8916-samsung-a5u-eur, its display is working fine
> > > with or without this patch.
> >
> > Nack, please.  I was curious so I threw this on the Lenovo Miix 630
> > laptop.  I don't get a display back with this patch.  I'll try to
> > figure out why, but currently I can't get into the machine.
>
> Thanks for testing the patch! Let's try to figure that out...
>
> I'm a bit confused, but this might be because I'm not very familiar with
> the MSM8998 laptops. It does not seem to have display in mainline yet,
> so do you have a link to all the patches you are using at the moment?

The mdp5 support is there.  Some of the dependencies have dragged out.
I'd have to make sense of my development tree as to what is relevant.
>
> Judging from the patches I was able to find, the Lenovo Miix 630 is
> using a DSI to eDP bridge.
> Isn't the panel managed by the bridge driver in that case?

It uses the TI SN65 bridge.

>
> struct msm_dsi contains:
>         /*
>          * panel/external_bridge connected to dsi bridge output, only one of the
>          * two can be valid at a time
>          */
>         struct drm_panel *panel;
>         struct drm_bridge *external_bridge;
>
> So if you have "external_bridge" set in your case, "panel" should be NULL.
> I have only moved code that uses msm_dsi->panel, so my patch really
> shouldn't make any difference for you.
>
> Am I confusing something here?

I don't think panel is null in my case.  I need to trace a few things
through to be sure.

Taking a quick look at the datasheet for the bridge, I suspect that
operations are occurring in the enable() phase of the bridge, that
need to occur before video data is transmitted.  Based on your
analysis in the commit message, I suspect these operations need to be
moved to pre_enable().

I'm hoping to gather more data this weekend, which will hopefully
identify what we need to do to move this forward without causing
regressions.
