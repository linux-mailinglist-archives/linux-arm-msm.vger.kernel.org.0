Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 792D8275B5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 17:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgIWPRN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 11:17:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgIWPRN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 11:17:13 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15770C0613CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 08:17:13 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id y5so69998otg.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 08:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ntDaHPZalh6RnfEDMSr3KhYUojVn36r1q/JUYw+kUDc=;
        b=QWOeoAB/gYgYxotSDhnHlwW4vjM+yoTwE0gJluckmhH9irFhBKXx30+dhd2TutkDi1
         ZSpNWYUBxyekSzLVAvoYQyA8XruIGzW0UL7Qpkh1L5oELj6P0GR7AiwJ63zUQdETfEHK
         a6eGHF6I6PuzUpM7/rj+50WcjMulpSXRhqXDgk6xsYFFNFZjF3DC902rTvKh6ZuRvvqV
         5F1rjUIcn8OI/peO7nXd7EN8g8KHvnM0v14d2KSB2Z8CkhbI/TcH09vFmRkl2Ys9eJma
         ViqF77tHBhNXlVSoXAimwmk0S+1sY3PaNHCihI5/46d6K5/D1swu3p0R+B09RMJf6aeK
         OE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ntDaHPZalh6RnfEDMSr3KhYUojVn36r1q/JUYw+kUDc=;
        b=GgXOb1MAy9mE19I1jYa6vVT2WodCeGo6zR7g7fjCqBBSWh5oQ0f7npEAl7P1hqIO5R
         jnygsZ7awrLXY1lpAdNgbdxLwBCMLqaNefWowubiVBj+8OkQtYHuK7+KV3RAoUYCUCeF
         qRV8UcVw+uhjIyH3MsADs/l93F6nSCivjYjsQ9zZRtNgiyBvUhLTSGl/lPFbw7H0gY6V
         bbuBthIzg+nFQH8aWmgPHA+tSpJ+ZjxrrZSoKAOcklt98Kg7GccyBvjDKQoYiWhL+TB8
         QdBZT4iKQGEtey9zQoSCckyaCbe9nRmDVivlnVnMLFXa8HoSlYjx2YcxRzEQE8lKziR2
         ioZA==
X-Gm-Message-State: AOAM5314ntaongVncWlXuHrXxPIGgIIjQGx4BjpWvXSZznrEfmZdYbl5
        TVLi2xBeo7KkcQTdZv1tg9e4rw==
X-Google-Smtp-Source: ABdhPJwtmStGkBoxy6Iv1XrzRSnzkHJUcHdBBumwIVtXXf7Phk4ps/BN6Zg7I2DfzkGdlza1J0WhXQ==
X-Received: by 2002:a05:6830:164c:: with SMTP id h12mr149177otr.48.1600874232359;
        Wed, 23 Sep 2020 08:17:12 -0700 (PDT)
Received: from yoga (99-135-181-32.lightspeed.austtx.sbcglobal.net. [99.135.181.32])
        by smtp.gmail.com with ESMTPSA id r21sm7943217oie.15.2020.09.23.08.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 08:17:11 -0700 (PDT)
Date:   Wed, 23 Sep 2020 10:17:09 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: Add MHI PCI support
Message-ID: <20200923151709.GC40811@yoga>
References: <1600868432-12438-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600868432-12438-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 23 Sep 08:40 CDT 2020, Loic Poulain wrote:

> This is a generic MHI-over-PCI controller driver for MHI only devices
> such as QCOM modems. For now it supports registering of Qualcomm SDX55
> based PCIe modules. The MHI channels have been extracted from mhi
> downstream driver.
> 
> This driver is easily extendable to support other MHI PCI devices like
> different modem hw or OEM superset.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
[..]
> diff --git a/drivers/bus/mhi/controllers/mhi_pci_common.c b/drivers/bus/mhi/controllers/mhi_pci_common.c
> new file mode 100644
> index 0000000..705b283
> --- /dev/null
> +++ b/drivers/bus/mhi/controllers/mhi_pci_common.c

ath11k is also "PCI" and "MHI" but this isn't "common" code for it, so
perhaps "mhi_pci_generic.c" or "mhi_pci_modem.c"?

> @@ -0,0 +1,339 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * MHI PCI driver - MHI over PCI controller driver
> + *
> + * This module is a generic driver for registering pure MHI-over-PCI devices,
> + * such as PCIe QCOM modems.
> + *
> + * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/mhi.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/delay.h>

Can you confirm that you need delay.h?

> +
> +#define MHI_PCI_BAR_NUM 0
> +
> +enum {
> +	EV_RING_0,
> +	EV_RING_1,
> +	EV_RING_2,
> +	EV_RING_3,

Maybe you can just use the numbers 0-3 instead?

> +};
> +
[..]
> +static int mhi_pci_claim(struct mhi_controller *mhic)
> +{
> +	struct pci_dev *pdev = to_pci_dev(mhic->cntrl_dev);
> +	int err;
> +
> +	err = pci_assign_resource(pdev, MHI_PCI_BAR_NUM);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to assign pci resource: %d\n", err);

Afaict all code paths of pci_assign_resource() will log already.

> +		return err;
> +	}
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
[..]
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
> +	if (!mhic) {
> +		dev_err(&pdev->dev, "failed to allocate mhi controller\n");

kzalloc() will log errors as well.

> +		return -ENOMEM;
> +	}
> +
> +	mhic_config = info->config;
> +	mhic->cntrl_dev = &pdev->dev;
> +	mhic->iova_start = 0;
> +	mhic->iova_stop = 0xffffffff;
> +	mhic->fw_image = NULL;
> +	mhic->edl_image = NULL;
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
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to register MHI controller\n");

Afaict all errors that occurs if you pass valid data to this function
will print an error message already...

> +		pci_free_irq_vectors(pdev);
> +		return err;
> +	}
> +
> +	/* MHI bus does not power up the controller by default */
> +	err = mhi_prepare_for_power_up(mhic);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to prepare MHI controller\n");

mhi_unregister_controller()?

> +		return err;
> +	}
> +
> +	err = mhi_sync_power_up(mhic);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to power up MHI controller\n");
> +		mhi_unprepare_after_power_down(mhic);
> +		mhi_unregister_controller(mhic);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static void mhi_pci_remove(struct pci_dev *pdev)
> +{
> +	struct mhi_controller *mhic = pci_get_drvdata(pdev);
> +
> +	mhi_power_down(mhic, true);
> +	mhi_unprepare_after_power_down(mhic);
> +	mhi_unregister_controller(mhic);
> +}
> +
> +static struct pci_driver mhi_pci_driver = {
> +	.name		= "mhi-pci",
> +	.id_table	= mhi_pci_id_table,
> +	.probe		= mhi_pci_probe,
> +	.remove		= mhi_pci_remove
> +};
> +module_pci_driver(mhi_pci_driver);
> +
> +MODULE_AUTHOR("Loic Poulain <loic.poulain@linaro,org>");
> +MODULE_DESCRIPTION("mhi-pci");

Please expand this

> +MODULE_LICENSE("GPL");
> +MODULE_VERSION("1");

And please drop the version, as this is likely not going to be updated
consistently.

Regards,
Bjorn
