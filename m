Return-Path: <linux-arm-msm+bounces-53976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EC0A858A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A68A16DEBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 09:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404542980DD;
	Fri, 11 Apr 2025 09:59:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8D929614B;
	Fri, 11 Apr 2025 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744365593; cv=none; b=e+VfLs8LPkFORURF9dFnji8rnezlXXeZ4Mjv2hVuuH9cAvx0e1wu37H6EZPwZ0crjQSdFEvLUIE/idT8IY9GL1oOwoBGywcffn3rpiFwPuW186EQGtaqQij04lQwrhixbPYYGl8Z0+I1ux8G1irRVsiJpdpigSUahlAg9Dp+hzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744365593; c=relaxed/simple;
	bh=Plp3q+//quWDPti7MuBsyvptWonkbiUGLiG+/cDeACA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hJGzAkMNojPB7dq93T/LvYwjkAevkX9Zl6UIGXF+c93XO8T1eBhMx5l8e6bUdpkn4+dphCI3dYBylSXvi1OfgJGN8k9N5yVwGD8mFRh3pEZv66H7Xy0yTB9ZxDFK036Gm19DuGxYWVPdmvzzcxH52Ni9ypADZgX9swJDyrgMeHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3182106F;
	Fri, 11 Apr 2025 02:59:49 -0700 (PDT)
Received: from [10.57.43.36] (unknown [10.57.43.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E30C83F6A8;
	Fri, 11 Apr 2025 02:59:47 -0700 (PDT)
Message-ID: <23d02991-3bc6-41e2-bb8b-a38786071c43@arm.com>
Date: Fri, 11 Apr 2025 10:59:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] coresight: add coresight Trace Network On Chip
 driver
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250411-trace-noc-v3-0-1f19ddf7699b@quicinc.com>
 <20250411-trace-noc-v3-2-1f19ddf7699b@quicinc.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250411-trace-noc-v3-2-1f19ddf7699b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2025 09:57, Yuanfang Zhang wrote:
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
> |                   |          |              |   Aggoregator TNOC  |
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

If each NOC has TraceID, how do you reliably decode the trace ?
Is there a single NOC/TPDA in the path from Source to sink ?

> 
>         Current Configuration                            TNOC
> 
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>   drivers/hwtracing/coresight/Kconfig          |  13 ++
>   drivers/hwtracing/coresight/Makefile         |   1 +
>   drivers/hwtracing/coresight/coresight-tnoc.c | 186 +++++++++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tnoc.h |  34 +++++
>   4 files changed, 234 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> index ecd7086a5b83e86b6bc8ea039d6d26a628334ed3..f20600d58f38568f8178f69d3f678c2df2cbca7e 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -259,4 +259,17 @@ config CORESIGHT_DUMMY
>   
>   	  To compile this driver as a module, choose M here: the module will be
>   	  called coresight-dummy.
> +
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
> index 8e62c3150aebd1e82b445fafc97a0a9b44397b0e..880e9ed6bfe9c711492c6a2cd972751f56dd8010 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -34,6 +34,7 @@ obj-$(CONFIG_CORESIGHT_SINK_TPIU) += coresight-tpiu.o
>   obj-$(CONFIG_CORESIGHT_SINK_ETBV10) += coresight-etb10.o
>   obj-$(CONFIG_CORESIGHT_LINKS_AND_SINKS) += coresight-funnel.o \
>   					   coresight-replicator.o
> +obj-$(CONFIG_CORESIGHT_TNOC) += coresight-tnoc.o
>   obj-$(CONFIG_CORESIGHT_SOURCE_ETM3X) += coresight-etm3x.o
>   coresight-etm3x-y := coresight-etm3x-core.o coresight-etm-cp14.o \
>   		     coresight-etm3x-sysfs.o
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..2ec4ead892f0166a3e84f777679c0f73f5da0e83
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -0,0 +1,186 @@
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
> +#include "coresight-tnoc.h"
> +#include "coresight-trace-id.h"
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
> +	/* Config sync CR */
> +	writel_relaxed(TRACE_NOC_SYN_VAL, drvdata->base + TRACE_NOC_SYNCR);

See my comment below about SYN_VAL. Please add a meaningful comment than
explaining what is obvious from the code.

> +
> +	/* Set Ctrl register */

Same here. Comment need not explain what is obvious from the code. But
a description of why we choose the values below is helpful.

> +	val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
> +
> +	val = val & ~TRACE_NOC_CTRL_FLAGTYPE;
> +	val = val | TRACE_NOC_CTRL_FREQTYPE;
> +	val = val | TRACE_NOC_CTRL_PORTEN;
> +
> +	writel(val, drvdata->base + TRACE_NOC_CTRL);
> +}
> +
> +static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
> +			    struct coresight_connection *outport)
> +{
> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	spin_lock(&drvdata->spinlock);
> +	if (csdev->refcnt == 0)
> +		trace_noc_enable_hw(drvdata);
> +
> +	csdev->refcnt++;
> +	spin_unlock(&drvdata->spinlock);
> +
> +	dev_dbg(drvdata->dev, "Trace NOC is enabled\n");
> +	return 0;
> +}
> +
> +static void trace_noc_disable_hw(struct trace_noc_drvdata *drvdata)
> +{
> +	writel(0x0, drvdata->base + TRACE_NOC_CTRL);
> +}
> +
> +static void trace_noc_disable(struct coresight_device *csdev, struct coresight_connection *inport,
> +			      struct coresight_connection *outport)
> +{
> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	spin_lock(&drvdata->spinlock);
> +	if (--csdev->refcnt == 0)
> +		trace_noc_disable_hw(drvdata);
> +
> +	spin_unlock(&drvdata->spinlock);
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
> +	drvdata->csdev = coresight_register(&desc);
> +	if (IS_ERR(drvdata->csdev))
> +		return PTR_ERR(drvdata->csdev);
> +
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
> +}
> +
> +static struct amba_id trace_noc_ids[] = {
> +	{
> +		.id     = 0x000f0c00,
> +		.mask   = 0x000fff00,

Is the mask sufficient ? fyi, the tpdm mask was fixed in
commit c8ea5f41b421.

Suzuk


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
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.h b/drivers/hwtracing/coresight/coresight-tnoc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..1291a153412c1c92be530cffe25fb56c2fca0395
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
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
> +#define TRACE_NOC_SYN_VAL	0xFFFF

TRACE_NOC_SYNCR_xx ?

What does VAL indicate ? It sounds too generic to indicate anything 
meaningful. Does it mean, allow all inputs ?

Suzuki

> +
> +/*
> + * struct trace_noc_drvdata - specifics associated to a trace noc component
> + * @base:	memory mapped base address for this component.
> + * @dev:	device node for trace_noc_drvdata.
> + * @csdev:	component vitals needed by the framework.
> + * @spinlock:	only one at a time pls.
> + * @atid:	id for the trace packet.
> + */
> +struct trace_noc_drvdata {
> +	void __iomem		*base;
> +	struct device		*dev;
> +	struct coresight_device	*csdev;
> +	spinlock_t		spinlock; /* lock for the drvdata. */
> +	u32			atid;
> +};
> 


