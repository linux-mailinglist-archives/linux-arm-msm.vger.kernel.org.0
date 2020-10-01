Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64E7C280B67
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 01:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733085AbgJAXsF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 19:48:05 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:39694 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727780AbgJAXsF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 19:48:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601596083; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=6GE3EtQgnkmIsP2dtiobgWeVOTWXks2cDd33yl18lEk=; b=GKxzncNefuAdVJS/C80ockXe8yHzeUInz/txwoKAs7jgiujREXz3AeH1HqTaOMqMy0X3NqSr
 qvwTLBaLNUU/qsY5AaI/1zq0TnoPXKezFBETJqrQpoZEisF4PxKZiJUJoH/05EL6bgykkEbd
 t8Zgnjif5U/R+QnEPxKHB/qLoY0=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f766ab3ebd6fbc87991470c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Oct 2020 23:48:03
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 44D1FC433FE; Thu,  1 Oct 2020 23:48:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 408C0C433C8;
        Thu,  1 Oct 2020 23:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 408C0C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 1 Oct 2020 17:47:58 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Shawn Guo <shawn.guo@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] drm/msm: add MSM_BO_CACHED_COHERENT
Message-ID: <20201001234758.GH29832@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawn.guo@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20201001002709.21361-1-jonathan@marek.ca>
 <20201001002709.21361-2-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001002709.21361-2-jonathan@marek.ca>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 30, 2020 at 08:27:04PM -0400, Jonathan Marek wrote:
> Add a new cache mode for creating coherent host-cached BOs.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
>  drivers/gpu/drm/msm/msm_drv.h              | 1 +
>  drivers/gpu/drm/msm/msm_gem.c              | 8 ++++++++
>  include/uapi/drm/msm_drm.h                 | 5 ++---
>  4 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 9eeb46bf2a5d..2aa707546254 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -410,6 +410,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>  		config.rev.minor, config.rev.patchid);
>  
>  	priv->is_a2xx = config.rev.core == 2;
> +	priv->has_cached_coherent = config.rev.core >= 6;
>  
>  	gpu = info->init(drm);
>  	if (IS_ERR(gpu)) {
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 2c3225bc1794..6384844b1696 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -167,6 +167,7 @@ struct msm_drm_private {
>  	struct msm_file_private *lastctx;
>  	/* gpu is only set on open(), but we need this info earlier */
>  	bool is_a2xx;
> +	bool has_cached_coherent;
>  
>  	struct drm_fb_helper *fbdev;
>  
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index b2f49152b4d4..ad9a627493ae 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -431,6 +431,9 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
>  	if (msm_obj->flags & MSM_BO_MAP_PRIV)
>  		prot |= IOMMU_PRIV;
>  
> +	if (msm_obj->flags & MSM_BO_CACHED_COHERENT)
> +		prot |= IOMMU_CACHE;
> +
>  	WARN_ON(!mutex_is_locked(&msm_obj->lock));
>  
>  	if (WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED))
> @@ -998,6 +1001,7 @@ static int msm_gem_new_impl(struct drm_device *dev,
>  		uint32_t size, uint32_t flags,
>  		struct drm_gem_object **obj)
>  {
> +	struct msm_drm_private *priv = dev->dev_private;
>  	struct msm_gem_object *msm_obj;
>  
>  	switch (flags & MSM_BO_CACHE_MASK) {
> @@ -1005,6 +1009,10 @@ static int msm_gem_new_impl(struct drm_device *dev,
>  	case MSM_BO_CACHED:
>  	case MSM_BO_WC:
>  		break;
> +	case MSM_BO_CACHED_COHERENT:
> +		if (priv->has_cached_coherent)
> +			break;
> +		/* fallthrough */

It confused me that this kind of implicitly fell into the else clause in
msm_gem_mmap_obj, but I'm on board. This is a good solution since it only allows
I/O coherence with caching.

>  	default:
>  		DRM_DEV_ERROR(dev->dev, "invalid cache flag: %x\n",
>  				(flags & MSM_BO_CACHE_MASK));
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index a6c1f3eb2623..474497e8743a 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -94,12 +94,11 @@ struct drm_msm_param {
>  #define MSM_BO_CACHED        0x00010000
>  #define MSM_BO_WC            0x00020000
>  #define MSM_BO_UNCACHED      0x00040000
> +#define MSM_BO_CACHED_COHERENT 0x080000
>  
>  #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
>                                MSM_BO_GPU_READONLY | \
> -                              MSM_BO_CACHED | \
> -                              MSM_BO_WC | \
> -                              MSM_BO_UNCACHED)
> +                              MSM_BO_CACHE_MASK)
>  
>  struct drm_msm_gem_new {
>  	__u64 size;           /* in */
> -- 
> 2.26.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
