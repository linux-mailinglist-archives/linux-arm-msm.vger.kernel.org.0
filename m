Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A02E279712
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 07:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgIZFTF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 01:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgIZFTF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 01:19:05 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B8F2C0613CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 22:19:05 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id g29so4217230pgl.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 22:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QNRpA3fP8UlrvPBTi+wiQarnFN3OUO0spnXec+d9ZJo=;
        b=IL/QV5hHVJZg7+e4BXxZekntcbwhlB7XLaKfqFjGKXDirs2Hnf82bRhVf/BOjaIKvL
         1lmrwSGoCx0TKS6TZOM5C0aTRv4E5xrtO6iwiNodr8b7SUZeXINC8KMfmQYvoJiD1wRe
         70TxkDE76pmp1o7//FrTcmPPieoS1kaf+6CFEJJtzX69DnOVXTi5/yrM64KY8b4GZHla
         dPs+MCjzbgJa0eNHEojcHBOQPwt1tXl5k2mKcQtbjjf54KMzoNEKl8fP8LKB53DWUwLQ
         IThGomtUDUIQITYOFGXQwLc++edi2gu5c1nfqOzWwcWTJujaMUl8u9H9/EtS1Y8gMrzm
         ak/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QNRpA3fP8UlrvPBTi+wiQarnFN3OUO0spnXec+d9ZJo=;
        b=g2INn9iavyR/BCqEiZzcEc33/Km3qXtJKacqg0/OJZ172VYQwuY0kMvXMzWkBsUVzk
         3gMf4Fi29NUijAIDatcroLlbiaCzoNRVJpKR0PiQ3ivtHdP3OHQmsNihszVvrT3irSBA
         Ik4YqQrU6MQvdLW3rXC9CQvLwS+FYzn6oyH0zVomw/9dVV/M0vlux6yyswPFZAThrGFo
         1/w/0zzwV/2ambzVkE57SRQ36gPXNkhLyC/821QtT/4yR1p3zczKRdpKrT07uuvq1Ym1
         XTlisOq886Npv7RzrG9FiYbB3REoZrRFAAk2IUmx52JSbJxaLU5VAK2wWj/bN/9F8/gt
         r2vw==
X-Gm-Message-State: AOAM532QBzliuBX4KxCsJnPyVHXiAGxWbosZVvIVnPLq68BM7GBzTbva
        6JRpqob52r4lzsgR/hgUryM6AgwTFMLwaCw=
X-Google-Smtp-Source: ABdhPJx596cZVLFe3K6Vo1gBP+Mf7rpRhYpFOHk94YAn1FgsPCrjRVFB28YqFAftckQfrQ8yo2ju2g==
X-Received: by 2002:a63:3304:: with SMTP id z4mr1737432pgz.90.1601097544291;
        Fri, 25 Sep 2020 22:19:04 -0700 (PDT)
Received: from linux ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id o4sm939309pfh.39.2020.09.25.22.19.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Sep 2020 22:19:03 -0700 (PDT)
Date:   Sat, 26 Sep 2020 10:48:58 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] bus: mhi: Add MHI PCI support
Message-ID: <20200926051858.GA9302@linux>
References: <1600868432-12438-1-git-send-email-loic.poulain@linaro.org>
 <20200923151709.GC40811@yoga>
 <CAMZdPi_yPNxgnX0bgFEL=Djg3FrjhRQ5Koq8BUoQoD=ZLLzSRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi_yPNxgnX0bgFEL=Djg3FrjhRQ5Koq8BUoQoD=ZLLzSRA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 23, 2020 at 06:31:09PM +0200, Loic Poulain wrote:
> Hi Bjorn,
> 
> On Wed, 23 Sep 2020 at 17:17, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Wed 23 Sep 08:40 CDT 2020, Loic Poulain wrote:
> >
> > > This is a generic MHI-over-PCI controller driver for MHI only devices
> > > such as QCOM modems. For now it supports registering of Qualcomm SDX55
> > > based PCIe modules. The MHI channels have been extracted from mhi
> > > downstream driver.
> > >
> > > This driver is easily extendable to support other MHI PCI devices like
> > > different modem hw or OEM superset.
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > > ---
> > [..]
> > > diff --git a/drivers/bus/mhi/controllers/mhi_pci_common.c b/drivers/bus/mhi/controllers/mhi_pci_common.c
> > > new file mode 100644
> > > index 0000000..705b283
> > > --- /dev/null
> > > +++ b/drivers/bus/mhi/controllers/mhi_pci_common.c
> >
> > ath11k is also "PCI" and "MHI" but this isn't "common" code for it, so
> > perhaps "mhi_pci_generic.c" or "mhi_pci_modem.c"?
> 
> Right, mhi_pci_modem looks good.
> 

Please use "mhi_pci_generic". This driver is not specific to modems...

Thanks,
Mani

> >
> > > @@ -0,0 +1,339 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * MHI PCI driver - MHI over PCI controller driver
> > > + *
> > > + * This module is a generic driver for registering pure MHI-over-PCI devices,
> > > + * such as PCIe QCOM modems.
> > > + *
> > > + * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
> > > + */
> > > +
> > > +#include <linux/device.h>
> > > +#include <linux/mhi.h>
> > > +#include <linux/module.h>
> > > +#include <linux/pci.h>
> > > +#include <linux/delay.h>
> >
> > Can you confirm that you need delay.h?
> 
> You're right, don't use any delay function in that version.
> 
> >
> > > +
> > > +#define MHI_PCI_BAR_NUM 0
> > > +
> > > +enum {
> > > +     EV_RING_0,
> > > +     EV_RING_1,
> > > +     EV_RING_2,
> > > +     EV_RING_3,
> >
> > Maybe you can just use the numbers 0-3 instead?
> 
> ack.
> 
> >
> > > +};
> > > +
> > [..]
> > > +static int mhi_pci_claim(struct mhi_controller *mhic)
> > > +{
> > > +     struct pci_dev *pdev = to_pci_dev(mhic->cntrl_dev);
> > > +     int err;
> > > +
> > > +     err = pci_assign_resource(pdev, MHI_PCI_BAR_NUM);
> > > +     if (err) {
> > > +             dev_err(&pdev->dev, "failed to assign pci resource: %d\n", err);
> >
> > Afaict all code paths of pci_assign_resource() will log already.
> >
> 
> ok, thanks.
> 
> > > +             return err;
> > > +     }
> > > +
> > > +     err = pcim_enable_device(pdev);
> > > +     if (err) {
> > > +             dev_err(&pdev->dev, "failed to enable pci device: %d\n", err);
> > > +             return err;
> > > +     }
> > > +
> > > +     err = pcim_iomap_regions(pdev, 1 << MHI_PCI_BAR_NUM, pci_name(pdev));
> > > +     if (err) {
> > > +             dev_err(&pdev->dev, "failed to map pci region: %d\n", err);
> > > +             return err;
> > > +     }
> > > +     mhic->regs = pcim_iomap_table(pdev)[MHI_PCI_BAR_NUM];
> > > +
> > > +     err = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
> > > +     if (err) {
> > > +             dev_err(&pdev->dev, "Cannot set proper DMA mask\n");
> > > +             return err;
> > > +     }
> > > +
> > > +     err = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32));
> > > +     if (err) {
> > > +             dev_err(&pdev->dev, "set consistent dma mask failed\n");
> > > +             return err;
> > > +     }
> > > +
> > > +     pci_set_master(pdev);
> > > +
> > > +     return 0;
> > > +}
> > [..]
> > > +static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > > +{
> > > +     const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
> > > +     const struct mhi_controller_config *mhic_config;
> > > +     struct mhi_controller *mhic;
> > > +     int err;
> > > +
> > > +     dev_info(&pdev->dev, "MHI PCI device found: %s\n", info->name);
> > > +
> > > +     mhic = devm_kzalloc(&pdev->dev, sizeof(*mhic), GFP_KERNEL);
> > > +     if (!mhic) {
> > > +             dev_err(&pdev->dev, "failed to allocate mhi controller\n");
> >
> > kzalloc() will log errors as well.
> >
> > > +             return -ENOMEM;
> > > +     }
> > > +
> > > +     mhic_config = info->config;
> > > +     mhic->cntrl_dev = &pdev->dev;
> > > +     mhic->iova_start = 0;
> > > +     mhic->iova_stop = 0xffffffff;
> > > +     mhic->fw_image = NULL;
> > > +     mhic->edl_image = NULL;
> > > +
> > > +     mhic->read_reg = mhi_pci_read_reg;
> > > +     mhic->write_reg = mhi_pci_write_reg;
> > > +     mhic->status_cb = mhi_pci_status_cb;
> > > +     mhic->runtime_get = mhi_pci_runtime_get;
> > > +     mhic->runtime_put = mhi_pci_runtime_put;
> > > +
> > > +     err = mhi_pci_claim(mhic);
> > > +     if (err)
> > > +             return err;
> > > +
> > > +     err = mhi_pci_get_irqs(mhic, mhic_config);
> > > +     if (err)
> > > +             return err;
> > > +
> > > +     pci_set_drvdata(pdev, mhic);
> > > +
> > > +     err = mhi_register_controller(mhic, mhic_config);
> > > +     if (err) {
> > > +             dev_err(&pdev->dev, "failed to register MHI controller\n");
> >
> > Afaict all errors that occurs if you pass valid data to this function
> > will print an error message already...
> >
> > > +             pci_free_irq_vectors(pdev);
> > > +             return err;
> > > +     }
> > > +
> > > +     /* MHI bus does not power up the controller by default */
> > > +     err = mhi_prepare_for_power_up(mhic);
> > > +     if (err) {
> > > +             dev_err(&pdev->dev, "failed to prepare MHI controller\n");
> >
> > mhi_unregister_controller()?
> 
> Indeed, thanks.
> 
> >
> > > +             return err;
> > > +     }
> > > +
> > > +     err = mhi_sync_power_up(mhic);
> > > +     if (err) {
> > > +             dev_err(&pdev->dev, "failed to power up MHI controller\n");
> > > +             mhi_unprepare_after_power_down(mhic);
> > > +             mhi_unregister_controller(mhic);
> > > +             return err;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void mhi_pci_remove(struct pci_dev *pdev)
> > > +{
> > > +     struct mhi_controller *mhic = pci_get_drvdata(pdev);
> > > +
> > > +     mhi_power_down(mhic, true);
> > > +     mhi_unprepare_after_power_down(mhic);
> > > +     mhi_unregister_controller(mhic);
> > > +}
> > > +
> > > +static struct pci_driver mhi_pci_driver = {
> > > +     .name           = "mhi-pci",
> > > +     .id_table       = mhi_pci_id_table,
> > > +     .probe          = mhi_pci_probe,
> > > +     .remove         = mhi_pci_remove
> > > +};
> > > +module_pci_driver(mhi_pci_driver);
> > > +
> > > +MODULE_AUTHOR("Loic Poulain <loic.poulain@linaro,org>");
> > > +MODULE_DESCRIPTION("mhi-pci");
> >
> > Please expand this
> 
> will do.
> 
> >
> > > +MODULE_LICENSE("GPL");
> > > +MODULE_VERSION("1");
> >
> > And please drop the version, as this is likely not going to be updated
> > consistently.
> >
> > Regards,
> > Bjorn
