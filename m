Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 777F728E376
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 17:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728285AbgJNPoC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 11:44:02 -0400
Received: from foss.arm.com ([217.140.110.172]:51940 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726954AbgJNPoC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 11:44:02 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AF31D6E;
        Wed, 14 Oct 2020 08:44:01 -0700 (PDT)
Received: from [10.57.48.76] (unknown [10.57.48.76])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D4633F71F;
        Wed, 14 Oct 2020 08:43:59 -0700 (PDT)
Subject: Re: [PATCH 2/8] iommu/arm-smmu-qcom: Add QC SMMUv2 VA Size quirk for
 SDM660
To:     kholk11@gmail.com, will@kernel.org
Cc:     joro@8bytes.org, bjorn.andersson@linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200926130004.13528-1-kholk11@gmail.com>
 <20200926130004.13528-3-kholk11@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <466419ba-99e5-8ad6-ed0a-76e5afd44e7b@arm.com>
Date:   Wed, 14 Oct 2020 16:43:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20200926130004.13528-3-kholk11@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-26 13:59, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Some IOMMUs are getting set-up for Shared Virtual Address, but:
> 1. They are secured by the Hypervisor, so any configuration
>     change will generate a hyp-fault and crash the system
> 2. This 39-bits Virtual Address size deviates from the ARM
>     System MMU Architecture specification for SMMUv2, hence

This is a little confusing, since it reads like the 39-bit VA 
configuration is itself non-architectural, which it obviously isn't.

>     it is non-standard. In this case, the only way to keep the
>     IOMMU as the firmware did configure it, is to hardcode a
>     maximum VA size of 39 bits (because of point 1).

The *only* way to preserve an existing configuration is to make a 
hard-coded assumption about what it probably is? Really? Not, say, 
actually reading back the currently-configured value? :/

> This gives the need to add implementation details bits for
> at least some of the SoCs having this kind of configuration,
> which are at least SDM630, SDM636 and SDM660.
> 
> These implementation details will be enabled on finding the
> qcom,sdm660-smmu-v2 compatible.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-impl.c |  3 ++-
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 31 +++++++++++++++++++++-
>   2 files changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> index f4ff124a1967..9d753f8af2cc 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> @@ -216,7 +216,8 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>   	if (of_device_is_compatible(np, "nvidia,tegra194-smmu"))
>   		return nvidia_smmu_impl_init(smmu);
>   
> -	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500") ||
> +	if (of_device_is_compatible(np, "qcom,sdm660-smmu-v2") ||
> +	    of_device_is_compatible(np, "qcom,sdm845-smmu-500") ||
>   	    of_device_is_compatible(np, "qcom,sc7180-smmu-500") ||
>   	    of_device_is_compatible(np, "qcom,sm8150-smmu-500") ||
>   	    of_device_is_compatible(np, "qcom,sm8250-smmu-500"))
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 7859fd0db22a..f5bbfe86ef30 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -65,8 +65,33 @@ static const struct arm_smmu_impl qcom_smmu500_impl = {
>   	.reset = qcom_smmu500_reset,
>   };
>   
> +static int qcom_smmuv2_cfg_probe(struct arm_smmu_device *smmu)
> +{
> +	/*
> +	 * Some IOMMUs are getting set-up for Shared Virtual Address, but:
> +	 * 1. They are secured by the Hypervisor, so any configuration
> +	 *    change will generate a hyp-fault and crash the system
> +	 * 2. This 39-bits Virtual Address size deviates from the ARM
> +	 *    System MMU Architecture specification for SMMUv2, hence
> +	 *    it is non-standard. In this case, the only way to keep the
> +	 *    IOMMU as the firmware did configure it, is to hardcode a
> +	 *    maximum VA size of 39 bits (because of point 1).
> +	 */

What's the actual UBS value reported? If it's 40 then arguably the main 
driver could be cleverer and use 39 bits for stage 1 domains anyway to 
save a level of pagetable. However...

I'm concerned that "any configuration change" and "maximum" don't appear 
to add up. What if we decided we want to use short-descriptor format (or 
just pick a 32-bit VA size for other reasons)? That's happily less than 
39 bits, but would still represent a change *from* 39 bits, so would it 
also kill the system? IIRC Jordan's split pagetable support will end up 
configuring contexts with TxSZ based on va_bits / 2, so now 38 bits - is 
that going to work?

If you need to impose specific restrictions on context bank format, just 
bodging va_bits isn't going to cut it. You'd need to adjust the domain 
and pagetable configuration directly in ->init_context() in very much 
the same way as the split pagetable support itself does.

That said, I still hold the opinion that if you can't reprogram the 
context banks then this is qcom-iommu territory, not arm-smmu.

Robin.

> +	if (smmu->va_size > 39UL)
> +		dev_notice(smmu->dev,
> +			   "\tenabling workaround for QCOM SMMUv2 VA size\n");
> +	smmu->va_size = min(smmu->va_size, 39UL);
> +
> +	return 0;
> +}
> +
> +static const struct arm_smmu_impl qcom_smmuv2_impl = {
> +	.cfg_probe = qcom_smmuv2_cfg_probe,
> +};
> +
>   struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
>   {
> +	const struct device_node *np = smmu->dev->of_node;
>   	struct qcom_smmu *qsmmu;
>   
>   	qsmmu = devm_kzalloc(smmu->dev, sizeof(*qsmmu), GFP_KERNEL);
> @@ -75,7 +100,11 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
>   
>   	qsmmu->smmu = *smmu;
>   
> -	qsmmu->smmu.impl = &qcom_smmu500_impl;
> +	if (of_device_is_compatible(np, "qcom,sdm660-smmu-v2")) {
> +		qsmmu->smmu.impl = &qcom_smmuv2_impl;
> +	} else {
> +		qsmmu->smmu.impl = &qcom_smmu500_impl;
> +	}
>   	devm_kfree(smmu->dev, smmu);
>   
>   	return &qsmmu->smmu;
> 
