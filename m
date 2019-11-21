Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD6F610477A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2019 01:25:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfKUAZD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Nov 2019 19:25:03 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:36016 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfKUAZD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Nov 2019 19:25:03 -0500
Received: by mail-ed1-f68.google.com with SMTP id f7so1198697edq.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2019 16:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xxN8i90HnOWWko5dcue+Kq/+nC0j3ATjHIHy52kF8SQ=;
        b=ey36+6j2JBABRW7nZ54IRAKoVx/bMZFSMOLrvctVXU2WDZSbW2HCiLu0rXE73cgGW5
         UGBkG+bNb/5b0vFH30g1zWYtFLpmxwAekNfDojhFcFhkQXE/CP6cRdoPvW42HMeBiZpT
         T2yaWjPpHtxRe7ZhE7jj3hyxL4HDGSI9C+HF8RQTRTsfLoxrFW3DHF2xSrwlb0sG0YEE
         FP1VuMSK84dX6uV3RkmDMXOxo9ucCR/JLlrbUtzi3sWsX45et4AWz5PK3mMmQi0BOvta
         3osIJCboO2p8mNwqTtvP834yWHV1O1ul5zzv5qO+Oi+mkHIR+g/nUPz/594ZaofiA7XI
         OB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xxN8i90HnOWWko5dcue+Kq/+nC0j3ATjHIHy52kF8SQ=;
        b=P8/An96liaTADrTyZlRU6XwI2t0bYwIEBlC1xH0ff4NfqDqlMncT2QCiSmKkxIC6ze
         N7zsCdOlRyM0+KXxoUfofWtWSIQvdShtM2X+wFYh3aGJr0xTbSyG4WYuKxAsiiIra/yl
         VEs7r/8nZWNIhgL25wMgZK9lGVQ6JBh+GugVBLRGGbi+9wwGI8efkVqMdnTo6yE9t/lE
         6Mf7H8dF0DNZC3XAX18whfvhUo0d99qAwU1dDhp/dsFk5O68D9nYTQ3mYMIoVgVPZk3I
         eUL7dmCavY9yLvz32K4QWA4l1/ePX8MBjP66sjLR6eCyJA7lRw244KxJdGwwwprGbWke
         mw/w==
X-Gm-Message-State: APjAAAW2F4yLsr5lA1kbUyAqLT0mNbS/VWLjXsDQKfi6hgDwyjYafOyF
        enw8wduyYPAkjNgMURP8ZVz5OOQg22kcqXFNhk0=
X-Google-Smtp-Source: APXvYqwlwDO6EaPRqE5cvCovwt2XV0M+rtxk478VSQdRf3+xJl7A6zmhhzNGPjevdUt7lHzBidY5qIj1Fd99jKQwrzo=
X-Received: by 2002:a17:906:d143:: with SMTP id br3mr9210265ejb.215.1574295900268;
 Wed, 20 Nov 2019 16:25:00 -0800 (PST)
MIME-Version: 1.0
References: <20191119210844.16947-4-daniel.vetter@ffwll.ch> <20191120105607.3023-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20191120105607.3023-1-daniel.vetter@ffwll.ch>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 20 Nov 2019 16:24:48 -0800
Message-ID: <CAF6AEGt9N7EYHFOofU-9pBTs8X+w2h30a_KvTg3BVARbChAWZA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Don't init ww_mutec acquire ctx before needed
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sean Paul <sean@poorly.run>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 20, 2019 at 2:56 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> For locking semantics it really doesn't matter when we grab the
> ticket. But for lockdep validation it does: the acquire ctx is a fake
> lockdep. Since other drivers might want to do a full multi-lock dance
> in their fault-handler, not just lock a single dma_resv. Therefore we
> must init the acquire_ctx only after we've done all the copy_*_user or
> anything else that might trigger a pagefault. For msm this means we
> need to move it past submit_lookup_objects.
>
> Aside: Why is msm still using struct_mutex, it seems to be using
> dma_resv_lock for general buffer state protection?
>
> v2:
> - Add comment to explain why the ww ticket setup is separate (Rob)
> - Fix up error handling, we need to make sure we don't call
>   ww_acquire_fini without _init.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org

found a few minutes to take this for a spin and seems fine.. t-b && r-b

BR,
-R

> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index fb1fdd7fa3ef..385d4965a8d0 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -54,7 +54,6 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>
>         INIT_LIST_HEAD(&submit->node);
>         INIT_LIST_HEAD(&submit->bo_list);
> -       ww_acquire_init(&submit->ticket, &reservation_ww_class);
>
>         return submit;
>  }
> @@ -390,8 +389,6 @@ static void submit_cleanup(struct msm_gem_submit *submit)
>                 list_del_init(&msm_obj->submit_entry);
>                 drm_gem_object_put(&msm_obj->base);
>         }
> -
> -       ww_acquire_fini(&submit->ticket);
>  }
>
>  int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> @@ -408,6 +405,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>         struct msm_ringbuffer *ring;
>         int out_fence_fd = -1;
>         struct pid *pid = get_pid(task_pid(current));
> +       bool has_ww_ticket = false;
>         unsigned i;
>         int ret, submitid;
>         if (!gpu)
> @@ -489,6 +487,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>         if (ret)
>                 goto out;
>
> +       /* copy_*_user while holding a ww ticket upsets lockdep */
> +       ww_acquire_init(&submit->ticket, &reservation_ww_class);
> +       has_ww_ticket = true;
>         ret = submit_lock_objects(submit);
>         if (ret)
>                 goto out;
> @@ -588,6 +589,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>
>  out:
>         submit_cleanup(submit);
> +       if (has_ww_ticket)
> +               ww_acquire_fini(&submit->ticket);
>         if (ret)
>                 msm_gem_submit_free(submit);
>  out_unlock:
> --
> 2.24.0
>
