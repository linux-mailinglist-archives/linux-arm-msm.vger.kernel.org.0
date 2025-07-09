Return-Path: <linux-arm-msm+bounces-64247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A38AFE9F6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 15:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 669215A7592
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288052DFA21;
	Wed,  9 Jul 2025 13:19:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BB61FF1A1;
	Wed,  9 Jul 2025 13:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752067199; cv=none; b=qjyuMrfBREqYjEHs63036V22NvpdUU0MUSvYfsl/IciPVty50GH9Cv1mWSAC2rn64dXebkzWVpr9nv5QUmXMKRlElrPzXIISCsIp3gYIWc+U98naWQIi1vHBsFn/tRby9/q140I1ApcRuInHBWu8qoLenpCAuILcl0JHlEqtRkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752067199; c=relaxed/simple;
	bh=aH5JOtDmDULPrqob7bDREGa6lExRtAlBoPD9X+f1q04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DHjhaIyWCZk9wCjdDaBPSFX6hWwWnkkyGA0o6xnTGMLyy3RsZ2UmvcQ1qJMzGtC4JdLE5gJI5fqwNZmzqVbB+cN0lSrXdlPeAm4TIOGRkxqBOXx2KA/uqCKuH7uz6b6JV9hxmCjlou9LizutileDti20l+I+RhTP7lOmmh/RN9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50456339;
	Wed,  9 Jul 2025 06:19:44 -0700 (PDT)
Received: from [10.1.32.47] (Suzukis-MBP.cambridge.arm.com [10.1.32.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 708BC3F738;
	Wed,  9 Jul 2025 06:19:53 -0700 (PDT)
Message-ID: <4e3c8754-1831-45b1-8012-1de9a8759a0e@arm.com>
Date: Wed, 9 Jul 2025 14:19:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/2] coresight: add coresight Trace Network On Chip
 driver
Content-Language: en-GB
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Leo Yan <leo.yan@arm.com>
References: <20250611-trace-noc-v10-0-a83b5c63da34@quicinc.com>
 <20250611-trace-noc-v10-2-a83b5c63da34@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250611-trace-noc-v10-2-a83b5c63da34@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/06/2025 11:42, Yuanfang Zhang wrote:
> Add a driver to support Coresight device Trace Network On Chip (TNOC),
> which is an integration hierarchy integrating functionalities of TPDA
> and funnels. It aggregates the trace and transports to coresight trace
> bus.
> 
> Compared to current configuration, it has the following advantages:
> 1. Reduce wires between subsystems.
> 2. Continue cleaning the infrastructure.
> 3. Reduce Data overhead by transporting raw data from source to target.
> 
>    +------------------------+                +-------------------------+
>    | Video Subsystem        |                |Video Subsystem          |
>    |       +-------------+  |                |       +------------+    |
>    |       | Video TPDM  |  |                |       | Video TPDM |    |
>    |       +-------------+  |                |       +------------+    |
>    |            |           |                |              |          |
>    |            v           |                |              v          |
>    |   +---------------+    |                |        +-----------+    |
>    |   | Video funnel  |    |                |        |Video TNOC |    |
>    |   +---------------+    |                |        +-----------+    |
>    +------------|-----------+                +------------|------------+
>                 |                                         |
>                 v-----+                                   |
> +--------------------|---------+                         |
> |  Multimedia        v         |                         |
> |  Subsystem   +--------+      |                         |
> |              |  TPDA  |      |                         v
> |              +----|---+      |              +---------------------+
> |                   |          |              |   Aggregator  TNOC  |
> |                   |          |              +----------|----------+
> |                   +--        |                         |
> |                     |        |                         |
> |                     |        |                         |
> |              +------v-----+  |                         |
> |              |  Funnel    |  |                         |
> |              +------------+  |                         |
> +----------------|-------------+                         |
>                   |                                       |
>                   v                                       v
>        +--------------------+                    +------------------+
>        |   Coresight Sink   |                    |  Coresight Sink  |
>        +--------------------+                    +------------------+
> 
>         Current Configuration                            TNOC
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>   drivers/hwtracing/coresight/Kconfig          |  12 ++
>   drivers/hwtracing/coresight/Makefile         |   1 +
>   drivers/hwtracing/coresight/coresight-tnoc.c | 242 +++++++++++++++++++++++++++
>   3 files changed, 255 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> index f064e3d172b3d630515bb3a11450e883a6b5b4bf..6a4239ebb582e95f0ebe8e9c8738a726f27f60a1 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -268,4 +268,16 @@ config CORESIGHT_KUNIT_TESTS
>   	    Enable Coresight unit tests. Only useful for development and not
>   	    intended for production.
>   
> +config CORESIGHT_TNOC
> +	tristate "Coresight Trace Network On Chip driver"
> +	help
> +	  This driver provides support for Trace Network On Chip (TNOC) component.
> +	  TNOC is an interconnect used to collect traces from various subsystems
> +	  and transport to a coresight trace sink. It sits in the different
> +	  tiles of SOC and aggregates the trace local to the tile and transports
> +	  it another tile or to coresight trace sink eventually.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called coresight-tnoc.
> +
>   endif
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 4e7cc3c5bf994d4066adc3b6c203edd19e88a823..ab16d06783a572ea1308dfb3a30c96df9e5ffdb7 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_CORESIGHT_SINK_TPIU) += coresight-tpiu.o
>   obj-$(CONFIG_CORESIGHT_SINK_ETBV10) += coresight-etb10.o
>   obj-$(CONFIG_CORESIGHT_LINKS_AND_SINKS) += coresight-funnel.o \
>   					   coresight-replicator.o
> +obj-$(CONFIG_CORESIGHT_TNOC) += coresight-tnoc.o
>   obj-$(CONFIG_CORESIGHT_SOURCE_ETM3X) += coresight-etm3x.o
>   coresight-etm3x-y := coresight-etm3x-core.o coresight-etm-cp14.o \
>   		     coresight-etm3x-sysfs.o
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..ac0b165f8742aaa8b6f6ed81d75eb75a81a85e39
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -0,0 +1,242 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> + #include <linux/amba/bus.h>
> + #include <linux/coresight.h>
> + #include <linux/device.h>
> + #include <linux/io.h>
> + #include <linux/kernel.h>
> + #include <linux/module.h>
> + #include <linux/of.h>
> + #include <linux/platform_device.h>
> +
> +#include "coresight-priv.h"
> +#include "coresight-trace-id.h"
> +
> +#define TRACE_NOC_CTRL      0x008
> +#define TRACE_NOC_XLD       0x010
> +#define TRACE_NOC_FREQVAL   0x018
> +#define TRACE_NOC_SYNCR     0x020
> +
> +/* Enable generation of output ATB traffic.*/
> +#define TRACE_NOC_CTRL_PORTEN   BIT(0)
> +/* Sets the type of issued ATB FLAG packets.*/
> +#define TRACE_NOC_CTRL_FLAGTYPE BIT(7)
> +/* Sets the type of issued ATB FREQ packet*/
> +#define TRACE_NOC_CTRL_FREQTYPE BIT(8)
> +
> +#define TRACE_NOC_SYNC_INTERVAL	0xFFFF
> +
> +/*
> + * struct trace_noc_drvdata - specifics associated to a trace noc component
> + * @base:      memory mapped base address for this component.
> + * @dev:       device node for trace_noc_drvdata.
> + * @csdev:     component vitals needed by the framework.
> + * @spinlock:  serialize enable/disable operation.
> + * @atid:      id for the trace packet.
> + */
> +struct trace_noc_drvdata {
> +	void __iomem		*base;
> +	struct device		*dev;
> +	struct coresight_device	*csdev;
> +	spinlock_t		spinlock;
> +	u32			atid;
> +};
> +
> +DEFINE_CORESIGHT_DEVLIST(trace_noc_devs, "traceNoc");
> +
> +static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
> +{
> +	u32 val;
> +
> +	/* Set ATID */
> +	writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
> +
> +	/* Set the data word count between 'SYNC' packets */
> +	writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
> +
> +	/* Set the Control register:
> +	 * - Set the FLAG packets to 'FLAG' packets
> +	 * - Set the FREQ packets to 'FREQ_TS' packets
> +	 * - Enable generation of output ATB traffic
> +	 */
> +
> +	val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
> +
> +	val &= ~TRACE_NOC_CTRL_FLAGTYPE;
> +	val |= TRACE_NOC_CTRL_FREQTYPE;
> +	val |= TRACE_NOC_CTRL_PORTEN;
> +
> +	writel(val, drvdata->base + TRACE_NOC_CTRL);
> +}
> +
> +static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
> +			    struct coresight_connection *outport)
> +{
> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	scoped_guard(spinlock, &drvdata->spinlock) {
> +		if (csdev->refcnt == 0)
> +			trace_noc_enable_hw(drvdata);
> +
> +		csdev->refcnt++;
> +	}
> +
> +	dev_dbg(drvdata->dev, "Trace NOC is enabled\n");
> +	return 0;
> +}
> +
> +static void trace_noc_disable(struct coresight_device *csdev, struct coresight_connection *inport,
> +			      struct coresight_connection *outport)
> +{
> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	scoped_guard(spinlock, &drvdata->spinlock) {
> +		if (--csdev->refcnt == 0)
> +			writel(0x0, drvdata->base + TRACE_NOC_CTRL);
> +	}
> +	dev_dbg(drvdata->dev, "Trace NOC is disabled\n");
> +}
> +
> +static int trace_noc_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> +			__maybe_unused struct coresight_device *sink)
> +{
> +	struct trace_noc_drvdata *drvdata;
> +
> +	drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	return drvdata->atid;
> +}
> +
> +static const struct coresight_ops_link trace_noc_link_ops = {
> +	.enable		= trace_noc_enable,
> +	.disable	= trace_noc_disable,
> +};
> +
> +static const struct coresight_ops trace_noc_cs_ops = {
> +	.trace_id	= trace_noc_id,
> +	.link_ops	= &trace_noc_link_ops,
> +};
> +
> +static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
> +{
> +	int atid;
> +
> +	atid = coresight_trace_id_get_system_id();
> +	if (atid < 0)
> +		return atid;
> +
> +	drvdata->atid = atid;
> +
> +	return 0;
> +}
> +
> +static ssize_t traceid_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	unsigned long val;
> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	val = drvdata->atid;
> +	return sprintf(buf, "%#lx\n", val);
> +}
> +static DEVICE_ATTR_RO(traceid);
> +
> +static struct attribute *coresight_tnoc_attrs[] = {
> +	&dev_attr_traceid.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group coresight_tnoc_group = {
> +	.attrs = coresight_tnoc_attrs,
> +};
> +
> +static const struct attribute_group *coresight_tnoc_groups[] = {
> +	&coresight_tnoc_group,
> +	NULL,
> +};
> +
> +static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct coresight_platform_data *pdata;
> +	struct trace_noc_drvdata *drvdata;
> +	struct coresight_desc desc = { 0 };
> +	int ret;
> +
> +	desc.name = coresight_alloc_device_name(&trace_noc_devs, dev);
> +	if (!desc.name)
> +		return -ENOMEM;
> +
> +	pdata = coresight_get_platform_data(dev);
> +	if (IS_ERR(pdata))
> +		return PTR_ERR(pdata);
> +	adev->dev.platform_data = pdata;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	drvdata->dev = &adev->dev;
> +	dev_set_drvdata(dev, drvdata);
> +
> +	drvdata->base = devm_ioremap_resource(dev, &adev->res);
> +	if (!drvdata->base)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&drvdata->spinlock);
> +
> +	ret = trace_noc_init_default_data(drvdata);
> +	if (ret)
> +		return ret;
> +
> +	desc.ops = &trace_noc_cs_ops;
> +	desc.type = CORESIGHT_DEV_TYPE_LINK;
> +	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
> +	desc.pdata = adev->dev.platform_data;
> +	desc.dev = &adev->dev;
> +	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
> +	desc.groups = coresight_tnoc_groups;
> +	drvdata->csdev = coresight_register(&desc);
> +	if (IS_ERR(drvdata->csdev)) {
> +		coresight_trace_id_put_system_id(drvdata->atid);
> +		return PTR_ERR(drvdata->csdev);
> +	}
> +	pm_runtime_put(&adev->dev);
> +
> +	return 0;
> +}
> +
> +static void trace_noc_remove(struct amba_device *adev)
> +{
> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(&adev->dev);
> +
> +	coresight_trace_id_put_system_id(drvdata->atid);
> +	coresight_unregister(drvdata->csdev);

For the sake of safety you should reverse the order of the above
operations. To prevent a released system id visible on the csdev.

Rest looks fine

Suzuki

> +}
> +
> +static struct amba_id trace_noc_ids[] = {
> +	{
> +		.id     = 0x000f0c00,
> +		.mask   = 0x00ffff00,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(amba, trace_noc_ids);
> +
> +static struct amba_driver trace_noc_driver = {
> +	.drv = {
> +		.name   = "coresight-trace-noc",
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe          = trace_noc_probe,
> +	.remove		= trace_noc_remove,
> +	.id_table	= trace_noc_ids,
> +};
> +
> +module_amba_driver(trace_noc_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Trace NOC driver");
> 


