Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7F845B843
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 11:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241233AbhKXKYA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 05:24:00 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:22154 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240276AbhKXKX7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 05:23:59 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637749250; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=pVY3qLJpdZlAOMJ6aJj5+0xrvvs66YniMRHnqCtmKko=; b=e2+hpCsydJGWyUFo6jYBGuKV0PSf1TH0ixsSObVwJOKipCF3kMY0ot5ptHK3ubTS3kkA5pjL
 O1aQIK+bDVpwZLtWzJfHlfSYo3MJdHNDTKHYJuhGW3pkMMQbLoL35YRuasc0+cbhRVNmkKWh
 n/vporQ6jyaLTlrcTIqaGkxMUOQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 619e12014fca5da46dd832af (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Nov 2021 10:20:49
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0A512C4338F; Wed, 24 Nov 2021 10:20:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.5] (unknown [117.211.32.249])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A54C6C4338F;
        Wed, 24 Nov 2021 10:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A54C6C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <9a2f8732-14f9-9f8e-b000-24f37125c1a0@codeaurora.org>
Date:   Wed, 24 Nov 2021 15:50:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 4/6] drm/msm/a6xx: Capture gmu log in devcoredump
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linux Patches Robot 
        <linux-patches-robot@chromeos-missing-patches.google.com.iam.gserviceaccount.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        St?phane Marchesin <marcheu@chromium.org>,
        linux-kernel@vger.kernel.org
References: <20211124024436.v2.1.I2ed37cd8ad45a5a94d9de53330f973a62bd1fb29@changeid>
 <20211124024436.v2.4.Ibb71b3c64d6f98d586131a143c27fbdb233260a1@changeid>
 <YZ1zW/9lsJNrVfqJ@ripper>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
In-Reply-To: <YZ1zW/9lsJNrVfqJ@ripper>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/24/2021 4:33 AM, Bjorn Andersson wrote:
> On Tue 23 Nov 13:17 PST 2021, Akhil P Oommen wrote:
> 
>> Capture gmu log in coredump to enhance debugging.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>> ---
>>
>> Changes in v2:
>> - Fix kernel test robot's warning about size_t's format specifier
>>
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 41 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  2 +-
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  2 ++
>>   3 files changed, 44 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>> index e8f65cd..e6f5571 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>> @@ -42,6 +42,8 @@ struct a6xx_gpu_state {
>>   	struct a6xx_gpu_state_obj *cx_debugbus;
>>   	int nr_cx_debugbus;
>>   
>> +	struct msm_gpu_state_bo *gmu_log;
>> +
>>   	struct list_head objs;
>>   };
>>   
>> @@ -800,6 +802,30 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
>>   		&a6xx_state->gmu_registers[2], false);
>>   }
>>   
>> +static void a6xx_get_gmu_log(struct msm_gpu *gpu,
>> +		struct a6xx_gpu_state *a6xx_state)
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>> +	struct msm_gpu_state_bo *gmu_log;
>> +
>> +	gmu_log = state_kcalloc(a6xx_state,
>> +		1, sizeof(*a6xx_state->gmu_log));
> 
> This line isn't even 80 chars long, so I see no reason to wrap it and if
> you ran checkpatch --strict on this patch it would complain about how
> you indent that second line as well.
> 
> It would also look better with sizeof(*gmu_log), even though they should
> have the same size today...
> 
>> +	if (!gmu_log)
>> +		return;
>> +
>> +	gmu_log->iova = gmu->log.iova;
>> +	gmu_log->size = gmu->log.size;
>> +	gmu_log->data = kvzalloc(gmu_log->size, GFP_KERNEL);
>> +	if (!gmu_log->data)
>> +		return;
>> +
>> +	memcpy(gmu_log->data, gmu->log.virt, gmu->log.size);
>> +
>> +	a6xx_state->gmu_log = gmu_log;
>> +}
>> +
>>   #define A6XX_GBIF_REGLIST_SIZE   1
>>   static void a6xx_get_registers(struct msm_gpu *gpu,
>>   		struct a6xx_gpu_state *a6xx_state,
>> @@ -937,6 +963,8 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
>>   
>>   	a6xx_get_gmu_registers(gpu, a6xx_state);
>>   
>> +	a6xx_get_gmu_log(gpu, a6xx_state);
>> +
>>   	/* If GX isn't on the rest of the data isn't going to be accessible */
>>   	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
>>   		return &a6xx_state->base;
>> @@ -978,6 +1006,9 @@ static void a6xx_gpu_state_destroy(struct kref *kref)
>>   	struct a6xx_gpu_state *a6xx_state = container_of(state,
>>   			struct a6xx_gpu_state, base);
>>   
>> +	if (a6xx_state->gmu_log && a6xx_state->gmu_log->data)
>> +		kvfree(a6xx_state->gmu_log->data);
>> +
>>   	list_for_each_entry_safe(obj, tmp, &a6xx_state->objs, node)
>>   		kfree(obj);
>>   
>> @@ -1191,6 +1222,16 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>>   
>>   	adreno_show(gpu, state, p);
>>   
>> +	drm_puts(p, "gmu-log:\n");
>> +	if (a6xx_state->gmu_log) {
>> +		struct msm_gpu_state_bo *gmu_log = a6xx_state->gmu_log;
>> +
>> +		drm_printf(p, "    iova: 0x%016llx\n", gmu_log->iova);
>> +		drm_printf(p, "    size: %zu\n", gmu_log->size);
>> +		adreno_show_object(p, &gmu_log->data, gmu_log->size,
>> +				&gmu_log->encoded);
>> +	}
>> +
>>   	drm_puts(p, "registers:\n");
>>   	for (i = 0; i < a6xx_state->nr_registers; i++) {
>>   		struct a6xx_gpu_state_obj *obj = &a6xx_state->registers[i];
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> index 1539b8e..b43346e 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -638,7 +638,7 @@ static char *adreno_gpu_ascii85_encode(u32 *src, size_t len)
>>   }
>>   
>>   /* len is expected to be in bytes */
>> -static void adreno_show_object(struct drm_printer *p, void **ptr, int len,
>> +void adreno_show_object(struct drm_printer *p, void **ptr, int len,
>>   		bool *encoded)
> 
> Please indent your broken lines by the ( on the line before.

Just curious, is this a common coding style in kernel?

-Akhil.

> 
> Regards,
> Bjorn
> 
>>   {
>>   	if (!*ptr || !len)
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index 225c277..6762308 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -306,6 +306,8 @@ void adreno_gpu_state_destroy(struct msm_gpu_state *state);
>>   
>>   int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state);
>>   int adreno_gpu_state_put(struct msm_gpu_state *state);
>> +void adreno_show_object(struct drm_printer *p, void **ptr, int len,
>> +		bool *encoded);
>>   
>>   /*
>>    * Common helper function to initialize the default address space for arm-smmu
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation.
>>

