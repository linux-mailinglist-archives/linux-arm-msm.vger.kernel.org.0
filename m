Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9955543B7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729064AbfFMP3e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:29:34 -0400
Received: from foss.arm.com ([217.140.110.172]:38504 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728862AbfFMLXJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 07:23:09 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D62A367;
        Thu, 13 Jun 2019 04:23:08 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70BAD3F694;
        Thu, 13 Jun 2019 04:24:50 -0700 (PDT)
Subject: Re: [RFC 1/2] iommu: arm-smmu: Handoff SMR registers and context
 banks
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will.deacon@arm.com>
Cc:     Vivek Gautam <vivek.gautam@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Patrick Daly <pdaly@codeaurora.org>,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20190605210856.20677-1-bjorn.andersson@linaro.org>
 <20190605210856.20677-2-bjorn.andersson@linaro.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <25f19f09-ab19-a7b3-c31a-f5f29b29fef8@arm.com>
Date:   Thu, 13 Jun 2019 12:23:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605210856.20677-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/06/2019 22:08, Bjorn Andersson wrote:
> Boot splash screen or EFI framebuffer requires the display hardware to
> operate while the Linux iommu driver probes. Therefore, we cannot simply
> wipe out the SMR register settings programmed by the bootloader.
> 
> Detect which SMR registers are in use during probe, and which context
> banks they are associated with. Reserve these context banks for the
> first Linux device whose stream-id matches the SMR register.
> 
> Any existing page-tables will be discarded.

That doesn't seem particularly useful :/

Either way, if firmware did set up a translation context, is there any 
guarantee that its pagetables haven't already been stomped on by Linux 
(e.g. via memtest)?

> Heavily based on downstream implementation by Patrick Daly
> <pdaly@codeaurora.org>.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>   drivers/iommu/arm-smmu-regs.h |  2 +
>   drivers/iommu/arm-smmu.c      | 80 ++++++++++++++++++++++++++++++++---
>   2 files changed, 77 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu-regs.h b/drivers/iommu/arm-smmu-regs.h
> index e9132a926761..8c1fd84032a2 100644
> --- a/drivers/iommu/arm-smmu-regs.h
> +++ b/drivers/iommu/arm-smmu-regs.h
> @@ -105,7 +105,9 @@
>   #define ARM_SMMU_GR0_SMR(n)		(0x800 + ((n) << 2))
>   #define SMR_VALID			(1 << 31)
>   #define SMR_MASK_SHIFT			16
> +#define SMR_MASK_MASK			0x7fff
>   #define SMR_ID_SHIFT			0
> +#define SMR_ID_MASK			0xffff

The SMR ID and MASK fields are either both 15 bits or both 16 bits, 
depending on EXIDS. This mix-and-match is plain wrong either way.

>   #define ARM_SMMU_GR0_S2CR(n)		(0xc00 + ((n) << 2))
>   #define S2CR_CBNDX_SHIFT		0
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 5e54cc0a28b3..c8629a656b42 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -135,6 +135,7 @@ struct arm_smmu_s2cr {
>   	enum arm_smmu_s2cr_type		type;
>   	enum arm_smmu_s2cr_privcfg	privcfg;
>   	u8				cbndx;
> +	bool				handoff;
>   };
>   
>   #define s2cr_init_val (struct arm_smmu_s2cr){				\
> @@ -399,9 +400,22 @@ static int arm_smmu_register_legacy_master(struct device *dev,
>   	return err;
>   }
>   
> -static int __arm_smmu_alloc_bitmap(unsigned long *map, int start, int end)
> +static int __arm_smmu_alloc_cb(struct arm_smmu_device *smmu, int start,
> +			       struct device *dev)
>   {
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	unsigned long *map = smmu->context_map;
> +	int end = smmu->num_context_banks;
> +	int cbndx;
>   	int idx;
> +	int i;
> +
> +	for_each_cfg_sme(fwspec, i, idx) {
> +		if (smmu->s2crs[idx].handoff) {
> +			cbndx = smmu->s2crs[idx].cbndx;
> +			goto found_handoff;
> +		}
> +	}
>   
>   	do {
>   		idx = find_next_zero_bit(map, end, start);
> @@ -410,6 +424,17 @@ static int __arm_smmu_alloc_bitmap(unsigned long *map, int start, int end)
>   	} while (test_and_set_bit(idx, map));
>   
>   	return idx;
> +
> +found_handoff:
> +	for (i = 0; i < smmu->num_mapping_groups; i++) {
> +		if (smmu->s2crs[i].cbndx == cbndx) {
> +			smmu->s2crs[i].cbndx = 0;
> +			smmu->s2crs[i].handoff = false;
> +			smmu->s2crs[i].count--;
> +		}
> +	}
> +
> +	return cbndx;
>   }
>   
>   static void __arm_smmu_free_bitmap(unsigned long *map, int idx)
> @@ -759,7 +784,8 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
>   }
>   
>   static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> -					struct arm_smmu_device *smmu)
> +					struct arm_smmu_device *smmu,
> +					struct device *dev)
>   {
>   	int irq, start, ret = 0;
>   	unsigned long ias, oas;
> @@ -873,8 +899,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>   		ret = -EINVAL;
>   		goto out_unlock;
>   	}
> -	ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
> -				      smmu->num_context_banks);
> +	ret = __arm_smmu_alloc_cb(smmu, start, dev);
>   	if (ret < 0)
>   		goto out_unlock;
>   
> @@ -1264,7 +1289,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>   		return ret;
>   
>   	/* Ensure that the domain is finalised */
> -	ret = arm_smmu_init_domain_context(domain, smmu);
> +	ret = arm_smmu_init_domain_context(domain, smmu, dev);
>   	if (ret < 0)
>   		goto rpm_put;
>   
> @@ -1798,6 +1823,49 @@ static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
>   	writel(reg, ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0);
>   }
>   
> +static void arm_smmu_read_smr_state(struct arm_smmu_device *smmu)
> +{
> +	u32 privcfg;
> +	u32 cbndx;
> +	u32 mask;
> +	u32 type;
> +	u32 s2cr;
> +	u32 smr;
> +	u32 id;
> +	int i;
> +
> +	for (i = 0; i < smmu->num_mapping_groups; i++) {
> +		smr = readl_relaxed(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_SMR(i));

What about stream indexing?

> +		mask = (smr >> SMR_MASK_SHIFT) & SMR_MASK_MASK;
> +		id = smr & SMR_ID_MASK;
> +		if (!(smr & SMR_VALID))

EXIDs again...

> +			continue;
> +
> +		s2cr = readl_relaxed(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_S2CR(i));
> +		type = (s2cr >> S2CR_TYPE_SHIFT) & S2CR_TYPE_MASK;
> +		cbndx = (s2cr >> S2CR_CBNDX_SHIFT) & S2CR_CBNDX_MASK;
> +		privcfg = (s2cr >> S2CR_PRIVCFG_SHIFT) & S2CR_PRIVCFG_MASK;
> +		if (type != S2CR_TYPE_TRANS)
> +			continue;

How can you tell whether an SMR or S2CR has been programmed by the 
firmware, or that its UNKNOWN reset value is junk which just happens to 
look plausible?

> +
> +		/* Populate the SMR */
> +		smmu->smrs[i].mask = mask;
> +		smmu->smrs[i].id = id;
> +		smmu->smrs[i].valid = true;
> +
> +		/* Populate the S2CR */
> +		smmu->s2crs[i].group = NULL;
> +		smmu->s2crs[i].count = 1;
> +		smmu->s2crs[i].type = type;
> +		smmu->s2crs[i].privcfg = privcfg;
> +		smmu->s2crs[i].cbndx = cbndx;
> +		smmu->s2crs[i].handoff = true;
> +
> +		/* Mark the context bank as busy */
> +		bitmap_set(smmu->context_map, cbndx, 1);

Does anything prevent the SMMU being suspended between here and whenever 
the relevant drivers(s) show up to properly establish the device links?

> +	}
> +}
> +
>   static int arm_smmu_id_size_to_bits(int size)
>   {
>   	switch (size) {
> @@ -2023,6 +2091,8 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
>   		dev_notice(smmu->dev, "\tStage-2: %lu-bit IPA -> %lu-bit PA\n",
>   			   smmu->ipa_size, smmu->pa_size);
>   
> +	arm_smmu_read_smr_state(smmu);
> +
>   	return 0;
>   }

Stepping back from the implementation details, I also have concerns that 
this will interact badly with kexec/kdump, but mostly the fact that it's 
at best a partial workaround, rather than a real solution to the 
fundamental problem that initialising an IOMMU can break 
EFIFB/bootsplash/etc., *regardless* of whether the firmware is even 
aware of said IOMMU at all - I've already been living with this on my 
Juno board for months since EDK2 gained Arm HDLCD support. AFAICS this 
can only be solved by some sort of RMRR-like mechanism, i.e. firmware 
providing explicit information about what address ranges are currently 
in use by which devices. I've been pondering what a DT-based 
implementation might look like for a while now, and I guess it's 
probably time to raise it with the IORT spec owners as well.

That said, once we've perfected our WIP design for keeping invasive 
implementation details out of the way of each other and the core 
architectural driver flow, I wouldn't rule out the possibility of 
slotting something like this in as a qcom-specific feature if the "we 
can't change the firmware" argument is going to come up.

Robin.
