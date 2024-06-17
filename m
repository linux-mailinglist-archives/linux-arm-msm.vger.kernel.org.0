Return-Path: <linux-arm-msm+bounces-22921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E00D190B823
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 19:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB2D81C20AB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 17:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01F5185E4B;
	Mon, 17 Jun 2024 17:33:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862351849FE;
	Mon, 17 Jun 2024 17:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718645631; cv=none; b=CnNqrcKx7cSjRHkoMTgF4ff/VDVR8T5NqwIRQPvQ8mhqAAp7+8CLC1b/0s43gjRR9KfOZ+NH+ghxbg/rOX9UxzPY+4ioHv1+bn7KdIQD1B0HL91StQw6BLbggukYC/OVIirJuHwgPVMQCR1gr4It/CpZdj50D8PUkj5HbgeaBoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718645631; c=relaxed/simple;
	bh=8HD1zQ5zKjAaAh1DTzhjXCg/KrwBgt3VPLU3rNNeg9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZbOKj1Kx5H5iF2B/a2UHy9wVyZLDPR7ozVBbmbyiX9rHYCn/PSaY5N1q9w2Pet2NLmsdntNcgN/NE7OyFmfbEdFYNu2foDbnvAh0cs6U5QOPBBodH6DxY6+1ZH1uhjr9ki15HYndZe5NGeFq5JWAEhVS0vL+v8CS5r7WZQfPYrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8728ADA7;
	Mon, 17 Jun 2024 10:34:13 -0700 (PDT)
Received: from [10.1.31.45] (010265703453.arm.com [10.1.31.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D595B3F64C;
	Mon, 17 Jun 2024 10:33:46 -0700 (PDT)
Message-ID: <80fc63e5-0e79-47b3-91ae-90d7c7bc3f66@arm.com>
Date: Mon, 17 Jun 2024 18:33:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: Pretty-print context fault related regs
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@chromium.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jerry Snitselaar <jsnitsel@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Pranjal Shrivastava <praan@google.com>
References: <20240604150136.493962-1-robdclark@gmail.com>
 <6f97a4b4-cdbe-466c-80d4-adc8da305f75@arm.com>
 <CAF6AEGv+Ge2SD4=j1QhXfG+KkOzvFM+LieCqKuM20YL8gp5PRQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAF6AEGv+Ge2SD4=j1QhXfG+KkOzvFM+LieCqKuM20YL8gp5PRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-06-17 5:18 pm, Rob Clark wrote:
> On Mon, Jun 17, 2024 at 6:07 AM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 04/06/2024 4:01 pm, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Parse out the bitfields for easier-to-read fault messages.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>> Stephen was wanting easier to read fault messages.. so I typed this up.
>>>
>>> Resend with the new iommu list address
>>>
>>>    drivers/iommu/arm/arm-smmu/arm-smmu.c | 53 +++++++++++++++++++++++++--
>>>    drivers/iommu/arm/arm-smmu/arm-smmu.h |  5 +++
>>>    2 files changed, 54 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> index c572d877b0e1..06712d73519c 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> @@ -411,6 +411,8 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>>>        unsigned long iova;
>>>        struct arm_smmu_domain *smmu_domain = dev;
>>>        struct arm_smmu_device *smmu = smmu_domain->smmu;
>>> +     static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
>>> +                                   DEFAULT_RATELIMIT_BURST);
>>>        int idx = smmu_domain->cfg.cbndx;
>>>        int ret;
>>>
>>> @@ -425,10 +427,53 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>>>        ret = report_iommu_fault(&smmu_domain->domain, NULL, iova,
>>>                fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
>>>
>>> -     if (ret == -ENOSYS)
>>> -             dev_err_ratelimited(smmu->dev,
>>> -             "Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
>>> -                         fsr, iova, fsynr, cbfrsynra, idx);
>>> +     if (ret == -ENOSYS && __ratelimit(&rs)) {
>>> +             static const struct {
>>> +                     u32 mask; const char *name;
>>> +             } fsr_bits[] = {
>>> +                     { ARM_SMMU_FSR_MULTI,  "MULTI" },
>>> +                     { ARM_SMMU_FSR_SS,     "SS"    },
>>> +                     { ARM_SMMU_FSR_UUT,    "UUT"   },
>>> +                     { ARM_SMMU_FSR_ASF,    "ASF"   },
>>> +                     { ARM_SMMU_FSR_TLBLKF, "TLBLKF" },
>>> +                     { ARM_SMMU_FSR_TLBMCF, "TLBMCF" },
>>> +                     { ARM_SMMU_FSR_EF,     "EF"     },
>>> +                     { ARM_SMMU_FSR_PF,     "PF"     },
>>> +                     { ARM_SMMU_FSR_AFF,    "AFF"    },
>>> +                     { ARM_SMMU_FSR_TF,     "TF"     },
>>> +             }, fsynr0_bits[] = {
>>> +                     { ARM_SMMU_FSYNR0_WNR,    "WNR"    },
>>> +                     { ARM_SMMU_FSYNR0_PNU,    "PNU"    },
>>> +                     { ARM_SMMU_FSYNR0_IND,    "IND"    },
>>> +                     { ARM_SMMU_FSYNR0_NSATTR, "NSATTR" },
>>> +                     { ARM_SMMU_FSYNR0_PTWF,   "PTWF"   },
>>> +                     { ARM_SMMU_FSYNR0_AFR,    "AFR"    },
>>> +             };
>>> +
>>> +             pr_err("%s %s: Unhandled context fault: fsr=0x%x (",
>>> +                    dev_driver_string(smmu->dev), dev_name(smmu->dev), fsr);
>>> +
>>> +             for (int i = 0, n = 0; i < ARRAY_SIZE(fsr_bits); i++) {
>>> +                     if (fsr & fsr_bits[i].mask) {
>>> +                             pr_cont("%s%s", (n > 0) ? "|" : "", fsr_bits[i].name);
>>
>> Given that SMMU faults have a high likelihood of correlating with other
>> errors, e.g. the initiating device also reporting that it got an abort
>> back, this much pr_cont is a recipe for an unreadable mess. Furthermore,
>> just imagine how "helpful" this would be when faults in two contexts are
>> reported by two different CPUs at the same time ;)
> 
> It looks like arm_smmu_context_fault() is only used with non-threaded
> irq's.  And this fallback is only used if driver doesn't register it's
> own fault handler.  So I don't think this will be a problem.

You don't think two different IRQs can fire on two different CPUs at the 
same time (or close to)? It's already bad enough when multiple CPUs 
panic and one has to pick apart line-by-line interleaving of the 
registers/stacktraces - imagine how much more utterly unusable that 
would be with bits of different dumps randomly pr_cont'ed together onto 
the same line(s)...

Even when unrelated stuff gets interleaved because other CPUs just 
happen to be calling printk() at the same time for unrelated reasons 
it's still annoying, and pr_cont makes a bigger mess than not.
>> I'd prefer to retain the original message as-is, so there is at least
>> still an unambiguous "atomic" view of a fault's entire state, then
>> follow it with a decode more in the style of arm64's ESR logging. TBH I
>> also wouldn't disapprove of hiding the additional decode behind a
>> command-line/runtime parameter, since a fault storm can cripple a system
>> enough as it is, without making the interrupt handler spend even longer
>> printing to a potentially slow console.
> 
> It _is_ ratelimited.  But we could perhaps use a higher loglevel (pr_debug?)

Yeah, I'd have no complaint with pr_debug/dev_dbg either, if that suits 
your use case. True that the ratelimit may typically mitigate the 
overall impact, but still in the worst case with a sufficiently slow 
console and/or a sufficiently large amount to print per __ratelimit() 
call, it can end up being slow enough to stay below the threshold. Don't 
ask me how I know that :)

Thanks,
Robin.

