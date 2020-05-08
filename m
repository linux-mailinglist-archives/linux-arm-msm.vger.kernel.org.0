Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0141CA450
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 08:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbgEHGk6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 02:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727110AbgEHGk5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 02:40:57 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB27FC05BD43
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2020 23:40:56 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id e16so514816wra.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2020 23:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LlZNWr2ULsnWPtOzZvKbfMrvgkMK27lymoNxsFAY3Ak=;
        b=ZoZ4o1LUJyhJMqRJ6NICXQ6hbkCkr/nA7wjrLgb8O5vxM6S01j3VMocbpGDNUeT9ga
         WE1bQ/OSC2FUqeqafuC8ISS5LZ0v2yXYS4eGqxZhKFSAZxKA7BFnCq48nau7HOm6eLhA
         Y8Z8jAoc0AZiIrradD+Q4EpVfchsf3ekXIDNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LlZNWr2ULsnWPtOzZvKbfMrvgkMK27lymoNxsFAY3Ak=;
        b=OXoV+uobPLrOnQj5xMfbk8xjo0GRpksWxu5rqNOxApo3Ajzz/Azj3fpe/OHIIr0ChO
         vmw4vnzuOqOtYhPiGDP1tEk9JrbUS7VzX2fn3Qv/+BVPylgtK1mBV6FKEmfDUfM0hA6X
         VVyvik9k7C4MxjZdJVXrjSSI5qBNdHKIXf4uGI8SN4RREboM/IJPEoIHIpkYVXTmkT5I
         uKJQeTfOc1spxgpkov/TpwqvRVoK7Gajoq/hUIPLB2du03W7o8U1718+N2dte+UZ7Bzk
         9o1bBXdKSiRUxe0U1qo0gDm2uCn3bbnVqThDmZxBguZzA9Rqusp499nawcSEhV2vN0oY
         WSsQ==
X-Gm-Message-State: AGi0PuZUvFi+NHAZffpVvf4VQCC2wHgYW059+KvOyfBiHjLwWz1GFFCL
        bdEMcp6tk9J5Ya8+VGNY76+ciQ==
X-Google-Smtp-Source: APiQypIjN/LcNlF7XH3aw+beA8fvsw20zR+5C5ks412vv4cp/Ldh8533l18oKxJ5ISxNc9mw0AM64g==
X-Received: by 2002:a5d:6691:: with SMTP id l17mr1056221wru.127.1588920055565;
        Thu, 07 May 2020 23:40:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id p23sm6642894wmj.37.2020.05.07.23.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 23:40:54 -0700 (PDT)
Date:   Fri, 8 May 2020 08:40:53 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Emil Velikov <emil.l.velikov@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 10/36] drm/gem: add _locked suffix to drm_object_put
Message-ID: <20200508064053.GB1383626@phenom.ffwll.local>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-11-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507150822.114464-11-emil.l.velikov@gmail.com>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 07, 2020 at 04:07:56PM +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> Vast majority of DRM (core and drivers) are struct_mutex free.
> 
> As such we have only a handful of cases where the locked helper should
> be used. Make that stand out a little bit better.
> 
> Done via the following script:
> 
> __from=drm_gem_object_put
> __to=drm_gem_object_put_locked
> 
> for __file in $(git grep --name-only --word-regexp $__from); do
>   sed -i  "s/\<$__from\>/$__to/g" $__file;
> done
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>

Since

commit 48e7f18392c66f9b69ebac11c54f1a2e033ced54
Author: Kristian H. Kristensen <hoegsberg@gmail.com>
Date:   Wed Mar 20 10:09:08 2019 -0700

    drm/msm: Implement .gem_free_object_unlocked

msm doesn't need the struct_mutex in the bo_put anymore, the only reason
we had to use the _locked version here is historical accidents I think.

I think you could convert these all to the _unlocked variant and then
entirely drop the _locked version.

Once we have that we could move struct_mutex into each driver (at least
for msm and i915) since it's purely internal, and then wrap it in an
#ifdef CONFIG_DRM_LEGACY to gloriously sunset it all :-)

Cheers, Daniel

> ---
>  drivers/gpu/drm/drm_gem.c                 | 6 +++---
>  drivers/gpu/drm/msm/adreno/a5xx_debugfs.c | 4 ++--
>  drivers/gpu/drm/msm/msm_drv.c             | 2 +-
>  drivers/gpu/drm/msm/msm_gem.c             | 6 +++---
>  drivers/gpu/drm/msm/msm_gem_submit.c      | 2 +-
>  drivers/gpu/drm/msm/msm_gpu.c             | 2 +-
>  include/drm/drm_gem.h                     | 4 ++--
>  7 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 599d5ff53b73..f21327ebc562 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -983,7 +983,7 @@ drm_gem_object_free(struct kref *kref)
>  EXPORT_SYMBOL(drm_gem_object_free);
>  
>  /**
> - * drm_gem_object_put - release a GEM buffer object reference
> + * drm_gem_object_put_locked - release a GEM buffer object reference
>   * @obj: GEM buffer object
>   *
>   * This releases a reference to @obj. Callers must hold the
> @@ -994,7 +994,7 @@ EXPORT_SYMBOL(drm_gem_object_free);
>   * drm_gem_object_put_unlocked() instead.
>   */
>  void
> -drm_gem_object_put(struct drm_gem_object *obj)
> +drm_gem_object_put_locked(struct drm_gem_object *obj)
>  {
>  	if (obj) {
>  		WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
> @@ -1002,7 +1002,7 @@ drm_gem_object_put(struct drm_gem_object *obj)
>  		kref_put(&obj->refcount, drm_gem_object_free);
>  	}
>  }
> -EXPORT_SYMBOL(drm_gem_object_put);
> +EXPORT_SYMBOL(drm_gem_object_put_locked);
>  
>  /**
>   * drm_gem_vm_open - vma->ops->open implementation for GEM
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
> index 8cae2ca4af6b..68eddac7771c 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
> @@ -124,13 +124,13 @@ reset_set(void *data, u64 val)
>  
>  	if (a5xx_gpu->pm4_bo) {
>  		msm_gem_unpin_iova(a5xx_gpu->pm4_bo, gpu->aspace);
> -		drm_gem_object_put(a5xx_gpu->pm4_bo);
> +		drm_gem_object_put_locked(a5xx_gpu->pm4_bo);
>  		a5xx_gpu->pm4_bo = NULL;
>  	}
>  
>  	if (a5xx_gpu->pfp_bo) {
>  		msm_gem_unpin_iova(a5xx_gpu->pfp_bo, gpu->aspace);
> -		drm_gem_object_put(a5xx_gpu->pfp_bo);
> +		drm_gem_object_put_locked(a5xx_gpu->pfp_bo);
>  		a5xx_gpu->pfp_bo = NULL;
>  	}
>  
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 29295dee2a2e..6baed5b43ea3 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -932,7 +932,7 @@ static int msm_ioctl_gem_madvise(struct drm_device *dev, void *data,
>  		ret = 0;
>  	}
>  
> -	drm_gem_object_put(obj);
> +	drm_gem_object_put_locked(obj);
>  
>  unlock:
>  	mutex_unlock(&dev->struct_mutex);
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 5a6a79fbc9d6..8696c405f709 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -879,7 +879,7 @@ void msm_gem_describe_objects(struct list_head *list, struct seq_file *m)
>  }
>  #endif
>  
> -/* don't call directly!  Use drm_gem_object_put() and friends */
> +/* don't call directly!  Use drm_gem_object_put_locked() and friends */
>  void msm_gem_free_object(struct drm_gem_object *obj)
>  {
>  	struct msm_gem_object *msm_obj = to_msm_bo(obj);
> @@ -1183,7 +1183,7 @@ static void *_msm_gem_kernel_new(struct drm_device *dev, uint32_t size,
>  	return vaddr;
>  err:
>  	if (locked)
> -		drm_gem_object_put(obj);
> +		drm_gem_object_put_locked(obj);
>  	else
>  		drm_gem_object_put_unlocked(obj);
>  
> @@ -1215,7 +1215,7 @@ void msm_gem_kernel_put(struct drm_gem_object *bo,
>  	msm_gem_unpin_iova(bo, aspace);
>  
>  	if (locked)
> -		drm_gem_object_put(bo);
> +		drm_gem_object_put_locked(bo);
>  	else
>  		drm_gem_object_put_unlocked(bo);
>  }
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 385d4965a8d0..8f450a245cfb 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -387,7 +387,7 @@ static void submit_cleanup(struct msm_gem_submit *submit)
>  		struct msm_gem_object *msm_obj = submit->bos[i].obj;
>  		submit_unlock_unpin_bo(submit, i, false);
>  		list_del_init(&msm_obj->submit_entry);
> -		drm_gem_object_put(&msm_obj->base);
> +		drm_gem_object_put_locked(&msm_obj->base);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 615c5cda5389..86a68f96c48d 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -694,7 +694,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>  		/* move to inactive: */
>  		msm_gem_move_to_inactive(&msm_obj->base);
>  		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
> -		drm_gem_object_put(&msm_obj->base);
> +		drm_gem_object_put_locked(&msm_obj->base);
>  	}
>  
>  	pm_runtime_mark_last_busy(&gpu->pdev->dev);
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 7c877bea7b3a..0f22f3320dcb 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -187,7 +187,7 @@ struct drm_gem_object {
>  	 *
>  	 * Reference count of this object
>  	 *
> -	 * Please use drm_gem_object_get() to acquire and drm_gem_object_put()
> +	 * Please use drm_gem_object_get() to acquire and drm_gem_object_put_locked()
>  	 * or drm_gem_object_put_unlocked() to release a reference to a GEM
>  	 * buffer object.
>  	 */
> @@ -376,7 +376,7 @@ drm_gem_object_put_unlocked(struct drm_gem_object *obj)
>  	kref_put(&obj->refcount, drm_gem_object_free);
>  }
>  
> -void drm_gem_object_put(struct drm_gem_object *obj);
> +void drm_gem_object_put_locked(struct drm_gem_object *obj);
>  
>  int drm_gem_handle_create(struct drm_file *file_priv,
>  			  struct drm_gem_object *obj,
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
