Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D4A2729C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 17:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbgIUPQ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 11:16:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbgIUPQ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 11:16:26 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEB93C061755;
        Mon, 21 Sep 2020 08:16:25 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id z9so13132430wmk.1;
        Mon, 21 Sep 2020 08:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=ozO/iVrWPutPSn7MG9oqalV9I25vI9GsLgmKgzJHohs=;
        b=fEUr0FQ/pGsSNlQ+AvUR3ZL52zaO1Q8OjVVG5M45s9lJIi9EtWH9OnRoelGZ/pYYVk
         hqiFmcMS8jn7KzVWKfngt/toQ32tkVB9fZNpEycRjRzusaykZzd+WNCwG5OMaNumnVMU
         Ra+4xLihcv9Z4Pz0bnj29Lf/ZquGbqXlRZp0uCBElQ49fUrVvgg9BuPz3ydvtU5O7dF4
         MTkvzOjsj0MnI5GIkOPZzDlDdmKi9908ICaAhcFxyED4882djbFgPjPC9wjtbvmv/cqw
         V70G+GcE/FBGx75NDbaDpGNrL+MTrckN1AxX47OA6ys8tdQOoww0wzrIbzXJ9sCUocUB
         mkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=ozO/iVrWPutPSn7MG9oqalV9I25vI9GsLgmKgzJHohs=;
        b=ZQ9iXWoq105YKGm6CSRxvavN48HWWk5mgm6iaylHFAT4kdYcKZ0bmhVvDwYH3wAmvd
         yjcG+kKgnb1YLlMaz16/jIe4M+yoa1BMu0tltGSPvJ+XrY6cMW8L6/yXSuoSEL6p7Mlb
         y0E3bghTo++jKLtw54heHuvTK7HP95QrICjLAPcj05qguZZ6dPVhx+wSixWTKOND0als
         7FtSS60fPY33UkDKGenqtt3vyJrlwTjNGC+mPosrAEGqOXYLVHycoSWZKm7K/MxCykzx
         n4i/yGB5y5MX4kRm97zKL2Sl0hlksgowOMfqeV4NeHeEmSCM5+mFinJ3wpXjeWOgJjp2
         baQA==
X-Gm-Message-State: AOAM531rvQEYUYv27gIHWY22j5YnCEoSDog0CVuaJnO9lRv+Bg2p0OK2
        UXZ71IXrp7qe65/9VGMv/7UaqfTZ4VweeD4m7kA=
X-Google-Smtp-Source: ABdhPJxC1AqrWplmQno1yweczds849w2jR28oZRsSF9sWWMYGTcMyRFaGk5mBH71Zo+kXqQgIomtaijNtKYE375AhpY=
X-Received: by 2002:a7b:cf1a:: with SMTP id l26mr137774wmg.164.1600701384220;
 Mon, 21 Sep 2020 08:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200919193727.2093945-1-robdclark@gmail.com> <20200921092154.GJ438822@phenom.ffwll.local>
In-Reply-To: <20200921092154.GJ438822@phenom.ffwll.local>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 21 Sep 2020 08:16:12 -0700
Message-ID: <CAF6AEGuDRk9D_aqyb6R8N5VHx2rvbZDf4uTqF3gQTrmzno+qtw@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm: commit_work scheduling
To:     Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Tim Murray <timmurray@google.com>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 21, 2020 at 2:21 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sat, Sep 19, 2020 at 12:37:23PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The android userspace treats the display pipeline as a realtime problem.
> > And arguably, if your goal is to not miss frame deadlines (ie. vblank),
> > it is.  (See https://lwn.net/Articles/809545/ for the best explaination
> > that I found.)
> >
> > But this presents a problem with using workqueues for non-blocking
> > atomic commit_work(), because the SCHED_FIFO userspace thread(s) can
> > preempt the worker.  Which is not really the outcome you want.. once
> > the required fences are scheduled, you want to push the atomic commit
> > down to hw ASAP.
> >
> > But the decision of whether commit_work should be RT or not really
> > depends on what userspace is doing.  For a pure CFS userspace display
> > pipeline, commit_work() should remain SCHED_NORMAL.
> >
> > To handle this, convert non-blocking commit_work() to use per-CRTC
> > kthread workers, instead of system_unbound_wq.  Per-CRTC workers are
> > used to avoid serializing commits when userspace is using a per-CRTC
> > update loop.
> >
> > A client-cap is introduced so that userspace can opt-in to SCHED_FIFO
> > priority commit work.
> >
> > A potential issue is that since 616d91b68cd ("sched: Remove
> > sched_setscheduler*() EXPORTs") we have limited RT priority levels,
> > meaning that commit_work() ends up running at the same priority level
> > as vblank-work.  This shouldn't be a big problem *yet*, due to limited
> > use of vblank-work at this point.  And if it could be arranged that
> > vblank-work is scheduled before signaling out-fences and/or sending
> > pageflip events, it could probably work ok to use a single priority
> > level for both commit-work and vblank-work.
>
> The part I don't like about this is that it all feels rather hacked
> together, and if we add more stuff (or there's some different thing in the
> system that also needs rt scheduling) then it doesn't compose.

The ideal thing would be that userspace is in control of the
priorities.. the setclientcap approach seemed like a reasonable way to
give the drm-master a way to opt in.

I suppose instead userspace could use sched_setscheduler().. but that
would require userspace to be root, and would require some way to find
the tid.

Is there some way we could arrange for the per-crtc kthread's to be
owned by the drm master?  That would solve the "must be root" issue.
And since the target audience is an atomic userspace, I suppose we
could expose the tid as a read-only property on the crtc?

BR,
-R

> So question to rt/worker folks: What's the best way to let userspace set
> the scheduling mode and priorities of things the kernel does on its
> behalf? Surely we're not the first ones where if userspace runs with some
> rt priority it'll starve out the kernel workers that it needs. Hardcoding
> something behind a subsystem ioctl (which just means every time userspace
> changes what it does, we need a new such flag or mode) can't be the right
> thing.
>
> Peter, Tejun?
>
> Thanks, Daniel
>
> >
> > Rob Clark (3):
> >   drm/crtc: Introduce per-crtc kworker
> >   drm/atomic: Use kthread worker for nonblocking commits
> >   drm: Add a client-cap to set scheduling mode
> >
> >  drivers/gpu/drm/drm_atomic_helper.c | 13 ++++++----
> >  drivers/gpu/drm/drm_auth.c          |  4 ++++
> >  drivers/gpu/drm/drm_crtc.c          | 37 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/drm_ioctl.c         | 13 ++++++++++
> >  include/drm/drm_atomic.h            | 31 ++++++++++++++++++++++++
> >  include/drm/drm_crtc.h              | 10 ++++++++
> >  include/uapi/drm/drm.h              | 13 ++++++++++
> >  7 files changed, 117 insertions(+), 4 deletions(-)
> >
> > --
> > 2.26.2
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
