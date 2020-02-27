Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1997F172102
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 15:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730394AbgB0OqH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 09:46:07 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54156 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730792AbgB0OqE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 09:46:04 -0500
Received: by mail-wm1-f65.google.com with SMTP id f15so3869559wml.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 06:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=F2gjVLSODMHUZo+chy/rw+dNvmT9xzhamxH2f5vMKWE=;
        b=jqpN3cjh8bM99imYmGKQ+LsS32Sq3BGys6BFB8o5Y5pOyENRq6tVroncKq6wQe1aI8
         6jKlJHtdoSKWQSuHZQEr6oBtK74QoD8JX/6fIhvPSac+Ox/q97TjWlg0EkQMvra9jqHT
         Bxeg0lWGca5nWSscjtLYJUFT3Y2MROlincY98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=F2gjVLSODMHUZo+chy/rw+dNvmT9xzhamxH2f5vMKWE=;
        b=L6+MMpaZLyiYPIQ/iMAajKsyjAv93M/OMKJ+UXBCWfAV6Nt77Rh6T+DmI162FOOZH3
         vgKFYPXOG/cPnIu3HHIkM0N021Q+O4ys8IeS6HBsSt+gzj10/6NEmxtQoei1bcH00QVH
         BtsvQIc4Dwi0Bx/DRLypIBM2HCiODj7J31nJaz230kSPtNAGt0x0qgwgxkJuixy+/rO+
         hY4SQcRmp6g3nuLmjleW+V3C/AM8p9bDWFIuLtUn+uQMqKMQ9ir4olU7DLpb2StJ5xcd
         CwUpefidUK97liWeCuzpzyDv6M82S5lwFCYIRtP67p26QaRGXDygQ8hJ5dZBP0jvMSkc
         vwzA==
X-Gm-Message-State: APjAAAUYfwnYb1YPEYIXwT+K/kqR3b980xItqYmKoFgYL7xShdBz7D9c
        nNj07ZBGC9Lj419CloNl9VOw6+91vN0=
X-Google-Smtp-Source: APXvYqwxrKj4WniunzHatT5iQR5GkZCjpM1cDCopQReD4SqDThK+dYg+hWhCi064b9V73MhyjjAJoQ==
X-Received: by 2002:a1c:9915:: with SMTP id b21mr5361405wme.24.1582814762530;
        Thu, 27 Feb 2020 06:46:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a9sm8150099wmm.15.2020.02.27.06.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 06:46:01 -0800 (PST)
Date:   Thu, 27 Feb 2020 15:45:58 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Wambui Karuga <wambui.karugax@gmail.com>
Cc:     daniel@ffwll.ch, airlied@linux.ie, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 12/21] drm/msm: remove checks for return value of
 drm_debugfs functions.
Message-ID: <20200227144558.GW2363188@phenom.ffwll.local>
Mail-Followup-To: Wambui Karuga <wambui.karugax@gmail.com>,
        airlied@linux.ie, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
 <20200227120232.19413-13-wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227120232.19413-13-wambui.karugax@gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 27, 2020 at 03:02:23PM +0300, Wambui Karuga wrote:
> Since commit 987d65d01356 (drm: debugfs: make
> drm_debugfs_create_files() never fail), drm_debugfs_create_files() does
> not fail, and should return void. This change therefore removes the
> checks of its return value in drm/msm and subsequent error handling.
> 
> These changes also enable the changing of various debugfs_init()
> functions to return void.
> 
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>

I think msm_kms_funcs->debugfs_init could also be made to return void. But
that's quite a bit more involved so doesn't make much sense to do that as
part of this patch series.

Also the debug/core_perf/ files look kinda funny, if I'd bet this is used
by the qualcomm hwc somewhere to make it's decisions :-) That's at least
what's been the case everywhere else I spotted something like that.
-Daniel

> ---
>  drivers/gpu/drm/msm/adreno/a5xx_debugfs.c | 18 +++++-------------
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 14 +++-----------
>  drivers/gpu/drm/msm/msm_debugfs.c         | 21 ++++++---------------
>  drivers/gpu/drm/msm/msm_debugfs.h         |  2 +-
>  drivers/gpu/drm/msm/msm_gpu.h             |  2 +-
>  5 files changed, 16 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
> index 075ecce4b5e0..8cae2ca4af6b 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
> @@ -148,27 +148,19 @@ reset_set(void *data, u64 val)
>  DEFINE_SIMPLE_ATTRIBUTE(reset_fops, NULL, reset_set, "%llx\n");
>  
>  
> -int a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
> +void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
>  {
>  	struct drm_device *dev;
> -	int ret;
>  
>  	if (!minor)
> -		return 0;
> +		return;
>  
>  	dev = minor->dev;
>  
> -	ret = drm_debugfs_create_files(a5xx_debugfs_list,
> -			ARRAY_SIZE(a5xx_debugfs_list),
> -			minor->debugfs_root, minor);
> -
> -	if (ret) {
> -		DRM_DEV_ERROR(dev->dev, "could not install a5xx_debugfs_list\n");
> -		return ret;
> -	}
> +	drm_debugfs_create_files(a5xx_debugfs_list,
> +				 ARRAY_SIZE(a5xx_debugfs_list),
> +				 minor->debugfs_root, minor);
>  
>  	debugfs_create_file("reset", S_IWUGO, minor->debugfs_root, dev,
>  			    &reset_fops);
> -
> -	return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 6650f478b226..41b461128bbc 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -259,17 +259,9 @@ static struct drm_info_list mdp5_debugfs_list[] = {
>  
>  static int mdp5_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
>  {
> -	struct drm_device *dev = minor->dev;
> -	int ret;
> -
> -	ret = drm_debugfs_create_files(mdp5_debugfs_list,
> -			ARRAY_SIZE(mdp5_debugfs_list),
> -			minor->debugfs_root, minor);
> -
> -	if (ret) {
> -		DRM_DEV_ERROR(dev->dev, "could not install mdp5_debugfs_list\n");
> -		return ret;
> -	}
> +	drm_debugfs_create_files(mdp5_debugfs_list,
> +				 ARRAY_SIZE(mdp5_debugfs_list),
> +				 minor->debugfs_root, minor);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> index 1c74381a4fc9..3c958f311bbc 100644
> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> @@ -214,31 +214,22 @@ int msm_debugfs_late_init(struct drm_device *dev)
>  	return ret;
>  }
>  
> -int msm_debugfs_init(struct drm_minor *minor)
> +void msm_debugfs_init(struct drm_minor *minor)
>  {
>  	struct drm_device *dev = minor->dev;
>  	struct msm_drm_private *priv = dev->dev_private;
> -	int ret;
> +	int ret = 0;
>  
> -	ret = drm_debugfs_create_files(msm_debugfs_list,
> -			ARRAY_SIZE(msm_debugfs_list),
> -			minor->debugfs_root, minor);
> -
> -	if (ret) {
> -		DRM_DEV_ERROR(dev->dev, "could not install msm_debugfs_list\n");
> -		return ret;
> -	}
> +	drm_debugfs_create_files(msm_debugfs_list,
> +				 ARRAY_SIZE(msm_debugfs_list),
> +				 minor->debugfs_root, minor);
>  
>  	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
>  		dev, &msm_gpu_fops);
>  
>  	if (priv->kms && priv->kms->funcs->debugfs_init) {
> -		ret = priv->kms->funcs->debugfs_init(priv->kms, minor);
> -		if (ret)
> -			return ret;
> +		priv->kms->funcs->debugfs_init(priv->kms, minor);
>  	}
> -
> -	return ret;
>  }
>  #endif
>  
> diff --git a/drivers/gpu/drm/msm/msm_debugfs.h b/drivers/gpu/drm/msm/msm_debugfs.h
> index 2b91f8c178ad..ef58f66abbb3 100644
> --- a/drivers/gpu/drm/msm/msm_debugfs.h
> +++ b/drivers/gpu/drm/msm/msm_debugfs.h
> @@ -8,7 +8,7 @@
>  #define __MSM_DEBUGFS_H__
>  
>  #ifdef CONFIG_DEBUG_FS
> -int msm_debugfs_init(struct drm_minor *minor);
> +void msm_debugfs_init(struct drm_minor *minor);
>  #endif
>  
>  #endif /* __MSM_DEBUGFS_H__ */
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index be5bc2e8425c..6ccae4ba905c 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -57,7 +57,7 @@ struct msm_gpu_funcs {
>  	void (*show)(struct msm_gpu *gpu, struct msm_gpu_state *state,
>  			struct drm_printer *p);
>  	/* for generation specific debugfs: */
> -	int (*debugfs_init)(struct msm_gpu *gpu, struct drm_minor *minor);
> +	void (*debugfs_init)(struct msm_gpu *gpu, struct drm_minor *minor);
>  #endif
>  	unsigned long (*gpu_busy)(struct msm_gpu *gpu);
>  	struct msm_gpu_state *(*gpu_state_get)(struct msm_gpu *gpu);
> -- 
> 2.25.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
