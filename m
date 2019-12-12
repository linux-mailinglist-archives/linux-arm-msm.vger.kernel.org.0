Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1449711C64C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 08:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbfLLHSP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 02:18:15 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:46951 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728078AbfLLHSP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 02:18:15 -0500
Received: by mail-pj1-f65.google.com with SMTP id z21so628305pjq.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 23:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JgfDuTWeBak9bVM7ZWNPsBAm3+sYB1fLtoFMjb0Fxdw=;
        b=RxxXcjFLgonLF4fmVQ9Uh8NGPA48JCLXcBG419PPiBNe6e/fN4bT3KGOPvAsCdib1s
         CV7whYpnFFggopMXHXah8xrpY8aY0pwmZyDzR08smFDcAuwxKR2Sa4xjVGgiJxBQSm6Z
         5i9ViaE59/8nrQrcp9mRVH41oPVaQcU8Qr9ZPo2HUPw7SVcP/osuBNIHgu/RtPlKNbX/
         6yxBEheHDeIB/oaTQP6sATllHhzDBVffb30K27VGcaJsenKqYw9gcYYxM41KUnIxeoaZ
         V2bCnEheP3IyYIt7YqG/Z8nuhlfHRZ1oqmKawJHvW0upRhf0JvSBVVrFJPefVm2vbB3O
         4qFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JgfDuTWeBak9bVM7ZWNPsBAm3+sYB1fLtoFMjb0Fxdw=;
        b=YP5x531jEhQr9SANrMNyCvdVsXAhgRc072TByR2DrN443t+QB27KJdlewtjESFkGI+
         yq3bjF1Q1wjo3UyhxPqOABrHPl5PsSLYLLWhBhnnv17+eCso++vNionV8heu2d5Xfkx7
         BkQrofKEvXy04dPBV0KDxNF8R1hJ424DiOIurecjwO9G7ZGR/KxY81ojoVLKDnydzsft
         6P8oeJMChC8PvU0/8r48VbYB6N/hydfLSQMYVtOHdw3pBiTINGPs6RI+HrYGkHifs/wl
         0D3DlmJIYlxJIIm253xPCeaTK43LmN6WaUuaoKSdJybvamrcWZBVBgq+kyyDhKgKE+H7
         1xVQ==
X-Gm-Message-State: APjAAAXY54UGKQntlzRdtnW/d5qFe8UqFWBjnfm91UQ4mQcaSl6mHNzm
        /tOgOZqeAjyxh9COqu/ikKMRLw==
X-Google-Smtp-Source: APXvYqy+m0lCq/UpeupyAuDYMkcEh9rkfCM4GG+6qHKYU/CjEuXA+ig6axKgP0DJrVQrHbcsf678BA==
X-Received: by 2002:a17:90a:2808:: with SMTP id e8mr8279272pjd.63.1576135094383;
        Wed, 11 Dec 2019 23:18:14 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i127sm5601071pfc.55.2019.12.11.23.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 23:18:13 -0800 (PST)
Date:   Wed, 11 Dec 2019 23:18:11 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, jcrouse@codeaurora.org,
        dianders@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/msm/a4xx: set interconnect bandwidth vote
Message-ID: <20191212071811.GN3143381@builder>
References: <20191122012645.7430-1-masneyb@onstation.org>
 <20191122012645.7430-5-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122012645.7430-5-masneyb@onstation.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 21 Nov 17:26 PST 2019, Brian Masney wrote:

> Set the two interconnect paths for the GPU to maximum speed for now to
> work towards getting the GPU working upstream. We can revisit a later
> time to optimize this for battery life.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> index b01388a9e89e..253d8d85daad 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -591,6 +591,14 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
>  		goto fail;
>  	}
>  
> +	/*
> +	 * Set the ICC path to maximum speed for now by multiplying the fastest
> +	 * frequency by the bus width (8). We'll want to scale this later on to
> +	 * improve battery life.
> +	 */
> +	icc_set_bw(gpu->icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
> +	icc_set_bw(gpu->ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
> +
>  	return gpu;
>  
>  fail:
> -- 
> 2.21.0
> 
