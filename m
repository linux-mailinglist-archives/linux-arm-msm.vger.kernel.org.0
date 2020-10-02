Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE60280E40
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 09:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgJBHx1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 03:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbgJBHx0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 03:53:26 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D35C0613D0;
        Fri,  2 Oct 2020 00:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=XW2oAnf1nP/NaPgcm7Rs78JJ4Tv+nx++28EAZGgca0o=; b=vZsuh1A0vOzF5XcYtf6FYQay+e
        cua8JGWDRiTZa/D8624BynsoLOs/bvqatzl4naq0J369e214Oaf5sH0wx/Nb3X2SK0jqCztZ0hCD/
        5RW6GA0cIxijQz3ZOnMPv3Jv4hoQSn8roOZS7utCiy9Sut8vnv/cxwN5lPyrRvTXoD5x+fNMPqSAL
        pFZ+xDE8Bi/RehqwInBhmbRzYKcFau4Xw+n6DgE6p9NUFgDgqqAKEhFLhodx+5f1x8OfK87uoxf1i
        XE215FY5GXBqsAK9mtaCcz3DrRngE/sA0niWrYcGOfjl+C+7RXeGRh2TbmXsIQb8FNMU+wIkpXStT
        T75cYj0Q==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kOFsX-0002Vm-DQ; Fri, 02 Oct 2020 07:53:21 +0000
Date:   Fri, 2 Oct 2020 08:53:21 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent
 cache maintenance
Message-ID: <20201002075321.GA7547@infradead.org>
References: <20201001002709.21361-1-jonathan@marek.ca>
 <20201001002709.21361-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001002709.21361-3-jonathan@marek.ca>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> @@ -8,6 +8,7 @@
>  #include <linux/shmem_fs.h>
>  #include <linux/dma-buf.h>
>  #include <linux/pfn_t.h>
> +#include <linux/dma-noncoherent.h>

NAK, dma-noncoherent.h is not for driver use.  And will in fact go
away in 5.10.

>  
>  #include <drm/drm_prime.h>
>  
> @@ -808,6 +809,20 @@ int msm_gem_cpu_fini(struct drm_gem_object *obj)
>  	return 0;
>  }
>  
> +void msm_gem_sync_cache(struct drm_gem_object *obj, uint32_t flags,
> +		size_t range_start, size_t range_end)
> +{
> +	struct msm_gem_object *msm_obj = to_msm_bo(obj);
> +
> +	/* TODO: sync only the required range, and don't invalidate on clean */
> +
> +	if (flags & MSM_GEM_SYNC_CACHE_CLEAN)
> +		sync_for_device(msm_obj);
> +
> +	if (flags & MSM_GEM_SYNC_CACHE_INVALIDATE)
> +		sync_for_cpu(msm_obj);

And make to these ones as well.  They are complete abuses of the DMA
API, and while we had to live with that for now to not cause regressions
they absoutely must not be exposed in a userspace ABI like this.
