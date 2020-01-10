Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01058137864
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2020 22:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbgAJVSu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jan 2020 16:18:50 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:55198 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726859AbgAJVSu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jan 2020 16:18:50 -0500
Received: by mail-pj1-f66.google.com with SMTP id kx11so1461413pjb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2020 13:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OsFwSWP/xRcH1cmWjjdOujlzZsNfP9UNbHn7pdTBcQ8=;
        b=CLh5YwP6LHsUQIyC9mN3P/Pg6C/S9QYnJlr15b9bT9RP+Kp9FIHfpxVng5kKNRMvc9
         ml078eP3iGkhrrYHUX2IcROXMuWrGDGyJ/JrEcvvSKnVM11SbdFl6qYyKjzWCWvgtS3r
         XHA4I0+/qe5Ne71x/ra9yKEZGpWsd5/I7Pce8eyEf3xTxL7T4bI81leeuE+8upkMJAbX
         N6myHqYe5mi7ZJNtkU8u33N6Ad1k567Qat7fIACFtxTbpD/vgrgRjZEDoJL40QbdGyLk
         WLg4Gnel81hnCp/7QyA5V8lKrvRSN0+GyZun5sY14gkkBo/ARul8hzRbtD8i7im6NpJU
         qSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OsFwSWP/xRcH1cmWjjdOujlzZsNfP9UNbHn7pdTBcQ8=;
        b=kCPMxOUhv7PRrcmKmPmmZcuRTfI+eK8QM2SZxaprS8LKYW1G7oSfWntb8NMeoly9ct
         EwNIG52TXAPKzAua8viWp/WAqdjSL0NMAKkM6ZtPlowY0BARBYJEheigrxgxobCzHATh
         SJhaIhRpaMLN1hgrgug1/4hhPwqvoIEZuvLs4SY49gQf+RTUz7znV1+tXw10XhWEN87s
         qkuKmg9KaIhdHTp9l5tE+OWM9bRYjC+h7Y2ztlWAcc3X8o34a9Tt3qX+6b3p+0ZBd59Z
         loGSaksmgMZDzGLZPKlE5CDLgvjVFFa8Rd1TLTOPspHYJVha2rBlCtg9wmTqA5QzOmsI
         Wg4A==
X-Gm-Message-State: APjAAAWP1794GdZ6d2CiWLY1NKUbhq7V90bwFLW89IzQFUiquWfO/XnH
        gmCTZ5lPgvAX2UIfF69NWRkLMw==
X-Google-Smtp-Source: APXvYqx5QmlYIay+9x5p3d39RnJ0qBXKwVRiBcjtJHV6SP2kiIY+6PRsneuynDu/VlVsrI00LhHKPw==
X-Received: by 2002:a17:90a:9d8a:: with SMTP id k10mr7230861pjp.91.1578691128908;
        Fri, 10 Jan 2020 13:18:48 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id b8sm4148927pfr.64.2020.01.10.13.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 13:18:47 -0800 (PST)
Date:   Fri, 10 Jan 2020 14:18:46 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: Re: [PATCH v2 2/8] remoteproc: qcom: Introduce driver to store pil
 info in IMEM
Message-ID: <20200110211846.GA11555@xps15>
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191227053215.423811-3-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Thu, Dec 26, 2019 at 09:32:09PM -0800, Bjorn Andersson wrote:
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
> diff --git a/drivers/remoteproc/qcom_pil_info.c b/drivers/remoteproc/qcom_pil_info.c
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

These should be in alphabetical order if there is no depencencies
between them, something checkpatch complains about.

> +
> +struct pil_reloc_entry {
> +	char name[8];

Please add a #define for the name length and reuse it in qcom_pil_info_store()

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

Since it is available, I would use function qcom_pil_info_available().  Also
checkpatch complains about indentation problems related to the 'if' condition
but I can't see what makes it angry.

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

Given how this function is used in the next patch I think an error should be
reported to the caller.

> +	}
> +
> +found:
> +	entry = &_reloc->entries[idx];
> +	stracpy(entry->name, image);

Function stracpy() isn't around in mainline.

> +	entry->base = base;
> +	entry->size = size;
> +
> +	regmap_bulk_write(_reloc->map, _reloc->offset + idx * sizeof(*entry),
> +			  entry, sizeof(*entry) / _reloc->val_bytes);

Same here - the error code should be handled and reported to the caller.  

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

Error code handling.

Thanks,
Mathieu

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
> index 000000000000..0372602fae1d
> --- /dev/null
> +++ b/drivers/remoteproc/qcom_pil_info.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __QCOM_PIL_INFO_H__
> +#define __QCOM_PIL_INFO_H__
> +
> +void qcom_pil_info_store(const char *image, phys_addr_t base, size_t size);
> +bool qcom_pil_info_available(void);
> +
> +#endif
> -- 
> 2.24.0
> 
