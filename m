Return-Path: <linux-arm-msm+bounces-36310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 627C99B4AEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 14:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85C381C226C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 13:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343B8205E1C;
	Tue, 29 Oct 2024 13:29:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC143BA2D;
	Tue, 29 Oct 2024 13:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730208582; cv=none; b=aKPE0Eo4zIWYVtAf61n6nh3AbMLHJuO2XNJIE1RxvDyS+4bkxnX1wkEncFsfWHoUIXBN11sfGgz/9O8yV7UoYw3e6x8ZL4f8YZ95TXZfWFMH8SgB2xfqbtNFWUaahMT9N5EP/wBULprQgm9NQcJ9B2V+FI15VSR5MkCC2VsZno4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730208582; c=relaxed/simple;
	bh=2awKTLzz8M7vo7Lqed+B7tlCtsgLkR0n6t8D5tFjYn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cEAL7Bx+Yja+eUYV9o8JxsErQPrO5HO9e16EHmYp+fyyawtyM60Dc80iNOO6EdMRcWvB7K+myV6XpeG9+Xp5sWcX9NmVfWE2pgr7LZ5KZs5k3Lx2bKnUbxDYK5lOnX/cXCbXKnGOk26HQwtKlU8bqd/LoLoXhOPgIC7M7fqK2A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0AA3113E;
	Tue, 29 Oct 2024 06:30:07 -0700 (PDT)
Received: from [10.57.89.81] (unknown [10.57.89.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1430F3F528;
	Tue, 29 Oct 2024 06:29:35 -0700 (PDT)
Message-ID: <2d651f1b-4f51-4984-903f-7f5a14151f84@arm.com>
Date: Tue, 29 Oct 2024 13:29:35 +0000
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
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241008125410.3422512-4-quic_bibekkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-10-08 1:54 pm, Bibek Kumar Patro wrote:
> Add an adreno-smmu-priv interface for drm/msm to call
> into arm-smmu-qcom and initiate the PRR bit setup or reset
> sequence as per request.
> 
> This will be used by GPU to setup the PRR bit and related
> configuration registers through adreno-smmu private
> interface instead of directly poking the smmu hardware.
> 
> Suggested-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 ++++++++++++++++++++++
>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>   include/linux/adreno-smmu-priv.h           | 10 +++++-
>   3 files changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 6e0a2a43e45a..38ac9cab763b 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -25,6 +25,7 @@
> 
>   #define CPRE			(1 << 1)
>   #define CMTLB			(1 << 0)
> +#define GFX_ACTLR_PRR		(1 << 5)
> 
>   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>   {
> @@ -109,6 +110,40 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
>   	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
>   }
> 
> +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
> +{
> +	struct arm_smmu_domain *smmu_domain = (void *)cookie;
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +	const struct device_node *np = smmu->dev->of_node;
> +	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> +	u32 reg = 0;
> +
> +	if (of_device_is_compatible(np, "qcom,smmu-500") &&
> +			of_device_is_compatible(np, "qcom,adreno-smmu")) {

These conditions aren't going to change between calls - wouldn't it make 
more sense to conditionally assign the callbacks in the first place? Not 
the biggest deal if this is a one-off context-setup type thing, just 
that it looks a little funky.

Thanks,
Robin.

> +		reg =  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
> +		reg &= ~GFX_ACTLR_PRR;
> +		if (set)
> +			reg |= FIELD_PREP(GFX_ACTLR_PRR, 1);
> +		arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
> +	}
> +}
> +
> +static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_t page_addr)
> +{
> +	struct arm_smmu_domain *smmu_domain = (void *)cookie;
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +	const struct device_node *np = smmu->dev->of_node;
> +
> +	if (of_device_is_compatible(np, "qcom,smmu-500") &&
> +			of_device_is_compatible(np, "qcom,adreno-smmu")) {
> +		writel_relaxed(lower_32_bits(page_addr),
> +					smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
> +
> +		writel_relaxed(upper_32_bits(page_addr),
> +					smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
> +	}
> +}
> +
>   #define QCOM_ADRENO_SMMU_GPU_SID 0
> 
>   static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> @@ -249,6 +284,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>   	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
>   	priv->set_stall = qcom_adreno_smmu_set_stall;
>   	priv->resume_translation = qcom_adreno_smmu_resume_translation;
> +	priv->set_prr_bit = qcom_adreno_smmu_set_prr_bit;
> +	priv->set_prr_addr = qcom_adreno_smmu_set_prr_addr;
> 
>   	return 0;
>   }
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index e2aeb511ae90..2dbf3243b5ad 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
>   #define ARM_SMMU_SCTLR_M		BIT(0)
> 
>   #define ARM_SMMU_CB_ACTLR		0x4
> +#define ARM_SMMU_GFX_PRR_CFG_LADDR	0x6008
> +#define ARM_SMMU_GFX_PRR_CFG_UADDR	0x600C
> 
>   #define ARM_SMMU_CB_RESUME		0x8
>   #define ARM_SMMU_RESUME_TERMINATE	BIT(0)
> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
> index c637e0997f6d..03466eb16933 100644
> --- a/include/linux/adreno-smmu-priv.h
> +++ b/include/linux/adreno-smmu-priv.h
> @@ -49,7 +49,13 @@ struct adreno_smmu_fault_info {
>    *                 before set_ttbr0_cfg().  If stalling on fault is enabled,
>    *                 the GPU driver must call resume_translation()
>    * @resume_translation: Resume translation after a fault
> - *
> + * @set_prr_bit:   Extendible interface to be used by GPU to modify the
> + *		   ACTLR register bits, currently used to configure
> + *		   Partially-Resident-Region (PRR) bit for feature's
> + *		   setup and reset sequence as requested.
> + * @set_prr_addr:  Configure the PRR_CFG_*ADDR register with the
> + *		   physical address of PRR page passed from
> + *		   GPU driver.
>    *
>    * The GPU driver (drm/msm) and adreno-smmu work together for controlling
>    * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
> @@ -67,6 +73,8 @@ struct adreno_smmu_priv {
>       void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
>       void (*set_stall)(const void *cookie, bool enabled);
>       void (*resume_translation)(const void *cookie, bool terminate);
> +    void (*set_prr_bit)(const void *cookie, bool set);
> +    void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
>   };
> 
>   #endif /* __ADRENO_SMMU_PRIV_H */
> --
> 2.34.1
> 


