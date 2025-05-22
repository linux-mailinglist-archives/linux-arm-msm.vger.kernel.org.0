Return-Path: <linux-arm-msm+bounces-59050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED41AC0C38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 15:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7ED97B0B21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 13:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA7328BAB5;
	Thu, 22 May 2025 13:05:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85E828C006;
	Thu, 22 May 2025 13:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747919144; cv=none; b=ur0YbKWmHYFVjRi9aRbbC1fYCPQxU12QLR6QWuEXFyNG+yEPuMkqt8EjV+4sBnfs+kF3mPKXtDzsxqksCtJsmm0jHe6qPq4EyGiQdLAqmCOzXD7Lqhy2SODnhDsyrAdg4HP+5aIOPFyWAK/Gup+Xuw4uMT1/IMYxoQqV95V7dd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747919144; c=relaxed/simple;
	bh=oig01LIsgk3yWMV4LCcIA/X97cShcWRI+BhGqceMEPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0SJL6dgaT29Mits6WGxfoZiIV0Oti5XMMvBx7A09tLOiQc1XJN2nr25h856wZ5jjNFVKVAZbnNH6GKN9RIffKTzfETYlubySwywcrRiP4IdnNg/z0aG1k+WkYl00//t8sjP/5iOK5MJBYtuhw5AjPXEFOLLfAQrOi0p3wZNCQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D3551A2D;
	Thu, 22 May 2025 06:05:26 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 528DC3F673;
	Thu, 22 May 2025 06:05:40 -0700 (PDT)
Date: Thu, 22 May 2025 14:05:36 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] coresight: add coresight Trace Network On Chip
 driver
Message-ID: <20250522130536.GA2566836@e132581.arm.com>
References: <20250522-trace-noc-v6-0-f5a9bcae90ee@quicinc.com>
 <20250522-trace-noc-v6-2-f5a9bcae90ee@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522-trace-noc-v6-2-f5a9bcae90ee@quicinc.com>

Hi Yuanfang,

On Thu, May 22, 2025 at 04:07:52PM +0800, Yuanfang Zhang wrote:
> Add a driver to support Coresight device Trace Network On Chip (TNOC),
> which is an integration hierarchy integrating functionalities of TPDA
> and funnels. It aggregates the trace and transports to coresight trace
> bus.

The code quality is good for me. However, I still have several minor
comments.

> Compared to current configuration, it has the following advantages:
> 1. Reduce wires between subsystems.
> 2. Continue cleaning the infrastructure.
> 3. Reduce Data overhead by transporting raw data from source to target.
> 
>   +------------------------+                +-------------------------+
>   | Video Subsystem        |                |Video Subsystem          |
>   |       +-------------+  |                |       +------------+    |
>   |       | Video TPDM  |  |                |       | Video TPDM |    |
>   |       +-------------+  |                |       +------------+    |
>   |            |           |                |              |          |
>   |            v           |                |              v          |
>   |   +---------------+    |                |        +-----------+    |
>   |   | Video funnel  |    |                |        |Video TNOC |    |
>   |   +---------------+    |                |        +-----------+    |
>   +------------|-----------+                +------------|------------+
>                |                                         |
>                v-----+                                   |
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
>                  |                                       |
>                  v                                       v
>       +--------------------+                    +------------------+
>       |   Coresight Sink   |                    |  Coresight Sink  |
>       +--------------------+                    +------------------+
> 
>        Current Configuration                            TNOC
> 
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>  drivers/hwtracing/coresight/Kconfig          |  13 ++
>  drivers/hwtracing/coresight/Makefile         |   1 +
>  drivers/hwtracing/coresight/coresight-tnoc.c | 192 +++++++++++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-tnoc.h |  34 +++++
>  4 files changed, 240 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> index ecd7086a5b83e86b6bc8ea039d6d26a628334ed3..f20600d58f38568f8178f69d3f678c2df2cbca7e 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -259,4 +259,17 @@ config CORESIGHT_DUMMY
>  
>  	  To compile this driver as a module, choose M here: the module will be
>  	  called coresight-dummy.
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
>  endif
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 8e62c3150aebd1e82b445fafc97a0a9b44397b0e..880e9ed6bfe9c711492c6a2cd972751f56dd8010 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -34,6 +34,7 @@ obj-$(CONFIG_CORESIGHT_SINK_TPIU) += coresight-tpiu.o
>  obj-$(CONFIG_CORESIGHT_SINK_ETBV10) += coresight-etb10.o
>  obj-$(CONFIG_CORESIGHT_LINKS_AND_SINKS) += coresight-funnel.o \
>  					   coresight-replicator.o
> +obj-$(CONFIG_CORESIGHT_TNOC) += coresight-tnoc.o
>  obj-$(CONFIG_CORESIGHT_SOURCE_ETM3X) += coresight-etm3x.o
>  coresight-etm3x-y := coresight-etm3x-core.o coresight-etm-cp14.o \
>  		     coresight-etm3x-sysfs.o
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..5658501155d322d28e87ff820c7ba8b787eff7ce
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -0,0 +1,192 @@
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
> +	spin_lock(&drvdata->spinlock);

        scoped_guard(spinlock, &drvdata->spinlock) {

        }

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

It is not necessary to use a function to encapsulate single operations.

Please drop the function trace_noc_disable_hw() and directly use
writel() in the call site.

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
> +	drvdata->csdev = coresight_register(&desc);
> +	if (IS_ERR(drvdata->csdev))
> +		return PTR_ERR(drvdata->csdev);

Invoke coresight_trace_id_put_system_id() for registration failure.

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
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.h b/drivers/hwtracing/coresight/coresight-tnoc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..34c696965ec50e3664d55e04e22d5b854d6937a7
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
> +#define TRACE_NOC_SYNC_INTERVAL	0xFFFF
> +
> +/*
> + * struct trace_noc_drvdata - specifics associated to a trace noc component
> + * @base:	memory mapped base address for this component.
> + * @dev:	device node for trace_noc_drvdata.
> + * @csdev:	component vitals needed by the framework.
> + * @spinlock:	only one at a time pls.

Change to "serialize enable/disable operations" ?

> + * @atid:	id for the trace packet.
> + */
> +struct trace_noc_drvdata {
> +	void __iomem		*base;
> +	struct device		*dev;
> +	struct coresight_device	*csdev;
> +	spinlock_t		spinlock; /* lock for the drvdata. */

Remove comment "lock for the drvdata" ?  As it has been described in
the head comments.

> +	u32			atid;
> +};

Please move the content into coresight-tnoc.c and drop the header.

The definitions are private for the driver, it is not necessary to
maintain them in a header.


> 
> -- 
> 2.34.1
> 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org

