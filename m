Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1773820E4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 May 2021 22:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233404AbhEPU26 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 May 2021 16:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233353AbhEPU26 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 May 2021 16:28:58 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 033F9C061573
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 May 2021 13:27:41 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id f12so4771538ljp.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 May 2021 13:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AbJBlzsKGOoI2CAg95RwFNI4w8cM41FRv1nk7z5fJHc=;
        b=KjhDBnFoEOcTlmvMSHz1T4BRhw5VGpuJ76pDSk5fhdwFHFyjWGkvDyX6rDK9U5fBzc
         7zK5gkzx0s3B1GncEvr9XcFlD4qqpwlDfWrBK/JAVhd8oZzRdBkB3R78azsBNGV1dtpe
         H8uCQ127UdHxMHpdC6vq/xGwpXT4Hg98fxx2POAkF5mIlvr3hCbAjLCRHMSeeL8KgS8t
         3BJh/wiJ1sgALTzt+VL55XWt7VeZn8pmSdFd3v3+FtqJbq90IySjYWzgq2emoiMn7Qil
         aEpCqrOkQzNgIV2+kJOJhPEIFpfYpL/pkP+LZTaynonvvNRgDIbrHZ+1wodpbJCCWr/v
         OUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AbJBlzsKGOoI2CAg95RwFNI4w8cM41FRv1nk7z5fJHc=;
        b=eLTqUbFxs/7rQGejV6V5qE1ZFn2TaozS93G0FFLLG4ZU4qSOGeW9nDse/Schnbg9Yc
         KMn9GkIeWOYPMsvdACgFgXqvaIVFSv+7t7q+irkDQJAZTxtt+oRBkFTw1gsGNjQ2LJ03
         QHACWLNdzaa3lm/8HyFmfcN7O+c35evLVBdlfSZJSuthlHCDiPFhzXjb2sjHuciaKW7u
         bcsOOoWcYPFfE/EX2bM9ni7d3MXn59QSSxEqm90dwtmYTpGpeNhP6agQGqDMkKQlbGcu
         ecgnkoEKObyZ11EusFwsUj4NSxU5r9+7bcmoR35I/h7pD+Hm2IHaU5bMHZNAWpj5O2h4
         9OOQ==
X-Gm-Message-State: AOAM5318c2gm8XxiD7jjGI2y3nDzIXwpJAmypGiVl6MYDmaXSXsSRS77
        vsOcg91giH+e/3isCwR2+e7uwg==
X-Google-Smtp-Source: ABdhPJz5IfrOEFXSEYBo1KstqRsesBwgiCVHo7r+QPWbbKUQKGXlcYTL1B+zfZUVuIcMw0GyxfyCKg==
X-Received: by 2002:a2e:b5a2:: with SMTP id f2mr46521053ljn.101.1621196860252;
        Sun, 16 May 2021 13:27:40 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b35sm1739267lfv.82.2021.05.16.13.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 May 2021 13:27:39 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/dpu: simplify dpu_core_irq_en/disable helpers
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20210511141554.629380-1-dmitry.baryshkov@linaro.org>
Message-ID: <6b6cfb61-0858-ce7f-1bf5-966fc552ea53@linaro.org>
Date:   Sun, 16 May 2021 23:27:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210511141554.629380-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/05/2021 17:15, Dmitry Baryshkov wrote:
> dpu_core_irq_en/disable helpers are always called with the irq_count
> equal to 1. Merge them with _dpu_core_en/disable functions and make them
> handle just one interrupt index at a time.
Replacing this patch with the squashing enable/disable into 
register/unregister (part of DPU IRQ rework patchset v2).

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c | 50 ++++----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h | 20 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c  |  4 +-
>   3 files changed, 18 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> index c10761ea191c..0ee9ac21e24a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> @@ -63,11 +63,11 @@ int dpu_core_irq_idx_lookup(struct dpu_kms *dpu_kms,
>   }
>   
>   /**
> - * _dpu_core_irq_enable - enable core interrupt given by the index
> + * dpu_core_irq_enable - enable core interrupt given by the index
>    * @dpu_kms:		Pointer to dpu kms context
>    * @irq_idx:		interrupt index
>    */
> -static int _dpu_core_irq_enable(struct dpu_kms *dpu_kms, int irq_idx)
> +int dpu_core_irq_enable(struct dpu_kms *dpu_kms, int irq_idx)
>   {
>   	unsigned long irq_flags;
>   	int ret = 0, enable_count;
> @@ -85,6 +85,8 @@ static int _dpu_core_irq_enable(struct dpu_kms *dpu_kms, int irq_idx)
>   	}
>   
>   	enable_count = atomic_read(&dpu_kms->irq_obj.enable_counts[irq_idx]);
> +	if (enable_count)
> +		DRM_ERROR("irq_idx=%d enable_count=%d\n", irq_idx, enable_count);
>   	DRM_DEBUG_KMS("irq_idx=%d enable_count=%d\n", irq_idx, enable_count);
>   	trace_dpu_core_irq_enable_idx(irq_idx, enable_count);
>   
> @@ -109,31 +111,12 @@ static int _dpu_core_irq_enable(struct dpu_kms *dpu_kms, int irq_idx)
>   	return ret;
>   }
>   
> -int dpu_core_irq_enable(struct dpu_kms *dpu_kms, int *irq_idxs, u32 irq_count)
> -{
> -	int i, ret = 0, counts;
> -
> -	if (!irq_idxs || !irq_count) {
> -		DPU_ERROR("invalid params\n");
> -		return -EINVAL;
> -	}
> -
> -	counts = atomic_read(&dpu_kms->irq_obj.enable_counts[irq_idxs[0]]);
> -	if (counts)
> -		DRM_ERROR("irq_idx=%d enable_count=%d\n", irq_idxs[0], counts);
> -
> -	for (i = 0; (i < irq_count) && !ret; i++)
> -		ret = _dpu_core_irq_enable(dpu_kms, irq_idxs[i]);
> -
> -	return ret;
> -}
> -
>   /**
> - * _dpu_core_irq_disable - disable core interrupt given by the index
> + * dpu_core_irq_disable - disable core interrupt given by the index
>    * @dpu_kms:		Pointer to dpu kms context
>    * @irq_idx:		interrupt index
>    */
> -static int _dpu_core_irq_disable(struct dpu_kms *dpu_kms, int irq_idx)
> +int dpu_core_irq_disable(struct dpu_kms *dpu_kms, int irq_idx)
>   {
>   	int ret = 0, enable_count;
>   
> @@ -148,6 +131,8 @@ static int _dpu_core_irq_disable(struct dpu_kms *dpu_kms, int irq_idx)
>   	}
>   
>   	enable_count = atomic_read(&dpu_kms->irq_obj.enable_counts[irq_idx]);
> +	if (enable_count > 1)
> +		DRM_ERROR("irq_idx=%d enable_count=%d\n", irq_idx, enable_count);
>   	DRM_DEBUG_KMS("irq_idx=%d enable_count=%d\n", irq_idx, enable_count);
>   	trace_dpu_core_irq_disable_idx(irq_idx, enable_count);
>   
> @@ -164,25 +149,6 @@ static int _dpu_core_irq_disable(struct dpu_kms *dpu_kms, int irq_idx)
>   	return ret;
>   }
>   
> -int dpu_core_irq_disable(struct dpu_kms *dpu_kms, int *irq_idxs, u32 irq_count)
> -{
> -	int i, ret = 0, counts;
> -
> -	if (!irq_idxs || !irq_count) {
> -		DPU_ERROR("invalid params\n");
> -		return -EINVAL;
> -	}
> -
> -	counts = atomic_read(&dpu_kms->irq_obj.enable_counts[irq_idxs[0]]);
> -	if (counts == 2)
> -		DRM_ERROR("irq_idx=%d enable_count=%d\n", irq_idxs[0], counts);
> -
> -	for (i = 0; (i < irq_count) && !ret; i++)
> -		ret = _dpu_core_irq_disable(dpu_kms, irq_idxs[i]);
> -
> -	return ret;
> -}
> -
>   u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx, bool clear)
>   {
>   	if (!dpu_kms->hw_intr)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> index e30775e6585b..2ac781738e83 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> @@ -43,34 +43,30 @@ int dpu_core_irq_idx_lookup(
>   		uint32_t instance_idx);
>   
>   /**
> - * dpu_core_irq_enable - IRQ helper function for enabling one or more IRQs
> + * dpu_core_irq_enable - IRQ helper function for enabling IRQ
>    * @dpu_kms:		DPU handle
> - * @irq_idxs:		Array of irq index
> - * @irq_count:		Number of irq_idx provided in the array
> + * @irq_idx:		irq index
>    * @return:		0 for success enabling IRQ, otherwise failure
>    *
>    * This function increments count on each enable and decrements on each
> - * disable.  Interrupts is enabled if count is 0 before increment.
> + * disable.  Interrupt is enabled if count is 0 before increment.
>    */
>   int dpu_core_irq_enable(
>   		struct dpu_kms *dpu_kms,
> -		int *irq_idxs,
> -		uint32_t irq_count);
> +		int irq_idxs);
>   
>   /**
> - * dpu_core_irq_disable - IRQ helper function for disabling one of more IRQs
> + * dpu_core_irq_disable - IRQ helper function for disabling IRQ
>    * @dpu_kms:		DPU handle
> - * @irq_idxs:		Array of irq index
> - * @irq_count:		Number of irq_idx provided in the array
> + * @irq_idx:		irq index
>    * @return:		0 for success disabling IRQ, otherwise failure
>    *
>    * This function increments count on each enable and decrements on each
> - * disable.  Interrupts is disabled if count is 0 after decrement.
> + * disable.  Interrupt is disabled if count is 0 after decrement.
>    */
>   int dpu_core_irq_disable(
>   		struct dpu_kms *dpu_kms,
> -		int *irq_idxs,
> -		uint32_t irq_count);
> +		int irq_idxs);
>   
>   /**
>    * dpu_core_irq_read - IRQ helper function for reading IRQ status
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 72eb245341bf..e365815e6e28 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -367,7 +367,7 @@ int dpu_encoder_helper_register_irq(struct dpu_encoder_phys *phys_enc,
>   		return ret;
>   	}
>   
> -	ret = dpu_core_irq_enable(phys_enc->dpu_kms, &irq->irq_idx, 1);
> +	ret = dpu_core_irq_enable(phys_enc->dpu_kms, irq->irq_idx);
>   	if (ret) {
>   		DRM_ERROR("enable failed id=%u, intr=%d, hw=%d, irq=%d",
>   			  DRMID(phys_enc->parent), intr_idx, irq->hw_idx,
> @@ -400,7 +400,7 @@ int dpu_encoder_helper_unregister_irq(struct dpu_encoder_phys *phys_enc,
>   		return 0;
>   	}
>   
> -	ret = dpu_core_irq_disable(phys_enc->dpu_kms, &irq->irq_idx, 1);
> +	ret = dpu_core_irq_disable(phys_enc->dpu_kms, irq->irq_idx);
>   	if (ret) {
>   		DRM_ERROR("disable failed id=%u, intr=%d, hw=%d, irq=%d ret=%d",
>   			  DRMID(phys_enc->parent), intr_idx, irq->hw_idx,
> 


-- 
With best wishes
Dmitry
