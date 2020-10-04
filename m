Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC1D282E10
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 00:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgJDWPp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Oct 2020 18:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbgJDWPh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Oct 2020 18:15:37 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ACB2C0613CE
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Oct 2020 15:15:36 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id x62so2568353oix.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2020 15:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zp3A2XGMTKnV8AbeumBRPkmL9bh0msXm/PNf+jFKLFE=;
        b=UchpZy2n+asjkpv6PPUIgC4/vOCZZF/aOZ93DLHkddkKrH9IEhOd/OVBszgOL8YUn+
         +9AB6W5u2AlSo4MvL+tVDFEX/9UMZZ5mfwgp+Fe3mCQIia8RV68Lz52hrMtNd4S0qdnC
         8qujuLnu3S9SqEXfLZUj06Csw2N8cgfa8VlXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zp3A2XGMTKnV8AbeumBRPkmL9bh0msXm/PNf+jFKLFE=;
        b=hJkqW3U3CKGQFRGc99GxR2WszAgRyEiDQDJeKAJZ7VCtDYtA8q0S0jjG+F2s47a+Ok
         Rzhisvcow7otHALBKoLHdV5G82trycCE/bLQQk0CHa49YaePjiaVcn+TUU64WJDWYAbC
         6P/SaIblrPeyKVDpNz4pCK4WJOWAE9yaCsKMWUPsloIb9mtuSBXsuUE1rMHLmka86/Vg
         F1wAY/4EPSmHzBATySmOANVKBPaXadSweahndUmcyQlMzlFLTw7Ritpfrx9DRgNVe5xN
         l6rYuUwLnRXPKvCf5nd1ZpPoxGc6moZwV76J2lF5cLc4rzRDnczjkHRG3x3CPtAj3hE2
         94uw==
X-Gm-Message-State: AOAM531w3hqSigHbG7se85GVKWN8rYh3WY2t395IBVkHhdXpGWLOr/nQ
        u88ka7lhyZqn/wIsPq9Z+shkz6AQcf3Lwflh6iPBje6Pe3CQRQ==
X-Google-Smtp-Source: ABdhPJzIaBToXRGXAJkuSk5soQ/QF7PYrx9K2ehR8PAylgGCt2ysnmJKV9yAd8B2XFhygWioCVQHq3P6NlzoZAvF9rE=
X-Received: by 2002:aca:c6cc:: with SMTP id w195mr1717387oif.101.1601849735768;
 Sun, 04 Oct 2020 15:15:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201004192152.3298573-1-robdclark@gmail.com> <20201004192152.3298573-5-robdclark@gmail.com>
In-Reply-To: <20201004192152.3298573-5-robdclark@gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Mon, 5 Oct 2020 00:15:24 +0200
Message-ID: <CAKMK7uHrP1ijVORpW0xvMX4M_0HQpfzUk2bE576gpzSPug-M6A@mail.gmail.com>
Subject: Re: [PATCH 04/14] drm/msm: Add priv->mm_lock to protect
 active/inactive lists
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Oct 4, 2020 at 9:21 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Rather than relying on the big dev->struct_mutex hammer, introduce a
> more specific lock for protecting the bo lists.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_debugfs.c      |  7 +++++++
>  drivers/gpu/drm/msm/msm_drv.c          |  1 +
>  drivers/gpu/drm/msm/msm_drv.h          | 13 +++++++++++-
>  drivers/gpu/drm/msm/msm_gem.c          | 28 +++++++++++++++-----------
>  drivers/gpu/drm/msm/msm_gem_shrinker.c | 12 +++++++++++
>  drivers/gpu/drm/msm/msm_gpu.h          |  5 ++++-
>  6 files changed, 52 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> index ee2e270f464c..64afbed89821 100644
> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> @@ -112,6 +112,11 @@ static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
>  {
>         struct msm_drm_private *priv = dev->dev_private;
>         struct msm_gpu *gpu = priv->gpu;
> +       int ret;
> +
> +       ret = mutex_lock_interruptible(&priv->mm_lock);
> +       if (ret)
> +               return ret;
>
>         if (gpu) {
>                 seq_printf(m, "Active Objects (%s):\n", gpu->name);
> @@ -121,6 +126,8 @@ static int msm_gem_show(struct drm_device *dev, struct seq_file *m)
>         seq_printf(m, "Inactive Objects:\n");
>         msm_gem_describe_objects(&priv->inactive_list, m);
>
> +       mutex_unlock(&priv->mm_lock);
> +
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 49685571dc0e..dc6efc089285 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -441,6 +441,7 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
>         init_llist_head(&priv->free_list);
>
>         INIT_LIST_HEAD(&priv->inactive_list);
> +       mutex_init(&priv->mm_lock);

I highly recommend you drop a

fs_reclaim_acquire(GFP_KERNEL);
might_lock(&priv->mm_lock);
fs_reclaim_release(GFP_KERNEL);

in here to teach lockdep about your ordering against the shrinker.
Gives you full testing every boot, even if your shrinker never gets
called.
-Daniel

>
>         drm_mode_config_init(ddev);
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index b9dd8f8f4887..50978e5db376 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -174,8 +174,19 @@ struct msm_drm_private {
>         struct msm_rd_state *hangrd;   /* debugfs to dump hanging submits */
>         struct msm_perf_state *perf;
>
> -       /* list of GEM objects: */
> +       /*
> +        * List of inactive GEM objects.  Every bo is either in the inactive_list
> +        * or gpu->active_list (for the gpu it is active on[1])
> +        *
> +        * These lists are protected by mm_lock.  If struct_mutex is involved, it
> +        * should be aquired prior to mm_lock.  One should *not* hold mm_lock in
> +        * get_pages()/vmap()/etc paths, as they can trigger the shrinker.
> +        *
> +        * [1] if someone ever added support for the old 2d cores, there could be
> +        *     more than one gpu object
> +        */
>         struct list_head inactive_list;
> +       struct mutex mm_lock;
>
>         /* worker for delayed free of objects: */
>         struct work_struct free_work;
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index a870b3ad129d..b04ed8b52f9d 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -746,13 +746,17 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
>  void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
>  {
>         struct msm_gem_object *msm_obj = to_msm_bo(obj);
> -       WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
> +       struct msm_drm_private *priv = obj->dev->dev_private;
> +
> +       might_sleep();
>         WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
>
>         if (!atomic_fetch_inc(&msm_obj->active_count)) {
> +               mutex_lock(&priv->mm_lock);
>                 msm_obj->gpu = gpu;
>                 list_del_init(&msm_obj->mm_list);
>                 list_add_tail(&msm_obj->mm_list, &gpu->active_list);
> +               mutex_unlock(&priv->mm_lock);
>         }
>  }
>
> @@ -761,12 +765,14 @@ void msm_gem_active_put(struct drm_gem_object *obj)
>         struct msm_gem_object *msm_obj = to_msm_bo(obj);
>         struct msm_drm_private *priv = obj->dev->dev_private;
>
> -       WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
> +       might_sleep();
>
>         if (!atomic_dec_return(&msm_obj->active_count)) {
> +               mutex_lock(&priv->mm_lock);
>                 msm_obj->gpu = NULL;
>                 list_del_init(&msm_obj->mm_list);
>                 list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
> +               mutex_unlock(&priv->mm_lock);
>         }
>  }
>
> @@ -921,13 +927,16 @@ static void free_object(struct msm_gem_object *msm_obj)
>  {
>         struct drm_gem_object *obj = &msm_obj->base;
>         struct drm_device *dev = obj->dev;
> +       struct msm_drm_private *priv = dev->dev_private;
>
>         WARN_ON(!mutex_is_locked(&dev->struct_mutex));
>
>         /* object should not be on active list: */
>         WARN_ON(is_active(msm_obj));
>
> +       mutex_lock(&priv->mm_lock);
>         list_del(&msm_obj->mm_list);
> +       mutex_unlock(&priv->mm_lock);
>
>         mutex_lock(&msm_obj->lock);
>
> @@ -1103,14 +1112,9 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
>                 mapping_set_gfp_mask(obj->filp->f_mapping, GFP_HIGHUSER);
>         }
>
> -       if (struct_mutex_locked) {
> -               WARN_ON(!mutex_is_locked(&dev->struct_mutex));
> -               list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
> -       } else {
> -               mutex_lock(&dev->struct_mutex);
> -               list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
> -               mutex_unlock(&dev->struct_mutex);
> -       }
> +       mutex_lock(&priv->mm_lock);
> +       list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
> +       mutex_unlock(&priv->mm_lock);
>
>         return obj;
>
> @@ -1178,9 +1182,9 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
>
>         mutex_unlock(&msm_obj->lock);
>
> -       mutex_lock(&dev->struct_mutex);
> +       mutex_lock(&priv->mm_lock);
>         list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
> -       mutex_unlock(&dev->struct_mutex);
> +       mutex_unlock(&priv->mm_lock);
>
>         return obj;
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> index 482576d7a39a..c41b84a3a484 100644
> --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> @@ -51,11 +51,15 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
>         if (!msm_gem_shrinker_lock(dev, &unlock))
>                 return 0;
>
> +       mutex_lock(&priv->mm_lock);
> +
>         list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
>                 if (is_purgeable(msm_obj))
>                         count += msm_obj->base.size >> PAGE_SHIFT;
>         }
>
> +       mutex_unlock(&priv->mm_lock);
> +
>         if (unlock)
>                 mutex_unlock(&dev->struct_mutex);
>
> @@ -75,6 +79,8 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>         if (!msm_gem_shrinker_lock(dev, &unlock))
>                 return SHRINK_STOP;
>
> +       mutex_lock(&priv->mm_lock);
> +
>         list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
>                 if (freed >= sc->nr_to_scan)
>                         break;
> @@ -84,6 +90,8 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>                 }
>         }
>
> +       mutex_unlock(&priv->mm_lock);
> +
>         if (unlock)
>                 mutex_unlock(&dev->struct_mutex);
>
> @@ -106,6 +114,8 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
>         if (!msm_gem_shrinker_lock(dev, &unlock))
>                 return NOTIFY_DONE;
>
> +       mutex_lock(&priv->mm_lock);
> +
>         list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
>                 if (is_vunmapable(msm_obj)) {
>                         msm_gem_vunmap(&msm_obj->base, OBJ_LOCK_SHRINKER);
> @@ -118,6 +128,8 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
>                 }
>         }
>
> +       mutex_unlock(&priv->mm_lock);
> +
>         if (unlock)
>                 mutex_unlock(&dev->struct_mutex);
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 6c9e1fdc1a76..1806e87600c0 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -94,7 +94,10 @@ struct msm_gpu {
>         struct msm_ringbuffer *rb[MSM_GPU_MAX_RINGS];
>         int nr_rings;
>
> -       /* list of GEM active objects: */
> +       /*
> +        * List of GEM active objects on this gpu.  Protected by
> +        * msm_drm_private::mm_lock
> +        */
>         struct list_head active_list;
>
>         /* does gpu need hw_init? */
> --
> 2.26.2
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
