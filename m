Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6B40125EEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 11:29:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfLSK3b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 05:29:31 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:20860 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726633AbfLSK3b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 05:29:31 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576751370; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=I9qdGoXyzJL5FK/NNe6J0jNkgxIYZtJ1rAN41woyFQs=;
 b=hoiUkfjOklDa+C4iCMRMgj4IMM3mkZxvsGVYtWiubQcFj4voKVdN2IA+i/ZRhyqLcd6W4+R9
 thG6IQnhHwftPVWkXXenIzx6TRnPVpYh6v231JDtogmDDKaWCoAoxnsszXtsVA9JeF7Dbvlk
 /zrMt3IfzqBcW5jiCNxFIxVToLs=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfb5101.7f39eb5fb650-smtp-out-n03;
 Thu, 19 Dec 2019 10:29:21 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 09AE1C4A272; Thu, 19 Dec 2019 10:29:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sthella)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EC411C4A26E;
        Thu, 19 Dec 2019 10:29:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 19 Dec 2019 15:59:18 +0530
From:   sthella@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     srinivas.kandagatla@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] nvmem: add QTI SDAM driver
In-Reply-To: <20191218061400.GV3143381@builder>
References: <1576574432-9649-1-git-send-email-sthella@codeaurora.org>
 <20191218061400.GV3143381@builder>
Message-ID: <17c718c483db710b32b2dbbcf4637783@codeaurora.org>
X-Sender: sthella@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-12-18 11:44, Bjorn Andersson wrote:
> On Tue 17 Dec 01:20 PST 2019, Shyam Kumar Thella wrote:
> 
>> QTI SDAM driver allows PMIC peripherals to access the shared memory
>> that is available on QTI PMICs.
>> 
>> Change-Id: I40005646ab1fbba9e0e4aa68e0a61cfbc7b51ba6
> 
> No Change-Id upstream please.
OK. I will remove it in next patch set.
> 
>> Signed-off-by: Shyam Kumar Thella <sthella@codeaurora.org>
> [..]
>> diff --git a/drivers/nvmem/qcom-spmi-sdam.c 
>> b/drivers/nvmem/qcom-spmi-sdam.c
>> new file mode 100644
>> index 0000000..e80a446
>> --- /dev/null
>> +++ b/drivers/nvmem/qcom-spmi-sdam.c
>> @@ -0,0 +1,197 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2017 The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/nvmem-provider.h>
>> +#include <linux/regmap.h>
>> +
>> +#define SDAM_MEM_START			0x40
>> +#define REGISTER_MAP_ID			0x40
>> +#define REGISTER_MAP_VERSION		0x41
>> +#define SDAM_SIZE			0x44
>> +#define SDAM_PBS_TRIG_SET		0xE5
>> +#define SDAM_PBS_TRIG_CLR		0xE6
>> +
>> +struct sdam_chip {
>> +	struct platform_device		*pdev;
> 
> As written right now, pdev is unused. But if you stash struct device *
> here instead you can replace your pr_err() with dev_err() using this,
> for better error messages.
> 
I will use dev_err messages in next patchset.
>> +	struct regmap			*regmap;
>> +	int				base;
> 
> This would look better as a unsigned int.
OK. I will do it in next patch set.
> 
>> +	int				size;
> 
> Ditto, or perhaps even size_t.
OK. I will do it.
> 
>> +};
>> +
>> +/* read only register offsets */
>> +static const u8 sdam_ro_map[] = {
>> +	REGISTER_MAP_ID,
>> +	REGISTER_MAP_VERSION,
>> +	SDAM_SIZE
>> +};
>> +
>> +static bool is_valid(struct sdam_chip *sdam, unsigned int offset, 
>> size_t len)
> 
> Please do prefix this with "sdam_"
OK. I will prefix is_valid and is_ro with "sdam_".
> 
>> +{
>> +	int sdam_mem_end = SDAM_MEM_START + sdam->size - 1;
>> +
>> +	if (!len)
>> +		return false;
>> +
>> +	if (offset >= SDAM_MEM_START && offset <= sdam_mem_end
>> +				&& (offset + len - 1) <= sdam_mem_end)
>> +		return true;
>> +	else if ((offset == SDAM_PBS_TRIG_SET || offset == 
>> SDAM_PBS_TRIG_CLR)
>> +				&& (len == 1))
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>> +static bool is_ro(unsigned int offset, size_t len)
> 
> Ditto
OK.
> 
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(sdam_ro_map); i++)
>> +		if (offset <= sdam_ro_map[i] && (offset + len) > sdam_ro_map[i])
>> +			return true;
>> +
>> +	return false;
>> +}
>> +
>> +static int sdam_read(void *priv, unsigned int offset, void *val, 
>> size_t bytes)
>> +{
>> +	struct sdam_chip *sdam = priv;
>> +	int rc;
>> +
>> +	if (!is_valid(sdam, offset, bytes)) {
>> +		pr_err("Invalid SDAM offset 0x%02x len=%zd\n", offset, bytes);
> 
> Use %#x instead of 0x%02x
OK. Will do it in next patch set.
> 
>> +		return -EINVAL;
>> +	}
>> +
>> +	rc = regmap_bulk_read(sdam->regmap, sdam->base + offset, val, 
>> bytes);
>> +	if (rc < 0)
>> +		pr_err("Failed to read SDAM offset 0x%02x len=%zd, rc=%d\n",
>> +						offset, bytes, rc);
>> +
>> +	return rc;
>> +}
>> +
>> +static int sdam_write(void *priv, unsigned int offset, void *val, 
>> size_t bytes)
>> +{
>> +	struct sdam_chip *sdam = priv;
>> +	int rc;
>> +
>> +	if (!is_valid(sdam, offset, bytes)) {
>> +		pr_err("Invalid SDAM offset 0x%02x len=%zd\n", offset, bytes);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (is_ro(offset, bytes)) {
>> +		pr_err("Invalid write offset 0x%02x len=%zd\n", offset, bytes);
>> +		return -EINVAL;
>> +	}
>> +
>> +	rc = regmap_bulk_write(sdam->regmap, sdam->base + offset, val, 
>> bytes);
>> +	if (rc < 0)
>> +		pr_err("Failed to write SDAM offset 0x%02x len=%zd, rc=%d\n",
>> +						offset, bytes, rc);
>> +
>> +	return rc;
>> +}
>> +
>> +static int sdam_probe(struct platform_device *pdev)
>> +{
>> +	struct sdam_chip *sdam;
>> +	struct nvmem_device *nvmem;
>> +	struct nvmem_config *sdam_config;
>> +	unsigned int val = 0;
> 
> No need to initialize this.
OK. I will remove initialization in next patch set.
> 
>> +	int rc;
>> +
>> +	sdam = devm_kzalloc(&pdev->dev, sizeof(*sdam), GFP_KERNEL);
>> +	if (!sdam)
>> +		return -ENOMEM;
>> +
>> +	sdam_config = devm_kzalloc(&pdev->dev, sizeof(*sdam_config),
>> +							GFP_KERNEL);
> 
> Can't this be included in struct sdam_chip, for a single allocation?
OK. I will make this a member in struct sdam_chip and eliminate need for 
dynamic allocation.
> 
>> +	if (!sdam_config)
>> +		return -ENOMEM;
>> +
>> +	sdam->regmap = dev_get_regmap(pdev->dev.parent, NULL);
>> +	if (!sdam->regmap) {
>> +		pr_err("Failed to get regmap handle\n");
> 
> dev_err(&pdev->dev, ...);
OK. I will change all pr_err()... to dev_err().
> 
>> +		return -ENXIO;
>> +	}
>> +
>> +	rc = of_property_read_u32(pdev->dev.of_node, "reg", &sdam->base);
> 
> In other words, base must be u32.
OK. This will be changed to u32 in next patchs et.
> 
>> +	if (rc < 0) {
>> +		pr_err("Failed to get SDAM base, rc=%d\n", rc);
>> +		return -EINVAL;
>> +	}
>> +
>> +	rc = regmap_read(sdam->regmap, sdam->base + SDAM_SIZE, &val);
>> +	if (rc < 0) {
>> +		pr_err("Failed to read SDAM_SIZE rc=%d\n", rc);
>> +		return -EINVAL;
>> +	}
>> +	sdam->size = val * 32;
>> +
>> +	sdam_config->dev = &pdev->dev;
>> +	sdam_config->name = "spmi_sdam";
>> +	sdam_config->id = pdev->id;
>> +	sdam_config->owner = THIS_MODULE,
>> +	sdam_config->stride = 1;
>> +	sdam_config->word_size = 1;
>> +	sdam_config->reg_read = sdam_read;
>> +	sdam_config->reg_write = sdam_write;
>> +	sdam_config->priv = sdam;
>> +
>> +	nvmem = nvmem_register(sdam_config);
>> +	if (IS_ERR(nvmem)) {
>> +		pr_err("Failed to register SDAM nvmem device rc=%ld\n",
>> +						PTR_ERR(nvmem));
>> +		return -ENXIO;
>> +	}
>> +	platform_set_drvdata(pdev, nvmem);
>> +
>> +	pr_info("SDAM base=0x%04x size=%d registered successfully\n",
>> +						sdam->base, sdam->size);
> 
> Please don't print notifications in the kernel log. You can possibly 
> use
> dev_dbg(). Or just look for devices in
> /sys/bus/platform/drivers/qcom,spmi-sdam/
OK. I would usedev_dbg() to serve the purpose.
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int sdam_remove(struct platform_device *pdev)
> 
> Instead of using nvmem_register(), use devm_nvmem_register() and just
> omit the remote function completely - which also allows you to drop the
> platform_set_drvdata() above.
Yes. You are right. That will help omit remove and 
platform_set_drvdata().
> 
>> +{
>> +	struct nvmem_device *nvmem = platform_get_drvdata(pdev);
>> +
>> +	return nvmem_unregister(nvmem);
>> +}
>> +
>> +static const struct of_device_id sdam_match_table[] = {
>> +	{.compatible = "qcom,spmi-sdam"},
> 
> Please add a space after { and before }.
OK. I will add spaces.
> 
>> +	{},
>> +};
>> +
>> +static struct platform_driver sdam_driver = {
>> +	.driver = {
>> +		.name = "qcom,spmi-sdam",
>> +		.of_match_table = sdam_match_table,
>> +	},
>> +	.probe		= sdam_probe,
>> +	.remove		= sdam_remove,
>> +};
>> +
>> +static int __init sdam_init(void)
>> +{
>> +	return platform_driver_register(&sdam_driver);
>> +}
>> +subsys_initcall(sdam_init);
> 
> module_platform_driver(sdam_driver), unless you have some strong
> arguments for why this needs to be subsys_initcall
There are some critical sybsystems which depend on nvmem data. So I 
would prefer using subsys_initcall().
> 
> Regards,
> Bjorn
> 
>> +
>> +static void __exit sdam_exit(void)
>> +{
>> +	return platform_driver_unregister(&sdam_driver);
>> +}
>> +module_exit(sdam_exit);
>> +
>> +MODULE_DESCRIPTION("QCOM SPMI SDAM driver");
>> +MODULE_LICENSE("GPL v2");
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>>  a Linux Foundation Collaborative Project
