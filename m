Return-Path: <linux-arm-msm+bounces-58093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13077AB8C40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 18:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4CA79E66E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 16:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B18721C163;
	Thu, 15 May 2025 16:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8sF6GeV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4181121B9F2;
	Thu, 15 May 2025 16:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326152; cv=none; b=IulH+VsX0JbjGhzpezMql/GXmezXapS5oDrUBvwDNp4iEyLOZ7EsVDsnSHTuOGDY/Hx/q8dSaNQm7TJFGZoSGTWDvMRvw3GNMuByo/ecWOtQUyvZG9rQRDC+SDgV7okEa5hWjTElAGwwPuegw/YcnOuJe14T66ezNzCsn0Ym1Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326152; c=relaxed/simple;
	bh=Totwr5AE1JLC6FBOCEiRvnKMdfKTW0tWP2tyi0V1xqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hqS10Ndx2lDfgoQHDUhetv9DXGodBinrgldSppsR0rMr++5OpI0iO21ZhaQkEdVwqA+K/RUAUJLjbO8pBrGixoQemdRlvIubDdJzBZKMP5urJK2e8zs92tXnKcHyYXdOUMA610Htq9dVL/T6CpjhFHCYEBOQxjjQbyVNmh9Y5UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8sF6GeV; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-737685eda9aso200097b3a.3;
        Thu, 15 May 2025 09:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747326149; x=1747930949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dnuHITISbZCryzcYYfJ1faiJN4OA5KhLLbpmpip+YE=;
        b=C8sF6GeVpO4hongVifMpKd+eoJBTzPRDlUO98HJVmx65ip/I64+R7VEbMVmNEp0XeF
         JeARpzmAwg7598xOjXXrQrVQhpYkNFRY27IztqMe1/Nyrd8BgYxBHOiSl3YyN+KXHuvp
         iQn+4JDfK7aXw9G9DR/kF3uc9PnDxGNzDahnU3A3DJFT+QA3qwTAHRUb/TNrBOUhhUku
         3Ah4t6Jc+ttGKrV2bfdfOu3ZchLUzBC3cYqyr20XsdjEQ4mD5/gmQLOAxzJ06KiOtZor
         nAxLNbqbBmQ8zmtb32e4/sMDfJY5CA60kfGnBd0KqioclA1Y9zAQJsjiTqOmz61M2vt0
         xb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747326149; x=1747930949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dnuHITISbZCryzcYYfJ1faiJN4OA5KhLLbpmpip+YE=;
        b=JugJURe4LQqksfjWi4BLjEOgZNW6exVEZt11jRIliR2sFl9aDPC4sdHUOOxhm5p6UW
         apxPHOfUpUmvd24pPgenPqtbN5K/4PYFUl1xSt+J/Jj+xiqHjl15BdyGbmEm1pw0DuX6
         IIQZPb0lsuAiKe6kesE5P3qAm/Wz2K9VgCFmX8zfNCfGEcrTyVSXcaidjpRI0qOLLWc8
         isXj2ldK53fkSPFjZwozSnAWsfEphxI8oMS/pvfMsQ1FAShOWq9DdTWRVLU5r+CHHtq2
         f5oxb6GtVEow2tY3k9/yvtybqYTA+T5sZ5fnWTwm2s2v3TeswCs5WYgBhOwsqrmss/WL
         GeQg==
X-Forwarded-Encrypted: i=1; AJvYcCVgYPvZGy8oXlaCCPdlJT26ihfPrIHzrKZsBRM5lsVeflzJ9/06Z1wJ5SJg21XKbHBd7t6GgIQpCEqv1PmA@vger.kernel.org, AJvYcCXFZ+iWLHtcChT5oUQ9Z7vl8jks/OLY8n2xYB2HnC0eY5KxeInnKOgzyLGoJR7Ynll/svDpTFG31Qa+7mgg@vger.kernel.org
X-Gm-Message-State: AOJu0YyKg7SFiSpcXgaSSwTT70SJdcZKCXB+jKxmDiH4F/idgcjisCaU
	4+1LKk1PIli7QiS+QFKY9TSh/1p1IjOajOb/N8HAkZszfkWL7SSTu0Ig47xJgoXb+WDPqy6WLuV
	BlVYMt2hgxBrMCYM5xYa6uTb3W3c=
X-Gm-Gg: ASbGncv19Dzz0ZSIcnMxPpqjby9VfVu61BdZYLLy0unZPK6Y77duc8mRzOXVcUCtNA/
	Ge7pHVl4jN2s6IHBFuQRRsg08Cf2zeWDZFlwiMtgaFNgEOgWDEhvua67qT7LVLkhmwu76TPLGk7
	SlhRicu+79gc/fDH/hoH63nvlaBAbVDV/d
X-Google-Smtp-Source: AGHT+IGDrppLeiEOAmcXZ4RatqM9xE1mB3QXgajVWSiOeBux307sSrkk+V8xrvG9oFf3pRfDxCa5jV0aozgF5xujnSA=
X-Received: by 2002:a05:6a00:440f:b0:73e:2b50:426 with SMTP id
 d2e1a72fcca58-74289346a54mr3873105b3a.4.1747326149270; Thu, 15 May 2025
 09:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514170118.40555-1-robdclark@gmail.com> <20250514170118.40555-5-robdclark@gmail.com>
 <51f87f358fa1b7ef8db8b67ee6cde38ae071fbe8.camel@mailbox.org> <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
In-Reply-To: <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 15 May 2025 12:22:18 -0400
X-Gm-Features: AX0GCFt7Y11kBzniJeDYgnDSbJ3ImpGv0Tt7fACDmfGKpd_7Dr5U0_pV53pUE-A
Message-ID: <CACu1E7EL+E-M0N-EAN9Bx7u9O6_pECQQdPE2ph575idhVb2Szg@mail.gmail.com>
Subject: Re: [PATCH v4 04/40] drm/sched: Add enqueue credit limit
To: Rob Clark <robdclark@chromium.org>
Cc: phasta@kernel.org, Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 12:15=E2=80=AFPM Rob Clark <robdclark@chromium.org>=
 wrote:
>
> On Thu, May 15, 2025 at 2:28=E2=80=AFAM Philipp Stanner <phasta@mailbox.o=
rg> wrote:
> >
> > Hello,
> >
> > On Wed, 2025-05-14 at 09:59 -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Similar to the existing credit limit mechanism, but applying to jobs
> > > enqueued to the scheduler but not yet run.
> > >
> > > The use case is to put an upper bound on preallocated, and
> > > potentially
> > > unneeded, pgtable pages.  When this limit is exceeded, pushing new
> > > jobs
> > > will block until the count drops below the limit.
> >
> > the commit message doesn't make clear why that's needed within the
> > scheduler.
> >
> > From what I understand from the cover letter, this is a (rare?) Vulkan
> > feature. And as important as Vulkan is, it's the drivers that implement
> > support for it. I don't see why the scheduler is a blocker.
>
> Maybe not rare, or at least it comes up with a group of deqp-vk tests ;-)
>
> Basically it is a way to throttle userspace to prevent it from OoM'ing
> itself.  (I suppose userspace could throttle itself, but it doesn't
> really know how much pre-allocation will need to be done for pgtable
> updates.)

For some context, other drivers have the concept of a "synchronous"
VM_BIND ioctl which completes immediately, and drivers implement it by
waiting for the whole thing to finish before returning. But this
doesn't work for native context, where everything has to be
asynchronous, so we're trying a new approach where we instead submit
an asynchronous bind for "normal" (non-sparse/driver internal)
allocations and only attach its out-fence to the in-fence of
subsequent submits to other queues. Once you do this then you need a
limit like this to prevent memory usage from pending page table
updates from getting out of control. Other drivers haven't needed this
yet, but they will when they get native context support.

Connor

>
> > All the knowledge about when to stop pushing into the entity is in the
> > driver, and the scheduler obtains all the knowledge about that from the
> > driver anyways.
> >
> > So you could do
> >
> > if (my_vulkan_condition())
> >    drm_sched_entity_push_job();
> >
> > couldn't you?
>
> It would need to reach in and use the sched's job_scheduled
> wait_queue_head_t...  if that isn't too ugly, maybe the rest could be
> implemented on top of sched.  But it seemed like a reasonable thing
> for the scheduler to support directly.
>
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/scheduler/sched_entity.c | 16 ++++++++++++++--
> > >  drivers/gpu/drm/scheduler/sched_main.c   |  3 +++
> > >  include/drm/gpu_scheduler.h              | 13 ++++++++++++-
> > >  3 files changed, 29 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > > b/drivers/gpu/drm/scheduler/sched_entity.c
> > > index dc0e60d2c14b..c5f688362a34 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > @@ -580,11 +580,21 @@ void drm_sched_entity_select_rq(struct
> > > drm_sched_entity *entity)
> > >   * under common lock for the struct drm_sched_entity that was set up
> > > for
> > >   * @sched_job in drm_sched_job_init().
> > >   */
> > > -void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> > > +int drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> >
> > Return code would need to be documented in the docstring, too. If we'd
> > go for that solution.
> >
> > >  {
> > >       struct drm_sched_entity *entity =3D sched_job->entity;
> > > +     struct drm_gpu_scheduler *sched =3D sched_job->sched;
> > >       bool first;
> > >       ktime_t submit_ts;
> > > +     int ret;
> > > +
> > > +     ret =3D wait_event_interruptible(
> > > +                     sched->job_scheduled,
> > > +                     atomic_read(&sched->enqueue_credit_count) <=3D
> > > +                     sched->enqueue_credit_limit);
> >
> > This very significantly changes the function's semantics. This function
> > is used in a great many drivers, and here it would be transformed into
> > a function that can block.
> >
> > From what I see below those credits are to be optional. But even if, it
> > needs to be clearly documented when a function can block.
>
> Sure.  The behavior changes only for drivers that use the
> enqueue_credit_limit, so other drivers should be unaffected.
>
> I can improve the docs.
>
> (Maybe push_credit or something else would be a better name than
> enqueue_credit?)
>
> >
> > > +     if (ret)
> > > +             return ret;
> > > +     atomic_add(sched_job->enqueue_credits, &sched-
> > > >enqueue_credit_count);
> > >
> > >       trace_drm_sched_job(sched_job, entity);
> > >       atomic_inc(entity->rq->sched->score);
> > > @@ -609,7 +619,7 @@ void drm_sched_entity_push_job(struct
> > > drm_sched_job *sched_job)
> > >                       spin_unlock(&entity->lock);
> > >
> > >                       DRM_ERROR("Trying to push to a killed
> > > entity\n");
> > > -                     return;
> > > +                     return -EINVAL;
> > >               }
> > >
> > >               rq =3D entity->rq;
> > > @@ -626,5 +636,7 @@ void drm_sched_entity_push_job(struct
> > > drm_sched_job *sched_job)
> > >
> > >               drm_sched_wakeup(sched);
> > >       }
> > > +
> > > +     return 0;
> > >  }
> > >  EXPORT_SYMBOL(drm_sched_entity_push_job);
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 9412bffa8c74..1102cca69cb4 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -1217,6 +1217,7 @@ static void drm_sched_run_job_work(struct
> > > work_struct *w)
> > >
> > >       trace_drm_run_job(sched_job, entity);
> > >       fence =3D sched->ops->run_job(sched_job);
> > > +     atomic_sub(sched_job->enqueue_credits, &sched-
> > > >enqueue_credit_count);
> > >       complete_all(&entity->entity_idle);
> > >       drm_sched_fence_scheduled(s_fence, fence);
> > >
> > > @@ -1253,6 +1254,7 @@ int drm_sched_init(struct drm_gpu_scheduler
> > > *sched, const struct drm_sched_init_
> > >
> > >       sched->ops =3D args->ops;
> > >       sched->credit_limit =3D args->credit_limit;
> > > +     sched->enqueue_credit_limit =3D args->enqueue_credit_limit;
> > >       sched->name =3D args->name;
> > >       sched->timeout =3D args->timeout;
> > >       sched->hang_limit =3D args->hang_limit;
> > > @@ -1308,6 +1310,7 @@ int drm_sched_init(struct drm_gpu_scheduler
> > > *sched, const struct drm_sched_init_
> > >       INIT_LIST_HEAD(&sched->pending_list);
> > >       spin_lock_init(&sched->job_list_lock);
> > >       atomic_set(&sched->credit_count, 0);
> > > +     atomic_set(&sched->enqueue_credit_count, 0);
> > >       INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > >       INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> > >       INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
> > > diff --git a/include/drm/gpu_scheduler.h
> > > b/include/drm/gpu_scheduler.h
> > > index da64232c989d..d830ffe083f1 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -329,6 +329,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct
> > > dma_fence *f);
> > >   * @s_fence: contains the fences for the scheduling of job.
> > >   * @finish_cb: the callback for the finished fence.
> > >   * @credits: the number of credits this job contributes to the
> > > scheduler
> > > + * @enqueue_credits: the number of enqueue credits this job
> > > contributes
> > >   * @work: Helper to reschedule job kill to different context.
> > >   * @id: a unique id assigned to each job scheduled on the scheduler.
> > >   * @karma: increment on every hang caused by this job. If this
> > > exceeds the hang
> > > @@ -366,6 +367,7 @@ struct drm_sched_job {
> > >
> > >       enum drm_sched_priority         s_priority;
> > >       u32                             credits;
> > > +     u32                             enqueue_credits;
> >
> > What's the policy of setting this?
> >
> > drm_sched_job_init() and drm_sched_job_arm() are responsible for
> > initializing jobs.
>
> It should be set before drm_sched_entity_push_job().  I wouldn't
> really expect drivers to know the value at drm_sched_job_init() time.
> But they would by the time drm_sched_entity_push_job() is called.
>
> > >       /** @last_dependency: tracks @dependencies as they signal */
> > >       unsigned int                    last_dependency;
> > >       atomic_t                        karma;
> > > @@ -485,6 +487,10 @@ struct drm_sched_backend_ops {
> > >   * @ops: backend operations provided by the driver.
> > >   * @credit_limit: the credit limit of this scheduler
> > >   * @credit_count: the current credit count of this scheduler
> > > + * @enqueue_credit_limit: the credit limit of jobs pushed to
> > > scheduler and not
> > > + *                        yet run
> > > + * @enqueue_credit_count: the current crdit count of jobs pushed to
> > > scheduler
> > > + *                        but not yet run
> > >   * @timeout: the time after which a job is removed from the
> > > scheduler.
> > >   * @name: name of the ring for which this scheduler is being used.
> > >   * @num_rqs: Number of run-queues. This is at most
> > > DRM_SCHED_PRIORITY_COUNT,
> > > @@ -518,6 +524,8 @@ struct drm_gpu_scheduler {
> > >       const struct drm_sched_backend_ops      *ops;
> > >       u32                             credit_limit;
> > >       atomic_t                        credit_count;
> > > +     u32                             enqueue_credit_limit;
> > > +     atomic_t                        enqueue_credit_count;
> > >       long                            timeout;
> > >       const char                      *name;
> > >       u32                             num_rqs;
> > > @@ -550,6 +558,8 @@ struct drm_gpu_scheduler {
> > >   * @num_rqs: Number of run-queues. This may be at most
> > > DRM_SCHED_PRIORITY_COUNT,
> > >   *        as there's usually one run-queue per priority, but may
> > > be less.
> > >   * @credit_limit: the number of credits this scheduler can hold from
> > > all jobs
> > > + * @enqueue_credit_limit: the number of credits that can be enqueued
> > > before
> > > + *                        drm_sched_entity_push_job() blocks
> >
> > Is it optional or not? Can it be deactivated?
> >
> > It seems to me that it is optional, and so far only used in msm. If
> > there are no other parties in need for that mechanism, the right place
> > to have this feature probably is msm, which has all the knowledge about
> > when to block already.
> >
>
> As with the existing credit_limit, it is optional.  Although I think
> it would be also useful for other drivers that use drm sched for
> VM_BIND queues, for the same reason.
>
> BR,
> -R
>
> >
> > Regards
> > P.
> >
> >
> > >   * @hang_limit: number of times to allow a job to hang before
> > > dropping it.
> > >   *           This mechanism is DEPRECATED. Set it to 0.
> > >   * @timeout: timeout value in jiffies for submitted jobs.
> > > @@ -564,6 +574,7 @@ struct drm_sched_init_args {
> > >       struct workqueue_struct *timeout_wq;
> > >       u32 num_rqs;
> > >       u32 credit_limit;
> > > +     u32 enqueue_credit_limit;
> > >       unsigned int hang_limit;
> > >       long timeout;
> > >       atomic_t *score;
> > > @@ -600,7 +611,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
> > >                      struct drm_sched_entity *entity,
> > >                      u32 credits, void *owner);
> > >  void drm_sched_job_arm(struct drm_sched_job *job);
> > > -void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
> > > +int drm_sched_entity_push_job(struct drm_sched_job *sched_job);
> > >  int drm_sched_job_add_dependency(struct drm_sched_job *job,
> > >                                struct dma_fence *fence);
> > >  int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,
> >

