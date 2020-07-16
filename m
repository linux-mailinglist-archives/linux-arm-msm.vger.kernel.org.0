Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA140221BBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 07:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgGPFDm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 01:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgGPFDl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 01:03:41 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A88BC061755;
        Wed, 15 Jul 2020 22:03:41 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id c30so4398534qka.10;
        Wed, 15 Jul 2020 22:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V9T8sGaDnOUrOAE9u8Pr1lw80Xpu9mvROcqA5Ir/U+U=;
        b=B2YSyOb+tupMCM4hDluJfXQRgFcP08PpKikl1ZcMTvX/B4ViLEu5Qgo18R2pYR+v6z
         xlpnY2c/bN8b1ui7a4vyNhxSKnk+tPPIMc3/2z/DQkcIHlIcSGBVAixwDEXf9oVZrZdY
         K0+EEossZl5rTakNF62R+UmTchiZtypGJ+2pZbU9Z+UQ8Lwhco5XsiZK3ab5i87+rHRt
         YQVau/PfBg0tJr8fhviLuU8EmBE1JMf0983EzypujcG0de+xerRIuA6TEH603ABysPDe
         kQZCX+6sfALuIBTYIk6mpWGGTRsOU2nmZTmGHSPQYjKDFOeV01qyCbzEzAdvo1dR5wbq
         bL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V9T8sGaDnOUrOAE9u8Pr1lw80Xpu9mvROcqA5Ir/U+U=;
        b=ft+mIa9C7T2OeDi2SIWFTRMl8HK0LDvuEVR19kPrAj/opVh8ZuK3Gx+iowWQY1qPsP
         lx0WKl0PXufenH11vXJTX1bIl07N6oFf2szc909CQphiWpXnFCOPC5R4ksq1CTTbuZzt
         juAhWR8e0sjwzSxu2qIRpffdSmYglGvfe+4Utc8TJtKjKiTruzkdZSTei47xlGQcQLYc
         I8Qwne9SU0S+3J7+iui26PYU3IrpGI+ow7PU9o2X5Th664cncCCr2a95C/NFbNNdtaRK
         TFiCFckU4l1xjT+szK6K9HXX2yfjebrFeNCQHuBx7TeD1dggX5hAjjjFtIch3q9rdxy2
         Jx7g==
X-Gm-Message-State: AOAM531oIvhl15Q6IoMI2yl7I64235P4pFL5nuMhL7ZEMtHLctiRUCna
        hlWTYkcQYfUQ7fMAs90IcOg=
X-Google-Smtp-Source: ABdhPJwwtDLSn2x89H7LOA0Wyilr2Md+1HQItb88gDe45oShvQ9Poql5CXKpXmn+Y00HfZSlrDq5Ag==
X-Received: by 2002:a37:97c5:: with SMTP id z188mr2193885qkd.48.1594875820326;
        Wed, 15 Jul 2020 22:03:40 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:45d1:2600::1])
        by smtp.gmail.com with ESMTPSA id h41sm6661631qtk.68.2020.07.15.22.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 22:03:39 -0700 (PDT)
Date:   Wed, 15 Jul 2020 22:03:38 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v7 2/5] remoteproc: qcom: Introduce helper to store pil
 info in IMEM
Message-ID: <20200716050338.GA208928@ubuntu-n2-xlarge-x86>
References: <20200622191942.255460-1-bjorn.andersson@linaro.org>
 <20200622191942.255460-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622191942.255460-3-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 22, 2020 at 12:19:39PM -0700, Bjorn Andersson wrote:
> A region in IMEM is used to communicate load addresses of remoteproc to
> post mortem debug tools. Implement a helper function that can be used to
> store this information in order to enable these tools to process
> collected ramdumps.
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v6:
> - Replaced entry struct and usage of offset_of with a comment and defined offsets
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
> diff --git a/drivers/remoteproc/qcom_pil_info.c b/drivers/remoteproc/qcom_pil_info.c
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
> + * The PIL relocation information region is used to communicate memory regions
> + * occupied by co-processor firmware for post mortem crash analysis.
> + *
> + * It consists of an array of entries with an 8 byte textual identifier of the
> + * region followed by a 64 bit base address and 32 bit size, both little
> + * endian.
> + */
> +#define PIL_RELOC_NAME_LEN	8
> +#define PIL_RELOC_ENTRY_SIZE	(PIL_RELOC_NAME_LEN + sizeof(__le64) + sizeof(__le32))
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
> +int qcom_pil_info_store(const char *image, phys_addr_t base, size_t size)
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
> +	/* Use two writel() as base is only aligned to 4 bytes on odd entries */
> +	writel(base, entry + PIL_RELOC_NAME_LEN);
> +	writel(base >> 32, entry + PIL_RELOC_NAME_LEN + 4);

I am not sure if this has been reported or not but this shift causes a
warning on arm 32-bit:

$ make -skj"$(nproc)" ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- distclean allyesconfig drivers/remoteproc/qcom_pil_info.o
In file included from ./include/linux/swab.h:5,
                 from ./include/uapi/linux/byteorder/big_endian.h:13,
                 from ./include/linux/byteorder/big_endian.h:5,
                 from ./arch/arm/include/uapi/asm/byteorder.h:20,
                 from ./include/asm-generic/bitops/le.h:6,
                 from ./arch/arm/include/asm/bitops.h:268,
                 from ./include/linux/bitops.h:29,
                 from ./include/linux/kernel.h:12,
                 from drivers/remoteproc/qcom_pil_info.c:5:
drivers/remoteproc/qcom_pil_info.c: In function 'qcom_pil_info_store':
drivers/remoteproc/qcom_pil_info.c:111:14: warning: right shift count >= width of type [-Wshift-count-overflow]
  111 |  writel(base >> 32, entry + PIL_RELOC_NAME_LEN + 4);
      |              ^~
./include/uapi/linux/swab.h:115:54: note: in definition of macro '__swab32'
  115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
      |                                                      ^
./include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
   88 | #define cpu_to_le32 __cpu_to_le32
      |                     ^~~~~~~~~~~~~
./arch/arm/include/asm/io.h:307:36: note: in expansion of macro 'writel_relaxed'
  307 | #define writel(v,c)  ({ __iowmb(); writel_relaxed(v,c); })
      |                                    ^~~~~~~~~~~~~~
drivers/remoteproc/qcom_pil_info.c:111:2: note: in expansion of macro 'writel'
  111 |  writel(base >> 32, entry + PIL_RELOC_NAME_LEN + 4);
      |  ^~~~~~

Cheers,
Nathan

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
> diff --git a/drivers/remoteproc/qcom_pil_info.h b/drivers/remoteproc/qcom_pil_info.h
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
> +int qcom_pil_info_store(const char *image, phys_addr_t base, size_t size);
> +
> +#endif
> -- 
> 2.26.2
> 
