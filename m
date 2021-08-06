Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE3E53E3005
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 21:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244348AbhHFUAN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Aug 2021 16:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbhHFUAN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Aug 2021 16:00:13 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8219C0613CF;
        Fri,  6 Aug 2021 12:59:55 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id a192-20020a1c7fc90000b0290253b32e8796so7874783wmd.0;
        Fri, 06 Aug 2021 12:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Qx7lUZsE+6vDBN4KHgsQ1l6KPdWITR5BlB4Auh0nczE=;
        b=gL6jle1aRoRQDFE5LfedqjJ29uVv0ozC6jQKSzDjL/i3IrJwR2jxe6kznSeklj2JjR
         Q/gNKQK4ztfmxGULaB88a7EpABN2BCTirAfWtT4qMQXSEQGjG2DGZZarE0oRhymfa3ny
         OjjY3yeN3JRKqSEG7dYnh92a41JDT7GxrgzmgooJ6zFu/+K5kLuk/cFXUpKzVWsJsD1T
         bZAgkGNs2ymd+LHae+4JZhlY4B1COy+eUOWsZWLDQVGySqwl4E13DUGhcumbpu8pi/4G
         3uV+myzmX8bcUbFnB79qipvNYoRUc8wjzx7oUVjSBMeQ5t211GVzUwtf0J0QVG/aK/Xe
         OUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Qx7lUZsE+6vDBN4KHgsQ1l6KPdWITR5BlB4Auh0nczE=;
        b=NHTCZCy36TikHtKpx7tylibJyD0mj3kFXLF07Vaefw8jeG0R1i21/1bVQl1/Uhm2UJ
         xSXkD4psCaSb/OEcehY8f6u6mJLABw/Y4vioQGSoYnEIufjoyuXoVz2RdGpvbd700WiW
         FR793azGYCYCDHGO/3ljXk5KQgxiM8D/2Sdrk4JXi1KNEDjfAcuRDN3VN6HPdIoYxgxv
         wU0xJ9Y1SY6+ZI3gvU47ZoRLMV3Gt7hSQJCMbBZ/k16XyKrpfA6tKwjMNpAh4VA9b7gi
         6CpJ0DUC1GMOmxUQ/zd2Z2kYf6niInVCqTi2RH1vezxfVEF6boFl0e4ueJpWnDODdx9p
         mlWA==
X-Gm-Message-State: AOAM532jwNGLt4dZGM6XuX7RJZ2e9+X3NTf1f4zpYJTuX66nipvK4EXv
        5lVMtHdFeqZOvwGxOUXpTu7Oc8C9w+6KEdkxALg=
X-Google-Smtp-Source: ABdhPJwFrDOMLUGJT4LIp+lT0lAmcfWvqIG2t3NwyXZ5jNYMnFrBuTn60xClUnelfko8HR/T/Kz3zM48k9bzGorLQjE=
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr21853326wma.164.1628279993856;
 Fri, 06 Aug 2021 12:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-3-daniel.vetter@ffwll.ch> <CAF6AEGvkmZhcPWP58VnL1OXAeJ5tg7v13xkkiYBwkpBi1YiT4g@mail.gmail.com>
 <CAKMK7uG3gRNfYinM51UVAUckV9ZgN3mgRnJd8E9tERani9b1JQ@mail.gmail.com>
 <CAF6AEGuqxb5jEtpQi-aNvjSfPaq0gasH2TLZ+5O836ov9qw+3w@mail.gmail.com>
 <CAKMK7uH2v2x+=Ct-v-2RCVXez4MzjMvhh4yCs_f8HPvYa+DXcA@mail.gmail.com>
 <CAF6AEGuX6UgXpCJqvo4kT3j5zYeuRBYTtMWM8yz0x_tOb1rm4w@mail.gmail.com> <CAKMK7uF-CswLD8E8=gwLAKhKCFcD2KMwdzjjod+JmGGk2TiZUw@mail.gmail.com>
In-Reply-To: <CAKMK7uF-CswLD8E8=gwLAKhKCFcD2KMwdzjjod+JmGGk2TiZUw@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 6 Aug 2021 12:59:42 -0700
Message-ID: <CAF6AEGsiw46-CnSa4_Jfa9_hg1yTi8CS2xAw9XkY2PhXA3K2bQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/20] drm/msm: Fix drm/sched point of no return rules
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
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

On Fri, Aug 6, 2021 at 12:11 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> On Fri, Aug 6, 2021 at 8:57 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Fri, Aug 6, 2021 at 11:41 AM Daniel Vetter <daniel.vetter@ffwll.ch> =
wrote:
> > >
> > > On Fri, Aug 6, 2021 at 7:15 PM Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > On Fri, Aug 6, 2021 at 9:42 AM Daniel Vetter <daniel.vetter@ffwll.c=
h> wrote:
> > > > >
> > > > > On Fri, Aug 6, 2021 at 12:58 AM Rob Clark <robdclark@gmail.com> w=
rote:
> > > > > >
> > > > > > On Thu, Aug 5, 2021 at 3:47 AM Daniel Vetter <daniel.vetter@ffw=
ll.ch> wrote:
> > > > > > >
> > > > > > > Originally drm_sched_job_init was the point of no return, aft=
er which
> > > > > > > drivers must submit a job. I've split that up, which allows u=
s to fix
> > > > > > > this issue pretty easily.
> > > > > > >
> > > > > > > Only thing we have to take care of is to not skip to error pa=
ths after
> > > > > > > that. Other drivers do this the same for out-fence and simila=
r things.
> > > > > > >
> > > > > > > Fixes: 1d8a5ca436ee ("drm/msm: Conversion to drm scheduler")
> > > > > > > Cc: Rob Clark <robdclark@chromium.org>
> > > > > > > Cc: Rob Clark <robdclark@gmail.com>
> > > > > > > Cc: Sean Paul <sean@poorly.run>
> > > > > > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > > > > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > > > > > > Cc: linux-arm-msm@vger.kernel.org
> > > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > > Cc: freedreno@lists.freedesktop.org
> > > > > > > Cc: linux-media@vger.kernel.org
> > > > > > > Cc: linaro-mm-sig@lists.linaro.org
> > > > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++++--------
> > > > > > >  1 file changed, 7 insertions(+), 8 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/g=
pu/drm/msm/msm_gem_submit.c
> > > > > > > index 6d6c44f0e1f3..d0ed4ddc509e 100644
> > > > > > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > > > @@ -52,9 +52,6 @@ static struct msm_gem_submit *submit_create=
(struct drm_device *dev,
> > > > > > >                 return ERR_PTR(ret);
> > > > > > >         }
> > > > > > >
> > > > > > > -       /* FIXME: this is way too early */
> > > > > > > -       drm_sched_job_arm(&job->base);
> > > > > > > -
> > > > > > >         xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
> > > > > > >
> > > > > > >         kref_init(&submit->ref);
> > > > > > > @@ -883,6 +880,9 @@ int msm_ioctl_gem_submit(struct drm_devic=
e *dev, void *data,
> > > > > > >
> > > > > > >         submit->user_fence =3D dma_fence_get(&submit->base.s_=
fence->finished);
> > > > > > >
> > > > > > > +       /* point of no return, we _have_ to submit no matter =
what */
> > > > > > > +       drm_sched_job_arm(&submit->base);
> > > > > > > +
> > > > > > >         /*
> > > > > > >          * Allocate an id which can be used by WAIT_FENCE ioc=
tl to map back
> > > > > > >          * to the underlying fence.
> > > > > > > @@ -892,17 +892,16 @@ int msm_ioctl_gem_submit(struct drm_dev=
ice *dev, void *data,
> > > > > > >         if (submit->fence_id < 0) {
> > > > > > >                 ret =3D submit->fence_id =3D 0;
> > > > > > >                 submit->fence_id =3D 0;
> > > > > > > -               goto out;
> > > > > > >         }
> > > > > > >
> > > > > > > -       if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
> > > > > > > +       if (ret =3D=3D 0 && args->flags & MSM_SUBMIT_FENCE_FD=
_OUT) {
> > > > > > >                 struct sync_file *sync_file =3D sync_file_cre=
ate(submit->user_fence);
> > > > > > >                 if (!sync_file) {
> > > > > > >                         ret =3D -ENOMEM;
> > > > > > > -                       goto out;
> > > > > > > +               } else {
> > > > > > > +                       fd_install(out_fence_fd, sync_file->f=
ile);
> > > > > > > +                       args->fence_fd =3D out_fence_fd;
> > > > > > >                 }
> > > > > > > -               fd_install(out_fence_fd, sync_file->file);
> > > > > > > -               args->fence_fd =3D out_fence_fd;
> > > > > >
> > > > > > I wonder if instead we should (approximately) undo "drm/msm/sub=
mit:
> > > > > > Simplify out-fence-fd handling" so that the point that it could=
 fail
> > > > > > is moved up ahead of the drm_sched_job_arm()?
> > > > >
> > > > > Hm yeah. Up to you how you want to paint this shed, I think eithe=
r is fine.
> > > > >
> > > > > > Also, does the dma_fence_get() work before drm_sched_job_arm()?=
  From
> > > > > > a quick look, it looks like it won't, but I'm still playing cat=
chup
> > > > > > and haven't had a chance to look at your entire series.  If it =
doesn't
> > > > > > work before drm_sched_job_arm(), then there is really no way to
> > > > > > prevent a error path between the fence-init and job-submit.
> > > > >
> > > > > Yes. I thought I've checked that I put the _arm() in the right sp=
ot,
> > > > > but I guess I screwed up and you need the fence before the point =
where
> > > > > I've put the job_arm()? And yes the error path cannot be avoided =
for
> > > > > out-fences, that's what I tried to explain in the commit message.
> > > > >
> > > > > > But, prior to your series, wouldn't a failure after
> > > > > > drm_sched_job_init() but before the job is submitted just burn =
a
> > > > > > fence-id, and otherwise carry on it's merry way?
> > > > >
> > > > > Maybe? I'm not sure whether the scheduler gets confused about the=
 gap
> > > > > and freak out abou that. I'm fairly new to that code and learning
> > > > > (which is part why I'm working on it). Since you look up in
> > > > > fences/syncobj after job_init() it should be pretty easy to whip =
up a
> > > > > testcase and see what happens. Also as long as nothing fails you =
won't
> > > > > see an issue, that's for sure.
> > > >
> > > > fair.. I'll try to come up with a test case.. pre-scheduler-convers=
ion
> > > > it wasn't a problem to fail after the fence seqno was allocated (we=
ll,
> > > > I guess you might have problems if you had 2^31 failures in a row)
> > >
> > > Yeah one thing drm/sched forces you to do is have a very clear notion
> > > about the point of no return in your submit ioctl. Which I think is a
> > > Very Good Thing, at least looking at i915 execbuf where the point of
> > > no return is a multi-stage thing with such interesting intermediate
> > > points like "we submit the ruquest but without actually running the
> > > batchbuffer". The downside is that the submit ioctl isn't perfectly
> > > transaction anymore, but I don't think that matters for tha tail
> > > stuff, which is generally just some out-fence installing. That
> > > generally never fails.
> >
> > So I hacked up:
> >
> > ------
> > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c
> > b/drivers/gpu/drm/scheduler/sched_fence.c
> > index 3aa6351d2101..88e66dbc9515 100644
> > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > @@ -176,6 +176,7 @@ struct drm_sched_fence
> > *drm_sched_fence_create(struct drm_sched_entity *entity,
> >         fence->sched =3D entity->rq->sched;
> >         spin_lock_init(&fence->lock);
> >
> > +       seq =3D atomic_inc_return(&entity->fence_seq);
> >         seq =3D atomic_inc_return(&entity->fence_seq);
> >         dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_schedule=
d,
> >                        &fence->lock, entity->fence_context, seq);
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index fcc601962e92..583e85adbbe0 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -593,6 +593,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
> >         if (!job->s_fence)
> >                 return -ENOMEM;
> >         job->id =3D atomic64_inc_return(&sched->job_id_count);
> > +       job->id =3D atomic64_inc_return(&sched->job_id_count);
> >
> >         INIT_LIST_HEAD(&job->list);
> >
> > ------
> >
> > (I guess the job->id part shouldn't really be needed, that looks like
> > it is only used by amdgpu)
> >
> > This didn't cause any problems that I could see.  So I don't *think* a
> > failure after drm_sched_job_init() is really problematic, as long as
> > things are serialized between drm_sched_job_init() and
> > drm_sched_entity_push_job().
> >
> > I also noticed that in the atomic commit path, the out-fences are
> > initialized before atomic-check.. so there should be plenty of
> > precedent for skipping fence seqno's.
>
> Oh I think I remember now. The reason why the split into init/arm is
> so that you can keep your critical section only around job_arm() and
> push_job(). My very first version just pulled the jobs_init() of that
> for most drivers to where I needed it, and that would result in a bit
> chaos because the fences would signal out of order potentially. But
> yeah I guess bailing out is fine with the scheduler.

ahh, that makes more sense

> Do you want me to tune down the commit message a bit, it's not a must
> to submit the job, but just makes a bit more sense than bailing out
> with a fence seqno reserved?

yeah, and I guess drop the fixme comment in the drm/msm patch..

I wonder if it would make sense to split drm_fence_init().. most of
the things we need the out-fence for prior to
drm_sched_entity_push_job() is, I think, just to have a dma_fence
reference.. which doesn't require having a seqno assigned yet.  Which
would let us move the critical section into
drm_sched_entity_push_job() itself.  (OTOH I suppose that opens up an
exciting new class of bugs, to have fences floating around without an
initialized seqno.)

BR,
-R


> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
