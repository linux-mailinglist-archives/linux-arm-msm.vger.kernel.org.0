Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5F5911C647
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 08:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbfLLHR5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 02:17:57 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39107 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728037AbfLLHR4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 02:17:56 -0500
Received: by mail-pl1-f195.google.com with SMTP id o9so198185plk.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 23:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=czAcFnKFTBHTdpHr0rMVUpWL5U0hh4o4DwfN6VFyqJ4=;
        b=ke8JfGsjS8dennR/6UzeEv5Ky07nDlsuqnCves+J9l/A8SzfCw3dDbm0FvPU7zeE50
         ibnlarpnP7Yk4PTd0n4/8GZ74y6D48nJT91NgaMECN+XbmSNrNwEoRSl6HZgnzDzcQRL
         ipJ8Ef0T5FoYcwzftdVlZMGiG42o1E14UYmrbm50oi+iTzX9uxmsBEFhCo3LF4cBfBqx
         3u+f0oMVVUW2KVL3wIGrSyehKcqtuIbtyJ9apC7tbS+JWiTclmjPmXD6pTWEB4h1IHvR
         gZLxZFomGlGjEDyVa+sL3U2kOBEx13fy5vri9rxTKzipfaYXUOTpS6rtwqxDYZ5bEwIP
         uEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=czAcFnKFTBHTdpHr0rMVUpWL5U0hh4o4DwfN6VFyqJ4=;
        b=UdDsA565g7MDCTwErkrS5nYzP6orm4AevfaDXk4+QClmN9bg6kt4kG+ClXPBnIdHmF
         HwrmpCE4PwIV8KQa9lnMzRjcGq0IuvS9iTRc+apFGjPMMNpzY4LISMkwtYOAFF5N6sij
         RXsq6f782fBAeE+5ifHDiqMI0X8uBoZ6eP/5RNgD1bnfHJfDnXrH75lZ1+wpn89PAe/A
         jXKj0bhYl0FgEftZIYD3Ae8qu2jGScHxUCnOII+6bk976OeySBHGXQMeKR6HoNOh+qAH
         HNjdVBO0Hnrn9RT0ATnmt94hH32nQAD3zclutyGbJqw82eOrrqz8uy5wxQy4DCUUaU33
         cjKw==
X-Gm-Message-State: APjAAAX8me1Ljs/oMph/MRYh8EFPq7L7Cvd3koHhudUHG8MFJHR3VV9f
        ezZhYTefCZLocsSC3FmliTq/fg==
X-Google-Smtp-Source: APXvYqwOlaHdCHfmxqXXIW1guuaCYDo5sz2f3PSVcR4quawA6l9h8sh7Xe4VvLvAmPVdP0SZ9CBzsw==
X-Received: by 2002:a17:902:104:: with SMTP id 4mr8270089plb.130.1576135076097;
        Wed, 11 Dec 2019 23:17:56 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z4sm5681018pfn.42.2019.12.11.23.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 23:17:55 -0800 (PST)
Date:   Wed, 11 Dec 2019 23:17:53 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, jcrouse@codeaurora.org,
        dianders@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] drm/msm/a3xx: set interconnect bandwidth vote
Message-ID: <20191212071753.GM3143381@builder>
References: <20191122012645.7430-1-masneyb@onstation.org>
 <20191122012645.7430-4-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122012645.7430-4-masneyb@onstation.org>
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
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> index 07ddcc529573..eff0ecd4e81a 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> @@ -504,6 +504,14 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
>  		DRM_DEV_ERROR(dev->dev, "No memory protection without IOMMU\n");
>  	}
>  
> +	/*
> +	 * Set the ICC path to maximum speed for now by multiplying the fastest
> +	 * frequency by the bus width (8). We'll want to scale this later on to
> +	 * improve battery life.

I would expect that you have to worry about temperature before battery
life...

Regards,
Bjorn

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
