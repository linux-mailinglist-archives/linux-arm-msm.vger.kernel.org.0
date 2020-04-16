Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB27F1AC45E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 15:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409379AbgDPN6g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 09:58:36 -0400
Received: from foss.arm.com ([217.140.110.172]:33168 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409360AbgDPN6b (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 09:58:31 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95ABD1FB;
        Thu, 16 Apr 2020 06:58:30 -0700 (PDT)
Received: from [10.57.59.184] (unknown [10.57.59.184])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4786A3F237;
        Thu, 16 Apr 2020 06:58:27 -0700 (PDT)
Subject: Re: [PATCH 2/2] iommu/arm-smmu: Allow client devices to select direct
 mapping
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
 <813cc5b2da10c27db982254b274bf26008a9e6da.1579692800.git.saiprakash.ranjan@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <3f12cefb-3887-859c-ddf5-c7a0fc755152@arm.com>
Date:   Thu, 16 Apr 2020 14:58:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <813cc5b2da10c27db982254b274bf26008a9e6da.1579692800.git.saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-01-22 11:48 am, Sai Prakash Ranjan wrote:
> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Some client devices want to directly map the IOMMU themselves instead
> of using the DMA domain. Allow those devices to opt in to direct
> mapping by way of a list of compatible strings.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Co-developed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>   drivers/iommu/arm-smmu-qcom.c | 39 +++++++++++++++++++++++++++++++++++
>   drivers/iommu/arm-smmu.c      |  3 +++
>   drivers/iommu/arm-smmu.h      |  5 +++++
>   3 files changed, 47 insertions(+)
> 
> diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
> index 64a4ab270ab7..ff746acd1c81 100644
> --- a/drivers/iommu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm-smmu-qcom.c
> @@ -3,6 +3,7 @@
>    * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>    */
>   
> +#include <linux/of_device.h>
>   #include <linux/qcom_scm.h>
>   
>   #include "arm-smmu.h"
> @@ -11,6 +12,43 @@ struct qcom_smmu {
>   	struct arm_smmu_device smmu;
>   };
>   
> +static const struct arm_smmu_client_match_data qcom_adreno = {
> +	.direct_mapping = true,
> +};
> +
> +static const struct arm_smmu_client_match_data qcom_mdss = {
> +	.direct_mapping = true,
> +};

Might it make sense to group these by the desired SMMU behaviour rather 
than (apparently) what kind of device the client happens to be, which 
seems like a completely arbitrary distinction from the SMMU driver's PoV?

> +
> +static const struct of_device_id qcom_smmu_client_of_match[] = {
> +	{ .compatible = "qcom,adreno", .data = &qcom_adreno },
> +	{ .compatible = "qcom,mdp4", .data = &qcom_mdss },
> +	{ .compatible = "qcom,mdss", .data = &qcom_mdss },
> +	{ .compatible = "qcom,sc7180-mdss", .data = &qcom_mdss },
> +	{ .compatible = "qcom,sdm845-mdss", .data = &qcom_mdss },
> +	{},
> +};
> +
> +static const struct arm_smmu_client_match_data *
> +qcom_smmu_client_data(struct device *dev)
> +{
> +	const struct of_device_id *match =
> +		of_match_device(qcom_smmu_client_of_match, dev);
> +
> +	return match ? match->data : NULL;

of_device_get_match_data() is your friend.

> +}
> +
> +static int qcom_smmu_request_domain(struct device *dev)
> +{
> +	const struct arm_smmu_client_match_data *client;
> +
> +	client = qcom_smmu_client_data(dev);
> +	if (client)
> +		iommu_request_dm_for_dev(dev);
> +
> +	return 0;
> +}
> +
>   static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>   {
>   	int ret;
> @@ -41,6 +79,7 @@ static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
>   }
>   
>   static const struct arm_smmu_impl qcom_smmu_impl = {
> +	.req_domain = qcom_smmu_request_domain,
>   	.reset = qcom_smmu500_reset,
>   };
>   
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 16c4b87af42b..67dd9326247a 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -1448,6 +1448,9 @@ static int arm_smmu_add_device(struct device *dev)
>   	device_link_add(dev, smmu->dev,
>   			DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_SUPPLIER);
>   
> +	if (smmu->impl && smmu->impl->req_domain)
> +		return smmu->impl->req_domain(dev);
> +

There are about 5 different patchsets flying around at the moment that 
all touch default domain allocation, so this is a fast-moving target, 
but I think where the dust should settle is with arm_smmu_ops forwarding 
.def_domain_type (or whatever it ends up as) calls to arm_smmu_impl as 
appropriate.

>   	return 0;
>   
>   out_cfg_free:
> diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> index 8d1cd54d82a6..059dc9c39f64 100644
> --- a/drivers/iommu/arm-smmu.h
> +++ b/drivers/iommu/arm-smmu.h
> @@ -244,6 +244,10 @@ enum arm_smmu_arch_version {
>   	ARM_SMMU_V2,
>   };
>   
> +struct arm_smmu_client_match_data {
> +	bool direct_mapping;
> +};

Does this need to be public? I don't see the other users...

Robin.

> +
>   enum arm_smmu_implementation {
>   	GENERIC_SMMU,
>   	ARM_MMU500,
> @@ -386,6 +390,7 @@ struct arm_smmu_impl {
>   	int (*init_context)(struct arm_smmu_domain *smmu_domain);
>   	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
>   			 int status);
> +	int (*req_domain)(struct device *dev);
>   };
>   
>   static inline void __iomem *arm_smmu_page(struct arm_smmu_device *smmu, int n)
> 
