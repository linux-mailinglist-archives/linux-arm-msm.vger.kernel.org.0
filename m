Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66AC1288098
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 05:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731401AbgJIDBW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Oct 2020 23:01:22 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:12077 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728854AbgJIDBW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Oct 2020 23:01:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602212480; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Jm5p7SZBH799au37LdrySZI/VbbvbayBR9LfpJTRzs0=; b=Wd3dc7lRkgsRmj0QNJzHcv8DLzAeE/RLC5D2kDT/3MmT6wp86gitoriWr0rm73V006LkMByS
 HMDt8bgAsdx9Syqty0+VKqjM/+oMN5VtkrkAsMJ1k3+daKkXYsd7iBqTaV2EUUknsf9/ptqI
 t7rKlUYIdpxAshzBbb3Jn5/Ej0o=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f7fd280d6d00c7a9e63d143 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Oct 2020 03:01:20
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3FCBCC433F1; Fri,  9 Oct 2020 03:01:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D7869C433CB;
        Fri,  9 Oct 2020 03:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D7869C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v3] bus: mhi: Add MHI PCI support for WWAN modems
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        jhugo@codeaurora.org
References: <1601996090-7426-1-git-send-email-loic.poulain@linaro.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <24fadb18-95e4-0ff7-b139-f8f163db1ed1@codeaurora.org>
Date:   Thu, 8 Oct 2020 20:01:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1601996090-7426-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

On 10/6/20 7:54 AM, Loic Poulain wrote:
> This is a generic MHI-over-PCI controller driver for MHI only devices
> such as QCOM modems. For now it supports registering of Qualcomm SDX55
> based PCIe modules. The MHI channels have been extracted from mhi
> downstream driver.
> 
> This driver is for MHI-only devices which have all functionnalities
> exposed through MHI channels and accessed by the corresponding MHI
> device drivers (no out-of-band communication).
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>   v2: - remove useless delay.h include
>       - remove over-logging on error
>       - remove controller subdir
>       - rename to mhi_pci_modem.c
>       - Fix mhi_pci_probe exit path on error
>       - expand module description
>       - drop module version
>   v3: - Rename to mhi_pci_generic
>       - Add hardware accelerated IP channel (IPA)
>       - Added fw/edl names for sdx55m
>   
>   drivers/bus/mhi/Kconfig           |   9 ++
>   drivers/bus/mhi/Makefile          |   3 +
>   drivers/bus/mhi/mhi_pci_generic.c | 332 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 344 insertions(+)
>   create mode 100644 drivers/bus/mhi/mhi_pci_generic.c
> 
> diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
> index e841c10..daa8528 100644
> --- a/drivers/bus/mhi/Kconfig
> +++ b/drivers/bus/mhi/Kconfig
> @@ -20,3 +20,12 @@ config MHI_BUS_DEBUG
>   	  Enable debugfs support for use with the MHI transport. Allows
>   	  reading and/or modifying some values within the MHI controller
>   	  for debug and test purposes.
> +
> +config MHI_BUS_PCI_GENERIC
> +	tristate "MHI PCI controller driver"
> +	depends on MHI_BUS
> +	depends on PCI
> +	help
> +	  This driver provides Modem Host Interface (MHI) PCI controller driver
> +	  for devices such as Qualcomm SDX55 based PCIe modems.
> +
> diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
> index 19e6443..d1a4ef3 100644
> --- a/drivers/bus/mhi/Makefile
> +++ b/drivers/bus/mhi/Makefile
> @@ -1,2 +1,5 @@
>   # core layer
>   obj-y += core/
> +
> +obj-$(CONFIG_MHI_BUS_PCI_GENERIC) := mhi_pci_generic.o
> +
> diff --git a/drivers/bus/mhi/mhi_pci_generic.c b/drivers/bus/mhi/mhi_pci_generic.c
> new file mode 100644
> index 0000000..03fcf76
> --- /dev/null
> +++ b/drivers/bus/mhi/mhi_pci_generic.c
> @@ -0,0 +1,332 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * MHI PCI driver - MHI over PCI controller driver
> + *
> + * This module is a generic driver for registering MHI-over-PCI devices,
> + * such as PCIe QCOM modems.
> + *
> + * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/mhi.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +
> +#define MHI_PCI_BAR_NUM 0
> +
> +struct mhi_pci_dev_info {
> +	const struct mhi_controller_config *config;
> +	const char *name;
> +	const char *fw;
> +	const char *edl;
> +};
> +
> +#define MHI_CHANNEL_CONFIG_TX(cnum, cname, elems, event)	\MHI core driver used uplink and downlink naming for channels, does it 
make sense to follow same naming instead of TX and RX?
> +	{							\
> +		.num = cnum,					\
> +		.name = cname,					\
> +		.num_elements = elems,				\
> +		.event_ring = event,				\
> +		.dir = DMA_TO_DEVICE,				\
> +		.ee_mask = BIT(MHI_EE_AMSS),			\
> +		.pollcfg = 0,					\
> +		.doorbell = MHI_DB_BRST_DISABLE,		\
> +		.lpm_notify = false,				\
> +		.offload_channel = false,			\
> +		.doorbell_mode_switch = false,			\
> +	}							\
> +
> +#define MHI_CHANNEL_CONFIG_RX(cnum, cname, elems, event)	\
> +	{							\
> +		.num = cnum,					\
> +		.name = cname,					\
> +		.num_elements = elems,				\
> +		.event_ring = event,				\
> +		.dir = DMA_FROM_DEVICE,				\
> +		.ee_mask = BIT(MHI_EE_AMSS),			\
> +		.pollcfg = 0,					\
> +		.doorbell = MHI_DB_BRST_DISABLE,		\
> +		.lpm_notify = false,				\
> +		.offload_channel = false,			\
> +		.doorbell_mode_switch = false,			\
> +	}
> +
> +#define MHI_EVENT_CONFIG_CTRL(enum)		\
> +	{					\
> +		.num_elements = 64,		\
> +		.irq_moderation_ms = 5,		\
> +		.irq = enum,			\
> +		.priority = 1,			\
> +		.mode = MHI_DB_BRST_DISABLE,	\
> +		.data_type = MHI_ER_CTRL,	\
> +		.hardware_event = false,	\
> +		.client_managed = false,	\
> +		.offload_channel = false,	\
> +	}
> +
> +#define MHI_EVENT_CONFIG_DATA(enum)		\
> +	{					\
> +		.num_elements = 64,		\
> +		.irq_moderation_ms = 5,		\
> +		.irq = enum,			\
> +		.priority = 1,			\
> +		.mode = MHI_DB_BRST_DISABLE,	\
> +		.data_type = MHI_ER_DATA,	\
> +		.hardware_event = false,	\
> +		.client_managed = false,	\
> +		.offload_channel = false,	\
> +	}
> +
> +#define MHI_EVENT_CONFIG_HW_DATA(enum, cnum)	\
> +	{					\
> +		.num_elements = 64,		\
> +		.irq_moderation_ms = 5,		\
> +		.irq = enum,			\
> +		.priority = 1,			\
> +		.mode = MHI_DB_BRST_ENABLE,	\
> +		.data_type = MHI_ER_DATA,	\
> +		.hardware_event = true,		\
> +		.client_managed = false,	\
> +		.offload_channel = false,	\
> +		.channel = cnum,		\
> +	}
> +
> +static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
> +	MHI_CHANNEL_CONFIG_TX(12, "MBIM", 4, 0),
> +	MHI_CHANNEL_CONFIG_RX(13, "MBIM", 4, 0),
> +	MHI_CHANNEL_CONFIG_TX(14, "QMI", 4, 0),
> +	MHI_CHANNEL_CONFIG_RX(15, "QMI", 4, 0),
> +	MHI_CHANNEL_CONFIG_TX(20, "IPCR", 4, 0),
> +	MHI_CHANNEL_CONFIG_RX(21, "IPCR", 4, 0),
> +	MHI_CHANNEL_CONFIG_TX(100, "IP_HW0", 64, 1),
> +	MHI_CHANNEL_CONFIG_RX(101, "IP_HW0", 64, 2),
How did you verify the data path/MBIM/QMI control path using SDx55 modem?
> +};
> +
> +static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
> +	/* first ring is control+data ring */
> +	MHI_EVENT_CONFIG_CTRL(0),
> +	/* Hardware channels request dedicated hardware event rings */
> +	MHI_EVENT_CONFIG_HW_DATA(1, 100),
> +	MHI_EVENT_CONFIG_HW_DATA(2, 101)
> +};
> +
> +static const struct mhi_controller_config modem_qcom_v1_mhi_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 5000,
> +	.num_channels = ARRAY_SIZE(modem_qcom_v1_mhi_channels),
> +	.ch_cfg = modem_qcom_v1_mhi_channels,
> +	.num_events = ARRAY_SIZE(modem_qcom_v1_mhi_events),
> +	.event_cfg = modem_qcom_v1_mhi_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
> +	.name = "qcom-sdx55m",
> +	.fw = "qcom/sdx55m/sbl1.mbn",
> +	.edl = "qcom/sdx55m/edl.mbn",
> +	.config = &modem_qcom_v1_mhi_config
> +};
> +
> +static const struct pci_device_id mhi_pci_id_table[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
> +		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
> +	{  }
> +};
> +MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> +
> +static int mhi_pci_read_reg(struct mhi_controller *mhic, void __iomem *addr,
> +			    u32 *out)
> +{
> +	*out = readl(addr);
> +	return 0;
> +}
> +
> +static void mhi_pci_write_reg(struct mhi_controller *mhic, void __iomem *addr,
> +			      u32 val)
> +{
> +	writel(val, addr);
> +}
> +
> +static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
> +			      enum mhi_callback cb)
> +{
> +	return;
> +}
> +
> +static int mhi_pci_claim(struct mhi_controller *mhic)
> +{
> +	struct pci_dev *pdev = to_pci_dev(mhic->cntrl_dev);
> +	int err;
> +
> +	err = pci_assign_resource(pdev, MHI_PCI_BAR_NUM);
> +	if (err)
> +		return err;
> +
> +	err = pcim_enable_device(pdev);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to enable pci device: %d\n", err);
> +		return err;
> +	}
> +
> +	err = pcim_iomap_regions(pdev, 1 << MHI_PCI_BAR_NUM, pci_name(pdev));
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to map pci region: %d\n", err);
> +		return err;
> +	}
> +	mhic->regs = pcim_iomap_table(pdev)[MHI_PCI_BAR_NUM];
> +
> +	err = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
> +	if (err) {
> +		dev_err(&pdev->dev, "Cannot set proper DMA mask\n");
> +		return err;
> +	}
> +
> +	err = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32));
> +	if (err) {
> +		dev_err(&pdev->dev, "set consistent dma mask failed\n");
> +		return err;
> +	}
> +
> +	pci_set_master(pdev);
> +
> +	return 0;
> +}
> +
> +static int mhi_pci_get_irqs(struct mhi_controller *mhic,
> +			    const struct mhi_controller_config *mhic_config)
> +{
> +	struct pci_dev *pdev = to_pci_dev(mhic->cntrl_dev);
> +	int num_vectors, i;
> +	int *irq;
> +
> +	/*
> +	 * Alloc one MSI vector per event ring, ideally...
> +	 * No explicit pci_free_irq_vectors required, done by pcim_release
> +	 */
> +	num_vectors = pci_alloc_irq_vectors(pdev, 1, mhic_config->num_events,
By default MSI 0 is used for BHI intevec, pls refer mhi_async_power_up() 
in mhi core (pm.c) which writes 0 to BHI_INTVEC register. Which means 
all execution environment change, MHI reset completion, BHI and BHIe 
status change interrupts are triggered using MSI 0 (handled using 
mhi_intvec_handler. Since MSI0 is used for bhi intvec MSI 1 and above 
are used for events.
> +					    PCI_IRQ_MSI);
> +	if (num_vectors < 0) {
> +		dev_err(&pdev->dev, "Error allocating MSI vectors %d\n",
> +			num_vectors);
> +		return num_vectors;
> +	}
> +
> +	if (num_vectors < mhic_config->num_events) {
> +		dev_warn(&pdev->dev, "Not enough MSI vectors (%d/%d)\n",
> +			 num_vectors, mhic_config->num_events);
> +		/* use shared IRQ */
> +	}
> +
> +	irq = devm_kcalloc(&pdev->dev, mhic_config->num_events, sizeof(int),
> +			   GFP_KERNEL);
> +	if (!irq)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < mhic_config->num_events; i++) {
> +		int vector = i >= num_vectors ? (num_vectors - 1) : i;
> +
> +		irq[i] = pci_irq_vector(pdev, vector);
> +	}
> +
> +	mhic->irq = irq;
> +	mhic->nr_irqs = mhic_config->num_events;
> +
> +	return 0;
> +}
> +
> +static int mhi_pci_runtime_get(struct mhi_controller *mhi_cntrl)
> +{
> +	/* no PM for now */
> +	return 0;
> +}
> +
> +static void mhi_pci_runtime_put(struct mhi_controller *mhi_cntrl)
> +{
> +	/* no PM for now */
> +	return;
> +}
> +
> +static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> +{
> +	const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
> +	const struct mhi_controller_config *mhic_config;
> +	struct mhi_controller *mhic;
> +	int err;
> +
> +	dev_info(&pdev->dev, "MHI PCI device found: %s\n", info->name);
> +
> +	mhic = devm_kzalloc(&pdev->dev, sizeof(*mhic), GFP_KERNEL);
> +	if (!mhic)
> +		return -ENOMEM;
> +
> +	mhic_config = info->config;
> +	mhic->cntrl_dev = &pdev->dev;
> +	mhic->iova_start = 0;
> +	mhic->iova_stop = 0xffffffff;
> +	mhic->fw_image = info->fw;
> +	mhic->edl_image = info->edl;
> +
> +	mhic->read_reg = mhi_pci_read_reg;
> +	mhic->write_reg = mhi_pci_write_reg;
> +	mhic->status_cb = mhi_pci_status_cb;
> +	mhic->runtime_get = mhi_pci_runtime_get;
> +	mhic->runtime_put = mhi_pci_runtime_put;
> +
> +	err = mhi_pci_claim(mhic);
> +	if (err)
> +		return err;
> +
> +	err = mhi_pci_get_irqs(mhic, mhic_config);
> +	if (err)
> +		return err;
> +
> +	pci_set_drvdata(pdev, mhic);
> +
> +	err = mhi_register_controller(mhic, mhic_config);
> +	if (err)
> +		return err;
> +
> +	/* MHI bus does not power up the controller by default */
> +	err = mhi_prepare_for_power_up(mhic);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to prepare MHI controller\n");
> +		goto err_unregister;
> +	}
> +
> +	err = mhi_sync_power_up(mhic);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to power up MHI controller\n");
> +		goto err_unprepare;
> +	}
> +
> +	return 0;
> +
> +err_unprepare:
> +	mhi_unprepare_after_power_down(mhic);
> +
> +err_unregister:
> +	mhi_unregister_controller(mhic);
> +
> +	return err;
> +}
> +
> +static void mhi_pci_remove(struct pci_dev *pdev)
> +{
> +	struct mhi_controller *mhic = pci_get_drvdata(pdev);
> +
> +	mhi_power_down(mhic, false);
> +	mhi_unprepare_after_power_down(mhic);
> +	mhi_unregister_controller(mhic);
> +}
> +
> +static struct pci_driver mhi_pci_driver = {
> +	.name		= "mhi-pci-generic",
> +	.id_table	= mhi_pci_id_table,
> +	.probe		= mhi_pci_probe,
> +	.remove		= mhi_pci_remove
> +};
> +module_pci_driver(mhi_pci_driver);
> +
> +MODULE_AUTHOR("Loic Poulain <loic.poulain@linaro,org>");
> +MODULE_DESCRIPTION("Modem Host Interface (MHI) PCI controller driver");
> +MODULE_LICENSE("GPL");
> 
Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
