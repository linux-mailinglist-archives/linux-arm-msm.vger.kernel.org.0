Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAF2A295CCD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 12:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896576AbgJVKit (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 06:38:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2896543AbgJVKit (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 06:38:49 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42463C0613CE
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 03:38:47 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id c194so1445365wme.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 03:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=txbkDvjTNAII8rOC8GSkf0rgFd3hEgAtArEm7k8V/4A=;
        b=THLyInhdAjRNNnVfqtoAC2IKp58xDoy8omOcPdbkUooWMa4rQmjjsu13SBp/XCmuYX
         f+yX7clHSQrfWNbfVFW6Nyf8+AHqDR/bgk8v/tlqx6/v3ioJDCIP/3HDsnFsuF19G/OB
         bZNj4ht7rB2norZzFEahUP4FT+QUUE+vhR0oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=txbkDvjTNAII8rOC8GSkf0rgFd3hEgAtArEm7k8V/4A=;
        b=P1CA10o2NF+zQZAqG/wGYg3mcuI1H/ogEuJv+QvxtPNOBhyfmdePQRdTAvfwYCDhgm
         N/tfqIGLy9v7JAJjxqgcrQ9BQTMR8ab6LJ18ldHc6tTgySeoIvCYw7IKcP+ES7KX3+HJ
         9XMQtfEWMIg4zB8qufQSmAJmJrqI2RoXkIj13b49eo1Wspa7ClL5fCwd5iQRvONzj4dF
         mcAHCoKGus2Fafh38u8YyHIkWHE59Wiq5xFGnWPwZwF82bbXKfSHnNgOiYldlcHAAdHd
         2i1cUiY6gKY0SEOLw26KkiN9oYaZGWR10xIxZnrwtWB3vQttrVBsk01Tsxj3Xct/VmVI
         8C2A==
X-Gm-Message-State: AOAM533SHz/tTToT5duZRrn065XQPitrZzCTQC5OHGPrwkUtM/ma8Olk
        yu2GeR9/rvutfL7EB8/5kV4FC/g8uoqf0+QK
X-Google-Smtp-Source: ABdhPJzpM5anNGxMyIxf5ktXINVJdO0Pf1jqmjbpv7vlMP/5DSCjq9O985xrRCSV4G83AfwEV8uojA==
X-Received: by 2002:a1c:1f87:: with SMTP id f129mr1960742wmf.182.1603363125943;
        Thu, 22 Oct 2020 03:38:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 205sm2986262wme.38.2020.10.22.03.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 03:38:45 -0700 (PDT)
Date:   Thu, 22 Oct 2020 12:38:43 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
        tanmay@codeaurora.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm: allow drm_atomic_print_state() to accept any
 drm_printer
Message-ID: <20201022103843.GW401619@phenom.ffwll.local>
References: <20201022050148.27105-1-abhinavk@codeaurora.org>
 <20201022050148.27105-2-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201022050148.27105-2-abhinavk@codeaurora.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 21, 2020 at 10:01:45PM -0700, Abhinav Kumar wrote:
> Currently drm_atomic_print_state() internally allocates and uses a
> drm_info printer. Allow it to accept any drm_printer type so that
> the API can be leveraged even for taking drm snapshot.
> 
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/drm_atomic.c        | 17 ++++++++++++-----
>  drivers/gpu/drm/drm_atomic_uapi.c   |  4 +++-
>  drivers/gpu/drm/drm_crtc_internal.h |  4 +++-
>  3 files changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 58527f151984..e7079a5f439c 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1,6 +1,7 @@
>  /*
>   * Copyright (C) 2014 Red Hat
>   * Copyright (C) 2014 Intel Corp.
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining a
>   * copy of this software and associated documentation files (the "Software"),
> @@ -1543,9 +1544,9 @@ int __drm_atomic_helper_set_config(struct drm_mode_set *set,
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_set_config);
>  
> -void drm_atomic_print_state(const struct drm_atomic_state *state)
> +void drm_atomic_print_state(const struct drm_atomic_state *state,
> +		struct drm_printer *p)

Please add a nice kerneldoc for this newly exported function. Specifically
this kerneldoc needs to include a warning that state updates after call
drm_atomic_state_helper_commit_hw_done() is unsafe to print using this
function, because it looks at the new state objects. Only the old state
structures will stay like this.

So maybe rename the function to say print_new_state() to make this
completely clear. That way we can eventually add a print_old_state() when
needed.

Otherwise I think this makes sense, and nicely avoids the locking issue of
looking at ->state pointers without the right locking.
-Daniel

>  {
> -	struct drm_printer p = drm_info_printer(state->dev->dev);
>  	struct drm_plane *plane;
>  	struct drm_plane_state *plane_state;
>  	struct drm_crtc *crtc;
> @@ -1554,17 +1555,23 @@ void drm_atomic_print_state(const struct drm_atomic_state *state)
>  	struct drm_connector_state *connector_state;
>  	int i;
>  
> +	if (!p) {
> +		DRM_ERROR("invalid drm printer\n");
> +		return;
> +	}
> +
>  	DRM_DEBUG_ATOMIC("checking %p\n", state);
>  
>  	for_each_new_plane_in_state(state, plane, plane_state, i)
> -		drm_atomic_plane_print_state(&p, plane_state);
> +		drm_atomic_plane_print_state(p, plane_state);
>  
>  	for_each_new_crtc_in_state(state, crtc, crtc_state, i)
> -		drm_atomic_crtc_print_state(&p, crtc_state);
> +		drm_atomic_crtc_print_state(p, crtc_state);
>  
>  	for_each_new_connector_in_state(state, connector, connector_state, i)
> -		drm_atomic_connector_print_state(&p, connector_state);
> +		drm_atomic_connector_print_state(p, connector_state);
>  }
> +EXPORT_SYMBOL(drm_atomic_print_state);
>  
>  static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
>  			     bool take_locks)
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 25c269bc4681..d9ae86c92608 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -2,6 +2,7 @@
>   * Copyright (C) 2014 Red Hat
>   * Copyright (C) 2014 Intel Corp.
>   * Copyright (C) 2018 Intel Corp.
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining a
>   * copy of this software and associated documentation files (the "Software"),
> @@ -1294,6 +1295,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  	struct drm_out_fence_state *fence_state;
>  	int ret = 0;
>  	unsigned int i, j, num_fences;
> +	struct drm_printer p = drm_info_printer(dev->dev);
>  
>  	/* disallow for drivers not supporting atomic: */
>  	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
> @@ -1413,7 +1415,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  		ret = drm_atomic_nonblocking_commit(state);
>  	} else {
>  		if (drm_debug_enabled(DRM_UT_STATE))
> -			drm_atomic_print_state(state);
> +			drm_atomic_print_state(state, &p);
>  
>  		ret = drm_atomic_commit(state);
>  	}
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index da96b2f64d7e..d34215366936 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -5,6 +5,7 @@
>   *   Jesse Barnes <jesse.barnes@intel.com>
>   * Copyright © 2014 Intel Corporation
>   *   Daniel Vetter <daniel.vetter@ffwll.ch>
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining a
>   * copy of this software and associated documentation files (the "Software"),
> @@ -233,7 +234,8 @@ int __drm_atomic_helper_disable_plane(struct drm_plane *plane,
>  int __drm_atomic_helper_set_config(struct drm_mode_set *set,
>  				   struct drm_atomic_state *state);
>  
> -void drm_atomic_print_state(const struct drm_atomic_state *state);
> +void drm_atomic_print_state(const struct drm_atomic_state *state,
> +		struct drm_printer *p);
>  
>  /* drm_atomic_uapi.c */
>  int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
