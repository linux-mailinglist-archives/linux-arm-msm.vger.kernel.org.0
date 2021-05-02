Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 636E6370ED7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 May 2021 21:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232396AbhEBTwZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 May 2021 15:52:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232341AbhEBTwY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 May 2021 15:52:24 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54122C06138B
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 May 2021 12:51:32 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id l21so2524277iob.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 May 2021 12:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cosmicpenguin-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=6wTSvRjZRCi7xWaHiuXeBW7eizhhGCMmkX8gXontjew=;
        b=yHlSVYqKpW87aQPAUbBHrY2IZxb40wNCc3Amztn6HHkkrwkJOgSL9p/15fPdMBvQHq
         cRWFvkAhN+yS18R4hU4CCXEgPOw0IajehcefiMLA7+nrsjUmf/MWvNPPi0sewfwJ++Xi
         kNsEUWVt5wJQ538dsJACfI+oe1rU6es0dQLtD9haznjCBlaKetoT6Wo7+rXVNKgV/TvG
         LHicek52p/T8LqxlWgwddH0WPHdBo6ekCCTZKSeVIKRArSc7q+OYG+skOIngZC3n1Wjr
         7cYbPSPLiJG0nZ/KJweEoOO7mw9wAHR6XarEWo+s5sEKPfiFj+y+u9KEHMNK+Rj6wo13
         QIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=6wTSvRjZRCi7xWaHiuXeBW7eizhhGCMmkX8gXontjew=;
        b=ZB9t1zDUW8zPe+OvqEyTjhfj5spWNhyTecMJkj+CPyndP3C3LZWqTyOen0JYJke262
         xaxWD9glOrIMSELn2HUZ/pPMEqU6nrMqe2COuwxC1wLypQfihsmc48aNU2P+uKYZL7zD
         1LxbYnp4jdO7K1octDjL+6KnZVC4AgvZ2dzCHYw5/rnv9A/4KnhsU1YbjEP8vZ0vj6Ey
         +mZvkVUQxp/eEuMC0tP0MR3hqylQUdtrtIAobOQJpEGQugOsq+ixevSAgSYxnJaVrbuw
         QquunEB7HOp87Q9gWuhMqcMDhJGqoIu2cKCAH/P/NQ5weTNV9o218RyIMx99XWlktrCk
         7Kmw==
X-Gm-Message-State: AOAM5335tX33WAvu918jpNjTyeXNrXYDB0ZgzJ2G0DMWRjBuxkxT3K/T
        00h7U5+n6QPS0x1UhtYbujVE/Q==
X-Google-Smtp-Source: ABdhPJxp10aKOLy+kwLqwyA0HIpwpx3dNzwSCoRuQezU/nzXYRn+E/Iz8jRZ77Q++14vSEI3kxyaiA==
X-Received: by 2002:a02:cc:: with SMTP id 195mr15669716jaa.73.1619985091752;
        Sun, 02 May 2021 12:51:31 -0700 (PDT)
Received: from cosmicpenguin.net (c-71-237-100-236.hsd1.co.comcast.net. [71.237.100.236])
        by smtp.gmail.com with ESMTPSA id w10sm4473063ilm.38.2021.05.02.12.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 12:51:31 -0700 (PDT)
Date:   Sun, 2 May 2021 13:51:29 -0600
From:   Jordan Crouse <jordan@cosmicpenguin.net>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 1/5] drm/msm: remove unnecessary mmap logic for cached BOs
Message-ID: <20210502195129.jqayhebdlslpet67@cosmicpenguin.net>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
        freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>
References: <20210423190833.25319-1-jonathan@marek.ca>
 <20210423190833.25319-2-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210423190833.25319-2-jonathan@marek.ca>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 23, 2021 at 03:08:17PM -0400, Jonathan Marek wrote:
> No one knows what this is for anymore, so just remove it.

Acked-by: Jordan Crouse <jordan@cosmicpenguin.net>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index b199942266a2..09abda42d764 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -207,21 +207,12 @@ int msm_gem_mmap_obj(struct drm_gem_object *obj,
>  	vma->vm_flags &= ~VM_PFNMAP;
>  	vma->vm_flags |= VM_MIXEDMAP;
>  
> -	if (msm_obj->flags & MSM_BO_WC) {
> +	if (msm_obj->flags & MSM_BO_WC)
>  		vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
> -	} else if (msm_obj->flags & MSM_BO_UNCACHED) {
> +	else if (msm_obj->flags & MSM_BO_UNCACHED)
>  		vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
> -	} else {
> -		/*
> -		 * Shunt off cached objs to shmem file so they have their own
> -		 * address_space (so unmap_mapping_range does what we want,
> -		 * in particular in the case of mmap'd dmabufs)
> -		 */
> -		vma->vm_pgoff = 0;
> -		vma_set_file(vma, obj->filp);
> -
> +	else
>  		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> -	}
>  
>  	return 0;
>  }
> -- 
> 2.26.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
