Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6684CF5EDF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2019 13:02:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbfKIMCM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Nov 2019 07:02:12 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:28101 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfKIMCM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Nov 2019 07:02:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1573300928;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=OXuWTUa9HyzI1fpeQhlGNaQc3nmqlPVWS79Yvpaw+rg=;
        b=CYwDY/ItmdF3eb00ecsNSUjE8uweOtFMzymjBPyyxLRM7mhhxzzZLvWQuxRlqJHk7R
        YnrvO2+YObFVVCEcgrHS76IcYrObb8vT2aLMb3WNZz7ahnTTlZnXaD5IKADjb/rXVvRT
        +CXXGTYtI+jMHiZM13aoohdaNvrwcrRqAvMb22NVaH+cSJ5IzGWMUf2N75VuiQAm6LoG
        nFahe7lQ34C/NYvtDiphUZHenGF5v6OU3A8EL9lI4T4EPWmB6cHeb1MX9AdjhY4RZBkV
        eP4gYO+07dgY4kFQbPrLS23lzYNVgySbY0QxGmymjKyhOgY/tcP1RNorfr2RVVyc0ZmO
        jfEQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266EZF6ORJL0fVgscA="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 44.29.0 AUTH)
        with ESMTPSA id e07688vA9C22uwK
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Sat, 9 Nov 2019 13:02:02 +0100 (CET)
Date:   Sat, 9 Nov 2019 13:01:56 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Jasper Korten <jja2000@gmail.com>, David Airlie <airlied@linux.ie>,
        Sean Paul <sean@poorly.run>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        MSM <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Hai Li <hali@codeaurora.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: Delay drm_panel_enable() until
 dsi_mgr_bridge_enable()
Message-ID: <20191109120156.GA981@gerhold.net>
References: <20191108212840.13586-1-stephan@gerhold.net>
 <CAOCk7No7r6Frdu8jSbdBCroXeF+HY=kqEQoJnK0HbkyjLse5Rg@mail.gmail.com>
 <20191108234654.GA997@gerhold.net>
 <CAOCk7NqvidvNrYKm-iCw6g6wM9NOaa17nqq75W1nQdPBDhijig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7NqvidvNrYKm-iCw6g6wM9NOaa17nqq75W1nQdPBDhijig@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 08, 2019 at 08:47:08PM -0700, Jeffrey Hugo wrote:
> On Fri, Nov 8, 2019 at 4:47 PM Stephan Gerhold <stephan@gerhold.net> wrote:
> >
> > On Fri, Nov 08, 2019 at 03:12:28PM -0700, Jeffrey Hugo wrote:
> > > On Fri, Nov 8, 2019 at 2:29 PM Stephan Gerhold <stephan@gerhold.net> wrote:
> > > >
> > > > At the moment, the MSM DSI driver calls drm_panel_enable() rather early
> > > > from the DSI bridge pre_enable() function. At this point, the encoder
> > > > (e.g. MDP5) is not enabled, so we have not started transmitting
> > > > video data.
> > > >
> > > > However, the drm_panel_funcs documentation states that enable()
> > > > should be called on the panel *after* video data is being transmitted:
> > > >
> > > >   The .prepare() function is typically called before the display controller
> > > >   starts to transmit video data. [...] After the display controller has
> > > >   started transmitting video data, it's safe to call the .enable() function.
> > > >   This will typically enable the backlight to make the image on screen visible.
> > > >
> > > > Calling drm_panel_enable() too early causes problems for some panels:
> > > > The TFT LCD panel used in the Samsung Galaxy Tab A 9.7 (2015) (APQ8016)
> > > > uses the MIPI_DCS_SET_DISPLAY_BRIGHTNESS command to control
> > > > backlight/brightness of the screen. The enable sequence is therefore:
> > > >
> > > >   drm_panel_enable()
> > > >     drm_panel_funcs.enable():
> > > >       backlight_enable()
> > > >         backlight_ops.update_status():
> > > >           mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
> > > >
> > > > The panel seems to silently ignore the MIPI_DCS_SET_DISPLAY_BRIGHTNESS
> > > > command if it is sent too early. This prevents setting the initial brightness,
> > > > causing the display to be enabled with minimum brightness instead.
> > > > Adding various delays in the panel initialization code does not result
> > > > in any difference.
> > > >
> > > > On the other hand, moving drm_panel_enable() to dsi_mgr_bridge_enable()
> > > > fixes the problem, indicating that the panel requires the video stream
> > > > to be active before the brightness command is accepted.
> > > >
> > > > Therefore: Move drm_panel_enable() to dsi_mgr_bridge_enable() to
> > > > delay calling it until video data is being transmitted.
> > > >
> > > > Move drm_panel_disable() to dsi_mgr_bridge_disable() for similar reasons.
> > > > (This is not strictly required for the panel affected above...)
> > > >
> > > > Tested-by: Jasper Korten <jja2000@gmail.com>
> > > > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > > > ---
> > > > Since this is a core change I thought it would be better to send this
> > > > early. I believe Jasper still wants to finish some other changes before
> > > > submitting the initial device tree for the Samsung Galaxy Tab A 9.7 (2015). ;)
> > > >
> > > > I also tested it on msm8916-samsung-a5u-eur, its display is working fine
> > > > with or without this patch.
> > >
> > > Nack, please.  I was curious so I threw this on the Lenovo Miix 630
> > > laptop.  I don't get a display back with this patch.  I'll try to
> > > figure out why, but currently I can't get into the machine.
> >
> > Thanks for testing the patch! Let's try to figure that out...
> >
> > I'm a bit confused, but this might be because I'm not very familiar with
> > the MSM8998 laptops. It does not seem to have display in mainline yet,
> > so do you have a link to all the patches you are using at the moment?
> 
> The mdp5 support is there.  Some of the dependencies have dragged out.
> I'd have to make sense of my development tree as to what is relevant.

A dump of all the patches (whether still relevant or not) would be
helpful too. Actually I was mostly looking for the device tree part to
see which components are involved.

> >
> > Judging from the patches I was able to find, the Lenovo Miix 630 is
> > using a DSI to eDP bridge.
> > Isn't the panel managed by the bridge driver in that case?
> 
> It uses the TI SN65 bridge.
> 

It is covered by the ti-sn65dsi86 driver I assume?

> >
> > struct msm_dsi contains:
> >         /*
> >          * panel/external_bridge connected to dsi bridge output, only one of the
> >          * two can be valid at a time
> >          */
> >         struct drm_panel *panel;
> >         struct drm_bridge *external_bridge;
> >
> > So if you have "external_bridge" set in your case, "panel" should be NULL.
> > I have only moved code that uses msm_dsi->panel, so my patch really
> > shouldn't make any difference for you.
> >
> > Am I confusing something here?
> 
> I don't think panel is null in my case.  I need to trace a few things
> through to be sure.
> 

ti-sn65dsi86.c contains:

static void ti_sn_bridge_enable(struct drm_bridge *bridge)
{
	/* ... */
	drm_panel_enable(pdata->panel);
}

static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
{
	/* ... */
	drm_panel_prepare(pdata->panel);
}

So it does indeed manage the panel for you. If msm_dsi->panel is not
NULL for you it would mean that your panel is managed by two drivers
at the same time.

(Also note how it calls drm_panel_enable() in enable() instead of
pre_enable(). This is exactly the change my patch does for the case
when the panel is managed by the MSM driver...)

> Taking a quick look at the datasheet for the bridge, I suspect that
> operations are occurring in the enable() phase of the bridge, that
> need to occur before video data is transmitted.  Based on your
> analysis in the commit message, I suspect these operations need to be
> moved to pre_enable().
> 

I'm still confused how my patch makes any difference for you.
The enable sequence should be exactly the same as before.

> I'm hoping to gather more data this weekend, which will hopefully
> identify what we need to do to move this forward without causing
> regressions.

Looking forward to it, thanks!
