Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3002F1B90
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 17:47:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732240AbfKFQrX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 11:47:23 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:36232 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732243AbfKFQrX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 11:47:23 -0500
Received: by mail-io1-f65.google.com with SMTP id s3so23907013ioe.3;
        Wed, 06 Nov 2019 08:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2R5MjRsOyPZ+phiKWzGDwF2/MhcPqEyoa3AVfrLcHWM=;
        b=ruoL50pDSqAk/m67JBky7sRfRYeZr0gXPsgu+ApwR/ycEDiAB0eRJT3mvpl/du1L0Q
         52A5mjgD1ZbHdqu/Hx1Uhhe1Ua+nrUpbr1ilZz1aqKXdS69tlAwkLUGixc1Bp5DctyQ3
         kHBLDgDf7dQbYMDKD4uKimsaKPVwbBp8YFUCSmGWldA75GtmsP1GK7rzQWHZT47q8Qoh
         BAWDf8ukvALIoglx7UvzTLA9A6NYWPKODQOTfvB7RmLFaivcWYYmjPl3TaBK7TxFV6DE
         aNepjb0xHLXoLssIIs6+OSHxIi7rGJ3mQ+W+fdIGM9YVKYg7Hb9k69qkQIHCW9j1YAyG
         youg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2R5MjRsOyPZ+phiKWzGDwF2/MhcPqEyoa3AVfrLcHWM=;
        b=TxkBkWa3EPjfaBKRQEgnMxfn3mkXr+dwUp9rAxns/BxUuDCkM9lxRSFD/nuoPZjSCQ
         wt5QmtXwgKEzO3QRPeUPQ22Ju1wj3BqEFMN+gjDoc8U5KSk9E3AtQWhyp8kyRovXUhUb
         zNDbkpNEBLSdz/4se8TBdwaNWd949pRFFu1bILmjbeXmUtNJGaLTFK0c76DaBKlo17R5
         01GYZTBL+LtG2F9Yj9htuHUm1tc8kjcY84B1frreEKGYyjNWf0GfHECvesFJcA537DvN
         9gPYx3feYhJMcfOetYjYSAdMXaUg+6/rb2FGvWqd/KNXrQcWHVdtJEXO9ncHNneeRG6F
         6NjQ==
X-Gm-Message-State: APjAAAUcgleAdtoL7GlLNB7q+EspFy+i0utaspReFCBB4+vGFqD52rA+
        euWkJIMkw3l7lQsY5oXhE3NbcCKMS5JB1uiGBhI=
X-Google-Smtp-Source: APXvYqxH5Ib6M5MWFwrsZQWfqPmZ4IY34qPLHotGHrUurUCRA88RVvH5TE2xsiTrkijZdVOnVqjZ2qYTdLM/+AGPxM4=
X-Received: by 2002:a5d:8e17:: with SMTP id e23mr1367166iod.263.1573058842250;
 Wed, 06 Nov 2019 08:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20191105000129.GA6536@onstation.org> <CAF6AEGv3gs+LFOP3AGthXd4niFb_XYOuwLfEa2G9eb27b1wMMA@mail.gmail.com>
 <20191105100804.GA9492@onstation.org> <CAF6AEGtB+g=4eiB31jkyuBGW7r0TBSh2oMj6TGtSgQ=q1ZV1tg@mail.gmail.com>
 <20191106091335.GA16729@onstation.org> <CAF6AEGuEO1jg6KhOFWEMUjq4ZQy5w61dWJk6uLWRzHnMZYZv=g@mail.gmail.com>
In-Reply-To: <CAF6AEGuEO1jg6KhOFWEMUjq4ZQy5w61dWJk6uLWRzHnMZYZv=g@mail.gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Wed, 6 Nov 2019 09:47:11 -0700
Message-ID: <CAOCk7NomH2MsZ+FvPFAMWeabOFpyOwODCb_Ro07v+2k2v_C4NA@mail.gmail.com>
Subject: Re: [Freedreno] drm/msm: 'pp done time out' errors after async commit changes
To:     Rob Clark <robdclark@gmail.com>
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

On Wed, Nov 6, 2019 at 9:30 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, Nov 6, 2019 at 1:13 AM Brian Masney <masneyb@onstation.org> wrote:
> >
> > On Tue, Nov 05, 2019 at 08:23:27AM -0800, Rob Clark wrote:
> > > On Tue, Nov 5, 2019 at 2:08 AM Brian Masney <masneyb@onstation.org> wrote:
> > > > The 'pp done time out' errors go away if I revert the following three
> > > > commits:
> > > >
> > > > cd6d923167b1 ("drm/msm/dpu: async commit support")
> > > > d934a712c5e6 ("drm/msm: add atomic traces")
> > > > 2d99ced787e3 ("drm/msm: async commit support")
> > > >
> > > > I reverted the first one to fix a compiler error, and the second one so
> > > > that the last patch can be reverted without any merge conflicts.
> > > >
> > > > I see that crtc_flush() calls mdp5_ctl_commit(). I tried to use
> > > > crtc_flush_all() in mdp5_flush_commit() and the contents of the frame
> > > > buffer dance around the screen like its out of sync. I renamed
> > > > crtc_flush_all() to mdp5_crtc_flush_all() and removed the static
> > > > declaration. Here's the relevant part of what I tried:
> > > >
> > > > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > > > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > > > @@ -171,7 +171,15 @@ static void mdp5_prepare_commit(struct msm_kms *kms, struct drm_atomic_state *st
> > > >
> > > >  static void mdp5_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
> > > >  {
> > > > -       /* TODO */
> > > > +       struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
> > > > +       struct drm_crtc *crtc;
> > > > +
> > > > +       for_each_crtc_mask(mdp5_kms->dev, crtc, crtc_mask) {
> > > > +               if (!crtc->state->active)
> > > > +                       continue;
> > > > +
> > > > +               mdp5_crtc_flush_all(crtc);
> > > > +       }
> > > >  }
> > > >
> > > > Any tips would be appreciated.
> > >
> > >
> > > I think this is along the lines of what we need to enable async commit
> > > for mdp5 (but also removing the flush from the atomic-commit path)..
> > > the principle behind the async commit is to do all the atomic state
> > > commit normally, but defer writing the flush bits.  This way, if you
> > > get another async update before the next vblank, you just apply it
> > > immediately instead of waiting for vblank.
> > >
> > > But I guess you are on a command mode panel, if I remember?  Which is
> > > a case I didn't have a way to test.  And I'm not entirely about how
> > > kms_funcs->vsync_time() should be implemented for cmd mode panels.
> >
> > Yes, this is a command-mode panel and there's no hardware frame counter
> > available. The key to getting the display working on this phone was this
> > patch:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2bab52af6fe68c43b327a57e5ce5fc10eefdfadf
> >
> > > That all said, I think we should first fix what is broken, before
> > > worrying about extending async commit support to mdp5.. which
> > > shouldn't hit the async==true path, due to not implementing
> > > kms_funcs->vsync_time().
> > >
> > > What I think is going on is that, in the cmd mode case,
> > > mdp5_wait_flush() (indirectly) calls mdp5_crtc_wait_for_pp_done(),
> > > which waits for a pp-done irq regardless of whether there is a flush
> > > in progress.  Since there is no flush pending, the irq never comes.
> > > But the expectation is that kms_funcs->wait_flush() returns
> > > immediately if there is nothing to wait for.
> >
> > I don't think that's happening in this case. I added some pr_info()
> > statements to request_pp_done_pending() and mdp5_crtc_pp_done_irq().
> > Here's the first two sets of messages that appear in dmesg:
> >
> > [   14.018907] msm fd900000.mdss: pp done time out, lm=0
> > [   14.018993] request_pp_done_pending: HERE
> > [   14.074208] mdp5_crtc_pp_done_irq: HERE
> > [   14.074368] Console: switching to colour frame buffer device 135x120
> > [   14.138938] msm fd900000.mdss: pp done time out, lm=0
> > [   14.139021] request_pp_done_pending: HERE
> > [   14.158097] mdp5_crtc_pp_done_irq: HERE
> >
> > The messages go on like this with the same pattern.
> >
> > I tried two different changes:
> >
> > 1) I moved the request_pp_done_pending() and corresponding if statement
> >    from mdp5_crtc_atomic_flush() and into mdp5_crtc_atomic_begin().
> >
> > 2) I increased the timeout in wait_for_completion_timeout() by several
> >    increments; all the way to 5 seconds.
>
> increasing the timeout won't help, because the pp-done irq has already
> come at the point where we wait for it..
>
> maybe the easy thing is just add mdp5_crtc->needs_pp, set to true
> before requesting, and false when we get the irq.. and then
> mdp5_crtc_wait_for_pp_done() just returns if needs_pp==false..

On the otherhand, what about trying to make command mode panels
resemble video mode panels slightly?  Video mode panels have a vsync
counter in hardware, which is missing from command mode - however it
seems like the driver/drm framework would prefer such a counter.
Would it be a reasonable idea to make a software counter, and just
increment it every time the pp_done irq is triggered?

I'm just thinking that we'll avoid issues long term by trying to make
the code common, rather than diverging it for the two modes.

>
> BR,
> -R
>
> > I haven't dug into the new code anymore.
> >
> > Brian
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
