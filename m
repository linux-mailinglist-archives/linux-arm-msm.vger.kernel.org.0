Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C75B350AA8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 01:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232356AbhCaXYC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 19:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbhCaXXh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 19:23:37 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 570A9C061574;
        Wed, 31 Mar 2021 16:23:37 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id j18so21261608wra.2;
        Wed, 31 Mar 2021 16:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nvf0X0kuUBIrjJFQmPlTVUK+MzbbTsSvRRBV7ySWQKg=;
        b=lVWxM0JGLTdhYBijWz/nIZB9LzTKgbZPO19dHm0sk/cBxx+Oqdc8737D9KnCyuvnCl
         mwDozu7eI1gcMX+0ntLDdn6prF1BPV4Z1fBILe6HWyAfP4uAtiYqrvXcKIZIFhIyfUXq
         CTmDqA9FNnvFXAanZ7MLPuep6TJqt6JJTcNzF7baQWT3W6bgZ778sYKKnSFYNN4RZyx3
         CGnFZxHU+uISZgqCPGdVkOtNhOO/nj4F7feqV8c4h8CF70ULvUqrDZSl7bj0PRCJ3041
         NtQ7/nmLgoiog5piPryYwlV12xACbfIqZUyi2CCNOKpi33KdLFXbOYjmgiiVVV0U6W/I
         rKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nvf0X0kuUBIrjJFQmPlTVUK+MzbbTsSvRRBV7ySWQKg=;
        b=EWio6Z7+ydpvgQ0d3h/5gFDBl8TobML9WIJxB4cCW6Si4kkVz+aEwf1FAk2JUilm0C
         dxnT2h1Ncd8JOVawYg9UsthsJP/UOyNtioAYYvfvEILk1AHfHrDKc6W4zPQ9O7eum5fQ
         Sk4LDmS1qgb2eYTz5xS5vOhCyTsMmSz+u7rO6xpDVtPGWmoQMltuc8IOfzG3TPf1aupK
         RkrO7D1QHsfW5l9Oc0Dv2xuQ7bCbfUBqMbxyS+OiwN52HOvROVwvqr7y7MNeS/zxRhEF
         xnHKkU8Bqh1dWtmoJtWVYu9TNwo87RvnAfHbigQ2h+PCVM72gGjr9uLegIN+kHTB1Ldy
         w/zA==
X-Gm-Message-State: AOAM532/TqxLji6zKLQIxXDDrOKvrElrXmv5n0J0E2rLrv45Kj9S9yC/
        OnfpcBjbRxBmJIWnKOtXxRiVYE5AdHjVJduSHQQ=
X-Google-Smtp-Source: ABdhPJwvz9Ycqmxh2Dl4E/ryLEp40/A9F1+XN64OU+/Ry0sHhsIc7yf4hJ5mrxQZUnNmEef3RGCq0N0JQYZqWBeoE5Y=
X-Received: by 2002:adf:b30f:: with SMTP id j15mr6273325wrd.132.1617233016052;
 Wed, 31 Mar 2021 16:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com> <20210331221630.488498-3-robdclark@gmail.com>
 <CAD=FV=USXBm-ZLafNWbUK=Ny7_vwtyG164mQFs87SkXqim-Vpw@mail.gmail.com>
In-Reply-To: <CAD=FV=USXBm-ZLafNWbUK=Ny7_vwtyG164mQFs87SkXqim-Vpw@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 31 Mar 2021 16:26:59 -0700
Message-ID: <CAF6AEGutvjUQ-bQMsAYDLq5kdRo7rQ5XwWjGSRV27VT_UOuMTw@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/msm: Avoid mutex in shrinker_count()
To:     Doug Anderson <dianders@chromium.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 31, 2021 at 3:44 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Mar 31, 2021 at 3:14 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > @@ -818,11 +820,19 @@ static void update_inactive(struct msm_gem_object *msm_obj)
> >         mutex_lock(&priv->mm_lock);
> >         WARN_ON(msm_obj->active_count != 0);
> >
> > +       if (msm_obj->dontneed)
> > +               mark_unpurgable(msm_obj);
> > +
> >         list_del_init(&msm_obj->mm_list);
> > -       if (msm_obj->madv == MSM_MADV_WILLNEED)
> > +       if (msm_obj->madv == MSM_MADV_WILLNEED) {
> >                 list_add_tail(&msm_obj->mm_list, &priv->inactive_willneed);
> > -       else
> > +       } else if (msm_obj->madv == MSM_MADV_DONTNEED) {
> >                 list_add_tail(&msm_obj->mm_list, &priv->inactive_dontneed);
> > +               mark_purgable(msm_obj);
> > +       } else {
> > +               WARN_ON(msm_obj->madv != __MSM_MADV_PURGED);
> > +               list_add_tail(&msm_obj->mm_list, &priv->inactive_purged);
>
> I'm probably being dense, but what's the point of adding it to the
> "inactive_purged" list here? You never look at that list, right? You
> already did a list_del_init() on this object's list pointer
> ("mm_list"). I don't see how adding it to a bogus list helps with
> anything.

It preserves the "every bo is in one of these lists" statement, but
other than that you are right we aren't otherwise doing anything with
that list.  (Or we could replace the list_del_init() with list_del()..
I tend to instinctively go for list_del_init())

>
> > @@ -198,6 +203,33 @@ static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
> >         return (msm_obj->vmap_count == 0) && msm_obj->vaddr;
> >  }
> >
> > +static inline void mark_purgable(struct msm_gem_object *msm_obj)
> > +{
> > +       struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
> > +
> > +       WARN_ON(!mutex_is_locked(&priv->mm_lock));
> > +
> > +       if (WARN_ON(msm_obj->dontneed))
> > +               return;
>
> The is_purgeable() function also checks other things besides just
> "MSM_MADV_DONTNEED". Do we need to check those too? Specifically:
>
>  msm_obj->sgt && !msm_obj->base.dma_buf && !msm_obj->base.import_attach
>
> ...or is it just being paranoid?
>
> I guess I'm just worried that if any of those might be important then
> we'll consistently report back that we have a count of things that can
> be purged but then scan() won't find anything to do. That wouldn't be
> great.

Hmm, I thought msm_gem_madvise() returned an error instead of allowing
MSM_MADV_DONTNEED to be set on imported/exported dma-bufs.. it
probably should to be complete (but userspace already knows not to
madvise an imported/exported buffer for other reasons.. ie. we can't
let a shared buffer end up in the bo cache).  I'll re-work that a bit.

The msm_obj->sgt case is a bit more tricky.. that will be the case of
a freshly allocated obj that does not have backing patches yet.  But
it seems like enough of a corner case, that I'm happy to live with
it.. ie. the tricky thing is not leaking decrements of
priv->shrinkable_count or underflowing priv->shrinkable_count, and
caring about the !msm_obj->sgt case doubles the number of states an
object can be in, and the shrinker->count() return value is just an
estimate.

>
> > +       priv->shrinkable_count += msm_obj->base.size >> PAGE_SHIFT;
> > +       msm_obj->dontneed = true;
> > +}
> > +
> > +static inline void mark_unpurgable(struct msm_gem_object *msm_obj)
> > +{
> > +       struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
> > +
> > +       WARN_ON(!mutex_is_locked(&priv->mm_lock));
> > +
> > +       if (WARN_ON(!msm_obj->dontneed))
> > +               return;
> > +
> > +       priv->shrinkable_count -= msm_obj->base.size >> PAGE_SHIFT;
> > +       WARN_ON(priv->shrinkable_count < 0);
>
> If you changed the order maybe you could make shrinkable_count
> "unsigned long" to match the shrinker API?
>
>  new_shrinkable = msm_obj->base.size >> PAGE_SHIFT;
>  WARN_ON(new_shrinkable > priv->shrinkable_count);
>  priv->shrinkable_count -= new_shrinkable
>

True, although I've developed a preference for signed integers in
cases where it can underflow if you mess up

BR,
-R
