Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 409711E5ACA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 10:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726914AbgE1I3a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 04:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbgE1I3a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 04:29:30 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92591C05BD1E
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 01:29:28 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k26so2228550wmi.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 01:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3a+6oUJ3RVAXmDVoeSWKckQbnvzhZe/iIrVHhbckTSA=;
        b=ERqBDMdAnQDYPD9KzJ57eRE4d+vU/o813ShwTbfBLtbCPVIBgTaGUk/HN4PKVgHz5s
         ssiiZRJ60nWDc+hDFscU9QlTDVUzDb9MRNK98C0hJwkIiyOSSelVGtknQyCpx4ES2ly1
         yNdD/WL4E0sqjH6i2/6NDVraxFVCuAVJXsZxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3a+6oUJ3RVAXmDVoeSWKckQbnvzhZe/iIrVHhbckTSA=;
        b=NMCiyAJ0+9zrWBwt2d4oEMkHbm/dKO7Hp0i9H5fmHZwD61L5oRd91nlg5MbbC4JXPL
         M9pTEFmviBBWyoaxWHjjnR+UbNcgPrcIyIkrOV10aqnXrWCQkNi9CSxgThTmxgxSOY29
         NBe8+4XzDwPfFcuhma08fND8NXLJd9AyTNlvzKD4y6zL6waF+JC3Qx6+5iH6CduRzPad
         lUlTGl3mF86lqRhcIHwnEJV6f4dRrRWxTVfZ7XDqdSNm5u/f6jaNyrkJgdFBBes1sm9b
         XKVBYox2mrnycA73gQzTzE5VV+nyRmEtGWsHkSGGlmDruy/fTSzf8qZ58KNjClvR24nv
         6z8g==
X-Gm-Message-State: AOAM531xYn+noQLfnDIl970tjR2sD8i5ImHuxXMTB7ixF1aQZx7pcxcJ
        6kZGI/FUInL1Hv0cx3N01dd5dA==
X-Google-Smtp-Source: ABdhPJw4yVmexsCHhZYQAMfsaB18NxRGTxyj/lu3EJI0gih192r5q6aVr+bET/fdfmcmLb2vss9cyA==
X-Received: by 2002:a05:600c:2201:: with SMTP id z1mr2224541wml.70.1590654567303;
        Thu, 28 May 2020 01:29:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y4sm5288810wro.91.2020.05.28.01.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 01:29:26 -0700 (PDT)
Date:   Thu, 28 May 2020 10:29:24 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm: Don't call dma_buf_vunmap without _vmap
Message-ID: <20200528082924.GT206103@phenom.ffwll.local>
References: <20200511093554.211493-2-daniel.vetter@ffwll.ch>
 <20200514201117.465146-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514201117.465146-1-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 14, 2020 at 10:11:17PM +0200, Daniel Vetter wrote:
> I honestly don't exactly understand what's going on here, but the
> current code is wrong for sure: It calls dma_buf_vunmap without ever
> calling dma_buf_vmap.
> 
> What I'm not sure about is whether the WARN_ON is correct:
> - msm imports dma-buf using drm_prime_sg_to_page_addr_arrays. Which is
>   a pretty neat layering violation of how you shouldn't peek behind
>   the curtain of the dma-buf exporter, but par for course. Note that
>   all the nice new helpers don't (and we should probably have a bit a
>   warning about this in the kerneldoc).
> 
> - but then in the get_vaddr() in msm_gem.c, we seems to happily wrap a
>   vmap() around any object with ->pages set (so including imported
>   dma-buf).
> 
> - I'm not seeing any guarantees that userspace can't use an imported
>   dma-buf for e.g. MSM_SUBMIT_CMD_BUF in a5xx_submit_in_rb, so no
>   guarantees that an imported dma-buf won't end up with a ->vaddr set.
> 
> But even if that WARN_ON is wrong, cleaning up a vmap() done by msm by
> calling dma_buf_vunmap is the wrong thing to do.
> 
> v2: Rob said in review that we do indeed have a gap in get_vaddr() that
> needs to be plugged. But the users I've found aren't legit users on
> imported dma-buf, so we can just reject that.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org

Ping for some review/ack so I can start landing thist stuff please?

Thanks, Daniel

> ---
>  drivers/gpu/drm/msm/msm_gem.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 5a6a79fbc9d6..e70abd1cde43 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -554,6 +554,9 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
>  	struct msm_gem_object *msm_obj = to_msm_bo(obj);
>  	int ret = 0;
>  
> +	if (obj->import_attach)
> +		return ERR_PTR(-ENODEV);
> +
>  	mutex_lock(&msm_obj->lock);
>  
>  	if (WARN_ON(msm_obj->madv > madv)) {
> @@ -907,8 +910,7 @@ static void free_object(struct msm_gem_object *msm_obj)
>  	put_iova(obj);
>  
>  	if (obj->import_attach) {
> -		if (msm_obj->vaddr)
> -			dma_buf_vunmap(obj->import_attach->dmabuf, msm_obj->vaddr);
> +		WARN_ON(msm_obj->vaddr);
>  
>  		/* Don't drop the pages for imported dmabuf, as they are not
>  		 * ours, just free the array we allocated:
> -- 
> 2.26.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
