Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD5A81C875E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 12:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbgEGKz7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 06:55:59 -0400
Received: from foss.arm.com ([217.140.110.172]:56334 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725900AbgEGKz7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 06:55:59 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CB411FB;
        Thu,  7 May 2020 03:55:56 -0700 (PDT)
Received: from [10.57.36.85] (unknown [10.57.36.85])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAC833F68F;
        Thu,  7 May 2020 03:55:54 -0700 (PDT)
Subject: Re: [PATCH] iomm/arm-smmu: Add stall implementation hook
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20200421202004.11686-1-saiprakash.ranjan@codeaurora.org>
 <b491e02ad790a437115fdeab6b21bc48@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <1ced023b-157c-21a0-ac75-1adef7f029f0@arm.com>
Date:   Thu, 7 May 2020 11:55:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b491e02ad790a437115fdeab6b21bc48@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-05-07 11:14 am, Sai Prakash Ranjan wrote:
> Hi Will, Robin
> 
> On 2020-04-22 01:50, Sai Prakash Ranjan wrote:
>> Add stall implementation hook to enable stalling
>> faults on QCOM platforms which supports it without
>> causing any kind of hardware mishaps. Without this
>> on QCOM platforms, GPU faults can cause unrelated
>> GPU memory accesses to return zeroes. This has the
>> unfortunate result of command-stream reads from CP
>> getting invalid data, causing a cascade of fail.

I think this came up before, but something about this rationale doesn't 
add up - we're not *using* stalls at all, we're still terminating 
faulting transactions unconditionally; we're just using CFCFG to 
terminate them with a slight delay, rather than immediately. It's really 
not clear how or why that makes a difference. Is it a GPU bug? Or an 
SMMU bug? Is this reliable (or even a documented workaround for 
something), or might things start blowing up again if any other 
behaviour subtly changes? I'm not dead set against adding this, but I'd 
*really* like to have a lot more confidence in it.

>> Suggested-by: Rob Clark <robdclark@gmail.com>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>> This has been attempted previously by Rob Clark in 2017, 2018.
>> Hopefully we can get something concluded in 2020.
>>  * https://patchwork.kernel.org/patch/9953803/
>>  * https://patchwork.kernel.org/patch/10618713/
>> ---
>>  drivers/iommu/arm-smmu-qcom.c | 1 +
>>  drivers/iommu/arm-smmu.c      | 7 +++++++
>>  drivers/iommu/arm-smmu.h      | 1 +
>>  3 files changed, 9 insertions(+)
>>
>> diff --git a/drivers/iommu/arm-smmu-qcom.c 
>> b/drivers/iommu/arm-smmu-qcom.c
>> index 24c071c1d8b0..a13b229389d4 100644
>> --- a/drivers/iommu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm-smmu-qcom.c
>> @@ -32,6 +32,7 @@ static int qcom_sdm845_smmu500_reset(struct
>> arm_smmu_device *smmu)
>>
>>  static const struct arm_smmu_impl qcom_smmu_impl = {
>>      .reset = qcom_sdm845_smmu500_reset,
>> +    .stall = true,
>>  };
>>
>>  struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device 
>> *smmu)
>> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
>> index e622f4e33379..16b03fca9966 100644
>> --- a/drivers/iommu/arm-smmu.c
>> +++ b/drivers/iommu/arm-smmu.c
>> @@ -488,6 +488,11 @@ static irqreturn_t arm_smmu_context_fault(int
>> irq, void *dev)
>>                  fsr, iova, fsynr, cbfrsynra, idx);
>>
>>      arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
>> +
>> +    if (smmu->impl && smmu->impl->stall && (fsr & ARM_SMMU_FSR_SS))
>> +        arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_RESUME,
>> +                  ARM_SMMU_RESUME_TERMINATE);

Shouldn't this be *before* the write to FSR, in case the outstanding 
fault causes that to be immediately reasserted before we write CB_RESUME 
and we end up immediately taking the IRQ a second time?

(The overall enablement being in impl is sound, but you still don't get 
to play "works on my machine" in the architectural code :P)

Robin.

>> +
>>      return IRQ_HANDLED;
>>  }
>>
>> @@ -659,6 +664,8 @@ static void arm_smmu_write_context_bank(struct
>> arm_smmu_device *smmu, int idx)
>>          reg |= ARM_SMMU_SCTLR_S1_ASIDPNE;
>>      if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
>>          reg |= ARM_SMMU_SCTLR_E;
>> +    if (smmu->impl && smmu->impl->stall)
>> +        reg |= ARM_SMMU_SCTLR_CFCFG;
>>
>>      arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
>>  }
>> diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
>> index 8d1cd54d82a6..d5134e0d5cce 100644
>> --- a/drivers/iommu/arm-smmu.h
>> +++ b/drivers/iommu/arm-smmu.h
>> @@ -386,6 +386,7 @@ struct arm_smmu_impl {
>>      int (*init_context)(struct arm_smmu_domain *smmu_domain);
>>      void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
>>               int status);
>> +    bool stall;
>>  };
>>
>>  static inline void __iomem *arm_smmu_page(struct arm_smmu_device 
>> *smmu, int n)
> 
> Any comments on this patch?
> 
> Thanks,
> Sai
> 
