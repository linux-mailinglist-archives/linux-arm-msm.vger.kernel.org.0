Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78D6813B8BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 05:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728882AbgAOE4C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jan 2020 23:56:02 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:20847 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728890AbgAOE4C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jan 2020 23:56:02 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579064161; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=CFggoQTFe2wvaO1hQn0wyoyP6dGUNWAjLiQUMfhesc4=;
 b=SWhLkRwQBYpZsP+7dffphoOdGUddyxZ2/3jrKaMZVFfLbjZOBnjuxBPIIAS5C0I/2VCgaFgE
 msPdhG6YZxJOe/P+dN08VCrrkotzMxgwU6QFXyzfwH2BEpGX6ecPpMwS9NWE6bmtHMJXxTJD
 JU93Vp4tZT5azu5dDAvKIeqznOk=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1e9b5e.7fd5e16cd538-smtp-out-n02;
 Wed, 15 Jan 2020 04:55:58 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AFEBBC447A6; Wed, 15 Jan 2020 04:55:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sthella)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9FB58C447A4;
        Wed, 15 Jan 2020 04:55:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 15 Jan 2020 10:25:56 +0530
From:   sthella@codeaurora.org
To:     srinivas.kandagatla@linaro.org
Cc:     Anirudh Ghayal <aghayal@codeaurora.org>, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] nvmem: add QTI SDAM driver
In-Reply-To: <1577098347-32526-1-git-send-email-sthella@codeaurora.org>
References: <1577098347-32526-1-git-send-email-sthella@codeaurora.org>
Message-ID: <03db0b6a5cbc33e7481be7758ea5e726@codeaurora.org>
X-Sender: sthella@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-12-23 16:22, Shyam Kumar Thella wrote:
> From: Anirudh Ghayal <aghayal@codeaurora.org>
> 
> QTI SDAM driver allows PMIC peripherals to access the shared memory
> that is available on QTI PMICs.
> 
> Use subsys_initcall as PMIC SDAM NV memory is accessed by multiple PMIC
> drivers (charger, fuel guage) to store/restore data across reboots
> required during their initialization.
> 
> Signed-off-by: Shyam Kumar Thella <sthella@codeaurora.org>
> ---
>  drivers/nvmem/Kconfig          |   8 ++
>  drivers/nvmem/Makefile         |   1 +
>  drivers/nvmem/qcom-spmi-sdam.c | 189 
> +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 198 insertions(+)
>  create mode 100644 drivers/nvmem/qcom-spmi-sdam.c
> 
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 73567e9..35efab1 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -109,6 +109,14 @@ config QCOM_QFPROM
>  	  This driver can also be built as a module. If so, the module
>  	  will be called nvmem_qfprom.
> 
> +config NVMEM_SPMI_SDAM
> +	tristate "SPMI SDAM Support"
> +	depends on SPMI
> +	help
> +	  This driver supports the Shared Direct Access Memory Module on
> +	  Qualcomm Technologies, Inc. PMICs. It provides the clients
> +	  an interface to read/write to the SDAM module's shared memory.
> +
>  config ROCKCHIP_EFUSE
>  	tristate "Rockchip eFuse Support"
>  	depends on ARCH_ROCKCHIP || COMPILE_TEST
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 9e66782..877a0b0 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_MTK_EFUSE)		+= nvmem_mtk-efuse.o
>  nvmem_mtk-efuse-y		:= mtk-efuse.o
>  obj-$(CONFIG_QCOM_QFPROM)	+= nvmem_qfprom.o
>  nvmem_qfprom-y			:= qfprom.o
> +obj-$(CONFIG_NVMEM_SPMI_SDAM)	+= qcom-spmi-sdam.o
>  obj-$(CONFIG_ROCKCHIP_EFUSE)	+= nvmem_rockchip_efuse.o
>  nvmem_rockchip_efuse-y		:= rockchip-efuse.o
>  obj-$(CONFIG_ROCKCHIP_OTP)	+= nvmem-rockchip-otp.o
> diff --git a/drivers/nvmem/qcom-spmi-sdam.c 
> b/drivers/nvmem/qcom-spmi-sdam.c
> new file mode 100644
> index 0000000..e11228e
> --- /dev/null
> +++ b/drivers/nvmem/qcom-spmi-sdam.c
> @@ -0,0 +1,189 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2017 The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/regmap.h>
> +
> +#define SDAM_MEM_START			0x40
> +#define REGISTER_MAP_ID			0x40
> +#define REGISTER_MAP_VERSION		0x41
> +#define SDAM_SIZE			0x44
> +#define SDAM_PBS_TRIG_SET		0xE5
> +#define SDAM_PBS_TRIG_CLR		0xE6
> +
> +struct sdam_chip {
> +	struct platform_device		*pdev;
> +	struct regmap			*regmap;
> +	struct nvmem_config		sdam_config;
> +	unsigned int			base;
> +	unsigned int			size;
> +};
> +
> +/* read only register offsets */
> +static const u8 sdam_ro_map[] = {
> +	REGISTER_MAP_ID,
> +	REGISTER_MAP_VERSION,
> +	SDAM_SIZE
> +};
> +
> +static bool sdam_is_valid(struct sdam_chip *sdam, unsigned int offset,
> +				size_t len)
> +{
> +	unsigned int sdam_mem_end = SDAM_MEM_START + sdam->size - 1;
> +
> +	if (!len)
> +		return false;
> +
> +	if (offset >= SDAM_MEM_START && offset <= sdam_mem_end
> +				&& (offset + len - 1) <= sdam_mem_end)
> +		return true;
> +	else if ((offset == SDAM_PBS_TRIG_SET || offset == SDAM_PBS_TRIG_CLR)
> +				&& (len == 1))
> +		return true;
> +
> +	return false;
> +}
> +
> +static bool sdam_is_ro(unsigned int offset, size_t len)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(sdam_ro_map); i++)
> +		if (offset <= sdam_ro_map[i] && (offset + len) > sdam_ro_map[i])
> +			return true;
> +
> +	return false;
> +}
> +
> +static int sdam_read(void *priv, unsigned int offset, void *val,
> +				size_t bytes)
> +{
> +	struct sdam_chip *sdam = priv;
> +	struct device *dev = &sdam->pdev->dev;
> +	int rc;
> +
> +	if (!sdam_is_valid(sdam, offset, bytes)) {
> +		dev_err(dev, "Invalid SDAM offset %#x len=%zd\n", offset, bytes);
> +		return -EINVAL;
> +	}
> +
> +	rc = regmap_bulk_read(sdam->regmap, sdam->base + offset, val, bytes);
> +	if (rc < 0)
> +		dev_err(dev, "Failed to read SDAM offset %#x len=%zd, rc=%d\n",
> +						offset, bytes, rc);
> +
> +	return rc;
> +}
> +
> +static int sdam_write(void *priv, unsigned int offset, void *val,
> +				size_t bytes)
> +{
> +	struct sdam_chip *sdam = priv;
> +	struct device *dev = &sdam->pdev->dev;
> +	int rc;
> +
> +	if (!sdam_is_valid(sdam, offset, bytes)) {
> +		dev_err(dev, "Invalid SDAM offset %#x len=%zd\n", offset, bytes);
> +		return -EINVAL;
> +	}
> +
> +	if (sdam_is_ro(offset, bytes)) {
> +		dev_err(dev, "Invalid write offset %#x len=%zd\n", offset, bytes);
> +		return -EINVAL;
> +	}
> +
> +	rc = regmap_bulk_write(sdam->regmap, sdam->base + offset, val, 
> bytes);
> +	if (rc < 0)
> +		dev_err(dev, "Failed to write SDAM offset %#x len=%zd, rc=%d\n",
> +						offset, bytes, rc);
> +
> +	return rc;
> +}
> +
> +static int sdam_probe(struct platform_device *pdev)
> +{
> +	struct sdam_chip *sdam;
> +	struct nvmem_device *nvmem;
> +	unsigned int val;
> +	int rc;
> +
> +	sdam = devm_kzalloc(&pdev->dev, sizeof(*sdam), GFP_KERNEL);
> +	if (!sdam)
> +		return -ENOMEM;
> +
> +	sdam->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!sdam->regmap) {
> +		dev_err(&pdev->dev, "Failed to get regmap handle\n");
> +		return -ENXIO;
> +	}
> +
> +	rc = of_property_read_u32(pdev->dev.of_node, "reg", &sdam->base);
> +	if (rc < 0) {
> +		dev_err(&pdev->dev, "Failed to get SDAM base, rc=%d\n", rc);
> +		return -EINVAL;
> +	}
> +
> +	rc = regmap_read(sdam->regmap, sdam->base + SDAM_SIZE, &val);
> +	if (rc < 0) {
> +		dev_err(&pdev->dev, "Failed to read SDAM_SIZE rc=%d\n", rc);
> +		return -EINVAL;
> +	}
> +	sdam->size = val * 32;
> +
> +	sdam->sdam_config.dev = &pdev->dev;
> +	sdam->sdam_config.name = "spmi_sdam";
> +	sdam->sdam_config.id = pdev->id;
> +	sdam->sdam_config.owner = THIS_MODULE,
> +	sdam->sdam_config.stride = 1;
> +	sdam->sdam_config.word_size = 1;
> +	sdam->sdam_config.reg_read = sdam_read;
> +	sdam->sdam_config.reg_write = sdam_write;
> +	sdam->sdam_config.priv = sdam;
> +
> +	nvmem = devm_nvmem_register(&pdev->dev, &sdam->sdam_config);
> +	if (IS_ERR(nvmem)) {
> +		dev_err(&pdev->dev,
> +			"Failed to register SDAM nvmem device rc=%ld\n",
> +			PTR_ERR(nvmem));
> +		return -ENXIO;
> +	}
> +	dev_dbg(&pdev->dev,
> +		"SDAM base=%#x size=%u registered successfully\n",
> +		sdam->base, sdam->size);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id sdam_match_table[] = {
> +	{ .compatible = "qcom,spmi-sdam" },
> +	{},
> +};
> +
> +static struct platform_driver sdam_driver = {
> +	.driver = {
> +		.name = "qcom,spmi-sdam",
> +		.of_match_table = sdam_match_table,
> +	},
> +	.probe		= sdam_probe,
> +};
> +
> +static int __init sdam_init(void)
> +{
> +	return platform_driver_register(&sdam_driver);
> +}
> +subsys_initcall(sdam_init);
> +
> +static void __exit sdam_exit(void)
> +{
> +	return platform_driver_unregister(&sdam_driver);
> +}
> +module_exit(sdam_exit);
> +
> +MODULE_DESCRIPTION("QCOM SPMI SDAM driver");
> +MODULE_LICENSE("GPL v2");

DT bindings for this driver is available at 
https://lkml.org/lkml/2020/1/14/51

Regards,
Shyam
