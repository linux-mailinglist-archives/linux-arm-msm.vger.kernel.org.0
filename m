Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F29BF2D1B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 12:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388259AbfKGLKV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 06:10:21 -0500
Received: from onstation.org ([52.200.56.107]:55338 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727707AbfKGLKV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 06:10:21 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id C56A53E89E;
        Thu,  7 Nov 2019 11:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1573125020;
        bh=QbmX0feSHkj2IBz00wrWT+q2Nqc82ijEV92sQq0svlo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NtLyXOZmqzf2z4jSd+VRrh+vNbS11NeP0SbJy8Ayqi8JJsVSFOVWqFSwQVFfmXcmx
         silVvYWhLO7Rq3UNcg5kss290CUlW6sNOSDD4Yx+g0xlt6lKigqJCK9yPHcwZ3G+6L
         aVpDp2vnHeYstYeX6NNroAa3p0kT2PMdiD3HPPAQ=
Date:   Thu, 7 Nov 2019 06:10:19 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] drm/msm: 'pp done time out' errors after async
 commit changes
Message-ID: <20191107111019.GA24028@onstation.org>
References: <20191105000129.GA6536@onstation.org>
 <CAF6AEGv3gs+LFOP3AGthXd4niFb_XYOuwLfEa2G9eb27b1wMMA@mail.gmail.com>
 <20191105100804.GA9492@onstation.org>
 <CAF6AEGtB+g=4eiB31jkyuBGW7r0TBSh2oMj6TGtSgQ=q1ZV1tg@mail.gmail.com>
 <20191106091335.GA16729@onstation.org>
 <CAF6AEGuEO1jg6KhOFWEMUjq4ZQy5w61dWJk6uLWRzHnMZYZv=g@mail.gmail.com>
 <CAOCk7NomH2MsZ+FvPFAMWeabOFpyOwODCb_Ro07v+2k2v_C4NA@mail.gmail.com>
 <CAF6AEGsZkJJTNZ8SzHsSioEnkpekr1Texu5_EeBW1hP-bsOyjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGsZkJJTNZ8SzHsSioEnkpekr1Texu5_EeBW1hP-bsOyjQ@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 06, 2019 at 08:58:59AM -0800, Rob Clark wrote:
> On Wed, Nov 6, 2019 at 8:47 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> >
> > On Wed, Nov 6, 2019 at 9:30 AM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Wed, Nov 6, 2019 at 1:13 AM Brian Masney <masneyb@onstation.org> wrote:
> > > >
> > > > On Tue, Nov 05, 2019 at 08:23:27AM -0800, Rob Clark wrote:
> > > > > On Tue, Nov 5, 2019 at 2:08 AM Brian Masney <masneyb@onstation.org> wrote:
> > > > > > The 'pp done time out' errors go away if I revert the following three
> > > > > > commits:
> > > > > >
> > > > > > cd6d923167b1 ("drm/msm/dpu: async commit support")
> > > > > > d934a712c5e6 ("drm/msm: add atomic traces")
> > > > > > 2d99ced787e3 ("drm/msm: async commit support")
> > > > > >
> > > > > > I reverted the first one to fix a compiler error, and the second one so
> > > > > > that the last patch can be reverted without any merge conflicts.
> > > > > >
> > > > > > I see that crtc_flush() calls mdp5_ctl_commit(). I tried to use
> > > > > > crtc_flush_all() in mdp5_flush_commit() and the contents of the frame
> > > > > > buffer dance around the screen like its out of sync. I renamed
> > > > > > crtc_flush_all() to mdp5_crtc_flush_all() and removed the static
> > > > > > declaration. Here's the relevant part of what I tried:
> > > > > >
> > > > > > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > > > > > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > > > > > @@ -171,7 +171,15 @@ static void mdp5_prepare_commit(struct msm_kms *kms, struct drm_atomic_state *st
> > > > > >
> > > > > >  static void mdp5_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
> > > > > >  {
> > > > > > -       /* TODO */
> > > > > > +       struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
> > > > > > +       struct drm_crtc *crtc;
> > > > > > +
> > > > > > +       for_each_crtc_mask(mdp5_kms->dev, crtc, crtc_mask) {
> > > > > > +               if (!crtc->state->active)
> > > > > > +                       continue;
> > > > > > +
> > > > > > +               mdp5_crtc_flush_all(crtc);
> > > > > > +       }
> > > > > >  }
> > > > > >
> > > > > > Any tips would be appreciated.
> > > > >
> > > > >
> > > > > I think this is along the lines of what we need to enable async commit
> > > > > for mdp5 (but also removing the flush from the atomic-commit path)..
> > > > > the principle behind the async commit is to do all the atomic state
> > > > > commit normally, but defer writing the flush bits.  This way, if you
> > > > > get another async update before the next vblank, you just apply it
> > > > > immediately instead of waiting for vblank.
> > > > >
> > > > > But I guess you are on a command mode panel, if I remember?  Which is
> > > > > a case I didn't have a way to test.  And I'm not entirely about how
> > > > > kms_funcs->vsync_time() should be implemented for cmd mode panels.
> > > >
> > > > Yes, this is a command-mode panel and there's no hardware frame counter
> > > > available. The key to getting the display working on this phone was this
> > > > patch:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2bab52af6fe68c43b327a57e5ce5fc10eefdfadf
> > > >
> > > > > That all said, I think we should first fix what is broken, before
> > > > > worrying about extending async commit support to mdp5.. which
> > > > > shouldn't hit the async==true path, due to not implementing
> > > > > kms_funcs->vsync_time().
> > > > >
> > > > > What I think is going on is that, in the cmd mode case,
> > > > > mdp5_wait_flush() (indirectly) calls mdp5_crtc_wait_for_pp_done(),
> > > > > which waits for a pp-done irq regardless of whether there is a flush
> > > > > in progress.  Since there is no flush pending, the irq never comes.
> > > > > But the expectation is that kms_funcs->wait_flush() returns
> > > > > immediately if there is nothing to wait for.
> > > >
> > > > I don't think that's happening in this case. I added some pr_info()
> > > > statements to request_pp_done_pending() and mdp5_crtc_pp_done_irq().
> > > > Here's the first two sets of messages that appear in dmesg:
> > > >
> > > > [   14.018907] msm fd900000.mdss: pp done time out, lm=0
> > > > [   14.018993] request_pp_done_pending: HERE
> > > > [   14.074208] mdp5_crtc_pp_done_irq: HERE
> > > > [   14.074368] Console: switching to colour frame buffer device 135x120
> > > > [   14.138938] msm fd900000.mdss: pp done time out, lm=0
> > > > [   14.139021] request_pp_done_pending: HERE
> > > > [   14.158097] mdp5_crtc_pp_done_irq: HERE
> > > >
> > > > The messages go on like this with the same pattern.
> > > >
> > > > I tried two different changes:
> > > >
> > > > 1) I moved the request_pp_done_pending() and corresponding if statement
> > > >    from mdp5_crtc_atomic_flush() and into mdp5_crtc_atomic_begin().
> > > >
> > > > 2) I increased the timeout in wait_for_completion_timeout() by several
> > > >    increments; all the way to 5 seconds.
> > >
> > > increasing the timeout won't help, because the pp-done irq has already
> > > come at the point where we wait for it..
> > >
> > > maybe the easy thing is just add mdp5_crtc->needs_pp, set to true
> > > before requesting, and false when we get the irq.. and then
> > > mdp5_crtc_wait_for_pp_done() just returns if needs_pp==false..
> >
> > On the otherhand, what about trying to make command mode panels
> > resemble video mode panels slightly?  Video mode panels have a vsync
> > counter in hardware, which is missing from command mode - however it
> > seems like the driver/drm framework would prefer such a counter.
> > Would it be a reasonable idea to make a software counter, and just
> > increment it every time the pp_done irq is triggered?
> >
> > I'm just thinking that we'll avoid issues long term by trying to make
> > the code common, rather than diverging it for the two modes.
> >
> 
> *possibly*, but I think we want to account somehow periods where
> display is not updated.
> 
> fwiw, it isn't that uncommon for userspace to use vblanks to "keep
> time" (drive animations for desktop switch, window
> maximize/unmaximize, etc).. it could be a surprise when "vblank" is
> not periodic.

What do you think about using some variation of the current value of
jiffies in the kernel + the number of pp_done IRQs as the software
counter for command-mode panels?

Brian
