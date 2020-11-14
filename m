Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D42732B2E6D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Nov 2020 17:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgKNQYJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Nov 2020 11:24:09 -0500
Received: from verein.lst.de ([213.95.11.211]:50560 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726265AbgKNQYJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Nov 2020 11:24:09 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 673BA67373; Sat, 14 Nov 2020 17:24:06 +0100 (CET)
Date:   Sat, 14 Nov 2020 17:24:06 +0100
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
Subject: Re: [RESEND PATCH v2 4/5] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for
 non-coherent cache maintenance
Message-ID: <20201114162406.GC24411@lst.de>
References: <20201114151717.5369-1-jonathan@marek.ca> <20201114151717.5369-5-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201114151717.5369-5-jonathan@marek.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Nov 14, 2020 at 10:17:12AM -0500, Jonathan Marek wrote:
> +void msm_gem_sync_cache(struct drm_gem_object *obj, uint32_t flags,
> +		size_t range_start, size_t range_end)
> +{
> +	struct msm_gem_object *msm_obj = to_msm_bo(obj);
> +	struct device *dev = msm_obj->base.dev->dev;
> +
> +	/* exit early if get_pages() hasn't been called yet */
> +	if (!msm_obj->pages)
> +		return;
> +
> +	/* TODO: sync only the specified range */
> +
> +	if (flags & MSM_GEM_SYNC_FOR_DEVICE) {
> +		dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
> +				msm_obj->sgt->nents, DMA_TO_DEVICE);
> +	}
> +
> +	if (flags & MSM_GEM_SYNC_FOR_CPU) {
> +		dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
> +				msm_obj->sgt->nents, DMA_FROM_DEVICE);
> +	}

Splitting this helper from the only caller is rather strange, epecially
with the two unused arguments.  And I think the way this is specified
to take a range, but ignoring it is actively dangerous.  User space will
rely on it syncing everything sooner or later and then you are stuck.
So just define a sync all primitive for now, and if you really need a
range sync and have actually implemented it add a new ioctl for that.
