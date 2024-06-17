Return-Path: <linux-arm-msm+bounces-22860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D28390AEBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 15:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8DBF1F28F24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 13:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839EB197A98;
	Mon, 17 Jun 2024 13:07:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E091E197A82;
	Mon, 17 Jun 2024 13:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718629635; cv=none; b=amn90i8TV0gEAmQwVip+F/l1K5slGCltkP6olX4Qg+nG1uzvZ4TEs010wiBwXnBXMcNw8Edn3mrq6TkyQZJSpibEwxDsCKzltkxZ8+PvGtTedkxv7vq4fQLyRR146sJzVfnfEo2+cmASUywqUmb3tZUYxRExCc2MdY12coUYV88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718629635; c=relaxed/simple;
	bh=u169XjjViv3dzq1JVdC+hzcCnrsy3F0eFlgrC3nkdDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rEs/jXqgWAIlggl3ACwqFNg2W/TCyS+KnTqGdoV7sCmGVWsHMi4QkH+Ra8HrG0TvzlBJH+Y/IBMCnRro1EVfR71WC16LnZdF3PPWDNqxPXHbKWiU47zMnNZRxn8nOl+9SoyshScCRhSxpYAYHCIsn6eWHflsaEbfhA4vTJtmX5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8DA1DA7;
	Mon, 17 Jun 2024 06:07:31 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AC893F64C;
	Mon, 17 Jun 2024 06:07:05 -0700 (PDT)
Message-ID: <6f97a4b4-cdbe-466c-80d4-adc8da305f75@arm.com>
Date: Mon, 17 Jun 2024 14:07:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: Pretty-print context fault related regs
To: Rob Clark <robdclark@gmail.com>, iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jerry Snitselaar <jsnitsel@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Pranjal Shrivastava <praan@google.com>
References: <20240604150136.493962-1-robdclark@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20240604150136.493962-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2024 4:01 pm, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Parse out the bitfields for easier-to-read fault messages.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> Stephen was wanting easier to read fault messages.. so I typed this up.
> 
> Resend with the new iommu list address
> 
>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 53 +++++++++++++++++++++++++--
>   drivers/iommu/arm/arm-smmu/arm-smmu.h |  5 +++
>   2 files changed, 54 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index c572d877b0e1..06712d73519c 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -411,6 +411,8 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>   	unsigned long iova;
>   	struct arm_smmu_domain *smmu_domain = dev;
>   	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
> +				      DEFAULT_RATELIMIT_BURST);
>   	int idx = smmu_domain->cfg.cbndx;
>   	int ret;
>   
> @@ -425,10 +427,53 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>   	ret = report_iommu_fault(&smmu_domain->domain, NULL, iova,
>   		fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
>   
> -	if (ret == -ENOSYS)
> -		dev_err_ratelimited(smmu->dev,
> -		"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
> -			    fsr, iova, fsynr, cbfrsynra, idx);
> +	if (ret == -ENOSYS && __ratelimit(&rs)) {
> +		static const struct {
> +			u32 mask; const char *name;
> +		} fsr_bits[] = {
> +			{ ARM_SMMU_FSR_MULTI,  "MULTI" },
> +			{ ARM_SMMU_FSR_SS,     "SS"    },
> +			{ ARM_SMMU_FSR_UUT,    "UUT"   },
> +			{ ARM_SMMU_FSR_ASF,    "ASF"   },
> +			{ ARM_SMMU_FSR_TLBLKF, "TLBLKF" },
> +			{ ARM_SMMU_FSR_TLBMCF, "TLBMCF" },
> +			{ ARM_SMMU_FSR_EF,     "EF"     },
> +			{ ARM_SMMU_FSR_PF,     "PF"     },
> +			{ ARM_SMMU_FSR_AFF,    "AFF"    },
> +			{ ARM_SMMU_FSR_TF,     "TF"     },
> +		}, fsynr0_bits[] = {
> +			{ ARM_SMMU_FSYNR0_WNR,    "WNR"    },
> +			{ ARM_SMMU_FSYNR0_PNU,    "PNU"    },
> +			{ ARM_SMMU_FSYNR0_IND,    "IND"    },
> +			{ ARM_SMMU_FSYNR0_NSATTR, "NSATTR" },
> +			{ ARM_SMMU_FSYNR0_PTWF,   "PTWF"   },
> +			{ ARM_SMMU_FSYNR0_AFR,    "AFR"    },
> +		};
> +
> +		pr_err("%s %s: Unhandled context fault: fsr=0x%x (",
> +		       dev_driver_string(smmu->dev), dev_name(smmu->dev), fsr);
> +
> +		for (int i = 0, n = 0; i < ARRAY_SIZE(fsr_bits); i++) {
> +			if (fsr & fsr_bits[i].mask) {
> +				pr_cont("%s%s", (n > 0) ? "|" : "", fsr_bits[i].name);

Given that SMMU faults have a high likelihood of correlating with other 
errors, e.g. the initiating device also reporting that it got an abort 
back, this much pr_cont is a recipe for an unreadable mess. Furthermore, 
just imagine how "helpful" this would be when faults in two contexts are 
reported by two different CPUs at the same time ;)

I'd prefer to retain the original message as-is, so there is at least 
still an unambiguous "atomic" view of a fault's entire state, then 
follow it with a decode more in the style of arm64's ESR logging. TBH I 
also wouldn't disapprove of hiding the additional decode behind a 
command-line/runtime parameter, since a fault storm can cripple a system 
enough as it is, without making the interrupt handler spend even longer 
printing to a potentially slow console.

> +				n++;
> +			}
> +		}
> +
> +		pr_cont("), iova=0x%08lx, fsynr=0x%x (S1CBNDX=%u", iova, fsynr,
> +			(fsynr >> 16) & 0xff);

Please define all the bitfields properly (and I agree with Pranjal about 
the naming).

Thanks,
Robin.

> +
> +		for (int i = 0; i < ARRAY_SIZE(fsynr0_bits); i++) {
> +			if (fsynr & fsynr0_bits[i].mask) {
> +				pr_cont("|%s", fsynr0_bits[i].name);
> +			}
> +		}
> +
> +		pr_cont("|PLVL=%u), cbfrsynra=0x%x, cb=%d\n",
> +			fsynr & 0x3,   /* FSYNR0.PLV */
> +			cbfrsynra, idx);
> +
> +	}
>   
>   	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
>   	return IRQ_HANDLED;
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 836ed6799a80..3b051273718b 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -223,6 +223,11 @@ enum arm_smmu_cbar_type {
>   
>   #define ARM_SMMU_CB_FSYNR0		0x68
>   #define ARM_SMMU_FSYNR0_WNR		BIT(4)
> +#define ARM_SMMU_FSYNR0_PNU		BIT(5)
> +#define ARM_SMMU_FSYNR0_IND		BIT(6)
> +#define ARM_SMMU_FSYNR0_NSATTR		BIT(8)
> +#define ARM_SMMU_FSYNR0_PTWF		BIT(10)
> +#define ARM_SMMU_FSYNR0_AFR		BIT(11)
>   
>   #define ARM_SMMU_CB_FSYNR1		0x6c
>   

