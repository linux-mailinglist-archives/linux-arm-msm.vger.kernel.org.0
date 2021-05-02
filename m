Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CEE5370EE5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 May 2021 21:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbhEBT5x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 May 2021 15:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbhEBT5w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 May 2021 15:57:52 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14DD3C06174A
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 May 2021 12:57:01 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id z14so2494456ioc.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 May 2021 12:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cosmicpenguin-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=gPvAJZWsBKk4fZj6ZxVblFP0qVv/BbTQzC5g130CIKc=;
        b=djn7MnYka2JE6ZOVZTB7Eg6LXG95xsIJst2BFoo5N0tko2Rnadw7onBYUCOZakkPfP
         coDY82Ip6vwS1v0DxNpoYsM0iN6hgE62lfblpe+gvZXFPaSHOCMmuIjld8qzGGyEpe1C
         twUTjHRMETOlJyng0KYG5TjuYNozM4pwlIc1sMn8u3nq0Low+Pd9Dd48tF/XLmNqu1l2
         SCE9HQ5WO8DhhNxLpfHAl4/5yeGGp7kWwInyLK2xLQk21223e9dROz/KcJBKeqO2VOn0
         4L6o0h1W8BIRnhlTVuj76POPbyDho9DUskwYNHU7v0/aA9CL2mM7tZZrLYH1iyrHIUDP
         9byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=gPvAJZWsBKk4fZj6ZxVblFP0qVv/BbTQzC5g130CIKc=;
        b=Ww2CGdH4cx+PfnL8P0W1F1iYfGme7yLwgjcBmHt7YzJtuX3gzNbfEHPKNairPnU4Rn
         gTN+/ZM8WxvqfALeMh2PW724ijVMXK+0HcnrCMiaBEFHlEywHkLFjAbQlPYZvWVygRBr
         ewQ+QJDilyTRBF15Kc/ne6GXXpXu5DbjtBDj2PdKpvUNz2Q3BPZxHwnGxeuQy1ba5NSo
         4OQS8PCqTzvNvWxY8MxWDUwNXtZrlVON0+AyZp0U5UpImbCtYszq6CRsksweLVIEyovE
         eiRX1B0R8AuQk8BGL/I1bDXFgsgcC0PWVKsacMWzKraTH+iu6I224saW2zeGqqCohPkj
         Qk6Q==
X-Gm-Message-State: AOAM533HvSvq4dA/0eqeKdrYkXIG807heJ0FJfEKOO7J23eD1C5uu7sf
        7UatRPcaKOMqQamFl5+0D6TX/w==
X-Google-Smtp-Source: ABdhPJwA2XbIZCf4xVMYtaKt4mE+WndUq/OJuf7jI1g0LtSfmBA4vmYAF8D9Z55SteM5ydUUVMlbHw==
X-Received: by 2002:a05:6638:f:: with SMTP id z15mr15105656jao.26.1619985420644;
        Sun, 02 May 2021 12:57:00 -0700 (PDT)
Received: from cosmicpenguin.net (c-71-237-100-236.hsd1.co.comcast.net. [71.237.100.236])
        by smtp.gmail.com with ESMTPSA id y10sm4468287ilv.73.2021.05.02.12.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 12:57:00 -0700 (PDT)
Date:   Sun, 2 May 2021 13:56:58 -0600
From:   Jordan Crouse <jordan@cosmicpenguin.net>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 5/5] drm/msm: deprecate MSM_BO_UNCACHED (map
 as writecombine instead)
Message-ID: <20210502195658.ijhfpuadarlykduw@cosmicpenguin.net>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
        freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Sean Paul <sean@poorly.run>
References: <20210423190833.25319-1-jonathan@marek.ca>
 <20210423190833.25319-6-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210423190833.25319-6-jonathan@marek.ca>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 23, 2021 at 03:08:21PM -0400, Jonathan Marek wrote:
> There shouldn't be any reason to ever use uncached over writecombine,
> so just use writecombine for MSM_BO_UNCACHED.

Extremely correct.

> 
> Note: userspace never used MSM_BO_UNCACHED anyway
> 

Acked-by: Jordan Crouse <jordan@cosmicpenguin.net>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 4 +---
>  include/uapi/drm/msm_drm.h    | 2 +-
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 2e92e80009c8..56bca9178253 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -201,10 +201,8 @@ void msm_gem_put_pages(struct drm_gem_object *obj)
>  
>  static pgprot_t msm_gem_pgprot(struct msm_gem_object *msm_obj, pgprot_t prot)
>  {
> -	if (msm_obj->flags & MSM_BO_WC)
> +	if (msm_obj->flags & (MSM_BO_WC|MSM_BO_UNCACHED))
>  		return pgprot_writecombine(prot);
> -	if (msm_obj->flags & MSM_BO_UNCACHED)
> -		return pgprot_noncached(prot);
>  	return prot;
>  }
>  
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index a92d90a6d96f..f075851021c3 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -94,7 +94,7 @@ struct drm_msm_param {
>  /* cache modes */
>  #define MSM_BO_CACHED        0x00010000
>  #define MSM_BO_WC            0x00020000
> -#define MSM_BO_UNCACHED      0x00040000
> +#define MSM_BO_UNCACHED      0x00040000 /* deprecated, use MSM_BO_WC */
>  #define MSM_BO_CACHED_COHERENT 0x080000
>  
>  #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
> -- 
> 2.26.1
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
