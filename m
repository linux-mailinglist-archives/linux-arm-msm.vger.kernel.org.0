Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2402E2A809E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 15:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730862AbgKEORa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 09:17:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730854AbgKEOR3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 09:17:29 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 932F8C0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2020 06:17:29 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id x13so1513848pgp.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2020 06:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=v3bLfb2xDXzwtNZ2z5NYyyNGWtF5lzbHK9NINOG6RDA=;
        b=mHJLDaXCAWuIZ0NcbCjz8kVlz+PTUIF9t4QnR+YFMGPvMvYFVk/u6IIU0CWXBAe6Mw
         AFc/5ZWlBOXBd90gsF+gMJMDwq05YXWpD20G4IG4TRv/b+7AvJNw7rO+8aPXkaFeGxJ1
         CzmQCh1yYNcuXTNWtmL2DK7gNNEVGbmd8eXyI58MU9terRjjDd5+eHd4cwsb/01man1N
         BgikG3ZtvXcSsh2Xp+BSNiwwo7bbZAmNSso3pG7mDPjwgc6+vytYCyQJv9IhrJ52osgs
         dKMx4MImhwcRjZmfzWG6PcDvOQGQa1lzpll+EBDi8NEp7JDscpstj82D7bPVTTUGEdLy
         0GFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v3bLfb2xDXzwtNZ2z5NYyyNGWtF5lzbHK9NINOG6RDA=;
        b=YLsUHuXhLKRozf9b1pfPqVsXfsaEFaTiGZ98MVkOMLuMDrrqk8h6vllVUNFwNZGg7B
         KbfuCAFlKKlK/lyxkXmoGGc1FyAohQxfbJHdSQLMm4JQ6ZKEk/NuZTbDju9TQQa7mcOa
         mU4Kf9UOy/Z8AHLLFvqyxeS6MlYlApzJvJKM1pn6faQrf6qFBRouL6RX3mV0VNJgQJCL
         9oVOc64Xc2uXYPdn8DCv62I28+nn5vGlogT0dqUVS3wjH+xLxWT6K/7LzlsP9ifQ9XDN
         5G7aGxBJMdjobGz+IoSTfrjhgjpMsg94xyANB3pJb9FEW4f74FzSAlVMwO2ptKzoiLfK
         oy7g==
X-Gm-Message-State: AOAM530dcTlxwMHLPg5CHvvSQz/XIUnkXkaY/0rmOx2m8NfwzGn/C7nl
        WZMowGwScUfQWzYzH+PCczqAS9UbDU1e
X-Google-Smtp-Source: ABdhPJyyz0c2QjU/7fBvvlH2OODt7qNcI7kWYU5HOZxA8Sd+er+3fIHJlQ2ORDI4Nlm51ueyMW8+4w==
X-Received: by 2002:a62:be04:0:b029:15d:7423:e320 with SMTP id l4-20020a62be040000b029015d7423e320mr2648826pff.42.1604585848982;
        Thu, 05 Nov 2020 06:17:28 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id e14sm2518157pgv.64.2020.11.05.06.17.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Nov 2020 06:17:28 -0800 (PST)
Date:   Thu, 5 Nov 2020 19:47:22 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     bbhatt@codeaurora.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        jhugo@codeaurora.org
Subject: Re: [PATCH v5] bus: mhi: Add MHI PCI support for WWAN modems
Message-ID: <20201105141722.GE7308@work>
References: <1603300699-24481-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603300699-24481-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 21, 2020 at 07:18:19PM +0200, Loic Poulain wrote:
> This is a generic MHI-over-PCI controller driver for MHI only devices
> such as QCOM modems. For now it supports registering of Qualcomm SDX55
> based PCIe modules. The MHI channels have been extracted from mhi
> downstream driver.
> 
> This driver is for MHI-only devices which have all functionalities
> exposed through MHI channels and accessed by the corresponding MHI
> device drivers (no out-of-band communication).
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> 
> ---
>  v2: - remove useless delay.h include
>      - remove over-logging on error
>      - remove controller subdir
>      - rename to mhi_pci_modem.c
>      - Fix mhi_pci_probe exit path on error
>      - expand module description
>      - drop module version
>  v3: - Rename to mhi_pci_generic
>      - Add hardware accelerated IP channel (IPA)
>      - Added fw/edl names for sdx55m
>  v4: - Configurable dma width access
>      - Configurable PCI BAR number (default is 0)
>  v5: - use mhi_alloc_controller helper
>      - Various naming refactoring (macros, mhi_cntrl)
>      - Kconfig summary rework
>      - kdoc for structures
>      - rename driver file to pci_generic.c
>      - dev_info to dev_dbg
>      - warn message: shared irq
> 
>  drivers/bus/mhi/Kconfig       |   9 ++
>  drivers/bus/mhi/Makefile      |   4 +
>  drivers/bus/mhi/pci_generic.c | 345 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 358 insertions(+)
>  create mode 100644 drivers/bus/mhi/pci_generic.c
> 
> diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
> index e841c10..da5cd0c 100644
> --- a/drivers/bus/mhi/Kconfig
> +++ b/drivers/bus/mhi/Kconfig
> @@ -20,3 +20,12 @@ config MHI_BUS_DEBUG
>  	  Enable debugfs support for use with the MHI transport. Allows
>  	  reading and/or modifying some values within the MHI controller
>  	  for debug and test purposes.
> +
> +config MHI_BUS_PCI_GENERIC
> +	tristate "MHI PCI controller driver"
> +	depends on MHI_BUS
> +	depends on PCI
> +	help
> +	  This driver provides MHI PCI controller driver for devices such as
> +	  Qualcomm SDX55 based PCIe modems.
> +
> diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
> index 19e6443..059495f 100644
> --- a/drivers/bus/mhi/Makefile
> +++ b/drivers/bus/mhi/Makefile
> @@ -1,2 +1,6 @@
>  # core layer
>  obj-y += core/
> +
> +obj-$(CONFIG_MHI_BUS_PCI_GENERIC) := mhi_pci_generic.o
> +mhi_pci_generic-y := pci_generic.o
> +
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> new file mode 100644
> index 0000000..e3df838
> --- /dev/null
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -0,0 +1,345 @@
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
> +#define MHI_PCI_DEFAULT_BAR_NUM 0
> +
> +/**
> + * struct mhi_pci_dev_info - MHI PCI device specific information
> + * @config: MHI controller configuration
> + * @name: name of the PCI module
> + * @fw: firmware path (if any)
> + * @edl: emergency download mode firmware path (if any)
> + * @bar_num: PCI base address register to use for MHI MMIO register space
> + * @dma_data_width: DMA transfer word size (32 or 64 bits)
> + */
> +struct mhi_pci_dev_info {
> +	const struct mhi_controller_config *config;
> +	const char *name;
> +	const char *fw;
> +	const char *edl;
> +	unsigned int bar_num;
> +	unsigned int dma_data_width;
> +};
> +
> +#define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> +	{						\
> +		.num = ch_num,				\
> +		.name = ch_name,			\
> +		.num_elements = el_count,		\
> +		.event_ring = ev_ring,			\
> +		.dir = DMA_TO_DEVICE,			\
> +		.ee_mask = BIT(MHI_EE_AMSS),		\
> +		.pollcfg = 0,				\
> +		.doorbell = MHI_DB_BRST_DISABLE,	\
> +		.lpm_notify = false,			\
> +		.offload_channel = false,		\
> +		.doorbell_mode_switch = false,		\
> +	}						\
> +
> +#define MHI_CHANNEL_CONFIG_DL(ch_num, ch_name, el_count, ev_ring) \
> +	{						\
> +		.num = ch_num,				\
> +		.name = ch_name,			\
> +		.num_elements = el_count,		\
> +		.event_ring = ev_ring,			\
> +		.dir = DMA_FROM_DEVICE,			\
> +		.ee_mask = BIT(MHI_EE_AMSS),		\
> +		.pollcfg = 0,				\
> +		.doorbell = MHI_DB_BRST_DISABLE,	\
> +		.lpm_notify = false,			\
> +		.offload_channel = false,		\
> +		.doorbell_mode_switch = false,		\
> +	}
> +
> +#define MHI_EVENT_CONFIG_CTRL(ev_ring)		\
> +	{					\
> +		.num_elements = 64,		\
> +		.irq_moderation_ms = 0,		\
> +		.irq = (ev_ring) + 1,		\
> +		.priority = 1,			\
> +		.mode = MHI_DB_BRST_DISABLE,	\
> +		.data_type = MHI_ER_CTRL,	\
> +		.hardware_event = false,	\
> +		.client_managed = false,	\
> +		.offload_channel = false,	\
> +	}
> +
> +#define MHI_EVENT_CONFIG_DATA(ev_ring)		\
> +	{					\
> +		.num_elements = 128,		\
> +		.irq_moderation_ms = 5,		\
> +		.irq = (ev_ring) + 1,		\
> +		.priority = 1,			\
> +		.mode = MHI_DB_BRST_DISABLE,	\
> +		.data_type = MHI_ER_DATA,	\
> +		.hardware_event = false,	\
> +		.client_managed = false,	\
> +		.offload_channel = false,	\
> +	}
> +
> +#define MHI_EVENT_CONFIG_HW_DATA(ev_ring, ch_num) \
> +	{					\
> +		.num_elements = 128,		\
> +		.irq_moderation_ms = 5,		\
> +		.irq = (ev_ring) + 1,		\
> +		.priority = 1,			\
> +		.mode = MHI_DB_BRST_DISABLE,	\
> +		.data_type = MHI_ER_DATA,	\
> +		.hardware_event = true,		\
> +		.client_managed = false,	\
> +		.offload_channel = false,	\
> +		.channel = ch_num,		\
> +	}
> +
> +static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 4, 0),
> +	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 4, 0),
> +	MHI_CHANNEL_CONFIG_UL(14, "QMI", 4, 0),
> +	MHI_CHANNEL_CONFIG_DL(15, "QMI", 4, 0),
> +	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 8, 0),
> +	MHI_CHANNEL_CONFIG_DL(21, "IPCR", 8, 0),
> +	MHI_CHANNEL_CONFIG_UL(100, "IP_HW0", 128, 1),
> +	MHI_CHANNEL_CONFIG_DL(101, "IP_HW0", 128, 2),
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
> +static const struct mhi_controller_config modem_qcom_v1_mhiv_config = {
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
> +	.config = &modem_qcom_v1_mhiv_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32
> +};
> +
> +static const struct pci_device_id mhi_pci_id_table[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
> +		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
> +	{  }
> +};
> +MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> +
> +static int mhi_pci_read_reg(struct mhi_controller *mhi_cntrl,
> +			    void __iomem *addr, u32 *out)
> +{
> +	*out = readl(addr);
> +	return 0;
> +}
> +
> +static void mhi_pci_write_reg(struct mhi_controller *mhi_cntrl,
> +			      void __iomem *addr, u32 val)
> +{
> +	writel(val, addr);
> +}
> +
> +static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
> +			      enum mhi_callback cb)
> +{
> +	/* Nothing to do for now */
> +}
> +
> +static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
> +			 unsigned int bar_num, u64 dma_mask)
> +{
> +	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
> +	int err;
> +
> +	err = pci_assign_resource(pdev, bar_num);
> +	if (err)
> +		return err;
> +
> +	err = pcim_enable_device(pdev);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to enable pci device: %d\n", err);
> +		return err;
> +	}
> +
> +	err = pcim_iomap_regions(pdev, 1 << bar_num, pci_name(pdev));
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to map pci region: %d\n", err);
> +		return err;
> +	}
> +	mhi_cntrl->regs = pcim_iomap_table(pdev)[bar_num];
> +
> +	err = pci_set_dma_mask(pdev, dma_mask);
> +	if (err) {
> +		dev_err(&pdev->dev, "Cannot set proper DMA mask\n");
> +		return err;
> +	}
> +
> +	err = pci_set_consistent_dma_mask(pdev, dma_mask);
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
> +static int mhi_pci_get_irqs(struct mhi_controller *mhi_cntrl,
> +			    const struct mhi_controller_config *mhi_cntrl_config)
> +{
> +	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
> +	int nr_vectors, i;
> +	int *irq;
> +
> +	/*
> +	 * Alloc one MSI vector for BHI + one vector per event ring, ideally...
> +	 * No explicit pci_free_irq_vectors required, done by pcim_release.
> +	 */
> +	mhi_cntrl->nr_irqs = 1 + mhi_cntrl_config->num_events;
> +
> +	nr_vectors = pci_alloc_irq_vectors(pdev, 1, mhi_cntrl->nr_irqs, PCI_IRQ_MSI);
> +	if (nr_vectors < 0) {
> +		dev_err(&pdev->dev, "Error allocating MSI vectors %d\n",
> +			nr_vectors);
> +		return nr_vectors;
> +	}
> +
> +	if (nr_vectors < mhi_cntrl->nr_irqs) {
> +		dev_warn(&pdev->dev, "Not enough MSI vectors (%d/%d), use shared MSI\n",
> +			 nr_vectors, mhi_cntrl_config->num_events);
> +	}
> +
> +	irq = devm_kcalloc(&pdev->dev, mhi_cntrl->nr_irqs, sizeof(int), GFP_KERNEL);
> +	if (!irq)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < mhi_cntrl->nr_irqs; i++) {
> +		int vector = i >= nr_vectors ? (nr_vectors - 1) : i;
> +
> +		irq[i] = pci_irq_vector(pdev, vector);
> +	}
> +
> +	mhi_cntrl->irq = irq;
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
> +}
> +
> +static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> +{
> +	const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
> +	const struct mhi_controller_config *mhi_cntrl_config;
> +	struct mhi_controller *mhi_cntrl;
> +	int err;
> +
> +	dev_dbg(&pdev->dev, "MHI PCI device found: %s\n", info->name);
> +
> +	mhi_cntrl = mhi_alloc_controller();
> +	if (!mhi_cntrl)
> +		return -ENOMEM;
> +
> +	mhi_cntrl_config = info->config;
> +	mhi_cntrl->cntrl_dev = &pdev->dev;
> +	mhi_cntrl->iova_start = 0;
> +	mhi_cntrl->iova_stop = DMA_BIT_MASK(info->dma_data_width);
> +	mhi_cntrl->fw_image = info->fw;
> +	mhi_cntrl->edl_image = info->edl;
> +
> +	mhi_cntrl->read_reg = mhi_pci_read_reg;
> +	mhi_cntrl->write_reg = mhi_pci_write_reg;
> +	mhi_cntrl->status_cb = mhi_pci_status_cb;
> +	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
> +	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
> +
> +	err = mhi_pci_claim(mhi_cntrl, info->bar_num, DMA_BIT_MASK(info->dma_data_width));
> +	if (err)
> +		goto err_release;
> +
> +	err = mhi_pci_get_irqs(mhi_cntrl, mhi_cntrl_config);
> +	if (err)
> +		goto err_release;
> +
> +	pci_set_drvdata(pdev, mhi_cntrl);
> +
> +	err = mhi_register_controller(mhi_cntrl, mhi_cntrl_config);
> +	if (err)
> +		goto err_release;
> +
> +	/* MHI bus does not power up the controller by default */
> +	err = mhi_prepare_for_power_up(mhi_cntrl);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to prepare MHI controller\n");
> +		goto err_unregister;
> +	}
> +
> +	err = mhi_sync_power_up(mhi_cntrl);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to power up MHI controller\n");
> +		goto err_unprepare;
> +	}
> +
> +	return 0;
> +
> +err_unprepare:
> +	mhi_unprepare_after_power_down(mhi_cntrl);
> +err_unregister:
> +	mhi_unregister_controller(mhi_cntrl);
> +err_release:
> +	mhi_free_controller(mhi_cntrl);
> +
> +	return err;
> +}
> +
> +static void mhi_pci_remove(struct pci_dev *pdev)
> +{
> +	struct mhi_controller *mhi_cntrl = pci_get_drvdata(pdev);
> +
> +	mhi_power_down(mhi_cntrl, true);
> +	mhi_unprepare_after_power_down(mhi_cntrl);
> +	mhi_unregister_controller(mhi_cntrl);
> +	mhi_free_controller(mhi_cntrl);
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
> +MODULE_AUTHOR("Loic Poulain <loic.poulain@linaro.org>");
> +MODULE_DESCRIPTION("Modem Host Interface (MHI) PCI controller driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.7.4
> 
