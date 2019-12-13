Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA2DE11ED21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2019 22:43:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfLMVnY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Dec 2019 16:43:24 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40518 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbfLMVnX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Dec 2019 16:43:23 -0500
Received: by mail-lj1-f196.google.com with SMTP id s22so241386ljs.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2019 13:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d1dqZmlN6wtZ4Bk73UD3YMJdSI9oY7E0XauOGfRocNg=;
        b=FNIzZBTGcAGwQtyQWIHTc2FT4kaoV+xoI1SVwsFZwZGywnVyK/R2P8vDiTsQ7UO6rZ
         PNHSxkGmFQDtJ/vS2irNWLlfp8YTB7euE3Ps6Wnc3jxwLp+nd3ccNGsBu9yV4VMfoTE6
         sqycY542dafg1VVA2HvsewuvcdReGVGgRQVxjSqdSosxaNtg5Hb01NUwD3mvEwF5AkbF
         z0S6b6joCxTic6WCyTaDYeDG+PoAB4bJWQSzocBaRMdqL4E0qG1Pc4RYipiSJ9q6JuH9
         jiEqfgJLyjCDOzzDS1Ashx1nBwUAj3MKY7E6mibyI8/+L/NUxNAsRO3WVYigXT/kItHt
         Oe9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d1dqZmlN6wtZ4Bk73UD3YMJdSI9oY7E0XauOGfRocNg=;
        b=lUyL5UcX/x8aJJKXdactRA9NpEaJ8xTDDiUvgj3SygGl/PqXGEeZO3AALwPg50MVNh
         VddBUbrapsOH/fMZUTRg3zqr1iVpKsYXWBOILpXj61XGk2J+eRnEC0p6Y3QFsTFWL1+2
         S+iVdQayFoTyBrbT4SN3Xl3Ma1SF8AdhqSwGQ5pD0eOhgXsaPGG+bebkcoVzyO+Y3cbq
         R7oYmtIdFqrQXgMFlwGJDYmiJk/Afuhchi8ugecvljLAyaEEbSevQ0p/HZCjWebwBzac
         EXyiJyHiQK6loE4MS7q1j/IVmOcN1pb+V6L7YGot4FlXnH5Q4XL6OUyEaUt1w3oaUh5o
         nzvw==
X-Gm-Message-State: APjAAAVLfO3Ai/a/hMNhNWodND2vEfUcmkRGQg7YdxSh2rhT4ofNmbj0
        rNJbMdkf4bYc4lxh8nMY1sVtKlZm933woSRH+zah9A==
X-Google-Smtp-Source: APXvYqxrwXpFensePEvAhUtMCpBDyxM2AkB/737EJXgxOA60qb+ARhLag7tWVkc4+QmWh8ooFkeutE74P47rtVf8EZs=
X-Received: by 2002:a2e:808a:: with SMTP id i10mr10469003ljg.151.1576273401824;
 Fri, 13 Dec 2019 13:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20191125094356.161941-1-daniel.vetter@ffwll.ch>
 <20191125094356.161941-4-daniel.vetter@ffwll.ch> <20191213200848.GL624164@phenom.ffwll.local>
In-Reply-To: <20191213200848.GL624164@phenom.ffwll.local>
From:   Eric Anholt <eric@anholt.net>
Date:   Fri, 13 Dec 2019 13:43:30 -0800
Message-ID: <CADaigPXxgiWSd20BkVFXXxcqDrwY0yGmqgQM+0G0X0mob8nt8g@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm: Use dma_resv locking wrappers
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-arm-msm@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 13, 2019 at 12:08 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Nov 25, 2019 at 10:43:55AM +0100, Daniel Vetter wrote:
> > I'll add more fancy logic to them soon, so everyone really has to use
> > them. Plus they already provide some nice additional debug
> > infrastructure on top of direct ww_mutex usage for the fences tracked
> > by dma_resv.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: freedreno@lists.freedesktop.org
>
> Ping for some review/acks.
>
> Thanks, Daniel
>
> > ---
> >  drivers/gpu/drm/msm/msm_gem_submit.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > index 7d04c47d0023..385d4965a8d0 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -157,7 +157,7 @@ static void submit_unlock_unpin_bo(struct msm_gem_submit *submit,
> >               msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
> >
> >       if (submit->bos[i].flags & BO_LOCKED)
> > -             ww_mutex_unlock(&msm_obj->base.resv->lock);
> > +             dma_resv_unlock(msm_obj->base.resv);
> >
> >       if (backoff && !(submit->bos[i].flags & BO_VALID))
> >               submit->bos[i].iova = 0;
> > @@ -180,8 +180,8 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
> >               contended = i;
> >
> >               if (!(submit->bos[i].flags & BO_LOCKED)) {
> > -                     ret = ww_mutex_lock_interruptible(&msm_obj->base.resv->lock,
> > -                                     &submit->ticket);
> > +                     ret = dma_resv_lock_interruptible(msm_obj->base.resv,
> > +                                                       &submit->ticket);
> >                       if (ret)
> >                               goto fail;
> >                       submit->bos[i].flags |= BO_LOCKED;
> > @@ -202,8 +202,8 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
> >       if (ret == -EDEADLK) {
> >               struct msm_gem_object *msm_obj = submit->bos[contended].obj;
> >               /* we lost out in a seqno race, lock and retry.. */
> > -             ret = ww_mutex_lock_slow_interruptible(&msm_obj->base.resv->lock,
> > -                             &submit->ticket);
> > +             ret = dma_resv_lock_slow_interruptible(msm_obj->base.resv,
> > +                                                    &submit->ticket);
> >               if (!ret) {
> >                       submit->bos[contended].flags |= BO_LOCKED;
> >                       slow_locked = contended;
> > --
> > 2.24.0
> >

Reviewed-by: Eric Anholt <eric@anholt.net>
