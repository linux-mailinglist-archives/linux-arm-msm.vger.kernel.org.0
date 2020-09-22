Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0506D2742C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 15:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgIVNSS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 09:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726494AbgIVNSS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 09:18:18 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B13A9C061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2020 06:18:17 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id o5so17005203wrn.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2020 06:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=ulDXZe62cg9q0pWHvj25dMr9OefSQ2Lms8zz3fQsI8U=;
        b=U/9Qx3fjuwOeRopvo8mwBcOn7Uh9HK8xQz4PXypyHS9JILaivkcnO4MpfbR6TJOsEz
         irSTrtlfFtn1qfheG02tf6JKQ0RPzluPHYpGVP2xPpsq/q6tmxJXo6BCcL1yyGzm6RyT
         iuyO5dXyp/CMyWaRVDK/2LxiZ635Vkru4nHM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=ulDXZe62cg9q0pWHvj25dMr9OefSQ2Lms8zz3fQsI8U=;
        b=JCdL5G+aTk1b3fxxRGhEGiEQxnpOcs2hpGfG8+nsbXoRL1aeNeKJNEmZl546AM1Of8
         PmcBtzJfghr0p15LL9jvM229KoDks1RlQjufxwEC0opbwQOoPIh0G2micBMRa8W9SJ65
         OlFfKPHxViexLfHAGxbLeh4nBjw+EGhDfQWV55ejTShbgLSlAQQ7E5PpTB4SND1Tx6v4
         nA1gyQf08mLaAoM4aa8me8mOUdtFtBn67ZTrbdSo00WnFnvc/xcIye2iStuVjgHvY1Vn
         LMvsGOOfl1PbRSd8UzFAPQN2wbQS3cY9o49TGW0Hkby578u6z4G0AmvOlQqQNVB4vymK
         GLTw==
X-Gm-Message-State: AOAM5324QAf3lO+3JB/UT0YoRXUkK7YjbmHFXfQhA1bE4WTl/HqZzsUe
        +kFRxAD42n1UHHcb5OMxYpIFZQ==
X-Google-Smtp-Source: ABdhPJzLA0IJMNKNnPSjgdq+u8OKkX1pYrMrE0tYnSM5AzqPX9ycb4zFPC1OTcILhTxqMXMPMcgFhA==
X-Received: by 2002:adf:e7ce:: with SMTP id e14mr5188236wrn.43.1600780696311;
        Tue, 22 Sep 2020 06:18:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id c205sm4688134wmd.33.2020.09.22.06.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 06:18:15 -0700 (PDT)
Date:   Tue, 22 Sep 2020 15:18:13 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Tejun Heo <tj@kernel.org>, timmurray@google.com,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        open list <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/3] drm/atomic: Use kthread worker for nonblocking
 commits
Message-ID: <20200922131813.GL438822@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
        timmurray@google.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        open list <linux-kernel@vger.kernel.org>
References: <20200919193727.2093945-1-robdclark@gmail.com>
 <20200919193727.2093945-3-robdclark@gmail.com>
 <20200921092322.GK438822@phenom.ffwll.local>
 <CAF6AEGu9b_6NOk-PcZnpv3UCi_muYdrayCaA83me1RTGoU+jHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGu9b_6NOk-PcZnpv3UCi_muYdrayCaA83me1RTGoU+jHw@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 21, 2020 at 07:55:42AM -0700, Rob Clark wrote:
> On Mon, Sep 21, 2020 at 2:23 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Sat, Sep 19, 2020 at 12:37:25PM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > This will allow us to more easily switch scheduling rules based on what
> > > userspace wants.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> >
> > I still think switching to the highpriority systemwq as a start (like i915
> > already does) would be a good first step no matter what we end up doing
> > for the android thing.
> 
> highpri wq is probably better than the current state, but it doesn't
> really address the problem.  You'll still end up with surfaceflinger
> preempting commit_work..
> 
> And with non-RT priority, you'll still occasionally get lower priority
> threads which haven't had a chance to run for a while preempting you.

Sure the priority inversion is still there and needs a different fix. But
maybe it'll make everyone else at least a bit happier.

Plus it's really hard to make kms drivers rt, it's not really been part of
the design (nor are gpus really rt friendly, if they even can preempt it
generally takes forever compared to the deadline you might want for some
present work).
-Daniel
> 
> BR,
> -R
> 
> 
> > -Daniel
> >
> > > ---
> > >  drivers/gpu/drm/drm_atomic_helper.c | 13 ++++++++----
> > >  include/drm/drm_atomic.h            | 31 +++++++++++++++++++++++++++++
> > >  2 files changed, 40 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > > index 9e1ad493e689..75eeec5e7b10 100644
> > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > @@ -1659,11 +1659,11 @@ static void commit_tail(struct drm_atomic_state *old_state)
> > >       drm_atomic_state_put(old_state);
> > >  }
> > >
> > > -static void commit_work(struct work_struct *work)
> > > +static void commit_work(struct kthread_work *work)
> > >  {
> > >       struct drm_atomic_state *state = container_of(work,
> > >                                                     struct drm_atomic_state,
> > > -                                                   commit_work);
> > > +                                                   commit_kwork);
> > >       commit_tail(state);
> > >  }
> > >
> > > @@ -1797,6 +1797,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
> > >                            struct drm_atomic_state *state,
> > >                            bool nonblock)
> > >  {
> > > +     struct kthread_worker *worker = NULL;
> > >       int ret;
> > >
> > >       if (state->async_update) {
> > > @@ -1814,7 +1815,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
> > >       if (ret)
> > >               return ret;
> > >
> > > -     INIT_WORK(&state->commit_work, commit_work);
> > > +     kthread_init_work(&state->commit_kwork, commit_work);
> > >
> > >       ret = drm_atomic_helper_prepare_planes(dev, state);
> > >       if (ret)
> > > @@ -1857,8 +1858,12 @@ int drm_atomic_helper_commit(struct drm_device *dev,
> > >        */
> > >
> > >       drm_atomic_state_get(state);
> > > +
> > >       if (nonblock)
> > > -             queue_work(system_unbound_wq, &state->commit_work);
> > > +             worker = drm_atomic_pick_worker(state);
> > > +
> > > +     if (worker)
> > > +             kthread_queue_work(worker, &state->commit_kwork);
> > >       else
> > >               commit_tail(state);
> > >
> > > diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> > > index d07c851d255b..8d0ee19953df 100644
> > > --- a/include/drm/drm_atomic.h
> > > +++ b/include/drm/drm_atomic.h
> > > @@ -373,8 +373,18 @@ struct drm_atomic_state {
> > >        *
> > >        * Work item which can be used by the driver or helpers to execute the
> > >        * commit without blocking.
> > > +      *
> > > +      * This is deprecated, use commit_kwork.
> > >        */
> > >       struct work_struct commit_work;
> > > +
> > > +     /**
> > > +      * @commit_kwork:
> > > +      *
> > > +      * Work item which can be used by the driver or helpers to execute the
> > > +      * commit without blocking.
> > > +      */
> > > +     struct kthread_work commit_kwork;
> > >  };
> > >
> > >  void __drm_crtc_commit_free(struct kref *kref);
> > > @@ -954,6 +964,27 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
> > >                     (new_obj_state) = (__state)->private_objs[__i].new_state, 1); \
> > >            (__i)++)
> > >
> > > +/**
> > > + * drm_atomic_pick_worker - helper to get kworker to use for nonblocking commit
> > > + * @state: the &drm_atomic_state for the commit
> > > + *
> > > + * Pick an appropriate worker for a given atomic update.  The first CRTC
> > > + * invovled in the atomic update is used to pick the worker, to prevent
> > > + * serializing multiple pageflips / atomic-updates on indenpendent CRTCs.
> > > + */
> > > +static inline struct kthread_worker *
> > > +drm_atomic_pick_worker(const struct drm_atomic_state *state)
> > > +{
> > > +     struct drm_crtc_state *crtc_state;
> > > +     struct drm_crtc *crtc;
> > > +     unsigned i;
> > > +
> > > +     for_each_new_crtc_in_state(state, crtc, crtc_state, i)
> > > +             return crtc->worker;
> > > +
> > > +     return NULL;
> > > +}
> > > +
> > >  /**
> > >   * drm_atomic_crtc_needs_modeset - compute combined modeset need
> > >   * @state: &drm_crtc_state for the CRTC
> > > --
> > > 2.26.2
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
