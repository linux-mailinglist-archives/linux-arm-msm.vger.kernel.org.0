Return-Path: <linux-arm-msm+bounces-36309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB9D9B4ADD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 14:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A27361C22820
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 13:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC0C206514;
	Tue, 29 Oct 2024 13:25:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D12206078;
	Tue, 29 Oct 2024 13:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730208333; cv=none; b=ZfVRNQBou2LntztaDqkp8MG9aMv7UJBZyg+8+lHQV1OfeyUjgN8B5rT49EJqbx3M4cjT5IUPfhVTgIOShAAfRtwTjbhAxUx49RakBqzFrptarRTpQ3gY4cGfHgkdgqYYplwh65bx2aa8Q2sB7VR6daZByUyMmKNIhGUUt/j8+1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730208333; c=relaxed/simple;
	bh=pspKFGNpCiKI9E9FTOSk/kFZTLdatmjvJ0xgyFev+m0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSHZdIhQZ0112KwTyQwEUT/BRZITcRcrGpzAjnCKyaoXeizuGmdaYkxZwC3M8LGiPDynVeAZXAwP1dQ51FDWsy3VZWcL+bHElxraHbyZVoqpbK9I6Cisa9Db2VQBbMn2HhJhHj1WnbJ4vyNr1wu8sCPevV1OMj52eT9IaqfS6aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B296C13D5;
	Tue, 29 Oct 2024 06:25:59 -0700 (PDT)
Received: from [10.57.89.81] (unknown [10.57.89.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 715433F528;
	Tue, 29 Oct 2024 06:25:27 -0700 (PDT)
Message-ID: <f9a4ead4-b109-4c70-a08d-2e86cfb3fe11@arm.com>
Date: Tue, 29 Oct 2024 13:25:17 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/5] iommu/arm-smmu: re-enable context caching in smmu
 reset operation
To: Will Deacon <will@kernel.org>,
 Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: robdclark@gmail.com, joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com,
 robh@kernel.org, krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
 dmitry.baryshkov@linaro.org, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com>
 <20241008125410.3422512-2-quic_bibekkum@quicinc.com>
 <20241024125241.GD30704@willie-the-truck>
 <092db44e-f254-4abd-abea-e9a64e70df12@quicinc.com>
 <20241029124708.GA4241@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241029124708.GA4241@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-10-29 12:47 pm, Will Deacon wrote:
> On Fri, Oct 25, 2024 at 07:51:22PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 10/24/2024 6:22 PM, Will Deacon wrote:
>>> On Tue, Oct 08, 2024 at 06:24:06PM +0530, Bibek Kumar Patro wrote:
>>>> Default MMU-500 reset operation disables context caching in
>>>> prefetch buffer. It is however expected for context banks using
>>>> the ACTLR register to retain their prefetch value during reset
>>>> and runtime suspend.
>>>>
>>>> Replace default MMU-500 reset operation with Qualcomm specific reset
>>>> operation which envelope the default reset operation and re-enables
>>>> context caching in prefetch buffer for Qualcomm SoCs.
>>>>
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>>> ---
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 45 ++++++++++++++++++++--
>>>>    1 file changed, 42 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> index 087fb4f6f4d3..0cb10b354802 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> @@ -16,6 +16,16 @@
>>>>
>>>>    #define QCOM_DUMMY_VAL	-1
>>>>
>>>> +/*
>>>> + * SMMU-500 TRM defines BIT(0) as CMTLB (Enable context caching in the
>>>> + * macro TLB) and BIT(1) as CPRE (Enable context caching in the prefetch
>>>> + * buffer). The remaining bits are implementation defined and vary across
>>>> + * SoCs.
>>>> + */
>>>> +
>>>> +#define CPRE			(1 << 1)
>>>> +#define CMTLB			(1 << 0)
>>>> +
>>>>    static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>>>>    {
>>>>    	return container_of(smmu, struct qcom_smmu, smmu);
>>>> @@ -396,11 +406,40 @@ static int qcom_smmu_def_domain_type(struct device *dev)
>>>>    	return match ? IOMMU_DOMAIN_IDENTITY : 0;
>>>>    }
>>>>
>>>> +static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
>>>> +{
>>>> +	int ret;
>>>> +	u32 val;
>>>> +	int i;
>>>> +
>>>> +	ret = arm_mmu500_reset(smmu);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	/*
>>>> +	 * arm_mmu500_reset() disables CPRE which is re-enabled here.
>>>> +	 * The errata for MMU-500 before the r2p2 revision requires CPRE to be
>>>> +	 * disabled. The arm_mmu500_reset function disables CPRE to accommodate all
>>>> +	 * RTL revisions. Since all Qualcomm SoCs are on the r2p4 revision, where
>>>> +	 * the CPRE bit can be enabled, the qcom_smmu500_reset function re-enables
>>>> +	 * the CPRE bit for the next-page prefetcher to retain the prefetch value
>>>> +	 * during reset and runtime suspend operations.
>>>> +	 */
>>>> +
>>>> +	for (i = 0; i < smmu->num_context_banks; ++i) {
>>>> +		val = arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_ACTLR);
>>>> +		val |= CPRE;
>>>> +		arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_ACTLR, val);
>>>> +	}
>>>
>>> If CPRE only needs to be disabled prior to r2p2, then please teach the
>>> MMU-500 code about that instead of adding qualcomm-specific logic here.
>>>
>>
>> Doing this on MMU-500 code would make it generic and reflect for SoC of all
>> the vendors on this platform.
>> We can make sure that it won't cause any problems in Qualcomm SoCs as we
>> have been enabling this since for some years now and could not
>> observe/reproduce any issues around these errata.
> 
> Unless you can explain definitively hy that's the case, I still don't
> think we should be second-guessing the core SMMU driver code in the
> Qualcomm backend.

Of the still-open errata, #562869 could be safely mitigated by nobbling 
ARM_SMMU_FEAT_FMT_AARCH32_S, but #1047329 is the one which worries me, 
since even if we don't support nesting within Linux, I'm wary of the 
firmware hypervisor sticking its own S2 under any S1 context we set up. 
I guess we could try the alternate SMMU_ACR.IPA2PA_CEN workaround for 
that, however it's not obvious that the performance impact in that case 
wouldn't be worse than whatever benefit may be gained from keeping CPRE.

Thanks,
Robin.

>> But we won't be able to guarantee the same behavior in SoC for other vendors
>> where these errata might still be applicable as per [1] and [2].
>> So as per my understanding it's safe to include in Qualcomm specific
>> implementation and not changing the default behavior in all other vendors'
>> SoC even if they are not prior to r2p2 revision [3].
> 
> If you want to gate the errata workarounds on policy, then please follow
> what we do for the CPU: add a Kconfig option (e.g.
> ARM_SMMU_WORKAROUND_BROKEN_CPRE) which defaults to "on" (assuming that
> the relevant errata aren't all "rare") and update silicon-errata.rst
> accordingly.
> 
> Then you can choose to disable them in your .config if you're happy to
> pick up the pieces.
> 
> As an aside, I'm happy with the rest of the series now.
> 
> Will


