Return-Path: <linux-arm-msm+bounces-53428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5734A7E543
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 17:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD9B91886458
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 15:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963A1188938;
	Mon,  7 Apr 2025 15:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Di+yFFj4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DAD204681
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 15:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040845; cv=none; b=Qbgv7SYHnWMaLJ7Qrxo7ZrYGEbQj1jS9qItMvtx3dJcKqQTSeqf7258V7+P8U1GbNO00LrRYaPtb3mNbXX4hgBAcUXmsWXpJdV7YqV8cG8aL4rrNBIlENAjLqhOgswjUfZOeOKwRPkL1D2DNwKg6nEu3Ob6slpLWV2cJqMrDmoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040845; c=relaxed/simple;
	bh=j0U2fbSgXRBr6vNHdptvQBAwQiObutNFZ30/QulH+LU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k6xKnCpoHhcYGs6e1pIFMkzhhs6eRUsq2fQ2htSDTXfbxaYl4Q+QTL+kWtjVMbwtVKev+Y4aE2fLV+W/b6vUc/S0Eb0gYjhCTQ1J9ZLKoMT03hAyuA4+jOiYFrE497Nb9l6Kvudhg+Y8mGJeoJMiAGN9/Jvpyv/zPm3qqA/fsig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Di+yFFj4; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so3784446b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 08:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744040843; x=1744645643; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bNy53/ZwTHSLz+zRzyZ238Lusm7CUXwB7x08xN1b9bw=;
        b=Di+yFFj4nsvbiDSX9fPBxWGL5U9e9IiHh6M+1or03DPJHbgQ84YEgO+t7uQ0mkh33n
         PJD0XmMdWS2L2e+Jon1fcWfsUlpS3KTqFBDnXEUIlSHbt94lo44qWDDvuB3fcRsRECYS
         YnKIWVsN/k/sOkm5uVcr8XjzTqRhPD2Xjq3RzDteepQn86Xb/jPf/6R6oGgo2IF2rLay
         wg+agD5r4EyAA3ws2IHzvlfnlHzW2jx6BCZoQW5rdBm2BZTEg6QlQKorV499YV9S5gIi
         MUazoy5nOmKSK8AP4JYEs1RHJM/FfcTxzIXoQRqs3dqoBRgbT7Jg8S+p6wZ+9BOQqTJ/
         TILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744040843; x=1744645643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNy53/ZwTHSLz+zRzyZ238Lusm7CUXwB7x08xN1b9bw=;
        b=BTSFURo9HOM9mdP0P8V8gh1nCCHcuotS2t3/UU3RWb9k1vlnNQQwYQRifVVDduWDKi
         JE2j5BfQj23dd86vBhEkFgB3q95TkwlVBaTjVSYPvVwyH4skFN/Zfv+AUopIhg5iL8dt
         0hgFV0Eq/3SaglUj4LImqgubBxZw+Dd9bFucCqpG8Pw1W7VbTho0e0IqZzzNLtjjvdpq
         Z5xLs9kUaRvew8Qc4YtRBA2/QA5KrhgZkq4ZUyE2dzXFqlkYm0AWW+D6FTFgz54XpDLL
         yi50/VJObwhZ6br+Pq3W4OJbfkJwkjz0TJq+6VpUDQZ7vdKq5j4R9Yo2eH1rEvMtyaRn
         tJQg==
X-Forwarded-Encrypted: i=1; AJvYcCVUbUOJnmMt76op7rdxktL1RUoNFWGXN6zKdjDVLIku7eKYyTvgbxg2vu8t6/u8Lop1SAvbWtZu+cY5tTUr@vger.kernel.org
X-Gm-Message-State: AOJu0YwkiguU3WxaQbJC+XMj4gJckhg3StusOWnsjuclFPxDq4aH+vVi
	AJjeytMiWsL2SXlvEuYdjuaQsmnq/sw7pPP9EdouRsNzLJfB3b7sbOw/SRgCu9JqwqN35hQtm6+
	E+sb/dFp1bCA93eLwcF5+/EY4daErtnOxBDrQ3Q==
X-Gm-Gg: ASbGnctGxY5f5W4+doqx3elpjK12q9GHmSyWN1owREUEK2F+bC7sHd71QMqhudKkjyY
	TdFyn2XldM3TJLaOmkFughBJ2gwy8TTrhCmhbhCbGPrgF/uWDEr1YgbUbAHkJYsVGCJxeQGtzFf
	tmAV65D1iSO+pufe07af/yQ3xA5vQF7MS4Un8+3u1ieD3ShAYhDF/JHv+RWzk=
X-Google-Smtp-Source: AGHT+IFsF8BZ9rpj3D/vrDRwMv4ljfHYt9ZuYNYZ7VfoyGlYWpvoDHXT8dp74ZQrtLPbP7l//cYdzSnBUvRETkNj0IE=
X-Received: by 2002:a05:6a00:4603:b0:736:5dae:6b0d with SMTP id
 d2e1a72fcca58-73b6aa44d71mr11392059b3a.10.1744040842652; Mon, 07 Apr 2025
 08:47:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com> <20250226-trace-noc-driver-v2-2-8afc6584afc5@quicinc.com>
In-Reply-To: <20250226-trace-noc-driver-v2-2-8afc6584afc5@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Mon, 7 Apr 2025 16:47:11 +0100
X-Gm-Features: ATxdqUGwptWmWGuTEMFywAJMbM58Cdy5rm8GMkf77_zrs0cIkHqC_ImQSl0RKT0
Message-ID: <CAJ9a7Vhkp2xBZmjGO9iqCVkJJAt2+Dh+QkRH-BaCMUZ=6G+t4g@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] coresight: add coresight Trace NOC driver
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com, 
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, kernel@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, 26 Feb 2025 at 11:06, Yuanfang Zhang <quic_yuanfang@quicinc.com> wrote:
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
> +
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
> +
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
> +       drvdata->flag_type = FLAG;
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
> +       },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(amba, trace_noc_ids);
> +
> +static struct amba_driver trace_noc_driver = {
> +       .drv = {
> +               .name   = "coresight-trace-noc",
> +               .owner  = THIS_MODULE,
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
> +/* Sets the type of issued ATB FLAG packets. 0: 'FLAG' packets; 1: 'FLAG_TS' packets.*/
> +#define TRACE_NOC_CTRL_FLAGTYPE                BIT(7)
> +/* sets the type of issued ATB FREQ packets. 0: 'FREQ' packets; 1: 'FREQ_TS' packets.*/
> +#define TRACE_NOC_CTRL_FREQTYPE                BIT(8)
> +DEFINE_CORESIGHT_DEVLIST(trace_noc_devs, "traceNoc");

Coresight links do not generate their own packets - please explain
what these are.

As far as I am aware, frequency and flag packets are not part of the
ATB specification.

If the output bus for this device is not in fact an ATB bus, then it
should not be referred to as such.

Thanks and regards

 Mike

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


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

