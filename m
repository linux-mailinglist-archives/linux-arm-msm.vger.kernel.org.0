Return-Path: <linux-arm-msm+bounces-69593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DC0B2AB87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 16:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A8677267E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BCB2C2340;
	Mon, 18 Aug 2025 14:28:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206971C5F23;
	Mon, 18 Aug 2025 14:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755527285; cv=none; b=ufPjf8Rv7poXpse1UHbnXTTg1kOd2SzllBf7Qyqgoa0vXb8WDj6TWQqzk3+VU6SYnY6ucYbkV6b+anSKEHR209bcyUDNwwROPPk0zaToyaKPWw+hmSMLJ8DhEEeZd2NLA81qA17n2CY8PYprJfK+xKPUn/Kj3P4U3+z5SNwePao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755527285; c=relaxed/simple;
	bh=hLdXajffGhLshNFYupHsO/P0JKQFIMGfoetkUAhVTxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHDHP//gL/VAzJoZmaPSKkEkDElb4gxkRsltcgKLSduO8VdwSNDksqBmTmwVpiObAMv3bLq+dk0/2Pl8Bt/4VGpcjah9vhdeqLm6MbMqLfw0APptuHlDIdUPjv5bwvnKn75JA/4qwbvTkJa3/iqRfoYHoUEJU6XjNHv51LQE6DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E940A1596;
	Mon, 18 Aug 2025 07:27:53 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B499A3F63F;
	Mon, 18 Aug 2025 07:28:01 -0700 (PDT)
Date: Mon, 18 Aug 2025 15:27:59 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	kernel@oss.qualcomm.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] coresight-tnoc: add platform driver to support
 Interconnect TNOC
Message-ID: <20250818142759.GA8071@e132581.arm.com>
References: <20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com>
 <20250815-itnoc-v1-2-62c8e4f7ad32@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815-itnoc-v1-2-62c8e4f7ad32@oss.qualcomm.com>

On Fri, Aug 15, 2025 at 06:18:13AM -0700, Yuanfang Zhang wrote:
> This patch adds platform driver support for the CoreSight Interconnect
> TNOC, Interconnect TNOC is a CoreSight link that forwards trace data
> from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC,
> it does not have aggregation and ATID functionality.

Such kind of driver is not complex, it would be fine to had sent driver
in one go for support both AMBA and platform devices.

> Key changes:
> - Add platform driver `coresight-itnoc` with device tree match support.
> - Refactor probe logic into a common `_tnoc_probe()` function.
> - Conditionally initialize ATID only for AMBA-based TNOC blocks.

An AMBA or platform device is only about device probing; it is not
necessarily bound to a device feature.

So I am suspicious of the conclusion that an AMBA-based TNOC always
supports ATID, while a platform device never supports it.

Otherwise, you might need to consider using a DT property to indicate
whether ATID is present or not.

> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-tnoc.c | 153 +++++++++++++++++++--------
>  1 file changed, 106 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> index d542df46ea39314605290311f683010337bfd4bd..aa6f48d838c00d71eff22c18e34e00b93755fd82 100644
> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -34,6 +34,7 @@
>   * @base:      memory mapped base address for this component.
>   * @dev:       device node for trace_noc_drvdata.
>   * @csdev:     component vitals needed by the framework.
> + * @pclk:	APB clock if present, otherwise NULL
>   * @spinlock:  serialize enable/disable operation.
>   * @atid:      id for the trace packet.
>   */
> @@ -41,6 +42,7 @@ struct trace_noc_drvdata {
>  	void __iomem		*base;
>  	struct device		*dev;
>  	struct coresight_device	*csdev;
> +	struct clk		*pclk;
>  	spinlock_t		spinlock;
>  	u32			atid;
>  };
> @@ -51,25 +53,27 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
>  {
>  	u32 val;
>  
> -	/* Set ATID */
> -	writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
> -
> -	/* Set the data word count between 'SYNC' packets */
> -	writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
> -
> -	/* Set the Control register:
> -	 * - Set the FLAG packets to 'FLAG' packets
> -	 * - Set the FREQ packets to 'FREQ_TS' packets
> -	 * - Enable generation of output ATB traffic
> -	 */
> -
> -	val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
> -
> -	val &= ~TRACE_NOC_CTRL_FLAGTYPE;
> -	val |= TRACE_NOC_CTRL_FREQTYPE;
> -	val |= TRACE_NOC_CTRL_PORTEN;
> -
> -	writel(val, drvdata->base + TRACE_NOC_CTRL);
> +	if (drvdata->atid) {
> +		/* Set ATID */
> +		writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
> +
> +		/* Set the data word count between 'SYNC' packets */
> +		writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
> +		/* Set the Control register:
> +		 * - Set the FLAG packets to 'FLAG' packets
> +		 * - Set the FREQ packets to 'FREQ_TS' packets
> +		 * - Enable generation of output ATB traffic
> +		 */
> +
> +		val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
> +
> +		val &= ~TRACE_NOC_CTRL_FLAGTYPE;
> +		val |= TRACE_NOC_CTRL_FREQTYPE;
> +		val |= TRACE_NOC_CTRL_PORTEN;
> +		writel(val, drvdata->base + TRACE_NOC_CTRL);
> +	} else {
> +		writel(0x1, drvdata->base + TRACE_NOC_CTRL);
> +	}

Change "atid" type from u32 to int, then you could set it as
"-EOPNOTSUPP" for non-AMBA device. Here:

    /* No valid ATID, simply enable the unit */
    if (drvdata->atid == -EOPNOTSUPP) {
        writel(TRACE_NOC_CTRL_PORTEN, drvdata->base + TRACE_NOC_CTRL);
        return;
    }

>  }
>  
>  static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
> @@ -120,19 +124,6 @@ static const struct coresight_ops trace_noc_cs_ops = {
>  	.link_ops	= &trace_noc_link_ops,
>  };
>  
> -static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
> -{
> -	int atid;
> -

Don't need to remove this function. Just check AMBA device case:

    /* ATID is not supported for interconnect TNOC */
    if (!dev_is_amba(drvdata->dev)) {
        drvdata->atid = -EOPNOTSUPP;
        return 0;
    }

> -	atid = coresight_trace_id_get_system_id();
> -	if (atid < 0)
> -		return atid;
> -
> -	drvdata->atid = atid;
> -
> -	return 0;
> -}
> -
>  static ssize_t traceid_show(struct device *dev,
>  			    struct device_attribute *attr, char *buf)
>  {
> @@ -158,13 +149,12 @@ static const struct attribute_group *coresight_tnoc_groups[] = {
>  	NULL,
>  };
>  
> -static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
> +static int _tnoc_probe(struct device *dev, struct resource *res, bool has_id)

As a result, no need the parameter "has_id".

>  {
> -	struct device *dev = &adev->dev;
>  	struct coresight_platform_data *pdata;
>  	struct trace_noc_drvdata *drvdata;
>  	struct coresight_desc desc = { 0 };
> -	int ret;
> +	int ret, atid = 0;
>  
>  	desc.name = coresight_alloc_device_name(&trace_noc_devs, dev);
>  	if (!desc.name)
> @@ -173,42 +163,61 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
>  	pdata = coresight_get_platform_data(dev);
>  	if (IS_ERR(pdata))
>  		return PTR_ERR(pdata);
> -	adev->dev.platform_data = pdata;
> +	dev->platform_data = pdata;
>  
>  	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>  	if (!drvdata)
>  		return -ENOMEM;
>  
> -	drvdata->dev = &adev->dev;
> +	drvdata->dev = dev;
>  	dev_set_drvdata(dev, drvdata);
>  
> -	drvdata->base = devm_ioremap_resource(dev, &adev->res);
> +	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, NULL);
> +	if (ret)
> +		return ret;
> +
> +	drvdata->base = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(drvdata->base))
>  		return PTR_ERR(drvdata->base);
>  
>  	spin_lock_init(&drvdata->spinlock);
>  
> -	ret = trace_noc_init_default_data(drvdata);
> -	if (ret)
> -		return ret;
> +	if (has_id) {
> +		atid = coresight_trace_id_get_system_id();
> +		if (atid < 0)
> +			return atid;
> +	}
> +
> +	drvdata->atid = atid;

Drop this change and simply keep the code for invoking
trace_noc_init_default_data().

>  	desc.ops = &trace_noc_cs_ops;
>  	desc.type = CORESIGHT_DEV_TYPE_LINK;
>  	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
> -	desc.pdata = adev->dev.platform_data;
> -	desc.dev = &adev->dev;
> +	desc.pdata = pdata;
> +	desc.dev = dev;
>  	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
> -	desc.groups = coresight_tnoc_groups;
> +	if (has_id)
> +		desc.groups = coresight_tnoc_groups;

No need to change for groups.

Just return "-EOPNOTSUPP" in traceid_show() if drvdata->atid is negative.
Or, you could use the .is_visible() callback to decide if the "trace_id"
node appears or not.

>  	drvdata->csdev = coresight_register(&desc);
> -	if (IS_ERR(drvdata->csdev)) {
> +	if (IS_ERR(drvdata->csdev) && has_id) {
>  		coresight_trace_id_put_system_id(drvdata->atid);
>  		return PTR_ERR(drvdata->csdev);
>  	}
> -	pm_runtime_put(&adev->dev);
>  
>  	return 0;
>  }
>  
> +static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
> +{
> +	int ret;
> +
> +	ret = _tnoc_probe(&adev->dev, &adev->res, true);
> +	if (!ret)
> +		pm_runtime_put(&adev->dev);
> +
> +	return ret;
> +}
> +
>  static void trace_noc_remove(struct amba_device *adev)
>  {
>  	struct trace_noc_drvdata *drvdata = dev_get_drvdata(&adev->dev);
> @@ -236,7 +245,57 @@ static struct amba_driver trace_noc_driver = {
>  	.id_table	= trace_noc_ids,
>  };
>  
> -module_amba_driver(trace_noc_driver);
> +static int itnoc_probe(struct platform_device *pdev)
> +{
> +	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	int ret;
> +
> +	pm_runtime_get_noresume(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	ret = _tnoc_probe(&pdev->dev, res, false);
> +	pm_runtime_put(&pdev->dev);
> +	if (ret)
> +		pm_runtime_disable(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +static void itnoc_remove(struct platform_device *pdev)
> +{
> +	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
> +
> +	coresight_unregister(drvdata->csdev);
> +	pm_runtime_disable(&pdev->dev);
> +}
> +
> +static const struct of_device_id itnoc_of_match[] = {
> +	{ .compatible = "qcom,coresight-itnoc" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, itnoc_of_match);
> +
> +static struct platform_driver itnoc_driver = {
> +	.probe = itnoc_probe,
> +	.remove = itnoc_remove,
> +	.driver = {
> +		.name = "coresight-itnoc",
> +		.of_match_table = itnoc_of_match,

You might need to set:

    .suppress_bind_attrs = true,

Thanks,
Leo

> +	},
> +};
> +
> +static int __init tnoc_init(void)
> +{
> +	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver, THIS_MODULE);
> +}
> +
> +static void __exit tnoc_exit(void)
> +{
> +	coresight_remove_driver(&trace_noc_driver, &itnoc_driver);
> +}
> +module_init(tnoc_init);
> +module_exit(tnoc_exit);
>  
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Trace NOC driver");
> 
> -- 
> 2.34.1
> 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org

