Return-Path: <linux-arm-msm+bounces-36464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 006469B67BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 16:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4D952831FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 15:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BB5213159;
	Wed, 30 Oct 2024 15:23:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FD8213125;
	Wed, 30 Oct 2024 15:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730301814; cv=none; b=S687wRla5qMC4NXPYGbsr4pdX8nhSiImTNUyMaWRZ89ANvtegEqeP0JNoAi+ga6F7YVmvOxNgaSlE+3DRlCG9kPiOYl51uGbOQyMBF6WaqS6ymtp3RQfojC+JUy1db5vFbNHcQZlaj364IVNuqv0sH4cBLzQXojI+0X+lzXNWzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730301814; c=relaxed/simple;
	bh=Lt5lykLZu5JpDLmh3d+RP262Rq70yT3ETGu1ebMmL6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdlmAFEsf7YFnHrZLmeQLt09pXyicG/YSLtdeYf+7uhicBNFNWudSquLuUdv+I4GIFJcrgswaaZf8GEJ474f8ycFBt56t87XmSPy5wfB0rqQOKrh9yUxBB4kBrvdlnW5M3ed6tMhTHcSUimSS2J9MhnlMR0a1GXRPGkUn9xSF7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63E83113E;
	Wed, 30 Oct 2024 08:24:01 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B80763F66E;
	Wed, 30 Oct 2024 08:23:29 -0700 (PDT)
Message-ID: <65132b36-49f6-4b08-8e7d-6d6cb8da5960@arm.com>
Date: Wed, 30 Oct 2024 15:23:28 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 3/5] iommu/arm-smmu: add support for PRR bit setup
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, robdclark@gmail.com,
 will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com,
 robh@kernel.org, krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com>
 <20241008125410.3422512-4-quic_bibekkum@quicinc.com>
 <2d651f1b-4f51-4984-903f-7f5a14151f84@arm.com>
 <531d0144-e027-4589-b4ef-79f02583df8b@quicinc.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <531d0144-e027-4589-b4ef-79f02583df8b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/10/2024 1:14 pm, Bibek Kumar Patro wrote:
> 
> 
> On 10/29/2024 6:59 PM, Robin Murphy wrote:
>> On 2024-10-08 1:54 pm, Bibek Kumar Patro wrote:
>>> Add an adreno-smmu-priv interface for drm/msm to call
>>> into arm-smmu-qcom and initiate the PRR bit setup or reset
>>> sequence as per request.
>>>
>>> This will be used by GPU to setup the PRR bit and related
>>> configuration registers through adreno-smmu private
>>> interface instead of directly poking the smmu hardware.
>>>
>>> Suggested-by: Rob Clark <robdclark@gmail.com>
>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>> ---
>>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 ++++++++++++++++++++++
>>>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>>>   include/linux/adreno-smmu-priv.h           | 10 +++++-
>>>   3 files changed, 48 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/ 
>>> iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> index 6e0a2a43e45a..38ac9cab763b 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> @@ -25,6 +25,7 @@
>>>
>>>   #define CPRE            (1 << 1)
>>>   #define CMTLB            (1 << 0)
>>> +#define GFX_ACTLR_PRR        (1 << 5)
>>>
>>>   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>>>   {
>>> @@ -109,6 +110,40 @@ static void 
>>> qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
>>>       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
>>>   }
>>>
>>> +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
>>> +{
>>> +    struct arm_smmu_domain *smmu_domain = (void *)cookie;
>>> +    struct arm_smmu_device *smmu = smmu_domain->smmu;
>>> +    const struct device_node *np = smmu->dev->of_node;
>>> +    struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>>> +    u32 reg = 0;
>>> +
>>> +    if (of_device_is_compatible(np, "qcom,smmu-500") &&
>>> +            of_device_is_compatible(np, "qcom,adreno-smmu")) {
>>
>> These conditions aren't going to change between calls - wouldn't it 
>> make more sense to conditionally assign the callbacks in the first 
>> place? Not the biggest deal if this is a one-off context-setup type 
>> thing, just that it looks a little funky.
>>
> 
> Let me know if you want to pursue this still.
>  From the current PRR implementation in the graphics
> vendor layer, this seems to be just setup kind-of thing.
> Also if we keep this conditional check before assigning callbacks,
> and vendor layer caller won't be having any such check,
> wouldn't it be an issue in unsupported platforms (!qcom,smmu-500 or 
> !qcom,adreno-smmu)
> as the callbacks won't be assigned?
> So as per my understanding I think it would be safe to keep the 
> condition check here?

Like I say, it makes more sense to me personally if SMMUs which don't 
have a PRR don't offer a callback for setting the PRR which they don't 
have, and for it to be the caller's responsibility not to call a NULL 
callback where they wouldn't need to call one anyway. But the 
adreno_priv interface is kind of Rob's thing, so I'll leave it to his 
preference.

Thanks,
Robin.

