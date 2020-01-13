Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1E713993D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 19:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728748AbgAMSrB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 13:47:01 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:40526 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728682AbgAMSrB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 13:47:01 -0500
Received: by mail-pj1-f65.google.com with SMTP id bg7so4651120pjb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 10:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nkKcrpfRktLxX1CbhkASh0ZgiXrDCjQ/rkJuojojUnc=;
        b=ujQRXp2YvLtclnx11K7oBOcejLFOyQFwj58UqRNU7zBtRruAaLk67YO50bm6mKRVxA
         J6yWNPN9lmNc/uDHMN9uHLppYs5g/BbWlz6M7Ipu6fESZZRjxwan3w1AD+KcYeem66YA
         uKQepQRA4TVALY8wjWJ4bEuH+yhECR7zrhX5KdaR1AcTq6j5MKAjS8sZlN8xSzB2NVRc
         yVitHUurf+dhp08Ai6grh7+AyqQhtp5yDX11Kv0pDcqVIKJJfuArmh6uI1YpjMeNQVws
         GiDqE1uRZM2M0sW6N7/M3Zl3Isk/ycic+VwC5rrRkiY7EsTCoE9fp3595p9UiPyLhWTl
         I0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nkKcrpfRktLxX1CbhkASh0ZgiXrDCjQ/rkJuojojUnc=;
        b=l7WzwhMhQzFpSgSo9WPJUlwVoIl68Wx2ptVzbHkGVeKLnOoZXRRF+O9Y9hf8m5gvgM
         h9JfTOBflxtoShG+6TtQEjQeMYesCd3g7TXsMJdtDulbb984aaToih9rwMLTlPEaLRtp
         SQMnyyrdLKNlKWKOKzFvgLSpecu+4LjT2PHcG7P0tgx/rhAMywW0aMVGxQY0f8yUwHMn
         XOQUdrXQeDkHx3apIgAYMorXvuSa4nm4RwdK/73NZyMgetZuOadLVzvGxeIasF2hZBbR
         L7YfwSJ07gleYY02UYRYyxH8OWLVt+FyfLYuvHSaqICYQ36XZ9rdLSf2EjOdSYNJPy0r
         RKXA==
X-Gm-Message-State: APjAAAV3mYE4RJKIoBARmtPAH3FFO7xChwCgIPaWQnSd20XeeCSLunvX
        zoopqIzBGTz0WYSTvsx4LlJAWA==
X-Google-Smtp-Source: APXvYqxJZXXWOV0LcU0vL+gUH24Y47uvIirDua/ouRmYSRHpxMBcNqnxv6yjKM4MR8jtBciwh/Y71g==
X-Received: by 2002:a17:90b:11d7:: with SMTP id gv23mr23879662pjb.94.1578941220805;
        Mon, 13 Jan 2020 10:47:00 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b19sm14726680pfo.56.2020.01.13.10.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 10:47:00 -0800 (PST)
Date:   Mon, 13 Jan 2020 10:46:57 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Brian Masney <masneyb@onstation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] drm/msm: allow zapfw to not be specified in
 gpulist
Message-ID: <20200113184657.GD1511@yoga>
References: <20200112195405.1132288-1-robdclark@gmail.com>
 <20200112195405.1132288-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200112195405.1132288-3-robdclark@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 12 Jan 11:53 PST 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> For newer devices we want to require the path to come from the
> firmware-name property in the zap-shader dt node.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 456bb5af1717..c146c3b8f52b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -79,9 +79,21 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>  		ret = request_firmware_direct(&fw, fwname, gpu->dev->dev);
>  		if (ret)
>  			fw = ERR_PTR(ret);
> -	} else {
> +	} else if (fwname) {
>  		/* Request the MDT file from the default location: */
>  		fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
> +	} else {
> +		/*
> +		 * For new targets, we require the firmware-name property,
> +		 * if a zap-shader is required, rather than falling back
> +		 * to a firmware name specified in gpulist.
> +		 *
> +		 * Because the firmware is signed with a (potentially)
> +		 * device specific key, having the name come from gpulist
> +		 * was a bad idea, and is only provided for backwards
> +		 * compatibility for older targets.
> +		 */
> +		return -ENODEV;
>  	}
>  
>  	if (IS_ERR(fw)) {
> @@ -170,14 +182,6 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
>  		return -EPROBE_DEFER;
>  	}
>  
> -	/* Each GPU has a target specific zap shader firmware name to use */
> -	if (!adreno_gpu->info->zapfw) {
> -		zap_available = false;
> -		DRM_DEV_ERROR(&pdev->dev,
> -			"Zap shader firmware file not specified for this target\n");
> -		return -ENODEV;
> -	}
> -
>  	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
>  }
>  
> -- 
> 2.24.1
> 
