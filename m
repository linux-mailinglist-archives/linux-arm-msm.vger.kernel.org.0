Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6990735C99E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Apr 2021 17:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242755AbhDLPUY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Apr 2021 11:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239412AbhDLPUX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Apr 2021 11:20:23 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76296C061574;
        Mon, 12 Apr 2021 08:20:05 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id z24-20020a1cf4180000b029012463a9027fso7106964wma.5;
        Mon, 12 Apr 2021 08:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=CvbzxVmPS3hVkxLnzRYgOxFAxnXKIGk09rQ9j7ZYOeQ=;
        b=OJLboiBFRTT8GbXnqKZHaxLxk4WyKoLsz33MrdQFiH1KDr6A+S8Fuy0chAzLWGQwdq
         kvcZraotTFlseRMN38Lg0LCLjU7MkSSutGFJ1142JJxGeMJEUiBSKuE7uFSwpT8anmXw
         w9qlKPM8V8UQwkk3LXzQ9jLZD2dh2ZZ6tPzqMSO3c9sChO308y6Gfum4WQqgmNShLHwm
         ZyION5eg4E5dHifid4mBGbgla1fJVQKTMo+I+kD/pehx4R1QiPsSX5Zx4FAWSD8NcMNY
         L1szYZkcJrg8Ov1FoT7zxqBAfJURRiE7JK2cpEy5R+vVY/fG3i4UuJK6FOE5NNTGG2B0
         gPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=CvbzxVmPS3hVkxLnzRYgOxFAxnXKIGk09rQ9j7ZYOeQ=;
        b=Omk5RpTycnfroBEPJnxmRHbzuXIeKUU7nTTut9FUsRTRlkeudR1x3wt3IcXwmYGih4
         T+PSzoiSxnt7vXIZlhkRjTBp4akmstJU+UdAL1+KIDKKV9s+UmZ0gNAtQ9AyLG0FfLgT
         a7sVe/44pYa0cdZ4SdN/C7HASApDPNR7b2su6oOoYlCXQMyVn3Ne1M1pxqzZOmglfhlb
         9yg7mINwe6TJCCYOmmiTbaNIM7voFPNHPOnE7AJsRKs3QzoTDmiNU1i+/x1q/7t8Uw53
         0VeTGPQ1dn7a2MQIphrvsQ5nSuhulbQiwVLyUm/ME4Vexnxap7noy7LzRTN2p49W7+ec
         2lqw==
X-Gm-Message-State: AOAM531mDhREwBM++GQeCpzR5JwriHlbmfSQcjM5qDPmaQqDcLwyQFoT
        WHOD9yMQppbRpkdhOVmdqvA8VuprIyWxZU3a66g=
X-Google-Smtp-Source: ABdhPJw3+xfhIiqHzE4sXndlY8DDlfeVvlaNzWB+1RepEbc49byBhz5BmdiPQ8YwLjEM2ImZRZp9YJAO2bJcVfSB+Ms=
X-Received: by 2002:a7b:c012:: with SMTP id c18mr25316690wmb.94.1618240804111;
 Mon, 12 Apr 2021 08:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210405174532.1441497-1-robdclark@gmail.com> <YG7l0LwVQ2s4Y0Sa@phenom.ffwll.local>
 <CAF6AEGsH2gbKv-Q04gRbjz=ue1TF7S_6DXa06bvYPcmYvG684w@mail.gmail.com> <YHRZA+WBbWrUdpAV@phenom.ffwll.local>
In-Reply-To: <YHRZA+WBbWrUdpAV@phenom.ffwll.local>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 12 Apr 2021 08:23:33 -0700
Message-ID: <CAF6AEGv+ewxwtP4PN1G_gjdE0DW_LiukYbZoL-isFsGTRbcbOQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] drm/msm: Swappable GEM objects
To:     Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 12, 2021 at 7:28 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Apr 08, 2021 at 08:23:42AM -0700, Rob Clark wrote:
> > On Thu, Apr 8, 2021 at 4:15 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Mon, Apr 05, 2021 at 10:45:23AM -0700, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > One would normally hope not to be under enough memory pressure to need
> > > > to swap GEM objects to disk backed swap.  But memory backed zram swap
> > > > (as enabled on chromebooks, for example) can actually be quite fast
> > > > and useful on devices with less RAM.  On a 4GB device, opening up ~4
> > > > memory intensive web pages (in separate windows rather than tabs, to try
> > > > and prevent tab discard), I see ~500MB worth of GEM objects, of which
> > > > maybe only 10% are active at any time, and with unpin/evict enabled,
> > > > only about half resident (which is a number that gets much lower if you
> > > > simulate extreme memory pressure).  Assuming a 2:1 compression ratio (I
> > > > see a bit higher in practice, but cannot isolate swapped out GEM pages
> > > > vs other), that is like having an extra 100+MB of RAM, or more under
> > > > higher memory pressure.
> > > >
> > > > Rob Clark (8):
> > > >   drm/msm: ratelimit GEM related WARN_ON()s
> > > >   drm/msm: Reorganize msm_gem_shrinker_scan()
> > > >   drm/msm: Clear msm_obj->sgt in put_pages()
> > > >   drm/msm: Split iova purge and close
> > > >   drm/msm: Add $debugfs/gem stats on resident objects
> > > >   drm/msm: Track potentially evictable objects
> > > >   drm/msm: Small msm_gem_purge() fix
> > > >   drm/msm: Support evicting GEM objects to swap
> > >
> > > Given how much entertainement shrinkers are, should we aim for more common
> > > code here?
> > >
> > > Christian has tons of fun with adding something like this for ttm (well
> > > different shades of grey). i915 is going to adopt ttm, at least for
> > > discrete.
> > >
> > > The locking is also an utter pain, and msm seems to still live a lot in
> > > its own land here. I think as much as possible a standard approach here
> > > would be really good, ideally maybe as building blocks shared between ttm
> > > and gem-shmem drivers ...
> >
> > I don't disagree.. but also replacing the engines on an airplane
> > mid-flight isn't a great option either.. ;-)
> >
> > The hard part (esp. wrt to locking) is tracking the state of a given
> > bo.. ie. is it active, active+purgable, inactive+purgable,
> > inactive+unpinnable, etc.  Currently the shmem helpers don't really
> > provide anything here.  If they did, I suppose they could provide some
> > shrinker helpers as well.  Unfortunately these days I barely have
> > enough time for drm/msm, let alone bolting this onto the shmem
> > helpers.  I would recommend that if someone wanted to do this, that
> > they look at recent drm/msm shrinker patches that I've sent (ie. make
> > shrinker->count() lockless, and drop the locks in shrinker->scan()
> > body.. when the system is under heavy memory pressure, you start
> > getting shrinker called from all the threads so contention for mm_lock
> > can be a really bad problem)
> >
> > (Well, the other potential problem is that drm/msm has a lot of
> > different possible iommu pairings across the generations, so there is
> > some potential here to uncover exciting new bugs.. the locking at
> > least is the same for all the generations and pretty easy to test with
> > and without lockdep with some tests that push essentially all memory
> > into swap)
>
> So what we aimed for with i915 and discrete gpu is to first align on
> locking with dma_resv_lock for all buffer state, plus a bunch of
> lru/allocator locks for lists and stuff.
>
> And then with more aligned locking, figure out how to maybe share more
> code.
>
> The trouble is that right now neither shmem helpers, nor drivers using
> them, are really using dma_resv_lock to protect their per-buffer state.

We are actually already using dma_resv_lock() since a few release
cycles back.. msm_gem_lock() and friends are a wrapper around that
from the migration away from using our own lock).. the mm_lock is
symply protecting the lists, not the objects

> So yeah it's a bit an awkward situation, and I don't know myself really
> how to get out of it. Lack of people with tons of free time doesn't help
> much.
>
> So best case I think is that every time we touch helpers or drivers
> locking in a big way, we check whether it's at least slightly going
> towards dma_resv_lock or not. And at least make sure we're not going
> backwards, and maybe not spin wheels at standstill.
>
> I guess my question is, what would be good to have to make sure we at
> least all agree on the overall direction?

I guess if gem_shmem users aren't already using resv lock, moving in
that directly would be a good idea.  Maybe it would make sense to
build more object state tracking into gem_shmem helpers (ie. so you
can know which buffers are active/purgable/unpinnable/etc without
traversing a list of *all* gem objects).. that seems like pushing it
more in the direction of being ttm-style frameworky compared to the
simple helper API that it is now.  But maybe that is a good thing?

BR,
-R

> -Daniel
>
> >
> > BR,
> > -R
> >
> > > -Daniel
> > >
> > > >
> > > >  drivers/gpu/drm/msm/msm_drv.c          |   2 +-
> > > >  drivers/gpu/drm/msm/msm_drv.h          |  13 ++-
> > > >  drivers/gpu/drm/msm/msm_gem.c          | 155 +++++++++++++++++--------
> > > >  drivers/gpu/drm/msm/msm_gem.h          |  68 +++++++++--
> > > >  drivers/gpu/drm/msm/msm_gem_shrinker.c | 129 ++++++++++++--------
> > > >  drivers/gpu/drm/msm/msm_gpu_trace.h    |  13 +++
> > > >  6 files changed, 272 insertions(+), 108 deletions(-)
> > > >
> > > > --
> > > > 2.30.2
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
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
