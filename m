Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D696123F6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 07:14:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbfLRGOE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 01:14:04 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38741 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbfLRGOE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 01:14:04 -0500
Received: by mail-pf1-f193.google.com with SMTP id x185so619766pfc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 22:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ni4ioz4cHSspRUetFlkhp++4BuBbKUkcpKsMHKLoQk4=;
        b=k72dwMROlB/5xTum/N3Dg8puButRQRcfxcx7j0084cyf567O6kaSijeRu3JOQBLTr0
         4rNl5FO2DGYD2lvBEc4hWCo8mj+D9C3c5fILwFSWjQsqJhpcsTIgWJ0hilUI4jaRjLmq
         fg0sFh+IhlXpCqplZQYbihg2YWL/+w22/pMTETvjyJHwSdTtbUlRM/ESAsL0lf4EH16A
         7s9IEBg4NmQdCxUrurr4+U3ZZlXxuIm6LBHnyqjoEvjn4LCQuKqdIokRg4O/XjseCvf9
         tjqvJox9O+vjcTrdfL8yPzidXziBKRt0ByJ7/rEbfS+Lr0GiBuOZkhKhMiIO1OEN5mnY
         7suA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ni4ioz4cHSspRUetFlkhp++4BuBbKUkcpKsMHKLoQk4=;
        b=UWZsFOMLpNs4/OBCeisO85rrQQWfT/nXlrEViiG8CfjrLXNyT9meaK11KyiXHv35IS
         vMA7F4v8H504bimYeGGR4ru8hfy391XPBXmhM1lwhsVmBnTsrtrT9dYU3RDI4g24l0Db
         2RLp8tt/17SdrU2SSSQzGxjd6S5ley1kK1ntAnXWJBcfMGE5bQ9p+eF1DgRk6Lje6ydS
         Ru9luD5fHd1aMDYGO4ieK4tPOZm3vEcOQsZm/56aQEcHVqRF8eCBDL3kLcxmcPxrVE68
         AIGHcV4G3DHpwjxU78E/lrfy2s8wNMUZzkOmtePmi9A4LV68eex0lXdk1Dg4XL+7dRwA
         ugdg==
X-Gm-Message-State: APjAAAWE1sLptAuQrykEAjVlo2gupB6wzKrKABa6ELXa9IpoqiYqyO5h
        ABufNb9inLPV656U2fixBdatYB1ZXmQ=
X-Google-Smtp-Source: APXvYqwI1Ph4QcJeaM7oB8QgkRDo+T57+U4ON0O3cR11egnBxKg0EDnymABpMfPiJZHYIGs7Si+D4A==
X-Received: by 2002:aa7:968b:: with SMTP id f11mr1165731pfk.209.1576649643170;
        Tue, 17 Dec 2019 22:14:03 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x132sm987879pfc.148.2019.12.17.22.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 22:14:02 -0800 (PST)
Date:   Tue, 17 Dec 2019 22:14:00 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shyam Kumar Thella <sthella@codeaurora.org>
Cc:     srinivas.kandagatla@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] nvmem: add QTI SDAM driver
Message-ID: <20191218061400.GV3143381@builder>
References: <1576574432-9649-1-git-send-email-sthella@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576574432-9649-1-git-send-email-sthella@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 17 Dec 01:20 PST 2019, Shyam Kumar Thella wrote:

> QTI SDAM driver allows PMIC peripherals to access the shared memory
> that is available on QTI PMICs.
> 
> Change-Id: I40005646ab1fbba9e0e4aa68e0a61cfbc7b51ba6

No Change-Id upstream please.

> Signed-off-by: Shyam Kumar Thella <sthella@codeaurora.org>
[..]
> diff --git a/drivers/nvmem/qcom-spmi-sdam.c b/drivers/nvmem/qcom-spmi-sdam.c
> new file mode 100644
> index 0000000..e80a446
> --- /dev/null
> +++ b/drivers/nvmem/qcom-spmi-sdam.c
> @@ -0,0 +1,197 @@
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

As written right now, pdev is unused. But if you stash struct device *
here instead you can replace your pr_err() with dev_err() using this,
for better error messages.

> +	struct regmap			*regmap;
> +	int				base;

This would look better as a unsigned int.

> +	int				size;

Ditto, or perhaps even size_t.

> +};
> +
> +/* read only register offsets */
> +static const u8 sdam_ro_map[] = {
> +	REGISTER_MAP_ID,
> +	REGISTER_MAP_VERSION,
> +	SDAM_SIZE
> +};
> +
> +static bool is_valid(struct sdam_chip *sdam, unsigned int offset, size_t len)

Please do prefix this with "sdam_"

> +{
> +	int sdam_mem_end = SDAM_MEM_START + sdam->size - 1;
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
> +static bool is_ro(unsigned int offset, size_t len)

Ditto

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
> +static int sdam_read(void *priv, unsigned int offset, void *val, size_t bytes)
> +{
> +	struct sdam_chip *sdam = priv;
> +	int rc;
> +
> +	if (!is_valid(sdam, offset, bytes)) {
> +		pr_err("Invalid SDAM offset 0x%02x len=%zd\n", offset, bytes);

Use %#x instead of 0x%02x

> +		return -EINVAL;
> +	}
> +
> +	rc = regmap_bulk_read(sdam->regmap, sdam->base + offset, val, bytes);
> +	if (rc < 0)
> +		pr_err("Failed to read SDAM offset 0x%02x len=%zd, rc=%d\n",
> +						offset, bytes, rc);
> +
> +	return rc;
> +}
> +
> +static int sdam_write(void *priv, unsigned int offset, void *val, size_t bytes)
> +{
> +	struct sdam_chip *sdam = priv;
> +	int rc;
> +
> +	if (!is_valid(sdam, offset, bytes)) {
> +		pr_err("Invalid SDAM offset 0x%02x len=%zd\n", offset, bytes);
> +		return -EINVAL;
> +	}
> +
> +	if (is_ro(offset, bytes)) {
> +		pr_err("Invalid write offset 0x%02x len=%zd\n", offset, bytes);
> +		return -EINVAL;
> +	}
> +
> +	rc = regmap_bulk_write(sdam->regmap, sdam->base + offset, val, bytes);
> +	if (rc < 0)
> +		pr_err("Failed to write SDAM offset 0x%02x len=%zd, rc=%d\n",
> +						offset, bytes, rc);
> +
> +	return rc;
> +}
> +
> +static int sdam_probe(struct platform_device *pdev)
> +{
> +	struct sdam_chip *sdam;
> +	struct nvmem_device *nvmem;
> +	struct nvmem_config *sdam_config;
> +	unsigned int val = 0;

No need to initialize this.

> +	int rc;
> +
> +	sdam = devm_kzalloc(&pdev->dev, sizeof(*sdam), GFP_KERNEL);
> +	if (!sdam)
> +		return -ENOMEM;
> +
> +	sdam_config = devm_kzalloc(&pdev->dev, sizeof(*sdam_config),
> +							GFP_KERNEL);

Can't this be included in struct sdam_chip, for a single allocation?

> +	if (!sdam_config)
> +		return -ENOMEM;
> +
> +	sdam->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!sdam->regmap) {
> +		pr_err("Failed to get regmap handle\n");

dev_err(&pdev->dev, ...);

> +		return -ENXIO;
> +	}
> +
> +	rc = of_property_read_u32(pdev->dev.of_node, "reg", &sdam->base);

In other words, base must be u32.

> +	if (rc < 0) {
> +		pr_err("Failed to get SDAM base, rc=%d\n", rc);
> +		return -EINVAL;
> +	}
> +
> +	rc = regmap_read(sdam->regmap, sdam->base + SDAM_SIZE, &val);
> +	if (rc < 0) {
> +		pr_err("Failed to read SDAM_SIZE rc=%d\n", rc);
> +		return -EINVAL;
> +	}
> +	sdam->size = val * 32;
> +
> +	sdam_config->dev = &pdev->dev;
> +	sdam_config->name = "spmi_sdam";
> +	sdam_config->id = pdev->id;
> +	sdam_config->owner = THIS_MODULE,
> +	sdam_config->stride = 1;
> +	sdam_config->word_size = 1;
> +	sdam_config->reg_read = sdam_read;
> +	sdam_config->reg_write = sdam_write;
> +	sdam_config->priv = sdam;
> +
> +	nvmem = nvmem_register(sdam_config);
> +	if (IS_ERR(nvmem)) {
> +		pr_err("Failed to register SDAM nvmem device rc=%ld\n",
> +						PTR_ERR(nvmem));
> +		return -ENXIO;
> +	}
> +	platform_set_drvdata(pdev, nvmem);
> +
> +	pr_info("SDAM base=0x%04x size=%d registered successfully\n",
> +						sdam->base, sdam->size);

Please don't print notifications in the kernel log. You can possibly use
dev_dbg(). Or just look for devices in
/sys/bus/platform/drivers/qcom,spmi-sdam/

> +
> +	return 0;
> +}
> +
> +static int sdam_remove(struct platform_device *pdev)

Instead of using nvmem_register(), use devm_nvmem_register() and just
omit the remote function completely - which also allows you to drop the
platform_set_drvdata() above.

> +{
> +	struct nvmem_device *nvmem = platform_get_drvdata(pdev);
> +
> +	return nvmem_unregister(nvmem);
> +}
> +
> +static const struct of_device_id sdam_match_table[] = {
> +	{.compatible = "qcom,spmi-sdam"},

Please add a space after { and before }.

> +	{},
> +};
> +
> +static struct platform_driver sdam_driver = {
> +	.driver = {
> +		.name = "qcom,spmi-sdam",
> +		.of_match_table = sdam_match_table,
> +	},
> +	.probe		= sdam_probe,
> +	.remove		= sdam_remove,
> +};
> +
> +static int __init sdam_init(void)
> +{
> +	return platform_driver_register(&sdam_driver);
> +}
> +subsys_initcall(sdam_init);

module_platform_driver(sdam_driver), unless you have some strong
arguments for why this needs to be subsys_initcall

Regards,
Bjorn

> +
> +static void __exit sdam_exit(void)
> +{
> +	return platform_driver_unregister(&sdam_driver);
> +}
> +module_exit(sdam_exit);
> +
> +MODULE_DESCRIPTION("QCOM SPMI SDAM driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>  a Linux Foundation Collaborative Project
