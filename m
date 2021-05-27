Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91BFA393952
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 01:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233932AbhE0Xqo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 May 2021 19:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhE0Xqo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 May 2021 19:46:44 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47323C061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 16:45:10 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id e2so3023708ljk.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 16:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Agf93Ei+9Tdc8Zvz0bPaizkEiLAVgHXWf+4M50aPaoE=;
        b=nMLBX5g3X755skTAhGoSjvtud9YhlWMACVOScm/kNloVrVed8R0YJUV775o79Jx9Wl
         MDSDih8RcL440wYlNQpFDNytOoigNMc04LUUwX4qflmZjpJfPGt1d9e8j5xKUVgiNWJq
         UtaarziZM/3+2DOLG1Mp8D1+hrRjYRMFsaGFwMLiCjVw2DLYv0ifSiJT0LHxL4WSJil/
         oSJ82ZDgS/UpNpLj0CnbRLmoeHkbULctk4u2GDbHvm1L7sukyOExw6gXoDTmFQRbFfmr
         rSM0UbGJLzvlMpR2BAwpVz+5XaT7ECbXnuit+qUapS5gUbtJI03LwJhbvNBAg2t9oTfX
         ReoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Agf93Ei+9Tdc8Zvz0bPaizkEiLAVgHXWf+4M50aPaoE=;
        b=bVa6wUWv2aH+SbDJODa6wZvC9BHyn0ONVKE2lJ5LikZyMrLc7LCS37X97uVe/ozHc0
         WFKS4iD1YnQCb7JD9E4gzSm1PFOPNsyCT/B+veh3A33J6SYHMPkeyUKOuPeGlk8JMl+3
         knie+2Nk4Ho7uSnjxSEX7vhqwOuuIsSesa81ZS0SJUCSymQfyIV1k+ehsVjN8dSIUJIz
         xvku78NzPf5Aesd58FyFkRoAhjYhWsvyDLPfslTIwZT3l6P6SnUblmLSxTVeHkMEto8o
         xc1rfQfplo4BE6v0c08cLEoJahFRlq3CmMj0KWaTz11v3b9CZxhzRZVJOJQUMvRyfRdu
         wcsQ==
X-Gm-Message-State: AOAM530QRjO6qEhKy1Tv2dHu03YuSY5vaysc/BgkzLJfK+iBBq4mhk/3
        bD+d7NUh3bVXmtubmxCliKEGnw==
X-Google-Smtp-Source: ABdhPJwpm9LP4ARZQheOF4vnrUK8YBrm3JYilKh6GFbYW+t31vOsjf6nmJE0sqqDaGqQ4CfmeZEBTA==
X-Received: by 2002:a2e:9196:: with SMTP id f22mr4363198ljg.88.1622159108474;
        Thu, 27 May 2021 16:45:08 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s1sm368494ljj.69.2021.05.27.16.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 16:45:07 -0700 (PDT)
Subject: Re: [RFC PATCH 03/13] drm/msm/dsi: add support for dsc data
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-5-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <73815f0b-b6d1-f6f3-d7aa-f77492861967@linaro.org>
Date:   Fri, 28 May 2021 02:45:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521124946.3617862-5-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/05/2021 15:49, Vinod Koul wrote:
> DSC needs some configuration from device tree, add support to read and
> store these params and add DSC structures in msm_drv
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 170 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.h      |  32 ++++++
>   2 files changed, 202 insertions(+)
> 


[skipped]


>   		DRM_DEV_ERROR(dev, "%s: invalid lane configuration %d\n",
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 2668941df529..26661dd43936 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -30,6 +30,7 @@
>   #include <drm/drm_plane_helper.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_fb_helper.h>
> +#include <drm/drm_dsc.h>
>   #include <drm/msm_drm.h>
>   #include <drm/drm_gem.h>
>   
> @@ -70,6 +71,16 @@ enum msm_mdp_plane_property {
>   #define MSM_GPU_MAX_RINGS 4
>   #define MAX_H_TILES_PER_DISPLAY 2
>   
> +/**
> + * enum msm_display_compression_type - compression method used for pixel stream
> + * @MSM_DISPLAY_COMPRESSION_NONE:	Pixel data is not compressed
> + * @MSM_DISPLAY_COMPRESSION_DSC:	DSC compresison is used
> + */
> +enum msm_display_compression_type {
> +	MSM_DISPLAY_COMPRESSION_NONE,
> +	MSM_DISPLAY_COMPRESSION_DSC,
> +};
> +

Seems to be unused

>   /**
>    * enum msm_display_caps - features/capabilities supported by displays
>    * @MSM_DISPLAY_CAP_VID_MODE:           Video or "active" mode supported



-- 
With best wishes
Dmitry
