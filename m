Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61648F61DB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2019 00:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbfKIX4G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Nov 2019 18:56:06 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:38262 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbfKIX4G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Nov 2019 18:56:06 -0500
Received: by mail-il1-f196.google.com with SMTP id u17so3606119ilq.5;
        Sat, 09 Nov 2019 15:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pquR3Fi2AOJyXSx5amB7HrtLHJGRvAJPZcgCQ4QogLY=;
        b=laFysc5nhKJv4TaeFVfD1ADU8gYvC1XsXtcLWqoHo3dVprsUrOm32Uu1eZSNsT+ia9
         c4d2lmzCVJGy55bVMuZ0afRdNv8obd4CpUzswz7T0CakvIfgmSka5q307M5tDoaJ79KM
         sgPiHohFzuvZHRXNfGM6qZeYkrsI1ifqKqTUstZbntOgjbAWrGqXn9HfC6ROa+XCp+Qc
         KreapeJBwGJK7rVCyn2nVW3zwZ9R0l5SQePoppMzQiZcPE0rQDgMosUPiPVWmtg6WHHv
         tEjd88yUVJ5D3eC7GAtogMHx3aqk12PiFNIj9YC1MMBg1q4I319M0EysyV0rU4NLsCkT
         2uGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pquR3Fi2AOJyXSx5amB7HrtLHJGRvAJPZcgCQ4QogLY=;
        b=rx/MVKnU94jcuQU3hJPZSZUbEtxvkGF6EQPwzaCxy/xQIHTaLQuKp0OfGvTIMcte+y
         gKNWbGvLNIoc7BD6rrxPX3+BMqyMi90ybhB4Q7zwfHVAIqFLIn1Nv/buAI4kWMmB73jO
         hIbivueEO5AZsx3PYglvXqhVK3eRdJtWHDMEzRXmmRCI/uhVGX/kvqr0VCFZmor+l3tW
         0tBHxy6x467KbB+zO87SOvYirMR61K6r0Fb4m2O1Wr3y7YoB27yf5GxjnwDBzeJwDTqb
         Wai0UBKAqd+YU/wzLD6/mdqYr5Oq/YbiBg3W/5/yimyxdqQj7e4XV71EhQhtFVlZlgHF
         JWtw==
X-Gm-Message-State: APjAAAUBUVrzhT9ATLcRfvJr0zwcoMX5P6V6yBCUefwfYFY0ctSxVSoO
        ws2bbr/kVelRE23dOdb5x0YgTdevQ34o+KJdhEmC3bab
X-Google-Smtp-Source: APXvYqx9zn/Xz1KXi9LU6n1D235/Ix2lTi7/abTix3fn/l7DPlri/FM/8tbPNw+v/+T/B5+pg04wTKEThV3jmKBbUsk=
X-Received: by 2002:a92:b60e:: with SMTP id s14mr22041861ili.178.1573343764900;
 Sat, 09 Nov 2019 15:56:04 -0800 (PST)
MIME-Version: 1.0
References: <20191108212840.13586-1-stephan@gerhold.net> <CAOCk7No7r6Frdu8jSbdBCroXeF+HY=kqEQoJnK0HbkyjLse5Rg@mail.gmail.com>
 <20191108234654.GA997@gerhold.net> <CAOCk7NqvidvNrYKm-iCw6g6wM9NOaa17nqq75W1nQdPBDhijig@mail.gmail.com>
 <20191109120156.GA981@gerhold.net>
In-Reply-To: <20191109120156.GA981@gerhold.net>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Sat, 9 Nov 2019 16:55:53 -0700
Message-ID: <CAOCk7Nog30WTqOPwd0HaP3NjTLv-5E3g1ekcp6dBJi3GLqrtrw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: Delay drm_panel_enable() until dsi_mgr_bridge_enable()
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Jasper Korten <jja2000@gmail.com>, Hai Li <hali@codeaurora.org>,
        David Airlie <airlied@linux.ie>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Nov 9, 2019 at 5:02 AM Stephan Gerhold <stephan@gerhold.net> wrote:
>
> On Fri, Nov 08, 2019 at 08:47:08PM -0700, Jeffrey Hugo wrote:
> > On Fri, Nov 8, 2019 at 4:47 PM Stephan Gerhold <stephan@gerhold.net> wrote:
> > >
> > > On Fri, Nov 08, 2019 at 03:12:28PM -0700, Jeffrey Hugo wrote:
> > > > On Fri, Nov 8, 2019 at 2:29 PM Stephan Gerhold <stephan@gerhold.net> wrote:
> > > > >
> > > > > At the moment, the MSM DSI driver calls drm_panel_enable() rather early
> > > > > from the DSI bridge pre_enable() function. At this point, the encoder
> > > > > (e.g. MDP5) is not enabled, so we have not started transmitting
> > > > > video data.
> > > > >
> > > > > However, the drm_panel_funcs documentation states that enable()
> > > > > should be called on the panel *after* video data is being transmitted:
> > > > >
> > > > >   The .prepare() function is typically called before the display controller
> > > > >   starts to transmit video data. [...] After the display controller has
> > > > >   started transmitting video data, it's safe to call the .enable() function.
> > > > >   This will typically enable the backlight to make the image on screen visible.
> > > > >
> > > > > Calling drm_panel_enable() too early causes problems for some panels:
> > > > > The TFT LCD panel used in the Samsung Galaxy Tab A 9.7 (2015) (APQ8016)
> > > > > uses the MIPI_DCS_SET_DISPLAY_BRIGHTNESS command to control
> > > > > backlight/brightness of the screen. The enable sequence is therefore:
> > > > >
> > > > >   drm_panel_enable()
> > > > >     drm_panel_funcs.enable():
> > > > >       backlight_enable()
> > > > >         backlight_ops.update_status():
> > > > >           mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
> > > > >
> > > > > The panel seems to silently ignore the MIPI_DCS_SET_DISPLAY_BRIGHTNESS
> > > > > command if it is sent too early. This prevents setting the initial brightness,
> > > > > causing the display to be enabled with minimum brightness instead.
> > > > > Adding various delays in the panel initialization code does not result
> > > > > in any difference.
> > > > >
> > > > > On the other hand, moving drm_panel_enable() to dsi_mgr_bridge_enable()
> > > > > fixes the problem, indicating that the panel requires the video stream
> > > > > to be active before the brightness command is accepted.
> > > > >
> > > > > Therefore: Move drm_panel_enable() to dsi_mgr_bridge_enable() to
> > > > > delay calling it until video data is being transmitted.
> > > > >
> > > > > Move drm_panel_disable() to dsi_mgr_bridge_disable() for similar reasons.
> > > > > (This is not strictly required for the panel affected above...)
> > > > >
> > > > > Tested-by: Jasper Korten <jja2000@gmail.com>
> > > > > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > > > > ---
> > > > > Since this is a core change I thought it would be better to send this
> > > > > early. I believe Jasper still wants to finish some other changes before
> > > > > submitting the initial device tree for the Samsung Galaxy Tab A 9.7 (2015). ;)
> > > > >
> > > > > I also tested it on msm8916-samsung-a5u-eur, its display is working fine
> > > > > with or without this patch.
> > > >
> > > > Nack, please.  I was curious so I threw this on the Lenovo Miix 630
> > > > laptop.  I don't get a display back with this patch.  I'll try to
> > > > figure out why, but currently I can't get into the machine.
> > >
> > > Thanks for testing the patch! Let's try to figure that out...
> > >
> > > I'm a bit confused, but this might be because I'm not very familiar with
> > > the MSM8998 laptops. It does not seem to have display in mainline yet,
> > > so do you have a link to all the patches you are using at the moment?
> >
> > The mdp5 support is there.  Some of the dependencies have dragged out.
> > I'd have to make sense of my development tree as to what is relevant.
>
> A dump of all the patches (whether still relevant or not) would be
> helpful too. Actually I was mostly looking for the device tree part to
> see which components are involved.

DSI0 to "ti,sn65dsi86" (bridge) to "sharp,ld-d5116z01b" (panel).

>
> > >
> > > Judging from the patches I was able to find, the Lenovo Miix 630 is
> > > using a DSI to eDP bridge.
> > > Isn't the panel managed by the bridge driver in that case?
> >
> > It uses the TI SN65 bridge.
> >
>
> It is covered by the ti-sn65dsi86 driver I assume?

Yes

>
> > >
> > > struct msm_dsi contains:
> > >         /*
> > >          * panel/external_bridge connected to dsi bridge output, only one of the
> > >          * two can be valid at a time
> > >          */
> > >         struct drm_panel *panel;
> > >         struct drm_bridge *external_bridge;
> > >
> > > So if you have "external_bridge" set in your case, "panel" should be NULL.
> > > I have only moved code that uses msm_dsi->panel, so my patch really
> > > shouldn't make any difference for you.
> > >
> > > Am I confusing something here?
> >
> > I don't think panel is null in my case.  I need to trace a few things
> > through to be sure.
> >
>
> ti-sn65dsi86.c contains:
>
> static void ti_sn_bridge_enable(struct drm_bridge *bridge)
> {
>         /* ... */
>         drm_panel_enable(pdata->panel);
> }
>
> static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
> {
>         /* ... */
>         drm_panel_prepare(pdata->panel);
> }
>
> So it does indeed manage the panel for you. If msm_dsi->panel is not
> NULL for you it would mean that your panel is managed by two drivers
> at the same time.
>
> (Also note how it calls drm_panel_enable() in enable() instead of
> pre_enable(). This is exactly the change my patch does for the case
> when the panel is managed by the MSM driver...)
>
> > Taking a quick look at the datasheet for the bridge, I suspect that
> > operations are occurring in the enable() phase of the bridge, that
> > need to occur before video data is transmitted.  Based on your
> > analysis in the commit message, I suspect these operations need to be
> > moved to pre_enable().
> >
>
> I'm still confused how my patch makes any difference for you.
> The enable sequence should be exactly the same as before.
>
> > I'm hoping to gather more data this weekend, which will hopefully
> > identify what we need to do to move this forward without causing
> > regressions.
>
> Looking forward to it, thanks!

Panel was infact NULL for me, and the DSI panel operations are not
translating into direct bridge calls.  I re-applied your change, and
I'm not reproing the original failure.  I tried a couple of times to
be sure.  I have no idea what happened during the initial testing to
break things.

Therefore, I remove my nack.

Tested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
