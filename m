Return-Path: <linux-arm-msm+bounces-59817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AC5AC7CEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 13:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AB047B31DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 11:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6550B28E596;
	Thu, 29 May 2025 11:27:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4BE2EAE3;
	Thu, 29 May 2025 11:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748518025; cv=none; b=a/7Qj3vFag7pweXiUREXuvJsteUFmOSMGp/YpsBDzYuk0xb9RQekXQBEpYKQa3W981nJJAF/VR/0FHVAu/CyMFyX4PeSU4DtcvtqQnwFhVrtyttAn+njlqEz3UHYYGlhiP1kpY2GmWNMNvNqDX4Pru6/5NJy9d8JSxFNCpUhLBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748518025; c=relaxed/simple;
	bh=4bZbBf/Tw09QcKKjN2QFapnJ05wM5f5d+iwRPrOBKWU=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H/MDzWSZhARNinSCupE6NGSRTP9UKT56I/8Ick+FxcYBgyIrKosyQDisiNNI9pN66dWMYeLcXAT5mprAVPZ7MVAfAfCnyboBRLTbJn12Gr6s5T6KxD2mH47sAvTBzBF/MVafO8EazXyjhSaudZK4ftCTFBx1jNMo6dUhAkSBSPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b7PBM5t2Vz6L5hr;
	Thu, 29 May 2025 19:23:23 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 48F9D1400CA;
	Thu, 29 May 2025 19:27:00 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 29 May
 2025 13:26:59 +0200
Date: Thu, 29 May 2025 12:26:57 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Songwei Chai <quic_songchai@quicinc.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, Andy Gross
	<agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 2/7] coresight: Add coresight TGU driver
Message-ID: <20250529122657.00007f8f@huawei.com>
In-Reply-To: <20250529081949.26493-3-quic_songchai@quicinc.com>
References: <20250529081949.26493-1-quic_songchai@quicinc.com>
	<20250529081949.26493-3-quic_songchai@quicinc.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Thu, 29 May 2025 16:19:43 +0800
Songwei Chai <quic_songchai@quicinc.com> wrote:

> Add driver to support Coresight device TGU (Trigger Generation Unit).
> TGU is a Data Engine which can be utilized to sense a plurality of
> signals and create a trigger into the CTI or generate interrupts to
> processors. Add probe/enable/disable functions for tgu.
> 
> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
Hi

Drive by review as I was curious and might as well comment whilst
taking a look.

Jonathan

> diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
> new file mode 100644
> index 000000000000..a1a02602f7b3
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-tgu.c
> @@ -0,0 +1,213 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/amba/bus.h>
> +#include <linux/coresight.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>

Why?

Probably after

#include <linux/mod_devicetable.h>
for struct amba_id


> +
> +#include "coresight-priv.h"
> +#include "coresight-tgu.h"

> +
> +static int tgu_enable(struct coresight_device *csdev, enum cs_mode mode,
> +		      void *data)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	spin_lock(&drvdata->spinlock);
Maybe consider use of cleanup.h and
	guard(spin_lock)(&drvdata->spinlock);
	if (drvdata->enable)
		return -EBUSY;

	tgu_write_all_hw_regs(drvdata);
	drvdata->enable = true;

	return 0;

> +
> +	if (drvdata->enable) {
> +		spin_unlock(&drvdata->spinlock);
> +		return -EBUSY;
> +	}
> +	tgu_write_all_hw_regs(drvdata);
> +	drvdata->enable = true;
> +
> +	spin_unlock(&drvdata->spinlock);
> +	return 0;
> +}

> +static ssize_t enable_tgu_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	bool enabled;
I'd drop this blank line for consistency with other bits of code
in this file.

> +
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	spin_lock(&drvdata->spinlock);
> +	enabled = drvdata->enable;
> +	spin_unlock(&drvdata->spinlock);
> +
> +	return sysfs_emit(buf, "%d\n", enabled);
> +}

> +static const struct attribute_group tgu_common_grp = {
> +	.attrs = tgu_common_attrs,
> +	{ NULL },
	{ }
is a common simpler syntax for the same thing.
> +};
> +
> +static const struct attribute_group *tgu_attr_groups[] = {
> +	&tgu_common_grp,
> +	NULL,

Common to not put , after terminating entries.  The aim is
to make it hard to put things incorrectly after these.

> +};

> +static void tgu_remove(struct amba_device *adev)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(&adev->dev);
> +
> +	coresight_unregister(drvdata->csdev);

Would probably benefit from a devm_ version allowing the
dropping of the remove() call in this and other drivers.

More of a general comment than one specific to this driver though.

> +}
> +
> +static const struct amba_id tgu_ids[] = {
> +	{
> +		.id = 0x000f0e00,
> +		.mask = 0x000fffff,
> +		.data = "TGU",
> +	},
> +	{ 0, 0, NULL },
{ }

Is effective the same an common form for code setting the sentinel
at the end of an array like this.

> +};
> +
> +MODULE_DEVICE_TABLE(amba, tgu_ids);
> +
> +static struct amba_driver tgu_driver = {
> +	.drv = {
> +		.name = "coresight-tgu",
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe = tgu_probe,
> +	.remove = tgu_remove,
> +	.id_table = tgu_ids,
> +};
> +
> +module_amba_driver(tgu_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("CoreSight TGU driver");
> diff --git a/drivers/hwtracing/coresight/coresight-tgu.h b/drivers/hwtracing/coresight/coresight-tgu.h
> new file mode 100644
> index 000000000000..6c849a2f78fa
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-tgu.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _CORESIGHT_TGU_H
> +#define _CORESIGHT_TGU_H
> +
> +/* Register addresses */
> +#define TGU_CONTROL 0x0000
> +
> +/* Register read/write */
> +#define tgu_writel(drvdata, val, off) __raw_writel((val), drvdata->base + off)
> +#define tgu_readl(drvdata, off) __raw_readl(drvdata->base + off)
> +
> +/**
> + * struct tgu_drvdata - Data structure for a TGU (Trigger Generator Unit)
> + * @base: Memory-mapped base address of the TGU device
> + * @dev: Pointer to the associated device structure
> + * @csdev: Pointer to the associated coresight device
> + * @spinlock: Spinlock for handling concurrent access
> + * @enable: Flag indicating whether the TGU device is enabled
> + *
> + * This structure defines the data associated with a TGU device,
> + * including its base address, device pointers, clock, spinlock for
> + * synchronization, trigger data pointers, maximum limits for various

Not seeing any limits, trigger pointers etc...

> + * trigger-related parameters, and enable status.
> + */
> +struct tgu_drvdata {
> +	void __iomem *base;
> +	struct device *dev;
> +	struct coresight_device *csdev;
> +	spinlock_t spinlock;
> +	bool enable;
> +};
> +
> +#endif
> 
> 


