Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE63B2A009B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 10:01:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725801AbgJ3JBA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 05:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgJ3JBA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 05:01:00 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 233D7C0613D2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 02:01:00 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id w14so5556048wrs.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 02:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=lS9cLVa7ki23Q9hV5df0gycL8TDk+suWHefN1yZAvQI=;
        b=bLdnNBx991+fEL6unEVZ8c1nk/xvgTVbXjcGKB4Q1eS8ZXJnv4P81WNLlCMOuLhg2k
         5tqLuwqfha9zMuCOR/TA3MM7zyxv6R0rOWeVT17ffLEMAtqLBJUOOacmfSchNaD+7hBx
         S867tbVvqUZFuoI/p3WrDfaDtGzjnmGbF0xsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lS9cLVa7ki23Q9hV5df0gycL8TDk+suWHefN1yZAvQI=;
        b=MlmhgkDirxCqet3tLqzUIQPcXpoP9WWlcWjtdZQuz470NucCNtfzrsH6C63vqKk+RJ
         XUrCuz2AvzqgxQsVndkaDrkcN4BHQWO1c/PqJ0376ocpS5okk6bLw9lfyXqNbOXETlNP
         z048e1Sy22BG5zaVmMLFXT+uNghc89UoD5llYIZbNuJxn/CNbpWEZQqZGghxUntYmjkY
         Ho5fDF8WG6A5l+gdbEZBl6D/53dd2tll0TcR/AAOyZTxTES/ebjoZPbBl59r25/NqMxV
         WZZscDtquRwx9VdAc9QSLdlHw/Y8iJ8O7EC/TJZIY5FR6tG3knMHr9y95CVyFiGfekJu
         r5ww==
X-Gm-Message-State: AOAM531+lCBYtJkvJMY62WBEOy76jqBPQXaKlbcVP0LJKrlcOpuWF5n2
        sH2mFteSczG41DLuW8+Jh5IuKA==
X-Google-Smtp-Source: ABdhPJwQxYTb0APmo+jOySsAO8r2hc4ifYBDW46GYqt577jI7TaikEFfn1bTiE9MXKtJM6IQK25iZA==
X-Received: by 2002:adf:ab05:: with SMTP id q5mr1682043wrc.32.1604048458831;
        Fri, 30 Oct 2020 02:00:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id f17sm3978456wmh.10.2020.10.30.02.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 02:00:58 -0700 (PDT)
Date:   Fri, 30 Oct 2020 10:00:56 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, tanmay@codeaurora.org,
        khsieh@codeaurora.org, daniel@ffwll.ch,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/4] drm: allow drm_atomic_print_state() to accept any
 drm_printer
Message-ID: <20201030090056.GG401619@phenom.ffwll.local>
References: <20201030010101.4345-1-abhinavk@codeaurora.org>
 <20201030010101.4345-2-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201030010101.4345-2-abhinavk@codeaurora.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 29, 2020 at 06:00:58PM -0700, Abhinav Kumar wrote:
> Currently drm_atomic_print_state() internally allocates and uses a
> drm_info printer. Allow it to accept any drm_printer type so that
> the API can be leveraged even for taking drm snapshot.
> 
> Rename the drm_atomic_print_state() to drm_atomic_print_new_state()
> so that it reflects its functionality better.
> 
> changes in v2:
> - Rename the function drm_atomic_print_state to
>   drm_atomic_print_new_state and update the commit text
> - Fix kbot errors
> - Add kernel doc for the newly exported function
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/drm_atomic.c                  | 29 +++++++++++++++----
>  drivers/gpu/drm/drm_atomic_uapi.c             |  4 ++-
>  drivers/gpu/drm/drm_crtc_internal.h           |  4 ++-
>  .../gpu/drm/selftests/test-drm_framebuffer.c  |  1 +
>  4 files changed, 31 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 58527f151984..5df7b67ced78 100644
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
> @@ -1543,9 +1544,21 @@ int __drm_atomic_helper_set_config(struct drm_mode_set *set,
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_set_config);
>  
> -void drm_atomic_print_state(const struct drm_atomic_state *state)
> +/**
> + * drm_atomic_print_new_state - prints drm atomic state
> + * @state: atomic configuration to check
> + * @p: drm printer
> + *
> + * This functions prints the drm atomic state snapshot using the drm printer
> + * which is passed to it. This snapshot can be used for debugging purposes.
> + *
> + * Note that this function looks into the new state objects and hence its not
> + * safe to be used after the call to drm_atomic_helper_commit_hw_done().
> + *

Empty line here in the docs. With that removed.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> + */
> +void drm_atomic_print_new_state(const struct drm_atomic_state *state,
> +		struct drm_printer *p)
>  {
> -	struct drm_printer p = drm_info_printer(state->dev->dev);
>  	struct drm_plane *plane;
>  	struct drm_plane_state *plane_state;
>  	struct drm_crtc *crtc;
> @@ -1554,17 +1567,23 @@ void drm_atomic_print_state(const struct drm_atomic_state *state)
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
> +EXPORT_SYMBOL(drm_atomic_print_new_state);
>  
>  static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
>  			     bool take_locks)
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 25c269bc4681..b4b3cb28a8ea 100644
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
> +			drm_atomic_print_new_state(state, &p);
>  
>  		ret = drm_atomic_commit(state);
>  	}
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index da96b2f64d7e..2bd56ec9fb0e 100644
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
> +void drm_atomic_print_new_state(const struct drm_atomic_state *state,
> +		struct drm_printer *p);
>  
>  /* drm_atomic_uapi.c */
>  int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
> diff --git a/drivers/gpu/drm/selftests/test-drm_framebuffer.c b/drivers/gpu/drm/selftests/test-drm_framebuffer.c
> index 2d29ea6f92e2..9296c68cbe71 100644
> --- a/drivers/gpu/drm/selftests/test-drm_framebuffer.c
> +++ b/drivers/gpu/drm/selftests/test-drm_framebuffer.c
> @@ -8,6 +8,7 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_mode.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_print.h>
>  
>  #include "../drm_crtc_internal.h"
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
