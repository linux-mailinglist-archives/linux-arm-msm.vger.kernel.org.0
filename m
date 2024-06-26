Return-Path: <linux-arm-msm+bounces-24357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE84F9198BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 22:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7860D1F22088
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 20:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BFEC192B7B;
	Wed, 26 Jun 2024 20:09:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54025192B62;
	Wed, 26 Jun 2024 20:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719432569; cv=none; b=BxtNy36u4BXQXx5GyF9qt/xFHhsDxr+EMWd8wRLFPX9aPtkumhz2+qJT9RzVvs0Ix6o2WN/0rgJFVypBiyV3jf24Sbp/uxyOS3UVztwGzdHm/93/6xlfDih0FKYL3mKgEEZ9A9OK20pjMvh2v8OnWXSQ0v4GgX35DT0BqkRVVXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719432569; c=relaxed/simple;
	bh=DAwndtMN6r1+ichMXqbeE2TVo0Yg6GPpGo80o296u0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kAg4SuowtoVDX4rtFvFxenfEWE/YQ7S3wLMJ6cx/YKXIRooXDn8bIAt+aGRa0faF5alG+pZktKshWmTOmmp5wGh+3yETDLDQTAADjQaGr1T70Lb76hHcFGLgGkaFrP1jqR3O20Y1iJFSWZGYTcOStgvbeBaw2r9RQCuiSnzuYZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74402339;
	Wed, 26 Jun 2024 13:09:49 -0700 (PDT)
Received: from [10.57.74.5] (unknown [10.57.74.5])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D35263F73B;
	Wed, 26 Jun 2024 13:09:21 -0700 (PDT)
Message-ID: <07c7426c-7d01-4160-a344-1857b738e9c4@arm.com>
Date: Wed, 26 Jun 2024 21:09:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/arm-smmu: Pretty-print context fault related
 regs
To: Rob Clark <robdclark@gmail.com>, iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Pranjal Shrivastava <praan@google.com>, Rob Clark <robdclark@chromium.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jerry Snitselaar <jsnitsel@redhat.com>,
 Rob Herring <robh@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Georgi Djakov <quic_c_gdjako@quicinc.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240626163842.205631-1-robdclark@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20240626163842.205631-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-26 5:38 pm, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Parse out the bitfields for easier-to-read fault messages.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> I kept with the dev_err, which matches qcom_smmu_context_fault.  It is
> only adding two extra lines, and it is ratelimited.
> 
> I also converted qcom_smmu_context_fault() to use the helpers to do the
> parsing, rather than more or less duplicating.
> 
>   .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  | 21 +++---
>   drivers/iommu/arm/arm-smmu/arm-smmu.c         | 70 ++++++++++++++++++-
>   drivers/iommu/arm/arm-smmu/arm-smmu.h         | 58 +++++++++------
>   3 files changed, 110 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> index 552199cbd9e2..ee7eab273e1a 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> @@ -429,22 +429,17 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
>   		phys_addr_t phys_atos = qcom_smmu_verify_fault(smmu_domain, iova, fsr);
>   
>   		if (__ratelimit(&_rs)) {
> +			char buf[80];
> +
>   			dev_err(smmu->dev,
>   				"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
>   				fsr, iova, fsynr, cbfrsynra, idx);
> -			dev_err(smmu->dev,
> -				"FSR    = %08x [%s%s%s%s%s%s%s%s%s], SID=0x%x\n",
> -				fsr,
> -				(fsr & 0x02) ? "TF " : "",
> -				(fsr & 0x04) ? "AFF " : "",
> -				(fsr & 0x08) ? "PF " : "",
> -				(fsr & 0x10) ? "EF " : "",
> -				(fsr & 0x20) ? "TLBMCF " : "",
> -				(fsr & 0x40) ? "TLBLKF " : "",
> -				(fsr & 0x80) ? "MHF " : "",
> -				(fsr & 0x40000000) ? "SS " : "",
> -				(fsr & 0x80000000) ? "MULTI " : "",
> -				cbfrsynra);
> +
> +			arm_smmu_parse_fsr(buf, fsr);
> +			dev_err(smmu->dev, "FSR: %s\n", buf);
> +
> +			arm_smmu_parse_fsynr0(buf, fsynr);
> +			dev_err(smmu->dev, "FSYNR0: %s\n", buf);
>   
>   			dev_err(smmu->dev,
>   				"soft iova-to-phys=%pa\n", &phys_soft);
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 87c81f75cf84..7f5ca75d5ebe 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -405,12 +405,67 @@ static const struct iommu_flush_ops arm_smmu_s2_tlb_ops_v1 = {
>   	.tlb_add_page	= arm_smmu_tlb_add_page_s2_v1,
>   };
>   
> +void arm_smmu_parse_fsr(char buf[80], u32 fsr)
> +{
> +	static const struct {
> +		u32 mask;
> +		const char *name;
> +	} fsr_bits[] = {
> +		{ ARM_SMMU_CB_FSR_MULTI,  "MULTI"  },
> +		{ ARM_SMMU_CB_FSR_SS,     "SS"     },
> +		{ ARM_SMMU_CB_FSR_UUT,    "UUT"    },
> +		{ ARM_SMMU_CB_FSR_ASF,    "ASF"    },
> +		{ ARM_SMMU_CB_FSR_TLBLKF, "TLBLKF" },
> +		{ ARM_SMMU_CB_FSR_TLBMCF, "TLBMCF" },
> +		{ ARM_SMMU_CB_FSR_EF,     "EF"     },
> +		{ ARM_SMMU_CB_FSR_PF,     "PF"     },
> +		{ ARM_SMMU_CB_FSR_AFF,    "AFF"    },
> +		{ ARM_SMMU_CB_FSR_TF,     "TF"     },
> +	};
> +	char *p = buf;
> +
> +	p += sprintf(p, "FORMAT=%u",
> +		     (u32)FIELD_GET(ARM_SMMU_CB_FSR_FORMAT, fsr));
> +
> +	for (int i = 0; i < ARRAY_SIZE(fsr_bits); i++)
> +		if (fsr & fsr_bits[i].mask)

I still much prefer the arm64 data_abort_decode() name=value style, or 
indeed even the qcom_smmu_context_fault() full/empty substring style - 
that's similarly easier to understand, doesn't need the awkward 
temporary buffer, and is still entirely capable of producing the same 
output as you're achieving here. The other good idea from there is 
repeating the raw register value in the same line, that way the decode 
is entirely unambiguous at a glance, and trivial to correlate with the 
full fault data from the first line even when interleaved and without 
CONFIG_PRINTK_CALLER.

> +			p += sprintf(p, "|%s", fsr_bits[i].name);

Furthermore, IM|NT|ENTRLY|CNVNCD|THS|IS|SO|EZ|TO|RD

Spaces, man. Spaces are good. If the aim is to be readable, the 
capital-letter-salad involved here needs all the help it can get :)

> +}
> +
> +void arm_smmu_parse_fsynr0(char buf[80], u32 fsynr)
> +{
> +	static const struct {
> +		u32 mask;
> +		const char *name;
> +	} fsynr0_bits[] = {
> +		{ ARM_SMMU_CB_FSYNR0_WNR,    "WNR"    },
> +		{ ARM_SMMU_CB_FSYNR0_PNU,    "PNU"    },
> +		{ ARM_SMMU_CB_FSYNR0_IND,    "IND"    },
> +		{ ARM_SMMU_CB_FSYNR0_NSATTR, "NSATTR" },
> +		{ ARM_SMMU_CB_FSYNR0_PTWF,   "PTWF"   },
> +		{ ARM_SMMU_CB_FSYNR0_AFR,    "AFR"    },
> +	};
> +	char *p = buf;
> +
> +	p += sprintf(p, "S1CBNDX=%u",
> +		     (u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_S1CBNDX, fsynr));
> +
> +	for (int i = 0; i < ARRAY_SIZE(fsynr0_bits); i++)
> +		if (fsynr & fsynr0_bits[i].mask)
> +			p += sprintf(p, "|%s", fsynr0_bits[i].name);
> +
> +	p += sprintf(p, "|PLVL=%u",
> +		     (u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_PLVL, fsynr));
> +}
> +
>   static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>   {
>   	u32 fsr, fsynr, cbfrsynra;
>   	unsigned long iova;
>   	struct arm_smmu_domain *smmu_domain = dev;
>   	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
> +				      DEFAULT_RATELIMIT_BURST);
>   	int idx = smmu_domain->cfg.cbndx;
>   	int ret;
>   
> @@ -423,13 +478,22 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>   	cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
>   
>   	ret = report_iommu_fault(&smmu_domain->domain, NULL, iova,
> -		fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> +		fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> +
> +	if (ret == -ENOSYS && __ratelimit(&rs)) {
> +		char buf[80];
>   
> -	if (ret == -ENOSYS)
> -		dev_err_ratelimited(smmu->dev,
> +		dev_err(smmu->dev,
>   		"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
>   			    fsr, iova, fsynr, cbfrsynra, idx);
>   
> +		arm_smmu_parse_fsr(buf, fsr);
> +		dev_err(smmu->dev, "FSR: %s\n", buf);
> +
> +		arm_smmu_parse_fsynr0(buf, fsynr);
> +		dev_err(smmu->dev, "FSYNR0: %s\n", buf);
> +	}
> +
>   	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
>   	return IRQ_HANDLED;
>   }
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 4765c6945c34..763ea52fca64 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -196,34 +196,46 @@ enum arm_smmu_cbar_type {
>   #define ARM_SMMU_CB_PAR_F		BIT(0)
>   
>   #define ARM_SMMU_CB_FSR			0x58
> -#define ARM_SMMU_FSR_MULTI		BIT(31)
> -#define ARM_SMMU_FSR_SS			BIT(30)
> -#define ARM_SMMU_FSR_UUT		BIT(8)
> -#define ARM_SMMU_FSR_ASF		BIT(7)
> -#define ARM_SMMU_FSR_TLBLKF		BIT(6)
> -#define ARM_SMMU_FSR_TLBMCF		BIT(5)
> -#define ARM_SMMU_FSR_EF			BIT(4)
> -#define ARM_SMMU_FSR_PF			BIT(3)
> -#define ARM_SMMU_FSR_AFF		BIT(2)
> -#define ARM_SMMU_FSR_TF			BIT(1)
> -
> -#define ARM_SMMU_FSR_IGN		(ARM_SMMU_FSR_AFF |		\
> -					 ARM_SMMU_FSR_ASF |		\
> -					 ARM_SMMU_FSR_TLBMCF |		\
> -					 ARM_SMMU_FSR_TLBLKF)
> -
> -#define ARM_SMMU_FSR_FAULT		(ARM_SMMU_FSR_MULTI |		\
> -					 ARM_SMMU_FSR_SS |		\
> -					 ARM_SMMU_FSR_UUT |		\
> -					 ARM_SMMU_FSR_EF |		\
> -					 ARM_SMMU_FSR_PF |		\
> -					 ARM_SMMU_FSR_TF |		\
> +#define ARM_SMMU_CB_FSR_MULTI		BIT(31)
> +#define ARM_SMMU_CB_FSR_SS		BIT(30)
> +#define ARM_SMMU_CB_FSR_FORMAT		GENMASK(10, 9)
> +#define ARM_SMMU_CB_FSR_UUT		BIT(8)
> +#define ARM_SMMU_CB_FSR_ASF		BIT(7)
> +#define ARM_SMMU_CB_FSR_TLBLKF		BIT(6)
> +#define ARM_SMMU_CB_FSR_TLBMCF		BIT(5)
> +#define ARM_SMMU_CB_FSR_EF		BIT(4)
> +#define ARM_SMMU_CB_FSR_PF		BIT(3)
> +#define ARM_SMMU_CB_FSR_AFF		BIT(2)
> +#define ARM_SMMU_CB_FSR_TF		BIT(1)
> +
> +void arm_smmu_parse_fsr(char buf[80], u32 fsr);
> +
> +#define ARM_SMMU_FSR_IGN		(ARM_SMMU_CB_FSR_AFF |		\
> +					 ARM_SMMU_CB_FSR_ASF |		\
> +					 ARM_SMMU_CB_FSR_TLBMCF |	\
> +					 ARM_SMMU_CB_FSR_TLBLKF)
> +
> +#define ARM_SMMU_FSR_FAULT		(ARM_SMMU_CB_FSR_MULTI |	\
> +					 ARM_SMMU_CB_FSR_SS |		\
> +					 ARM_SMMU_CB_FSR_UUT |		\
> +					 ARM_SMMU_CB_FSR_EF |		\
> +					 ARM_SMMU_CB_FSR_PF |		\
> +					 ARM_SMMU_CB_FSR_TF |		\
>   					 ARM_SMMU_FSR_IGN)
>   
>   #define ARM_SMMU_CB_FAR			0x60
>   
>   #define ARM_SMMU_CB_FSYNR0		0x68
> -#define ARM_SMMU_FSYNR0_WNR		BIT(4)
> +#define ARM_SMMU_CB_FSYNR0_PLVL		GENMASK(1, 0)
> +#define ARM_SMMU_CB_FSYNR0_WNR		BIT(4)
> +#define ARM_SMMU_CB_FSYNR0_PNU		BIT(5)
> +#define ARM_SMMU_CB_FSYNR0_IND		BIT(6)
> +#define ARM_SMMU_CB_FSYNR0_NSATTR	BIT(8)
> +#define ARM_SMMU_CB_FSYNR0_PTWF		BIT(10)
> +#define ARM_SMMU_CB_FSYNR0_AFR		BIT(11)
> +#define ARM_SMMU_CB_FSYNR0_S1CBNDX	GENMASK(23, 16)

Nit: MSB-to-LSB order like all the other register fields, please.

Thanks,
Robin.

> +
> +void arm_smmu_parse_fsynr0(char buf[80], u32 fsynr);
>   
>   #define ARM_SMMU_CB_FSYNR1		0x6c
>   

