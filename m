Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3716B26668B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 19:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgIKR3g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 13:29:36 -0400
Received: from foss.arm.com ([217.140.110.172]:40348 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726504AbgIKR3d (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 13:29:33 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F213E106F;
        Fri, 11 Sep 2020 10:29:32 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E66493F68F;
        Fri, 11 Sep 2020 10:29:27 -0700 (PDT)
Subject: Re: [PATCH v3 8/8] iommu/arm-smmu-qcom: Setup identity domain for
 boot mappings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Cc:     Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
 <20200904155513.282067-9-bjorn.andersson@linaro.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <34b1f9ea-fb16-faac-c288-627b51066968@arm.com>
Date:   Fri, 11 Sep 2020 18:29:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200904155513.282067-9-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-04 16:55, Bjorn Andersson wrote:
> With many Qualcomm platforms not having functional S2CR BYPASS a
> temporary IOMMU domain, without translation, needs to be allocated in
> order to allow these memory transactions.
> 
> Unfortunately the boot loader uses the first few context banks, so
> rather than overwriting a active bank the last context bank is used and
> streams are diverted here during initialization.
> 
> This also performs the readback of SMR registers for the Qualcomm
> platform, to trigger the mechanism.
> 
> This is based on prior work by Thierry Reding and Laurentiu Tudor.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - Combined from pieces spread between the Qualcomm impl and generic code in v2.
> - Moved to use the newly introduced inherit_mapping op.
> 
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 ++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 70a1eaa52e14..a54302190932 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -12,6 +12,7 @@
>   struct qcom_smmu {
>   	struct arm_smmu_device smmu;
>   	bool bypass_broken;
> +	struct iommu_domain *identity;
>   };
>   
>   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
> @@ -228,6 +229,37 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
>   	return 0;
>   }
>   
> +static int qcom_smmu_inherit_mappings(struct arm_smmu_device *smmu)
> +{
> +	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
> +	int cbndx;
> +	u32 smr;
> +	int i;
> +
> +	qsmmu->identity = arm_smmu_alloc_identity_domain(smmu);
> +	if (IS_ERR(qsmmu->identity))
> +		return PTR_ERR(qsmmu->identity);
> +
> +	cbndx = to_smmu_domain(qsmmu->identity)->cfg.cbndx;

I don't really get the point of going through the dance of allocating a 
whole iommu_domain() just to get a context. If you don't want to simply 
statically reserve a context at probe time, then just allocate from 
smmu->context_map here (where AFAICS "here" should be in cfg_probe 
anyway). This is entirely driver-internal, so there shouldn't be any 
need for IOMMU-API-level stuff to be involved.

Robin.

> +
> +	for (i = 0; i < smmu->num_mapping_groups; i++) {
> +		smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));
> +
> +		if (FIELD_GET(ARM_SMMU_SMR_VALID, smr)) {
> +			smmu->smrs[i].id = FIELD_GET(ARM_SMMU_SMR_ID, smr);
> +			smmu->smrs[i].mask = FIELD_GET(ARM_SMMU_SMR_MASK, smr);
> +			smmu->smrs[i].valid = true;
> +
> +			smmu->s2crs[i].type = S2CR_TYPE_TRANS;
> +			smmu->s2crs[i].privcfg = S2CR_PRIVCFG_DEFAULT;
> +			smmu->s2crs[i].cbndx = cbndx;
> +			smmu->s2crs[i].count++;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static int qcom_smmu_def_domain_type(struct device *dev)
>   {
>   	const struct of_device_id *match =
> @@ -270,6 +302,7 @@ static const struct arm_smmu_impl qcom_smmu_impl = {
>   	.cfg_probe = qcom_smmu_cfg_probe,
>   	.def_domain_type = qcom_smmu_def_domain_type,
>   	.reset = qcom_smmu500_reset,
> +	.inherit_mappings = qcom_smmu_inherit_mappings,
>   };
>   
>   static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
> 
