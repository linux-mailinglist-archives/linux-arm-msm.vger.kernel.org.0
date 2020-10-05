Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442CA283C3A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 18:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727224AbgJEQRO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 12:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727211AbgJEQRO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 12:17:14 -0400
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC6BEC0613CE;
        Mon,  5 Oct 2020 09:17:13 -0700 (PDT)
Received: by mail-vk1-xa43.google.com with SMTP id q13so1877582vkd.0;
        Mon, 05 Oct 2020 09:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=QHfrL0vnZkCKeKCtvZvw1Ln46V81wH7BkrurZ5zUFZk=;
        b=Wevs5QjZluOaRR1AOZGAEhuHk0w+X16ebwlSNMFfb39m/CXX9klz9WZCmFoGZHnkrU
         d4elvjxcQpllgt3+nlR3BH087M2PDxC8iLxhWegBseS38D6ZNgrULbb/sN09ojA8fSkk
         j+vHB8rG2dkhfC+HkV0Dtl78x8U6BuKZR63PCPu+f0gRNQVvy4MtAZxrfbD274IyBaBJ
         9chqecOlrYAlPhUrNEZeIX9hlwjFlYe8wfdjxjR+XA2icGGExvaTunU0qxG+LdS0wxMC
         u26TrR3sjLHiOP1AH2KiBnpEgeGwgBhTjBbV7Rm0cJTQ3e11kgNE2fYKohGg8SirpGnL
         wkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=QHfrL0vnZkCKeKCtvZvw1Ln46V81wH7BkrurZ5zUFZk=;
        b=XVvWJfxajUYGd0RIDlK0YFDck2ycizUzTW00RVA5JLbPcpMmvjAON6zrUYZc1hYz0l
         /k5NkcZNHQOjEUyDHlcFilzb5+Jogo/YPCiET0dTxAKeCnsKmF3oUTBVGBm2BRnwF9Uh
         wapynp4/z7AbCdFFqPINMUrXMN/+X5HVCyxZ1w/T8BtIcAT1EbnOpznUNXGv4MHv8G/7
         28wuN8SW2hm/dtbr4EhcKLEYPZ2J5CNLe6YMv/7u1LGxP5X7iq5I2tyb+x4ynck1NAcx
         Ql1RmBKPFPmMMr6wS7R09xiZxJpqpoL8PULB/XGu9HZ21FPs0K9NylnmW8QNrfkXPJtn
         NBJA==
X-Gm-Message-State: AOAM531ojA8j73g7HJcIBlpvu+1N33vr0lElN2aThkLgIW8mrVRV2rQg
        rrMBl8YdXzGZIcaIPHXiQHAR6b5jPFV/o4fhM6o=
X-Google-Smtp-Source: ABdhPJznNzIHUiu7fkeGWHOPhlZ6vkhgyjAwLPnbGS9WDmUCIW5CFvWNDVtMLRxauYUQ5TUjesyG7FHNdP49l4+whVg=
X-Received: by 2002:a1f:a290:: with SMTP id l138mr202080vke.9.1601914632799;
 Mon, 05 Oct 2020 09:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201004192152.3298573-1-robdclark@gmail.com> <20201005092419.15608-1-hdanton@sina.com>
 <20201005140203.GS438822@phenom.ffwll.local>
In-Reply-To: <20201005140203.GS438822@phenom.ffwll.local>
From:   =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>
Date:   Mon, 5 Oct 2020 18:17:01 +0200
Message-ID: <CAOeoa-cqyb8NZJnJdY+A2H680+C4H0WzXhp-uYj8Fg093BqAnw@mail.gmail.com>
Subject: Re: [PATCH 13/14] drm/msm: Drop struct_mutex in shrinker path
To:     Hillf Danton <hdanton@sina.com>, Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 5, 2020 at 4:02 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Oct 05, 2020 at 05:24:19PM +0800, Hillf Danton wrote:
> >
> > On Sun,  4 Oct 2020 12:21:45
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Now that the inactive_list is protected by mm_lock, and everything
> > > else on per-obj basis is protected by obj->lock, we no longer depend
> > > on struct_mutex.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/msm/msm_gem.c          |  1 -
> > >  drivers/gpu/drm/msm/msm_gem_shrinker.c | 54 --------------------------
> > >  2 files changed, 55 deletions(-)
> > >
> > [...]
> >
> > > @@ -71,13 +33,8 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
> > >  {
> > >     struct msm_drm_private *priv =
> > >             container_of(shrinker, struct msm_drm_private, shrinker);
> > > -   struct drm_device *dev = priv->dev;
> > >     struct msm_gem_object *msm_obj;
> > >     unsigned long freed = 0;
> > > -   bool unlock;
> > > -
> > > -   if (!msm_gem_shrinker_lock(dev, &unlock))
> > > -           return SHRINK_STOP;
> > >
> > >     mutex_lock(&priv->mm_lock);
> >
> > Better if the change in behavior is documented that SHRINK_STOP will
> > no longer be needed.
>
> btw I read through this and noticed you have your own obj lock, plus
> mutex_lock_nested. I strongly recommend to just cut over to dma_resv_lock
> for all object lock needs (soc drivers have been terrible with this
> unfortuntaly), and in the shrinker just use dma_resv_trylock instead of
> trying to play clever games outsmarting lockdep.
>
> I recently wrote an entire blog length rant on why I think
> mutex_lock_nested is too dangerous to be useful:
>
> https://blog.ffwll.ch/2020/08/lockdep-false-positives.html
>
> Not anything about this here, just general comment. The problem extends to
> shmem helpers and all that also having their own locks for everything.

This is definitely a tangible improvement though - very happy to see
msm_gem_shrinker_lock() go.

Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>

> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
