Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A86F9709D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2019 21:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728100AbfGVTkE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 15:40:04 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:45281 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbfGVTkE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 15:40:04 -0400
Received: by mail-yb1-f196.google.com with SMTP id s41so12652133ybe.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2019 12:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XiPi6NLGAihhHoJX1TQVxa/qSyYbhC/5nUBfiRfN5To=;
        b=DatuO7iFd/gwaby0zE8VcAJc0UoFQHqT7eYDhZPJsVPEYuFar3ijTDWGJZ/oMnBCdn
         NCp5AOREUGLNU/Dl5ElDs7B8Z7kfIDKXdHCT8XENb09BHD9P/OIaYVJ4LvZYQgqy3twJ
         4VZ9Lx+eg6JJesZbxJFhpffym4RjzaZWqh8RchQ4bJWciVRW4DSxxFF1fVwXJngqdsji
         efB18StPJsYCrMvpMIa7gFnp2t7n3WT/xrib079dw3FlU/KE03xS0q5vJO8MR/2y6IWI
         U+0TeStphc7eDtcZZTx90NjrQ0y8Bv3ZJk6WPPbv+jhO6rFnmSUaNQEa40RruUxZGmWo
         PeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XiPi6NLGAihhHoJX1TQVxa/qSyYbhC/5nUBfiRfN5To=;
        b=CPqWv3PodpZtsiFzCg5X0OhFMkQ7YS4IOBZIzcAlPKW6P5kObMuyCf5AkUvXe8Rqk/
         dAng2SFauN1JcXoYMP8G1bs25ZqzXgxGaFQxn4xh4WDSq22R9CpWt3ctMw2dKLV+VjXM
         uHCIs56tEEdr6sZmHpb0wl91JMAwO6wj0dQ7OgVUihprIqoyRT3oE71mENMAbqF5mb8G
         oyYY0tFhh/EkEqC6zsBziVRnj///jLN4CJMpiXpVaDhB/1v+P4NLns67j8xnny18n/YF
         YZMz5mBbdieOnzE/gG0+Pj3wck6eeqcstVHL32NASDdyqy2Y0wtHqjnvxUUx2wbZzjrL
         +uRA==
X-Gm-Message-State: APjAAAV6hjnnFqS6DeWrJhFqUAAeCD2oH5JmfOoWvtyI950Cc9QxCJOT
        bc1K1zG7UXNM6/OnK5J8mUbUKA==
X-Google-Smtp-Source: APXvYqz5SZD7hxqVmR3c0a4NmWzRdFT0snKaXz6JaYvHegDZWvbV9kes8na9VWp1p6aIBtO6/WGxtg==
X-Received: by 2002:a25:e003:: with SMTP id x3mr40966402ybg.225.1563824403688;
        Mon, 22 Jul 2019 12:40:03 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id t201sm9586068ywc.87.2019.07.22.12.40.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 12:40:02 -0700 (PDT)
Date:   Mon, 22 Jul 2019 15:40:02 -0400
From:   Sean Paul <sean@poorly.run>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: stop abusing dma_map/unmap for cache
Message-ID: <20190722194002.GI104440@art_vandelay>
References: <20190630124735.27786-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190630124735.27786-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Cc: Stephen Boyd <sboyd@kernel.org>

Applied to -misc-fixes

Thanks,

Sean

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

-- 
Sean Paul, Software Engineer, Google / Chromium OS
