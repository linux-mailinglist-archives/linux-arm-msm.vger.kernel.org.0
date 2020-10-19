Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56FD8292DC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 20:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730916AbgJSSuN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 14:50:13 -0400
Received: from foss.arm.com ([217.140.110.172]:35710 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727681AbgJSSuM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 14:50:12 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1124A30E;
        Mon, 19 Oct 2020 11:50:12 -0700 (PDT)
Received: from [10.57.19.34] (unknown [10.57.19.34])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF4A83F719;
        Mon, 19 Oct 2020 11:50:09 -0700 (PDT)
Subject: Re: [PATCH v5 2/3] iommu/arm-smmu-qcom: Read back stream mappings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Thierry Reding <treding@nvidia.com>,
        Rob Clark <robdclark@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20201019182323.3162386-1-bjorn.andersson@linaro.org>
 <20201019182323.3162386-3-bjorn.andersson@linaro.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <2bde9a4d-25bc-0ac7-d6e4-762667cc4fd2@arm.com>
Date:   Mon, 19 Oct 2020 19:50:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201019182323.3162386-3-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-19 19:23, Bjorn Andersson wrote:
> The Qualcomm boot loader configures stream mapping for the peripherals
> that it accesses and in particular it sets up the stream mapping for the
> display controller to be allowed to scan out a splash screen or EFI
> framebuffer.
> 
> Read back the stream mappings during initialization and make the
> arm-smmu driver maintain the streams in bypass mode.

Acked-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v4:
> - Don't increment s2cr[i]->count, as this is not actually needed to survive
>    probe deferral
> 
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 23 ++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index be4318044f96..48627fcf6bed 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -23,6 +23,28 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>   	{ }
>   };
>   
> +static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
> +{
> +	u32 smr;
> +	int i;
> +
> +	for (i = 0; i < smmu->num_mapping_groups; i++) {
> +		smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));
> +
> +		if (FIELD_GET(ARM_SMMU_SMR_VALID, smr)) {
> +			smmu->smrs[i].id = FIELD_GET(ARM_SMMU_SMR_ID, smr);
> +			smmu->smrs[i].mask = FIELD_GET(ARM_SMMU_SMR_MASK, smr);
> +			smmu->smrs[i].valid = true;
> +
> +			smmu->s2crs[i].type = S2CR_TYPE_BYPASS;
> +			smmu->s2crs[i].privcfg = S2CR_PRIVCFG_DEFAULT;
> +			smmu->s2crs[i].cbndx = 0xff;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static int qcom_smmu_def_domain_type(struct device *dev)
>   {
>   	const struct of_device_id *match =
> @@ -61,6 +83,7 @@ static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
>   }
>   
>   static const struct arm_smmu_impl qcom_smmu_impl = {
> +	.cfg_probe = qcom_smmu_cfg_probe,
>   	.def_domain_type = qcom_smmu_def_domain_type,
>   	.reset = qcom_smmu500_reset,
>   };
> 
