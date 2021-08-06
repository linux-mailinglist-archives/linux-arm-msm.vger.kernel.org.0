Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6B23E2E72
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 18:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbhHFQmZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Aug 2021 12:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbhHFQmY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Aug 2021 12:42:24 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8B5C061798
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Aug 2021 09:42:08 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id y18so12887381oiv.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Aug 2021 09:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RXsFQjA5J3VoFkOU35LTnuTdg07iu7XW4ZQXApR/hBI=;
        b=eg22J4GI8h6H45jZIUwb28h5zTK5VqpyO4zHa9rvRn7Al4OWtVeOjt+WAk4mollIsk
         JtEkRV6P4YW1afIoPgp5nSdeujgOYRaRMQEuwHEbXkFqvadPGfHneFro3y9XxdDTsyvv
         AoT0VQK0I7oernqAuYiEz7M1s3PvMcHkmnt6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RXsFQjA5J3VoFkOU35LTnuTdg07iu7XW4ZQXApR/hBI=;
        b=nV3OdTg1B9kJ+Kt8VB4lCXffDSnbSAFFVdxWZ60m38gnSI/+KCEL5wwmG443eVCNqy
         t7aZ3xfSO+Tr0y21GWzotuDaWU5PYQJoHutZx3thRQ1MPI5V5QkFNM0tZx8TRZiGMkzj
         M+OWuEjNQWYCn6zgq6BBg0M1xcceHqZWflH4uOgf0X5+8k65pOSOUpM+I9q4Lsjt/WKl
         HFiQ+ATzmvwlW9EgmBCi/pqeC10aEdv/+SA0nE/f7t9psEQ5NAevW6Dx9JguU+kz3zLJ
         x8GbPkt0l5DGjcEN9UnndWFchyqq4MOgBRYZ4kD5x9VelChx6xja1psxvPeIq6okVxtX
         9uyg==
X-Gm-Message-State: AOAM5311YztG/uBU+zycoGqQ0NfEwk/HFW7dha1ROZxPstCCTYsqJLj+
        ocE7B/G/tXm2P+CeCQGz2pYtW8OVOzwhl9ugF3VbIg==
X-Google-Smtp-Source: ABdhPJyDEnqTo94smUxbl1ZLbq1PeH7GBMZ8QIymHLfF5ThQGfPluBaPB0Lq5LVJOAkACGy8drgVkqSMRcJig44B2NI=
X-Received: by 2002:a54:4015:: with SMTP id x21mr5984271oie.128.1628268127886;
 Fri, 06 Aug 2021 09:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-3-daniel.vetter@ffwll.ch> <CAF6AEGvkmZhcPWP58VnL1OXAeJ5tg7v13xkkiYBwkpBi1YiT4g@mail.gmail.com>
In-Reply-To: <CAF6AEGvkmZhcPWP58VnL1OXAeJ5tg7v13xkkiYBwkpBi1YiT4g@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 6 Aug 2021 18:41:56 +0200
Message-ID: <CAKMK7uG3gRNfYinM51UVAUckV9ZgN3mgRnJd8E9tERani9b1JQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/20] drm/msm: Fix drm/sched point of no return rules
To:     Rob Clark <robdclark@gmail.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 6, 2021 at 12:58 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, Aug 5, 2021 at 3:47 AM Daniel Vetter <daniel.vetter@ffwll.ch> wro=
te:
> >
> > Originally drm_sched_job_init was the point of no return, after which
> > drivers must submit a job. I've split that up, which allows us to fix
> > this issue pretty easily.
> >
> > Only thing we have to take care of is to not skip to error paths after
> > that. Other drivers do this the same for out-fence and similar things.
> >
> > Fixes: 1d8a5ca436ee ("drm/msm: Conversion to drm scheduler")
> > Cc: Rob Clark <robdclark@chromium.org>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: freedreno@lists.freedesktop.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++++--------
> >  1 file changed, 7 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm=
/msm_gem_submit.c
> > index 6d6c44f0e1f3..d0ed4ddc509e 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -52,9 +52,6 @@ static struct msm_gem_submit *submit_create(struct dr=
m_device *dev,
> >                 return ERR_PTR(ret);
> >         }
> >
> > -       /* FIXME: this is way too early */
> > -       drm_sched_job_arm(&job->base);
> > -
> >         xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
> >
> >         kref_init(&submit->ref);
> > @@ -883,6 +880,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, vo=
id *data,
> >
> >         submit->user_fence =3D dma_fence_get(&submit->base.s_fence->fin=
ished);
> >
> > +       /* point of no return, we _have_ to submit no matter what */
> > +       drm_sched_job_arm(&submit->base);
> > +
> >         /*
> >          * Allocate an id which can be used by WAIT_FENCE ioctl to map =
back
> >          * to the underlying fence.
> > @@ -892,17 +892,16 @@ int msm_ioctl_gem_submit(struct drm_device *dev, =
void *data,
> >         if (submit->fence_id < 0) {
> >                 ret =3D submit->fence_id =3D 0;
> >                 submit->fence_id =3D 0;
> > -               goto out;
> >         }
> >
> > -       if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
> > +       if (ret =3D=3D 0 && args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
> >                 struct sync_file *sync_file =3D sync_file_create(submit=
->user_fence);
> >                 if (!sync_file) {
> >                         ret =3D -ENOMEM;
> > -                       goto out;
> > +               } else {
> > +                       fd_install(out_fence_fd, sync_file->file);
> > +                       args->fence_fd =3D out_fence_fd;
> >                 }
> > -               fd_install(out_fence_fd, sync_file->file);
> > -               args->fence_fd =3D out_fence_fd;
>
> I wonder if instead we should (approximately) undo "drm/msm/submit:
> Simplify out-fence-fd handling" so that the point that it could fail
> is moved up ahead of the drm_sched_job_arm()?

Hm yeah. Up to you how you want to paint this shed, I think either is fine.

> Also, does the dma_fence_get() work before drm_sched_job_arm()?  From
> a quick look, it looks like it won't, but I'm still playing catchup
> and haven't had a chance to look at your entire series.  If it doesn't
> work before drm_sched_job_arm(), then there is really no way to
> prevent a error path between the fence-init and job-submit.

Yes. I thought I've checked that I put the _arm() in the right spot,
but I guess I screwed up and you need the fence before the point where
I've put the job_arm()? And yes the error path cannot be avoided for
out-fences, that's what I tried to explain in the commit message.

> But, prior to your series, wouldn't a failure after
> drm_sched_job_init() but before the job is submitted just burn a
> fence-id, and otherwise carry on it's merry way?

Maybe? I'm not sure whether the scheduler gets confused about the gap
and freak out abou that. I'm fairly new to that code and learning
(which is part why I'm working on it). Since you look up in
fences/syncobj after job_init() it should be pretty easy to whip up a
testcase and see what happens. Also as long as nothing fails you won't
see an issue, that's for sure.
-Daniel

> BR,
> -R
>
> >         }
> >
> >         submit_attach_object_fences(submit);
> > --
> > 2.32.0
> >



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
