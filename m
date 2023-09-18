Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E91417A466E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Sep 2023 11:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239017AbjIRJyZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Sep 2023 05:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241129AbjIRJyP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Sep 2023 05:54:15 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 45094F1;
        Mon, 18 Sep 2023 02:54:09 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E70581FB;
        Mon, 18 Sep 2023 02:54:45 -0700 (PDT)
Received: from [10.57.64.210] (unknown [10.57.64.210])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4383F3F67D;
        Mon, 18 Sep 2023 02:54:05 -0700 (PDT)
Message-ID: <dd441c88-ce2d-86b9-7f88-340bb26fdb16@arm.com>
Date:   Mon, 18 Sep 2023 10:54:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 3/6] drm/panfrost: Add fdinfo support for memory stats
Content-Language: en-GB
To:     =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
        robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, robh@kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        healych@amazon.com, kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>
References: <20230914223928.2374933-1-adrian.larumbe@collabora.com>
 <20230914223928.2374933-4-adrian.larumbe@collabora.com>
From:   Steven Price <steven.price@arm.com>
In-Reply-To: <20230914223928.2374933-4-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/09/2023 23:38, Adrián Larumbe wrote:
> A new DRM GEM object function is added so that drm_show_memory_stats can
> provide more accurate memory usage numbers.
> 
> Ideally, in panfrost_gem_status, the BO's purgeable flag would be checked
> after locking the driver's shrinker mutex, but drm_show_memory_stats takes
> over the drm file's object handle database spinlock, so there's potential
> for a race condition here.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c |  2 ++
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 14 ++++++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index a8d02273afab..ef6563cf5f7e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -567,6 +567,8 @@ static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>  	struct panfrost_device *pfdev = dev->dev_private;
>  
>  	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
> +
> +	drm_show_memory_stats(p, file);
>  }
>  
>  static const struct file_operations panfrost_drm_driver_fops = {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 3c812fbd126f..7d8f83d20539 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -195,6 +195,19 @@ static int panfrost_gem_pin(struct drm_gem_object *obj)
>  	return drm_gem_shmem_pin(&bo->base);
>  }
>  
> +static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_object *obj)
> +{
> +	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
> +	enum drm_gem_object_status res = 0;
> +
> +	res |= (bo->base.madv == PANFROST_MADV_DONTNEED) ?
> +		DRM_GEM_OBJECT_PURGEABLE : 0;
> +
> +	res |= (bo->base.pages) ? DRM_GEM_OBJECT_RESIDENT : 0;
> +
> +	return res;
> +}
> +
>  static const struct drm_gem_object_funcs panfrost_gem_funcs = {
>  	.free = panfrost_gem_free_object,
>  	.open = panfrost_gem_open,
> @@ -206,6 +219,7 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
>  	.vmap = drm_gem_shmem_object_vmap,
>  	.vunmap = drm_gem_shmem_object_vunmap,
>  	.mmap = drm_gem_shmem_object_mmap,
> +	.status = panfrost_gem_status,
>  	.vm_ops = &drm_gem_shmem_vm_ops,
>  };
>  

