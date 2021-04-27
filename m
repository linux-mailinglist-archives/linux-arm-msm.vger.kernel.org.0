Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD7536CA72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 19:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236019AbhD0RiP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Apr 2021 13:38:15 -0400
Received: from foss.arm.com ([217.140.110.172]:55358 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235974AbhD0RiO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Apr 2021 13:38:14 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAD1D31B;
        Tue, 27 Apr 2021 10:37:30 -0700 (PDT)
Received: from [10.57.61.101] (unknown [10.57.61.101])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B13D3F694;
        Tue, 27 Apr 2021 10:37:29 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] ACPI/IORT: Consolidate use of SMMU device platdata
To:     Shawn Guo <shawn.guo@linaro.org>, Will Deacon <will@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20210402035602.9484-1-shawn.guo@linaro.org>
 <20210402035602.9484-2-shawn.guo@linaro.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <bf51c5b3-082c-98dd-ff8d-559ef5b56bad@arm.com>
Date:   Tue, 27 Apr 2021 18:37:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210402035602.9484-2-shawn.guo@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-02 04:56, Shawn Guo wrote:
> Currently the platdata is being used in different way by SMMU and PMCG
> device.  The former uses it for acpi_iort_node pointer passing, while
> the later uses it for model identifier.  As it's been seen that the
> model identifier is useful for SMMU devices as well, let's consolidate
> the platdata use to get it accommodate both acpi_iort_node pointer and
> model identifier, so that all IORT devices (SMMU, SMMUv3 and PMCG) pass
> platdata in a consistent manner.
> 
> With this change, model identifier is not specific to PMCG, so
> IORT_SMMU_V3_PMCG_GENERIC gets renamed to IORT_SMMU_GENERIC.  While at
> it, the spaces used in model defines are converted to tabs.

SMMUs and PMCGs are deliberately kept distinct because they are not 
necessarily equivalent - a PMCG may belong to something other than an 
SMMU, (like a root complex or a device with its own TLB), and even a 
single SMMU may implement heterogeneous PMCGs (e.g. Arm's MMU-600 has 
PMCGs in its control unit and TLB units which count different sets of 
events). So NAK to that aspect, sorry.

FWIW this was originally here because we envisaged needing to identify 
individual PMCG implementations through a variety of poking at different 
fields and tables, so hiding that behind an abstraction in ACPI code 
seemed neatest. However, things haven't really panned out that way - now 
we seem to have moved more towards describing events in userspace in 
conjunction with other system-specific identifiers. If we've no need to 
identify PMCGs in the kernel for the sake of exporting imp-def events, 
then most of the argument for this PMCG identifier abstraction is gone, 
and it's looking increasingly like the HIP08 case deserves to be punted 
back to the PMCG driver itself as a one-off erratum workaround.

I think at this point we should accept that if a driver needs to match 
*some* platform-specific data for its own internal purposes, the fact 
that that data might be the IORT header still doesn't make it "IORT 
functionality", and referencing ACPI_SIG_IORT from drivers is a lesser 
evil than cluttering up the IORT code with increasing amounts of random 
stuff that's outside the scope of the IORT specification itself.

Robin.

> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>   drivers/acpi/arm64/iort.c                   | 31 ++++++++-------------
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  6 +++-
>   drivers/iommu/arm/arm-smmu/arm-smmu.c       |  9 ++++--
>   drivers/perf/arm_smmuv3_pmu.c               |  8 ++++--
>   include/linux/acpi_iort.h                   | 11 ++++++--
>   5 files changed, 36 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> index 2494138a6905..e2a96d2d399a 100644
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@ -1463,25 +1463,28 @@ static void __init arm_smmu_v3_pmcg_init_resources(struct resource *res,
>   				       ACPI_EDGE_SENSITIVE, &res[2]);
>   }
>   
> -static struct acpi_platform_list pmcg_plat_info[] __initdata = {
> +static struct acpi_platform_list iort_plat_info[] __initdata = {
>   	/* HiSilicon Hip08 Platform */
>   	{"HISI  ", "HIP08   ", 0, ACPI_SIG_IORT, greater_than_or_equal,
>   	 "Erratum #162001800", IORT_SMMU_V3_PMCG_HISI_HIP08},
>   	{ }
>   };
>   
> -static int __init arm_smmu_v3_pmcg_add_platdata(struct platform_device *pdev)
> +static int __init iort_smmu_add_platdata(struct platform_device *pdev,
> +					 struct acpi_iort_node *node)
>   {
> -	u32 model;
> +	struct iort_smmu_pdata pdata;
>   	int idx;
>   
> -	idx = acpi_match_platform_list(pmcg_plat_info);
> +	pdata.node = node;
> +
> +	idx = acpi_match_platform_list(iort_plat_info);
>   	if (idx >= 0)
> -		model = pmcg_plat_info[idx].data;
> +		pdata.model = iort_plat_info[idx].data;
>   	else
> -		model = IORT_SMMU_V3_PMCG_GENERIC;
> +		pdata.model = IORT_SMMU_GENERIC;
>   
> -	return platform_device_add_data(pdev, &model, sizeof(model));
> +	return platform_device_add_data(pdev, &pdata, sizeof(pdata));
>   }
>   
>   struct iort_dev_config {
> @@ -1494,7 +1497,6 @@ struct iort_dev_config {
>   				     struct acpi_iort_node *node);
>   	int (*dev_set_proximity)(struct device *dev,
>   				    struct acpi_iort_node *node);
> -	int (*dev_add_platdata)(struct platform_device *pdev);
>   };
>   
>   static const struct iort_dev_config iort_arm_smmu_v3_cfg __initconst = {
> @@ -1516,7 +1518,6 @@ static const struct iort_dev_config iort_arm_smmu_v3_pmcg_cfg __initconst = {
>   	.name = "arm-smmu-v3-pmcg",
>   	.dev_count_resources = arm_smmu_v3_pmcg_count_resources,
>   	.dev_init_resources = arm_smmu_v3_pmcg_init_resources,
> -	.dev_add_platdata = arm_smmu_v3_pmcg_add_platdata,
>   };
>   
>   static __init const struct iort_dev_config *iort_get_dev_cfg(
> @@ -1579,17 +1580,7 @@ static int __init iort_add_platform_device(struct acpi_iort_node *node,
>   	if (ret)
>   		goto dev_put;
>   
> -	/*
> -	 * Platform devices based on PMCG nodes uses platform_data to
> -	 * pass the hardware model info to the driver. For others, add
> -	 * a copy of IORT node pointer to platform_data to be used to
> -	 * retrieve IORT data information.
> -	 */
> -	if (ops->dev_add_platdata)
> -		ret = ops->dev_add_platdata(pdev);
> -	else
> -		ret = platform_device_add_data(pdev, &node, sizeof(node));
> -
> +	ret = iort_smmu_add_platdata(pdev, node);
>   	if (ret)
>   		goto dev_put;
>   
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 8ca7415d785d..91c9a74d8ac6 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -3397,9 +3397,13 @@ static int arm_smmu_device_acpi_probe(struct platform_device *pdev,
>   {
>   	struct acpi_iort_smmu_v3 *iort_smmu;
>   	struct device *dev = smmu->dev;
> +	struct iort_smmu_pdata *pdata = dev_get_platdata(dev);
>   	struct acpi_iort_node *node;
>   
> -	node = *(struct acpi_iort_node **)dev_get_platdata(dev);
> +	if (pdata == NULL)
> +		return -ENODEV;
> +
> +	node = pdata->node;
>   
>   	/* Retrieve SMMUv3 specific data */
>   	iort_smmu = (struct acpi_iort_smmu_v3 *)node->node_data;
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index d8c6bfde6a61..d53ab3927a30 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -1991,11 +1991,16 @@ static int arm_smmu_device_acpi_probe(struct platform_device *pdev,
>   				      struct arm_smmu_device *smmu)
>   {
>   	struct device *dev = smmu->dev;
> -	struct acpi_iort_node *node =
> -		*(struct acpi_iort_node **)dev_get_platdata(dev);
> +	struct iort_smmu_pdata *pdata = dev_get_platdata(dev);
> +	struct acpi_iort_node *node;
>   	struct acpi_iort_smmu *iort_smmu;
>   	int ret;
>   
> +	if (pdata == NULL)
> +		return -ENODEV;
> +
> +	node = pdata->node;
> +
>   	/* Retrieve SMMU1/2 specific data */
>   	iort_smmu = (struct acpi_iort_smmu *)node->node_data;
>   
> diff --git a/drivers/perf/arm_smmuv3_pmu.c b/drivers/perf/arm_smmuv3_pmu.c
> index 74474bb322c3..77fcf5e7413a 100644
> --- a/drivers/perf/arm_smmuv3_pmu.c
> +++ b/drivers/perf/arm_smmuv3_pmu.c
> @@ -747,17 +747,19 @@ static void smmu_pmu_reset(struct smmu_pmu *smmu_pmu)
>   
>   static void smmu_pmu_get_acpi_options(struct smmu_pmu *smmu_pmu)
>   {
> -	u32 model;
> +	struct iort_smmu_pdata *pdata = dev_get_platdata(smmu_pmu->dev);
>   
> -	model = *(u32 *)dev_get_platdata(smmu_pmu->dev);
> +	if (pdata == NULL)
> +		goto done;
>   
> -	switch (model) {
> +	switch (pdata->model) {
>   	case IORT_SMMU_V3_PMCG_HISI_HIP08:
>   		/* HiSilicon Erratum 162001800 */
>   		smmu_pmu->options |= SMMU_PMCG_EVCNTR_RDONLY;
>   		break;
>   	}
>   
> +done:
>   	dev_notice(smmu_pmu->dev, "option mask 0x%x\n", smmu_pmu->options);
>   }
>   
> diff --git a/include/linux/acpi_iort.h b/include/linux/acpi_iort.h
> index 1a12baa58e40..678cdf036948 100644
> --- a/include/linux/acpi_iort.h
> +++ b/include/linux/acpi_iort.h
> @@ -15,12 +15,17 @@
>   #define IORT_IRQ_TRIGGER_MASK(irq)	((irq >> 32) & 0xffffffffULL)
>   
>   /*
> - * PMCG model identifiers for use in smmu pmu driver. Please note
> + * Model identifiers for use in SMMU drivers. Please note
>    * that this is purely for the use of software and has nothing to
>    * do with hardware or with IORT specification.
>    */
> -#define IORT_SMMU_V3_PMCG_GENERIC        0x00000000 /* Generic SMMUv3 PMCG */
> -#define IORT_SMMU_V3_PMCG_HISI_HIP08     0x00000001 /* HiSilicon HIP08 PMCG */
> +#define IORT_SMMU_GENERIC		0x00000000 /* Generic SMMU */
> +#define IORT_SMMU_V3_PMCG_HISI_HIP08	0x00000001 /* HiSilicon HIP08 PMCG */
> +
> +struct iort_smmu_pdata {
> +	struct acpi_iort_node *node;
> +	u32 model;
> +};
>   
>   int iort_register_domain_token(int trans_id, phys_addr_t base,
>   			       struct fwnode_handle *fw_node);
> 
