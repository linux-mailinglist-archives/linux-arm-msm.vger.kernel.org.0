Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 819A24761C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2019 19:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbfFPRkX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Jun 2019 13:40:23 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39128 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbfFPRkX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Jun 2019 13:40:23 -0400
Received: by mail-pf1-f194.google.com with SMTP id j2so4355561pfe.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Jun 2019 10:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wOhdoGKBfescXgGzHdi0cYa3SxsFF1gqlYcFWycitdc=;
        b=rKkBhoAHf9pmeJ59RHwh5DyDKFQnuShW6zQWfYFSRgf/sxt7S5vtL6HwptTM9bBHjD
         T0+V1grzmPz0ZmktZLZuFQLAkLqhEQZrHsNojRuCCFkkwR7doExc5kLTY7qZ8wn8Ts71
         OvZGKn49vUv5qzqPFJshl0YAU4fkyhrN84epxAuvJWSDUuryAI3v4twxm6P3FnI0ApZB
         bFYVUlXP/WICDdwBA1YkhfwnKUUmNjNFJfUD2cZixwywiVvQvG+fEdjGgJ6xBknzt4yU
         wTr7Qdl6dMF1N89bFj0zbDNHG0kPTZpCC98mdKlyzSDzJwqnDSflXDVOD1PGqDYU5jvU
         fkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wOhdoGKBfescXgGzHdi0cYa3SxsFF1gqlYcFWycitdc=;
        b=nW9Uc7jEJabzpbZIhSTibixKVO2HeMToBjilVU1pA3qMB7iEY+y3Xtq+EX1QMNVhJn
         JQ82C36UEu0LoU5KcXHWjS8HM8ELZTDaEOVD//lBpVHksxstJmK5BcPc1FvaGr9kHTSU
         Hs9J3LL9O3mm3b7YQhkUnDXFsS9UUVGIC1K26/tCBc8VFx1ap6qTQlBbaaV7FbLkO37U
         +oqsn8kZ4R1vua9YrJjy7pofCGYOXX0U+Up8TtQJbsMjXPgAqHzjvpmiwE3M6UWhqlQz
         o7OD0dlvs3NBX2/6kgJma6QzbTV3F1CTH8EPaLFMiek09mP/t+HhP/sLDqM33swkxlXt
         8Juw==
X-Gm-Message-State: APjAAAUTwXKd7JMcUDz1PVv8velixeZhSGVPz97vamsunNb0yEjH8DE0
        EWnocZXhUqDPNYTsozSeuq07yw==
X-Google-Smtp-Source: APXvYqy2tsOWPrp5P5QCn9J2iLDhASW+AbYZHGjXZeBbS9tCASQVAM8pU2dk+N5RnnWDZGxA+FQVmw==
X-Received: by 2002:a17:90a:bc0c:: with SMTP id w12mr20858135pjr.111.1560706821299;
        Sun, 16 Jun 2019 10:40:21 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c69sm14181145pje.6.2019.06.16.10.40.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 10:40:20 -0700 (PDT)
Date:   Sun, 16 Jun 2019 10:41:06 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
        sean@poorly.run, robh+dt@kernel.org, airlied@linux.ie,
        daniel@ffwll.ch, mark.rutland@arm.com, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 5/6] soc: qcom: add OCMEM driver
Message-ID: <20190616174106.GO22737@tuxbook-pro>
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-6-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190616132930.6942-6-masneyb@onstation.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 16 Jun 06:29 PDT 2019, Brian Masney wrote:

> From: Rob Clark <robdclark@gmail.com>
> 
> The OCMEM driver handles allocation and configuration of the On Chip
> MEMory that is present on some Snapdragon SoCs.
> 
> Devices which have OCMEM do not have GMEM inside the GPU core, so the
> GPU must instead use OCMEM to be functional. Since currently the GPU
> is the only OCMEM user with an upstream driver, this is just a minimal
> implementation sufficient for statically allocating to the GPU it's
> chunk of OCMEM.
> 
> Signed-off-by: Rob Clark <robdclark@gmail.com>
> Co-developed-by: Brian Masney <masneyb@onstation.org>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Changes since Rob's last version of this patch:
> https://patchwork.kernel.org/patch/7379801/
> - reformatted driver to allow multiple instances
> - updated logging of error paths during device probing
> - remove unused psgsc_ctrl
> - remove _clk from clock names
> - propagate error code from devm_ioremap_resource()
> - use device_get_match_data()
> - SPDX license tags
> - remove QCOM_SMD in Kconfig
> - select ARCH_QCOM in Kconfig
> - select QCOM_SCM in Kconfig
> - longer description in Kconfig
> 
>  drivers/soc/qcom/Kconfig     |  10 +
>  drivers/soc/qcom/Makefile    |   1 +
>  drivers/soc/qcom/ocmem.c     | 402 +++++++++++++++++++++++++++++++++++
>  drivers/soc/qcom/ocmem.xml.h |  86 ++++++++
>  include/soc/qcom/ocmem.h     |  34 +++
>  5 files changed, 533 insertions(+)
>  create mode 100644 drivers/soc/qcom/ocmem.c
>  create mode 100644 drivers/soc/qcom/ocmem.xml.h
>  create mode 100644 include/soc/qcom/ocmem.h
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 880cf0290962..998d94d60a3c 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -62,6 +62,16 @@ config QCOM_MDT_LOADER
>  	tristate
>  	select QCOM_SCM
>  
> +config QCOM_OCMEM
> +	tristate "Qualcomm On Chip Memory (OCMEM) driver"
> +	depends on ARCH_QCOM
> +	select QCOM_SCM
> +	help
> +          The On Chip Memory (OCMEM) allocator allows various clients to
> +          allocate memory from OCMEM based on performance, latency and power
> +          requirements. This is typically used by the GPU, camera/video, and
> +          audio components on some Snapdragon SoCs.
> +
>  config QCOM_PM
>  	bool "Qualcomm Power Management"
>  	depends on ARCH_QCOM && !ARM64
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index ffe519b0cb66..76ac469f548c 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -5,6 +5,7 @@ obj-$(CONFIG_QCOM_COMMAND_DB) += cmd-db.o
>  obj-$(CONFIG_QCOM_GLINK_SSR) +=	glink_ssr.o
>  obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
>  obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
> +obj-$(CONFIG_QCOM_OCMEM)	+= ocmem.o
>  obj-$(CONFIG_QCOM_PM)	+=	spm.o
>  obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
>  qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
> diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
> new file mode 100644
> index 000000000000..5ebf5031b6c5
> --- /dev/null
> +++ b/drivers/soc/qcom/ocmem.c
> @@ -0,0 +1,402 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019 Brian Masney <masneyb@onstation.org>
> + * Copyright (C) 2015 Red Hat. Author: Rob Clark <robdclark@gmail.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/qcom_scm.h>
> +#include <linux/sizes.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +
> +#include <soc/qcom/ocmem.h>
> +#include "ocmem.xml.h"
> +
> +enum region_mode {
> +	WIDE_MODE = 0x0,
> +	THIN_MODE,
> +	MODE_DEFAULT = WIDE_MODE,
> +};
> +
> +struct ocmem_region {
> +	bool interleaved;
> +	enum region_mode mode;
> +	unsigned int num_macros;
> +	enum ocmem_macro_state macro_state[4];
> +	unsigned long macro_size;
> +	unsigned long region_size;
> +};
> +
> +struct ocmem_config {
> +	uint8_t num_regions;
> +	uint32_t macro_size;
> +};
> +
> +struct ocmem {
> +	struct device *dev;
> +	const struct ocmem_config *config;
> +	struct resource *ocmem_mem;
> +	struct clk *core_clk;
> +	struct clk *iface_clk;
> +	void __iomem *mmio;
> +	unsigned int num_ports;
> +	unsigned int num_macros;
> +	bool interleaved;
> +	struct ocmem_region *regions;
> +};
> +
> +#define FIELD(val, name) (((val) & name ## __MASK) >> name ## __SHIFT)

include/linux/bitfield.h has standard macros for this, please use that
instead.

> +
> +static inline void ocmem_write(struct ocmem *ocmem, u32 reg, u32 data)
> +{
> +	writel(data, ocmem->mmio + reg);
> +}
> +
> +static inline u32 ocmem_read(struct ocmem *ocmem, u32 reg)
> +{
> +	return readl(ocmem->mmio + reg);
> +}
> +
> +static int ocmem_clk_enable(struct ocmem *ocmem)
> +{
> +	int ret;
> +
> +	ret = clk_prepare_enable(ocmem->core_clk);

Use clk_bulk_* instead, it will reduce the amount of duplication in the
three places you poke at your clocks.

And with that I would suggest that you just inline these into probe and
remove.

> +	if (ret) {
> +		dev_info(ocmem->dev, "Fail to enable core clk\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(ocmem->iface_clk);
> +	if (ret) {
> +		dev_info(ocmem->dev, "Fail to enable iface clk\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void ocmem_clk_disable(struct ocmem *ocmem)
> +{
> +	clk_disable_unprepare(ocmem->iface_clk);
> +	clk_disable_unprepare(ocmem->core_clk);
> +}
> +
> +static int ocmem_dev_remove(struct platform_device *pdev)

Please move this below probe().

> +{
> +	struct ocmem *ocmem = platform_get_drvdata(pdev);
> +
> +	ocmem_clk_disable(ocmem);
> +
> +	return 0;
> +}
> +
> +static void update_ocmem(struct ocmem *ocmem)
> +{
> +	uint32_t region_mode_ctrl = 0x0;
> +	unsigned int pos = 0, i = 0;

Both pos and i are initialized before use, no need to do it here.

> +
> +	if (!qcom_scm_ocmem_lock_available()) {
> +		for (i = 0; i < ocmem->config->num_regions; i++) {
> +			struct ocmem_region *region = &ocmem->regions[i];
> +
> +			pos = i << 2;

Just use i * 4 in the BIT() operation below.


But the generated macros has the "thin bits" as 1, 2, 4, 8; so shouldn't
this be BIT(i)?

> +			if (region->mode == THIN_MODE)
> +				region_mode_ctrl |= BIT(pos);
> +		}
> +
> +		dev_dbg(ocmem->dev, "ocmem_region_mode_control %x\n",
> +			region_mode_ctrl);
> +		ocmem_write(ocmem, REG_OCMEM_REGION_MODE_CTL, region_mode_ctrl);
> +	}
> +
> +	for (i = 0; i < ocmem->config->num_regions; i++) {
> +		struct ocmem_region *region = &ocmem->regions[i];
> +		u32 data;
> +
> +		data = OCMEM_PSGSC_CTL_MACRO0_MODE(region->macro_state[0]) |
> +			OCMEM_PSGSC_CTL_MACRO1_MODE(region->macro_state[1]) |
> +			OCMEM_PSGSC_CTL_MACRO2_MODE(region->macro_state[2]) |
> +			OCMEM_PSGSC_CTL_MACRO3_MODE(region->macro_state[3]);
> +
> +		ocmem_write(ocmem, REG_OCMEM_PSGSC_CTL(i), data);
> +	}
> +}
> +
> +static unsigned long phys_to_offset(struct ocmem *ocmem,
> +				    unsigned long addr)
> +{
> +	if (addr < ocmem->ocmem_mem->start || addr >= ocmem->ocmem_mem->end)
> +		return 0;
> +
> +	return addr - ocmem->ocmem_mem->start;
> +}
> +
> +static unsigned long device_address(struct ocmem *ocmem,
> +				    enum ocmem_client client,
> +				    unsigned long addr)
> +{
> +	/* TODO, gpu uses phys_to_offset, but others do not.. */

Perhaps WARN_ON(client != OCMEM_GRAPHICS) as well?

> +	return phys_to_offset(ocmem, addr);
> +}
> +
> +static void update_range(struct ocmem *ocmem, struct ocmem_buf *buf,
> +			 enum ocmem_macro_state mstate, enum region_mode rmode)
> +{
> +	unsigned long offset = 0;
> +	int i, j;
> +
> +	/*
> +	 * TODO probably should assert somewhere that range is aligned
> +	 * to macro boundaries..
> +	 */
> +
> +	for (i = 0; i < ocmem->config->num_regions; i++) {
> +		struct ocmem_region *region = &ocmem->regions[i];
> +
> +		if (buf->offset <= offset && offset < buf->offset + buf->len)
> +			region->mode = rmode;
> +
> +		for (j = 0; j < region->num_macros; j++) {
> +			if (buf->offset <= offset &&
> +			    offset < buf->offset + buf->len)
> +				region->macro_state[j] = mstate;
> +
> +			offset += region->macro_size;
> +		}
> +	}
> +
> +	update_ocmem(ocmem);
> +}
> +
> +struct ocmem *of_get_ocmem(struct device *dev)
> +{
> +	struct platform_device *pdev;
> +	struct device_node *devnode;
> +
> +	devnode = of_parse_phandle(dev->of_node, "ocmem", 0);
> +	if (!devnode) {
> +		dev_err(dev, "Cannot look up ocmem phandle\n");
> +		return NULL;

return ERR_PTR(-EINVAL);

> +	}
> +
> +	pdev = of_find_device_by_node(devnode);
> +	if (!pdev) {
> +		dev_err(dev, "Cannot find device node %s\n", devnode->name);
> +		return NULL;

return ERR_PTR(-EPROBE_DEFER)

> +	}
> +
> +	return platform_get_drvdata(pdev);
> +}
> +EXPORT_SYMBOL(of_get_ocmem);
> +
> +struct ocmem_buf *ocmem_allocate(struct ocmem *ocmem, enum ocmem_client client,
> +				 unsigned long size)
> +{
> +	struct ocmem_buf *buf;
> +
> +	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
> +	if (!buf)
> +		return ERR_PTR(-ENOMEM);
> +

This is a very simple allocator... It would be nice to add the minimal
functionality of making sure that you only return successfully if
there's not already a live allocation.

But at least you should add a comment here stating the "limitation" on
the algorithm.

> +	buf->offset = 0;
> +	buf->addr = device_address(ocmem, client, buf->offset);
> +	buf->len = size;
> +
> +	update_range(ocmem, buf, CORE_ON, WIDE_MODE);
> +
> +	if (qcom_scm_ocmem_lock_available()) {
> +		int ret;
> +
> +		ret = qcom_scm_ocmem_lock(QCOM_SCM_OCMEM_GRAPHICS_ID,
> +					  buf->offset, buf->len, WIDE_MODE);
> +		if (ret)
> +			dev_err(ocmem->dev, "could not lock: %d\n", ret);
> +	} else {
> +		if (client == OCMEM_GRAPHICS) {

Isn't the lock_available case also graphcis only? Perhaps it's worth
swapping the inner and outer blocks.

> +			ocmem_write(ocmem, REG_OCMEM_GFX_MPU_START,
> +				    buf->offset);
> +			ocmem_write(ocmem, REG_OCMEM_GFX_MPU_END,
> +				    buf->offset + buf->len);
> +		}

And it's probably good to warn and fail if the client isn't graphics.

> +	}
> +
> +	return buf;
> +}
> +EXPORT_SYMBOL(ocmem_allocate);
> +
> +void ocmem_free(struct ocmem *ocmem, enum ocmem_client client,
> +		struct ocmem_buf *buf)
> +{
> +	update_range(ocmem, buf, CLK_OFF, MODE_DEFAULT);
> +
> +	if (qcom_scm_ocmem_lock_available()) {
> +		int ret;
> +
> +		ret = qcom_scm_ocmem_unlock(QCOM_SCM_OCMEM_GRAPHICS_ID,
> +					    buf->offset, buf->len);
> +		if (ret)
> +			dev_err(ocmem->dev, "could not unlock: %d\n", ret);
> +	} else {
> +		if (client == OCMEM_GRAPHICS) {
> +			ocmem_write(ocmem, REG_OCMEM_GFX_MPU_START, 0x0);
> +			ocmem_write(ocmem, REG_OCMEM_GFX_MPU_END, 0x0);
> +		}
> +	}
> +
> +	kfree(buf);
> +}
> +EXPORT_SYMBOL(ocmem_free);
> +
> +static int ocmem_dev_probe(struct platform_device *pdev)
> +{
> +	struct ocmem *ocmem;
> +	uint32_t reg, num_banks, region_size;
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	int i, j, ret;
> +
> +	if (!qcom_scm_is_available())
> +		return -EPROBE_DEFER;
> +
> +	ocmem = devm_kzalloc(dev, sizeof(*ocmem), GFP_KERNEL);
> +	if (!ocmem)
> +		return -ENOMEM;
> +
> +	ocmem->dev = dev;
> +	ocmem->config = device_get_match_data(dev);
> +
> +	ocmem->core_clk = devm_clk_get(dev, "core");

devm_clk_bulk_get()

> +	if (IS_ERR(ocmem->core_clk)) {
> +		if (PTR_ERR(ocmem->core_clk) != -EPROBE_DEFER)
> +			dev_err(dev, "Unable to get the core clock\n");
> +
> +		return PTR_ERR(ocmem->core_clk);
> +	}
> +
> +	ocmem->iface_clk = devm_clk_get(dev, "iface");
> +	if (IS_ERR(ocmem->iface_clk)) {
> +		if (PTR_ERR(ocmem->iface_clk) != -EPROBE_DEFER)
> +			dev_err(dev, "Unable to get the iface clock\n");
> +
> +		return PTR_ERR(ocmem->iface_clk);
> +	}
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +					   "ocmem_ctrl_physical");

We know it's the "_physical", so drop that from the name.

> +	if (!res) {

It's idiomatic to ignore this check and rely on ioremap_resource() to
fail gracefully if passed NULL.

> +		dev_err(dev, "Could not get ocmem_ctrl_physical region\n");
> +		return -ENXIO;
> +	}
> +
> +	ocmem->mmio = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(ocmem->mmio)) {
> +		dev_err(&pdev->dev,
> +			"Failed to ioremap ocmem_ctrl_physical resource\n");
> +		return PTR_ERR(ocmem->mmio);
> +	}
> +
> +	ocmem->ocmem_mem = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +							"ocmem_physical");
> +	if (!ocmem->ocmem_mem) {
> +		dev_err(dev, "Could not get ocmem_physical region\n");
> +		return -ENXIO;
> +	}
> +
> +	/* The core clock is synchronous with graphics */
> +	WARN_ON(clk_set_rate(ocmem->core_clk, 1000) < 0);
> +
> +	ret = ocmem_clk_enable(ocmem);
> +	if (ret)
> +		return ret;
> +
> +	if (qcom_scm_restore_sec_config_available()) {
> +		dev_dbg(dev, "configuring scm\n");
> +		ret = qcom_scm_restore_sec_config(&pdev->dev,
> +						  QCOM_SCM_OCMEM_DEV_ID);
> +		if (ret) {
> +			dev_err(dev, "Could not enable secure configuration\n");
> +			goto err_clk_disable;
> +		}
> +	}
> +
> +	reg = ocmem_read(ocmem, REG_OCMEM_HW_PROFILE);
> +	ocmem->num_ports = FIELD(reg, OCMEM_HW_PROFILE_NUM_PORTS);
> +	ocmem->num_macros = FIELD(reg, OCMEM_HW_PROFILE_NUM_MACROS);
> +	ocmem->interleaved = !!(reg & OCMEM_HW_PROFILE_INTERLEAVING);
> +
> +	num_banks = ocmem->num_ports / 2;
> +	region_size = ocmem->config->macro_size * num_banks;
> +
> +	dev_info(dev, "%u ports, %u regions, %u macros, %sinterleaved\n",
> +		 ocmem->num_ports, ocmem->config->num_regions,
> +		 ocmem->num_macros, ocmem->interleaved ? "" : "not ");
> +
> +	ocmem->regions = devm_kcalloc(dev, ocmem->config->num_regions,
> +				      sizeof(struct ocmem_region), GFP_KERNEL);
> +	if (!ocmem->regions) {
> +		ret = -ENOMEM;
> +		goto err_clk_disable;
> +	}
> +
> +	for (i = 0; i < ocmem->config->num_regions; i++) {
> +		struct ocmem_region *region = &ocmem->regions[i];
> +
> +		if (WARN_ON(num_banks > ARRAY_SIZE(region->macro_state))) {
> +			ret = -EINVAL;
> +			goto err_clk_disable;
> +		}
> +
> +		region->mode = MODE_DEFAULT;
> +		region->num_macros = num_banks;
> +
> +		if (i == (ocmem->config->num_regions - 1) &&
> +		    reg & OCMEM_HW_PROFILE_LAST_REGN_HALFSIZE) {
> +			region->macro_size = ocmem->config->macro_size / 2;
> +			region->region_size = region_size / 2;
> +		} else {
> +			region->macro_size = ocmem->config->macro_size;
> +			region->region_size = region_size;
> +		}
> +
> +		for (j = 0; j < ARRAY_SIZE(region->macro_state); j++)
> +			region->macro_state[j] = CLK_OFF;
> +	}
> +
> +	platform_set_drvdata(pdev, ocmem);
> +
> +	return 0;
> +
> +err_clk_disable:
> +	ocmem_clk_disable(ocmem);
> +	return ret;
> +}
> +
> +static const struct ocmem_config ocmem_8974_config = {
> +	.num_regions = 3,
> +	.macro_size = SZ_128K,
> +};
> +
> +static const struct of_device_id ocmem_of_match[] = {
> +	{ .compatible = "qcom,ocmem-msm8974", .data = &ocmem_8974_config },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, ocmem_of_match);
> +
> +static struct platform_driver ocmem_driver = {
> +	.probe = ocmem_dev_probe,
> +	.remove = ocmem_dev_remove,
> +	.driver = {
> +		.name = "ocmem",
> +		.of_match_table = ocmem_of_match,
> +	},
> +};
> +
> +module_platform_driver(ocmem_driver);

MODULE_LICENSE()

> diff --git a/drivers/soc/qcom/ocmem.xml.h b/drivers/soc/qcom/ocmem.xml.h

I would prefer that these lived at the top of the c file, rather than
being generated.

> new file mode 100644
> index 000000000000..b4bfb85d1e33
> --- /dev/null
> +++ b/drivers/soc/qcom/ocmem.xml.h
> @@ -0,0 +1,86 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef OCMEM_XML
> +#define OCMEM_XML
> +
> +/* Autogenerated file, DO NOT EDIT manually!
> +
> +This file was generated by the rules-ng-ng headergen tool in this git repository:
> +http://github.com/freedreno/envytools/
> +git clone https://github.com/freedreno/envytools.git
> +
> +The rules-ng-ng source files this header was generated from are:
> +- /home/robclark/src/freedreno/envytools/rnndb/adreno/ocmem.xml         (   1773 bytes, from 2015-09-24 17:30:00)
> +
> +Copyright (C) 2013-2015 by the following authors:
> +- Rob Clark <robdclark@gmail.com> (robclark)
> +*/
> +
> +enum ocmem_macro_state {
> +	PASSTHROUGH = 0,
> +	PERI_ON = 1,
> +	CORE_ON = 2,
> +	CLK_OFF = 4,
> +};
> +
> +#define REG_OCMEM_HW_VERSION					0x00000000
> +
> +#define REG_OCMEM_HW_PROFILE					0x00000004
> +#define OCMEM_HW_PROFILE_NUM_PORTS__MASK			0x0000000f
> +#define OCMEM_HW_PROFILE_NUM_PORTS__SHIFT			0
> +static inline uint32_t OCMEM_HW_PROFILE_NUM_PORTS(uint32_t val)
> +{
> +	return ((val) << OCMEM_HW_PROFILE_NUM_PORTS__SHIFT) & OCMEM_HW_PROFILE_NUM_PORTS__MASK;
> +}
> +#define OCMEM_HW_PROFILE_NUM_MACROS__MASK			0x00003f00
> +#define OCMEM_HW_PROFILE_NUM_MACROS__SHIFT			8
> +static inline uint32_t OCMEM_HW_PROFILE_NUM_MACROS(uint32_t val)
> +{
> +	return ((val) << OCMEM_HW_PROFILE_NUM_MACROS__SHIFT) & OCMEM_HW_PROFILE_NUM_MACROS__MASK;
> +}
> +#define OCMEM_HW_PROFILE_LAST_REGN_HALFSIZE			0x00010000
> +#define OCMEM_HW_PROFILE_INTERLEAVING				0x00020000
> +
> +#define REG_OCMEM_GEN_STATUS					0x0000000c
> +
> +#define REG_OCMEM_PSGSC_STATUS					0x00000038
> +
> +static inline uint32_t REG_OCMEM_PSGSC(uint32_t i0) { return 0x0000003c + 0x1*i0; }
> +
> +static inline uint32_t REG_OCMEM_PSGSC_CTL(uint32_t i0) { return 0x0000003c + 0x1*i0; }
> +#define OCMEM_PSGSC_CTL_MACRO0_MODE__MASK			0x00000007
> +#define OCMEM_PSGSC_CTL_MACRO0_MODE__SHIFT			0
> +static inline uint32_t OCMEM_PSGSC_CTL_MACRO0_MODE(enum ocmem_macro_state val)
> +{
> +	return ((val) << OCMEM_PSGSC_CTL_MACRO0_MODE__SHIFT) & OCMEM_PSGSC_CTL_MACRO0_MODE__MASK;
> +}
> +#define OCMEM_PSGSC_CTL_MACRO1_MODE__MASK			0x00000070
> +#define OCMEM_PSGSC_CTL_MACRO1_MODE__SHIFT			4
> +static inline uint32_t OCMEM_PSGSC_CTL_MACRO1_MODE(enum ocmem_macro_state val)
> +{
> +	return ((val) << OCMEM_PSGSC_CTL_MACRO1_MODE__SHIFT) & OCMEM_PSGSC_CTL_MACRO1_MODE__MASK;
> +}
> +#define OCMEM_PSGSC_CTL_MACRO2_MODE__MASK			0x00000700
> +#define OCMEM_PSGSC_CTL_MACRO2_MODE__SHIFT			8
> +static inline uint32_t OCMEM_PSGSC_CTL_MACRO2_MODE(enum ocmem_macro_state val)
> +{
> +	return ((val) << OCMEM_PSGSC_CTL_MACRO2_MODE__SHIFT) & OCMEM_PSGSC_CTL_MACRO2_MODE__MASK;
> +}
> +#define OCMEM_PSGSC_CTL_MACRO3_MODE__MASK			0x00007000
> +#define OCMEM_PSGSC_CTL_MACRO3_MODE__SHIFT			12
> +static inline uint32_t OCMEM_PSGSC_CTL_MACRO3_MODE(enum ocmem_macro_state val)
> +{
> +	return ((val) << OCMEM_PSGSC_CTL_MACRO3_MODE__SHIFT) & OCMEM_PSGSC_CTL_MACRO3_MODE__MASK;
> +}
> +
> +#define REG_OCMEM_REGION_MODE_CTL				0x00001000
> +#define OCMEM_REGION_MODE_CTL_REG0_THIN				0x00000001
> +#define OCMEM_REGION_MODE_CTL_REG1_THIN				0x00000002
> +#define OCMEM_REGION_MODE_CTL_REG2_THIN				0x00000004
> +#define OCMEM_REGION_MODE_CTL_REG3_THIN				0x00000008
> +
> +#define REG_OCMEM_GFX_MPU_START					0x00001004
> +
> +#define REG_OCMEM_GFX_MPU_END					0x00001008
> +
> +#endif /* OCMEM_XML */
> diff --git a/include/soc/qcom/ocmem.h b/include/soc/qcom/ocmem.h
> new file mode 100644
> index 000000000000..e56ce220096d
> --- /dev/null
> +++ b/include/soc/qcom/ocmem.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2015 Red Hat
> + * Author: Rob Clark <robdclark@gmail.com>
> + */
> +
> +#ifndef __OCMEM_H__
> +#define __OCMEM_H__
> +
> +enum ocmem_client {
> +	/* GMEM clients */
> +	OCMEM_GRAPHICS = 0x0,
> +	/*
> +	 * TODO add more once ocmem_allocate() is clever enough to
> +	 * deal with multiple clients.
> +	 */
> +	OCMEM_CLIENT_MAX,
> +};
> +
> +struct ocmem;
> +
> +struct ocmem_buf {
> +	unsigned long offset;
> +	unsigned long addr;
> +	unsigned long len;
> +};
> +
> +struct ocmem *of_get_ocmem(struct device *dev);
> +struct ocmem_buf *ocmem_allocate(struct ocmem *ocmem, enum ocmem_client client,
> +				 unsigned long size);
> +void ocmem_free(struct ocmem *ocmem, enum ocmem_client client,
> +		struct ocmem_buf *buf);
> +
> +#endif /* __OCMEM_H__ */
> -- 

Regards,
Bjorn
