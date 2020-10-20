Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76B77294101
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 19:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395107AbgJTRCZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 13:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395101AbgJTRCZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 13:02:25 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6392EC0613CE
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 10:02:25 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id h10so2869431oie.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 10:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P4+C5p+llcwaESK7UDZfwOBx7DxHfZ9HboztqP1iS4g=;
        b=lgMz8sdcu9sQoMGgIE+liuBWO+twfZy/QEazS/rCG3M8l/5Z7Pnh2eZLUsEcAjg7pi
         /d1J5pYJhBXFThen+TqXCn/G7XFPZX6BohXhBND20NAeI2UfM68dJ73J8+AmkV2P+hTN
         T5amaeHDUhBP1IY8syyaozxGAz7c22VGCvZaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P4+C5p+llcwaESK7UDZfwOBx7DxHfZ9HboztqP1iS4g=;
        b=JiJzLX2WY75DvXn1CLf+EbEJk4+DCWsiPun3TSYX8Q/AazH24tbrTeRie3P/M/NRUA
         pbTaQzJTfXioPzxUIdy0SguwiCH2Fr8yWKUomagPJd6+C5HgV7YB8xNNdJGkqTpfsexc
         2fAcAaGwmVTGQgzmb7ZvTbRfy2xaZujZP8jRb8b82ly7gtxijt6qEbVmtEwYiQAcGioN
         Qc++M3U7N/dh1l/CKri1faMnN8NRl9e6ZpqF+VG8a5XLpBlh1bY11t61xr4fn9LEXkch
         K3AKtFj6XqCHrawqFU4kWlw30hTq2GskvuHigS87gjwGd8uFlCKvjK7GOyXKcHECizr9
         3QLQ==
X-Gm-Message-State: AOAM530x5z8QOs+iDoZ47O0GnWZU5JGJsqeRrxyV/FNXuNkAP358le02
        QqviymrvClke0WXtDty4nRvU7zf+Chu7RMIxSpE0ng==
X-Google-Smtp-Source: ABdhPJziCirkuLc2wSExzSHGfg7J7PUVMZw/wNFmMnlb/m4Wq1PqAKS7o974V3wCQ/yVgCKVfDf1DWuPJoMBwnDl9Po=
X-Received: by 2002:aca:cc01:: with SMTP id c1mr2523946oig.128.1603213344582;
 Tue, 20 Oct 2020 10:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201019211101.143327-1-robdclark@gmail.com> <20201020082404.GJ401619@phenom.ffwll.local>
 <CAF6AEGuT6ZSpitNS0eBcjKhAVW1QBg+uPJQQkBLckOk=_GBx=A@mail.gmail.com>
 <CAKMK7uEg-iz2zK6E0RFA-JQ+GfjuUcnrdu+e_3FWq9E9_9WUZA@mail.gmail.com> <CAF6AEGuF_76hMHa-n7VYHY+sSKGTt=gTBh8r+2992Bhx-RE61A@mail.gmail.com>
In-Reply-To: <CAF6AEGuF_76hMHa-n7VYHY+sSKGTt=gTBh8r+2992Bhx-RE61A@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 20 Oct 2020 19:02:13 +0200
Message-ID: <CAKMK7uEHSsgVDsFnpedx2_w0B8ST3RKA1O62NXOtDr2bCrie+A@mail.gmail.com>
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

On Tue, Oct 20, 2020 at 5:08 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Oct 20, 2020 at 7:29 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Oct 20, 2020 at 4:01 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Tue, Oct 20, 2020 at 1:24 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Mon, Oct 19, 2020 at 02:10:50PM -0700, Rob Clark wrote:
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > In particular, converting the async atomic commit (for cursor updates,
> > > > > etc) to SCHED_FIFO kthread_worker helps with some cases where we
> > > > > wouldn't manage to flush the updates within the 1ms-before-vblank
> > > > > deadline resulting in fps drops when there is cursor movement.
> > > > >
> > > > > Rob Clark (3):
> > > > >   drm/msm/gpu: Convert retire/recover work to kthread_worker
> > > > >   drm/msm/kms: Update msm_kms_init/destroy
> > > > >   drm/msm/atomic: Convert to per-CRTC kthread_work
> > > >
> > > > So i915 has it's own commit worker already for $reasons, but I don't think
> > > > that's a good path to go down with more drivers. And the problem seems
> > > > entirely generic in nature ...
> > >
> > > I'm not *entirely* sure what your point is here?  This is just
> > > migrating away from a shared ordered wq to per-crtc kthread so that we
> > > don't miss vblank deadlines for silly reasons (and then stall on the
> > > next frame's pageflip because we are still waiting for the cursor
> > > update to latch).  Kind of like vblank-work but scheduled prior to,
> > > rather than after, vblank.
> > >
> > > And you're right that the problem is partially generic.. hw that (a)
> > > doesn't have true async (cursor and/or otherwise) updates, and (b) has
> > > various flush bits that latch register updates on vblank, is not that
> > > uncommon.  But the current atomic helper API would have to be a bit
> > > redesigned to look more like the interface between msm_atomic and the
> > > display backend.  That is a fair bit of churn for re-using a small bit
> > > of code.
> >
> > I was making some assumptions about what you're doing, and I was
> > wrong. So I went and tried to understand what's actually going on
> > here.
> >
> > I'm trying to understand what exactly you've added with that async msm
> > support 2d99ced787e3d. I think this breaks the state structure update
> > model, you can't access any ->state pointers from the commit functions
> > after you've called drm_atomic_helper_commit_hw_done, or you might
> > have a use after free. And that seems to be happening from this commit
> > work thing you added to your existing commit work that the atomic
> > helpers provide already.
> >
> > The various commit functions seem to grab various state objects by
> > just chasing pointers from the objects (instead of the
> > drm_atomic_state stuff), so this all feels like it's yolo
> > free-wheeling.
> >
> > You also seem to be using the async_commit stuff from the atomic
> > helpers (which is actually synchronous (i.e. blocking) from the pov of
> > how the code runs, but seems to be for mdp5 only and not others. Also
> > your can_do_async still checks for legacy_cursor_update (maybe a
> > leftover, or needed on !mdp5 platforms) and ->async_update.
> >
> > I'm thoroughly confused how this all works.
>
> The legacy_cursor_update is really the thing that motivated the async
> commit support in the first place.  Sadly we still have userspace that
> expects to be able to use legacy cursor API, and that it will be
> nonblocking (and not cause fps drop).  (I'm not a fan of the legacy
> cursor UAPI.. don't hate the player..)

Yeah this is why we have these atomic_async_check/commit functions,
and msm is even using them for mdp5. Not hating the player here at
all.

> The premise is to do everything in terms of crtc_mask, although yeah,
> it looks like there are a few points that need to look at things like
> crtc->state->active.  The only point in msm-atomic itself that does
> this is vblank_get/put(), possibly we can fix drm_vblank instead and
> drop that workaround (see 43906812eaab06423f56af5cca9a9fcdbb4ac454)
>
> The rest of the async part is really just supposed to be writing the
> appropriate flush reg(s) and waiting until flush completes, although
> dpu's excess layering makes this harder than it needs to be.
>
> In practice, the kms->wait_flush() at the top of
> msm_atomic_commit_tail() will block until a pending async commit
> completes (this is where we hit the fps drop if we miss vblank
> deadline), so I don't *think* you can trigger a use-after-free.  But
> the dpu code could be better cleaned up to have less obj->state
> dereference in the kms->flush_commit(crtc_mask)/etc path.

Hm this is more or less what the atomic_async_commit/check stuff was
meant to help facilitate too, and now msm is using that for mdp5, but
not for other pieces. That seems very confusing.

Also I'm not sure how this works if you still end up flushing anyway,
since then you'd be back to doing everything in-order. Or will an
normal atomic flip push all the cursor updates to the next frame (in
which case you really should be able to do this all with async helpers
we have instead of hand-rolling a bunch of it in strange places).

You probably still need the worker to push out the update at the right
time, and I'm not sure what some good locking for that is. At least
I'm not really seeing how you sync that worker against a racing update
for the next cursor move.
-Daniel


> BR,
> -R
>
> > I do agree though that you probably want this to be a real time fifo
> > kthread worker, like for the vblank worker. Except now that I looked,
> > I'm not sure it's actually working intended and correct.
> > -Daniel
> >
> > > BR,
> > > -R
> > >
> > > > -Daniel
> > > >
> > > > >
> > > > >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  3 +--
> > > > >  drivers/gpu/drm/msm/adreno/a5xx_preempt.c |  6 ++---
> > > > >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  4 +--
> > > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  4 +--
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  8 +++++-
> > > > >  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  |  8 +++++-
> > > > >  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 11 ++++++---
> > > > >  drivers/gpu/drm/msm/disp/mdp_kms.h        |  9 +++++--
> > > > >  drivers/gpu/drm/msm/msm_atomic.c          | 25 +++++++++++++++----
> > > > >  drivers/gpu/drm/msm/msm_drv.h             |  3 ++-
> > > > >  drivers/gpu/drm/msm/msm_gpu.c             | 30 +++++++++++++++--------
> > > > >  drivers/gpu/drm/msm/msm_gpu.h             | 13 +++++++---
> > > > >  drivers/gpu/drm/msm/msm_kms.h             | 23 ++++++++++++++---
> > > > >  13 files changed, 104 insertions(+), 43 deletions(-)
> > > > >
> > > > > --
> > > > > 2.26.2
> > > > >
> > > > > _______________________________________________
> > > > > dri-devel mailing list
> > > > > dri-devel@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
