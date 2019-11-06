Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15ACAF1BD7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 17:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727746AbfKFQ7N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 11:59:13 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:40378 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727894AbfKFQ7N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 11:59:13 -0500
Received: by mail-ed1-f68.google.com with SMTP id p59so19922314edp.7;
        Wed, 06 Nov 2019 08:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gBwyi2vUMFCQ9EewZLonM+Leo+vfm/dcmTg/r5rR65Q=;
        b=gKTrM77V4qX8X9qNz87lZHT6mwnmLivmeLFE2de2qflrNk/4mrgkX04n48Isan050a
         BroS/XWVaIoBDhky1eGK+V5+ai5JQClyjzpVtxCRkgSQLpEwbSqLUc6NXspmxepPQgRb
         VP0oQ2gklGPuNKrluIIM3JYg7AzWz9733JZz40PVrqFbm3t0y9d68sMPOpCfRC61UJuy
         SQi1jOz508jT/BwIq2ZRW/+vgiIQV5UWCw+sY2TKiDyi5/VLhttTJZ+FKpLXw3nchLfL
         BGhoxx4Q65ewLeaZmVeNBGg9dY3cV/2Yb72fFpNfsLWyoyWTPlDYAXZgOK6a1XFdmUIr
         oLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gBwyi2vUMFCQ9EewZLonM+Leo+vfm/dcmTg/r5rR65Q=;
        b=Gfvz/AjGdrMuIcvbYh3RMBJKZnhwx8Q8gwbUZkeBFtwW/qUhIbZN9aTCTqCJu5YXS5
         gAdakheywFGMuuwHBXD7d3nWkvKMrQPOvnvfrLMcW20V3cnvq9UnGH4DidyTIJUl2IFp
         byUcdrcxHcvqvr496rNG+4v9zkcR3meqI3cshJAboo0Lbmsp8833X2WkOP2PvVsKn8mW
         4WysV3quny2i1p7kaAMx38bPPTSooDwUO7Zbj5Di2BQZjdF/0xJhcSHvVQE3WkG7CBAF
         T7boN/REC4oUCHwo26/DC4BiqyWK3ZX4FO9x4CAD29FKAox1OgkkikD8eGURbD6v+lzb
         dzsA==
X-Gm-Message-State: APjAAAXe9buJgk97Zc6J2VxHvif15L+2s16Y+iWvtFRqfrKAHrU0NxoJ
        EfZ2DbqtU8u2oNJTEBjlVZ9WFMaT0AP5IS0FqHE=
X-Google-Smtp-Source: APXvYqzEuJcVK0/OeBybxHUu1Wd00sRuScOiu/CQgbGU9BUa13nu4GW5IOo8gWnrIuuAORXFO4+BtSQHgwGPslAckYI=
X-Received: by 2002:a50:a697:: with SMTP id e23mr3871635edc.264.1573059550755;
 Wed, 06 Nov 2019 08:59:10 -0800 (PST)
MIME-Version: 1.0
References: <20191105000129.GA6536@onstation.org> <CAF6AEGv3gs+LFOP3AGthXd4niFb_XYOuwLfEa2G9eb27b1wMMA@mail.gmail.com>
 <20191105100804.GA9492@onstation.org> <CAF6AEGtB+g=4eiB31jkyuBGW7r0TBSh2oMj6TGtSgQ=q1ZV1tg@mail.gmail.com>
 <20191106091335.GA16729@onstation.org> <CAF6AEGuEO1jg6KhOFWEMUjq4ZQy5w61dWJk6uLWRzHnMZYZv=g@mail.gmail.com>
 <CAOCk7NomH2MsZ+FvPFAMWeabOFpyOwODCb_Ro07v+2k2v_C4NA@mail.gmail.com>
In-Reply-To: <CAOCk7NomH2MsZ+FvPFAMWeabOFpyOwODCb_Ro07v+2k2v_C4NA@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 6 Nov 2019 08:58:59 -0800
Message-ID: <CAF6AEGsZkJJTNZ8SzHsSioEnkpekr1Texu5_EeBW1hP-bsOyjQ@mail.gmail.com>
Subject: Re: [Freedreno] drm/msm: 'pp done time out' errors after async commit changes
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Brian Masney <masneyb@onstation.org>,
        Rob Clark <robdclark@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 6, 2019 at 8:47 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> On Wed, Nov 6, 2019 at 9:30 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Wed, Nov 6, 2019 at 1:13 AM Brian Masney <masneyb@onstation.org> wrote:
> > >
> > > On Tue, Nov 05, 2019 at 08:23:27AM -0800, Rob Clark wrote:
> > > > On Tue, Nov 5, 2019 at 2:08 AM Brian Masney <masneyb@onstation.org> wrote:
> > > > > The 'pp done time out' errors go away if I revert the following three
> > > > > commits:
> > > > >
> > > > > cd6d923167b1 ("drm/msm/dpu: async commit support")
> > > > > d934a712c5e6 ("drm/msm: add atomic traces")
> > > > > 2d99ced787e3 ("drm/msm: async commit support")
> > > > >
> > > > > I reverted the first one to fix a compiler error, and the second one so
> > > > > that the last patch can be reverted without any merge conflicts.
> > > > >
> > > > > I see that crtc_flush() calls mdp5_ctl_commit(). I tried to use
> > > > > crtc_flush_all() in mdp5_flush_commit() and the contents of the frame
> > > > > buffer dance around the screen like its out of sync. I renamed
> > > > > crtc_flush_all() to mdp5_crtc_flush_all() and removed the static
> > > > > declaration. Here's the relevant part of what I tried:
> > > > >
> > > > > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > > > > @@ -171,7 +171,15 @@ static void mdp5_prepare_commit(struct msm_kms *kms, struct drm_atomic_state *st
> > > > >
> > > > >  static void mdp5_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
> > > > >  {
> > > > > -       /* TODO */
> > > > > +       struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
> > > > > +       struct drm_crtc *crtc;
> > > > > +
> > > > > +       for_each_crtc_mask(mdp5_kms->dev, crtc, crtc_mask) {
> > > > > +               if (!crtc->state->active)
> > > > > +                       continue;
> > > > > +
> > > > > +               mdp5_crtc_flush_all(crtc);
> > > > > +       }
> > > > >  }
> > > > >
> > > > > Any tips would be appreciated.
> > > >
> > > >
> > > > I think this is along the lines of what we need to enable async commit
> > > > for mdp5 (but also removing the flush from the atomic-commit path)..
> > > > the principle behind the async commit is to do all the atomic state
> > > > commit normally, but defer writing the flush bits.  This way, if you
> > > > get another async update before the next vblank, you just apply it
> > > > immediately instead of waiting for vblank.
> > > >
> > > > But I guess you are on a command mode panel, if I remember?  Which is
> > > > a case I didn't have a way to test.  And I'm not entirely about how
> > > > kms_funcs->vsync_time() should be implemented for cmd mode panels.
> > >
> > > Yes, this is a command-mode panel and there's no hardware frame counter
> > > available. The key to getting the display working on this phone was this
> > > patch:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2bab52af6fe68c43b327a57e5ce5fc10eefdfadf
> > >
> > > > That all said, I think we should first fix what is broken, before
> > > > worrying about extending async commit support to mdp5.. which
> > > > shouldn't hit the async==true path, due to not implementing
> > > > kms_funcs->vsync_time().
> > > >
> > > > What I think is going on is that, in the cmd mode case,
> > > > mdp5_wait_flush() (indirectly) calls mdp5_crtc_wait_for_pp_done(),
> > > > which waits for a pp-done irq regardless of whether there is a flush
> > > > in progress.  Since there is no flush pending, the irq never comes.
> > > > But the expectation is that kms_funcs->wait_flush() returns
> > > > immediately if there is nothing to wait for.
> > >
> > > I don't think that's happening in this case. I added some pr_info()
> > > statements to request_pp_done_pending() and mdp5_crtc_pp_done_irq().
> > > Here's the first two sets of messages that appear in dmesg:
> > >
> > > [   14.018907] msm fd900000.mdss: pp done time out, lm=0
> > > [   14.018993] request_pp_done_pending: HERE
> > > [   14.074208] mdp5_crtc_pp_done_irq: HERE
> > > [   14.074368] Console: switching to colour frame buffer device 135x120
> > > [   14.138938] msm fd900000.mdss: pp done time out, lm=0
> > > [   14.139021] request_pp_done_pending: HERE
> > > [   14.158097] mdp5_crtc_pp_done_irq: HERE
> > >
> > > The messages go on like this with the same pattern.
> > >
> > > I tried two different changes:
> > >
> > > 1) I moved the request_pp_done_pending() and corresponding if statement
> > >    from mdp5_crtc_atomic_flush() and into mdp5_crtc_atomic_begin().
> > >
> > > 2) I increased the timeout in wait_for_completion_timeout() by several
> > >    increments; all the way to 5 seconds.
> >
> > increasing the timeout won't help, because the pp-done irq has already
> > come at the point where we wait for it..
> >
> > maybe the easy thing is just add mdp5_crtc->needs_pp, set to true
> > before requesting, and false when we get the irq.. and then
> > mdp5_crtc_wait_for_pp_done() just returns if needs_pp==false..
>
> On the otherhand, what about trying to make command mode panels
> resemble video mode panels slightly?  Video mode panels have a vsync
> counter in hardware, which is missing from command mode - however it
> seems like the driver/drm framework would prefer such a counter.
> Would it be a reasonable idea to make a software counter, and just
> increment it every time the pp_done irq is triggered?
>
> I'm just thinking that we'll avoid issues long term by trying to make
> the code common, rather than diverging it for the two modes.
>

*possibly*, but I think we want to account somehow periods where
display is not updated.

fwiw, it isn't that uncommon for userspace to use vblanks to "keep
time" (drive animations for desktop switch, window
maximize/unmaximize, etc).. it could be a surprise when "vblank" is
not periodic.

BR,
-R
