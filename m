Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1321B0FFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 17:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbgDTP02 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 11:26:28 -0400
Received: from foss.arm.com ([217.140.110.172]:51002 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726050AbgDTP02 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 11:26:28 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99BAD31B;
        Mon, 20 Apr 2020 08:26:27 -0700 (PDT)
Received: from [10.57.33.63] (unknown [10.57.33.63])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F9483F73D;
        Mon, 20 Apr 2020 08:26:25 -0700 (PDT)
Subject: Re: [PATCHv2 3/6] iommu/arm-smmu: Implement
 iommu_ops->def_domain_type call-back
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Evan Green <evgreen@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        iommu@lists.linux-foundation.org,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org
References: <cover.1587392905.git.saiprakash.ranjan@codeaurora.org>
 <558b1aee4c699a0a5b14b325178d22a79958488f.1587392905.git.saiprakash.ranjan@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <6dd26176-448a-985c-90fc-7c47088015ff@arm.com>
Date:   Mon, 20 Apr 2020 16:26:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <558b1aee4c699a0a5b14b325178d22a79958488f.1587392905.git.saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-04-20 3:37 pm, Sai Prakash Ranjan wrote:
> Implement the new def_domain_type call-back for the ARM
> SMMU driver. We need this to support requesting the domain
> type by the client devices.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>   drivers/iommu/arm-smmu.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index e622f4e33379..b5d1d52dfbb8 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -1609,6 +1609,25 @@ static void arm_smmu_get_resv_regions(struct device *dev,
>   	iommu_dma_get_resv_regions(dev, head);
>   }
>   
> +static int arm_smmu_def_domain_type(struct device *dev)
> +{
> +	struct iommu_fwspec *fwspec;
> +	struct arm_smmu_device *smmu;
> +
> +	fwspec = dev_iommu_fwspec_get(dev);
> +	if (!fwspec || fwspec->ops != &arm_smmu_ops)
> +		return -ENODEV;
> +
> +	smmu = arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
> +	if (!smmu)
> +		return -ENODEV;
> +

AFAICS this should only ever be called for a device in a group, which 
means an initial ->probe_device has succeeded and rather than 
defensively going the long way round, we can safely assume this:

	struct arm_smmu_master_cfg = dev_iommu_priv_get(dev);
	struct arm_smmu_impl *impl = cfg->smmu->impl;

	if (impl && impl->req_domain)
		return impl->req_domain(dev);

Or have I misunderstood the flow?

Robin.

> +	if (smmu->impl && smmu->impl->req_domain)
> +		return smmu->impl->req_domain(dev);
> +
> +	return 0;
> +}
> +
>   static struct iommu_ops arm_smmu_ops = {
>   	.capable		= arm_smmu_capable,
>   	.domain_alloc		= arm_smmu_domain_alloc,
> @@ -1627,6 +1646,7 @@ static struct iommu_ops arm_smmu_ops = {
>   	.of_xlate		= arm_smmu_of_xlate,
>   	.get_resv_regions	= arm_smmu_get_resv_regions,
>   	.put_resv_regions	= generic_iommu_put_resv_regions,
> +	.def_domain_type	= arm_smmu_def_domain_type,
>   	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
>   };
>   
> 
