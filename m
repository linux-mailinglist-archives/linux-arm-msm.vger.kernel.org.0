Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 724DC29BB81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 17:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1807759AbgJ0QOj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 12:14:39 -0400
Received: from z5.mailgun.us ([104.130.96.5]:60885 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1807757AbgJ0QOi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 12:14:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603815278; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=DpMi3wZzYzZFIDmbhPw67VwM72fcMWlU80A+xtAhYJ4=; b=Ku4TKv0Cmu5U5mOI1zXq/nVs4Hi3AgSBWzfI/T5fJSfW/U+oSDJDICtnfaJv1+tum9lRjMwS
 gQawjuEzQwkCMvz3AVwSXT0uYV8oWqOlxbxEjsxOo02pBdMVM7KKs8ru2LzVhUUljevKccch
 j2YJiy1Uqk13QDHgs/U+3DTfugY=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f98476d807e82a1532a962a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Oct 2020 16:14:37
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7E35AC38545; Tue, 27 Oct 2020 16:14:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 876CDC3852B;
        Tue, 27 Oct 2020 16:14:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 27 Oct 2020 21:44:34 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/msm/a6xx: Add support for using system cache on
 MMU500 based targets
Message-ID: <6775698bb9ddd14f5ac9325aa093d884@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-27 21:10, Robin Murphy wrote:
> On 2020-10-26 18:54, Jordan Crouse wrote:
>> This is an extension to the series [1] to enable the System Cache 
>> (LLC) for
>> Adreno a6xx targets.
>> 
>> GPU targets with an MMU-500 attached have a slightly different process 
>> for
>> enabling system cache. Use the compatible string on the IOMMU phandle
>> to see if an MMU-500 is attached and modify the programming sequence
>> accordingly.
>> 
>> [1] https://patchwork.freedesktop.org/series/83037/
>> 
>> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
>> ---
>> 
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 46 
>> +++++++++++++++++++++------
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
>>   2 files changed, 37 insertions(+), 10 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c 
>> b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 95c98c642876..b7737732fbb6 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1042,6 +1042,8 @@ static void a6xx_llc_deactivate(struct a6xx_gpu 
>> *a6xx_gpu)
>>     static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>>   {
>> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>> +	struct msm_gpu *gpu = &adreno_gpu->base;
>>   	u32 cntl1_regval = 0;
>>     	if (IS_ERR(a6xx_gpu->llc_mmio))
>> @@ -1055,11 +1057,17 @@ static void a6xx_llc_activate(struct a6xx_gpu 
>> *a6xx_gpu)
>>   			       (gpu_scid << 15) | (gpu_scid << 20);
>>   	}
>>   +	/*
>> +	 * For targets with a MMU500, activate the slice but don't program 
>> the
>> +	 * register.  The XBL will take care of that.
>> +	 */
>>   	if (!llcc_slice_activate(a6xx_gpu->htw_llc_slice)) {
>> -		u32 gpuhtw_scid = llcc_get_slice_id(a6xx_gpu->htw_llc_slice);
>> +		if (!a6xx_gpu->have_mmu500) {
>> +			u32 gpuhtw_scid = llcc_get_slice_id(a6xx_gpu->htw_llc_slice);
>>   -		gpuhtw_scid &= 0x1f;
>> -		cntl1_regval |= FIELD_PREP(GENMASK(29, 25), gpuhtw_scid);
>> +			gpuhtw_scid &= 0x1f;
>> +			cntl1_regval |= FIELD_PREP(GENMASK(29, 25), gpuhtw_scid);
>> +		}
>>   	}
>>     	if (cntl1_regval) {
>> @@ -1067,13 +1075,20 @@ static void a6xx_llc_activate(struct a6xx_gpu 
>> *a6xx_gpu)
>>   		 * Program the slice IDs for the various GPU blocks and GPU MMU
>>   		 * pagetables
>>   		 */
>> -		a6xx_llc_write(a6xx_gpu, REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1, 
>> cntl1_regval);
>> -
>> -		/*
>> -		 * Program cacheability overrides to not allocate cache lines on
>> -		 * a write miss
>> -		 */
>> -		a6xx_llc_rmw(a6xx_gpu, REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xF, 
>> 0x03);
>> +		if (a6xx_gpu->have_mmu500)
>> +			gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL1, GENMASK(24, 0),
>> +				cntl1_regval);
>> +		else {
>> +			a6xx_llc_write(a6xx_gpu,
>> +				REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1, cntl1_regval);
>> +
>> +			/*
>> +			 * Program cacheability overrides to not allocate cache
>> +			 * lines on a write miss
>> +			 */
>> +			a6xx_llc_rmw(a6xx_gpu,
>> +				REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xF, 0x03);
>> +		}
>>   	}
>>   }
>>   @@ -1086,10 +1101,21 @@ static void a6xx_llc_slices_destroy(struct 
>> a6xx_gpu *a6xx_gpu)
>>   static void a6xx_llc_slices_init(struct platform_device *pdev,
>>   		struct a6xx_gpu *a6xx_gpu)
>>   {
>> +	struct device_node *phandle;
>> +
>>   	a6xx_gpu->llc_mmio = msm_ioremap(pdev, "cx_mem", "gpu_cx");
>>   	if (IS_ERR(a6xx_gpu->llc_mmio))
>>   		return;
>>   +	/*
>> +	 * There is a different programming path for targets with an mmu500
>> +	 * attached, so detect if that is the case
>> +	 */
>> +	phandle = of_parse_phandle(pdev->dev.of_node, "iommus", 0);
>> +	a6xx_gpu->have_mmu500 = (phandle &&
>> +		of_device_is_compatible(phandle, "arm,mmu500"));
> 
> Note that this should never match, since the compatible string defined
> by the binding is "arm,mmu-500" ;)
> 

Hawk eye ;) I will fix it in the next version when I squash
this with my series.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
