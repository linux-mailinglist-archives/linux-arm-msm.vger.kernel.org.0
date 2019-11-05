Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0799F0294
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 17:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390293AbfKEQXl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 11:23:41 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:35569 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390163AbfKEQXk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 11:23:40 -0500
Received: by mail-ed1-f65.google.com with SMTP id r16so1879944edq.2;
        Tue, 05 Nov 2019 08:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iBa+KNl3xfEoQ3x091yW97I1pFeckDAp+HE7IN9AsKI=;
        b=ADZ8m3Wuu05byt5FiXJhBT03hcjcIPcfov3vj/h4AVSisEIHZv9YfyIkUT2yDdd4dx
         B0WixpljI53ZSMmyqljoOzIpkP2LuXY8q1vsJVhIMk/imCrzuPLrJzMyLbBzQhTHJcQ3
         R4bwlQ771m5PoPm1m9/UDGcBbh5qNQ6wl/QR2DsanVV1tJzcm7ppsmlvpQh4HjfNbG5t
         63hV9BAt6JFSGsTOVQemjsGCjUeCkNqKjkqY/D7rG5gPA76/kjtkk8ORD20jUVmfhzho
         8FiJ2Q40mtGYzMsduyUFwURe02dZkTSI3PLMEjzjKAQyod30gBQVCzquG/kQuAr4bEA1
         HtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iBa+KNl3xfEoQ3x091yW97I1pFeckDAp+HE7IN9AsKI=;
        b=bSc93u1iKmt8RKJHZwplrhOL22GmfXy24kCg8iY6N0og23zD9vXR9J3GP+go5OObNO
         90x3mt3818uarDPDCvOwck1zWnhJpAhz+VrjXWGYNuPn9OAD+axfT3C48NA26/RHy6cD
         3ti5pGlEHuRYLIrP9hoQ/uauB7yDw4sLbIPBSZZvPAd1OnLVFit+DRGmbXW1iNjsMNCD
         fVRmr5D6Ld5451js6bLcPi5rjPv4rJ5mXriwO0Lp4sN5g4OIrVumabs4gqQaJTLSVJ3P
         YV4wIGQgtJF1PnPG1glFCBY3njqS+pK74sY6wNxKbGRaCftFb2GV3XNlLqlfkkFVr/JA
         Vy7g==
X-Gm-Message-State: APjAAAWRItUOyWv2p0AEO7yzlzoorGZ/rB0kwlXTyHgQsjgLxAAooukH
        mvKMJ3ELgGMzC8myFCCsWj6zPgNUqRdWuU6he2s=
X-Google-Smtp-Source: APXvYqw6DHiWy5Jq5QER0vWdT0e+O38XHNiZfNfrlZo7CtFTenpQYQGBiQkm25QU55awefud20PSxaXykIphCpiisVU=
X-Received: by 2002:a17:906:73d5:: with SMTP id n21mr30279787ejl.228.1572971018138;
 Tue, 05 Nov 2019 08:23:38 -0800 (PST)
MIME-Version: 1.0
References: <20191105000129.GA6536@onstation.org> <CAF6AEGv3gs+LFOP3AGthXd4niFb_XYOuwLfEa2G9eb27b1wMMA@mail.gmail.com>
 <20191105100804.GA9492@onstation.org>
In-Reply-To: <20191105100804.GA9492@onstation.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 5 Nov 2019 08:23:27 -0800
Message-ID: <CAF6AEGtB+g=4eiB31jkyuBGW7r0TBSh2oMj6TGtSgQ=q1ZV1tg@mail.gmail.com>
Subject: Re: [Freedreno] drm/msm: 'pp done time out' errors after async commit changes
To:     Brian Masney <masneyb@onstation.org>
Cc:     Rob Clark <robdclark@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 5, 2019 at 2:08 AM Brian Masney <masneyb@onstation.org> wrote:
>
> On Mon, Nov 04, 2019 at 04:19:07PM -0800, Rob Clark wrote:
> > On Mon, Nov 4, 2019 at 4:01 PM Brian Masney <masneyb@onstation.org> wrote:
> > >
> > > Hey Rob,
> > >
> > > Since commit 2d99ced787e3 ("drm/msm: async commit support"), the frame
> > > buffer console on my Nexus 5 began throwing these errors:
> > >
> > > msm fd900000.mdss: pp done time out, lm=0
> > >
> > > The display still works.
> > >
> > > I see that mdp5_flush_commit() was introduced in commit 9f6b65642bd2
> > > ("drm/msm: add kms->flush_commit()") with a TODO comment and the commit
> > > description mentions flushing registers. I assume that this is the
> > > proper fix. If so, can you point me to where these registers are
> > > defined and I can work on the mdp5 implementation.
> >
> > See mdp5_ctl_commit(), which writes the CTL_FLUSH registers.. the idea
> > would be to defer writing CTL_FLUSH[ctl_id] = flush_mask until
> > kms->flush() (which happens from a timer shortly before vblank).
> >
> > But I think the async flush case should not come up with fbcon?  It
> > was really added to cope with hwcursor updates (and userspace that
> > assumes it can do an unlimited # of cursor updates per frame).. the
> > intention was that nothing should change in the sequence for mdp5 (but
> > I guess that was not the case).
>
> The 'pp done time out' errors go away if I revert the following three
> commits:
>
> cd6d923167b1 ("drm/msm/dpu: async commit support")
> d934a712c5e6 ("drm/msm: add atomic traces")
> 2d99ced787e3 ("drm/msm: async commit support")
>
> I reverted the first one to fix a compiler error, and the second one so
> that the last patch can be reverted without any merge conflicts.
>
> I see that crtc_flush() calls mdp5_ctl_commit(). I tried to use
> crtc_flush_all() in mdp5_flush_commit() and the contents of the frame
> buffer dance around the screen like its out of sync. I renamed
> crtc_flush_all() to mdp5_crtc_flush_all() and removed the static
> declaration. Here's the relevant part of what I tried:
>
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -171,7 +171,15 @@ static void mdp5_prepare_commit(struct msm_kms *kms, struct drm_atomic_state *st
>
>  static void mdp5_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
>  {
> -       /* TODO */
> +       struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
> +       struct drm_crtc *crtc;
> +
> +       for_each_crtc_mask(mdp5_kms->dev, crtc, crtc_mask) {
> +               if (!crtc->state->active)
> +                       continue;
> +
> +               mdp5_crtc_flush_all(crtc);
> +       }
>  }
>
> Any tips would be appreciated.


I think this is along the lines of what we need to enable async commit
for mdp5 (but also removing the flush from the atomic-commit path)..
the principle behind the async commit is to do all the atomic state
commit normally, but defer writing the flush bits.  This way, if you
get another async update before the next vblank, you just apply it
immediately instead of waiting for vblank.

But I guess you are on a command mode panel, if I remember?  Which is
a case I didn't have a way to test.  And I'm not entirely about how
kms_funcs->vsync_time() should be implemented for cmd mode panels.

That all said, I think we should first fix what is broken, before
worrying about extending async commit support to mdp5.. which
shouldn't hit the async==true path, due to not implementing
kms_funcs->vsync_time().

What I think is going on is that, in the cmd mode case,
mdp5_wait_flush() (indirectly) calls mdp5_crtc_wait_for_pp_done(),
which waits for a pp-done irq regardless of whether there is a flush
in progress.  Since there is no flush pending, the irq never comes.
But the expectation is that kms_funcs->wait_flush() returns
immediately if there is nothing to wait for.

BR,
-R
