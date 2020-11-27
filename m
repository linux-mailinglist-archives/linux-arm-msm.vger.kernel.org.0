Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8E62C6604
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 13:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729576AbgK0Mv1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 07:51:27 -0500
Received: from z5.mailgun.us ([104.130.96.5]:28797 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729717AbgK0Mv0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 07:51:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606481486; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=WHbaN/YSS58W8h44ACpjS+mxo40IHUsHLFwLcUssmDM=; b=oYooPH3F7j/hcCLXVmONFK9LA6HgxVw5fXtCQocS58NzGx33mCbSPHtgeDqf+zUcmlGqC1Hg
 fG7VKzT1w9l7kyhoE4xf6W+C1PRTxSS9KE3gGoHtZpGXjg+OZ5kLn/FzPYdGdqWdv2W1Gb+k
 k+TZ5lmeDC6cWARDtQlknqvwd5Q=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5fc0f64b9e87e163521c0df1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Nov 2020 12:51:23
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5AB7AC433C6; Fri, 27 Nov 2020 12:51:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.9] (unknown [61.2.39.29])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5B610C433ED;
        Fri, 27 Nov 2020 12:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5B610C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [Freedreno] [PATCH] drm/msm: adreno: Make speed-bin support
 generic
To:     freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, robdclark@gmail.com, dianders@chromium.org
References: <1605196144-23516-1-git-send-email-akhilpo@codeaurora.org>
 <20201112163527.GC2661@jcrouse1-lnx.qualcomm.com>
 <8c215bdf-b739-4b30-6cb0-fa521fde2784@codeaurora.org>
 <20201116171416.GA16856@jcrouse1-lnx.qualcomm.com>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <58b2f84d-e8f6-cc6d-7b5d-77d85e08877c@codeaurora.org>
Date:   Fri, 27 Nov 2020 18:21:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201116171416.GA16856@jcrouse1-lnx.qualcomm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/16/2020 10:44 PM, Jordan Crouse wrote:
> On Mon, Nov 16, 2020 at 07:40:03PM +0530, Akhil P Oommen wrote:
>> On 11/12/2020 10:05 PM, Jordan Crouse wrote:
>>> On Thu, Nov 12, 2020 at 09:19:04PM +0530, Akhil P Oommen wrote:
>>>> So far a530v2 gpu has support for detecting its supported opps
>>>> based on a fuse value called speed-bin. This patch makes this
>>>> support generic across gpu families. This is in preparation to
>>>> extend speed-bin support to a6x family.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>>>> ---
>>>> This patch is rebased on top of msm-next-staging branch in rob's tree.
>>>>
>>>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 34 --------------
>>>>   drivers/gpu/drm/msm/adreno/adreno_device.c |  4 ++
>>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 71 ++++++++++++++++++++++++++++++
>>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++
>>>>   4 files changed, 80 insertions(+), 34 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>>>> index 8fa5c91..7d42321 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>>>> @@ -1531,38 +1531,6 @@ static const struct adreno_gpu_funcs funcs = {
>>>>   	.get_timestamp = a5xx_get_timestamp,
>>>>   };
>>>> -static void check_speed_bin(struct device *dev)
>>>> -{
>>>> -	struct nvmem_cell *cell;
>>>> -	u32 val;
>>>> -
>>>> -	/*
>>>> -	 * If the OPP table specifies a opp-supported-hw property then we have
>>>> -	 * to set something with dev_pm_opp_set_supported_hw() or the table
>>>> -	 * doesn't get populated so pick an arbitrary value that should
>>>> -	 * ensure the default frequencies are selected but not conflict with any
>>>> -	 * actual bins
>>>> -	 */
>>>> -	val = 0x80;
>>>> -
>>>> -	cell = nvmem_cell_get(dev, "speed_bin");
>>>> -
>>>> -	if (!IS_ERR(cell)) {
>>>> -		void *buf = nvmem_cell_read(cell, NULL);
>>>> -
>>>> -		if (!IS_ERR(buf)) {
>>>> -			u8 bin = *((u8 *) buf);
>>>> -
>>>> -			val = (1 << bin);
>>>> -			kfree(buf);
>>>> -		}
>>>> -
>>>> -		nvmem_cell_put(cell);
>>>> -	}
>>>> -
>>>> -	dev_pm_opp_set_supported_hw(dev, &val, 1);
>>>> -}
>>>> -
>>>>   struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>>>>   {
>>>>   	struct msm_drm_private *priv = dev->dev_private;
>>>> @@ -1588,8 +1556,6 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>>>>   	a5xx_gpu->lm_leakage = 0x4E001A;
>>>> -	check_speed_bin(&pdev->dev);
>>>> -
>>>>   	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 4);
>>>>   	if (ret) {
>>>>   		a5xx_destroy(&(a5xx_gpu->base.base));
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>>>> index 87c8b03..e0ff16c 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>>>> @@ -18,6 +18,8 @@ bool snapshot_debugbus = false;
>>>>   MODULE_PARM_DESC(snapshot_debugbus, "Include debugbus sections in GPU devcoredump (if not fused off)");
>>>>   module_param_named(snapshot_debugbus, snapshot_debugbus, bool, 0600);
>>>> +const u32 a530v2_speedbins[] = {0, 1, 2, 3, 4, 5, 6, 7};
>>>> +
>>>>   static const struct adreno_info gpulist[] = {
>>>>   	{
>>>>   		.rev   = ADRENO_REV(2, 0, 0, 0),
>>>> @@ -163,6 +165,8 @@ static const struct adreno_info gpulist[] = {
>>>>   			ADRENO_QUIRK_FAULT_DETECT_MASK,
>>>>   		.init = a5xx_gpu_init,
>>>>   		.zapfw = "a530_zap.mdt",
>>>> +		.speedbins = a530v2_speedbins,
>>>> +		.speedbins_count = ARRAY_SIZE(a530v2_speedbins),
>>>>   	}, {
>>>>   		.rev = ADRENO_REV(5, 4, 0, 2),
>>>>   		.revn = 540,
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> index f21561d..cdd0c11 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> @@ -14,6 +14,7 @@
>>>>   #include <linux/pm_opp.h>
>>>>   #include <linux/slab.h>
>>>>   #include <linux/soc/qcom/mdt_loader.h>
>>>> +#include <linux/nvmem-consumer.h>
>>>>   #include <soc/qcom/ocmem.h>
>>>>   #include "adreno_gpu.h"
>>>>   #include "msm_gem.h"
>>>> @@ -891,6 +892,69 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
>>>>   			   adreno_ocmem->hdl);jjjj
>>>>   }
>>>> +static int adreno_set_supported_hw(struct device *dev,
>>>> +		struct adreno_gpu *adreno_gpu)
>>>> +{
>>>> +	u8 speedbins_count = adreno_gpu->info->speedbins_count;
>>>> +	const u32 *speedbins = adreno_gpu->info->speedbins;
>>>
>>> We don't need to make this generic and put it in the table. Just call the
>>> function from the target specific code and pass the speedbin array and size from
>>> there.
>>>
>> I didn't get you entirely. Do you mean we should avoid keeping speedbin
>> array in the adreno_gpu->info table?
> 
> Exactly.
> 
> Jordan
But why duplicate this code if it can be made generic? Could you please 
check the v2 version?

-Akhil.
> 
>> -Akhil.
>>>> +	struct nvmem_cell *cell;
>>>> +	u32 bin, i;
>>>> +	u32 val = 0;
>>>> +	void *buf, *opp_table;
>>>> +
>>>> +	cell = nvmem_cell_get(dev, "speed_bin");
>>>> +	/*
>>>> +	 * -ENOENT means that the platform doesn't support speedbin which is
>>>> +	 * fine
>>>> +	 */
>>>> +	if (PTR_ERR(cell) == -ENOENT)
>>>> +		return 0;
>>>> +	else if (IS_ERR(cell))
>>>> +		return PTR_ERR(cell);
>>>> +
>>>> +	/* A speedbin table is must if the platform supports speedbin */
>>>> +	if (!speedbins) {
>>>> +		DRM_DEV_ERROR(dev, "speed-bin table is missing\n");
>>>> +		return -ENOENT;
>>>> +	}
>>>> +
>>>> +	buf = nvmem_cell_read(cell, NULL);
>>>> +	if (IS_ERR(buf)) {
>>>> +		nvmem_cell_put(cell);
>>>> +		return PTR_ERR(buf);
>>>> +	}
>>>> +
>>>> +	bin = *((u32 *) buf);
>>>> +
>>>> +	for (i = 0; i < speedbins_count; i++) {
>>>> +		if (bin == speedbins[i]) {
>>>> +			val = (1 << i);
>>>> +			break;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	kfree(buf);
>>>> +	nvmem_cell_put(cell);
>>>> +
>>>> +	if (!val) {
>>>> +		DRM_DEV_ERROR(dev, "missing support for speed-bin: %u\n", bin);
>>>> +		return -ENOENT;
>>>> +	}
>>>> +
>>>> +	opp_table = dev_pm_opp_set_supported_hw(dev, &val, 1);
>>>> +	if (IS_ERR(opp_table))
>>>> +		return PTR_ERR(opp_table);
>>>> +
>>>> +	adreno_gpu->opp_table = opp_table;
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void adreno_put_supported_hw(struct opp_table *opp_table)
>>>> +{
>>>> +	if (opp_table)
>>>> +		dev_pm_opp_put_supported_hw(opp_table);
>>>> +}
>>>> +
>>>>   int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>>>   		struct adreno_gpu *adreno_gpu,
>>>>   		const struct adreno_gpu_funcs *funcs, int nr_rings)
>>>> @@ -899,6 +963,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>>>   	struct adreno_platform_config *config = dev->platform_data;
>>>>   	struct msm_gpu_config adreno_gpu_config  = { 0 };
>>>>   	struct msm_gpu *gpu = &adreno_gpu->base;
>>>> +	int ret;
>>>>   	adreno_gpu->funcs = funcs;
>>>>   	adreno_gpu->info = adreno_info(config->rev);
>>>> @@ -910,6 +975,10 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>>>   	adreno_gpu_config.nr_rings = nr_rings;
>>>> +	ret = adreno_set_supported_hw(dev, adreno_gpu);
>>>> +	if (ret)
>>>> +		return ret;
>>>
>>> This bit should be in the target specific code
>>>> +
>>>>   	adreno_get_pwrlevels(dev, gpu);
>>>>   	pm_runtime_set_autosuspend_delay(dev,
>>>> @@ -936,4 +1005,6 @@ void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
>>>>   	icc_put(gpu->icc_path);
>>>>   	icc_put(gpu->ocmem_icc_path);
>>>> +
>>>> +	adreno_put_supported_hw(adreno_gpu->opp_table);
>>>
>>> And this bit too, though it would be easier to just call the put function
>>> directly without having a intermediate function.  Also the OPP function should
>>> be NULL aware but thats a different story.
>>>
>>> Jordan
>>>>   }
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>> index c3775f7..a756ad7 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>> @@ -55,6 +55,7 @@ struct adreno_reglist {
>>>>   };
>>>>   extern const struct adreno_reglist a630_hwcg[], a640_hwcg[], a650_hwcg[];
>>>> +extern const u32 a618_speedbins[];
>>>>   struct adreno_info {
>>>>   	struct adreno_rev rev;
>>>> @@ -67,6 +68,8 @@ struct adreno_info {
>>>>   	const char *zapfw;
>>>>   	u32 inactive_period;
>>>>   	const struct adreno_reglist *hwcg;
>>>> +	const u32 *speedbins;
>>>> +	const u8 speedbins_count;
>>>>   };
>>>>   const struct adreno_info *adreno_info(struct adreno_rev rev);
>>>> @@ -112,6 +115,8 @@ struct adreno_gpu {
>>>>   	 * code (a3xx_gpu.c) and stored in this common location.
>>>>   	 */
>>>>   	const unsigned int *reg_offsets;
>>>> +
>>>> +	struct opp_table *opp_table;
>>>>   };
>>>>   #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
>>>> -- 
>>>> 2.7.4
>>>>
>>>
>>
>> _______________________________________________
>> Freedreno mailing list
>> Freedreno@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/freedreno
> 

