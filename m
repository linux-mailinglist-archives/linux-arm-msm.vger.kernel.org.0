Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DFA14213D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 18:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236336AbhJDQUT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 12:20:19 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:27783 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235249AbhJDQUR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 12:20:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633364308; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=SKqejxIT/P8GAHWrZuMInz6vjEvPr2YZ0BNWg+ce9Z4=; b=LKZWXMxgyKGMh2t75CYQbHdzYJtvx9SLBoDAw0pYaKnOzyauoH/RdwLLP8bWEkKT/4h/KHoM
 SUSqt+yHf65siQneJHa/dsMIAtoSkCogUqSEF47BKq1UbSZSaZemse1tmwMAsgNVT0xdIw9I
 0X7TIHUSuHAbkthRj0vRNtVUcYI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 615b2944a5a9bab6e84dc78d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 04 Oct 2021 16:18:12
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4F4B6C4361B; Mon,  4 Oct 2021 16:18:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.10] (unknown [117.210.177.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E9BA4C4338F;
        Mon,  4 Oct 2021 16:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E9BA4C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <afdf991d-0012-609b-b0e6-232cc8e9f3f0@codeaurora.org>
Date:   Mon, 4 Oct 2021 21:48:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH] drm/msm/a6xx: Serialize GMU communication
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Eric Anholt <eric@anholt.net>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20211001193241.1348868-1-robdclark@gmail.com>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
In-Reply-To: <20211001193241.1348868-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/2/2021 1:02 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> I've seen some crashes in our crash reporting that *look* like multiple
> threads stomping on each other while communicating with GMU.  So wrap
> all those paths in a lock.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  6 ++++
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  3 ++
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 40 +++++++++++++++++++++++----
>   3 files changed, 43 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index a7c58018959f..8b73f70766a4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -296,6 +296,8 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>   	u32 val;
>   	int request, ack;
>   
> +	WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
> +
>   	if (state >= ARRAY_SIZE(a6xx_gmu_oob_bits))
>   		return -EINVAL;
>   
> @@ -337,6 +339,8 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>   {
>   	int bit;
>   
> +	WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
> +
>   	if (state >= ARRAY_SIZE(a6xx_gmu_oob_bits))
>   		return;
>   
> @@ -1482,6 +1486,8 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>   	if (!pdev)
>   		return -ENODEV;
>   
> +	mutex_init(&gmu->lock);
> +
>   	gmu->dev = &pdev->dev;
>   
>   	of_dma_configure(gmu->dev, node, true);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 3c74f64e3126..84bd516f01e8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -44,6 +44,9 @@ struct a6xx_gmu_bo {
>   struct a6xx_gmu {
>   	struct device *dev;
>   
> +	/* For serializing communication with the GMU: */
> +	struct mutex lock;
> +
>   	struct msm_gem_address_space *aspace;
>   
>   	void * __iomem mmio;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index f6a4dbef796b..bd7bdeff5d6f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -881,7 +881,7 @@ static int a6xx_zap_shader_init(struct msm_gpu *gpu)
>   	  A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
>   	  A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR)
>   
> -static int a6xx_hw_init(struct msm_gpu *gpu)
> +static int hw_init(struct msm_gpu *gpu)
>   {
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>   	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> @@ -1135,6 +1135,19 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>   	return ret;
>   }
>   
> +static int a6xx_hw_init(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	int ret;
> +
> +	mutex_lock(&a6xx_gpu->gmu.lock);
> +	ret = hw_init(gpu);
> +	mutex_unlock(&a6xx_gpu->gmu.lock);
> +
> +	return ret;
> +}
> +
>   static void a6xx_dump(struct msm_gpu *gpu)
>   {
>   	DRM_DEV_INFO(&gpu->pdev->dev, "status:   %08x\n",
> @@ -1509,7 +1522,9 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
>   
>   	trace_msm_gpu_resume(0);
>   
> +	mutex_lock(&a6xx_gpu->gmu.lock);
>   	ret = a6xx_gmu_resume(a6xx_gpu);
> +	mutex_unlock(&a6xx_gpu->gmu.lock);
>   	if (ret)
>   		return ret;
>   
> @@ -1532,7 +1547,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
>   
>   	msm_devfreq_suspend(gpu);
>   
> +	mutex_lock(&a6xx_gpu->gmu.lock);
>   	ret = a6xx_gmu_stop(a6xx_gpu);
> +	mutex_unlock(&a6xx_gpu->gmu.lock);
>   	if (ret)
>   		return ret;
>   
> @@ -1547,18 +1564,19 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>   {
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>   	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> -	static DEFINE_MUTEX(perfcounter_oob);
>   
> -	mutex_lock(&perfcounter_oob);
> +	mutex_lock(&a6xx_gpu->gmu.lock);
>   
>   	/* Force the GPU power on so we can read this register */
>   	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
>   
>   	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO,
> -		REG_A6XX_CP_ALWAYS_ON_COUNTER_HI);
> +			    REG_A6XX_CP_ALWAYS_ON_COUNTER_HI);
>   
>   	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
> -	mutex_unlock(&perfcounter_oob);
> +
> +	mutex_unlock(&a6xx_gpu->gmu.lock);
> +
>   	return 0;
>   }
>   
> @@ -1622,6 +1640,16 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
>   	return (unsigned long)busy_time;
>   }
>   
> +void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +
> +	mutex_lock(&a6xx_gpu->gmu.lock);
> +	a6xx_gmu_set_freq(gpu, opp);
> +	mutex_unlock(&a6xx_gpu->gmu.lock);
> +}
> +
>   static struct msm_gem_address_space *
>   a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
>   {
> @@ -1766,7 +1794,7 @@ static const struct adreno_gpu_funcs funcs = {
>   #endif
>   		.gpu_busy = a6xx_gpu_busy,
>   		.gpu_get_freq = a6xx_gmu_get_freq,
> -		.gpu_set_freq = a6xx_gmu_set_freq,
> +		.gpu_set_freq = a6xx_gpu_set_freq,
>   #if defined(CONFIG_DRM_MSM_GPU_STATE)
>   		.gpu_state_get = a6xx_gpu_state_get,
>   		.gpu_state_put = a6xx_gpu_state_put,
> 

I think I overlooked this because every hw access is serialized in the 
downstream driver.

Reviewed-by: Akhil P Oommen <akhilpo@codeaurora.org>

-Akhil
