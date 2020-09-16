Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCA1126C958
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 21:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727497AbgIPTHn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 15:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727359AbgIPRoz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 13:44:55 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F8A8C0698D3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 04:35:20 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id z9so2645156wmk.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 04:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DdTA+P9lRhC68qI4dpVtWpzlyCIniGzxdHE1O+Q7zUU=;
        b=VZm53vKzP2cW6qF7XV0KSRt5PPELHpk07zG//Mxa2CBTIBDdZdST/S+s0rdEQKVsZW
         gTZ1OWjoGqV/1N91UgOzFqec1vf3PElY/ngrFrKXGmjuOOcYrYiRpj5tf2Kdv9HG27Xk
         tCQbqYKzbNGq1n8DixVR/dUuMsm1DSxiACKH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DdTA+P9lRhC68qI4dpVtWpzlyCIniGzxdHE1O+Q7zUU=;
        b=CeCkWrOenXrWM27xQHrxpOkp0jjhxLYUuepunWMmpZ2RhUrc7ZA5UbPT3qfKFIihkO
         CUTScI/IA0npToIiOUcK3UZS5bZtlwguJlfddPjnKenldIN/lkEggeTrakkYWTwHzicx
         J6TRw+ussrZC1wN6TG5upCYrYsAuHjktqFdDcnO8VaSkUZuQ5waJ1WBRaYXrpJ1AYGBl
         lsZk8ROeHlCycrScjCC/iqVu24G4cHfrJvZgJbxI7YX8fUqKrNoxawdJZBaThGujHJfc
         Amq4zQxkcrvOYpyGokbTQhRbDVlN7t4Fo6h0v+6KrtwjRIXg/o5Fr2anfXiNEEB1oDlF
         YaTw==
X-Gm-Message-State: AOAM530+q28GcJxJ2ASKppgEfxoh2ia0jDK75rdfjSpH4jZqH83AJW3G
        BVIaORIWYAJBg7TV3bdR4f4HgA==
X-Google-Smtp-Source: ABdhPJylkcOBbGgEGGZKZhaBAwyH9kqk9RFSGhRv17hk61GEhNulx96NJ9Vhx8cdjXcbwhCg7LMEDQ==
X-Received: by 2002:a05:600c:2109:: with SMTP id u9mr3990398wml.147.1600256118887;
        Wed, 16 Sep 2020 04:35:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id g14sm4163583wrv.25.2020.09.16.04.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 04:35:18 -0700 (PDT)
Date:   Wed, 16 Sep 2020 13:35:14 +0200
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
Subject: Re: [PATCH v2 07/21] drm/mediatek: Introduce GEM object functions
Message-ID: <20200916113514.GK438822@phenom.ffwll.local>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-8-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-8-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 15, 2020 at 04:59:44PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in mediatek. The only exception is gem_prime_mmap,
> which is non-trivial to convert.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c |  5 -----
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 11 +++++++++++
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 040a8f393fe2..2f8d0043fca7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -301,18 +301,13 @@ struct drm_gem_object *mtk_drm_gem_prime_import(struct drm_device *dev,
>  static struct drm_driver mtk_drm_driver = {
>  	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  
> -	.gem_free_object_unlocked = mtk_drm_gem_free_object,
> -	.gem_vm_ops = &drm_gem_cma_vm_ops,
>  	.dumb_create = mtk_drm_gem_dumb_create,
>  
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>  	.gem_prime_import = mtk_drm_gem_prime_import,
> -	.gem_prime_get_sg_table = mtk_gem_prime_get_sg_table,
>  	.gem_prime_import_sg_table = mtk_gem_prime_import_sg_table,
>  	.gem_prime_mmap = mtk_drm_gem_mmap_buf,
> -	.gem_prime_vmap = mtk_drm_gem_prime_vmap,
> -	.gem_prime_vunmap = mtk_drm_gem_prime_vunmap,
>  	.fops = &mtk_drm_fops,
>  
>  	.name = DRIVER_NAME,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> index 6190cc3b7b0d..591b90410e4a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -8,11 +8,20 @@
>  #include <drm/drm.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_gem.h>
> +#include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_prime.h>
>  
>  #include "mtk_drm_drv.h"
>  #include "mtk_drm_gem.h"
>  
> +static const struct drm_gem_object_funcs mtk_drm_gem_object_funcs = {
> +	.free = mtk_drm_gem_free_object,
> +	.get_sg_table = mtk_gem_prime_get_sg_table,
> +	.vmap = mtk_drm_gem_prime_vmap,
> +	.vunmap = mtk_drm_gem_prime_vunmap,
> +	.vm_ops = &drm_gem_cma_vm_ops,
> +};
> +
>  static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
>  						unsigned long size)
>  {
> @@ -25,6 +34,8 @@ static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
>  	if (!mtk_gem_obj)
>  		return ERR_PTR(-ENOMEM);
>  
> +	mtk_gem_obj->base.funcs = &mtk_drm_gem_object_funcs;
> +
>  	ret = drm_gem_object_init(dev, &mtk_gem_obj->base, size);
>  	if (ret < 0) {
>  		DRM_ERROR("failed to initialize gem object\n");
> -- 
> 2.28.0

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
