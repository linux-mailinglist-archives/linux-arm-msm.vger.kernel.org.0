Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8FA43C75E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jul 2021 19:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbhGMRsp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jul 2021 13:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231499AbhGMRsi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jul 2021 13:48:38 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17020C0613DD
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jul 2021 10:45:48 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id w194so6169804oie.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jul 2021 10:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tmtzcyst+8OgXBI41dqYr4OHovq38Lmve+NnPNNWFaA=;
        b=E9kH+I9A0KksyrSJYGuPUtireKMQ1h2VVRvbVTFj8eIP6xeFILzX1kJzRhrGWs6vO2
         0GxXLljCV1mje7M4duMNSElcxU8qhCQCWnKE3E3TutR8TWp1lLyaL6PvyZo22zMJ0oku
         7HEYM2UyRDUBzKlVlqAyP7or8ocosvwOWsNAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tmtzcyst+8OgXBI41dqYr4OHovq38Lmve+NnPNNWFaA=;
        b=J0o18RH2+nLJ6oPGbxdzGRggHGWC/6QzHhYvJby/uC/nDQ6VVvxQF2CGKpy3fNeqna
         6pZo1tbwGAl54eTJOHi6F8QH05C/0FvjW0SENLtxebDcsLiZ0+kwfe0LuR6IijQLGe1c
         yl6IF2dXVB/JJzHD+a2jR3QNms6k/T2AKZHb3KLgc6MivpRyDsT/J54MRlsRuU3/rZ6M
         nl6AWlibe637xPDTUkYnzVUv/vvocft0PirLeT75hOHwf7TcsaRj5d3hRYfiP/gz9h+M
         0ULXVgMi7+mSsZpizQ+Tsi6CFGeIlap0jcEgRf0ZoFx5fhIj1bOt6TlPRArG7JNEiCJO
         t9TQ==
X-Gm-Message-State: AOAM5317Wtcx0QyAZbuNL4vzcegp7hoEv3s4IOwaQ8F5X9eQokfE96Ya
        RfFBRPsMYF4ZbLgUrXH9eBKrVs+0qvFrzEEpByIxZw==
X-Google-Smtp-Source: ABdhPJxzpjd8fmeN5xsqQQ8/UWTplGKa3o1OKFivFnAQ9i+M2VhbfW3DpqnVr7dh4haRV9U3tHRv1DXHvWi5XsqX2z4=
X-Received: by 2002:aca:3085:: with SMTP id w127mr398974oiw.101.1626198347467;
 Tue, 13 Jul 2021 10:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-15-daniel.vetter@ffwll.ch> <CAF6AEGtC0BxABJtSaOmhEt_WKiuptWCHP7g4D5wEaJ4NaEuz4w@mail.gmail.com>
 <CAKMK7uEL8dr5RT2362ehR1Gb7mvwLmcEsZV+uWDj_kpoovWKxg@mail.gmail.com> <CAF6AEGvsQnULTKwqWu+ToX0cVt12hs4SZrZ2Ai216m=8MBaqTQ@mail.gmail.com>
In-Reply-To: <CAF6AEGvsQnULTKwqWu+ToX0cVt12hs4SZrZ2Ai216m=8MBaqTQ@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 13 Jul 2021 19:45:36 +0200
Message-ID: <CAKMK7uF8wZuJVON0-06xDGtuSof2m6Y-cj7qkdUSTYd1PrVt9A@mail.gmail.com>
Subject: Re: [PATCH v4 14/18] drm/msm: Don't break exclusive fence ordering
To:     Rob Clark <robdclark@gmail.com>
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

On Tue, Jul 13, 2021 at 7:42 PM Rob Clark <robdclark@gmail.com> wrote:
> On Tue, Jul 13, 2021 at 9:58 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > On Tue, Jul 13, 2021 at 6:51 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Mon, Jul 12, 2021 at 1:02 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > >
> > > > There's only one exclusive slot, and we must not break the ordering.
> > > >
> > > > Adding a new exclusive fence drops all previous fences from the
> > > > dma_resv. To avoid violating the signalling order we err on the side of
> > > > over-synchronizing by waiting for the existing fences, even if
> > > > userspace asked us to ignore them.
> > > >
> > > > A better fix would be to us a dma_fence_chain or _array like e.g.
> > > > amdgpu now uses, but
> > > > - msm has a synchronous dma_fence_wait for anything from another
> > > >   context, so doesn't seem to care much,
> > > > - and it probably makes sense to lift this into dma-resv.c code as a
> > > >   proper concept, so that drivers don't have to hack up their own
> > > >   solution each on their own.
> > > >
> > > > v2: Improve commit message per Lucas' suggestion.
> > > >
> > > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: Rob Clark <robdclark@gmail.com>
> > > > Cc: Sean Paul <sean@poorly.run>
> > > > Cc: linux-arm-msm@vger.kernel.org
> > > > Cc: freedreno@lists.freedesktop.org
> > > > ---
> > > >  drivers/gpu/drm/msm/msm_gem_submit.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > index b71da71a3dd8..edd0051d849f 100644
> > > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > @@ -306,7 +306,8 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > >                                 return ret;
> > > >                 }
> > > >
> > > > -               if (no_implicit)
> > > > +               /* exclusive fences must be ordered */
> > > > +               if (no_implicit && !write)
> > > >                         continue;
> > >
> > > In practice, modern userspace (the kind that is more likely to set the
> > > no-implicit flag on every submit) also sets MSM_SUBMIT_BO_WRITE on
> > > every bo, to shave some cpu overhead so I suppose this would not
> > > really hurt anything
> > >
> > > Do you know if this is covered in any piglit/etc test?
> >
> > You need some command submission, plus buffer sharing with vgem
> > setting it's own exclusive fences, plus checking with dma_buf poll()
> > whether it signals all in the right order. That's pretty low-level, so
> > maybe something in igt, but I haven't typed that. Maybe I need to do
> > that for i915 at least.
>
> ok, you lost me at vgem ;-)
>
> (the vgem vs cache situation on arm is kinda hopeless)

Oh that explains a few things ... I just found out why vgem is failing
for wc buffers on x86 (on some of our less-coherent igpu at least),
and wondered how the heck this works on arm. Sounds like it just
doesn't :-/

On the testcase: You'd never actually check buffer contents, only
fences, so the test would still work.
-Daniel
>
> BR,
> -R
>
> > -Daniel
> >
> > > BR,
> > > -R
> > >
> > > >
> > > >                 ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> > > > --
> > > > 2.32.0
> > > >
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
