Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB40FAF96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2019 12:23:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbfKMLXf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Nov 2019 06:23:35 -0500
Received: from onstation.org ([52.200.56.107]:52482 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727567AbfKMLXf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Nov 2019 06:23:35 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 7496B3E994;
        Wed, 13 Nov 2019 11:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1573644214;
        bh=4MvO+CcmqmSuCYtwPmAx/jbzbsyC5uBqRsZbzaDLlGs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h235/kz+Hbf35LEDekFbNNNia4DVabJuac7lXLV+XBvxChJk5YeKhERIysigCjELU
         qKKg0hV1avsRUHyy8a/ikxgwbq7OdCxd7u1pe/FD+rbNO7+FNc3EUb26UY1/NBLyr8
         jzd+CV+NS5plL72Gaz4Y2e9U9Bm5u/NC8ejlix0Q=
Date:   Wed, 13 Nov 2019 06:23:34 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/msm/mdp5: enable autocommit
Message-ID: <20191113112334.GA18702@onstation.org>
References: <20191112104854.20850-1-masneyb@onstation.org>
 <CAOCk7NosRhRp3vZxg2Nx8106PQ0ryo5b68cUv605XUzCm6gYPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7NosRhRp3vZxg2Nx8106PQ0ryo5b68cUv605XUzCm6gYPA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 12, 2019 at 08:38:27AM -0700, Jeffrey Hugo wrote:
> On Tue, Nov 12, 2019 at 3:49 AM Brian Masney <masneyb@onstation.org> wrote:
> >
> > Since the introduction of commit 2d99ced787e3 ("drm/msm: async commit
> > support"), command-mode panels began throwing the following errors:
> >
> >     msm fd900000.mdss: pp done time out, lm=0
> >
> > Let's fix this by enabling the autorefresh feature that's available in
> > the MDP starting at version 1.0. This will cause the MDP to
> > automatically send a frame to the panel every time the panel invokes
> > the TE signal, which will trigger the PP_DONE IRQ. This requires not
> > sending a START signal for command-mode panels.
> >
> > This fixes the error and gives us a counter for command-mode panels that
> > we can use to implement async commit support for the MDP5 in a follow up
> > patch.
> >
> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > Suggested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 15 ++++++++++++++-
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c  |  9 +--------
> >  2 files changed, 15 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > index 05cc04f729d6..539348cb6331 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > @@ -456,6 +456,7 @@ static void mdp5_crtc_atomic_enable(struct drm_crtc *crtc,
> >  {
> >         struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
> >         struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
> > +       struct mdp5_pipeline *pipeline = &mdp5_cstate->pipeline;
> >         struct mdp5_kms *mdp5_kms = get_kms(crtc);
> >         struct device *dev = &mdp5_kms->pdev->dev;
> >
> > @@ -493,9 +494,21 @@ static void mdp5_crtc_atomic_enable(struct drm_crtc *crtc,
> >
> >         mdp_irq_register(&mdp5_kms->base, &mdp5_crtc->err);
> >
> > -       if (mdp5_cstate->cmd_mode)
> > +       if (mdp5_cstate->cmd_mode) {
> >                 mdp_irq_register(&mdp5_kms->base, &mdp5_crtc->pp_done);
> >
> > +               /*
> > +                * Enable autorefresh so we get regular ping/pong IRQs.
> > +                * - Bit 31 is the enable bit
> > +                * - Bits 0-15 represent the frame count, specifically how many
> > +                *   TE events before the MDP sends a frame.
> > +                */
> > +               mdp5_write(mdp5_kms,
> > +                          REG_MDP5_PP_AUTOREFRESH_CONFIG(pipeline->mixer->pp),
> > +                          BIT(31) | BIT(0));
> > +               crtc_flush_all(crtc);
> > +       }
> > +
> >         mdp5_crtc->enabled = true;
> >  }
> >
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> > index 030279d7b64b..aee295abada3 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> > @@ -187,14 +187,7 @@ static bool start_signal_needed(struct mdp5_ctl *ctl,
> >         if (!ctl->encoder_enabled)
> >                 return false;
> >
> > -       switch (intf->type) {
> > -       case INTF_WB:
> > -               return true;
> > -       case INTF_DSI:
> > -               return intf->mode == MDP5_INTF_DSI_MODE_COMMAND;
> > -       default:
> > -               return false;
> > -       }
> > +       return intf->type == INTF_WB;
> >  }
> 
> I don't think this fully works.
> 
> The whole "flush" thing exists because the configuration is double
> buffered.  You write to the flush register to tell the hardware to
> pickup the new configuration, but it doesn't do that automatically.
> It only picks up the new config on the next "vsync".  When you have a
> video mode panel, you have the timing engine running, which drives
> that.  With a command mode panel, you have either the start signal, or
> the auto refresh to do the same, but you have a bit of a chicken and
> egg situation where if you are programming the hardware from scratch,
> autorefresh isn't already enabled to then pickup the config to enable
> autorefresh. In this case, you'll need a single start to kick
> everything off.  However, if say the bootloader already configured
> things and has autorefresh running, then you need to not do that start
> because you'll overload the DSI like you saw.

As part of my testing for this work, I added a log statement to
mdp5_crtc_pp_done_irq() and it shows that a PP_IRQ comes in consistently
every ~0.0166 seconds, which is about 60 HZ. Without this change, plus
the 3 commits I mentioned in an earlier email related to the async
commit support, the PP IRQs come in at a variety of times: between every
~0.0140 and ~0.2224 seconds. That's why I assumed that this was working.

If I call send_start_signal() inside mdp5_crtc_atomic_enable(), then the
display does not work properly.

> Nothing is simple, is it?  :)

Ain't that the truth...

Brian
