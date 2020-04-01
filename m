Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C82EA19ABB4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2020 14:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgDAMa1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 08:30:27 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:33903 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732352AbgDAMa0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 08:30:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585744225; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=Z0Xp87Y05y0UuIbXR2bnYutLCxiJ/10ostDEHWR1uEI=; b=xWPkk1JnGUSxZogLTg0hGpHB0C1TaYzgrosmeWjBGAogIXvBB79AJ9WtUULoDAyFA8SpnlhJ
 tGRIWPjF6f55K2sFsi1bgVCZOo6cT9kzn9zOWDkNC3GGRxpCiqfhKJiOGHfXfjZXo8gfapGk
 Edf7y/YCO7uBY5yHE5UiG//7yvg=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e848952.7effb8087d88-smtp-out-n02;
 Wed, 01 Apr 2020 12:30:10 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0CB72C44791; Wed,  1 Apr 2020 12:30:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.227] (unknown [49.204.179.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C624AC433BA;
        Wed,  1 Apr 2020 12:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C624AC433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
Subject: Re: [PATCH 3/5] drm: msm: scale DDR BW along with GPU frequency
To:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        sibis@codeaurora.org, saravanak@google.com, viresh.kumar@linaro.org
References: <1585641353-23229-1-git-send-email-smasetty@codeaurora.org>
 <1585641353-23229-4-git-send-email-smasetty@codeaurora.org>
 <20200331172600.GB11573@jcrouse1-lnx.qualcomm.com>
From:   Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <929d84c4-bbb8-0c3f-52c0-c82c2055da46@codeaurora.org>
Date:   Wed, 1 Apr 2020 18:00:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200331172600.GB11573@jcrouse1-lnx.qualcomm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/31/2020 10:56 PM, Jordan Crouse wrote:
> On Tue, Mar 31, 2020 at 01:25:51PM +0530, Sharat Masetty wrote:
>> This patch adds support to parse the OPP tables attached the GPU device,
>> the main opp table and the DDR bandwidth opp table. Additionally, vote
>> for the GPU->DDR bandwidth when setting the GPU frequency by querying
>> the linked DDR BW opp to the GPU opp.
>>
>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 41 ++++++++++++++++++++++++++----
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 44 +++++++++++++++++++++++++++++----
>>   drivers/gpu/drm/msm/msm_gpu.h           |  9 +++++++
>>   3 files changed, 84 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 748cd37..489d9b6 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -100,6 +100,40 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
>>   		A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_CLK_OFF));
>>   }
>>
>> +void a6xx_gmu_set_icc_vote(struct msm_gpu *gpu, unsigned long gpu_freq)
>> +{
>> +	struct dev_pm_opp *gpu_opp, *ddr_opp;
>> +	struct opp_table **tables = gpu->opp_tables;
>> +	unsigned long peak_bw;
>> +
>> +	if (!gpu->opp_tables[GPU_DDR_OPP_TABLE_INDEX])
>> +		goto done;
>> +
>> +	gpu_opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, gpu_freq, true);
>> +	if (IS_ERR_OR_NULL(gpu_opp))
>> +		goto done;
>> +
>> +	ddr_opp = dev_pm_opp_xlate_required_opp(tables[GPU_OPP_TABLE_INDEX],
>> +					    tables[GPU_DDR_OPP_TABLE_INDEX],
>> +					    gpu_opp);
>> +	dev_pm_opp_put(gpu_opp);
>> +
>> +	if (IS_ERR_OR_NULL(ddr_opp))
>> +		goto done;
> I think that the final approach is still up in the air but either way we're
> going to pull the bandwidth from an OPP, its just a question of which OPP.
>
>> +	peak_bw = dev_pm_opp_get_bw(ddr_opp, NULL);
>> +	dev_pm_opp_put(ddr_opp);
>> +
>> +	icc_set_bw(gpu->icc_path, 0, peak_bw);
>> +	return;
>> +done:
>> +	/*
>> +	 * If there is a problem, for now leave it at max so that the
>> +	 * performance is nominal.
>> +	 */
>> +	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
>> +}
>> +
>>   static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
>>   {
>>   	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>> @@ -128,11 +162,8 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
>>
>>   	gmu->freq = gmu->gpu_freqs[index];
>>
>> -	/*
>> -	 * Eventually we will want to scale the path vote with the frequency but
>> -	 * for now leave it at max so that the performance is nominal.
>> -	 */
>> -	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
>> +	if (gpu->icc_path)
>> +		a6xx_gmu_set_icc_vote(gpu, gmu->freq);
> This function is annoying because we call it from two different spots, but it
> feels wasteful that devfreq gives us an OPP pointer and we go out of our way to
> not use it only to search for it again in the set_icc_vote function. I think
> maybe we should pass the OPP through from msm_gpu.c.  We could have a helper
> function to pull the initial opp in a6xx_gmu_resume to make it clean.

Yes Jordan, it makes sense. I did think about this too, but may be I 
was  a bit too lazy to change the existing plumbing :)

I will take care of this in the next iteration.

>
>>   }
>>
>>   void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> index 2d13694..bbbcc7a 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -882,7 +882,7 @@ static int adreno_get_pwrlevels(struct device *dev,
>>   {
>>   	unsigned long freq = ULONG_MAX;
>>   	struct dev_pm_opp *opp;
>> -	int ret;
>> +	int ret, i;
>>
>>   	gpu->fast_rate = 0;
>>
>> @@ -890,9 +890,29 @@ static int adreno_get_pwrlevels(struct device *dev,
>>   	if (!of_find_property(dev->of_node, "operating-points-v2", NULL))
>>   		ret = adreno_get_legacy_pwrlevels(dev);
>>   	else {
>> -		ret = dev_pm_opp_of_add_table(dev);
>> -		if (ret)
>> -			DRM_DEV_ERROR(dev, "Unable to set the OPP table\n");
>> +		int count = of_count_phandle_with_args(dev->of_node,
>> +				"operating-points-v2", NULL);
>> +
>> +		count = min(count, GPU_DDR_OPP_TABLE_INDEX + 1);
>> +		count = max(count, 1);
>> +
>> +		for (i = 0; i < count; i++) {
>> +			ret = dev_pm_opp_of_add_table_indexed(dev, i);
>> +			if (ret) {
>> +				DRM_DEV_ERROR(dev, "Add OPP table %d: failed %d\n",
>> +						i, ret);
>> +				goto err;
>> +			}
>> +
>> +			gpu->opp_tables[i] =
>> +				dev_pm_opp_get_opp_table_indexed(dev, i);
>> +			if (!gpu->opp_tables[i]) {
>> +				DRM_DEV_ERROR(dev, "Get OPP table failed index %d\n",
>> +						i);
>> +				ret = -EINVAL;
>> +				goto err;
>> +			}
>> +		}
>>   	}
>>
>>   	if (!ret) {
>> @@ -919,12 +939,24 @@ static int adreno_get_pwrlevels(struct device *dev,
>>   		gpu->icc_path = NULL;
>>
>>   	return 0;
>> +err:
>> +	for (; i >= 0; i--) {
>> +		if (gpu->opp_tables[i]) {
>> +			dev_pm_opp_put_opp_table(gpu->opp_tables[i]);
>> +			gpu->opp_tables[i] = NULL;
>> +		}
>> +	}
>> +
>> +	dev_pm_opp_remove_table(dev);
>> +	return ret;
>>   }
>>
>>   int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>   		struct adreno_gpu *adreno_gpu,
>>   		const struct adreno_gpu_funcs *funcs, int nr_rings)
>>   {
>> +	int ret = 0;
>> +
>>   	struct adreno_platform_config *config = pdev->dev.platform_data;
>>   	struct msm_gpu_config adreno_gpu_config  = { 0 };
>>   	struct msm_gpu *gpu = &adreno_gpu->base;
>> @@ -945,7 +977,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>
>>   	adreno_gpu_config.nr_rings = nr_rings;
>>
>> -	adreno_get_pwrlevels(&pdev->dev, gpu);
>> +	ret = adreno_get_pwrlevels(&pdev->dev, gpu);
>> +	if (ret)
>> +		return ret;
>>
>>   	pm_runtime_set_autosuspend_delay(&pdev->dev,
>>   		adreno_gpu->info->inactive_period);
>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
>> index ab8f0f9c..5b98b48 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu.h
>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
>> @@ -66,6 +66,12 @@ struct msm_gpu_funcs {
>>   	void (*gpu_set_freq)(struct msm_gpu *gpu, unsigned long freq);
>>   };
>>
>> +/* opp table indices */
>> +enum {
>> +	GPU_OPP_TABLE_INDEX,
>> +	GPU_DDR_OPP_TABLE_INDEX,
>> +};
>> +
>>   struct msm_gpu {
>>   	const char *name;
>>   	struct drm_device *dev;
>> @@ -113,6 +119,9 @@ struct msm_gpu {
>>
>>   	struct icc_path *icc_path;
>>
>> +	/* gpu/ddr opp tables */
>> +	struct opp_table *opp_tables[2];
> You don't need an array here. We're not going to have that many tables.
>
> struct opp_table *gpu_opp_table;
> struct opp_table *bw_opp_table;
>
> Is sufficient and we don't need an enum.
>
>> +
>>   	/* Hang and Inactivity Detection:
>>   	 */
>>   #define DRM_MSM_INACTIVE_PERIOD   66 /* in ms (roughly four frames) */
>> --
>> 2.7.4
>>
> Jordan
>
