Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA457272933
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 16:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727550AbgIUOzz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 10:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbgIUOzz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 10:55:55 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27BCAC061755;
        Mon, 21 Sep 2020 07:55:55 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id z9so13051508wmk.1;
        Mon, 21 Sep 2020 07:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1gD5aOm8fuZMk6MimLqRwABTZfn3FP7FLxy/euBRZic=;
        b=tqzFSNwdl3Bk7iLcqBlHFWtq/IGqi1UjVmTmJLHpjjo7e5o2poI1OSijojjxtmKIfR
         YdAVU5XzOtc2dwyfRzCHxYV2Mf1OPmvwiLE9YW9QEfXdbyz5BzJ4FRC2WJQ/OqBb88yV
         hmZMaSG2WOI0PDOz+mrA9JyzfBABTXR94c7+oT2UMKsROiUkjymCrbGl4lovACHAvJnq
         VaAcYTjP+iqCvHpRx5Z9MG2s2lTocg8xsrEFl8T/tnV0ci9BO/2hWouSnpW1gouZ/LaK
         QGkZ0aPYcztp/rTndWD5SIhivgYv2xmUrWc6AD6JlPPUmKFaVcWJ/SUK22pT+ycBRj4d
         PQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1gD5aOm8fuZMk6MimLqRwABTZfn3FP7FLxy/euBRZic=;
        b=ET6nQhD4pv+DK8zBYoSxa+sVM+e12TN9qHyGHRYEvVQeLzyackVkQYpzzHLBBYs6EG
         +IFqHA4FTdWywIk4bvCza8B2T5VKlQYG00v8UuHL9VHU5G46jQUAGHJx8SRcITxpv9e0
         z17qCYSQMz48MZeWoEtblgIFqDOlJZQJhCbn+m2ovlsqvqTfHXKjcmjH9uC4YCbRz+7l
         fUCFpz7pQhsVRNCxw/ufMwiCy5f+nkyKOQgiLKVUnEEXJBI7WEP4TP1goo3tHw2hoQ8C
         HvRyK0pek6B8En5esQ1+GOGKSwx+wrStLnRs7hcDfZ81Q+MuSOw1VtZ/1RJ3+HUbqwnz
         csPA==
X-Gm-Message-State: AOAM530aR3v6DXDNnl68XksKTsQ7+Sn8mwHnI+I99jhFyYoUxIJRbdXR
        Zt96SCzuhaWgjnjvtYwMM+ZA4AIv00BiFW3+7i2pxPzQ
X-Google-Smtp-Source: ABdhPJxonY3gT1MbyqiHSexj8fbAdMxfyk43LjxB/pUJgUTXh2mmPGf6lxTa06IyXSstN6A4utQXvG1UZAhXAr2vXXI=
X-Received: by 2002:a1c:3588:: with SMTP id c130mr66270wma.94.1600700153766;
 Mon, 21 Sep 2020 07:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200919193727.2093945-1-robdclark@gmail.com> <20200919193727.2093945-3-robdclark@gmail.com>
 <20200921092322.GK438822@phenom.ffwll.local>
In-Reply-To: <20200921092322.GK438822@phenom.ffwll.local>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 21 Sep 2020 07:55:42 -0700
Message-ID: <CAF6AEGu9b_6NOk-PcZnpv3UCi_muYdrayCaA83me1RTGoU+jHw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/atomic: Use kthread worker for nonblocking commits
To:     Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Tejun Heo <tj@kernel.org>, timmurray@google.com,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        open list <linux-kernel@vger.kernel.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 21, 2020 at 2:23 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sat, Sep 19, 2020 at 12:37:25PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This will allow us to more easily switch scheduling rules based on what
> > userspace wants.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> I still think switching to the highpriority systemwq as a start (like i915
> already does) would be a good first step no matter what we end up doing
> for the android thing.

highpri wq is probably better than the current state, but it doesn't
really address the problem.  You'll still end up with surfaceflinger
preempting commit_work..

And with non-RT priority, you'll still occasionally get lower priority
threads which haven't had a chance to run for a while preempting you.

BR,
-R


> -Daniel
>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 13 ++++++++----
> >  include/drm/drm_atomic.h            | 31 +++++++++++++++++++++++++++++
> >  2 files changed, 40 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index 9e1ad493e689..75eeec5e7b10 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1659,11 +1659,11 @@ static void commit_tail(struct drm_atomic_state *old_state)
> >       drm_atomic_state_put(old_state);
> >  }
> >
> > -static void commit_work(struct work_struct *work)
> > +static void commit_work(struct kthread_work *work)
> >  {
> >       struct drm_atomic_state *state = container_of(work,
> >                                                     struct drm_atomic_state,
> > -                                                   commit_work);
> > +                                                   commit_kwork);
> >       commit_tail(state);
> >  }
> >
> > @@ -1797,6 +1797,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
> >                            struct drm_atomic_state *state,
> >                            bool nonblock)
> >  {
> > +     struct kthread_worker *worker = NULL;
> >       int ret;
> >
> >       if (state->async_update) {
> > @@ -1814,7 +1815,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
> >       if (ret)
> >               return ret;
> >
> > -     INIT_WORK(&state->commit_work, commit_work);
> > +     kthread_init_work(&state->commit_kwork, commit_work);
> >
> >       ret = drm_atomic_helper_prepare_planes(dev, state);
> >       if (ret)
> > @@ -1857,8 +1858,12 @@ int drm_atomic_helper_commit(struct drm_device *dev,
> >        */
> >
> >       drm_atomic_state_get(state);
> > +
> >       if (nonblock)
> > -             queue_work(system_unbound_wq, &state->commit_work);
> > +             worker = drm_atomic_pick_worker(state);
> > +
> > +     if (worker)
> > +             kthread_queue_work(worker, &state->commit_kwork);
> >       else
> >               commit_tail(state);
> >
> > diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> > index d07c851d255b..8d0ee19953df 100644
> > --- a/include/drm/drm_atomic.h
> > +++ b/include/drm/drm_atomic.h
> > @@ -373,8 +373,18 @@ struct drm_atomic_state {
> >        *
> >        * Work item which can be used by the driver or helpers to execute the
> >        * commit without blocking.
> > +      *
> > +      * This is deprecated, use commit_kwork.
> >        */
> >       struct work_struct commit_work;
> > +
> > +     /**
> > +      * @commit_kwork:
> > +      *
> > +      * Work item which can be used by the driver or helpers to execute the
> > +      * commit without blocking.
> > +      */
> > +     struct kthread_work commit_kwork;
> >  };
> >
> >  void __drm_crtc_commit_free(struct kref *kref);
> > @@ -954,6 +964,27 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
> >                     (new_obj_state) = (__state)->private_objs[__i].new_state, 1); \
> >            (__i)++)
> >
> > +/**
> > + * drm_atomic_pick_worker - helper to get kworker to use for nonblocking commit
> > + * @state: the &drm_atomic_state for the commit
> > + *
> > + * Pick an appropriate worker for a given atomic update.  The first CRTC
> > + * invovled in the atomic update is used to pick the worker, to prevent
> > + * serializing multiple pageflips / atomic-updates on indenpendent CRTCs.
> > + */
> > +static inline struct kthread_worker *
> > +drm_atomic_pick_worker(const struct drm_atomic_state *state)
> > +{
> > +     struct drm_crtc_state *crtc_state;
> > +     struct drm_crtc *crtc;
> > +     unsigned i;
> > +
> > +     for_each_new_crtc_in_state(state, crtc, crtc_state, i)
> > +             return crtc->worker;
> > +
> > +     return NULL;
> > +}
> > +
> >  /**
> >   * drm_atomic_crtc_needs_modeset - compute combined modeset need
> >   * @state: &drm_crtc_state for the CRTC
> > --
> > 2.26.2
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
