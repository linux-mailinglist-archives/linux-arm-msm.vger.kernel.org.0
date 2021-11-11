Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E92C144DB05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 18:15:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbhKKRSL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 12:18:11 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:42414 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229539AbhKKRSL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 12:18:11 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636650922; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=9ATOQmqTmW60i4WG7OBHPJjTDiTX5iJKy/x0ZGMNLKw=; b=iiEIay9OW2zL1loLeMFf1ZO8rNqVGdNWGsc5pUQk+KhLNpIDXWrY8gAGEHBnrWcRWs7BR+y5
 N/8mukcbkUUFkr8ijPQr2G8fl3RkDm96tUqvmahvkISXsWZtNxGz/xiaV2wlFB72BD/x4P/J
 GfG5o+FyhYXkt2GYRwgCprqESHs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 618d4f9cc51781f169ead686 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Nov 2021 17:15:08
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CDFA7C43619; Thu, 11 Nov 2021 17:15:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [192.168.1.16] (unknown [117.210.184.103])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A096AC4338F;
        Thu, 11 Nov 2021 17:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A096AC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <89cbb324-b111-657f-fb3c-8ece3c21017b@codeaurora.org>
Date:   Thu, 11 Nov 2021 22:44:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 5/5] drm/msm: Add debugfs to disable hw err handling
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20211109181117.591148-1-robdclark@gmail.com>
 <20211109181117.591148-6-robdclark@gmail.com>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
In-Reply-To: <20211109181117.591148-6-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/9/2021 11:41 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add a debugfs interface to ignore hw error irqs, in order to force
> fallback to sw hangcheck mechanism.  Because the hw error detection is
> pretty good on newer gens, we need this for igt tests to test the sw
> hang detection.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 6 ++++++
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
>   drivers/gpu/drm/msm/msm_debugfs.c     | 3 +++
>   drivers/gpu/drm/msm/msm_drv.h         | 9 +++++++++
>   4 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 6163990a4d09..ec8e043c9d38 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1252,6 +1252,7 @@ static void a5xx_fault_detect_irq(struct msm_gpu *gpu)
>   
>   static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
>   {
> +	struct msm_drm_private *priv = gpu->dev->dev_private;
>   	u32 status = gpu_read(gpu, REG_A5XX_RBBM_INT_0_STATUS);
>   
>   	/*
> @@ -1261,6 +1262,11 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
>   	gpu_write(gpu, REG_A5XX_RBBM_INT_CLEAR_CMD,
>   		status & ~A5XX_RBBM_INT_0_MASK_RBBM_AHB_ERROR);
>   
> +	if (priv->disable_err_irq) {
> +		status &= A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS |
> +			  A5XX_RBBM_INT_0_MASK_CP_SW;
> +	}
> +
>   	/* Pass status to a5xx_rbbm_err_irq because we've already cleared it */
>   	if (status & RBBM_ERROR_MASK)
>   		a5xx_rbbm_err_irq(gpu, status);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 3d2da81cb2c9..8a2af3a27e33 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1373,10 +1373,14 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>   
>   static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>   {
> +	struct msm_drm_private *priv = gpu->dev->dev_private;
>   	u32 status = gpu_read(gpu, REG_A6XX_RBBM_INT_0_STATUS);
>   
>   	gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
>   
> +	if (priv->disable_err_irq)
> +		status &= A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS;
> +
>   	if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
>   		a6xx_fault_detect_irq(gpu);
>   
> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> index 6a99e8b5d25d..956b1efc3721 100644
> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> @@ -242,6 +242,9 @@ void msm_debugfs_init(struct drm_minor *minor)
>   	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
>   		&priv->hangcheck_period);
>   
> +	debugfs_create_bool("disable_err_irq", 0600, minor->debugfs_root,
> +		&priv->disable_err_irq);
> +
>   	debugfs_create_file("shrink", S_IRWXU, minor->debugfs_root,
>   		dev, &shrink_fops);
>   
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 2943c21d9aac..a8da7a7efb84 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -246,6 +246,15 @@ struct msm_drm_private {
>   
>   	/* For hang detection, in ms */
>   	unsigned int hangcheck_period;
> +
> +	/**
> +	 * disable_err_irq:
> +	 *
> +	 * Disable handling of GPU hw error interrupts, to force fallback to
> +	 * sw hangcheck timer.  Written (via debugfs) by igt tests to test
> +	 * the sw hangcheck mechanism.
> +	 */
> +	bool disable_err_irq;
>   };
>   
>   struct msm_format {
> 

Reviewed-by: Akhil P Oommen <akhilpo@codeaurora.org>

-Akhil.
