Return-Path: <linux-arm-msm+bounces-78859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 151B3C0C9DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 10:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E2F3188BD52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 09:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B1C2ED871;
	Mon, 27 Oct 2025 09:17:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212D42E5B08;
	Mon, 27 Oct 2025 09:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761556671; cv=none; b=b4zkIuf/SWyR6Y2Hy8bnvAERbn87uJe5YPTvUwTg39st8mWaFZkvWOil2ptkt12wEckbdMLlz2fBOIyz5mN5pFFuzIooWYYpYYvJOnulx/FvlV9PmZGIRNFvKamh5z52RtbJS4P4vPAhg/Nt3yuUfx0+KsW7G7bqBueyG26+rzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761556671; c=relaxed/simple;
	bh=Ji4Uwjn20gTBKi5wEvNP5QqkXuIJtkJ0QnbDWWDd1mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rVKfFqNmi5iHi3RbogtyHFtHAUfXfBrCymfsFWwLDIDdMjb4nPeoZeDCPsn7kqkXQIOZfziCx7SZv4+xZ0Sgn/02AK5Qed2/vO92Fp0q6b8AggiAd9aTC7kKZXXEQKRK5yHkDIicdbTlLjYkt8jXcpx0v7wOJITbbARdWiIs+H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75B5D1764;
	Mon, 27 Oct 2025 02:17:40 -0700 (PDT)
Received: from [10.57.67.85] (unknown [10.57.67.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 669873F673;
	Mon, 27 Oct 2025 02:17:45 -0700 (PDT)
Message-ID: <7386e009-2d53-4a0b-8c83-a84f51b4b79a@arm.com>
Date: Mon, 27 Oct 2025 09:17:43 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] coresight: tpdm: add static tpdm support
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
 Tao Zhang <tao.zhang@oss.qualcomm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com>
 <20251013-add-static-tpdm-support-v3-2-a720b73e83db@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251013-add-static-tpdm-support-v3-2-a720b73e83db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2025 07:11, Jie Gan wrote:
> The static TPDM function as a dummy source, however, it is essential
> to enable the port connected to the TPDA and configure the element size.
> Without this, the TPDA cannot correctly receive trace data from the
> static TPDM. Since the static TPDM does not require MMIO mapping to
> access its registers, a clock controller is not mandatory for its
> operation.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-tpda.c |   9 ++
>   drivers/hwtracing/coresight/coresight-tpdm.c | 148 +++++++++++++++++++++------
>   drivers/hwtracing/coresight/coresight-tpdm.h |   8 ++
>   3 files changed, 131 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 333b3cb23685..4e93fa5bace4 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -68,6 +68,15 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
>   	int rc = -EINVAL;
>   	struct tpdm_drvdata *tpdm_data = dev_get_drvdata(csdev->dev.parent);
>   
> +	if (coresight_is_static_tpdm(csdev)) {
> +		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
> +					      "qcom,dsb-element-bits", &drvdata->dsb_esize);
> +		rc &= fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
> +					       "qcom,cmb-element-bits", &drvdata->cmb_esize);
> +

This doesn't match the "dynamic" tpdm case ? We mandate that static
TPDMs have DSB and CMB. I would rather set the appropriate flags in

tpdm_drvdata->dsb/cmb in the TPDM driver for static tpdms and not
let the "static" vs "dynamic" creep into the TPDA and other users.

e.g., in TPDM driver:

if (static_tpdm()) {
   tpdm_data->dsb = has_dsb_element_bits_property;
   tpdm_data->cmb = has_cmb_element_bits_property;
}


> +		goto out;
> +	}
> +
>   	if (tpdm_data->dsb) {
>   		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>   				"qcom,dsb-element-bits", &drvdata->dsb_esize);
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index 7214e65097ec..1766b0182819 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -495,7 +495,9 @@ static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
>   		return -EBUSY;
>   	}
>   
> -	__tpdm_enable(drvdata);
> +	if (!coresight_is_static_tpdm(csdev))
> +		__tpdm_enable(drvdata);
> +
>   	drvdata->enable = true;
>   	spin_unlock(&drvdata->spinlock);
>   
> @@ -551,7 +553,9 @@ static void tpdm_disable(struct coresight_device *csdev,
>   		return;
>   	}
>   
> -	__tpdm_disable(drvdata);
> +	if (!coresight_is_static_tpdm(csdev))
> +		__tpdm_disable(drvdata);

minor nit: It is much safer to do this check in __tpdm_xxable() and
return early.

> +
>   	coresight_set_mode(csdev, CS_MODE_DISABLED);
>   	drvdata->enable = false;
>   	spin_unlock(&drvdata->spinlock);
> @@ -1342,10 +1346,9 @@ static const struct attribute_group *tpdm_attr_grps[] = {
>   	NULL,
>   };
>   
> -static int tpdm_probe(struct amba_device *adev, const struct amba_id *id)
> +static int tpdm_probe(struct device *dev, struct resource *res)
>   {
>   	void __iomem *base;
> -	struct device *dev = &adev->dev;
>   	struct coresight_platform_data *pdata;
>   	struct tpdm_drvdata *drvdata;
>   	struct coresight_desc desc = { 0 };
> @@ -1354,32 +1357,33 @@ static int tpdm_probe(struct amba_device *adev, const struct amba_id *id)
>   	pdata = coresight_get_platform_data(dev);
>   	if (IS_ERR(pdata))
>   		return PTR_ERR(pdata);
> -	adev->dev.platform_data = pdata;
> +	dev->platform_data = pdata;
>   
>   	/* driver data*/
>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>   	if (!drvdata)
>   		return -ENOMEM;
> -	drvdata->dev = &adev->dev;
> +	drvdata->dev = dev;
>   	dev_set_drvdata(dev, drvdata);
>   
> -	base = devm_ioremap_resource(dev, &adev->res);
> -	if (IS_ERR(base))
> -		return PTR_ERR(base);
> +	if (res) {
> +		base = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(base))
> +			return PTR_ERR(base);
>   
> -	drvdata->base = base;
> +		drvdata->base = base;
> +		ret = tpdm_datasets_setup(drvdata);
> +		if (ret)
> +			return ret;
>   
> -	ret = tpdm_datasets_setup(drvdata);
> -	if (ret)
> -		return ret;
> +		if (drvdata && tpdm_has_dsb_dataset(drvdata))
> +			of_property_read_u32(drvdata->dev->of_node,
> +					     "qcom,dsb-msrs-num", &drvdata->dsb_msr_num);
>   
> -	if (drvdata && tpdm_has_dsb_dataset(drvdata))
> -		of_property_read_u32(drvdata->dev->of_node,
> -			   "qcom,dsb-msrs-num", &drvdata->dsb_msr_num);
> -
> -	if (drvdata && tpdm_has_cmb_dataset(drvdata))
> -		of_property_read_u32(drvdata->dev->of_node,
> -			   "qcom,cmb-msrs-num", &drvdata->cmb_msr_num);
> +		if (drvdata && tpdm_has_cmb_dataset(drvdata))
> +			of_property_read_u32(drvdata->dev->of_node,
> +					     "qcom,cmb-msrs-num", &drvdata->cmb_msr_num);
> +	}
>   
>   	/* Set up coresight component description */
>   	desc.name = coresight_alloc_device_name(&tpdm_devs, dev);
> @@ -1388,34 +1392,51 @@ static int tpdm_probe(struct amba_device *adev, const struct amba_id *id)
>   	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
>   	desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM;
>   	desc.ops = &tpdm_cs_ops;
> -	desc.pdata = adev->dev.platform_data;
> -	desc.dev = &adev->dev;
> +	desc.pdata = dev->platform_data;
> +	desc.dev = dev;
>   	desc.access = CSDEV_ACCESS_IOMEM(base);
> -	desc.groups = tpdm_attr_grps;
> +	if (res)
> +		desc.groups = tpdm_attr_grps;
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev))
>   		return PTR_ERR(drvdata->csdev);
>   
>   	spin_lock_init(&drvdata->spinlock);
>   
> -	/* Decrease pm refcount when probe is done.*/
> -	pm_runtime_put(&adev->dev);
> -
>   	return 0;
>   }
>   
> -static void tpdm_remove(struct amba_device *adev)
> +static int tpdm_remove(struct device *dev)
>   {
> -	struct tpdm_drvdata *drvdata = dev_get_drvdata(&adev->dev);
> +	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev);
>   
>   	coresight_unregister(drvdata->csdev);
> +
> +	return 0;
> +}
> +
> +static int dynamic_tpdm_probe(struct amba_device *adev,
> +			      const struct amba_id *id)
> +{
> +	int ret;
> +
> +	ret = tpdm_probe(&adev->dev, &adev->res);
> +	if (!ret)
> +		pm_runtime_put(&adev->dev);
> +
> +	return ret;
> +}
> +
> +static void dynamic_tpdm_remove(struct amba_device *adev)
> +{
> +	tpdm_remove(&adev->dev);
>   }
>   
>   /*
>    * Different TPDM has different periph id.
>    * The difference is 0-7 bits' value. So ignore 0-7 bits.
>    */
> -static const struct amba_id tpdm_ids[] = {
> +static const struct amba_id dynamic_tpdm_ids[] = {
>   	{
>   		.id	= 0x001f0e00,
>   		.mask	= 0x00ffff00,
> @@ -1423,17 +1444,76 @@ static const struct amba_id tpdm_ids[] = {
>   	{ 0, 0, NULL },
>   };
>   
> -static struct amba_driver tpdm_driver = {
> +MODULE_DEVICE_TABLE(amba, dynamic_tpdm_ids);
> +
> +static struct amba_driver dynamic_tpdm_driver = {
>   	.drv = {
>   		.name   = "coresight-tpdm",
>   		.suppress_bind_attrs = true,
>   	},
> -	.probe          = tpdm_probe,
> -	.id_table	= tpdm_ids,
> -	.remove		= tpdm_remove,
> +	.probe          = dynamic_tpdm_probe,
> +	.id_table	= dynamic_tpdm_ids,
> +	.remove		= dynamic_tpdm_remove,
>   };
>   
> -module_amba_driver(tpdm_driver);
> +static int tpdm_platform_probe(struct platform_device *pdev)
> +{
> +	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	int ret;
> +
> +	pm_runtime_get_noresume(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	ret = tpdm_probe(&pdev->dev, res);
> +	pm_runtime_put(&pdev->dev);
> +	if (ret)
> +		pm_runtime_disable(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +static void tpdm_platform_remove(struct platform_device *pdev)
> +{
> +	struct tpdm_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
> +
> +	if (WARN_ON(!drvdata))
> +		return;
> +
> +	tpdm_remove(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +}
> +
> +static const struct of_device_id static_tpdm_match[] = {
> +	{.compatible = "qcom,coresight-static-tpdm"},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(of, static_tpdm_match);
> +
> +static struct platform_driver static_tpdm_driver = {
> +	.probe		= tpdm_platform_probe,
> +	.remove		= tpdm_platform_remove,
> +	.driver		= {
> +		.name	= "coresight-static-tpdm",
> +		.of_match_table = static_tpdm_match,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +
> +static int __init tpdm_init(void)
> +{
> +	return coresight_init_driver("tpdm", &dynamic_tpdm_driver, &static_tpdm_driver,
> +				     THIS_MODULE);
> +}
> +
> +static void __exit tpdm_exit(void)
> +{
> +	coresight_remove_driver(&dynamic_tpdm_driver, &static_tpdm_driver);
> +}
> +
> +module_init(tpdm_init);
> +module_exit(tpdm_exit);
>   
>   MODULE_LICENSE("GPL");
>   MODULE_DESCRIPTION("Trace, Profiling & Diagnostic Monitor driver");
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
> index b11754389734..9f52c88ce5c1 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
> @@ -343,4 +343,12 @@ struct tpdm_dataset_attribute {
>   	enum dataset_mem mem;
>   	u32 idx;
>   };
> +
> +static inline bool coresight_is_static_tpdm(struct coresight_device *csdev)
> +{
> +	struct device_node *node = csdev->dev.parent->of_node;
> +
> +	return (csdev &&
> +		of_device_is_compatible(node, "qcom,coresight-static-tpdm"));

Why do we have to go check the firmware table all the time ? Could we 
not cache this in drvdata ? Or even better, we can use the csdev->access

by using :  coresight_device_is_tpdm()

return (coresight_device_is_tpdm(csdev) && !csdev->access->base);

Suzuki

