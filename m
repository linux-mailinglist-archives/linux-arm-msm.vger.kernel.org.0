Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 935162B2E69
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Nov 2020 17:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgKNQWC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Nov 2020 11:22:02 -0500
Received: from verein.lst.de ([213.95.11.211]:50548 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726716AbgKNQWB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Nov 2020 11:22:01 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id B112867373; Sat, 14 Nov 2020 17:21:59 +0100 (CET)
Date:   Sat, 14 Nov 2020 17:21:59 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno@lists.freedesktop.org, hch@lst.de,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH v2 3/5] drm/msm: call dma_direct_bypass()
Message-ID: <20201114162159.GB24411@lst.de>
References: <20201114151717.5369-1-jonathan@marek.ca> <20201114151717.5369-4-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201114151717.5369-4-jonathan@marek.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Nov 14, 2020 at 10:17:11AM -0500, Jonathan Marek wrote:
> Always use direct dma ops and no swiotlb.
> 
> Note: arm-smmu-qcom already avoids creating iommu dma ops, but not
> everything uses arm-smmu-qcom and this also sets the dma mask.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/Kconfig   | 1 +
>  drivers/gpu/drm/msm/msm_drv.c | 8 +++++---
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index e5816b498494..07c50405970a 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -20,6 +20,7 @@ config DRM_MSM
>  	select SND_SOC_HDMI_CODEC if SND_SOC
>  	select SYNC_FILE
>  	select PM_OPP
> +	select DMA_OPS_BYPASS
>  	help
>  	  DRM/KMS driver for MSM/snapdragon.
>  
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 49685571dc0e..bae48afca82e 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/dma-mapping.h>
> +#include <linux/dma-direct.h>
>  #include <linux/kthread.h>
>  #include <linux/uaccess.h>
>  #include <uapi/linux/sched/types.h>
> @@ -1288,10 +1289,11 @@ static int msm_pdev_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto fail;
>  
> -	/* on all devices that I am aware of, iommu's which can map
> -	 * any address the cpu can see are used:
> +	/* always use direct dma ops and no swiotlb

Again, and implementation detail.  Comments should not explain details
obvious from the code (especially layers away) but the intent.
