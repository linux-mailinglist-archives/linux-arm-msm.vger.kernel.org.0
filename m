Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFA5F7334
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2019 12:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbfKKLiI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Nov 2019 06:38:08 -0500
Received: from onstation.org ([52.200.56.107]:43642 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726791AbfKKLiI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Nov 2019 06:38:08 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 1EFD83E953;
        Mon, 11 Nov 2019 11:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1573472287;
        bh=KUPhf57c22YEEkTMyytnzutNtQwBQ/fK8BK90QZ9r4M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L1sMHmZIG09BGELJHdOTFd2HjGajOSGj3fKCR8cLypcLy5Z4TYL3X06RJSEza3HWe
         QFqIBfxAnbhrBzVRAvDSqczcm+4kVCHvls1NodYe1S7SX4p/91Rm9QlWD/XucpkJ/5
         1TMWQzfe8K8ZzrB8YFZwlOq8v3AvzOEtJpBbJIYE=
Date:   Mon, 11 Nov 2019 06:38:06 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] drm/msm: 'pp done time out' errors after async
 commit changes
Message-ID: <20191111113806.GA1420@onstation.org>
References: <CAF6AEGuEO1jg6KhOFWEMUjq4ZQy5w61dWJk6uLWRzHnMZYZv=g@mail.gmail.com>
 <CAOCk7NomH2MsZ+FvPFAMWeabOFpyOwODCb_Ro07v+2k2v_C4NA@mail.gmail.com>
 <CAF6AEGsZkJJTNZ8SzHsSioEnkpekr1Texu5_EeBW1hP-bsOyjQ@mail.gmail.com>
 <20191107111019.GA24028@onstation.org>
 <CAF6AEGtbP=X2+DELajQq9zMZYGgmhyUhe62ncvHvyFnyZexTXg@mail.gmail.com>
 <CAOCk7NrPdGqc4vo70NmTuyszkPaPe41-e89ym2vAYBY+GTt9BA@mail.gmail.com>
 <CAJs_Fx4UJYd-k3_3AAGJo-8udThhvf6t-J=OZi3jappWjTNnFQ@mail.gmail.com>
 <CAOCk7Nq7rPmraofy+o8vWTwSAd1+dTRsoZ4QN0mRAOOz7u7TUg@mail.gmail.com>
 <20191110135321.GA6728@onstation.org>
 <CAOCk7Nr3nkUWOynxVK_0SxWKUss803_fhkdVehRajtiA9vi8ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7Nr3nkUWOynxVK_0SxWKUss803_fhkdVehRajtiA9vi8ng@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Nov 10, 2019 at 10:37:33AM -0700, Jeffrey Hugo wrote:
> On Sun, Nov 10, 2019 at 6:53 AM Brian Masney <masneyb@onstation.org> wrote:
> >
> > On Fri, Nov 08, 2019 at 07:56:25AM -0700, Jeffrey Hugo wrote:
> > There's a REG_MDP5_PP_AUTOREFRESH_CONFIG() macro upstream here:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h#n1383
> >
> > I'm not sure what to put in that register but I tried configuring it
> > with a 1 this way and still have the same issue.
> >
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> > index eeef41fcd4e1..6b9acf68fd2c 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> > @@ -80,6 +80,7 @@ static int pingpong_tearcheck_setup(struct drm_encoder *encoder,
> >         mdp5_write(mdp5_kms, REG_MDP5_PP_SYNC_THRESH(pp_id),
> >                         MDP5_PP_SYNC_THRESH_START(4) |
> >                         MDP5_PP_SYNC_THRESH_CONTINUE(4));
> > +       mdp5_write(mdp5_kms, REG_MDP5_PP_AUTOREFRESH_CONFIG(pp_id), 1);
> >
> >         return 0;
> >  }
> 
> bit 31 is the enable bit (set that to 1), bits 15:0 are the
> frame_count (how many te events before the MDP sends a frame, I'd
> recommend set to 1).  Then after its programmed, you'll have to flush
> the config, and probably use a _START to make sure the flush takes
> effect.

I think that I initially get autorefresh enabled based on your
description above since the ping pong IRQs occur much more frequently.
However pretty quickly the error 'dsi_err_worker: status=c' is shown,
the contents on the screen shift to the right, and the screen no longer
updates after that. That error decodes to
DSI_ERR_STATE_DLN0_PHY | DSI_ERR_STATE_FIFO according to dsi_host.c.

Here's the relevant code that I have so far:

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
index eeef41fcd4e1..85a5cfe54ce8 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
@@ -157,6 +157,7 @@ void mdp5_cmd_encoder_enable(struct drm_encoder *encoder)
        struct mdp5_ctl *ctl = mdp5_cmd_enc->ctl;
        struct mdp5_interface *intf = mdp5_cmd_enc->intf;
        struct mdp5_pipeline *pipeline = mdp5_crtc_get_pipeline(encoder->crtc);
+       struct mdp5_kms *mdp5_kms = get_kms(encoder);;
 
        if (WARN_ON(mdp5_cmd_enc->enabled))
                return;
@@ -167,6 +168,14 @@ void mdp5_cmd_encoder_enable(struct drm_encoder *encoder)
 
        mdp5_ctl_commit(ctl, pipeline, mdp_ctl_flush_mask_encoder(intf), true);
 
+       if (intf->type == INTF_DSI &&
+           intf->mode == MDP5_INTF_DSI_MODE_COMMAND) {
+               mdp5_write(mdp5_kms,
+                          REG_MDP5_PP_AUTOREFRESH_CONFIG(pipeline->mixer->pp),
+                          BIT(31) | BIT(0));
+               mdp5_crtc_flush_all(encoder->crtc);
+       }
+
        mdp5_ctl_set_encoder_state(ctl, pipeline, true);
 
        mdp5_cmd_enc->enabled = true;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 05cc04f729d6..369746ebbc42 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -103,7 +104,7 @@ static u32 crtc_flush(struct drm_crtc *crtc, u32 flush_mask)
  * so that we can safely queue unref to current fb (ie. next
  * vblank we know hw is done w/ previous scanout_fb).
  */
-static u32 crtc_flush_all(struct drm_crtc *crtc)
+u32 mdp5_crtc_flush_all(struct drm_crtc *crtc)
 {
        struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
        struct mdp5_hw_mixer *mixer, *r_mixer;
@@ -734,7 +735,7 @@ static void mdp5_crtc_atomic_flush(struct drm_crtc *crtc,
        if (mdp5_cstate->cmd_mode)
                request_pp_done_pending(crtc);
 
-       mdp5_crtc->flushed_mask = crtc_flush_all(crtc);
+       mdp5_crtc->flushed_mask = mdp5_crtc_flush_all(crtc);
 
        /* XXX are we leaking out state here? */
        mdp5_crtc->vblank.irqmask = mdp5_cstate->vblank_irqmask;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
index 128866742593..3490328ab63e 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
@@ -278,6 +278,7 @@ enum mdp5_pipe mdp5_plane_right_pipe(struct drm_plane *plane);
 struct drm_plane *mdp5_plane_init(struct drm_device *dev,
                                  enum drm_plane_type type);
 
+u32 mdp5_crtc_flush_all(struct drm_crtc *crtc);
 struct mdp5_ctl *mdp5_crtc_get_ctl(struct drm_crtc *crtc);
 uint32_t mdp5_crtc_vblank(struct drm_crtc *crtc);
 

Note that mdp5_ctl_set_encoder_state() will call send_start_signal()
for a command-mode panel.

I put a HERE log statement in request_pp_done_pending() and
mdp5_crtc_pp_done_irq() and here's the relevant part of dmesg:

[   13.832596] msm fd900000.mdss: pp done time out, lm=0
[   13.832690] request_pp_done_pending: HERE
[   13.899890] mdp5_crtc_pp_done_irq: HERE
[   13.899981] Console: switching to colour frame buffer device 135x120
[   13.916662] mdp5_crtc_pp_done_irq: HERE
[   13.916813] request_pp_done_pending: HERE
[   13.933439] mdp5_crtc_pp_done_irq: HERE
[   13.950217] mdp5_crtc_pp_done_irq: HERE
[   13.950295] request_pp_done_pending: HERE
[   13.959973] msm fd900000.mdss: fb0: msmdrmfb frame buffer device
[   13.964469] i2c i2c-4: Added multiplexed i2c bus 5
[   13.966998] mdp5_crtc_pp_done_irq: HERE
[   13.983780] mdp5_crtc_pp_done_irq: HERE
[   13.983932] request_pp_done_pending: HERE
[   14.000617] mdp5_crtc_pp_done_irq: HERE
[   14.017393] mdp5_crtc_pp_done_irq: HERE
[   14.017539] request_pp_done_pending: HERE
[   14.034173] mdp5_crtc_pp_done_irq: HERE
[   14.050956] mdp5_crtc_pp_done_irq: HERE
[   14.067738] mdp5_crtc_pp_done_irq: HERE
[   14.084521] mdp5_crtc_pp_done_irq: HERE
[   14.101305] mdp5_crtc_pp_done_irq: HERE
[   14.118085] mdp5_crtc_pp_done_irq: HERE
[   14.134866] mdp5_crtc_pp_done_irq: HERE
[   14.151646] mdp5_crtc_pp_done_irq: HERE
[   14.168425] mdp5_crtc_pp_done_irq: HERE
[   14.185204] mdp5_crtc_pp_done_irq: HERE
[   14.192790] request_pp_done_pending: HERE
[   14.192967] dsi_err_worker: status=c
[   14.241759] dsi_err_worker: status=c
[   14.252650] msm fd900000.mdss: pp done time out, lm=0
[   14.462645] msm fd900000.mdss: pp done time out, lm=0
[   14.462704] request_pp_done_pending: HERE
[   14.522644] msm fd900000.mdss: pp done time out, lm=0
[   14.672643] msm fd900000.mdss: pp done time out, lm=0
[   14.672702] request_pp_done_pending: HERE
[   14.732643] msm fd900000.mdss: pp done time out, lm=0
[   14.882644] msm fd900000.mdss: pp done time out, lm=0

Brian
