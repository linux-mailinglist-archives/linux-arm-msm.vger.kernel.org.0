Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E63A5530E1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 May 2022 12:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233525AbiEWJmb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 May 2022 05:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233734AbiEWJk6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 May 2022 05:40:58 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1FD422F007;
        Mon, 23 May 2022 02:40:52 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6531139F;
        Mon, 23 May 2022 02:40:51 -0700 (PDT)
Received: from [10.57.34.201] (unknown [10.57.34.201])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 491623F73D;
        Mon, 23 May 2022 02:40:49 -0700 (PDT)
Message-ID: <362a330e-593a-edbc-4360-4573c97a1479@arm.com>
Date:   Mon, 23 May 2022 10:40:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v7 07/10] Coresight: Add TPDA link driver
To:     Mao Jinlong <quic_jinlmao@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mike Leach <mike.leach@linaro.org>
Cc:     Leo Yan <leo.yan@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Hao Zhang <quic_hazha@quicinc.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20220509133947.20987-1-quic_jinlmao@quicinc.com>
 <20220509133947.20987-8-quic_jinlmao@quicinc.com>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20220509133947.20987-8-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-10.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/05/2022 14:39, Mao Jinlong wrote:
> TPDA(Trace, Profiling and Diagnostics Aggregator) is
> to provide packetization, funneling and timestamping of
> TPDM data. Multiple monitors are connected to different
> input ports of TPDA.This change is to add tpda
> enable/disable/probe functions for coresight tpda driver.
> 
>   - - - -         - - - -        - - - -
> | TPDM 0|      | TPDM 1 |     | TPDM 2|
>   - - - -         - - - -        - - - -
>      |               |             |
>      |_ _ _ _ _ _    |     _ _ _ _ |
>                  |   |    |
>                  |   |    |
>             ------------------
>            |        TPDA      |
>             ------------------
> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>   drivers/hwtracing/coresight/Kconfig          |  11 +
>   drivers/hwtracing/coresight/Makefile         |   1 +
>   drivers/hwtracing/coresight/coresight-tpda.c | 201 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h |  33 +++
>   4 files changed, 246 insertions(+)
>   create mode 100644 drivers/hwtracing/coresight/coresight-tpda.c
>   create mode 100644 drivers/hwtracing/coresight/coresight-tpda.h
> 
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> index 5c506a1cd08f..447919565326 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -205,6 +205,7 @@ config CORESIGHT_TRBE
>   config CORESIGHT_TPDM
>   	tristate "CoreSight Trace, Profiling & Diagnostics Monitor driver"
>   	select CORESIGHT_LINKS_AND_SINKS
> +	select CORESIGHT_TPDA
>   	help
>   	  This driver provides support for configuring monitor. Monitors are
>   	  primarily responsible for data set collection and support the
> @@ -214,4 +215,14 @@ config CORESIGHT_TPDM
>   	  To compile this driver as a module, choose M here: the module will be
>   	  called coresight-tpdm.
>   
> +config CORESIGHT_TPDA
> +	tristate "CoreSight Trace, Profiling & Diagnostics Aggregator driver"
> +	help
> +	  This driver provides support for configuring aggregator. This is
> +	  primarily useful for pulling the data sets from one or more
> +	  attached monitors and pushing the resultant data out. Multiple
> +	  monitors are connected on different input ports of TPDA.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called coresight-tpda.
>   endif
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 6bb9b1746bc7..1712d82e7260 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -26,5 +26,6 @@ obj-$(CONFIG_CORESIGHT_CATU) += coresight-catu.o
>   obj-$(CONFIG_CORESIGHT_CTI) += coresight-cti.o
>   obj-$(CONFIG_CORESIGHT_TRBE) += coresight-trbe.o
>   obj-$(CONFIG_CORESIGHT_TPDM) += coresight-tpdm.o
> +obj-$(CONFIG_CORESIGHT_TPDA) += coresight-tpda.o
>   coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
>   		   coresight-cti-sysfs.o
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> new file mode 100644
> index 000000000000..126286e89679
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -0,0 +1,201 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/amba/bus.h>
> +#include <linux/bitmap.h>
> +#include <linux/coresight.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/fs.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include "coresight-priv.h"
> +#include "coresight-tpda.h"
> +#include "coresight-trace-id.h"
> +
> +DEFINE_CORESIGHT_DEVLIST(tpda_devs, "tpda");
> +
> +/* Settings pre enabling port control register */
> +static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
> +{
> +	u32 val;
> +
> +	val = readl_relaxed(drvdata->base + TPDA_CR);
> +	/* Bits 6 ~ 12 is for atid value */

minor nit, please could we use FIELD_PREP() and define the
ATID field in the TPDA_CR accordingly ?

> +	val |= (drvdata->atid << 6)

then we could have :

	val |= FIELD_PREP(TPDA_CR_ATID, drvdata->atid);

> +	writel_relaxed(val, drvdata->base + TPDA_CR);
> +}
> +
> +static void tpda_enable_port(struct tpda_drvdata *drvdata, int port)
> +{
> +	u32 val;
> +
> +	val = readl_relaxed(drvdata->base + TPDA_Pn_CR(port));
> +	/* Enable the port */
> +	val |= TPDA_Pn_CR_ENA;
> +	writel_relaxed(val, drvdata->base + TPDA_Pn_CR(port));
> +}
> +
> +static void _tpda_enable(struct tpda_drvdata *drvdata, int port)

minor nit: Similar to the tpdm, comment please use __tpda_{enable,disable}()

> +{
> +	CS_UNLOCK(drvdata->base);
> +
> +	if (!drvdata->enable)
> +		tpda_enable_pre_port(drvdata);
> +
> +	tpda_enable_port(drvdata, port);
> +
> +	CS_LOCK(drvdata->base);
> +}
> +
> +static int tpda_enable(struct coresight_device *csdev, int inport, int outport)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	mutex_lock(&drvdata->lock);
> +	_tpda_enable(drvdata, inport);
> +	drvdata->enable = true;

I am wondering if this is good enough ? Do we need a refcount ?
e.g, multiple TPDMs could be enabled independently and disabled
indpendently. And the tpda must stay alive until the last "source"
is gone away ?

> +	mutex_unlock(&drvdata->lock);
> +
> +	dev_info(drvdata->dev, "TPDA inport %d enabled\n", inport);
> +	return 0;
> +}
> +
> +static void _tpda_disable(struct tpda_drvdata *drvdata, int port)
> +{
> +	u32 val;
> +
> +	CS_UNLOCK(drvdata->base);
> +
> +	val = readl_relaxed(drvdata->base + TPDA_Pn_CR(port));
> +	val &= ~TPDA_Pn_CR_ENA;
> +	writel_relaxed(val, drvdata->base + TPDA_Pn_CR(port));
> +
> +	CS_LOCK(drvdata->base);
> +}
> +
> +static void tpda_disable(struct coresight_device *csdev, int inport,
> +			   int outport)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	mutex_lock(&drvdata->lock);
> +	_tpda_disable(drvdata, inport);
> +	drvdata->enable = false;

This is not sufficient. We need to make sure the TPDA has a refcount of
the enabled ports.

> +	mutex_unlock(&drvdata->lock);
> +
> +	dev_info(drvdata->dev, "TPDA inport %d disabled\n", inport);
> +}
> +
> +static const struct coresight_ops_link tpda_link_ops = {
> +	.enable		= tpda_enable,
> +	.disable	= tpda_disable,
> +};
> +
> +static const struct coresight_ops tpda_cs_ops = {
> +	.link_ops	= &tpda_link_ops,
> +};
> +
> +static int tpda_init_default_data(struct tpda_drvdata *drvdata)
> +{
> +	int atid;
> +	/*
> +	 * TPDA must has a unique atid. This atid can uniquely
> +	 * identify the TPDM trace source connect to the TPDA.

nit: s/connect/connected/

Also how do we identify the different TPDM sources
connected using a single atid ? Looking at the patch description
it is possible to have multiple TPDMs connected to a single TPDA.

> +	 */
> +	atid = coresight_trace_id_get_system_id(coresight_get_trace_id_map());
> +	if (atid < 0)
> +		return atid;
> +
> +	drvdata->atid = atid;
> +	return 0;
> +}
> +
> +static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
> +{
> +	int ret;
> +	struct device *dev = &adev->dev;
> +	struct coresight_platform_data *pdata;
> +	struct tpda_drvdata *drvdata;
> +	struct coresight_desc desc = { 0 };
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
> +	mutex_init(&drvdata->lock);
> +
> +	ret = tpda_init_default_data(drvdata);
> +	if (ret)
> +		return ret;
> +
> +	desc.name = coresight_alloc_device_name(&tpda_devs, dev);
> +	if (!desc.name)
> +		return -ENOMEM;
> +	desc.type = CORESIGHT_DEV_TYPE_LINK;
> +	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
> +	desc.ops = &tpda_cs_ops;
> +	desc.pdata = adev->dev.platform_data;
> +	desc.dev = &adev->dev;

desc.access must be initialised.

> +	drvdata->csdev = coresight_register(&desc);
> +	if (IS_ERR(drvdata->csdev))
> +		return PTR_ERR(drvdata->csdev);
> +
> +	pm_runtime_put(&adev->dev);
> +
> +	dev_dbg(drvdata->dev, "TPDA initialized\n");
> +	return 0;
> +}
> +
> +static void __exit tpda_remove(struct amba_device *adev)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(&adev->dev);
> +
> +	coresight_unregister(drvdata->csdev);
> +}
> +
> +/*
> + * Different TPDA has different periph id.
> + * The difference is 0-7 bits' value. So ignore 0-7 bits.
> + */
> +static struct amba_id tpda_ids[] = {
> +	{
> +		.id     = 0x000f0f00,
> +		.mask   = 0x000fff00,
> +	},
> +	{ 0, 0},
> +};
> +
> +static struct amba_driver tpda_driver = {
> +	.drv = {
> +		.name   = "coresight-tpda",
> +		.owner	= THIS_MODULE,
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe          = tpda_probe,
> +	.remove		= tpda_remove,
> +	.id_table	= tpda_ids,
> +};
> +
> +module_amba_driver(tpda_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Trace, Profiling & Diagnostic Aggregator driver");
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
> new file mode 100644
> index 000000000000..6df1b72b3b76
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _CORESIGHT_CORESIGHT_TPDA_H
> +#define _CORESIGHT_CORESIGHT_TPDA_H
> +
> +#define TPDA_CR			(0x000)
> +#define TPDA_Pn_CR(n)		(0x004 + (n * 4))
> +/* Aggregator port enable bit */
> +#define TPDA_Pn_CR_ENA		BIT(0)
> +
> +#define TPDA_MAX_INPORTS	32

Please add the bit fields for  TPDA_CR_ATID here and use
the FIELD_PREP()

#define TPDA_CR_ATID			GENMASK(12, 6)

> +
> +/**
> + * struct tpda_drvdata - specifics associated to an TPDA component
> + * @base:       memory mapped base address for this component.
> + * @dev:        The device entity associated to this component.
> + * @csdev:      component vitals needed by the framework.
> + * @lock:       lock for the enable value.
> + * @enable:     enable status of the component.
> + */
> +struct tpda_drvdata {
> +	void __iomem		*base;
> +	struct device		*dev;
> +	struct coresight_device	*csdev;
> +	struct mutex		lock;

Why mutex and not spinlock ?

> +	bool			enable;
> +	u32			atid;

	u8 atid ?


Suzuki
