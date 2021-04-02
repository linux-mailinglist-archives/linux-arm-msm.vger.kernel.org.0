Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5063529BE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 12:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234908AbhDBK3C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 06:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhDBK3B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 06:29:01 -0400
X-Greylist: delayed 598 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 02 Apr 2021 03:29:00 PDT
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA51EC06178A
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 03:29:00 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6A4271F542;
        Fri,  2 Apr 2021 12:19:00 +0200 (CEST)
Subject: Re: [RFC PATCH 2/2] drivers: soc: qcom: Add SDPM clock monitor driver
To:     Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ram Chandrasekar <rkumbako@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>
References: <1617346747-8611-1-git-send-email-manafm@codeaurora.org>
 <1617346747-8611-3-git-send-email-manafm@codeaurora.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <56471ee3-5bde-4169-2fb9-f33dd144ae48@somainline.org>
Date:   Fri, 2 Apr 2021 12:19:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1617346747-8611-3-git-send-email-manafm@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 02/04/21 08:59, Manaf Meethalavalappu Pallikunhi ha scritto:
> Add SDPM clock monitor driver, which will register for clock rate
> change notification and write the clock rate into SDPM CSR register.
> 
> Signed-off-by: Ram Chandrasekar <rkumbako@codeaurora.org>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
> ---
>   drivers/soc/qcom/Kconfig            |   8 ++
>   drivers/soc/qcom/Makefile           |   1 +
>   drivers/soc/qcom/sdpm_clk_monitor.c | 217 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 226 insertions(+)
>   create mode 100644 drivers/soc/qcom/sdpm_clk_monitor.c
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 9464ff4..1f04d69 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -237,4 +237,12 @@ config QCOM_APR
>   	  used by audio driver to configure QDSP6
>   	  ASM, ADM and AFE modules.
>   
> +config QCOM_SDPM_CLOCK_MONITOR
> +	tristate "Qualcomm SDPM Clock Monitor"
> +	depends on COMMON_CLK
> +	help
> +	    This enables the Qualcomm SDPM Clock Monitor. This driver can register
> +	    for different clock rate change notifications and write the clock
> +	    rate into the SDPM CSR register. This driver will receive the clock
> +	    list and the CSR details from devicetree.
>   endmenu
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index d658a10..4eef767 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -29,3 +29,4 @@ obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
>   obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=	kryo-l2-accessors.o
>   obj-$(CONFIG_QCOM_LLCC_PERFMON) += llcc_perfmon.o
>   obj-$(CONFIG_QCOM_MEMORY_DUMP_V2) += memory_dump_v2.o
> +obj-$(CONFIG_QCOM_SDPM_CLOCK_MONITOR) += sdpm_clk_monitor.o
> diff --git a/drivers/soc/qcom/sdpm_clk_monitor.c b/drivers/soc/qcom/sdpm_clk_monitor.c
> new file mode 100644
> index 00000000..1aee119
> --- /dev/null
> +++ b/drivers/soc/qcom/sdpm_clk_monitor.c
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#define pr_fmt(fmt) "%s " fmt, KBUILD_MODNAME
> +
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#define SDPM_DRIVER		"sdpm-clk-monitor"
> +#define CSR_MAX_VAL		7
> +#define CSR_OFFSET		0xF00
> +#define FREQ_HZ_TO_MHZ(f)	DIV_ROUND_UP((f), 1000000)
> +#define SDPM_CSR_OFFSET(id)	(CSR_OFFSET + (id * 4))
> +
> +struct sdpm_clk_instance;
> +struct sdpm_clk_data {
> +	struct list_head		sdpm_node;
> +	struct notifier_block		clk_rate_nb;
> +	struct clk			*clk;
> +	const char			*clock_name;
> +	uint32_t			csr_id;
> +	struct sdpm_clk_instance	*sdpm_inst;
> +};
> +
> +struct sdpm_clk_instance {
> +	struct device			*dev;
> +	void __iomem			*regmap;
> +	struct list_head		sdpm_instances;
> +};
> +
> +static void sdpm_csr_write(struct sdpm_clk_data *sdpm_data,
> +				unsigned long clk_rate)
> +{
> +	struct sdpm_clk_instance *sdpm_inst = sdpm_data->sdpm_inst;
> +
> +	writel_relaxed(clk_rate, sdpm_inst->regmap +
> +			SDPM_CSR_OFFSET(sdpm_data->csr_id));
> +	dev_dbg(sdpm_inst->dev, "clock:%s offset:0x%x frequency:%u\n",
> +			sdpm_data->clock_name,
> +			SDPM_CSR_OFFSET(sdpm_data->csr_id),
> +			clk_rate);
> +}
> +
> +static int sdpm_clock_notifier(struct notifier_block *nb,
> +					unsigned long event, void *data)
> +{
> +	struct clk_notifier_data *ndata = data;
> +	struct sdpm_clk_data *sdpm_data = container_of(nb,
> +				struct sdpm_clk_data, clk_rate_nb);
> +
> +	dev_dbg(sdpm_data->sdpm_inst->dev, "clock:%s event:%lu\n",
> +			sdpm_data->clock_name, event);
> +	switch (event) {
> +	case PRE_RATE_CHANGE:
> +		if (ndata->new_rate > ndata->old_rate)
> +			sdpm_csr_write(sdpm_data,
> +					FREQ_HZ_TO_MHZ(ndata->new_rate));
> +		return NOTIFY_DONE;
> +	case POST_RATE_CHANGE:
> +		if (ndata->new_rate < ndata->old_rate)
> +			sdpm_csr_write(sdpm_data,
> +					FREQ_HZ_TO_MHZ(ndata->new_rate));
> +		return NOTIFY_DONE;
> +	case ABORT_RATE_CHANGE:
> +		if (ndata->new_rate > ndata->old_rate)
> +			sdpm_csr_write(sdpm_data,
> +					FREQ_HZ_TO_MHZ(ndata->old_rate));
> +		return NOTIFY_DONE;
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +}
> +
> +static int sdpm_clk_device_remove(struct platform_device *pdev)
> +{
> +	struct sdpm_clk_instance *sdpm_inst =
> +		(struct sdpm_clk_instance *)dev_get_drvdata(&pdev->dev);
> +	struct sdpm_clk_data *sdpm_data = NULL, *next = NULL;
> +
> +	list_for_each_entry_safe(sdpm_data, next,
> +			&sdpm_inst->sdpm_instances, sdpm_node) {
> +		clk_notifier_unregister(sdpm_data->clk,
> +					&sdpm_data->clk_rate_nb);
> +		list_del(&sdpm_data->sdpm_node);
> +	}
> +
> +	return 0;
> +}
> +
> +static int sdpm_clk_device_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *dev_node = dev->of_node;
> +	int ret = 0, idx = 0, clk_ct = 0, csr = 0, csr_ct = 0;
> +	struct sdpm_clk_instance *sdpm_inst = NULL;
> +	struct sdpm_clk_data *sdpm_data = NULL;
> +	struct resource *res;
> +
> +	sdpm_inst = devm_kzalloc(dev, sizeof(*sdpm_inst), GFP_KERNEL);
> +	if (!sdpm_inst)
> +		return -ENOMEM;
> +	sdpm_inst->dev = dev;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(dev, "Couldn't get MEM resource\n");
> +		return -EINVAL;
> +	}
> +	dev_dbg(dev, "sdpm@0x%x size:%d\n", res->start,
> +			resource_size(res));
> +	dev_set_drvdata(dev, sdpm_inst);
> +
> +	sdpm_inst->regmap = devm_ioremap_resource(dev, res);
> +	if (!sdpm_inst->regmap) {
> +		dev_err(dev, "Couldn't get regmap\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = of_property_count_strings(dev_node, "clock-names");
> +	if (ret <= 0) {
> +		dev_err(dev, "Couldn't get clock names. %d\n", ret);
> +		return ret;
> +	}
> +	clk_ct = ret;
> +	ret = of_property_count_u32_elems(dev_node, "csr-id");
> +	if (ret <= 0) {
> +		dev_err(dev, "Couldn't get csr ID array. %d\n", ret);
> +		return ret;
> +	}
> +	csr_ct = ret;
> +
> +	if (csr_ct != clk_ct) {
> +		dev_err(dev, "Invalid csr:%d and clk:%d count.\n", csr_ct,
> +				clk_ct);
> +		return -EINVAL;
> +	}
> +
> +	INIT_LIST_HEAD(&sdpm_inst->sdpm_instances);
> +
> +	for (idx = 0; idx < clk_ct; idx++) {
> +
> +		sdpm_data = devm_kzalloc(dev, sizeof(*sdpm_data), GFP_KERNEL);
> +		if (!sdpm_data) {
> +			ret = -ENOMEM;
> +			goto clk_err_exit;
> +		}
> +
> +		ret = of_property_read_string_index(dev_node, "clock-names",
> +				idx, &sdpm_data->clock_name);
> +		if (ret < 0) {
> +			dev_err(dev, "Couldn't get clk name index:%d. %d\n",
> +					idx, ret);
> +			goto clk_err_exit;
> +		}
> +
> +		sdpm_data->clk = devm_clk_get(dev, sdpm_data->clock_name);
> +		if (IS_ERR(sdpm_data->clk)) {
> +			ret = PTR_ERR(sdpm_data->clk);
> +			goto clk_err_exit;
> +		}
> +
> +		ret = of_property_read_u32_index(dev_node, "csr-id", idx, &csr);
> +		if (ret < 0) {
> +			dev_err(dev, "Couldn't get CSR for index:%d. %d\n",
> +					idx, ret);
> +			goto clk_err_exit;
> +		}
> +
> +		if (ret > CSR_MAX_VAL) {
> +			dev_err(dev, "Invalid CSR %d\n", csr);
> +			ret = -EINVAL;
> +			goto clk_err_exit;
> +		}
> +
> +		dev_dbg(dev, "SDPM clock:%s csr:%d initialized\n",
> +				sdpm_data->clock_name, csr);
> +		sdpm_data->csr_id = csr;
> +		sdpm_data->sdpm_inst = sdpm_inst;
> +		sdpm_data->clk_rate_nb.notifier_call = sdpm_clock_notifier;
> +		sdpm_csr_write(sdpm_data,
> +			FREQ_HZ_TO_MHZ(clk_get_rate(sdpm_data->clk)));
> +		clk_notifier_register(sdpm_data->clk, &sdpm_data->clk_rate_nb);
> +		list_add(&sdpm_data->sdpm_node, &sdpm_inst->sdpm_instances);
> +	}
> +
> +	return 0;
> +
> +clk_err_exit:
> +	sdpm_clk_device_remove(pdev);
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id sdpm_clk_device_match[] = {
> +	{.compatible = "qcom,sdpm"},
> +	{}
> +};
> +
> +static struct platform_driver sdpm_clk_device_driver = {
> +	.probe          = sdpm_clk_device_probe,
> +	.remove         = sdpm_clk_device_remove,
> +	.driver         = {
> +		.name   = SDPM_DRIVER,
> +		.of_match_table = sdpm_clk_device_match,
> +	},
> +};
> +module_platform_driver(sdpm_clk_device_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. SDPM Clock Monitor Driver");
> +MODULE_LICENSE("GPL v2");
> 
Hello!

Thanks for the patch. A few things to point out:

Before getting into a big lack of time situation, I have written a 
functional driver for the Qualcomm System Performance Dynamic Monitoring 
(SPDM), which has to yet be cleaned up before sending.
This driver appears to be "SDPM" instead, but the finalities of this new 
block seem to be very similar - if not the same - as the SPDM.

My SPDM implementation was done as an interconnect driver, as that is 
actually controlling the bandwidth of the CCI on the SoC.


Is this block doing the same and/or anything similar?
In case it does, I suggest to look at my *still a bit dirty* (sorry!) 
driver for the SPDM-TZ.

Please, look at the last three commits from this branch:
https://github.com/SoMainline/linux/commits/angelo/v5.12-rc4-feat-spdmtz

Yours,
- Angelo
