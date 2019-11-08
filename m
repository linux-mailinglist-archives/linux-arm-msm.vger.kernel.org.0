Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3D57F5C04
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2019 00:47:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbfKHXrE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 18:47:04 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:11343 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbfKHXrD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 18:47:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1573256821;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=tCDj3SsewgOpkV9YTINnhsmyurk7kZdmpLHdKW60/9I=;
        b=AhwrddL72WNwc1Hzv+Ci+Qo2iQr173eOT8Sbloidp6G+3R2I2+6ExBhXvYWW33RK4i
        1y7A8DnKxpRF4B343Ij3MYm8V2H+zrjB1C4Q3r+M+4KGwQOxmYNBT7zge7RK9A7zW5QS
        dXyGQK6uJc2EnMassPgWRuBuNJYPa75rNpE9lgshjYUv1sjsiPKlwlwuClVObIMa4bJM
        OYNnMjfWfK1s/qrhABtXbh8lf/CkCcbBNovmf0zK0zrcVWswWWG0jHs7nCgQVX/tVxiK
        UwZEgx+CpHusRQVpHVFCd8SiZthVcc6HTKLg+s0z1Uv6cUVZaCvKxTwy7d1jIgUM7U8h
        a7sA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266EZF6ORJDd+zEsL6f"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 44.29.0 AUTH)
        with ESMTPSA id e07688vA8Nkvtoz
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Sat, 9 Nov 2019 00:46:57 +0100 (CET)
Date:   Sat, 9 Nov 2019 00:46:54 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jasper Korten <jja2000@gmail.com>,
        Hai Li <hali@codeaurora.org>, David Airlie <airlied@linux.ie>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: Delay drm_panel_enable() until
 dsi_mgr_bridge_enable()
Message-ID: <20191108234654.GA997@gerhold.net>
References: <20191108212840.13586-1-stephan@gerhold.net>
 <CAOCk7No7r6Frdu8jSbdBCroXeF+HY=kqEQoJnK0HbkyjLse5Rg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7No7r6Frdu8jSbdBCroXeF+HY=kqEQoJnK0HbkyjLse5Rg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 08, 2019 at 03:12:28PM -0700, Jeffrey Hugo wrote:
> On Fri, Nov 8, 2019 at 2:29 PM Stephan Gerhold <stephan@gerhold.net> wrote:
> >
> > At the moment, the MSM DSI driver calls drm_panel_enable() rather early
> > from the DSI bridge pre_enable() function. At this point, the encoder
> > (e.g. MDP5) is not enabled, so we have not started transmitting
> > video data.
> >
> > However, the drm_panel_funcs documentation states that enable()
> > should be called on the panel *after* video data is being transmitted:
> >
> >   The .prepare() function is typically called before the display controller
> >   starts to transmit video data. [...] After the display controller has
> >   started transmitting video data, it's safe to call the .enable() function.
> >   This will typically enable the backlight to make the image on screen visible.
> >
> > Calling drm_panel_enable() too early causes problems for some panels:
> > The TFT LCD panel used in the Samsung Galaxy Tab A 9.7 (2015) (APQ8016)
> > uses the MIPI_DCS_SET_DISPLAY_BRIGHTNESS command to control
> > backlight/brightness of the screen. The enable sequence is therefore:
> >
> >   drm_panel_enable()
> >     drm_panel_funcs.enable():
> >       backlight_enable()
> >         backlight_ops.update_status():
> >           mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
> >
> > The panel seems to silently ignore the MIPI_DCS_SET_DISPLAY_BRIGHTNESS
> > command if it is sent too early. This prevents setting the initial brightness,
> > causing the display to be enabled with minimum brightness instead.
> > Adding various delays in the panel initialization code does not result
> > in any difference.
> >
> > On the other hand, moving drm_panel_enable() to dsi_mgr_bridge_enable()
> > fixes the problem, indicating that the panel requires the video stream
> > to be active before the brightness command is accepted.
> >
> > Therefore: Move drm_panel_enable() to dsi_mgr_bridge_enable() to
> > delay calling it until video data is being transmitted.
> >
> > Move drm_panel_disable() to dsi_mgr_bridge_disable() for similar reasons.
> > (This is not strictly required for the panel affected above...)
> >
> > Tested-by: Jasper Korten <jja2000@gmail.com>
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> > Since this is a core change I thought it would be better to send this
> > early. I believe Jasper still wants to finish some other changes before
> > submitting the initial device tree for the Samsung Galaxy Tab A 9.7 (2015). ;)
> >
> > I also tested it on msm8916-samsung-a5u-eur, its display is working fine
> > with or without this patch.
> 
> Nack, please.  I was curious so I threw this on the Lenovo Miix 630
> laptop.  I don't get a display back with this patch.  I'll try to
> figure out why, but currently I can't get into the machine.

Thanks for testing the patch! Let's try to figure that out...

I'm a bit confused, but this might be because I'm not very familiar with
the MSM8998 laptops. It does not seem to have display in mainline yet,
so do you have a link to all the patches you are using at the moment?

Judging from the patches I was able to find, the Lenovo Miix 630 is
using a DSI to eDP bridge.
Isn't the panel managed by the bridge driver in that case?

struct msm_dsi contains:
	/*
	 * panel/external_bridge connected to dsi bridge output, only one of the
	 * two can be valid at a time
	 */
	struct drm_panel *panel;
	struct drm_bridge *external_bridge;

So if you have "external_bridge" set in your case, "panel" should be NULL.
I have only moved code that uses msm_dsi->panel, so my patch really
shouldn't make any difference for you.

Am I confusing something here?

Thanks,
Stephan
