Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63019256E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 19:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728500AbfEURni (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 13:43:38 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:39488 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728053AbfEURni (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 13:43:38 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABB9B80D;
        Tue, 21 May 2019 10:43:37 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D20C3F718;
        Tue, 21 May 2019 10:43:35 -0700 (PDT)
Subject: Re: [PATCH v2 01/15] iommu/arm-smmu: Allow IOMMU enabled devices to
 skip DMA domains
To:     Jordan Crouse <jcrouse@codeaurora.org>,
        freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        hoegsberg@google.com, dianders@chromium.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Will Deacon <will.deacon@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org
References: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
 <1558455243-32746-2-git-send-email-jcrouse@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <6c5898e5-4b14-b77b-15b7-e926233c07d0@arm.com>
Date:   Tue, 21 May 2019 18:43:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1558455243-32746-2-git-send-email-jcrouse@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/05/2019 17:13, Jordan Crouse wrote:
> Allow IOMMU enabled devices specified on an opt-in list to create a
> default identity domain for a new IOMMU group and bypass the DMA
> domain created by the IOMMU core. This allows the group to be properly
> set up but otherwise skips touching the hardware until the client
> device attaches a unmanaged domain of its own.

All the cool kids are using iommu_request_dm_for_dev() to force an 
identity domain for particular devices, won't that suffice for this case 
too? There is definite scope for improvement in this area, so I'd really 
like to keep things as consistent as possible to make that easier in future.

Robin.

> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>   drivers/iommu/arm-smmu.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>   drivers/iommu/iommu.c    | 29 +++++++++++++++++++++++------
>   include/linux/iommu.h    |  3 +++
>   3 files changed, 68 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 5e54cc0..a795ada 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -1235,6 +1235,35 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
>   	return 0;
>   }
>   
> +struct arm_smmu_client_match_data {
> +	bool use_identity_domain;
> +};
> +
> +static const struct arm_smmu_client_match_data qcom_adreno = {
> +	.use_identity_domain = true,
> +};
> +
> +static const struct arm_smmu_client_match_data qcom_mdss = {
> +	.use_identity_domain = true,
> +};
> +
> +static const struct of_device_id arm_smmu_client_of_match[] = {
> +	{ .compatible = "qcom,adreno", .data = &qcom_adreno },
> +	{ .compatible = "qcom,mdp4", .data = &qcom_mdss },
> +	{ .compatible = "qcom,mdss", .data = &qcom_mdss },
> +	{ .compatible = "qcom,sdm845-mdss", .data = &qcom_mdss },
> +	{},
> +};
> +
> +static const struct arm_smmu_client_match_data *
> +arm_smmu_client_data(struct device *dev)
> +{
> +	const struct of_device_id *match =
> +		of_match_device(arm_smmu_client_of_match, dev);
> +
> +	return match ? match->data : NULL;
> +}
> +
>   static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>   {
>   	int ret;
> @@ -1552,6 +1581,7 @@ static struct iommu_group *arm_smmu_device_group(struct device *dev)
>   {
>   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>   	struct arm_smmu_device *smmu = fwspec_smmu(fwspec);
> +	const struct arm_smmu_client_match_data *client;
>   	struct iommu_group *group = NULL;
>   	int i, idx;
>   
> @@ -1573,6 +1603,18 @@ static struct iommu_group *arm_smmu_device_group(struct device *dev)
>   	else
>   		group = generic_device_group(dev);
>   
> +	client = arm_smmu_client_data(dev);
> +
> +	/*
> +	 * If the client chooses to bypass the dma domain, create a identity
> +	 * domain as a default placeholder. This will give the device a
> +	 * default domain but skip DMA operations and not consume a context
> +	 * bank
> +	 */
> +	if (client && client->no_dma_domain)
> +		iommu_group_set_default_domain(group, dev,
> +			IOMMU_DOMAIN_IDENTITY);
> +
>   	return group;
>   }
>   
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 67ee662..af3e1ed 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1062,6 +1062,24 @@ struct iommu_group *fsl_mc_device_group(struct device *dev)
>   	return group;
>   }
>   
> +struct iommu_domain *iommu_group_set_default_domain(struct iommu_group *group,
> +		struct device *dev, unsigned int type)
> +{
> +	struct iommu_domain *dom;
> +
> +	dom = __iommu_domain_alloc(dev->bus, type);
> +	if (!dom)
> +		return NULL;
> +
> +	/* FIXME: Error if the default domain is already set? */
> +	group->default_domain = dom;
> +	if (!group->domain)
> +		group->domain = dom;
> +
> +	return dom;
> +}
> +EXPORT_SYMBOL_GPL(iommu_group_set_default_domain);
> +
>   /**
>    * iommu_group_get_for_dev - Find or create the IOMMU group for a device
>    * @dev: target device
> @@ -1099,9 +1117,12 @@ struct iommu_group *iommu_group_get_for_dev(struct device *dev)
>   	if (!group->default_domain) {
>   		struct iommu_domain *dom;
>   
> -		dom = __iommu_domain_alloc(dev->bus, iommu_def_domain_type);
> +		dom = iommu_group_set_default_domain(group, dev,
> +			iommu_def_domain_type);
> +
>   		if (!dom && iommu_def_domain_type != IOMMU_DOMAIN_DMA) {
> -			dom = __iommu_domain_alloc(dev->bus, IOMMU_DOMAIN_DMA);
> +			dom = iommu_group_set_default_domain(group, dev,
> +				IOMMU_DOMAIN_DMA);
>   			if (dom) {
>   				dev_warn(dev,
>   					 "failed to allocate default IOMMU domain of type %u; falling back to IOMMU_DOMAIN_DMA",
> @@ -1109,10 +1130,6 @@ struct iommu_group *iommu_group_get_for_dev(struct device *dev)
>   			}
>   		}
>   
> -		group->default_domain = dom;
> -		if (!group->domain)
> -			group->domain = dom;
> -
>   		if (dom && !iommu_dma_strict) {
>   			int attr = 1;
>   			iommu_domain_set_attr(dom,
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index a815cf6..4ef8bd5 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -394,6 +394,9 @@ extern int iommu_group_id(struct iommu_group *group);
>   extern struct iommu_group *iommu_group_get_for_dev(struct device *dev);
>   extern struct iommu_domain *iommu_group_default_domain(struct iommu_group *);
>   
> +struct iommu_domain *iommu_group_set_default_domain(struct iommu_group *group,
> +		struct device *dev, unsigned int type);
> +
>   extern int iommu_domain_get_attr(struct iommu_domain *domain, enum iommu_attr,
>   				 void *data);
>   extern int iommu_domain_set_attr(struct iommu_domain *domain, enum iommu_attr,
> 
