Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 736A8275D56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 18:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgIWQZ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 12:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgIWQZ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 12:25:59 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639CCC0613CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 09:25:58 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id u21so510775eja.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 09:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z0zeYRfqNkVdz7xzcZcTvuhKsfD+OTfnOkqrK7+gBBU=;
        b=vDOovNAFGDqOa4BWLDIr56ls3+Ae1SdAHDuhvTRnxriz0x5LtVcRlYtDoh4YbWrv/Q
         le34Zu0SEBYNDUNjtsMnXXKclM5FqISndhdIksnpety8gi2a+LKA218hnwpRCh8D/6ho
         cmZRygg9kIoGi41KkrVbcmABPTuv4iMQST5GJpvSbYcqJaT2U22MdpVu9ohv1AFzM5ax
         hggI7DELlM/8hcwM7h5q3sz51prQwsJbG15peVhlpOkNsXnb+YVshFoL+VZ6YLC/BrOP
         L4gGZohbyz7cIO3cDz0hvtHM325Pr9s7YQzBhL/pYyYwZD9RW2FK9zvmo36Hdpo4lga3
         AoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z0zeYRfqNkVdz7xzcZcTvuhKsfD+OTfnOkqrK7+gBBU=;
        b=EcSu6FVW+4QvdKm5Z4daA4uWb4JJ+f31OfPcy6Hwt54wu+SL34vHLtg4+enGkD71FT
         TClIJsCrNewCJtO6SNyqJRS6zmL38o3L9jVKzNd5+hgdn3nKuUWRUgFogUpIhbBjrFRr
         a07eXMWXoxfZmW16+kTT6jXYQxxSR2DHOhs1q8lvU85660njPd/3fgaRdw92ykZR/9Lk
         /EaoXfv/jNYMDbDWO0yN8eBdzOgo8+7tkYVIr3RJs7Rls9w7zA/W4avcPIoHJ82LBIV5
         oXcQ1qsc75XbmnGtuPbUxrVTsLwOPLeRmmdZMEVNTw8Ky3wzbuVFszmQuOQ43hyr23ea
         Dv5g==
X-Gm-Message-State: AOAM531vy2dSOI8sZU+Uls9kPuQLE6bLrc4m3KghQertXzsoqi/wt963
        v5MIRew8ICLo6J9BxiXDKwWUNX7fOe5JP4z9qpOcTA==
X-Google-Smtp-Source: ABdhPJweKRrY3fo4A+lO4+RiryJDDjLGeUwTqHivunK9I0VDuhRhmQNcYaqD+8ESts3X5G4n+bVyQET3XVEHs5i/jQY=
X-Received: by 2002:a17:906:24d2:: with SMTP id f18mr445659ejb.510.1600878356914;
 Wed, 23 Sep 2020 09:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <1600868432-12438-1-git-send-email-loic.poulain@linaro.org> <20200923151709.GC40811@yoga>
In-Reply-To: <20200923151709.GC40811@yoga>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 23 Sep 2020 18:31:09 +0200
Message-ID: <CAMZdPi_yPNxgnX0bgFEL=Djg3FrjhRQ5Koq8BUoQoD=ZLLzSRA@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: Add MHI PCI support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Wed, 23 Sep 2020 at 17:17, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 23 Sep 08:40 CDT 2020, Loic Poulain wrote:
>
> > This is a generic MHI-over-PCI controller driver for MHI only devices
> > such as QCOM modems. For now it supports registering of Qualcomm SDX55
> > based PCIe modules. The MHI channels have been extracted from mhi
> > downstream driver.
> >
> > This driver is easily extendable to support other MHI PCI devices like
> > different modem hw or OEM superset.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> [..]
> > diff --git a/drivers/bus/mhi/controllers/mhi_pci_common.c b/drivers/bus/mhi/controllers/mhi_pci_common.c
> > new file mode 100644
> > index 0000000..705b283
> > --- /dev/null
> > +++ b/drivers/bus/mhi/controllers/mhi_pci_common.c
>
> ath11k is also "PCI" and "MHI" but this isn't "common" code for it, so
> perhaps "mhi_pci_generic.c" or "mhi_pci_modem.c"?

Right, mhi_pci_modem looks good.

>
> > @@ -0,0 +1,339 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * MHI PCI driver - MHI over PCI controller driver
> > + *
> > + * This module is a generic driver for registering pure MHI-over-PCI devices,
> > + * such as PCIe QCOM modems.
> > + *
> > + * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/mhi.h>
> > +#include <linux/module.h>
> > +#include <linux/pci.h>
> > +#include <linux/delay.h>
>
> Can you confirm that you need delay.h?

You're right, don't use any delay function in that version.

>
> > +
> > +#define MHI_PCI_BAR_NUM 0
> > +
> > +enum {
> > +     EV_RING_0,
> > +     EV_RING_1,
> > +     EV_RING_2,
> > +     EV_RING_3,
>
> Maybe you can just use the numbers 0-3 instead?

ack.

>
> > +};
> > +
> [..]
> > +static int mhi_pci_claim(struct mhi_controller *mhic)
> > +{
> > +     struct pci_dev *pdev = to_pci_dev(mhic->cntrl_dev);
> > +     int err;
> > +
> > +     err = pci_assign_resource(pdev, MHI_PCI_BAR_NUM);
> > +     if (err) {
> > +             dev_err(&pdev->dev, "failed to assign pci resource: %d\n", err);
>
> Afaict all code paths of pci_assign_resource() will log already.
>

ok, thanks.

> > +             return err;
> > +     }
> > +
> > +     err = pcim_enable_device(pdev);
> > +     if (err) {
> > +             dev_err(&pdev->dev, "failed to enable pci device: %d\n", err);
> > +             return err;
> > +     }
> > +
> > +     err = pcim_iomap_regions(pdev, 1 << MHI_PCI_BAR_NUM, pci_name(pdev));
> > +     if (err) {
> > +             dev_err(&pdev->dev, "failed to map pci region: %d\n", err);
> > +             return err;
> > +     }
> > +     mhic->regs = pcim_iomap_table(pdev)[MHI_PCI_BAR_NUM];
> > +
> > +     err = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
> > +     if (err) {
> > +             dev_err(&pdev->dev, "Cannot set proper DMA mask\n");
> > +             return err;
> > +     }
> > +
> > +     err = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32));
> > +     if (err) {
> > +             dev_err(&pdev->dev, "set consistent dma mask failed\n");
> > +             return err;
> > +     }
> > +
> > +     pci_set_master(pdev);
> > +
> > +     return 0;
> > +}
> [..]
> > +static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > +{
> > +     const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
> > +     const struct mhi_controller_config *mhic_config;
> > +     struct mhi_controller *mhic;
> > +     int err;
> > +
> > +     dev_info(&pdev->dev, "MHI PCI device found: %s\n", info->name);
> > +
> > +     mhic = devm_kzalloc(&pdev->dev, sizeof(*mhic), GFP_KERNEL);
> > +     if (!mhic) {
> > +             dev_err(&pdev->dev, "failed to allocate mhi controller\n");
>
> kzalloc() will log errors as well.
>
> > +             return -ENOMEM;
> > +     }
> > +
> > +     mhic_config = info->config;
> > +     mhic->cntrl_dev = &pdev->dev;
> > +     mhic->iova_start = 0;
> > +     mhic->iova_stop = 0xffffffff;
> > +     mhic->fw_image = NULL;
> > +     mhic->edl_image = NULL;
> > +
> > +     mhic->read_reg = mhi_pci_read_reg;
> > +     mhic->write_reg = mhi_pci_write_reg;
> > +     mhic->status_cb = mhi_pci_status_cb;
> > +     mhic->runtime_get = mhi_pci_runtime_get;
> > +     mhic->runtime_put = mhi_pci_runtime_put;
> > +
> > +     err = mhi_pci_claim(mhic);
> > +     if (err)
> > +             return err;
> > +
> > +     err = mhi_pci_get_irqs(mhic, mhic_config);
> > +     if (err)
> > +             return err;
> > +
> > +     pci_set_drvdata(pdev, mhic);
> > +
> > +     err = mhi_register_controller(mhic, mhic_config);
> > +     if (err) {
> > +             dev_err(&pdev->dev, "failed to register MHI controller\n");
>
> Afaict all errors that occurs if you pass valid data to this function
> will print an error message already...
>
> > +             pci_free_irq_vectors(pdev);
> > +             return err;
> > +     }
> > +
> > +     /* MHI bus does not power up the controller by default */
> > +     err = mhi_prepare_for_power_up(mhic);
> > +     if (err) {
> > +             dev_err(&pdev->dev, "failed to prepare MHI controller\n");
>
> mhi_unregister_controller()?

Indeed, thanks.

>
> > +             return err;
> > +     }
> > +
> > +     err = mhi_sync_power_up(mhic);
> > +     if (err) {
> > +             dev_err(&pdev->dev, "failed to power up MHI controller\n");
> > +             mhi_unprepare_after_power_down(mhic);
> > +             mhi_unregister_controller(mhic);
> > +             return err;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void mhi_pci_remove(struct pci_dev *pdev)
> > +{
> > +     struct mhi_controller *mhic = pci_get_drvdata(pdev);
> > +
> > +     mhi_power_down(mhic, true);
> > +     mhi_unprepare_after_power_down(mhic);
> > +     mhi_unregister_controller(mhic);
> > +}
> > +
> > +static struct pci_driver mhi_pci_driver = {
> > +     .name           = "mhi-pci",
> > +     .id_table       = mhi_pci_id_table,
> > +     .probe          = mhi_pci_probe,
> > +     .remove         = mhi_pci_remove
> > +};
> > +module_pci_driver(mhi_pci_driver);
> > +
> > +MODULE_AUTHOR("Loic Poulain <loic.poulain@linaro,org>");
> > +MODULE_DESCRIPTION("mhi-pci");
>
> Please expand this

will do.

>
> > +MODULE_LICENSE("GPL");
> > +MODULE_VERSION("1");
>
> And please drop the version, as this is likely not going to be updated
> consistently.
>
> Regards,
> Bjorn
