Return-Path: <linux-arm-msm+bounces-64617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1442BB01F1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 16:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF2071CA4F06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 14:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54CF2E7653;
	Fri, 11 Jul 2025 14:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AtUT223i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866892DCF58
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 14:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752244116; cv=none; b=GUCedzEGaaENdA6Ei1GOZ9Qpbe9AaGzQh/iwrb7W+jP2NBXZl+Qa+MlmyaYjCBFqA2qCdORCsl3siD9G8B4PqUS2S0W2gXkpmuYIp2Jab9OS6vFiLQcSwqqLVn1IyQSb3V+lt/Cf8kmwYNjOAjeU7x47t8wJIWeLlZ8QdTN1vW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752244116; c=relaxed/simple;
	bh=5lu9J7vEa5g/Ym4QOLfMfN7IjWP//SMmKc5Fo0NVgCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hVt7AXy4sd501bfuu7YfgiczRsLtVAaskBFVcOVhbP+NHkOQwdiuFxxmKgfRff0Li5HriQchgt/tz8ze8zh5IUoB8FHL0My2xeJeCPovnm88/ewEzCV6f2V2BkGq82qntE3mVJHWHMEE383ESErzyqygqG87HjaCAp9wPGNi90Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AtUT223i; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-748e63d4b05so1354694b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 07:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752244113; x=1752848913; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kavBJrWMoEXOlmfl1NFVvnCa8WpRzs2d/kXFVbejgNU=;
        b=AtUT223ijW/XBeedQbuFZD6UxC318G4PyAl6Tx2EjCciTSeam86th1BUkh3pIyitmc
         Viq8fVpsljF1D5MSRQtYfxWiszgF2odxQ5OAdF1yBc94Nzihv+D4kvTJys50HYD2YPhn
         o7w9sZHJ8YsIYn3hDo9Jm45JSR6By3eC+kumU4rWVSSrO3A2SvZFS5p2DnrDek2X7q+K
         08TjOosVxxdYk+27lOn5GvRjPQ6LZh+ojlhP5w21qRhPuynWYYOIjBUWvUuR95i2wKU3
         NcPCUuvbVPIkUz2wxv9OxI/qnv5tNPzbEaOhEZmdT/84vsJ6HROyJEk655sRTyG7u+hv
         IPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752244113; x=1752848913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kavBJrWMoEXOlmfl1NFVvnCa8WpRzs2d/kXFVbejgNU=;
        b=mP386BgO+cS0/Zl+EYi1HMo1/47f0HD3KbSUr0IOX1zwpLa2c659g25ASPAbEdWo/f
         AXDmQWs2XO3aEvf8TSQqMw/qcnQkqaIUiRkeKl4fpcoaH5rtptpvEEWPHt4wQt8Ove80
         NXXkUriLoIczfGv96f14CaHwfuQverFGaLhwFXedCsQ+AlgkpXnlZ0av3TlaN9WwVuo5
         o/gEDrqjsruwD5Flk26QHX6SwzwGhh4vneMgC+x3wD/BG9SLTyfooYHGBhGXJx+t2vyQ
         FbfoW80XxpBtKR67PI+hoWT1N6J4j3oa4hbENrHtRLIZXWegv1aYonXSaWdOPbAu3/aa
         JNFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFAQpbowjOjqEihmSq1RR35pgqgHG08lKjsZGRj5CyfnAGQavxfhxT7W6GoXKz97ah7vyn+9ejYLh2r9rW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo8CfqFzYv6zfSYlpNf4V+/VPFSU4UyGMBOlS2W5DAxGXeJu6X
	+QF5aq7pNzQHeZfl9O5E4Ad28TGHDeRG4Figg6ur0GeRUDg1/sGAqVYxvE8iUPurWM1+kUJ+2mi
	Ndve4pqS7ydlnH/3l3mzNTWZc0hu8GZ5mXz3p0SRJmg==
X-Gm-Gg: ASbGncv6MVva+3UdsAo5J5qlQn+dY0QP1Db0Aju5SFGZjyXiDianUtVKVIBIAJ9p5Fs
	hZ9mWul7y9oHIpqXJMfg6MCaPXyta+n8M/VUFiyctszC13kkJYQxrpVMLV/NsnI+aJBBzalwcDv
	r14iCEzpfaVgwT72Iaei1ZLI/5PTkntHtzZLeP9oqrtq8VWOl3EuLJxCs7TrgzR+2Y0zJohNXxG
	MZ9vLkvckMYSzj2BwnxPEpA1dMFcRiTlTEXcKNo
X-Google-Smtp-Source: AGHT+IFQEaj4XEmCCZd/lDPyMbe3Az5tjgXWpi25VZ2oSOWrvTAIzBIrbh29POWkk83PSgv9fZuRzT5r2CSPjpUha6A=
X-Received: by 2002:a05:6a00:180c:b0:740:aa31:fe66 with SMTP id
 d2e1a72fcca58-74ee03a14d1mr4867171b3a.4.1752244112974; Fri, 11 Jul 2025
 07:28:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710-trace-noc-v11-0-f849075c40b8@quicinc.com> <20250710-trace-noc-v11-2-f849075c40b8@quicinc.com>
In-Reply-To: <20250710-trace-noc-v11-2-f849075c40b8@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 11 Jul 2025 15:28:21 +0100
X-Gm-Features: Ac12FXwP-5p6tbob2mC_VaXP7_PYnF7qOh1BBZjIaH7H8bD6G7mpriawAwP7p3E
Message-ID: <CAJ9a7ViquNGu=L6AmSf92bQAvEA4UE33y_25wXL=k2EoUH_T2A@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] coresight: add coresight Trace Network On Chip driver
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, kernel@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Jul 2025 at 06:28, Yuanfang Zhang <quic_yuanfang@quicinc.com> wrote:
>
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
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>  drivers/hwtracing/coresight/Kconfig          |  12 ++
>  drivers/hwtracing/coresight/Makefile         |   1 +
>  drivers/hwtracing/coresight/coresight-tnoc.c | 242 +++++++++++++++++++++++++++
>  3 files changed, 255 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> index f064e3d172b3d630515bb3a11450e883a6b5b4bf..6a4239ebb582e95f0ebe8e9c8738a726f27f60a1 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -268,4 +268,16 @@ config CORESIGHT_KUNIT_TESTS
>             Enable Coresight unit tests. Only useful for development and not
>             intended for production.
>
> +config CORESIGHT_TNOC
> +       tristate "Coresight Trace Network On Chip driver"
> +       help
> +         This driver provides support for Trace Network On Chip (TNOC) component.
> +         TNOC is an interconnect used to collect traces from various subsystems
> +         and transport to a coresight trace sink. It sits in the different
> +         tiles of SOC and aggregates the trace local to the tile and transports
> +         it another tile or to coresight trace sink eventually.
> +
> +         To compile this driver as a module, choose M here: the module will be
> +         called coresight-tnoc.
> +
>  endif
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 4e7cc3c5bf994d4066adc3b6c203edd19e88a823..ab16d06783a572ea1308dfb3a30c96df9e5ffdb7 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_CORESIGHT_SINK_TPIU) += coresight-tpiu.o
>  obj-$(CONFIG_CORESIGHT_SINK_ETBV10) += coresight-etb10.o
>  obj-$(CONFIG_CORESIGHT_LINKS_AND_SINKS) += coresight-funnel.o \
>                                            coresight-replicator.o
> +obj-$(CONFIG_CORESIGHT_TNOC) += coresight-tnoc.o
>  obj-$(CONFIG_CORESIGHT_SOURCE_ETM3X) += coresight-etm3x.o
>  coresight-etm3x-y := coresight-etm3x-core.o coresight-etm-cp14.o \
>                      coresight-etm3x-sysfs.o
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..0e4164707eea974e6f34d2de01693354d6eefdcd
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
> +#define TRACE_NOC_SYNC_INTERVAL        0xFFFF
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
> +       void __iomem            *base;
> +       struct device           *dev;
> +       struct coresight_device *csdev;
> +       spinlock_t              spinlock;
> +       u32                     atid;
> +};
> +
> +DEFINE_CORESIGHT_DEVLIST(trace_noc_devs, "traceNoc");
> +
> +static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
> +{
> +       u32 val;
> +
> +       /* Set ATID */
> +       writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
> +
> +       /* Set the data word count between 'SYNC' packets */
> +       writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
> +
> +       /* Set the Control register:
> +        * - Set the FLAG packets to 'FLAG' packets
> +        * - Set the FREQ packets to 'FREQ_TS' packets
> +        * - Enable generation of output ATB traffic
> +        */
> +
> +       val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
> +
> +       val &= ~TRACE_NOC_CTRL_FLAGTYPE;
> +       val |= TRACE_NOC_CTRL_FREQTYPE;
> +       val |= TRACE_NOC_CTRL_PORTEN;
> +
> +       writel(val, drvdata->base + TRACE_NOC_CTRL);
> +}
> +
> +static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
> +                           struct coresight_connection *outport)
> +{
> +       struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +       scoped_guard(spinlock, &drvdata->spinlock) {
> +               if (csdev->refcnt == 0)
> +                       trace_noc_enable_hw(drvdata);
> +
> +               csdev->refcnt++;
> +       }
> +
> +       dev_dbg(drvdata->dev, "Trace NOC is enabled\n");
> +       return 0;
> +}
> +
> +static void trace_noc_disable(struct coresight_device *csdev, struct coresight_connection *inport,
> +                             struct coresight_connection *outport)
> +{
> +       struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +       scoped_guard(spinlock, &drvdata->spinlock) {
> +               if (--csdev->refcnt == 0)
> +                       writel(0x0, drvdata->base + TRACE_NOC_CTRL);
> +       }
> +       dev_dbg(drvdata->dev, "Trace NOC is disabled\n");
> +}
> +
> +static int trace_noc_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> +                       __maybe_unused struct coresight_device *sink)
> +{
> +       struct trace_noc_drvdata *drvdata;
> +
> +       drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +       return drvdata->atid;
> +}
> +
> +static const struct coresight_ops_link trace_noc_link_ops = {
> +       .enable         = trace_noc_enable,
> +       .disable        = trace_noc_disable,
> +};
> +
> +static const struct coresight_ops trace_noc_cs_ops = {
> +       .trace_id       = trace_noc_id,
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
> +       return 0;
> +}
> +
> +static ssize_t traceid_show(struct device *dev,
> +                           struct device_attribute *attr, char *buf)
> +{
> +       unsigned long val;
> +       struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +       val = drvdata->atid;
> +       return sprintf(buf, "%#lx\n", val);
> +}
> +static DEVICE_ATTR_RO(traceid);
> +
> +static struct attribute *coresight_tnoc_attrs[] = {
> +       &dev_attr_traceid.attr,
> +       NULL,
> +};
> +
> +static const struct attribute_group coresight_tnoc_group = {
> +       .attrs = coresight_tnoc_attrs,
> +};
> +
> +static const struct attribute_group *coresight_tnoc_groups[] = {
> +       &coresight_tnoc_group,
> +       NULL,
> +};
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
> +
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
> +       desc.groups = coresight_tnoc_groups;
> +       drvdata->csdev = coresight_register(&desc);
> +       if (IS_ERR(drvdata->csdev)) {
> +               coresight_trace_id_put_system_id(drvdata->atid);
> +               return PTR_ERR(drvdata->csdev);
> +       }
> +       pm_runtime_put(&adev->dev);
> +
> +       return 0;
> +}
> +
> +static void trace_noc_remove(struct amba_device *adev)
> +{
> +       struct trace_noc_drvdata *drvdata = dev_get_drvdata(&adev->dev);
> +
> +       coresight_unregister(drvdata->csdev);
> +       coresight_trace_id_put_system_id(drvdata->atid);
> +}
> +
> +static struct amba_id trace_noc_ids[] = {
> +       {
> +               .id     = 0x000f0c00,
> +               .mask   = 0x00ffff00,
> +       },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(amba, trace_noc_ids);
> +
> +static struct amba_driver trace_noc_driver = {
> +       .drv = {
> +               .name   = "coresight-trace-noc",
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
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.com>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

