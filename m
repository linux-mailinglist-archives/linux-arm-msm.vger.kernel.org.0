Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C23652744AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 16:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgIVOsY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 10:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgIVOsX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 10:48:23 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 805B9C061755;
        Tue, 22 Sep 2020 07:48:23 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id e17so3655944wme.0;
        Tue, 22 Sep 2020 07:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QGE4ym/Uaa7H6dh42EwLEIYXv6MD8ykJS8aLJNDxkcU=;
        b=S08putSaHeLUuphCDia5cHpsk4+TmEbQ6y7lnkPLjxRua0s9CeTprpw2VMUG+fPh6a
         /DJEU6izPbZLBZuE+Iz8J0lKQ/eJar7McTc67LMBW3aLxlQutQRSabu4pJUMoRbovCeN
         2rG6H9iP/3jUasK2ShLQkmAMCw970QOPEQX98MnIidEeHwz273UkMOj6ehLwbrbCl9/b
         Hau4Y3qKHwnINLpMAmbEp8O1wnOidaZE7o61A1PkiZ6m+/ccohgDJ6gBrafsqC3Bq2HS
         Df8dwj9LOh+WMfO1X+0Lhcig7EEpl0h5qwQiPR+Uv8tXqzECbZXWOdfJHBtUwt6q13ZA
         bG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QGE4ym/Uaa7H6dh42EwLEIYXv6MD8ykJS8aLJNDxkcU=;
        b=aAvct3Gvm9fb7u6VrIwBBUn6Al9PvM1tCj4GN1K4Sg8h1vwHqudRytSlbt4dXIGUy0
         KtfN88sYOkhxyrpikawyVTABOcsvshQDRdKQCuiPPgNkgIqUmGO/2ne0acm5l5PrK5sQ
         uQTGdoJQ3VNgkdQmR4ER1CMOMjyVRKl64zp6/Qo7ulORGIktOiVGkkULsHYYGoJVHYWA
         9mqNi3x+P5q1FeK2A1B9KBs/OOsg37TXMze1Ppbry7NXuJsvMR6wJgoK7qT3Dr2wi59Q
         HgEPGIUvslkc+R7aEDsBEhKUPEEimPMHpo5GqsjdB2X4yQKW1hLkqRS/HXyKyiovF178
         Q8Xw==
X-Gm-Message-State: AOAM53233zJZPPeZtN+Ib0Mt9gzlUeIZnWmk7357+jsVw8Tt3xEpsano
        qMtKu1wV4PPUnB7z05tv4fFNvJzsSNaKJYp1blA=
X-Google-Smtp-Source: ABdhPJzaWeF7RKKBaheeqnDyrbYqlgLNhxtprVuZPC4QKyBgC6lIp8+pBRfxBu0Z45F0SSblhaOH1teeVadq0UZ6CVU=
X-Received: by 2002:a05:600c:2183:: with SMTP id e3mr1501554wme.49.1600786101897;
 Tue, 22 Sep 2020 07:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200919193727.2093945-1-robdclark@gmail.com> <20200921092154.GJ438822@phenom.ffwll.local>
 <CAF6AEGuDRk9D_aqyb6R8N5VHx2rvbZDf4uTqF3gQTrmzno+qtw@mail.gmail.com> <CAKMK7uEqDD-oDAQKyA9DQbxkCgEjC5yyjvKR7d8T0Gj0SqEZ4A@mail.gmail.com>
In-Reply-To: <CAKMK7uEqDD-oDAQKyA9DQbxkCgEjC5yyjvKR7d8T0Gj0SqEZ4A@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 22 Sep 2020 07:48:10 -0700
Message-ID: <CAF6AEGtYAn+W8HxP7SXtxPr5FsEB1hYGU91WrHCtwX89UmUR5w@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm: commit_work scheduling
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Tim Murray <timmurray@google.com>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 21, 2020 at 11:59 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Sep 21, 2020 at 5:16 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Mon, Sep 21, 2020 at 2:21 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Sat, Sep 19, 2020 at 12:37:23PM -0700, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > The android userspace treats the display pipeline as a realtime problem.
> > > > And arguably, if your goal is to not miss frame deadlines (ie. vblank),
> > > > it is.  (See https://lwn.net/Articles/809545/ for the best explaination
> > > > that I found.)
> > > >
> > > > But this presents a problem with using workqueues for non-blocking
> > > > atomic commit_work(), because the SCHED_FIFO userspace thread(s) can
> > > > preempt the worker.  Which is not really the outcome you want.. once
> > > > the required fences are scheduled, you want to push the atomic commit
> > > > down to hw ASAP.
> > > >
> > > > But the decision of whether commit_work should be RT or not really
> > > > depends on what userspace is doing.  For a pure CFS userspace display
> > > > pipeline, commit_work() should remain SCHED_NORMAL.
> > > >
> > > > To handle this, convert non-blocking commit_work() to use per-CRTC
> > > > kthread workers, instead of system_unbound_wq.  Per-CRTC workers are
> > > > used to avoid serializing commits when userspace is using a per-CRTC
> > > > update loop.
> > > >
> > > > A client-cap is introduced so that userspace can opt-in to SCHED_FIFO
> > > > priority commit work.
> > > >
> > > > A potential issue is that since 616d91b68cd ("sched: Remove
> > > > sched_setscheduler*() EXPORTs") we have limited RT priority levels,
> > > > meaning that commit_work() ends up running at the same priority level
> > > > as vblank-work.  This shouldn't be a big problem *yet*, due to limited
> > > > use of vblank-work at this point.  And if it could be arranged that
> > > > vblank-work is scheduled before signaling out-fences and/or sending
> > > > pageflip events, it could probably work ok to use a single priority
> > > > level for both commit-work and vblank-work.
> > >
> > > The part I don't like about this is that it all feels rather hacked
> > > together, and if we add more stuff (or there's some different thing in the
> > > system that also needs rt scheduling) then it doesn't compose.
> >
> > The ideal thing would be that userspace is in control of the
> > priorities.. the setclientcap approach seemed like a reasonable way to
> > give the drm-master a way to opt in.
> >
> > I suppose instead userspace could use sched_setscheduler().. but that
> > would require userspace to be root, and would require some way to find
> > the tid.
>
> Userspace already needs that for the SCHED_FIFO for surface-flinger.
> Or is the problem that CAP_SYS_NICE is only good for your own
> processes?

tbh, I'm not completely sure offhand what gives surfaceflinger
permission to set itself SCHED_FIFO

(But on CrOS there are a few more pieces to the puzzle)

> Other question I have for this is whether there's any recommendations
> for naming the kthreads (since I guess that name is what becomes the
> uapi for userspace to control this)?
>
> Otherwise I think "userspace calls sched_setscheduler on the right
> kthreads" sounds like a good interface, since it lets userspace decide
> how it all needs to fit together and compose. Anything we hard-code in
> an ioctl is kinda lost cause. And we can choose the default values to
> work reasonably well when the compositor runs at normal priority
> (lowest niceness or something like that for the commit work).

I don't really like the naming convention approach.. what is to stop
some unrelated process to name it's thread the same thing to get a
SCHED_FIFO boost..

But we can stick with my idea to expose the thread id as a read-only
CRTC property, for userspace to find the things to call
sched_setscheduler() on.  If for whatever reason the drm master is not
privileged (or is running in a sandbox, etc), a small helper that has
the necessary permissions could open the drm device to find the CRTC
thread-ids and call sched_setscheduler()..

BR,
-R

> -Daniel
>
> > Is there some way we could arrange for the per-crtc kthread's to be
> > owned by the drm master?  That would solve the "must be root" issue.
> > And since the target audience is an atomic userspace, I suppose we
> > could expose the tid as a read-only property on the crtc?
> >
> > BR,
> > -R
> >
> > > So question to rt/worker folks: What's the best way to let userspace set
> > > the scheduling mode and priorities of things the kernel does on its
> > > behalf? Surely we're not the first ones where if userspace runs with some
> > > rt priority it'll starve out the kernel workers that it needs. Hardcoding
> > > something behind a subsystem ioctl (which just means every time userspace
> > > changes what it does, we need a new such flag or mode) can't be the right
> > > thing.
> > >
> > > Peter, Tejun?
> > >
> > > Thanks, Daniel
> > >
> > > >
> > > > Rob Clark (3):
> > > >   drm/crtc: Introduce per-crtc kworker
> > > >   drm/atomic: Use kthread worker for nonblocking commits
> > > >   drm: Add a client-cap to set scheduling mode
> > > >
> > > >  drivers/gpu/drm/drm_atomic_helper.c | 13 ++++++----
> > > >  drivers/gpu/drm/drm_auth.c          |  4 ++++
> > > >  drivers/gpu/drm/drm_crtc.c          | 37 +++++++++++++++++++++++++++++
> > > >  drivers/gpu/drm/drm_ioctl.c         | 13 ++++++++++
> > > >  include/drm/drm_atomic.h            | 31 ++++++++++++++++++++++++
> > > >  include/drm/drm_crtc.h              | 10 ++++++++
> > > >  include/uapi/drm/drm.h              | 13 ++++++++++
> > > >  7 files changed, 117 insertions(+), 4 deletions(-)
> > > >
> > > > --
> > > > 2.26.2
> > > >
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
