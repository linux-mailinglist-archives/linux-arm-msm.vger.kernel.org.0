Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE32283C66
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 18:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728548AbgJEQYr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 12:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728532AbgJEQYr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 12:24:47 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3225CC0613CE;
        Mon,  5 Oct 2020 09:24:47 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k18so112672wmj.5;
        Mon, 05 Oct 2020 09:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d3LEkhDU/AA7cKTByH3jwjB8lRoYVe85vRMCYUQuKdc=;
        b=QDGSDu4Ud31DARFO1dQKQMWXJnPteQd9E/xuAhEadtVSggMAstcby7BQNO50LkRh5f
         Z2I7ZGCnqjXyBVmBL7eVlYfISlITAV8440LdqLxkP4XmlXjFq3eGFsUjsNLNnpZpIlOW
         EJYmHZTPkFTfePiuACLloBF3+cvPPqHTywpJFaeuj8biPiY//EmrW2mjuDo/Yhrf404w
         6OZrPvRrxgmoE0Nrdp7qEy5oINETZWIJ8NUeKs7O3IxqrycOCb4WuDhJFbhF9VNg11j+
         Reoj2894WwlMk6olxRMlWC1fLwfWif4xJ0NleqMAEi8mnGMMhCyFQqe/7OnK1JGiCrN3
         OyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d3LEkhDU/AA7cKTByH3jwjB8lRoYVe85vRMCYUQuKdc=;
        b=FGfrjA3UlqE8NVEbpO28bTohMoMTHCX2JMZvqnm2A6GXAWiS14EZWLcdIXWig2GMF4
         8BI6y7zMCznK6AVRvbJUVWFd9n3K7e7N/IGTaBaaD/DNH9GDdjQposzwworJtAnS1kzP
         unn60LkNL8gDvT0DyOr+8b9x+CLYQbTMoDiBePMAZGDi9Y2l9SnneRym4RH1GhFXo9WS
         fkRoy+Kr7A4231doNKjeksVPBlSnmIGK+io2UHgSz5t6+rkMzkZcDUIxNPJmSy+FuQVv
         JXnPPM8HOLnFlDVsq/MmW4ikpM1hMGvLsH1s7Z4QArqZ93cEP8J4Pg5MjySAqRtiEp4z
         ap9Q==
X-Gm-Message-State: AOAM533xvE2XO4K0mqbP+HHwfjNIyu23BMVK3BiQ6aClfA65+n8HCWFR
        p9YmkbxzxNgkK7N0/Vl5Cn7QHjqsd7oTDYYOwoFcMSR6NJZ+0g==
X-Google-Smtp-Source: ABdhPJzcFl9WBj+9j4/lo/FIpmhOymkhqiKIf/Bxco7QOQaiUanS83HNyElpQDXuT7nE1orpv8o8UcbDwXVnWvJISNE=
X-Received: by 2002:a1c:6488:: with SMTP id y130mr197295wmb.94.1601915084738;
 Mon, 05 Oct 2020 09:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201004192152.3298573-1-robdclark@gmail.com> <20201004192152.3298573-8-robdclark@gmail.com>
 <20201005135602.GR438822@phenom.ffwll.local>
In-Reply-To: <20201005135602.GR438822@phenom.ffwll.local>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 5 Oct 2020 09:24:33 -0700
Message-ID: <CAF6AEGvp6wvGu-gdCGgAR7MbrZPw9uqHmweA4YE-eZUWbvFu=A@mail.gmail.com>
Subject: Re: [PATCH 07/14] drm/msm: Refcount submits
To:     Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 5, 2020 at 6:56 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sun, Oct 04, 2020 at 12:21:39PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Before we remove dev->struct_mutex from the retire path, we have to deal
> > with the situation of a submit retiring before the submit ioctl returns.
> >
> > To deal with this, ring->submits will hold a reference to the submit,
> > which is dropped when the submit is retired.  And the submit ioctl path
> > holds it's own ref, which it drops when it is done with the submit.
> >
> > Also, add to submit list *after* getting/pinning bo's, to prevent badness
> > in case the completed fence is corrupted, and retire_worker mistakenly
> > believes the submit is done too early.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Why not embed the dma_fence instead of pointer and use that refcount? i915
> does that, and imo kinda makes sense instead of more refcounted things.
> But might not make sense for msm.

I guess that might work.. the one thing I'd be concerned about is that
the submit (indirectly) holds reference to the file ctx, so userspace
keeping around a fence fd by mistake could keep a set of pgtables live
unnecessarily..  I suppose we could re-work where we drop that
reference.

six of one, half-dozen of the other, I guess

BR,
-R

> -Daniel
>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.h        |  1 -
> >  drivers/gpu/drm/msm/msm_gem.h        | 13 +++++++++++++
> >  drivers/gpu/drm/msm/msm_gem_submit.c | 12 ++++++------
> >  drivers/gpu/drm/msm/msm_gpu.c        | 21 ++++++++++++++++-----
> >  4 files changed, 35 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> > index 50978e5db376..535f9e718e2d 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -277,7 +277,6 @@ void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
> >
> >  bool msm_use_mmu(struct drm_device *dev);
> >
> > -void msm_gem_submit_free(struct msm_gem_submit *submit);
> >  int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> >               struct drm_file *file);
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> > index a1bf741b9b89..e05b1530aca6 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.h
> > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > @@ -136,6 +136,7 @@ void msm_gem_free_work(struct work_struct *work);
> >   * lasts for the duration of the submit-ioctl.
> >   */
> >  struct msm_gem_submit {
> > +     struct kref ref;
> >       struct drm_device *dev;
> >       struct msm_gpu *gpu;
> >       struct msm_gem_address_space *aspace;
> > @@ -169,6 +170,18 @@ struct msm_gem_submit {
> >       } bos[];
> >  };
> >
> > +void __msm_gem_submit_destroy(struct kref *kref);
> > +
> > +static inline void msm_gem_submit_get(struct msm_gem_submit *submit)
> > +{
> > +     kref_get(&submit->ref);
> > +}
> > +
> > +static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
> > +{
> > +     kref_put(&submit->ref, __msm_gem_submit_destroy);
> > +}
> > +
> >  /* helper to determine of a buffer in submit should be dumped, used for both
> >   * devcoredump and debugfs cmdstream dumping:
> >   */
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > index e1d1f005b3d4..7d653bdc92dc 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -42,6 +42,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
> >       if (!submit)
> >               return NULL;
> >
> > +     kref_init(&submit->ref);
> >       submit->dev = dev;
> >       submit->aspace = queue->ctx->aspace;
> >       submit->gpu = gpu;
> > @@ -60,12 +61,12 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
> >       return submit;
> >  }
> >
> > -void msm_gem_submit_free(struct msm_gem_submit *submit)
> > +void __msm_gem_submit_destroy(struct kref *kref)
> >  {
> > +     struct msm_gem_submit *submit =
> > +                     container_of(kref, struct msm_gem_submit, ref);
> > +
> >       dma_fence_put(submit->fence);
> > -     spin_lock(&submit->ring->submit_lock);
> > -     list_del(&submit->node);
> > -     spin_unlock(&submit->ring->submit_lock);
> >       put_pid(submit->pid);
> >       msm_submitqueue_put(submit->queue);
> >
> > @@ -805,8 +806,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> >       submit_cleanup(submit);
> >       if (has_ww_ticket)
> >               ww_acquire_fini(&submit->ticket);
> > -     if (ret)
> > -             msm_gem_submit_free(submit);
> > +     msm_gem_submit_put(submit);
> >  out_unlock:
> >       if (ret && (out_fence_fd >= 0))
> >               put_unused_fd(out_fence_fd);
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > index 8d1e254f964a..fd3fc6f36ab1 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -712,7 +712,12 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
> >
> >       pm_runtime_mark_last_busy(&gpu->pdev->dev);
> >       pm_runtime_put_autosuspend(&gpu->pdev->dev);
> > -     msm_gem_submit_free(submit);
> > +
> > +     spin_lock(&ring->submit_lock);
> > +     list_del(&submit->node);
> > +     spin_unlock(&ring->submit_lock);
> > +
> > +     msm_gem_submit_put(submit);
> >  }
> >
> >  static void retire_submits(struct msm_gpu *gpu)
> > @@ -786,10 +791,6 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> >
> >       submit->seqno = ++ring->seqno;
> >
> > -     spin_lock(&ring->submit_lock);
> > -     list_add_tail(&submit->node, &ring->submits);
> > -     spin_unlock(&ring->submit_lock);
> > -
> >       msm_rd_dump_submit(priv->rd, submit, NULL);
> >
> >       update_sw_cntrs(gpu);
> > @@ -816,6 +817,16 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> >               msm_gem_active_get(drm_obj, gpu);
> >       }
> >
> > +     /*
> > +      * ring->submits holds a ref to the submit, to deal with the case
> > +      * that a submit completes before msm_ioctl_gem_submit() returns.
> > +      */
> > +     msm_gem_submit_get(submit);
> > +
> > +     spin_lock(&ring->submit_lock);
> > +     list_add_tail(&submit->node, &ring->submits);
> > +     spin_unlock(&ring->submit_lock);
> > +
> >       gpu->funcs->submit(gpu, submit);
> >       priv->lastctx = submit->queue->ctx;
> >
> > --
> > 2.26.2
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
