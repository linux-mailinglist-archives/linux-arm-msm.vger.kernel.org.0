Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5764929504F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 18:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2444333AbgJUQBE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 12:01:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2444332AbgJUQBE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 12:01:04 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DDE8C0613CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 09:01:03 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id p5so4018547ejj.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 09:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iw8oum+yOtOWuMj6l8Bwey2ZkXCDw2Q+q/F76pBHixU=;
        b=gEYe0nhMMtdA/GBOz6Z2xHWMDzrBu5dWwiZkxvtZik/+LzHhaV57b6Yhahezr7qKvR
         ob9aegaxt9q/RY0LYMcfSODtZ6c8BklWOgUVdSOOp7tLwVl0GzijAcHYRZuqCAWRODHZ
         BeMPlYrM6minQlDIQXxsuvQu2cL7BH5nEUukMQbukFsmy49voqBBHIny/1SZNMC20Ow3
         sev/i84JZool/rX44tg7vCbsb9mB1xhQYkUtr9kfjCGpXevs+WZSCuDu+ban9k2l3DWe
         t6PkEr+i2E57pGvF4YY9HDjca7a2eLd5i7jToomBr+L8IpGMPkvz2j2A/3V9alFr0r1N
         KSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iw8oum+yOtOWuMj6l8Bwey2ZkXCDw2Q+q/F76pBHixU=;
        b=p4dBybcng9p4HC+xvEpm9jy60E6+xlHqk5XCvt4NHo2MSskPskoRRGVfIHKO8k27Ut
         zuovTVstG/ZDhh0hSKMZzoyBKF2JAtphbtTFeM5bWU3nxbXpzKf/QIW8rAND/1bm199k
         rtPq9W4Lk7qewpfO2/eecznZEA1+5Cm+Dyq2BzF87+WiqueXI2/BI7yiUusFe/Wg5ykP
         TEodBvTpfAHijq0OmqRrp0U7j1yMLd9rqQS6zLZ/tZlFUaPODPNhqcvAQjPW3g41RQxs
         1Jd1blRdhJ9p18yMk/yf418B9T67DEcO1lAYRCBMNj3IHG7vND8EI13hbislgSjVistT
         FjJg==
X-Gm-Message-State: AOAM530yLNJahRdCtSBYB+OG2mL3dMgyOGM4v/7Ds3xktgsS5rV1o1R2
        Ekxk6fmKjNZf0l0vsWVPvYkuwqrbR0DC2y5Fr+nOTk13eiNaPAeN
X-Google-Smtp-Source: ABdhPJyzc/5XcjGc41Yel/j8P+63jGy6TiNMrTb9DSDKM1tpJ2aOA56Q1XGe/5KFb9zaVtkX2CkWWWjAUq/5rJYfB5Y=
X-Received: by 2002:a17:906:2e59:: with SMTP id r25mr4254733eji.520.1603296062104;
 Wed, 21 Oct 2020 09:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <1603108844-22286-1-git-send-email-loic.poulain@linaro.org> <20201021152029.GB3334@Mani-XPS-13-9360>
In-Reply-To: <20201021152029.GB3334@Mani-XPS-13-9360>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 21 Oct 2020 18:06:25 +0200
Message-ID: <CAMZdPi96x91e7hux7WK=xQY62k1=1S1v=Tk2gadPidtOA=Augw@mail.gmail.com>
Subject: Re: [PATCH v4] bus: mhi: Add MHI PCI support for WWAN modems
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On Wed, 21 Oct 2020 at 17:20, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Mon, Oct 19, 2020 at 02:00:44PM +0200, Loic Poulain wrote:
> > This is a generic MHI-over-PCI controller driver for MHI only devices
> > such as QCOM modems. For now it supports registering of Qualcomm SDX55
> > based PCIe modules. The MHI channels have been extracted from mhi
> > downstream driver.
> >
> > This driver is for MHI-only devices which have all functionnalities
>
> s/functionnalities/functionalities
>
> > exposed through MHI channels and accessed by the corresponding MHI
> > device drivers (no out-of-band communication).
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  v2: - remove useless delay.h include
> >      - remove over-logging on error
> >      - remove controller subdir
> >      - rename to mhi_pci_modem.c
> >      - Fix mhi_pci_probe exit path on error
> >      - expand module description
> >      - drop module version
> >  v3: - Rename to mhi_pci_generic
> >      - Add hardware accelerated IP channel (IPA)
> >      - Added fw/edl names for sdx55m
> >  v4: - Configurable dma width access
> >      - Configurable PCI BAR number (default is 0)
> >
> >  drivers/bus/mhi/Kconfig           |   9 +
> >  drivers/bus/mhi/Makefile          |   3 +
> >  drivers/bus/mhi/mhi_pci_generic.c | 336 ++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 348 insertions(+)
> >  create mode 100644 drivers/bus/mhi/mhi_pci_generic.c
> >
> > diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
> > index e841c10..daa8528 100644
> > --- a/drivers/bus/mhi/Kconfig
> > +++ b/drivers/bus/mhi/Kconfig
> > @@ -20,3 +20,12 @@ config MHI_BUS_DEBUG
> >         Enable debugfs support for use with the MHI transport. Allows
> >         reading and/or modifying some values within the MHI controller
> >         for debug and test purposes.
> > +
> > +config MHI_BUS_PCI_GENERIC
> > +     tristate "MHI PCI controller driver"
> > +     depends on MHI_BUS
> > +     depends on PCI
> > +     help
> > +       This driver provides Modem Host Interface (MHI) PCI controller driver
>
> No need to expand MHI here. It is already done in CONFIG_MHI_BUS.
>
> > +       for devices such as Qualcomm SDX55 based PCIe modems.
> > +
> > diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
> > index 19e6443..d1a4ef3 100644
> > --- a/drivers/bus/mhi/Makefile
> > +++ b/drivers/bus/mhi/Makefile
> > @@ -1,2 +1,5 @@
> >  # core layer
> >  obj-y += core/
> > +
> > +obj-$(CONFIG_MHI_BUS_PCI_GENERIC) := mhi_pci_generic.o
>
> The driver is already under bus/mhi so no need of mhi_ prefix here.
>
> > +
> > diff --git a/drivers/bus/mhi/mhi_pci_generic.c b/drivers/bus/mhi/mhi_pci_generic.c
> > new file mode 100644
> > index 0000000..dcd6c1a
> > --- /dev/null
> > +++ b/drivers/bus/mhi/mhi_pci_generic.c
> > @@ -0,0 +1,336 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * MHI PCI driver - MHI over PCI controller driver
> > + *
> > + * This module is a generic driver for registering MHI-over-PCI devices,
> > + * such as PCIe QCOM modems.
> > + *
> > + * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
>
> Is this driver completely written from scratch? If not then you need to provide
> the copyright in downstream.

Yes, the code itself has been written from scratch, though some
information, like channel IDs come from downstream parts.

>
>
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/mhi.h>
> > +#include <linux/module.h>
> > +#include <linux/pci.h>
> > +
> > +#define MHI_PCI_DEFAULT_BAR_NUM 0
> > +
> > +struct mhi_pci_dev_info {
> > +     const struct mhi_controller_config *config;
> > +     const char *name;
> > +     const char *fw;
> > +     const char *edl;
> > +     unsigned int bar_num;
> > +     unsigned int dma_data_width;
> > +};
>
> Can you please add Kdoc for this structure?

sure

>
> > +
> > +#define MHI_CHANNEL_CONFIG_UL(cnum, cname, elems, event)     \
>
> ch_num, ch_name sounds more apt here...
>
> > +     {                                                       \
> > +             .num = cnum,                                    \
> > +             .name = cname,                                  \
> > +             .num_elements = elems,                          \
> > +             .event_ring = event,                            \
> > +             .dir = DMA_TO_DEVICE,                           \
> > +             .ee_mask = BIT(MHI_EE_AMSS),                    \
> > +             .pollcfg = 0,                                   \
> > +             .doorbell = MHI_DB_BRST_DISABLE,                \
> > +             .lpm_notify = false,                            \
> > +             .offload_channel = false,                       \
> > +             .doorbell_mode_switch = false,                  \
> > +     }                                                       \
> > +
> > +#define MHI_CHANNEL_CONFIG_DL(cnum, cname, elems, event)     \
> > +     {                                                       \
> > +             .num = cnum,                                    \
> > +             .name = cname,                                  \
> > +             .num_elements = elems,                          \
> > +             .event_ring = event,                            \
> > +             .dir = DMA_FROM_DEVICE,                         \
> > +             .ee_mask = BIT(MHI_EE_AMSS),                    \
> > +             .pollcfg = 0,                                   \
> > +             .doorbell = MHI_DB_BRST_DISABLE,                \
> > +             .lpm_notify = false,                            \
> > +             .offload_channel = false,                       \
> > +             .doorbell_mode_switch = false,                  \
> > +     }
> > +
> > +#define MHI_EVENT_CONFIG_CTRL(enum)          \
>
> Can you use a better name instead of enum?

certainly

>
> > +     {                                       \
> > +             .num_elements = 64,             \
> > +             .irq_moderation_ms = 0,         \
> > +             .irq = (enum) + 1,              \
> > +             .priority = 1,                  \
> > +             .mode = MHI_DB_BRST_DISABLE,    \
> > +             .data_type = MHI_ER_CTRL,       \
> > +             .hardware_event = false,        \
> > +             .client_managed = false,        \
> > +             .offload_channel = false,       \
> > +     }
> > +
> > +#define MHI_EVENT_CONFIG_DATA(enum)          \
> > +     {                                       \
> > +             .num_elements = 128,            \
> > +             .irq_moderation_ms = 5,         \
> > +             .irq = (enum) + 1,              \
> > +             .priority = 1,                  \
> > +             .mode = MHI_DB_BRST_DISABLE,    \
> > +             .data_type = MHI_ER_DATA,       \
> > +             .hardware_event = false,        \
> > +             .client_managed = false,        \
> > +             .offload_channel = false,       \
> > +     }
> > +
> > +#define MHI_EVENT_CONFIG_HW_DATA(enum, cnum) \
> > +     {                                       \
> > +             .num_elements = 128,            \
> > +             .irq_moderation_ms = 5,         \
> > +             .irq = (enum) + 1,              \
> > +             .priority = 1,                  \
> > +             .mode = MHI_DB_BRST_DISABLE,    \
> > +             .data_type = MHI_ER_DATA,       \
> > +             .hardware_event = true,         \
> > +             .client_managed = false,        \
> > +             .offload_channel = false,       \
> > +             .channel = cnum,                \
> > +     }
> > +
> > +static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
> > +     MHI_CHANNEL_CONFIG_UL(12, "MBIM", 4, 0),
> > +     MHI_CHANNEL_CONFIG_DL(13, "MBIM", 4, 0),
> > +     MHI_CHANNEL_CONFIG_UL(14, "QMI", 4, 0),
> > +     MHI_CHANNEL_CONFIG_DL(15, "QMI", 4, 0),
> > +     MHI_CHANNEL_CONFIG_UL(20, "IPCR", 8, 0),
> > +     MHI_CHANNEL_CONFIG_DL(21, "IPCR", 8, 0),
> > +     MHI_CHANNEL_CONFIG_UL(100, "IP_HW0", 128, 1),
> > +     MHI_CHANNEL_CONFIG_DL(101, "IP_HW0", 128, 2),
> > +};
> > +
> > +static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
> > +     /* first ring is control+data ring */
> > +     MHI_EVENT_CONFIG_CTRL(0),
> > +     /* Hardware channels request dedicated hardware event rings */
> > +     MHI_EVENT_CONFIG_HW_DATA(1, 100),
> > +     MHI_EVENT_CONFIG_HW_DATA(2, 101)
> > +};
> > +
> > +static const struct mhi_controller_config modem_qcom_v1_mhi_config = {
> > +     .max_channels = 128,
> > +     .timeout_ms = 5000,
> > +     .num_channels = ARRAY_SIZE(modem_qcom_v1_mhi_channels),
> > +     .ch_cfg = modem_qcom_v1_mhi_channels,
> > +     .num_events = ARRAY_SIZE(modem_qcom_v1_mhi_events),
> > +     .event_cfg = modem_qcom_v1_mhi_events,
> > +};
> > +
> > +static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
> > +     .name = "qcom-sdx55m",
> > +     .fw = "qcom/sdx55m/sbl1.mbn",
> > +     .edl = "qcom/sdx55m/edl.mbn",
> > +     .config = &modem_qcom_v1_mhi_config,
> > +     .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> > +     .dma_data_width = 32
> > +};
> > +
> > +static const struct pci_device_id mhi_pci_id_table[] = {
> > +     { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
> > +             .driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
> > +     {  }
> > +};
> > +MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> > +
> > +static int mhi_pci_read_reg(struct mhi_controller *mhic, void __iomem *addr,
> > +                         u32 *out)
>
> Nit: Align the wrapped parameter with the start of '('
>
> > +{
> > +     *out = readl(addr);
> > +     return 0;
> > +}
> > +
> > +static void mhi_pci_write_reg(struct mhi_controller *mhic, void __iomem *addr,
> > +                           u32 val)
> > +{
> > +     writel(val, addr);
> > +}
> > +
> > +static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
> > +                           enum mhi_callback cb)
> > +{
> > +     return;
> > +}
> > +
> > +static int mhi_pci_claim(struct mhi_controller *mhic, unsigned int bar_num,
>
> s/mhic/mhi_cntrl - Just to be consistent with the core MHI bus.
>
> > +                      u64 dma_mask)
> > +{
> > +     struct pci_dev *pdev = to_pci_dev(mhic->cntrl_dev);
> > +     int err;
> > +
> > +     err = pci_assign_resource(pdev, bar_num);
> > +     if (err)
> > +             return err;
> > +
> > +     err = pcim_enable_device(pdev);
> > +     if (err) {
> > +             dev_err(&pdev->dev, "failed to enable pci device: %d\n", err);
> > +             return err;
> > +     }
> > +
> > +     err = pcim_iomap_regions(pdev, 1 << bar_num, pci_name(pdev));
> > +     if (err) {
> > +             dev_err(&pdev->dev, "failed to map pci region: %d\n", err);
> > +             return err;
> > +     }
> > +     mhic->regs = pcim_iomap_table(pdev)[bar_num];
> > +
> > +     err = pci_set_dma_mask(pdev, dma_mask);
> > +     if (err) {
> > +             dev_err(&pdev->dev, "Cannot set proper DMA mask\n");
> > +             return err;
> > +     }
> > +
> > +     err = pci_set_consistent_dma_mask(pdev, dma_mask);
> > +     if (err) {
> > +             dev_err(&pdev->dev, "set consistent dma mask failed\n");
> > +             return err;
> > +     }
> > +
> > +     pci_set_master(pdev);
> > +
> > +     return 0;
> > +}
> > +
> > +static int mhi_pci_get_irqs(struct mhi_controller *mhic,
> > +                         const struct mhi_controller_config *mhic_config)
> > +{
> > +     struct pci_dev *pdev = to_pci_dev(mhic->cntrl_dev);
> > +     int nr_vectors, i;
> > +     int *irq;
> > +
> > +     /*
> > +      * Alloc one MSI vector for BHI + one vector per event ring, ideally...
> > +      * No explicit pci_free_irq_vectors required, done by pcim_release.
> > +      */
> > +     mhic->nr_irqs = 1 + mhic_config->num_events;
> > +
> > +     nr_vectors = pci_alloc_irq_vectors(pdev, 1, mhic->nr_irqs, PCI_IRQ_MSI);
> > +     if (nr_vectors < 0) {
> > +             dev_err(&pdev->dev, "Error allocating MSI vectors %d\n",
> > +                     nr_vectors);
> > +             return nr_vectors;
> > +     }
> > +
> > +     if (nr_vectors < mhic->nr_irqs) {
> > +             dev_warn(&pdev->dev, "Not enough MSI vectors (%d/%d)\n",
> > +                      nr_vectors, mhic_config->num_events);
> > +             /* continue... use shared IRQ */
>
> Perhaps add this info to the warning as well?
>
> > +     }
> > +
> > +     irq = devm_kcalloc(&pdev->dev, mhic->nr_irqs, sizeof(int), GFP_KERNEL);
>
> So you're allocating 'mhic->nr_irqs' even for (nr_vectors < mhic->nr_irqs) case?

Yes, simply because I want to keep mhi_event_config which contains IRQ
IDs is constant (and would like to keep it constant).
That allows a simple matching between ring ID and interrupt ID.

>
> > +     if (!irq)
> > +             return -ENOMEM;
> > +
> > +     for (i = 0; i < mhic->nr_irqs; i++) {
> > +             int vector = i >= nr_vectors ? (nr_vectors - 1) : i;
> > +
> > +             irq[i] = pci_irq_vector(pdev, vector);
> > +     }
> > +
> > +     mhic->irq = irq;
> > +
> > +     return 0;
> > +}
> > +
> > +static int mhi_pci_runtime_get(struct mhi_controller *mhi_cntrl)
> > +{
> > +     /* no PM for now */
> > +     return 0;
> > +}
> > +
> > +static void mhi_pci_runtime_put(struct mhi_controller *mhi_cntrl)
> > +{
> > +     /* no PM for now */
> > +     return;
> > +}
> > +
> > +static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > +{
> > +     const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
> > +     const struct mhi_controller_config *mhic_config;
>
> s/mhic_config/mhi_config
>
> > +     struct mhi_controller *mhic;
> > +     int err;
> > +
> > +     dev_info(&pdev->dev, "MHI PCI device found: %s\n", info->name);
>
> Make it dev_dbg.
>
> > +
> > +     mhic = devm_kzalloc(&pdev->dev, sizeof(*mhic), GFP_KERNEL);
>
> You should use mhi_alloc_controller() API for allocating the controller struct.
> but then you need to free it in error paths as well...

TBH, not sure what is the point of using mhi_alloc_controller, since
kzalloc allows
zeroed allocation as well, and devm is so useful.

Regards,
Loic
