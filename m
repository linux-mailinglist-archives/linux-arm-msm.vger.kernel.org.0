Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D61142DA69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 15:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhJNNdF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 09:33:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbhJNNdF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 09:33:05 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5F43C061753
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 06:30:59 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id y26so27067029lfa.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 06:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nYqa67lm5E//W60F2Mgg5y1RQnUdgAfwOX5N53JTmxA=;
        b=AOVClIDg1A9GB1XR0lVG+H44NgN+RDgQhZC/4yO/IKAb2ahOUlP3mYp2HZnadw5xhD
         P2Th1ZUNehmFEdHhu25dpgNUwY7QB0OQaF+vJeRNqGiYAreKIU2ewL2l64F3Wuw3EREB
         fib9IDDbaEQ/qs/a/f+tqg9zGIKgtPUKJKMq444uNykT5wYLJMupXYCIynrwwm6550pP
         NhcYX/DUVexV07yeo5teCTcvuhvv5MH7s1ykLM4k3VM16yjtaLIOEfg/hWzLzPb5sLuw
         CzCjnYtXYbebZSGh5ouBJPUwW/RVLRmESdbiEV0F9WLwFyn4Ev4kGW70iLeOqA4iOIVo
         fKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nYqa67lm5E//W60F2Mgg5y1RQnUdgAfwOX5N53JTmxA=;
        b=0YOym6YIp59aMxOQ20fThonRz8ZvlN1Qnd3SPVWgFnS63M6hOLtYvgYSTXJNnGChik
         EZTvvmGa/kAGT9KWfpmBR+m/5Gs5wAoDOXUkcbkIg0beDrOQug7+uv7GmvlPCmW+6P9k
         zukktgj9opFC6TAqH/BsGLsODOI8IMjvdTaKiUPzZUP3NIQz8tZUE2RZfMtfsxuw1m8g
         PKE23bTisMw1OCX3SKZZbVFFzvRTy2OLzg3ySGFkGuvhZQiQBXHp+9GGvEtQ78NSprr8
         AWCPwY7hbydotWdQVqq+r68tDXl6yP4TGv3JwInmoImJacDqxmHGkxwKp1+z0u7vTLVQ
         jQFw==
X-Gm-Message-State: AOAM530Jd6OuovXSov3XnnljztVWX/uUgO4DcuKtOMwWiaEf4piVy/II
        xRue1F54HKhqCT8maISSzqzLWg==
X-Google-Smtp-Source: ABdhPJxsfTG2G5HFwTy75pL+xb47B6UhHSXnLoYvrtKTDpGu/+nE3fuL74jCLm0qjvOW0+ItO72snQ==
X-Received: by 2002:a2e:750e:: with SMTP id q14mr6174147ljc.338.1634218258211;
        Thu, 14 Oct 2021 06:30:58 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o12sm229960lfl.33.2021.10.14.06.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 06:30:57 -0700 (PDT)
Subject: Re: [PATCH v2 03/11] drm/msm/disp/dpu1: Add support for DSC in
 pingpong block
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-4-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <14b405b7-8d12-73a2-0b52-f140ff642557@linaro.org>
Date:   Thu, 14 Oct 2021 16:30:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211007070900.456044-4-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/10/2021 10:08, Vinod Koul wrote:
> In SDM845, DSC can be enabled by writing to pingpong block registers, so
> add support for DSC in hw_pp
> 
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 32 +++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 ++++++++
>   2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 55766c97c4c8..47c6ab6caf95 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -28,6 +28,9 @@
>   #define PP_FBC_MODE                     0x034
>   #define PP_FBC_BUDGET_CTL               0x038
>   #define PP_FBC_LOSSY_MODE               0x03C
> +#define PP_DSC_MODE                     0x0a0
> +#define PP_DCE_DATA_IN_SWAP             0x0ac
> +#define PP_DCE_DATA_OUT_SWAP            0x0c8
>   
>   #define PP_DITHER_EN			0x000
>   #define PP_DITHER_BITDEPTH		0x004
> @@ -245,6 +248,32 @@ static u32 dpu_hw_pp_get_line_count(struct dpu_hw_pingpong *pp)
>   	return line;
>   }
>   
> +static int dpu_hw_pp_dsc_enable(struct dpu_hw_pingpong *pp)
> +{
> +	struct dpu_hw_blk_reg_map *c = &pp->hw;
> +
> +	DPU_REG_WRITE(c, PP_DSC_MODE, 1);
> +	return 0;
> +}
> +
> +static void dpu_hw_pp_dsc_disable(struct dpu_hw_pingpong *pp)
> +{
> +	struct dpu_hw_blk_reg_map *c = &pp->hw;
> +
> +	DPU_REG_WRITE(c, PP_DSC_MODE, 0);
> +}
> +
> +static int dpu_hw_pp_setup_dsc(struct dpu_hw_pingpong *pp)
> +{
> +	struct dpu_hw_blk_reg_map *pp_c = &pp->hw;
> +	int data;
> +
> +	data = DPU_REG_READ(pp_c, PP_DCE_DATA_OUT_SWAP);
> +	data |= BIT(18); /* endian flip */
> +	DPU_REG_WRITE(pp_c, PP_DCE_DATA_OUT_SWAP, data);
> +	return 0;
> +}
> +
>   static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>   				unsigned long features)
>   {
> @@ -256,6 +285,9 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>   	c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
>   	c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
>   	c->ops.get_line_count = dpu_hw_pp_get_line_count;
> +	c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> +	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> +	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
>   
>   	if (test_bit(DPU_PINGPONG_DITHER, &features))
>   		c->ops.setup_dither = dpu_hw_pp_setup_dither;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> index 89d08a715c16..12758468d9ca 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> @@ -124,6 +124,20 @@ struct dpu_hw_pingpong_ops {
>   	 */
>   	void (*setup_dither)(struct dpu_hw_pingpong *pp,
>   			struct dpu_hw_dither_cfg *cfg);
> +	/**
> +	 * Enable DSC
> +	 */
> +	int (*enable_dsc)(struct dpu_hw_pingpong *pp);
> +
> +	/**
> +	 * Disable DSC
> +	 */
> +	void (*disable_dsc)(struct dpu_hw_pingpong *pp);
> +
> +	/**
> +	 * Setup DSC
> +	 */
> +	int (*setup_dsc)(struct dpu_hw_pingpong *pp);
>   };
>   
>   struct dpu_hw_merge_3d;
> 


-- 
With best wishes
Dmitry
