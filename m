Return-Path: <linux-arm-msm+bounces-49676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA55A47C63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 12:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4822B1699CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 11:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5792A22C324;
	Thu, 27 Feb 2025 11:39:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4021122B598;
	Thu, 27 Feb 2025 11:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740656358; cv=none; b=FV/2KV1dpbKbe0e1Yukw1eI+seQYJulNXqaouEDAk7jjfgk/Ap0bH4VTDFjqRlmpE2PfHjerMCwa5+02wmCzWu0phBQri5lBLCZhNQA+KfIbOQnjiYZV11Sf4xtt+Pc5Afx34g7Rd8oqc6ES8fNn2bhvyvt0i2FzC0R8bVZZEns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740656358; c=relaxed/simple;
	bh=76JQNPr0d1YHftXurIN9JV44pToHXQwooprUMM6G0RM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+ibO5+nWlzPQYLXS+TQUbPk42sBJIXwvuQomHFQxnSRK4UYSgIWpf3X5JFLEi9KtduCdyWHVe0mcF9vFRlak8Gt4lnUHjBQou+R0BD40gpzRzAokUoL9f3II7cNMH3k+IgBsTfECozRS99dfXwDOQmi23dTjLOUSH6USB94Ftk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1629D15A1;
	Thu, 27 Feb 2025 03:39:31 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 189873F6A8;
	Thu, 27 Feb 2025 03:39:14 -0800 (PST)
Date: Thu, 27 Feb 2025 11:39:10 +0000
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, kernel@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/5] coresight: add coresight Trace NOC driver
Message-ID: <20250227113910.GA2157064@e132581.arm.com>
References: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com>
 <20250226-trace-noc-driver-v2-2-8afc6584afc5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226-trace-noc-driver-v2-2-8afc6584afc5@quicinc.com>

Hi Yuanfang,

On Wed, Feb 26, 2025 at 07:05:51PM +0800, Yuanfang Zhang wrote:
> 
> Add driver to support Coresight device Trace NOC(Network On Chip).
> Trace NOC is an integration hierarchy which is a replacement of
> Dragonlink configuration. It brings together debug components like
> TPDA, funnel and interconnect Trace Noc.
> 
> It sits in the different subsystem of SOC and aggregates the trace
> and transports to QDSS trace bus.
> 
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>  drivers/hwtracing/coresight/Kconfig          |  13 ++
>  drivers/hwtracing/coresight/Makefile         |   1 +
>  drivers/hwtracing/coresight/coresight-tnoc.c | 190 +++++++++++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-tnoc.h |  53 ++++++++
>  4 files changed, 257 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> index 06f0a7594169c5f03ca5f893b7debd294587de78..6cfd160f09d383ab5f5aa276fa57496a52c8f961 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -247,4 +247,17 @@ config CORESIGHT_DUMMY
> 
>           To compile this driver as a module, choose M here: the module will be
>           called coresight-dummy.
> +
> +config CORESIGHT_TNOC
> +       tristate "Coresight Trace Noc driver"
> +       help
> +         This driver provides support for Trace NoC component.
> +         Trace NoC is a interconnect that is used to collect trace from
> +         various subsystems and transport it QDSS trace sink.It sits in

Trace NoC is an interconnect used to collect traces from various
subsystems and transport to a QDSS trace sink.

> +         the different tiles of SOC and aggregates the trace local to the
> +         tile and transports it another tile or to QDSS trace sink eventually.
> +
> +         To compile this driver as a module, choose M here: the module will be
> +         called coresight-tnoc.
> +
>  endif
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 4ba478211b318ea5305f9f98dda40a041759f09f..60b729979f19c8f8848c77c290605132dba1a991 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -34,6 +34,7 @@ obj-$(CONFIG_CORESIGHT_SINK_TPIU) += coresight-tpiu.o
>  obj-$(CONFIG_CORESIGHT_SINK_ETBV10) += coresight-etb10.o
>  obj-$(CONFIG_CORESIGHT_LINKS_AND_SINKS) += coresight-funnel.o \
>                                            coresight-replicator.o
> +obj-$(CONFIG_CORESIGHT_TNOC) += coresight-tnoc.o
>  obj-$(CONFIG_CORESIGHT_SOURCE_ETM3X) += coresight-etm3x.o
>  coresight-etm3x-y := coresight-etm3x-core.o coresight-etm-cp14.o \
>                      coresight-etm3x-sysfs.o
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..fad8e61f05ef25989aba1be342c547f835e8953a
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include <linux/amba/bus.h>
> +#include <linux/io.h>
> +#include <linux/coresight.h>
> +#include <linux/of.h>

Please include headers in alphabetical ordering.

> +#include "coresight-priv.h"
> +#include "coresight-tnoc.h"
> +#include "coresight-trace-id.h"
> +
> +static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
> +{
> +       u32 val;
> +
> +       /* Set ATID */
> +       writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
> +
> +       /* Config sync CR */
> +       writel_relaxed(0xffff, drvdata->base + TRACE_NOC_SYNCR);
> +
> +       /* Set frequency value */
> +       writel_relaxed(drvdata->freq_req_val, drvdata->base + TRACE_NOC_FREQVAL);
> +
> +       /* Set Ctrl register */
> +       val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
> +
> +       if (drvdata->flag_type == FLAG_TS)
> +               val = val | TRACE_NOC_CTRL_FLAGTYPE;
> +       else
> +               val = val & ~TRACE_NOC_CTRL_FLAGTYPE;
> +
> +       if (drvdata->freq_type == FREQ_TS)
> +               val = val | TRACE_NOC_CTRL_FREQTYPE;
> +       else
> +               val = val & ~TRACE_NOC_CTRL_FREQTYPE;
> +
> +       val = val | TRACE_NOC_CTRL_PORTEN;
> +       writel_relaxed(val, drvdata->base + TRACE_NOC_CTRL);

It is fine for using writel_relaxed() for continuous writing into the
same component.  However, the last writing into TRACE_NOC_CTRL enales
the NOC but without any barrier guard, it might cause the out-of-order
issue with Arm CoreSight modules (or any other relevant endpoints).

I'd like suggest to use writel() for writing TRACE_NOC_CTRL.

> +       dev_dbg(drvdata->dev, "Trace NOC is enabled\n");
> +}
> +
> +static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
> +                           struct coresight_connection *outport)
> +{
> +       struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +       spin_lock(&drvdata->spinlock);
> +       if (csdev->refcnt == 0)

AFAICT csdev->refcnt is only used in sink drivers.  This driver is for
funnel, it should use `inport->dest_refcnt` as the counter.

> +               trace_noc_enable_hw(drvdata);
> +
> +       csdev->refcnt++;
> +       spin_unlock(&drvdata->spinlock);
> +
> +       return 0;
> +}
> +
> +static void trace_noc_disable_hw(struct trace_noc_drvdata *drvdata)
> +{
> +       writel_relaxed(0x0, drvdata->base + TRACE_NOC_CTRL);

Same with the comment above for using writel() to replace
writel_relaxed().

> +       dev_dbg(drvdata->dev, "Trace NOC is disabled\n");
> +}
> +
> +static void trace_noc_disable(struct coresight_device *csdev, struct coresight_connection *inport,
> +                             struct coresight_connection *outport)
> +{
> +       struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +       spin_lock(&drvdata->spinlock);
> +       if (--csdev->refcnt == 0)
> +               trace_noc_disable_hw(drvdata);
> +
> +       spin_unlock(&drvdata->spinlock);
> +       dev_info(drvdata->dev, "Trace NOC is disabled\n");
> +}
> +
> +static const struct coresight_ops_link trace_noc_link_ops = {
> +       .enable         = trace_noc_enable,
> +       .disable        = trace_noc_disable,
> +};
> +
> +static const struct coresight_ops trace_noc_cs_ops = {
> +       .link_ops       = &trace_noc_link_ops,
> +};
> +
> +static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
> +{
> +       int atid;
> +
> +       atid = coresight_trace_id_get_system_id();
> +       if (atid < 0)
> +               return atid;
> +
> +       drvdata->atid = atid;
> +
> +       drvdata->freq_type = FREQ_TS;

I don't see anywhere uses FREQ.  Please remove the unused definitions
and related code.

> +       drvdata->flag_type = FLAG;

FLAG_TS is not used in the driver as well.  Remove it.

> +       drvdata->freq_req_val = 0;
> +
> +       return 0;
> +}
> +
> +static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
> +{
> +       struct device *dev = &adev->dev;
> +       struct coresight_platform_data *pdata;
> +       struct trace_noc_drvdata *drvdata;
> +       struct coresight_desc desc = { 0 };
> +       int ret;
> +
> +       desc.name = coresight_alloc_device_name(&trace_noc_devs, dev);
> +       if (!desc.name)
> +               return -ENOMEM;
> +       pdata = coresight_get_platform_data(dev);
> +       if (IS_ERR(pdata))
> +               return PTR_ERR(pdata);
> +       adev->dev.platform_data = pdata;
> +
> +       drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +       if (!drvdata)
> +               return -ENOMEM;
> +
> +       drvdata->dev = &adev->dev;
> +       dev_set_drvdata(dev, drvdata);
> +
> +       drvdata->base = devm_ioremap_resource(dev, &adev->res);
> +       if (!drvdata->base)
> +               return -ENOMEM;
> +
> +       spin_lock_init(&drvdata->spinlock);
> +
> +       ret = trace_noc_init_default_data(drvdata);
> +       if (ret)
> +               return ret;
> +
> +       desc.ops = &trace_noc_cs_ops;
> +       desc.type = CORESIGHT_DEV_TYPE_LINK;
> +       desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
> +       desc.pdata = adev->dev.platform_data;
> +       desc.dev = &adev->dev;
> +       desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
> +       drvdata->csdev = coresight_register(&desc);
> +       if (IS_ERR(drvdata->csdev))
> +               return PTR_ERR(drvdata->csdev);
> +
> +       pm_runtime_put(&adev->dev);
> +
> +       return 0;
> +}
> +
> +static void trace_noc_remove(struct amba_device *adev)
> +{
> +       struct trace_noc_drvdata *drvdata = dev_get_drvdata(&adev->dev);
> +
> +       coresight_trace_id_put_system_id(drvdata->atid);
> +       coresight_unregister(drvdata->csdev);
> +}
> +
> +static struct amba_id trace_noc_ids[] = {
> +       {
> +               .id     = 0x000f0c00,
> +               .mask   = 0x000fff00,

Unlike Arm CoreSight drivers (the mask value is 0x000fffff in most
cases), could you remind me why here the mask is 0x000fff00?

> +       },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(amba, trace_noc_ids);
> +
> +static struct amba_driver trace_noc_driver = {
> +       .drv = {
> +               .name   = "coresight-trace-noc",
> +               .owner  = THIS_MODULE,

I don't think you need to explicitly set `THIS_MODULE`, as this will
be set default by amba_driver_register().

> +               .suppress_bind_attrs = true,
> +       },
> +       .probe          = trace_noc_probe,
> +       .remove         = trace_noc_remove,
> +       .id_table       = trace_noc_ids,
> +};
> +
> +module_amba_driver(trace_noc_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Trace NOC driver");
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.h b/drivers/hwtracing/coresight/coresight-tnoc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..b6bd1ef659897d8e0994c5e8514e8cbdd16eebd8
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#define TRACE_NOC_CTRL 0x008
> +#define TRACE_NOC_XLD  0x010
> +#define TRACE_NOC_FREQVAL      0x018
> +#define TRACE_NOC_SYNCR        0x020
> +
> +/* Enable generation of output ATB traffic.*/
> +#define TRACE_NOC_CTRL_PORTEN  BIT(0)
> +/* Writing 1 to issue a FREQ or FREQ_TS packet*/
> +#define TRACE_NOC_CTRL_FREQTSREQ       BIT(5)

This is not used.  Remove it.

> +/* Sets the type of issued ATB FLAG packets. 0: 'FLAG' packets; 1: 'FLAG_TS' packets.*/
> +#define TRACE_NOC_CTRL_FLAGTYPE                BIT(7)

> +/* sets the type of issued ATB FREQ packets. 0: 'FREQ' packets; 1: 'FREQ_TS' packets.*/
> +#define TRACE_NOC_CTRL_FREQTYPE                BIT(8)
> +DEFINE_CORESIGHT_DEVLIST(trace_noc_devs, "traceNoc");

It is good to move the definition into C file.

Thanks,
Leo

> +
> +/**
> + * struct trace_noc_drvdata - specifics associated to a trace noc component
> + * @base:      memory mapped base address for this component.
> + * @dev:       device node for trace_noc_drvdata.
> + * @csdev:     component vitals needed by the framework.
> + * @spinlock:  only one at a time pls.
> + * @atid:      id for the trace packet.
> + * @freqtype:  0: 'FREQ' packets; 1: 'FREQ_TS' packets.
> + * @flagtype:  0: 'FLAG' packets; 1: 'FLAG_TS' packets.
> + * @freq_req_val:       set frequency values carried by 'FREQ' and 'FREQ_TS' packets.
> + */
> +struct trace_noc_drvdata {
> +       void __iomem            *base;
> +       struct device           *dev;
> +       struct coresight_device *csdev;
> +       spinlock_t              spinlock; /* lock for the drvdata. */
> +       u32                     atid;
> +       u32                     freq_type;
> +       u32                     flag_type;
> +       u32                     freq_req_val;
> +};
> +
> +/* freq type */
> +enum freq_type {
> +       FREQ,
> +       FREQ_TS,
> +};
> +
> +/* flag type */
> +enum flag_type {
> +       FLAG,
> +       FLAG_TS,
> +};
> 
> --
> 2.34.1
> 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org

