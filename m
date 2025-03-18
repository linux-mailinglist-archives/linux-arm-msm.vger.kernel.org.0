Return-Path: <linux-arm-msm+bounces-51736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6432FA6754E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70407188941F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 13:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877F01EF377;
	Tue, 18 Mar 2025 13:37:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3529520C488
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742305024; cv=none; b=Q6Rs1GBBPyBjy/4nzKhtkOrqd4DK7uS3YcoWw8RmLZySUBDiBn57KM/LDRWVp3pjxNvQs1um0kRXDhqCyiPWrhRVUnvTmQw8Nex2yFT3Gx9YBv0MABvr355N+bKIgGtl6BkIVOAGB9J9TUz/TTmlGPKJ5i/+xMdeAPhNGImdF2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742305024; c=relaxed/simple;
	bh=wZUXHNT2YSncmvgzuJtppEaI943c7lhckMJfgQPa1nI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+DWhhhWoMDxgYy9/jLkklnUJ9FCLPQ9NPsAR2zL9KsQT97pzGteS4K8VnDqiDYoyuvhOqt97ueXoZvOK9qASaXoDV6n/+oijka7Xoy57DikDPBi6Pe1XxQc5jfhStwRehqRTMH3Kc9ricFRPcbodZzVgPFgdQnBRcHntsY5mRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F274313D5;
	Tue, 18 Mar 2025 06:37:06 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3E503F673;
	Tue, 18 Mar 2025 06:36:56 -0700 (PDT)
Message-ID: <394571e1-f86d-472c-91dc-4377d512bfbe@arm.com>
Date: Tue, 18 Mar 2025 13:36:55 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
To: Connor Abbott <cwabbott0@gmail.com>, Will Deacon <will@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com>
 <20250311181151.GD5216@willie-the-truck>
 <CACu1E7Gg3WpQASADAdediRzFz2wEXAnfD7tg05XkiXZQp=X8fQ@mail.gmail.com>
 <20250312124907.GB6181@willie-the-truck>
 <CACu1E7Hm=DWDC2aFdBRkT8f=8gKXJPpif_uEOA9iFZcyT-uCfQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CACu1E7Hm=DWDC2aFdBRkT8f=8gKXJPpif_uEOA9iFZcyT-uCfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/03/2025 1:30 pm, Connor Abbott wrote:
> On Wed, Mar 12, 2025 at 8:49 AM Will Deacon <will@kernel.org> wrote:
>>
>> On Tue, Mar 11, 2025 at 04:01:00PM -0400, Connor Abbott wrote:
>>> On Tue, Mar 11, 2025 at 2:11 PM Will Deacon <will@kernel.org> wrote:
>>>>
>>>> On Tue, Mar 04, 2025 at 11:56:50AM -0500, Connor Abbott wrote:
>>>>> Up until now we have only called the set_stall callback during
>>>>> initialization when the device is off. But we will soon start calling it
>>>>> to temporarily disable stall-on-fault when the device is on, so handle
>>>>> that by checking if the device is on and writing SCTLR.
>>>>>
>>>>> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
>>>>> ---
>>>>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 30 +++++++++++++++++++++++++++---
>>>>>   1 file changed, 27 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>> index a428e53add08d451fb2152e3ab80e0fba936e214..d34a0d917013bb3d5a24b3ce72f48e3b38474da2 100644
>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>> @@ -77,12 +77,36 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
>>>>>   {
>>>>>        struct arm_smmu_domain *smmu_domain = (void *)cookie;
>>>>>        struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>>>>> -     struct qcom_smmu *qsmmu = to_qcom_smmu(smmu_domain->smmu);
>>>>> +     struct arm_smmu_device *smmu = smmu_domain->smmu;
>>>>> +     struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
>>>>> +     u32 mask = BIT(cfg->cbndx);
>>>>> +     bool stall_changed = !!(qsmmu->stall_enabled & mask) != enabled;
>>>>> +     unsigned long flags;
>>>>>
>>>>>        if (enabled)
>>>>> -             qsmmu->stall_enabled |= BIT(cfg->cbndx);
>>>>> +             qsmmu->stall_enabled |= mask;
>>>>>        else
>>>>> -             qsmmu->stall_enabled &= ~BIT(cfg->cbndx);
>>>>> +             qsmmu->stall_enabled &= ~mask;
>>>>> +
>>>>> +     /*
>>>>> +      * If the device is on and we changed the setting, update the register.
>>>>> +      */
>>>>> +     if (stall_changed && pm_runtime_get_if_active(smmu->dev) > 0) {
>>>>> +             spin_lock_irqsave(&smmu_domain->cb_lock, flags);
>>>>> +
>>>>> +             u32 reg = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
>>>>> +
>>>>> +             if (enabled)
>>>>> +                     reg |= ARM_SMMU_SCTLR_CFCFG;
>>>>> +             else
>>>>> +                     reg &= ~ARM_SMMU_SCTLR_CFCFG;
>>>>> +
>>>>> +             arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, reg);
>>>>
>>>> Are you sure you don't need TLB invalidation for this to take effect? I
>>>> think some fields in the SCTLR can be cached in the TLB but you'll need
>>>> to check whether or not that applies to CFCFG.
>>>>
>>>
>>> I think it should be fine because CFCFG only controls behavior when
>>> there's a context fault and there can't be TLB entries for entries
>>> that cause a context fault: "The architecture permits the caching of
>>> any translation table entry that has been returned from memory without
>>> a fault and that does not, as a result of that entry, cause a
>>> Translation Fault or an Access Flag fault."
>>
>> Ok, but what about other types of fault? For example, a permission fault
>> or an address size fault?
>>
>> Will
> 
> I'm not sure, but the pseudocode for context faults mentions
> resampling CFCFG after a fault happens ("We have a fault and must
> resample FSR, CFCFG and HUPCF") so I don't think it would be legal to
> cache it. Also in practice this does seem to work. Does that answer
> it?

FWIW I checked with the former MMU-500 design lead, and although he 
doesn't remember the exact details he's pretty confident that they 
wouldn't have cached anything fault-related, so at least from our side 
I'd consider this OK.

Thanks,
Robin.

