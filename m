Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBD5293E08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 16:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407774AbgJTOBK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 10:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407773AbgJTOBK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 10:01:10 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0315C061755;
        Tue, 20 Oct 2020 07:01:08 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id c77so1904858wmd.4;
        Tue, 20 Oct 2020 07:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=suu/wcJskTNf+M7IZEIF/kdVRarp7s92n9POLrtQNtQ=;
        b=FemxbPyzEmVU3hGtQqhvq06hD536ltfBzkMus+28Rh+BhyzRwIwVHTlf2PsRSwBeVQ
         QZfOw1+kY8dUn6CxkofwFHw7cdX130vAu2TY9iz57/EaX6az/A5YN+DSDFdJAKf9jqiW
         DVPa42gU8iSzyfuydn5IfrjBE3kOE6afAY9pphb9iMkWJlfsSkS1+WuObe9TfzRbNpf6
         cSer68ywzQYYnTGIz95iA1xEgQMpss42vVtTSJkEnK6vKhpdKZVa3c03GjXtQ+EmwQih
         oHttvAJsCaIlX0UXVZSe52ET8lsl87U2erbauVrbS/1EzX6uhsIZNcOosUPo83MauLCH
         nyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=suu/wcJskTNf+M7IZEIF/kdVRarp7s92n9POLrtQNtQ=;
        b=aCfNIpRt31ZD1hKpM1uBzBoh+l/WA8PcwkBx9jg509uGx3N4tAFLGzTkciTu+950Gi
         Tzhy6p7w9qhXnuGYf+ewQYq6LvfJFiinLfq18hvpRi22peYDu4rGphccJYQcAztRQl0j
         Q7c//boYF0Y2fYINzBXV3AgoHgh9Qtono/fSpBAoIoX9JtA9tYvqL9vqObUQEPMhXgQB
         OQcLOlYas3GjPlSchxy9otkfGX3Kaxfbj1HAedIB+FUpoOmevFF4yNTCSVl5h7F3fMol
         gZwKveCFbeu5mgWsd1R4jzr5ceksw2wwpRB6kza/xoK2M/GcHhnvip6NUJbqMf5T/O5I
         nr6w==
X-Gm-Message-State: AOAM532vScvuWeuIAMYDexXOQ3loQhfHpEWd0GPzB6YCxyhpFfP8owtV
        21o8ohAyIK20zTWA7ubT4GVlBp3UhTRq8pTnf1U=
X-Google-Smtp-Source: ABdhPJya1qVEt8EOAfxUHYvr2OXktAROHxkx3oO2mjvd8SCCQHeKX9EHRe9JFEusx/bdcwxXE3k/iMXGm0nuZ/bSYUc=
X-Received: by 2002:a1c:3243:: with SMTP id y64mr3071202wmy.175.1603202467274;
 Tue, 20 Oct 2020 07:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201019211101.143327-1-robdclark@gmail.com> <20201020082404.GJ401619@phenom.ffwll.local>
In-Reply-To: <20201020082404.GJ401619@phenom.ffwll.local>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 20 Oct 2020 07:00:55 -0700
Message-ID: <CAF6AEGuT6ZSpitNS0eBcjKhAVW1QBg+uPJQQkBLckOk=_GBx=A@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/msm: kthread_worker conversion
To:     Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
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

On Tue, Oct 20, 2020 at 1:24 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Oct 19, 2020 at 02:10:50PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > In particular, converting the async atomic commit (for cursor updates,
> > etc) to SCHED_FIFO kthread_worker helps with some cases where we
> > wouldn't manage to flush the updates within the 1ms-before-vblank
> > deadline resulting in fps drops when there is cursor movement.
> >
> > Rob Clark (3):
> >   drm/msm/gpu: Convert retire/recover work to kthread_worker
> >   drm/msm/kms: Update msm_kms_init/destroy
> >   drm/msm/atomic: Convert to per-CRTC kthread_work
>
> So i915 has it's own commit worker already for $reasons, but I don't think
> that's a good path to go down with more drivers. And the problem seems
> entirely generic in nature ...

I'm not *entirely* sure what your point is here?  This is just
migrating away from a shared ordered wq to per-crtc kthread so that we
don't miss vblank deadlines for silly reasons (and then stall on the
next frame's pageflip because we are still waiting for the cursor
update to latch).  Kind of like vblank-work but scheduled prior to,
rather than after, vblank.

And you're right that the problem is partially generic.. hw that (a)
doesn't have true async (cursor and/or otherwise) updates, and (b) has
various flush bits that latch register updates on vblank, is not that
uncommon.  But the current atomic helper API would have to be a bit
redesigned to look more like the interface between msm_atomic and the
display backend.  That is a fair bit of churn for re-using a small bit
of code.

BR,
-R

> -Daniel
>
> >
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  3 +--
> >  drivers/gpu/drm/msm/adreno/a5xx_preempt.c |  6 ++---
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  4 +--
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  4 +--
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  8 +++++-
> >  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  |  8 +++++-
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 11 ++++++---
> >  drivers/gpu/drm/msm/disp/mdp_kms.h        |  9 +++++--
> >  drivers/gpu/drm/msm/msm_atomic.c          | 25 +++++++++++++++----
> >  drivers/gpu/drm/msm/msm_drv.h             |  3 ++-
> >  drivers/gpu/drm/msm/msm_gpu.c             | 30 +++++++++++++++--------
> >  drivers/gpu/drm/msm/msm_gpu.h             | 13 +++++++---
> >  drivers/gpu/drm/msm/msm_kms.h             | 23 ++++++++++++++---
> >  13 files changed, 104 insertions(+), 43 deletions(-)
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
