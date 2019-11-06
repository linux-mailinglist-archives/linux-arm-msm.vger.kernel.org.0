Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE81AF11DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 10:13:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbfKFJNi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 04:13:38 -0500
Received: from onstation.org ([52.200.56.107]:50818 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727068AbfKFJNh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 04:13:37 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 4C6AD3E89E;
        Wed,  6 Nov 2019 09:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1573031616;
        bh=RUF1WwHyOvF/ICJ9FPqUfBjj8jBynQSgDGGQCKj3KcU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JZ7pcRrncpt2INI1fhnGVZld48I0H1BWpwgs/IFVtpcbeS3G0hex4iVWfr2R9CiAk
         ilG9jWvfBz7JtizUD21xVJSid8A/XPYJn+J3RL0SvBM2aS0s7PV+nkZrLi5UUPcbiG
         WncMd6mFPNbEg7eMg5YKAyiHFBJs1AopFvKSpK7Y=
Date:   Wed, 6 Nov 2019 04:13:35 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Rob Clark <robdclark@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [Freedreno] drm/msm: 'pp done time out' errors after async
 commit changes
Message-ID: <20191106091335.GA16729@onstation.org>
References: <20191105000129.GA6536@onstation.org>
 <CAF6AEGv3gs+LFOP3AGthXd4niFb_XYOuwLfEa2G9eb27b1wMMA@mail.gmail.com>
 <20191105100804.GA9492@onstation.org>
 <CAF6AEGtB+g=4eiB31jkyuBGW7r0TBSh2oMj6TGtSgQ=q1ZV1tg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGtB+g=4eiB31jkyuBGW7r0TBSh2oMj6TGtSgQ=q1ZV1tg@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 05, 2019 at 08:23:27AM -0800, Rob Clark wrote:
> On Tue, Nov 5, 2019 at 2:08 AM Brian Masney <masneyb@onstation.org> wrote:
> > The 'pp done time out' errors go away if I revert the following three
> > commits:
> >
> > cd6d923167b1 ("drm/msm/dpu: async commit support")
> > d934a712c5e6 ("drm/msm: add atomic traces")
> > 2d99ced787e3 ("drm/msm: async commit support")
> >
> > I reverted the first one to fix a compiler error, and the second one so
> > that the last patch can be reverted without any merge conflicts.
> >
> > I see that crtc_flush() calls mdp5_ctl_commit(). I tried to use
> > crtc_flush_all() in mdp5_flush_commit() and the contents of the frame
> > buffer dance around the screen like its out of sync. I renamed
> > crtc_flush_all() to mdp5_crtc_flush_all() and removed the static
> > declaration. Here's the relevant part of what I tried:
> >
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > @@ -171,7 +171,15 @@ static void mdp5_prepare_commit(struct msm_kms *kms, struct drm_atomic_state *st
> >
> >  static void mdp5_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
> >  {
> > -       /* TODO */
> > +       struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
> > +       struct drm_crtc *crtc;
> > +
> > +       for_each_crtc_mask(mdp5_kms->dev, crtc, crtc_mask) {
> > +               if (!crtc->state->active)
> > +                       continue;
> > +
> > +               mdp5_crtc_flush_all(crtc);
> > +       }
> >  }
> >
> > Any tips would be appreciated.
> 
> 
> I think this is along the lines of what we need to enable async commit
> for mdp5 (but also removing the flush from the atomic-commit path)..
> the principle behind the async commit is to do all the atomic state
> commit normally, but defer writing the flush bits.  This way, if you
> get another async update before the next vblank, you just apply it
> immediately instead of waiting for vblank.
> 
> But I guess you are on a command mode panel, if I remember?  Which is
> a case I didn't have a way to test.  And I'm not entirely about how
> kms_funcs->vsync_time() should be implemented for cmd mode panels.

Yes, this is a command-mode panel and there's no hardware frame counter
available. The key to getting the display working on this phone was this
patch:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2bab52af6fe68c43b327a57e5ce5fc10eefdfadf

> That all said, I think we should first fix what is broken, before
> worrying about extending async commit support to mdp5.. which
> shouldn't hit the async==true path, due to not implementing
> kms_funcs->vsync_time().
> 
> What I think is going on is that, in the cmd mode case,
> mdp5_wait_flush() (indirectly) calls mdp5_crtc_wait_for_pp_done(),
> which waits for a pp-done irq regardless of whether there is a flush
> in progress.  Since there is no flush pending, the irq never comes.
> But the expectation is that kms_funcs->wait_flush() returns
> immediately if there is nothing to wait for.

I don't think that's happening in this case. I added some pr_info()
statements to request_pp_done_pending() and mdp5_crtc_pp_done_irq().
Here's the first two sets of messages that appear in dmesg:

[   14.018907] msm fd900000.mdss: pp done time out, lm=0
[   14.018993] request_pp_done_pending: HERE
[   14.074208] mdp5_crtc_pp_done_irq: HERE
[   14.074368] Console: switching to colour frame buffer device 135x120
[   14.138938] msm fd900000.mdss: pp done time out, lm=0
[   14.139021] request_pp_done_pending: HERE
[   14.158097] mdp5_crtc_pp_done_irq: HERE

The messages go on like this with the same pattern.

I tried two different changes:

1) I moved the request_pp_done_pending() and corresponding if statement
   from mdp5_crtc_atomic_flush() and into mdp5_crtc_atomic_begin().

2) I increased the timeout in wait_for_completion_timeout() by several
   increments; all the way to 5 seconds.

I haven't dug into the new code anymore.

Brian
