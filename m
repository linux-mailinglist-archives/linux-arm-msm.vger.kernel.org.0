Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 153B63C75D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jul 2021 19:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbhGMRpd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jul 2021 13:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbhGMRpc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jul 2021 13:45:32 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76CF9C0613DD
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jul 2021 10:42:42 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id l4-20020a05600c4f04b0290220f8455631so2919015wmq.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jul 2021 10:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BCKTJU2XxIO77fuxxzexkfqoVytjtNEnzHrzE4LOcyU=;
        b=EToeT1inOWCt4oadMwT0v3PUy6du+3gSJVj+TudD76Ny/PVxYy0EbsJx93dlKTqyQI
         pOcBVx56jFbFZZb+yPhKxYY1comJaWESJJgdsvU2fVilj7qc8D4ECl59fIxzS3Z/80My
         eX44oUGaSwbfKF9LLVqHMtkV8DQNViQ9E79l4iOIcDDQaf+EWD7mgyY6wdMsAZcizY9a
         2Bz5waZFphg4c06u4r5xdMCskFuYo6lO8E3IjOZEO9TBCPoHCzPIs6/GyTUs8jEVEklP
         tBLHvoTdsBtxMx+pH3Xb2aUvv3j4BLGnAc3p0Lzt4QFz9jqCDpNYlGo6vuAzrsOkjmTs
         ThiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BCKTJU2XxIO77fuxxzexkfqoVytjtNEnzHrzE4LOcyU=;
        b=HVGj9ZF6EfIKAnIoP7D65IKkjX/4RgCBn1EaU327e6z6q3GRuzn2dMPo++e1ZjTx2s
         /26TtY86s5aNT6KXCWaIUG9r9r6UKTZ+AdahmRORd2HkFr+jFmFyQibr2iiYpifsrNKm
         gwI/qPrcjNaOfcvmH8ISvhtJdYAqqfrGsCBq5jDfBUilIFXWocKDAbY6AR9eaTU7qJ0A
         cdMHyQqI7dKcDG4Mlby1cl5W6UH35YGbS5Q2Qx9cLJtmM0Qb/wIg3jcIUhbmFCDpQTo0
         3b3fvdOX5OTBXiB7UxMpvkVOEq86In2rmVZusydU+oo5ctOOropfNZGjKl8+UKMfQGiA
         abQg==
X-Gm-Message-State: AOAM533PmpPEJZIupyS6niBEqlkXweY7a299KfEJcJqg51UTWt/bxtPL
        KVrDmZue8uuEU5xEwX95rrzfGzDWE2uVQqWfsps=
X-Google-Smtp-Source: ABdhPJxxQFSd3trk1Yz/bp+qnTaH981CyIiqxvsV1KScxRC5xJlYqtoR6lDSCKcCtzuwv3cwAQFgJfx8N9bKEDR7CH4=
X-Received: by 2002:a1c:25c6:: with SMTP id l189mr574530wml.49.1626198161022;
 Tue, 13 Jul 2021 10:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-15-daniel.vetter@ffwll.ch> <CAF6AEGtC0BxABJtSaOmhEt_WKiuptWCHP7g4D5wEaJ4NaEuz4w@mail.gmail.com>
 <CAKMK7uEL8dr5RT2362ehR1Gb7mvwLmcEsZV+uWDj_kpoovWKxg@mail.gmail.com>
In-Reply-To: <CAKMK7uEL8dr5RT2362ehR1Gb7mvwLmcEsZV+uWDj_kpoovWKxg@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 13 Jul 2021 10:46:47 -0700
Message-ID: <CAF6AEGvsQnULTKwqWu+ToX0cVt12hs4SZrZ2Ai216m=8MBaqTQ@mail.gmail.com>
Subject: Re: [PATCH v4 14/18] drm/msm: Don't break exclusive fence ordering
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sean Paul <sean@poorly.run>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 13, 2021 at 9:58 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Tue, Jul 13, 2021 at 6:51 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Mon, Jul 12, 2021 at 1:02 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > There's only one exclusive slot, and we must not break the ordering.
> > >
> > > Adding a new exclusive fence drops all previous fences from the
> > > dma_resv. To avoid violating the signalling order we err on the side of
> > > over-synchronizing by waiting for the existing fences, even if
> > > userspace asked us to ignore them.
> > >
> > > A better fix would be to us a dma_fence_chain or _array like e.g.
> > > amdgpu now uses, but
> > > - msm has a synchronous dma_fence_wait for anything from another
> > >   context, so doesn't seem to care much,
> > > - and it probably makes sense to lift this into dma-resv.c code as a
> > >   proper concept, so that drivers don't have to hack up their own
> > >   solution each on their own.
> > >
> > > v2: Improve commit message per Lucas' suggestion.
> > >
> > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Cc: Sean Paul <sean@poorly.run>
> > > Cc: linux-arm-msm@vger.kernel.org
> > > Cc: freedreno@lists.freedesktop.org
> > > ---
> > >  drivers/gpu/drm/msm/msm_gem_submit.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > index b71da71a3dd8..edd0051d849f 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > @@ -306,7 +306,8 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > >                                 return ret;
> > >                 }
> > >
> > > -               if (no_implicit)
> > > +               /* exclusive fences must be ordered */
> > > +               if (no_implicit && !write)
> > >                         continue;
> >
> > In practice, modern userspace (the kind that is more likely to set the
> > no-implicit flag on every submit) also sets MSM_SUBMIT_BO_WRITE on
> > every bo, to shave some cpu overhead so I suppose this would not
> > really hurt anything
> >
> > Do you know if this is covered in any piglit/etc test?
>
> You need some command submission, plus buffer sharing with vgem
> setting it's own exclusive fences, plus checking with dma_buf poll()
> whether it signals all in the right order. That's pretty low-level, so
> maybe something in igt, but I haven't typed that. Maybe I need to do
> that for i915 at least.

ok, you lost me at vgem ;-)

(the vgem vs cache situation on arm is kinda hopeless)

BR,
-R

> -Daniel
>
> > BR,
> > -R
> >
> > >
> > >                 ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> > > --
> > > 2.32.0
> > >
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
