Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280E22971AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 16:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750863AbgJWOsd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 10:48:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S465289AbgJWOrD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 10:47:03 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028CEC0613CE;
        Fri, 23 Oct 2020 07:47:03 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j7so2149963wrt.9;
        Fri, 23 Oct 2020 07:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XqBt1i7hbk5OGZc6xZTAvUWVNeyLS2+DpF81RKWrLnw=;
        b=Dw3tA4xi+7JBPOyoDXwcBo2db3iRsFXqef/2EWBZXDN6E7MitmpYobnk+c8swgaZMa
         PUuE20A387vx2f/sW2HXAKhsfg49VdtOK4RGPHFJnClR8vP/RQI/7372cAwpOws57LTp
         2Uweiq6aSLX6bFNgcncLe9RLWWkrLaz88xN/r7AQwL5DneZB6EoYDygz82r9oaYchXHZ
         bcppKSychCqjioucdDxq5tbT8hkVoeSkj4NvUkuZr1NcChMLLSUS1Tk2kcZm0H2ZfDEk
         mxRty0qIZYMZOBBaz8NEtAIAJ6TM8Tysn+bH7xNS9N1UgcCu5N1o1j3WWCaaI9Ggs+9a
         glPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XqBt1i7hbk5OGZc6xZTAvUWVNeyLS2+DpF81RKWrLnw=;
        b=ju+qA7S0TmZoy9QHCy/h4lqB+EpHDy6mr3KG5QlszFzmDfP3Dtyhs3corXQlNtlWNQ
         +akkxpgn688dagX/vRKTF9/EYUAJd6GxPCwbKJH8sFowaKmvNAOTIrKyBk0gmqw1HOVP
         pg/kj87svKZhbm7k6YRpxoSwMISSr5JNYTSC3NPW2HHpCWIqjvC7dJXobq+G7rcAorDi
         hh6H64e4fD5FIeCb0hu2YZtsRLwahzzKaYmEhCXUUsu07kEdphOCv16YFR6iRdMm89ql
         GI3VdxoXlRvBLbv51TOYPVaVHWoVBlXaTT9ucZ9eLWXbWcl8UpaaO9ijHlD6mg5pGo7b
         izcw==
X-Gm-Message-State: AOAM530i4aYdkRHDE6ppf2otWd3d9RPkRbrH5XNVfzSXdQNTiccRK8zB
        RRTL7S15nrxO2Jp/k4MeUPJVtY4uEzOCL3J8/7s=
X-Google-Smtp-Source: ABdhPJzO0yoItlJTYNmRsywaLbKhVUJutqLcxBS6Sy2dF1BIYo8TOXPbTq3G0L7eVaSXW1TdeiIrKbD2TmKZ2sLrh5s=
X-Received: by 2002:adf:bc0f:: with SMTP id s15mr3019027wrg.83.1603464421516;
 Fri, 23 Oct 2020 07:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201019204636.139997-1-robdclark@gmail.com> <20201019204636.139997-7-robdclark@gmail.com>
 <CAOeoa-e+ObTCG+KFvkT7NJngHvDyDoc+zNTyOpJqRkL=8TxqVg@mail.gmail.com>
In-Reply-To: <CAOeoa-e+ObTCG+KFvkT7NJngHvDyDoc+zNTyOpJqRkL=8TxqVg@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 23 Oct 2020 07:46:49 -0700
Message-ID: <CAF6AEGuAqTO9Ps4dAjSXngN2O7PHw1PrWvBT8rC0Oj6+whsRFA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v3 06/23] drm/msm/gem: Move locking in
 shrinker path
To:     =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 23, 2020 at 1:55 AM Kristian H=C3=B8gsberg <hoegsberg@gmail.com=
> wrote:
>
> On Mon, Oct 19, 2020 at 10:45 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Move grabbing the bo lock into shrinker, with a msm_gem_trylock() to
> > skip over bo's that are already locked.  This gets rid of the nested
> > lock classes.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_gem.c          | 24 +++++----------------
> >  drivers/gpu/drm/msm/msm_gem.h          | 29 ++++++++++----------------
> >  drivers/gpu/drm/msm/msm_gem_shrinker.c | 27 +++++++++++++++++-------
> >  3 files changed, 35 insertions(+), 45 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_ge=
m.c
> > index e0d8d739b068..1195847714ba 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > @@ -17,8 +17,6 @@
> >  #include "msm_gpu.h"
> >  #include "msm_mmu.h"
> >
> > -static void msm_gem_vunmap_locked(struct drm_gem_object *obj);
> > -
> >
> >  static dma_addr_t physaddr(struct drm_gem_object *obj)
> >  {
> > @@ -693,20 +691,19 @@ int msm_gem_madvise(struct drm_gem_object *obj, u=
nsigned madv)
> >         return (madv !=3D __MSM_MADV_PURGED);
> >  }
> >
> > -void msm_gem_purge(struct drm_gem_object *obj, enum msm_gem_lock subcl=
ass)
> > +void msm_gem_purge(struct drm_gem_object *obj)
> >  {
> >         struct drm_device *dev =3D obj->dev;
> >         struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
> >
> >         WARN_ON(!mutex_is_locked(&dev->struct_mutex));
> > +       WARN_ON(!msm_gem_is_locked(obj));
> >         WARN_ON(!is_purgeable(msm_obj));
> >         WARN_ON(obj->import_attach);
> >
> > -       mutex_lock_nested(&msm_obj->lock, subclass);
> > -
> >         put_iova(obj);
> >
> > -       msm_gem_vunmap_locked(obj);
> > +       msm_gem_vunmap(obj);
> >
> >         put_pages(obj);
> >
> > @@ -724,11 +721,9 @@ void msm_gem_purge(struct drm_gem_object *obj, enu=
m msm_gem_lock subclass)
> >
> >         invalidate_mapping_pages(file_inode(obj->filp)->i_mapping,
> >                         0, (loff_t)-1);
> > -
> > -       msm_gem_unlock(obj);
> >  }
> >
> > -static void msm_gem_vunmap_locked(struct drm_gem_object *obj)
> > +void msm_gem_vunmap(struct drm_gem_object *obj)
> >  {
> >         struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
> >
> > @@ -741,15 +736,6 @@ static void msm_gem_vunmap_locked(struct drm_gem_o=
bject *obj)
> >         msm_obj->vaddr =3D NULL;
> >  }
> >
> > -void msm_gem_vunmap(struct drm_gem_object *obj, enum msm_gem_lock subc=
lass)
> > -{
> > -       struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
> > -
> > -       mutex_lock_nested(&msm_obj->lock, subclass);
> > -       msm_gem_vunmap_locked(obj);
> > -       msm_gem_unlock(obj);
> > -}
> > -
> >  /* must be called before _move_to_active().. */
> >  int msm_gem_sync_object(struct drm_gem_object *obj,
> >                 struct msm_fence_context *fctx, bool exclusive)
> > @@ -986,7 +972,7 @@ static void free_object(struct msm_gem_object *msm_=
obj)
> >
> >                 drm_prime_gem_destroy(obj, msm_obj->sgt);
> >         } else {
> > -               msm_gem_vunmap_locked(obj);
> > +               msm_gem_vunmap(obj);
> >                 put_pages(obj);
> >         }
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_ge=
m.h
> > index d55d5401a2d2..c5232b8da794 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.h
> > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > @@ -162,6 +162,13 @@ msm_gem_lock(struct drm_gem_object *obj)
> >         mutex_lock(&msm_obj->lock);
> >  }
> >
> > +static inline bool __must_check
> > +msm_gem_trylock(struct drm_gem_object *obj)
> > +{
> > +       struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
> > +       return mutex_trylock_recursive(&msm_obj->lock) =3D=3D MUTEX_TRY=
LOCK_SUCCESS;
>
> This can just be
>
>     return mutex_trylock(&msm_obj->lock) =3D=3D 1;
>
> now, right?

yeah, I suppose.. although this is just transient and gets replaced in
a later patch

BR,
-R

> > +}
> > +
> >  static inline int
> >  msm_gem_lock_interruptible(struct drm_gem_object *obj)
> >  {
> > @@ -190,6 +197,7 @@ static inline bool is_active(struct msm_gem_object =
*msm_obj)
> >
> >  static inline bool is_purgeable(struct msm_gem_object *msm_obj)
> >  {
> > +       WARN_ON(!msm_gem_is_locked(&msm_obj->base));
> >         WARN_ON(!mutex_is_locked(&msm_obj->base.dev->struct_mutex));
> >         return (msm_obj->madv =3D=3D MSM_MADV_DONTNEED) && msm_obj->sgt=
 &&
> >                         !msm_obj->base.dma_buf && !msm_obj->base.import=
_attach;
> > @@ -197,27 +205,12 @@ static inline bool is_purgeable(struct msm_gem_ob=
ject *msm_obj)
> >
> >  static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
> >  {
> > +       WARN_ON(!msm_gem_is_locked(&msm_obj->base));
> >         return (msm_obj->vmap_count =3D=3D 0) && msm_obj->vaddr;
> >  }
> >
> > -/* The shrinker can be triggered while we hold objA->lock, and need
> > - * to grab objB->lock to purge it.  Lockdep just sees these as a singl=
e
> > - * class of lock, so we use subclasses to teach it the difference.
> > - *
> > - * OBJ_LOCK_NORMAL is implicit (ie. normal mutex_lock() call), and
> > - * OBJ_LOCK_SHRINKER is used by shrinker.
> > - *
> > - * It is *essential* that we never go down paths that could trigger th=
e
> > - * shrinker for a purgable object.  This is ensured by checking that
> > - * msm_obj->madv =3D=3D MSM_MADV_WILLNEED.
> > - */
> > -enum msm_gem_lock {
> > -       OBJ_LOCK_NORMAL,
> > -       OBJ_LOCK_SHRINKER,
> > -};
> > -
> > -void msm_gem_purge(struct drm_gem_object *obj, enum msm_gem_lock subcl=
ass);
> > -void msm_gem_vunmap(struct drm_gem_object *obj, enum msm_gem_lock subc=
lass);
> > +void msm_gem_purge(struct drm_gem_object *obj);
> > +void msm_gem_vunmap(struct drm_gem_object *obj);
> >  void msm_gem_free_work(struct work_struct *work);
> >
> >  /* Created per submit-ioctl, to track bo's and cmdstream bufs, etc,
> > diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/m=
sm/msm_gem_shrinker.c
> > index 482576d7a39a..2dc0ffa925b4 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> > @@ -52,8 +52,11 @@ msm_gem_shrinker_count(struct shrinker *shrinker, st=
ruct shrink_control *sc)
> >                 return 0;
> >
> >         list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
> > +               if (!msm_gem_trylock(&msm_obj->base))
> > +                       continue;
> >                 if (is_purgeable(msm_obj))
> >                         count +=3D msm_obj->base.size >> PAGE_SHIFT;
> > +               msm_gem_unlock(&msm_obj->base);
> >         }
> >
> >         if (unlock)
> > @@ -78,10 +81,13 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, st=
ruct shrink_control *sc)
> >         list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
> >                 if (freed >=3D sc->nr_to_scan)
> >                         break;
> > +               if (!msm_gem_trylock(&msm_obj->base))
> > +                       continue;
> >                 if (is_purgeable(msm_obj)) {
> > -                       msm_gem_purge(&msm_obj->base, OBJ_LOCK_SHRINKER=
);
> > +                       msm_gem_purge(&msm_obj->base);
> >                         freed +=3D msm_obj->base.size >> PAGE_SHIFT;
> >                 }
> > +               msm_gem_unlock(&msm_obj->base);
> >         }
> >
> >         if (unlock)
> > @@ -107,15 +113,20 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, =
unsigned long event, void *ptr)
> >                 return NOTIFY_DONE;
> >
> >         list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
> > +               if (!msm_gem_trylock(&msm_obj->base))
> > +                       continue;
> >                 if (is_vunmapable(msm_obj)) {
> > -                       msm_gem_vunmap(&msm_obj->base, OBJ_LOCK_SHRINKE=
R);
> > -                       /* since we don't know any better, lets bail af=
ter a few
> > -                        * and if necessary the shrinker will be invoke=
d again.
> > -                        * Seems better than unmapping *everything*
> > -                        */
> > -                       if (++unmapped >=3D 15)
> > -                               break;
> > +                       msm_gem_vunmap(&msm_obj->base);
> > +                       unmapped++;
> >                 }
> > +               msm_gem_unlock(&msm_obj->base);
> > +
> > +               /* since we don't know any better, lets bail after a fe=
w
> > +                * and if necessary the shrinker will be invoked again.
> > +                * Seems better than unmapping *everything*
> > +                */
> > +               if (++unmapped >=3D 15)
> > +                       break;
> >         }
> >
> >         if (unlock)
> > --
> > 2.26.2
> >
> > _______________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno
