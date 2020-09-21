Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAE132729DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 17:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgIUPU4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 11:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbgIUPU4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 11:20:56 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A425C061755;
        Mon, 21 Sep 2020 08:20:56 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id a9so13179017wmm.2;
        Mon, 21 Sep 2020 08:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=L4bLRGp7fGx2MknkK1rcPvRD/2kcqQUQu2s4wMlqMkw=;
        b=XVPz4n/zlQcN4jyMyrNIZ2vLXHT266ErcWI8LLrSqHrsI9fkXIxDApXK6WCh6ZpquF
         e4/4l/xm6ito5hkBhvL5/m1L3I/IkyNOmF+ueb8PdfAnMHN0vIA1qXxPUH3DVOR5BJYh
         bJo6zmTNC5ciKMfl7d/TzqyXhNeBcRYzTDToW356D6JdzjYUS0Vvv2NdYm12ev3WpUI/
         g81slmjWQt54Aw15o+lEyaKQOZzFy39qX2eJ/DC1J4rVPcggWAuVRHqzQwUFz+PK6xeZ
         tLa5pt8SJWKXjIJrL0z92rR8ElLZx/j6YjsBBp6apetbjE280+NdIf0R2RaXTVj/whvH
         /UgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=L4bLRGp7fGx2MknkK1rcPvRD/2kcqQUQu2s4wMlqMkw=;
        b=bcW6eCtcwKupVqPcWr0UNCXxgM5h5eE6tdoUPZY+eEWTNzXpGGczqNf4Cj2h45u0kM
         Uf4Bsb961sD7LiZsi0/fwCMYrhVxM6s+1icBK4lHR6Q9KN4ya8i8hWgUpD624kLaRL1c
         C9nbsy6vpXit4JUzL/WJN9ZW5bfV+10IHKAwiS4+6aoj0TH+sQNspkhOAkSueJHO/8hB
         OG7ZyKkS5M4+T2RG+P/IfgZERx1pv4xcsvOiO2x3ngXGTzO5eypdjtcNT0bzAQev/PHg
         ktwe/iYBoe+QPeCzFiqN3blqnjv/qGd8obusDut9WlJYI0eSBzv6/qoanMNZRYyoo29e
         ZXig==
X-Gm-Message-State: AOAM531TwkVHG3xu1TY5Lw2EB1F2YZ4YDTzO+ZH/8riRmrEmwQO7Hl7A
        vhvt4iR5E+LrwdlfopvdjpYmK2BWVjo0v5DbR40=
X-Google-Smtp-Source: ABdhPJwvf88sXA+M0lx6styzoy1Nw4TB6P0u+sDQBGKctBcgrrcjZszU4+Hn1o8vU4wH9LKVhuwRjN1qFEbb+uscRpw=
X-Received: by 2002:a1c:b388:: with SMTP id c130mr115189wmf.175.1600701654573;
 Mon, 21 Sep 2020 08:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200919193727.2093945-1-robdclark@gmail.com> <20200921092154.GJ438822@phenom.ffwll.local>
 <CAF6AEGuDRk9D_aqyb6R8N5VHx2rvbZDf4uTqF3gQTrmzno+qtw@mail.gmail.com>
In-Reply-To: <CAF6AEGuDRk9D_aqyb6R8N5VHx2rvbZDf4uTqF3gQTrmzno+qtw@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 21 Sep 2020 08:20:42 -0700
Message-ID: <CAF6AEGumdr5p9Unqnx6xwUeJX81kLGn=iobjjXF=oVd+nhEZ0Q@mail.gmail.com>
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

On Mon, Sep 21, 2020 at 8:16 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Sep 21, 2020 at 2:21 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Sat, Sep 19, 2020 at 12:37:23PM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > The android userspace treats the display pipeline as a realtime problem.
> > > And arguably, if your goal is to not miss frame deadlines (ie. vblank),
> > > it is.  (See https://lwn.net/Articles/809545/ for the best explaination
> > > that I found.)
> > >
> > > But this presents a problem with using workqueues for non-blocking
> > > atomic commit_work(), because the SCHED_FIFO userspace thread(s) can
> > > preempt the worker.  Which is not really the outcome you want.. once
> > > the required fences are scheduled, you want to push the atomic commit
> > > down to hw ASAP.
> > >
> > > But the decision of whether commit_work should be RT or not really
> > > depends on what userspace is doing.  For a pure CFS userspace display
> > > pipeline, commit_work() should remain SCHED_NORMAL.
> > >
> > > To handle this, convert non-blocking commit_work() to use per-CRTC
> > > kthread workers, instead of system_unbound_wq.  Per-CRTC workers are
> > > used to avoid serializing commits when userspace is using a per-CRTC
> > > update loop.
> > >
> > > A client-cap is introduced so that userspace can opt-in to SCHED_FIFO
> > > priority commit work.
> > >
> > > A potential issue is that since 616d91b68cd ("sched: Remove
> > > sched_setscheduler*() EXPORTs") we have limited RT priority levels,
> > > meaning that commit_work() ends up running at the same priority level
> > > as vblank-work.  This shouldn't be a big problem *yet*, due to limited
> > > use of vblank-work at this point.  And if it could be arranged that
> > > vblank-work is scheduled before signaling out-fences and/or sending
> > > pageflip events, it could probably work ok to use a single priority
> > > level for both commit-work and vblank-work.
> >
> > The part I don't like about this is that it all feels rather hacked
> > together, and if we add more stuff (or there's some different thing in the
> > system that also needs rt scheduling) then it doesn't compose.
>
> The ideal thing would be that userspace is in control of the
> priorities.. the setclientcap approach seemed like a reasonable way to
> give the drm-master a way to opt in.
>
> I suppose instead userspace could use sched_setscheduler().. but that
> would require userspace to be root, and would require some way to find
> the tid.
>
> Is there some way we could arrange for the per-crtc kthread's to be
> owned by the drm master?  That would solve the "must be root" issue.
> And since the target audience is an atomic userspace, I suppose we
> could expose the tid as a read-only property on the crtc?

Side-note, we have the same issue with work scheduled when GPU
completes a batch/submit.. I'm less sure what to do with that, so
figured I'd start with the commit_work because that was the "easy"
part ;-)

The retire_work tends to complete quickly, so maybe sched_set_fifo()
is sufficient.  (That plus these days things that run android tend to
have 8 cores so you can kinda get away with multiple things at the
same RT priority level to some degree..)

> BR,
> -R
>
> > So question to rt/worker folks: What's the best way to let userspace set
> > the scheduling mode and priorities of things the kernel does on its
> > behalf? Surely we're not the first ones where if userspace runs with some
> > rt priority it'll starve out the kernel workers that it needs. Hardcoding
> > something behind a subsystem ioctl (which just means every time userspace
> > changes what it does, we need a new such flag or mode) can't be the right
> > thing.
> >
> > Peter, Tejun?
> >
> > Thanks, Daniel
> >
> > >
> > > Rob Clark (3):
> > >   drm/crtc: Introduce per-crtc kworker
> > >   drm/atomic: Use kthread worker for nonblocking commits
> > >   drm: Add a client-cap to set scheduling mode
> > >
> > >  drivers/gpu/drm/drm_atomic_helper.c | 13 ++++++----
> > >  drivers/gpu/drm/drm_auth.c          |  4 ++++
> > >  drivers/gpu/drm/drm_crtc.c          | 37 +++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/drm_ioctl.c         | 13 ++++++++++
> > >  include/drm/drm_atomic.h            | 31 ++++++++++++++++++++++++
> > >  include/drm/drm_crtc.h              | 10 ++++++++
> > >  include/uapi/drm/drm.h              | 13 ++++++++++
> > >  7 files changed, 117 insertions(+), 4 deletions(-)
> > >
> > > --
> > > 2.26.2
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
