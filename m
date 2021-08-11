Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2143E9519
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 17:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233504AbhHKPyA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 11:54:00 -0400
Received: from foss.arm.com ([217.140.110.172]:53514 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232847AbhHKPxw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 11:53:52 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCA36106F;
        Wed, 11 Aug 2021 08:53:28 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00EEA3F718;
        Wed, 11 Aug 2021 08:53:26 -0700 (PDT)
Subject: Re: [PATCHv4] iommu/arm-smmu: Optimize ->tlb_flush_walk() for qcom
 implementation
To:     Will Deacon <will@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20210811060725.25221-1-saiprakash.ranjan@codeaurora.org>
 <20210811103011.GD4426@willie-the-truck>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <7be65300-632a-8626-e5da-13bc9e276763@arm.com>
Date:   Wed, 11 Aug 2021 16:53:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210811103011.GD4426@willie-the-truck>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-11 11:30, Will Deacon wrote:
> On Wed, Aug 11, 2021 at 11:37:25AM +0530, Sai Prakash Ranjan wrote:
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index f7da8953afbe..3904b598e0f9 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -327,9 +327,16 @@ static void arm_smmu_tlb_inv_range_s2(unsigned long iova, size_t size,
>>   static void arm_smmu_tlb_inv_walk_s1(unsigned long iova, size_t size,
>>   				     size_t granule, void *cookie)
>>   {
>> -	arm_smmu_tlb_inv_range_s1(iova, size, granule, cookie,
>> -				  ARM_SMMU_CB_S1_TLBIVA);
>> -	arm_smmu_tlb_sync_context(cookie);
>> +	struct arm_smmu_domain *smmu_domain = cookie;
>> +	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>> +
>> +	if (cfg->flush_walk_prefer_tlbiasid) {
>> +		arm_smmu_tlb_inv_context_s1(cookie);
> 
> Hmm, this introduces an unconditional wmb() if tlbiasid is preferred. I
> think that should be predicated on ARM_SMMU_FEAT_COHERENT_WALK like it is
> for the by-VA ops. Worth doing as a separate patch.
> 
>> +	} else {
>> +		arm_smmu_tlb_inv_range_s1(iova, size, granule, cookie,
>> +					  ARM_SMMU_CB_S1_TLBIVA);
>> +		arm_smmu_tlb_sync_context(cookie);
>> +	}
>>   }
>>   
>>   static void arm_smmu_tlb_add_page_s1(struct iommu_iotlb_gather *gather,
>> @@ -765,8 +772,10 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>>   		.iommu_dev	= smmu->dev,
>>   	};
>>   
>> -	if (!iommu_get_dma_strict(domain))
>> +	if (!iommu_get_dma_strict(domain)) {
>>   		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
>> +		cfg->flush_walk_prefer_tlbiasid = true;
> 
> This is going to interact badly with Robin's series to allow dynamic
> transition to non-strict mode, as we don't have a mechanism to switch
> over to the by-ASID behaviour. Yes, it should _work_, but it's ugly having
> different TLBI behaviour just because of the how the domain became
> non-strict.
> 
> Robin -- I think this originated from your idea at [1]. Any idea how to make
> it work with your other series, or shall we drop this part for now and leave
> the TLB invalidation behaviour the same for now?

Yeah, I'd say drop it - I'm currently half an hour into a first attempt 
at removing io_pgtable_tlb_flush_walk() entirely, which would make it 
moot for non-strict anyway.

Robin.
