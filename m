Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4437145ED3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 23:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbgAVW5B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 17:57:01 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:15350 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726004AbgAVW5B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 17:57:01 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579733820; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=6Q/w18BMl3i2dx6uQiAibJyd6QCMOZQF1sn6sEp4QGs=;
 b=ogr2HarqSxYqEvO7krzqXXkkw4gZZlJs3Dy8nWflkqkDRyAEHOCZtXA4ManKkuTPu8HdLgG3
 kJK4F2srg5VYA5CMVy5bWZ56ySLCEzGS8XW9pSWKbSJy25TiP1LCleM7UbhbqQ91oDS7xnbu
 XVVPWevg1AwCbQZSptktRMsWvIg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e28d33b.7fb4aaa301b8-smtp-out-n01;
 Wed, 22 Jan 2020 22:56:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EDEE5C447A1; Wed, 22 Jan 2020 22:56:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EE3ADC433CB;
        Wed, 22 Jan 2020 22:56:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 22 Jan 2020 14:56:56 -0800
From:   rishabhb@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v2 2/8] remoteproc: qcom: Introduce driver to store pil
 info in IMEM
In-Reply-To: <20191227053215.423811-3-bjorn.andersson@linaro.org>
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-3-bjorn.andersson@linaro.org>
Message-ID: <60c10082ba90fbba0f056df8575d205f@codeaurora.org>
X-Sender: rishabhb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-12-26 21:32, Bjorn Andersson wrote:
> A region in IMEM is used to communicate load addresses of remoteproc to
> post mortem debug tools. Implement a driver that can be used to store
> this information in order to enable these tools to process collected
> ramdumps.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Added helper to probe defer clients
> - Fixed logical bug in slot scan
> - Added SPDX header in header file
> 
>  drivers/remoteproc/Kconfig         |   3 +
>  drivers/remoteproc/Makefile        |   1 +
>  drivers/remoteproc/qcom_pil_info.c | 150 +++++++++++++++++++++++++++++
>  drivers/remoteproc/qcom_pil_info.h |   8 ++
>  4 files changed, 162 insertions(+)
>  create mode 100644 drivers/remoteproc/qcom_pil_info.c
>  create mode 100644 drivers/remoteproc/qcom_pil_info.h
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 94afdde4bc9f..0798602e355a 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -85,6 +85,9 @@ config KEYSTONE_REMOTEPROC
>  	  It's safe to say N here if you're not interested in the Keystone
>  	  DSPs or just want to use a bare minimum kernel.
> 
> +config QCOM_PIL_INFO
> +	tristate
> +
>  config QCOM_RPROC_COMMON
>  	tristate
> 
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index 00f09e658cb3..c1b46e9033cb 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
>  obj-$(CONFIG_WKUP_M3_RPROC)		+= wkup_m3_rproc.o
>  obj-$(CONFIG_DA8XX_REMOTEPROC)		+= da8xx_remoteproc.o
>  obj-$(CONFIG_KEYSTONE_REMOTEPROC)	+= keystone_remoteproc.o
> +obj-$(CONFIG_QCOM_PIL_INFO)		+= qcom_pil_info.o
>  obj-$(CONFIG_QCOM_RPROC_COMMON)		+= qcom_common.o
>  obj-$(CONFIG_QCOM_Q6V5_COMMON)		+= qcom_q6v5.o
>  obj-$(CONFIG_QCOM_Q6V5_ADSP)		+= qcom_q6v5_adsp.o
> diff --git a/drivers/remoteproc/qcom_pil_info.c
> b/drivers/remoteproc/qcom_pil_info.c
> new file mode 100644
> index 000000000000..b0897ae9eae5
> --- /dev/null
> +++ b/drivers/remoteproc/qcom_pil_info.c
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2019 Linaro Ltd.
> + */
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/mutex.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/slab.h>
> +
> +struct pil_reloc_entry {
> +	char name[8];
> +	__le64 base;
> +	__le32 size;
> +} __packed;
> +
> +#define PIL_INFO_SIZE	200
> +#define PIL_INFO_ENTRIES (PIL_INFO_SIZE / sizeof(struct 
> pil_reloc_entry))
> +
> +struct pil_reloc {
> +	struct device *dev;
> +	struct regmap *map;
> +	u32 offset;
> +	int val_bytes;
> +
> +	struct pil_reloc_entry entries[PIL_INFO_ENTRIES];
> +};
> +
> +static struct pil_reloc *_reloc;
> +static DEFINE_MUTEX(reloc_mutex);
> +
> +/**
> + * qcom_pil_info_store() - store PIL information of image in IMEM
> + * @image:	name of the image
> + * @base:	base address of the loaded image
> + * @size:	size of the loaded image
> + */
> +void qcom_pil_info_store(const char *image, phys_addr_t base, size_t 
> size)
> +{
> +	struct pil_reloc_entry *entry;
> +	int idx = -1;
> +	int i;
> +
> +	mutex_lock(&reloc_mutex);
> +	if (!_reloc)
> +		goto unlock;
> +
> +	for (i = 0; i < PIL_INFO_ENTRIES; i++) {
> +		if (!_reloc->entries[i].name[0]) {
> +			if (idx == -1)
> +				idx = i;
> +			continue;
> +		}
> +
> +		if (!strncmp(_reloc->entries[i].name, image, 8)) {
> +			idx = i;
> +			goto found;
> +		}
> +	}
> +
> +	if (idx == -1) {
> +		dev_warn(_reloc->dev, "insufficient PIL info slots\n");
> +		goto unlock;
> +	}
> +
> +found:
> +	entry = &_reloc->entries[idx];
> +	stracpy(entry->name, image);
> +	entry->base = base;
> +	entry->size = size;
> +
> +	regmap_bulk_write(_reloc->map, _reloc->offset + idx * sizeof(*entry),
> +			  entry, sizeof(*entry) / _reloc->val_bytes);
> +
> +unlock:
> +	mutex_unlock(&reloc_mutex);
> +}
> +EXPORT_SYMBOL_GPL(qcom_pil_info_store);
> +
> +/**
> + * qcom_pil_info_available() - query if the pil info is probed
> + *
> + * Return: boolean indicating if the pil info device is probed
> + */
> +bool qcom_pil_info_available(void)
> +{
> +	return !!_reloc;
> +}
> +EXPORT_SYMBOL_GPL(qcom_pil_info_available);
> +
> +static int pil_reloc_probe(struct platform_device *pdev)
> +{
> +	struct pil_reloc *reloc;
> +
> +	reloc = devm_kzalloc(&pdev->dev, sizeof(*reloc), GFP_KERNEL);
> +	if (!reloc)
> +		return -ENOMEM;
> +
> +	reloc->dev = &pdev->dev;
> +	reloc->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
If there are multiple entries like "pil-reloc" in the imem node
mapping the entire imem multiple times may not work. Is there a way
we can somehow just iomap the required region for pil?
> +	if (IS_ERR(reloc->map))
> +		return PTR_ERR(reloc->map);
> +
> +	if (of_property_read_u32(pdev->dev.of_node, "offset", 
> &reloc->offset))
> +		return -EINVAL;
> +
> +	reloc->val_bytes = regmap_get_val_bytes(reloc->map);
> +	if (reloc->val_bytes < 0)
> +		return -EINVAL;
> +
> +	regmap_bulk_write(reloc->map, reloc->offset, reloc->entries,
> +			  sizeof(reloc->entries) / reloc->val_bytes);
> +
> +	mutex_lock(&reloc_mutex);
> +	_reloc = reloc;
> +	mutex_unlock(&reloc_mutex);
> +
> +	return 0;
> +}
> +
> +static int pil_reloc_remove(struct platform_device *pdev)
> +{
> +	mutex_lock(&reloc_mutex);
> +	_reloc = NULL;
> +	mutex_unlock(&reloc_mutex);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id pil_reloc_of_match[] = {
> +	{ .compatible = "qcom,pil-reloc-info" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, pil_reloc_of_match);
> +
> +static struct platform_driver pil_reloc_driver = {
> +	.probe = pil_reloc_probe,
> +	.remove = pil_reloc_remove,
> +	.driver = {
> +		.name = "qcom-pil-reloc-info",
> +		.of_match_table = pil_reloc_of_match,
> +	},
> +};
> +module_platform_driver(pil_reloc_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm PIL relocation info");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/remoteproc/qcom_pil_info.h
> b/drivers/remoteproc/qcom_pil_info.h
> new file mode 100644
> index 000000000000..0372602fae1d
> --- /dev/null
> +++ b/drivers/remoteproc/qcom_pil_info.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __QCOM_PIL_INFO_H__
> +#define __QCOM_PIL_INFO_H__
> +
> +void qcom_pil_info_store(const char *image, phys_addr_t base, size_t 
> size);
> +bool qcom_pil_info_available(void);
> +
> +#endif
