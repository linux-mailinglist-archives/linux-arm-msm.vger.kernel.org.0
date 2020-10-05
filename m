Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFEDA283CC9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 18:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727221AbgJEQtv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 12:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbgJEQtv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 12:49:51 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EF96C0613CE;
        Mon,  5 Oct 2020 09:49:51 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h7so6758572wre.4;
        Mon, 05 Oct 2020 09:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cmy513aiCAKF5upvIJrZZZX0KF0VJYYwzL6n+RYf11I=;
        b=hr1n1nmFEEAdc+6X9eVIA7H6F4OuL0MJx7a0AXWZNvly8e9U9Bv3F3yI4GcfxAuWa0
         UkVOm2+8LGlyBofMkEifpRTcmKH5ESdbbeeTNdvJpoUEjWFASW3o5endWzeqz3Tz110C
         DWdYmVIKTkQLGMETSNrsFm9s1vp73pgjDyr+SPplVrJTrLoXF1pMv9jJD2mVLxkeOU39
         0i89EAGMWh8YrEK10YO4D2kV2kthuq1keUtJLukivFIs2kVrSXZrW1ZWU+va3mU+Wpdh
         IPl0VnfcjMrF8Q6bowVw/Za5dLBbscDV4JCOZ9lJSVrnSih4AD+6Ho1VdqwITThcqMSn
         C4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cmy513aiCAKF5upvIJrZZZX0KF0VJYYwzL6n+RYf11I=;
        b=PH8ArViOxTppevnSXaBqcbSqPzOp66IR2QPwP6bmw8Z95RtGkG3fIq6Uau3I+w2gES
         e6PvW0ek7fugil+3G8coZLgvSXe4W2RmgNhAsW9iVye+/7mYqjT8FBFLe0D8V7g8/j/t
         HKUHPn9s0bIkXnOFnHs20axT7NcwA8U6W9um6dVVN9zxBFJd+aXtozwMgrYViX8Hpylw
         yttUXE254IYH3ULJCsrirAQYJc7BGPyMpW2mVgbd6NuTH6SBam+8bPCiIhY7HfxPw010
         VkES2QTgVw8ceJ5k2lLo/+poJmY5iJhGRJMxZgnBHj3YJEjKCf19uc2GFAO3ioJxVBho
         VKlA==
X-Gm-Message-State: AOAM532Kz7K2P9k4G3gRDariY+UAGsvoL/GV/1ekVPNPqHrv4yeSyuGZ
        UskcdD32MXwLVsyeGG6l5Z9RUYfyABl2EmA0HfQgMsO304ww0w==
X-Google-Smtp-Source: ABdhPJzTfFXUedYJkqNhnmDc2V1Hm1A4czYej5pOfm13kmGDdChZ59bZUbBhEi7CGyWZfe2PEzwOqMAIZZj0XsghJWo=
X-Received: by 2002:a5d:4bcf:: with SMTP id l15mr348661wrt.132.1601916589672;
 Mon, 05 Oct 2020 09:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201004192152.3298573-1-robdclark@gmail.com> <20201005092419.15608-1-hdanton@sina.com>
 <20201005140203.GS438822@phenom.ffwll.local>
In-Reply-To: <20201005140203.GS438822@phenom.ffwll.local>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 5 Oct 2020 09:49:37 -0700
Message-ID: <CAF6AEGveqvvv9MfBMAr34y9664fPouGjwPrK=v9OLVXv4dHzxg@mail.gmail.com>
Subject: Re: [PATCH 13/14] drm/msm: Drop struct_mutex in shrinker path
To:     Hillf Danton <hdanton@sina.com>, Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 5, 2020 at 7:02 AM Daniel Vetter <daniel@ffwll.ch> wrote:
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

the shrinker lock class has existed for a while.. and is based on the
idea that anything in the get-pages/vmap path cannot happen on a
WONTNEED bo.. although perhaps there should be a few more 'if
(WARN_ON(obj->madv != WILLNEED)) return -EBUSY'..

replacing obj->lock with dma_resv lock, might be a nice cleanup.. but
I think it will be a bit churny..

BR,
-R

> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
