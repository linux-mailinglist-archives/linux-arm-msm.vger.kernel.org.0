Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C4B1AC2D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 15:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895845AbgDPNdt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 09:33:49 -0400
Received: from foss.arm.com ([217.140.110.172]:60900 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896755AbgDPNdo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 09:33:44 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 544F11FB;
        Thu, 16 Apr 2020 06:33:42 -0700 (PDT)
Received: from [10.57.59.184] (unknown [10.57.59.184])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 243AF3F68F;
        Thu, 16 Apr 2020 06:33:40 -0700 (PDT)
Subject: Re: [PATCH 1/2] iommu: arm-smmu-impl: Convert to a generic reset
 implementation
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>
References: <cover.1579692800.git.saiprakash.ranjan@codeaurora.org>
 <e7ba4dbd8e9c8aedd6f5db1b3453d9782b7943cd.1579692800.git.saiprakash.ranjan@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <cc3e3ed5-b187-c4a1-8229-974821a9e1ad@arm.com>
Date:   Thu, 16 Apr 2020 14:33:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e7ba4dbd8e9c8aedd6f5db1b3453d9782b7943cd.1579692800.git.saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-01-22 11:48 am, Sai Prakash Ranjan wrote:
> Currently the QCOM specific smmu reset implementation is very
> specific to SDM845 SoC and has a wait-for-safe logic which
> may not be required for other SoCs. So move the SDM845 specific
> logic to its specific reset function. Also add SC7180 SMMU
> compatible for calling into QCOM specific implementation.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>   drivers/iommu/arm-smmu-impl.c |  8 +++++---
>   drivers/iommu/arm-smmu-qcom.c | 16 +++++++++++++---
>   2 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
> index 74d97a886e93..c75b9d957b70 100644
> --- a/drivers/iommu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm-smmu-impl.c
> @@ -150,6 +150,8 @@ static const struct arm_smmu_impl arm_mmu500_impl = {
>   
>   struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>   {
> +	const struct device_node *np = smmu->dev->of_node;
> +
>   	/*
>   	 * We will inevitably have to combine model-specific implementation
>   	 * quirks with platform-specific integration quirks, but everything
> @@ -166,11 +168,11 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>   		break;
>   	}
>   
> -	if (of_property_read_bool(smmu->dev->of_node,
> -				  "calxeda,smmu-secure-config-access"))
> +	if (of_property_read_bool(np, "calxeda,smmu-secure-config-access"))
>   		smmu->impl = &calxeda_impl;
>   
> -	if (of_device_is_compatible(smmu->dev->of_node, "qcom,sdm845-smmu-500"))
> +	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500") ||
> +	    of_device_is_compatible(np, "qcom,sc7180-smmu-500"))
>   		return qcom_smmu_impl_init(smmu);
>   
>   	return smmu;
> diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
> index 24c071c1d8b0..64a4ab270ab7 100644
> --- a/drivers/iommu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm-smmu-qcom.c
> @@ -15,8 +15,6 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>   {
>   	int ret;
>   
> -	arm_mmu500_reset(smmu);
> -
>   	/*
>   	 * To address performance degradation in non-real time clients,
>   	 * such as USB and UFS, turn off wait-for-safe on sdm845 based boards,
> @@ -30,8 +28,20 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>   	return ret;
>   }
>   
> +static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
> +{
> +	const struct device_node *np = smmu->dev->of_node;
> +
> +	arm_mmu500_reset(smmu);
> +
> +	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500"))
> +		return qcom_sdm845_smmu500_reset(smmu);
> +
> +	return 0;
> +}
> +
>   static const struct arm_smmu_impl qcom_smmu_impl = {
> -	.reset = qcom_sdm845_smmu500_reset,
> +	.reset = qcom_smmu500_reset,
>   };

It might be logical to have a separate SDM845 impl rather than 
indirecting within the callback itself, but I'm not too concerned either 
way. For the arm-smmu-impl.c changes,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Thanks,
Robin.

>   
>   struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
> 
