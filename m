Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F16CC6D15E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2019 17:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbfGRPtZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jul 2019 11:49:25 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48996 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727767AbfGRPtZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jul 2019 11:49:25 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 259FB61195; Thu, 18 Jul 2019 15:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563464964;
        bh=v5hhjA/iytoDxv8ni3GeH5pwLTR7rQrwabw5e/yLgzY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W44UTwtvRjwynILo9LYMGbSzofJqMKPKPmsR6yxk9HksSCWlHPSPDb+Vw0zqdd39Q
         VW+JLcJYhc1ebrMCXO/nDQ0onkI2IVKB1SOydiUwkW5CF4CjmIa21DaYa8k+cRX+kR
         faYf6rXT8WMpoowIETMS+svwBj7Hdu2doi4SVN08=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5B35A61195;
        Thu, 18 Jul 2019 15:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563464962;
        bh=v5hhjA/iytoDxv8ni3GeH5pwLTR7rQrwabw5e/yLgzY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Tqm5NqXz54lQg0ShP9wjPWjNx5HLOVrE6qKdPt6u8BoVv1LVnSyp2l3pz0idbXzq7
         bibMQuSOdOml73rnmAHbUrVPZLVxTTdqhGXimmfP/LPLvVzZdddTDA//6PRohgWAre
         K/HPtYPE7SaNryJjHR09gdGo9yhYUDjb9+oNYKCI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5B35A61195
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 18 Jul 2019 09:49:19 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH] drm/msm: stop abusing dma_map/unmap for cache
Message-ID: <20190718154918.GA25162@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Sean Paul <sean@poorly.run>
References: <20190630124735.27786-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190630124735.27786-1-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 30, 2019 at 05:47:22AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Recently splats like this started showing up:
> 
>    WARNING: CPU: 4 PID: 251 at drivers/iommu/dma-iommu.c:451 __iommu_dma_unmap+0xb8/0xc0
>    Modules linked in: ath10k_snoc ath10k_core fuse msm ath mac80211 uvcvideo cfg80211 videobuf2_vmalloc videobuf2_memops vide
>    CPU: 4 PID: 251 Comm: kworker/u16:4 Tainted: G        W         5.2.0-rc5-next-20190619+ #2317
>    Hardware name: LENOVO 81JL/LNVNB161216, BIOS 9UCN23WW(V1.06) 10/25/2018
>    Workqueue: msm msm_gem_free_work [msm]
>    pstate: 80c00005 (Nzcv daif +PAN +UAO)
>    pc : __iommu_dma_unmap+0xb8/0xc0
>    lr : __iommu_dma_unmap+0x54/0xc0
>    sp : ffff0000119abce0
>    x29: ffff0000119abce0 x28: 0000000000000000
>    x27: ffff8001f9946648 x26: ffff8001ec271068
>    x25: 0000000000000000 x24: ffff8001ea3580a8
>    x23: ffff8001f95ba010 x22: ffff80018e83ba88
>    x21: ffff8001e548f000 x20: fffffffffffff000
>    x19: 0000000000001000 x18: 00000000c00001fe
>    x17: 0000000000000000 x16: 0000000000000000
>    x15: ffff000015b70068 x14: 0000000000000005
>    x13: 0003142cc1be1768 x12: 0000000000000001
>    x11: ffff8001f6de9100 x10: 0000000000000009
>    x9 : ffff000015b78000 x8 : 0000000000000000
>    x7 : 0000000000000001 x6 : fffffffffffff000
>    x5 : 0000000000000fff x4 : ffff00001065dbc8
>    x3 : 000000000000000d x2 : 0000000000001000
>    x1 : fffffffffffff000 x0 : 0000000000000000
>    Call trace:
>     __iommu_dma_unmap+0xb8/0xc0
>     iommu_dma_unmap_sg+0x98/0xb8
>     put_pages+0x5c/0xf0 [msm]
>     msm_gem_free_work+0x10c/0x150 [msm]
>     process_one_work+0x1e0/0x330
>     worker_thread+0x40/0x438
>     kthread+0x12c/0x130
>     ret_from_fork+0x10/0x18
>    ---[ end trace afc0dc5ab81a06bf ]---
> 
> Not quite sure what triggered that, but we really shouldn't be abusing
> dma_{map,unmap}_sg() for cache maint.

I'm sure we'll see this rear its head again someday. My kingdom for leaf driver
cache control that makes sense.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index d31d9f927887..3b84cbdcafa3 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -108,7 +108,7 @@ static struct page **get_pages(struct drm_gem_object *obj)
>  		 * because display controller, GPU, etc. are not coherent:
>  		 */
>  		if (msm_obj->flags & (MSM_BO_WC|MSM_BO_UNCACHED))
> -			dma_map_sg(dev->dev, msm_obj->sgt->sgl,
> +			dma_sync_sg_for_device(dev->dev, msm_obj->sgt->sgl,
>  					msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
>  	}
>  
> @@ -138,7 +138,7 @@ static void put_pages(struct drm_gem_object *obj)
>  			 * GPU, etc. are not coherent:
>  			 */
>  			if (msm_obj->flags & (MSM_BO_WC|MSM_BO_UNCACHED))
> -				dma_unmap_sg(obj->dev->dev, msm_obj->sgt->sgl,
> +				dma_sync_sg_for_cpu(obj->dev->dev, msm_obj->sgt->sgl,
>  					     msm_obj->sgt->nents,
>  					     DMA_BIDIRECTIONAL);
>  
> -- 
> 2.20.1
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
