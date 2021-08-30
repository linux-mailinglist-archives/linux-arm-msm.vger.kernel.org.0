Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE0E53FB2D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 11:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234714AbhH3JDj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 05:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232482AbhH3JDj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 05:03:39 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1BF7C061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 02:02:45 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id dm15so20505847edb.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Aug 2021 02:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P0VwUkxlwiDNF5zXlJbfV8JNAaRiNE6CCyXYomEyvrI=;
        b=hfS6z/FKy4eXTdRumbtkBdRZxKmkoRQer3FHqIbFXcWZ8JldQkNBXy8cS5R8V8X199
         wa30n7EaQ1FNoXda2wlwE6FFaoG7Lbp4KuGTyk3b0A1fZJXCCDIgia+z+nDtH21B4z3I
         tlK6+VPFd52FGv9TuLI6/1g7hm/2h15D1abSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P0VwUkxlwiDNF5zXlJbfV8JNAaRiNE6CCyXYomEyvrI=;
        b=s6rAEjvrMM7+TC0NCMxHB6sWaDxjXmZI1mSbnylOMBhxBvFeOSOyCIes6+RRJ3TV4Y
         S47kh9/qT2dCC73DB3J96FO1nzQTI2uP5fN0jTJJ2VBjvzTlNrbu9fdReae9sapJfyYR
         fuiXnUrjr3tUMp9iFGrq2SkQvSVRrSW+ih2jKKGHtw3dOz7HhS+C2Cn4abfZHpmnl557
         EV5KNsNvS7I6y/Y/RvYQmJf/h9jPpixu/jE+SAmcYSgSnajsHGz1G26BmfrutqdL76iH
         kXkeq4B8bx/TYAXlB887tY7fNy5rjLnyaQ2DjLwm80wilJNQjCJdnL9V5hTvE1Ql0qbp
         8ycw==
X-Gm-Message-State: AOAM5326uRpvD8ewJmnxf+UUe/bHe4rkc3fE7MKWt89SE1bliw9r9oZl
        oFzzUiHQHuWeE8R64oh0WFL31Q==
X-Google-Smtp-Source: ABdhPJxYyxhCjR7uuGM8J7R+lgAExXey1usensekyctDskpS84BLeSBbFiTNH3XD6qyITSLiAHrxkQ==
X-Received: by 2002:aa7:cc02:: with SMTP id q2mr22493221edt.154.1630314164602;
        Mon, 30 Aug 2021 02:02:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id cb22sm3862182edb.5.2021.08.30.02.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 02:02:44 -0700 (PDT)
Date:   Mon, 30 Aug 2021 11:02:42 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sean Paul <sean@poorly.run>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH v5 16/20] drm/msm: Don't break exclusive fence ordering
Message-ID: <YSyesupzftTAuWqI@phenom.ffwll.local>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-17-daniel.vetter@ffwll.ch>
 <CAF6AEGtSM_TfCKvHh48WFX4DvhdrWLLi3oCMPz1x2_pCZwbPCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGtSM_TfCKvHh48WFX4DvhdrWLLi3oCMPz1x2_pCZwbPCQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 26, 2021 at 09:16:25AM -0700, Rob Clark wrote:
> On Thu, Aug 5, 2021 at 3:47 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > There's only one exclusive slot, and we must not break the ordering.
> >
> > Adding a new exclusive fence drops all previous fences from the
> > dma_resv. To avoid violating the signalling order we err on the side of
> > over-synchronizing by waiting for the existing fences, even if
> > userspace asked us to ignore them.
> >
> > A better fix would be to us a dma_fence_chain or _array like e.g.
> > amdgpu now uses, but
> > - msm has a synchronous dma_fence_wait for anything from another
> >   context, so doesn't seem to care much,
> > - and it probably makes sense to lift this into dma-resv.c code as a
> >   proper concept, so that drivers don't have to hack up their own
> >   solution each on their own.
> >
> > v2: Improve commit message per Lucas' suggestion.
> >
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: freedreno@lists.freedesktop.org
> 
> a-b

Also pushed to drm-misc-next, thanks for review&testing.
-Daniel

> 
> > ---
> >  drivers/gpu/drm/msm/msm_gem_submit.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > index fb5a2eab27a2..66633dfd58a2 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -330,7 +330,8 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> >                                 return ret;
> >                 }
> >
> > -               if (no_implicit)
> > +               /* exclusive fences must be ordered */
> > +               if (no_implicit && !write)
> >                         continue;
> >
> >                 ret = drm_sched_job_add_implicit_dependencies(&submit->base,
> > --
> > 2.32.0
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
