Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8190C60B84
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2019 20:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725813AbfGESqw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jul 2019 14:46:52 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:49576 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfGESqv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jul 2019 14:46:51 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id C0E0720065;
        Fri,  5 Jul 2019 20:46:46 +0200 (CEST)
Date:   Fri, 5 Jul 2019 20:46:44 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     thierry.reding@gmail.com, Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        DTML <devicetree@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for Sharp
 LD-D5116Z01B panel
Message-ID: <20190705184644.GA5044@ravnborg.org>
References: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
 <20190705165755.515-1-jeffrey.l.hugo@gmail.com>
 <20190705172058.GA2788@ravnborg.org>
 <CAOCk7NrVSCt18QfMs+_nW1rDMuhK_dPKWL0roESmwEEy4u3BZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7NrVSCt18QfMs+_nW1rDMuhK_dPKWL0roESmwEEy4u3BZQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=pGLkceISAAAA:8 a=XCh60BrB9CTw4ms3EqwA:9 a=CjuIK1q_8ugA:10
        a=E9Po1WZjFZOl8hwRPBS3:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeffrey.

On Fri, Jul 05, 2019 at 12:35:30PM -0600, Jeffrey Hugo wrote:
> On Fri, Jul 5, 2019 at 11:21 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Jeffrey.
> >
> > Patch looks good, but there is a few fields that are not initialized.
> > Did you forget them, or are they not needed?
> 
> Thanks for the review.  Overlooked some of them.
> 
> >
> > On Fri, Jul 05, 2019 at 09:57:55AM -0700, Jeffrey Hugo wrote:
> > > The Sharp LD-D5116Z01B is a 12.3" eDP panel with a 1920X1280 resolution.
> > >
> > > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
> > >  1 file changed, 26 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > index 5a93c4edf1e4..e6f578667324 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -2354,6 +2354,29 @@ static const struct panel_desc samsung_ltn140at29_301 = {
> > >       },
> > >  };
> > >
> > > +static const struct drm_display_mode sharp_ld_d5116z01b_mode = {
> > > +     .clock = 168480,
> > > +     .hdisplay = 1920,
> > > +     .hsync_start = 1920 + 48,
> > > +     .hsync_end = 1920 + 48 + 32,
> > > +     .htotal = 1920 + 48 + 32 + 80,
> > > +     .vdisplay = 1280,
> > > +     .vsync_start = 1280 + 3,
> > > +     .vsync_end = 1280 + 3 + 10,
> > > +     .vtotal = 1280 + 3 + 10 + 57,
> > > +     .vrefresh = 60,
> > > +};
> > No .flags? Is it not needed for an eDP panel?
> 
> The flags don't appear to make sense per my understanding of eDP.
> Therefore I intended .flags to be 0, which it implicitly is because
> this is a static struct.  Would you prefer I explicitly list .flags =
> 0?
I was not sure hence my Q. And do not set it to 0, as then someone will
come and say this is default and delete it.
Maybe mention it in the changelog.


> 
> >
> > > +
> > > +static const struct panel_desc sharp_ld_d5116z01b = {
> > > +     .modes = &sharp_ld_d5116z01b_mode,
> > > +     .num_modes = 1,
> > > +     .bpc = 8,
> > > +     .size = {
> > > +             .width = 260,
> > > +             .height = 120,
> > > +     },
> > > +};
> > No .bus_format?
> 
> Ah, yes.  Looks like it should be MEDIA_BUS_FMT_RGB888_1X24
> Will fix.
> 
> > No .bus_flags?
> 
> eDP is differential signaling, so what I see generally doesn't apply,
> but DRM_BUS_FLAG_DATA_MSB_TO_LSB does apply, so I'll add that.

With your changes you can add my:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

On both patches.

	Sam
