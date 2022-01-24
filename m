Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D068249842D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jan 2022 17:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240982AbiAXQDy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jan 2022 11:03:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240846AbiAXQDy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jan 2022 11:03:54 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE62BC06173D
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 08:03:53 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id p15so22685668ejc.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 08:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=hHD1I6HBwWXdmu99NOtKXptCdvMp508sRo/7M3HfYGs=;
        b=Z+EuI9Pi5ZDJTsvU0GJbe6u9iQbz09QiMO9lztGoX794vCmEhRU6hlhU9YSGbtQE5j
         NSUsu2eCWgf+isH6LuoPiSSQlDOGV9ZfIbVVkpO+elQEUlHtqHS1E0OFBq7QUfQ0Nz6s
         Qy0ENSro1a5UtnAQAsHkl/PgskYfs0fK29Dis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=hHD1I6HBwWXdmu99NOtKXptCdvMp508sRo/7M3HfYGs=;
        b=MLg2LYV6wba1LrDaI/yqCXAvNE0YDF1JtmVctWLdtzd5stULMPy7SfCcpI71F4Cobb
         2lr/+o19ncn4fAn4UNhgqxDEk9mk2HCsC4Z27k6Yy9XMPunKldFoue361Lg+sAGLDSZ7
         GMwKqH9JA/WC18snjjaIdnY+4CHfKyjiLKGn9sHTBjICkk2U002rUE8qvTIs23E6kFGi
         22YyDfR0K8ahu9gWYDqwg3SsX9+OL5Jri2OC1gI6in0quwxgt/kJ9zpJA2EX+2iwoPaz
         EjTVZbWTKaT44xh8Uy/5amNmVzxeYwlECBx4S4Kf6Id36Jz5k1rP5peLdpKXQ1jgB+fF
         F4rQ==
X-Gm-Message-State: AOAM530j/1vA2RSo5Qc9FwEvb8mQYkDnsI7rI+4quYZPlJMBgzvKRRG7
        2swA3XrV/PzzrVWRtC5Jk49HZw==
X-Google-Smtp-Source: ABdhPJxdVfkKMEYbXujqgWUpyR3+7qh2oP6uKoyQ37sTd705e0vRoEIcpmauPwpBhopTpK2j9FowlQ==
X-Received: by 2002:a17:906:3089:: with SMTP id 9mr12877415ejv.97.1643040232290;
        Mon, 24 Jan 2022 08:03:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id p21sm5051250ejj.156.2022.01.24.08.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 08:03:51 -0800 (PST)
Date:   Mon, 24 Jan 2022 17:03:50 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     ira.weiny@intel.com
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V2 3/7] drm/gma: Remove calls to kmap()
Message-ID: <Ye7N5ZrmVjOBo1RG@phenom.ffwll.local>
Mail-Followup-To: ira.weiny@intel.com, David Airlie <airlied@linux.ie>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20220124015409.807587-1-ira.weiny@intel.com>
 <20220124015409.807587-4-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124015409.807587-4-ira.weiny@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jan 23, 2022 at 05:54:05PM -0800, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> kmap() is being deprecated and these instances are easy to convert to
> kmap_local_page().
> 
> Furthermore, in gma_crtc_cursor_set() use the memcpy_from_page() helper
> instead of an open coded use of kmap_local_page().
> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

Applied to drm-misc-next, the others should all have full time maintainers
to make sure the patches land. Pls holler if not.

Thanks, Daniel

> ---
>  drivers/gpu/drm/gma500/gma_display.c | 6 ++----
>  drivers/gpu/drm/gma500/mmu.c         | 8 ++++----
>  2 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
> index 99da3118131a..60ba7de59139 100644
> --- a/drivers/gpu/drm/gma500/gma_display.c
> +++ b/drivers/gpu/drm/gma500/gma_display.c
> @@ -335,7 +335,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
>  	struct psb_gem_object *pobj;
>  	struct psb_gem_object *cursor_pobj = gma_crtc->cursor_pobj;
>  	struct drm_gem_object *obj;
> -	void *tmp_dst, *tmp_src;
> +	void *tmp_dst;
>  	int ret = 0, i, cursor_pages;
>  
>  	/* If we didn't get a handle then turn the cursor off */
> @@ -400,9 +400,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
>  		/* Copy the cursor to cursor mem */
>  		tmp_dst = dev_priv->vram_addr + cursor_pobj->offset;
>  		for (i = 0; i < cursor_pages; i++) {
> -			tmp_src = kmap(pobj->pages[i]);
> -			memcpy(tmp_dst, tmp_src, PAGE_SIZE);
> -			kunmap(pobj->pages[i]);
> +			memcpy_from_page(tmp_dst, pobj->pages[i], 0, PAGE_SIZE);
>  			tmp_dst += PAGE_SIZE;
>  		}
>  
> diff --git a/drivers/gpu/drm/gma500/mmu.c b/drivers/gpu/drm/gma500/mmu.c
> index fe9ace2a7967..a70b01ccdf70 100644
> --- a/drivers/gpu/drm/gma500/mmu.c
> +++ b/drivers/gpu/drm/gma500/mmu.c
> @@ -184,17 +184,17 @@ struct psb_mmu_pd *psb_mmu_alloc_pd(struct psb_mmu_driver *driver,
>  		pd->invalid_pte = 0;
>  	}
>  
> -	v = kmap(pd->dummy_pt);
> +	v = kmap_local_page(pd->dummy_pt);
>  	for (i = 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
>  		v[i] = pd->invalid_pte;
>  
> -	kunmap(pd->dummy_pt);
> +	kunmap_local(v);
>  
> -	v = kmap(pd->p);
> +	v = kmap_local_page(pd->p);
>  	for (i = 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
>  		v[i] = pd->invalid_pde;
>  
> -	kunmap(pd->p);
> +	kunmap_local(v);
>  
>  	clear_page(kmap(pd->dummy_page));
>  	kunmap(pd->dummy_page);
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
