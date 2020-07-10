Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6904221BB11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 18:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgGJQec (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 12:34:32 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:47817 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727771AbgGJQeb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 12:34:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594398869; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=EXvw5KcZmFj5LFt+45x31Iqp8uhPSfP8AoThSUG3MmE=;
 b=OTl00J/g11ZMRHaGxKiqaAbq0xiMz98RznNJ0NCapxqX51SjkoHaSN1K9UqNAPYWd5/WOPeY
 EA5pUNDg6j+tz8fdP3Kfk0hZC/t3D2QvrbxuB1IWphcj4gWbTOkuDCHWqUOQwPf5MetwTxwv
 nUH072X+XsvcbGAd8Pmeq0m7hKU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f0898788e36ecda308a66b8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 10 Jul 2020 16:34:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7D948C433C6; Fri, 10 Jul 2020 16:34:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 80255C433CA;
        Fri, 10 Jul 2020 16:33:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 10 Jul 2020 09:33:58 -0700
From:   rishabhb@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        linux-remoteproc-owner@vger.kernel.org
Subject: Re: [PATCH v7 2/5] remoteproc: qcom: Introduce helper to store pil
 info in IMEM
In-Reply-To: <20200622191942.255460-3-bjorn.andersson@linaro.org>
References: <20200622191942.255460-1-bjorn.andersson@linaro.org>
 <20200622191942.255460-3-bjorn.andersson@linaro.org>
Message-ID: <9ceeee9b11b6dd14699909fc99b846ee@codeaurora.org>
X-Sender: rishabhb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-06-22 12:19, Bjorn Andersson wrote:
> A region in IMEM is used to communicate load addresses of remoteproc to
> post mortem debug tools. Implement a helper function that can be used 
> to
> store this information in order to enable these tools to process
> collected ramdumps.
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v6:
> - Replaced entry struct and usage of offset_of with a comment and
> defined offsets
> - Renamed pil_reloc_lock
> - Write out upper 32 bits of the address
> - Include header from implementation
> - Add linux/types.h to the header file
> 
>  drivers/remoteproc/Kconfig         |   3 +
>  drivers/remoteproc/Makefile        |   1 +
>  drivers/remoteproc/qcom_pil_info.c | 129 +++++++++++++++++++++++++++++
>  drivers/remoteproc/qcom_pil_info.h |   9 ++
>  4 files changed, 142 insertions(+)
>  create mode 100644 drivers/remoteproc/qcom_pil_info.c
>  create mode 100644 drivers/remoteproc/qcom_pil_info.h
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index c4d1731295eb..f4bd96d1a1a3 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -116,6 +116,9 @@ config KEYSTONE_REMOTEPROC
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
> index e8b886e511f0..fe398f82d550 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -16,6 +16,7 @@ obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
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
> index 000000000000..0536e3904669
> --- /dev/null
> +++ b/drivers/remoteproc/qcom_pil_info.c
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2019-2020 Linaro Ltd.
> + */
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_address.h>
> +#include "qcom_pil_info.h"
> +
> +/*
> + * The PIL relocation information region is used to communicate memory 
> regions
> + * occupied by co-processor firmware for post mortem crash analysis.
> + *
> + * It consists of an array of entries with an 8 byte textual 
> identifier of the
> + * region followed by a 64 bit base address and 32 bit size, both 
> little
> + * endian.
> + */
> +#define PIL_RELOC_NAME_LEN	8
> +#define PIL_RELOC_ENTRY_SIZE	(PIL_RELOC_NAME_LEN + sizeof(__le64) +
> sizeof(__le32))
> +
> +struct pil_reloc {
> +	void __iomem *base;
> +	size_t num_entries;
> +};
> +
> +static struct pil_reloc _reloc __read_mostly;
> +static DEFINE_MUTEX(pil_reloc_lock);
> +
> +static int qcom_pil_info_init(void)
> +{
> +	struct device_node *np;
> +	struct resource imem;
> +	void __iomem *base;
> +	int ret;
> +
> +	/* Already initialized? */
> +	if (_reloc.base)
> +		return 0;
> +
> +	np = of_find_compatible_node(NULL, NULL, "qcom,pil-reloc-info");
> +	if (!np)
> +		return -ENOENT;
> +
> +	ret = of_address_to_resource(np, 0, &imem);
> +	of_node_put(np);
> +	if (ret < 0)
> +		return ret;
> +
> +	base = ioremap(imem.start, resource_size(&imem));
> +	if (!base) {
> +		pr_err("failed to map PIL relocation info region\n");
> +		return -ENOMEM;
> +	}
> +
> +	memset_io(base, 0, resource_size(&imem));
> +
> +	_reloc.base = base;
> +	_reloc.num_entries = resource_size(&imem) / PIL_RELOC_ENTRY_SIZE;
> +
> +	return 0;
> +}
> +
> +/**
> + * qcom_pil_info_store() - store PIL information of image in IMEM
> + * @image:	name of the image
> + * @base:	base address of the loaded image
> + * @size:	size of the loaded image
> + *
> + * Return: 0 on success, negative errno on failure
> + */
> +int qcom_pil_info_store(const char *image, phys_addr_t base, size_t 
> size)
> +{
> +	char buf[PIL_RELOC_NAME_LEN];
> +	void __iomem *entry;
> +	int ret;
> +	int i;
> +
> +	mutex_lock(&pil_reloc_lock);
> +	ret = qcom_pil_info_init();
> +	if (ret < 0) {
> +		mutex_unlock(&pil_reloc_lock);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < _reloc.num_entries; i++) {
> +		entry = _reloc.base + i * PIL_RELOC_ENTRY_SIZE;
> +
> +		memcpy_fromio(buf, entry, PIL_RELOC_NAME_LEN);
> +
> +		/*
> +		 * An empty record means we didn't find it, given that the
> +		 * records are packed.
> +		 */
> +		if (!buf[0])
> +			goto found_unused;
> +
> +		if (!strncmp(buf, image, PIL_RELOC_NAME_LEN))
> +			goto found_existing;
> +	}
> +
> +	pr_warn("insufficient PIL info slots\n");
> +	mutex_unlock(&pil_reloc_lock);
> +	return -ENOMEM;
> +
> +found_unused:
> +	memcpy_toio(entry, image, PIL_RELOC_NAME_LEN);
> +found_existing:
> +	/* Use two writel() as base is only aligned to 4 bytes on odd entries 
> */
> +	writel(base, entry + PIL_RELOC_NAME_LEN);
> +	writel(base >> 32, entry + PIL_RELOC_NAME_LEN + 4);
> +	writel(size, entry + PIL_RELOC_NAME_LEN + sizeof(__le64));
> +	mutex_unlock(&pil_reloc_lock);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(qcom_pil_info_store);
> +
> +static void __exit pil_reloc_exit(void)
> +{
> +	mutex_lock(&pil_reloc_lock);
> +	iounmap(_reloc.base);
> +	_reloc.base = NULL;
> +	mutex_unlock(&pil_reloc_lock);
> +}
> +module_exit(pil_reloc_exit);
> +
> +MODULE_DESCRIPTION("Qualcomm PIL relocation info");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/remoteproc/qcom_pil_info.h
> b/drivers/remoteproc/qcom_pil_info.h
> new file mode 100644
> index 000000000000..0dce6142935e
> --- /dev/null
> +++ b/drivers/remoteproc/qcom_pil_info.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __QCOM_PIL_INFO_H__
> +#define __QCOM_PIL_INFO_H__
> +
> +#include <linux/types.h>
> +
> +int qcom_pil_info_store(const char *image, phys_addr_t base, size_t 
> size);
> +
> +#endif
Reviewed-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Tested-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
