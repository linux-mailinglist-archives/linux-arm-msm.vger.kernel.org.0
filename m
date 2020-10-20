Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1856D293EB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 16:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408115AbgJTO3t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 10:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408056AbgJTO3s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 10:29:48 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B002FC0613D1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 07:29:47 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id s21so2369968oij.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 07:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Iw+9FQHNyoJkvzpR4HG8l9FMoO2YHaW76z2YEMGyQNk=;
        b=b8klL9mJfc+hHeOGr0XuJsKHWTOT+MJczln6i0Y2pX/+ODV/m1GccK/uieJTeMCDFW
         PSRjyHfsysfrsF2Z1aadY4bxFoB1Adrj8Ucaa4H2UOOTrynEpoUR2z4ojR6XuUGhowCV
         RloQNtd0ndcn9whfCnU3SNC8rW2KyeBevbLOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Iw+9FQHNyoJkvzpR4HG8l9FMoO2YHaW76z2YEMGyQNk=;
        b=Mz+CYA+lAjVf2fHhxcwrs8qs0BksqTBuk9Ne4tEkaSVU0fRb7Wa8xeUh5F5L6hJkue
         smpsiBhC1cq2KR8ZxidLItp1oCB/WLOEMCODEF7tU/6xKpVXDPtkXnr9IZJaBfyBbz2Z
         N/EKACUb9BLMPC1IXCrng2wtKG6P5WIDYRHTXSvdQ72DCzQZNlZgmIQU3Kc7fQ9KcoVW
         of6mQsKuTgexXplbF2c3ZsQjdVdEhFwVB8bCpdG3FAYF2kxaYWCv7YXF+uztyiSmWDpO
         1zwvLo0fVMta6avGtV25x7O1O+hUocyNL81wXuOuoe9OZnFyvwGor0DazEPFJiSf7MRq
         YKvQ==
X-Gm-Message-State: AOAM5333KMQ0Tv744hZTesg6IXeRBf+5I2fMF2JOfUvYyCHjyH1+PfP+
        jswhFLL3n1fBeXmZOngcuTDCk59aU7NStlCW2+yAIA==
X-Google-Smtp-Source: ABdhPJwrebSK+BPzGtoMppzVbUL2XYzWHnimazpLvBBa8NBDpveNIQ2JAKbdpYQNu0j4KLTKpH7+TG4HRKat8/xIXgw=
X-Received: by 2002:aca:cc01:: with SMTP id c1mr2067105oig.128.1603204186995;
 Tue, 20 Oct 2020 07:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201019211101.143327-1-robdclark@gmail.com> <20201020082404.GJ401619@phenom.ffwll.local>
 <CAF6AEGuT6ZSpitNS0eBcjKhAVW1QBg+uPJQQkBLckOk=_GBx=A@mail.gmail.com>
In-Reply-To: <CAF6AEGuT6ZSpitNS0eBcjKhAVW1QBg+uPJQQkBLckOk=_GBx=A@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 20 Oct 2020 16:29:35 +0200
Message-ID: <CAKMK7uEg-iz2zK6E0RFA-JQ+GfjuUcnrdu+e_3FWq9E9_9WUZA@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/msm: kthread_worker conversion
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Rob Clark <robdclark@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Roy Spliet <nouveau@spliet.org>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        tongtiangen <tongtiangen@huawei.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Drew Davenport <ddavenport@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 20, 2020 at 4:01 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Oct 20, 2020 at 1:24 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Oct 19, 2020 at 02:10:50PM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > In particular, converting the async atomic commit (for cursor updates,
> > > etc) to SCHED_FIFO kthread_worker helps with some cases where we
> > > wouldn't manage to flush the updates within the 1ms-before-vblank
> > > deadline resulting in fps drops when there is cursor movement.
> > >
> > > Rob Clark (3):
> > >   drm/msm/gpu: Convert retire/recover work to kthread_worker
> > >   drm/msm/kms: Update msm_kms_init/destroy
> > >   drm/msm/atomic: Convert to per-CRTC kthread_work
> >
> > So i915 has it's own commit worker already for $reasons, but I don't think
> > that's a good path to go down with more drivers. And the problem seems
> > entirely generic in nature ...
>
> I'm not *entirely* sure what your point is here?  This is just
> migrating away from a shared ordered wq to per-crtc kthread so that we
> don't miss vblank deadlines for silly reasons (and then stall on the
> next frame's pageflip because we are still waiting for the cursor
> update to latch).  Kind of like vblank-work but scheduled prior to,
> rather than after, vblank.
>
> And you're right that the problem is partially generic.. hw that (a)
> doesn't have true async (cursor and/or otherwise) updates, and (b) has
> various flush bits that latch register updates on vblank, is not that
> uncommon.  But the current atomic helper API would have to be a bit
> redesigned to look more like the interface between msm_atomic and the
> display backend.  That is a fair bit of churn for re-using a small bit
> of code.

I was making some assumptions about what you're doing, and I was
wrong. So I went and tried to understand what's actually going on
here.

I'm trying to understand what exactly you've added with that async msm
support 2d99ced787e3d. I think this breaks the state structure update
model, you can't access any ->state pointers from the commit functions
after you've called drm_atomic_helper_commit_hw_done, or you might
have a use after free. And that seems to be happening from this commit
work thing you added to your existing commit work that the atomic
helpers provide already.

The various commit functions seem to grab various state objects by
just chasing pointers from the objects (instead of the
drm_atomic_state stuff), so this all feels like it's yolo
free-wheeling.

You also seem to be using the async_commit stuff from the atomic
helpers (which is actually synchronous (i.e. blocking) from the pov of
how the code runs, but seems to be for mdp5 only and not others. Also
your can_do_async still checks for legacy_cursor_update (maybe a
leftover, or needed on !mdp5 platforms) and ->async_update.

I'm thoroughly confused how this all works.

I do agree though that you probably want this to be a real time fifo
kthread worker, like for the vblank worker. Except now that I looked,
I'm not sure it's actually working intended and correct.
-Daniel

> BR,
> -R
>
> > -Daniel
> >
> > >
> > >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  3 +--
> > >  drivers/gpu/drm/msm/adreno/a5xx_preempt.c |  6 ++---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  4 +--
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  4 +--
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  8 +++++-
> > >  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  |  8 +++++-
> > >  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 11 ++++++---
> > >  drivers/gpu/drm/msm/disp/mdp_kms.h        |  9 +++++--
> > >  drivers/gpu/drm/msm/msm_atomic.c          | 25 +++++++++++++++----
> > >  drivers/gpu/drm/msm/msm_drv.h             |  3 ++-
> > >  drivers/gpu/drm/msm/msm_gpu.c             | 30 +++++++++++++++--------
> > >  drivers/gpu/drm/msm/msm_gpu.h             | 13 +++++++---
> > >  drivers/gpu/drm/msm/msm_kms.h             | 23 ++++++++++++++---
> > >  13 files changed, 104 insertions(+), 43 deletions(-)
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
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
