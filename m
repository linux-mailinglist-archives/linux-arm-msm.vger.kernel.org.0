Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDD226C748
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 20:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727963AbgIPSXM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 14:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727924AbgIPSW5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 14:22:57 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34F73C03542E
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 05:01:35 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id s13so2503995wmh.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 05:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=igBfcxeCtlQN5CLlSYPTKG81q+ycX2teEyiF94cMRWs=;
        b=kXxeFKQt9X9g8aLTM+QgfFognrWsi7bbeKyXtbUa6Sw3vDhO1pk5GhyGWNAwFRiYV/
         y3+Zb9FAd6+OgeWN2UBgXkLCkDAoTOIILHbMfIswZ+DjZ6vsfBBnkeLG6pdGQ2oE+uvl
         +Byrs6EBHXRCTzlSe/2XCwaludcXLVt60J20Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=igBfcxeCtlQN5CLlSYPTKG81q+ycX2teEyiF94cMRWs=;
        b=kDKAOVHfEyA+5FbbD46iQ+MLAqlgvXEUeGZ1PsmW2iLPVGJQvXx1k6145JSA6urk0X
         0ADyuqcuptLSUUp72eMJFnml34LK78tcNtYXKGDe0wPFOe7zo8JL+azamwg9FiDh3DFs
         Dc4ZTb33Wn+PfIb2wFMqHrhblt3ZsbYbW2Xc8fiH9srTcaQvlCGnE0vUrtlCf/nQ4gbJ
         hjFRtQuDSNUYSo2ye5M0FvhLgyYz53SYtCzkhPT1wRZl+1XfZznaoIkpzg1J0B1S0ajc
         NSr6gfMtfu5dCCAoLRcS0+yC/RXP8Jm09P9Kw5NZXrNLpXFP38oIOm+PvxqDFyakDsx0
         7ZGw==
X-Gm-Message-State: AOAM532MSmMeoETOPbd/am/VEhXfdqgPtbOW5uyD51+jQ8z/bMI4SdJb
        9Z6aZMs0Vm1EIuscwEb0vpGD+g==
X-Google-Smtp-Source: ABdhPJzfc+smqAu2u0R++9ZZRUwUh0N8NfJRxHBrlnztnEgrnVKh20aLbXU2FBFNb/vMU9OQyVRfcw==
X-Received: by 2002:a1c:1d08:: with SMTP id d8mr4572504wmd.78.1600257693715;
        Wed, 16 Sep 2020 05:01:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id x16sm31915068wrq.62.2020.09.16.05.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 05:01:32 -0700 (PDT)
Date:   Wed, 16 Sep 2020 14:01:29 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     alexander.deucher@amd.com, christian.koenig@amd.com,
        airlied@linux.ie, daniel@ffwll.ch, linux@armlinux.org.uk,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        l.stach@pengutronix.de, christian.gmeiner@gmail.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        kgene@kernel.org, krzk@kernel.org, patrik.r.jakobsson@gmail.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, chunkuang.hu@kernel.org,
        p.zabel@pengutronix.de, matthias.bgg@gmail.com,
        robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
        tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com,
        heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
        laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
        sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
        tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
        andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com,
        xinhui.pan@amd.com, aaron.liu@amd.com, nirmoy.das@amd.com,
        chris@chris-wilson.co.uk, matthew.auld@intel.com,
        tvrtko.ursulin@linux.intel.com, andi.shyti@intel.com,
        sam@ravnborg.org, miaoqinglang@huawei.com,
        emil.velikov@collabora.com, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 08/21] drm/msm: Introduce GEM object funcs
Message-ID: <20200916120129.GL438822@phenom.ffwll.local>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-9-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-9-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 15, 2020 at 04:59:45PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in msm. The only exception is gem_prime_mmap,
> which is non-trivial to convert.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/msm/msm_drv.c | 13 -------------
>  drivers/gpu/drm/msm/msm_drv.h |  1 -
>  drivers/gpu/drm/msm/msm_gem.c | 19 ++++++++++++++++++-
>  3 files changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 79333842f70a..5952767ea478 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -978,12 +978,6 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
>  };
>  
> -static const struct vm_operations_struct vm_ops = {
> -	.fault = msm_gem_fault,
> -	.open = drm_gem_vm_open,
> -	.close = drm_gem_vm_close,
> -};
> -
>  static const struct file_operations fops = {
>  	.owner              = THIS_MODULE,
>  	.open               = drm_open,
> @@ -1009,18 +1003,11 @@ static struct drm_driver msm_driver = {
>  	.irq_preinstall     = msm_irq_preinstall,
>  	.irq_postinstall    = msm_irq_postinstall,
>  	.irq_uninstall      = msm_irq_uninstall,
> -	.gem_free_object_unlocked = msm_gem_free_object,
> -	.gem_vm_ops         = &vm_ops,
>  	.dumb_create        = msm_gem_dumb_create,
>  	.dumb_map_offset    = msm_gem_dumb_map_offset,
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_pin      = msm_gem_prime_pin,
> -	.gem_prime_unpin    = msm_gem_prime_unpin,
> -	.gem_prime_get_sg_table = msm_gem_prime_get_sg_table,
>  	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
> -	.gem_prime_vmap     = msm_gem_prime_vmap,
> -	.gem_prime_vunmap   = msm_gem_prime_vunmap,
>  	.gem_prime_mmap     = msm_gem_prime_mmap,
>  #ifdef CONFIG_DEBUG_FS
>  	.debugfs_init       = msm_debugfs_init,
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index af259b0573ea..7bcea10be81f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -269,7 +269,6 @@ void msm_gem_shrinker_cleanup(struct drm_device *dev);
>  int msm_gem_mmap_obj(struct drm_gem_object *obj,
>  			struct vm_area_struct *vma);
>  int msm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
> -vm_fault_t msm_gem_fault(struct vm_fault *vmf);
>  uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
>  int msm_gem_get_iova(struct drm_gem_object *obj,
>  		struct msm_gem_address_space *aspace, uint64_t *iova);
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index b4553caaa196..de915ff6f4b4 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -247,7 +247,7 @@ int msm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>  	return msm_gem_mmap_obj(vma->vm_private_data, vma);
>  }
>  
> -vm_fault_t msm_gem_fault(struct vm_fault *vmf)
> +static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
>  {
>  	struct vm_area_struct *vma = vmf->vma;
>  	struct drm_gem_object *obj = vma->vm_private_data;
> @@ -994,6 +994,22 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
>  	return ret;
>  }
>  
> +static const struct vm_operations_struct vm_ops = {
> +	.fault = msm_gem_fault,
> +	.open = drm_gem_vm_open,
> +	.close = drm_gem_vm_close,
> +};
> +
> +static const struct drm_gem_object_funcs msm_gem_object_funcs = {
> +	.free = msm_gem_free_object,
> +	.pin = msm_gem_prime_pin,
> +	.unpin = msm_gem_prime_unpin,
> +	.get_sg_table = msm_gem_prime_get_sg_table,
> +	.vmap = msm_gem_prime_vmap,
> +	.vunmap = msm_gem_prime_vunmap,
> +	.vm_ops = &vm_ops,
> +};
> +
>  static int msm_gem_new_impl(struct drm_device *dev,
>  		uint32_t size, uint32_t flags,
>  		struct drm_gem_object **obj)
> @@ -1024,6 +1040,7 @@ static int msm_gem_new_impl(struct drm_device *dev,
>  	INIT_LIST_HEAD(&msm_obj->vmas);
>  
>  	*obj = &msm_obj->base;
> +	(*obj)->funcs = &msm_gem_object_funcs;
>  
>  	return 0;
>  }
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
