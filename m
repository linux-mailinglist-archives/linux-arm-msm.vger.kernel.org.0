Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF4598537F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 21:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388425AbfHGTT1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Aug 2019 15:19:27 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38750 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730363AbfHGTT1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Aug 2019 15:19:27 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x77JJMq6018547;
        Wed, 7 Aug 2019 14:19:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565205562;
        bh=I5l7tZpOLVvaDo0sBDjPB0O3mDYenNENMAEUJH7tedU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=NcHhucRsHKo0wH4KS9iUq7GD/Cd8VzjMK1W0Xg/XNMGwI4FAyc1wJurAf3YIC1bhO
         gr80njb6TeM/mDIdAvCyou469DU5xhGpiG5j9UvJpVGUKek6bcFNN7zQRP4eSQbmrO
         SsFQHKlaWHXXMjpOCipQF43lYZB0lLDhDzZdsr9Q=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x77JJMNi004877
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Aug 2019 14:19:22 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 14:19:22 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 14:19:22 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x77JJM3P066406;
        Wed, 7 Aug 2019 14:19:22 -0500
Subject: Re: [PATCH 1/9] remoteproc: qcom: Introduce driver to store pil info
 in IMEM
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
CC:     Andy Gross <agross@kernel.org>, Sibi Sankar <sibis@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>
References: <20190807053942.9836-1-bjorn.andersson@linaro.org>
 <20190807053942.9836-2-bjorn.andersson@linaro.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <1ad356a7-760b-fb1d-076a-a70e238acd97@ti.com>
Date:   Wed, 7 Aug 2019 14:19:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190807053942.9836-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/7/19 12:39 AM, Bjorn Andersson wrote:
> A region in IMEM is used to communicate load addresses of remoteproc to
> post mortem debug tools. Implement a driver that can be used to store
> this information in order to enable these tools to process collected
> ramdumps.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/Kconfig         |   3 +
>  drivers/remoteproc/Makefile        |   1 +
>  drivers/remoteproc/qcom_pil_info.c | 139 +++++++++++++++++++++++++++++
>  drivers/remoteproc/qcom_pil_info.h |   6 ++
>  4 files changed, 149 insertions(+)
>  create mode 100644 drivers/remoteproc/qcom_pil_info.c
>  create mode 100644 drivers/remoteproc/qcom_pil_info.h
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 28ed306982f7..3984bd16e670 100644
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
> diff --git a/drivers/remoteproc/qcom_pil_info.c b/drivers/remoteproc/qcom_pil_info.c
> new file mode 100644
> index 000000000000..aa42732016f3
> --- /dev/null
> +++ b/drivers/remoteproc/qcom_pil_info.c
> @@ -0,0 +1,139 @@
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
> +#define PIL_INFO_ENTRIES (PIL_INFO_SIZE / sizeof(struct pil_reloc_entry))
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
> +void qcom_pil_info_store(const char *image, phys_addr_t base, size_t size)
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
> +	if (idx) {
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
> +	if (IS_ERR(reloc->map))
> +		return PTR_ERR(reloc->map);
> +
> +	if (of_property_read_u32(pdev->dev.of_node, "offset", &reloc->offset))
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
> diff --git a/drivers/remoteproc/qcom_pil_info.h b/drivers/remoteproc/qcom_pil_info.h
> new file mode 100644
> index 000000000000..c30c186b665d
> --- /dev/null
> +++ b/drivers/remoteproc/qcom_pil_info.h
> @@ -0,0 +1,6 @@

Please add a SPDX license identifier.

regards
Suman

> +#ifndef __QCOM_PIL_INFO_H__
> +#define __QCOM_PIL_INFO_H__
> +
> +void qcom_pil_info_store(const char *image, phys_addr_t base, size_t size);
> +
> +#endif
> 

