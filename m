Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610D627ADB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 14:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgI1M1K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 08:27:10 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:32150 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726477AbgI1M1K (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 08:27:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601296029; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=KkChGI+YeqZAg3DuMRg/VqX+l3pGX1T0VLK9izTxs/U=;
 b=lJofrCSq6o4qjsVTP9pT3n84o3r1HZFcUWgv1PBMTELu0OT2iyrnjsmIg0cD9gpKcd21LIVx
 fZmdfUXuRQuayq/PeGFSZvsI1EejNh7W0s1fcWe3PWZLX8W7jayF0LP2X4+9XonyW5roYiAu
 Am+0jo8tfsunddlDqkDnnVL71IQ=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f71d691be59ebabf32bc52c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 12:26:57
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2C2E9C433FF; Mon, 28 Sep 2020 12:26:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DAD27C433CA;
        Mon, 28 Sep 2020 12:26:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 28 Sep 2020 17:56:55 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robdclark@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        freedreno@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel@lists.freedesktop.org,
        Sharat Masetty <smasetty@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCHv5 4/6] drm/msm/a6xx: Add support for using system
 cache(LLC)
In-Reply-To: <20200923150320.GD31425@jcrouse1-lnx.qualcomm.com>
References: <cover.1600754909.git.saiprakash.ranjan@codeaurora.org>
 <889a32458cec92ed110b94f393aa1c2f0d64dca5.1600754909.git.saiprakash.ranjan@codeaurora.org>
 <20200923150320.GD31425@jcrouse1-lnx.qualcomm.com>
Message-ID: <800c2108606cb921fef1ffc27569ffb2@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jordan,

On 2020-09-23 20:33, Jordan Crouse wrote:
> On Tue, Sep 22, 2020 at 11:48:17AM +0530, Sai Prakash Ranjan wrote:
>> From: Sharat Masetty <smasetty@codeaurora.org>
>> 
>> The last level system cache can be partitioned to 32 different
>> slices of which GPU has two slices preallocated. One slice is
>> used for caching GPU buffers and the other slice is used for
>> caching the GPU SMMU pagetables. This talks to the core system
>> cache driver to acquire the slice handles, configure the SCID's
>> to those slices and activates and deactivates the slices upon
>> GPU power collapse and restore.
>> 
>> Some support from the IOMMU driver is also needed to make use
>> of the system cache to set the right TCR attributes. GPU then
>> has the ability to override a few cacheability parameters which
>> it does to override write-allocate to write-no-allocate as the
>> GPU hardware does not benefit much from it.
>> 
>> DOMAIN_ATTR_SYS_CACHE is another domain level attribute used by the
>> IOMMU driver to set the right attributes to cache the hardware
>> pagetables into the system cache.
>> 
>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>> [saiprakash.ranjan: fix to set attr before device attach to iommu and 
>> rebase]
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 83 
>> +++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  4 ++
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 17 +++++
>>  3 files changed, 104 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c 
>> b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 8915882e4444..151190ff62f7 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -8,7 +8,9 @@
>>  #include "a6xx_gpu.h"
>>  #include "a6xx_gmu.xml.h"
>> 
>> +#include <linux/bitfield.h>
>>  #include <linux/devfreq.h>
>> +#include <linux/soc/qcom/llcc-qcom.h>
>> 
>>  #define GPU_PAS_ID 13
>> 
>> @@ -1022,6 +1024,79 @@ static irqreturn_t a6xx_irq(struct msm_gpu 
>> *gpu)
>>  	return IRQ_HANDLED;
>>  }
>> 
>> +static void a6xx_llc_rmw(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 
>> mask, u32 or)
>> +{
>> +	return msm_rmw(a6xx_gpu->llc_mmio + (reg << 2), mask, or);
>> +}
>> +
>> +static void a6xx_llc_write(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 
>> value)
>> +{
>> +	return msm_writel(value, a6xx_gpu->llc_mmio + (reg << 2));
>> +}
>> +
>> +static void a6xx_llc_deactivate(struct a6xx_gpu *a6xx_gpu)
>> +{
>> +	llcc_slice_deactivate(a6xx_gpu->llc_slice);
>> +	llcc_slice_deactivate(a6xx_gpu->htw_llc_slice);
>> +}
>> +
>> +static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>> +{
>> +	u32 cntl1_regval = 0;
>> +
>> +	if (IS_ERR(a6xx_gpu->llc_mmio))
>> +		return;
>> +
>> +	if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
>> +		u32 gpu_scid = llcc_get_slice_id(a6xx_gpu->llc_slice);
>> +
>> +		gpu_scid &= 0x1f;
>> +		cntl1_regval = (gpu_scid << 0) | (gpu_scid << 5) | (gpu_scid << 10) 
>> |
>> +			       (gpu_scid << 15) | (gpu_scid << 20);
>> +	}
>> +
>> +	if (!llcc_slice_activate(a6xx_gpu->htw_llc_slice)) {
>> +		u32 gpuhtw_scid = llcc_get_slice_id(a6xx_gpu->htw_llc_slice);
>> +
>> +		gpuhtw_scid &= 0x1f;
>> +		cntl1_regval |= FIELD_PREP(GENMASK(29, 25), gpuhtw_scid);
>> +	}
>> +
>> +	if (cntl1_regval) {
>> +		/*
>> +		 * Program the slice IDs for the various GPU blocks and GPU MMU
>> +		 * pagetables
>> +		 */
>> +		a6xx_llc_write(a6xx_gpu, REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1, 
>> cntl1_regval);
>> +
>> +		/*
>> +		 * Program cacheability overrides to not allocate cache lines on
>> +		 * a write miss
>> +		 */
>> +		a6xx_llc_rmw(a6xx_gpu, REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xF, 
>> 0x03);
>> +	}
>> +}
> 
> This code has been around long enough that it pre-dates a650. On a650 
> and other
> MMU-500 targets the htw_llc is configured by the firmware and the 
> llc_slice is
> configured in a different register.
> 
> I don't think we need to pause everything and add support for the 
> MMU-500 path,
> but we do need a way to disallow LLCC on affected targets until such 
> time that
> we can get it fixed up.
> 

Thanks for taking a close look, does something like below look ok or 
something
else is needed here?

+         /* Till the time we get in LLCC support for A650 */
+         if (!(info && info->revn == 650))
+                 a6xx_llc_slices_init(pdev, a6xx_gpu);

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
