Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1E4A358812
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 17:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232077AbhDHPU1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 11:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232011AbhDHPU1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 11:20:27 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB17FC061760;
        Thu,  8 Apr 2021 08:20:15 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id y20-20020a1c4b140000b029011f294095d3so3144650wma.3;
        Thu, 08 Apr 2021 08:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=v7qcvuTJQnTWwOB3Ha6/Syy7/aYA0Qf/BL1AwDzfuGU=;
        b=e3ZNlpbpavIjcSN8dIxYOE/rXgDXvsXGNe5Ir4myMhVg15nZr9dHEFBzEJZ1RIJEHH
         lFss/0FwJk6YqrYFGwcOwy4wxTXLv5vNP4drLHjRpIEj5c92ZGLzcM/1oJC8Bx2/ctsG
         rxzJ05izioG/KGa1Ww9FJ4SyhfnA3BUCjaQoW6xHxdRDUq1Cfqihsu41kzj1x3DpZxB/
         yVS6yKPyHbUKfUguXhrbdNChUuaTIm8RhsDhMO0YQ2KkmueNSFLJ7ukwaxtOLTg4tily
         /W3vhMYNxmLGBpqInhUPtsU9kvqLmvBW3tARkD4gSP8nzP2i5ZNb79cE+dg0nwu5e0ZA
         m0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=v7qcvuTJQnTWwOB3Ha6/Syy7/aYA0Qf/BL1AwDzfuGU=;
        b=eNCFR/m5av5nG1NlN6Rxf07KFIxAZvbX7SzlUFTair6Oq9DGTLbNzQyhsx4Fr5IvJU
         r5L4JzSryNoajG3cpb4MiYW97rt4Bl/oDWfU/SlTSgpE831Q1uRzISYvZ6V/v5mpBWs7
         e2jDSS9j97VXLcnsFCuXI8o4abOF1IPTAsRMZuyLkoSqUCj69JxeVB2OZY639liIwVhf
         KktRE2IcQHRJuM1Flz+ohhPkbzotP0L+onyf7N8SIbiqEfaxlqqesqd6BcphaaSbvKvq
         Hi7mp0NANJjSDwRDUjsgz9qP+xrMEQqhoRe39BEtcvF8/sINTT6KirntsR3TV5A1s5VU
         wz9g==
X-Gm-Message-State: AOAM530wkEd0GajQ+NrDdXGvMaoSlvKJtJrUsh5xnp/wAMuQ4PLM6S54
        ZTTvqk6OBeS17lEDKy1BzQLaZd3uEp7aPdOaD68=
X-Google-Smtp-Source: ABdhPJwnEZiOVu05xL4G7IVf4f04NXBPNtQO9QG4ZKDgpvpOib9wUr5K++bP76nBv0xlgyUACj0JeK94OKvdYJeiSJA=
X-Received: by 2002:a05:600c:4fd0:: with SMTP id o16mr9194147wmq.123.1617895214533;
 Thu, 08 Apr 2021 08:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210405174532.1441497-1-robdclark@gmail.com> <YG7l0LwVQ2s4Y0Sa@phenom.ffwll.local>
In-Reply-To: <YG7l0LwVQ2s4Y0Sa@phenom.ffwll.local>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 8 Apr 2021 08:23:42 -0700
Message-ID: <CAF6AEGsH2gbKv-Q04gRbjz=ue1TF7S_6DXa06bvYPcmYvG684w@mail.gmail.com>
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

On Thu, Apr 8, 2021 at 4:15 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Apr 05, 2021 at 10:45:23AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > One would normally hope not to be under enough memory pressure to need
> > to swap GEM objects to disk backed swap.  But memory backed zram swap
> > (as enabled on chromebooks, for example) can actually be quite fast
> > and useful on devices with less RAM.  On a 4GB device, opening up ~4
> > memory intensive web pages (in separate windows rather than tabs, to try
> > and prevent tab discard), I see ~500MB worth of GEM objects, of which
> > maybe only 10% are active at any time, and with unpin/evict enabled,
> > only about half resident (which is a number that gets much lower if you
> > simulate extreme memory pressure).  Assuming a 2:1 compression ratio (I
> > see a bit higher in practice, but cannot isolate swapped out GEM pages
> > vs other), that is like having an extra 100+MB of RAM, or more under
> > higher memory pressure.
> >
> > Rob Clark (8):
> >   drm/msm: ratelimit GEM related WARN_ON()s
> >   drm/msm: Reorganize msm_gem_shrinker_scan()
> >   drm/msm: Clear msm_obj->sgt in put_pages()
> >   drm/msm: Split iova purge and close
> >   drm/msm: Add $debugfs/gem stats on resident objects
> >   drm/msm: Track potentially evictable objects
> >   drm/msm: Small msm_gem_purge() fix
> >   drm/msm: Support evicting GEM objects to swap
>
> Given how much entertainement shrinkers are, should we aim for more common
> code here?
>
> Christian has tons of fun with adding something like this for ttm (well
> different shades of grey). i915 is going to adopt ttm, at least for
> discrete.
>
> The locking is also an utter pain, and msm seems to still live a lot in
> its own land here. I think as much as possible a standard approach here
> would be really good, ideally maybe as building blocks shared between ttm
> and gem-shmem drivers ...

I don't disagree.. but also replacing the engines on an airplane
mid-flight isn't a great option either.. ;-)

The hard part (esp. wrt to locking) is tracking the state of a given
bo.. ie. is it active, active+purgable, inactive+purgable,
inactive+unpinnable, etc.  Currently the shmem helpers don't really
provide anything here.  If they did, I suppose they could provide some
shrinker helpers as well.  Unfortunately these days I barely have
enough time for drm/msm, let alone bolting this onto the shmem
helpers.  I would recommend that if someone wanted to do this, that
they look at recent drm/msm shrinker patches that I've sent (ie. make
shrinker->count() lockless, and drop the locks in shrinker->scan()
body.. when the system is under heavy memory pressure, you start
getting shrinker called from all the threads so contention for mm_lock
can be a really bad problem)

(Well, the other potential problem is that drm/msm has a lot of
different possible iommu pairings across the generations, so there is
some potential here to uncover exciting new bugs.. the locking at
least is the same for all the generations and pretty easy to test with
and without lockdep with some tests that push essentially all memory
into swap)

BR,
-R

> -Daniel
>
> >
> >  drivers/gpu/drm/msm/msm_drv.c          |   2 +-
> >  drivers/gpu/drm/msm/msm_drv.h          |  13 ++-
> >  drivers/gpu/drm/msm/msm_gem.c          | 155 +++++++++++++++++--------
> >  drivers/gpu/drm/msm/msm_gem.h          |  68 +++++++++--
> >  drivers/gpu/drm/msm/msm_gem_shrinker.c | 129 ++++++++++++--------
> >  drivers/gpu/drm/msm/msm_gpu_trace.h    |  13 +++
> >  6 files changed, 272 insertions(+), 108 deletions(-)
> >
> > --
> > 2.30.2
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
