Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8776A271ED0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 11:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgIUJV6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 05:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIUJV6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 05:21:58 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F4AC061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 02:21:57 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id b79so11801598wmb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 02:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=YqKqR0hF6fgI2DEw61l59gzK3p9FhF5q6Czpi0j7p9k=;
        b=jX/yFwZdfpGSLFOVl5chRXI0Ee9qPdjRvBS+RbMFxC6ZQC4zYinasExTnCdSTvwhJn
         dS8dAIzPamllhx3KNwNSRUpkptEr9HU1kyZRS88tVi5/5q8145+smWxo2NtX3dwh+l6f
         UpGiN7Z2BLm1NQGFWK+JYx37uUl1Nk8T9ZI0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=YqKqR0hF6fgI2DEw61l59gzK3p9FhF5q6Czpi0j7p9k=;
        b=e8414Q89Bv8mD6xIf79YfHazKLElJLD80oIUHfo0sUegOMogGa/Cmyaz2G6XiSDu96
         pwEgwNbSVJA0/+C36pc2M8H3f1f+hhhQpxSmAkWaELMu+7dF1MuE5niMnvlUt80ByWeh
         GEJyh1ybKFPxY+J06gamL3+AADUXJGQjzCSmQAYRSnElfZ0Wq9jQP7JSt/BfGBorfBYZ
         pe4a+FCZ3byjzUD+0ZUY75LZAJl4ZiTMPtC/t1nv3r22SdHw5le/PiJPkzDPtBa0EnE1
         Xt2wuWA8/YtXfp4y6Tm77xwoqoNmc4mE7Onx/NgdrWkG/66FRlr3cNRne29LDK5i9cVv
         v0ew==
X-Gm-Message-State: AOAM5327oQFxVEboVStoIxibG97CLl3JWtJ+5o+D5zQSf2BasKpMiFiM
        dYXfkMLYJXumVwWdMklw4Tu8Hg==
X-Google-Smtp-Source: ABdhPJzG+gYGmFE38It6foiCeAH+/A2iG/Ony8iJZLab2ETqfwTDYzQxH/2Pi68PTkv6oIE/Vd4WUQ==
X-Received: by 2002:a7b:c92b:: with SMTP id h11mr28935308wml.6.1600680116416;
        Mon, 21 Sep 2020 02:21:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a83sm18731626wmh.48.2020.09.21.02.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 02:21:55 -0700 (PDT)
Date:   Mon, 21 Sep 2020 11:21:54 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-arm-msm@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, timmurray@google.com,
        Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 0/3] drm: commit_work scheduling
Message-ID: <20200921092154.GJ438822@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-arm-msm@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, timmurray@google.com,
        Tejun Heo <tj@kernel.org>
References: <20200919193727.2093945-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200919193727.2093945-1-robdclark@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Sep 19, 2020 at 12:37:23PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The android userspace treats the display pipeline as a realtime problem.
> And arguably, if your goal is to not miss frame deadlines (ie. vblank),
> it is.  (See https://lwn.net/Articles/809545/ for the best explaination
> that I found.)
> 
> But this presents a problem with using workqueues for non-blocking
> atomic commit_work(), because the SCHED_FIFO userspace thread(s) can
> preempt the worker.  Which is not really the outcome you want.. once
> the required fences are scheduled, you want to push the atomic commit
> down to hw ASAP.
> 
> But the decision of whether commit_work should be RT or not really
> depends on what userspace is doing.  For a pure CFS userspace display
> pipeline, commit_work() should remain SCHED_NORMAL.
> 
> To handle this, convert non-blocking commit_work() to use per-CRTC
> kthread workers, instead of system_unbound_wq.  Per-CRTC workers are
> used to avoid serializing commits when userspace is using a per-CRTC
> update loop.
> 
> A client-cap is introduced so that userspace can opt-in to SCHED_FIFO
> priority commit work.
> 
> A potential issue is that since 616d91b68cd ("sched: Remove
> sched_setscheduler*() EXPORTs") we have limited RT priority levels,
> meaning that commit_work() ends up running at the same priority level
> as vblank-work.  This shouldn't be a big problem *yet*, due to limited
> use of vblank-work at this point.  And if it could be arranged that
> vblank-work is scheduled before signaling out-fences and/or sending
> pageflip events, it could probably work ok to use a single priority
> level for both commit-work and vblank-work.

The part I don't like about this is that it all feels rather hacked
together, and if we add more stuff (or there's some different thing in the
system that also needs rt scheduling) then it doesn't compose.

So question to rt/worker folks: What's the best way to let userspace set
the scheduling mode and priorities of things the kernel does on its
behalf? Surely we're not the first ones where if userspace runs with some
rt priority it'll starve out the kernel workers that it needs. Hardcoding
something behind a subsystem ioctl (which just means every time userspace
changes what it does, we need a new such flag or mode) can't be the right
thing.

Peter, Tejun?

Thanks, Daniel

> 
> Rob Clark (3):
>   drm/crtc: Introduce per-crtc kworker
>   drm/atomic: Use kthread worker for nonblocking commits
>   drm: Add a client-cap to set scheduling mode
> 
>  drivers/gpu/drm/drm_atomic_helper.c | 13 ++++++----
>  drivers/gpu/drm/drm_auth.c          |  4 ++++
>  drivers/gpu/drm/drm_crtc.c          | 37 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_ioctl.c         | 13 ++++++++++
>  include/drm/drm_atomic.h            | 31 ++++++++++++++++++++++++
>  include/drm/drm_crtc.h              | 10 ++++++++
>  include/uapi/drm/drm.h              | 13 ++++++++++
>  7 files changed, 117 insertions(+), 4 deletions(-)
> 
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
