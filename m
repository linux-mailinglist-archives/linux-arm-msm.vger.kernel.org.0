Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 992032950AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 18:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437754AbgJUQXg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 12:23:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437737AbgJUQXg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 12:23:36 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F4DC0613CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 09:23:36 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id j18so1790459pfa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 09:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/9UrVA44sHy/7+wxCLyOV4k2bn9TOJMaIrA2vlWZ3AU=;
        b=J+I4IrLzmbZHFt0WyatESQ7gG/aiyP4YCVZkyAYsrq21ZGdOJKOh2o/Y4Dgh/8RMhY
         3ZA6gi3YCgsdfCjg30v0CeY6W4f+kM/LqTwEvRXT9IwH01eIW8N6n4RhfNCgYaDpbhAp
         OWeygkuRorXdL9qPK0heC++s4bi6CyFqTcfB3p09Hq9GP4618txBd5cgxhrECfL5OXkh
         PjgLyr811ahAQ3eaiWmkDT6R63JO2zTriwarC6yyrYgALcEbq1pSE53MTgRoImewBQCw
         G98XJkFl4dztJ5UkRyaFlmKUcfuMYSlIhXQHXAa8jWlW6OWBgkvmNSPCD27d7EynPLIQ
         D50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/9UrVA44sHy/7+wxCLyOV4k2bn9TOJMaIrA2vlWZ3AU=;
        b=d9l+/xnWfN0xXPKkgxsCov2UpiJVRu5aLjsw3YcEb46U5ZIYNmx7DHjkph86LKAsBh
         b+bZaRQBVW7gacpAyAGvBX3e3bvZvFf6id6WMUg2bfpao10t32+PU+9TTY8Nh/qmqx4u
         NNNm/7I8PsS0WLTBMOBwkDEu+clBAFnfZ4mSNpAASmhTGvXz9WzbENA1rGb5FqDqYW0R
         7t5ZbC48I7ZyGXCSrdNo9e2wzsQgVUUjp6rerQAD0J4y9/vqERD130D1W5lWJqxaxfkN
         MeUnTnqMrwv0JC5wDNZDp6Wndp4xsH6B0b8UzVJe7puDMvLJJxzWb/yXMZnQhw82yeL7
         DrPA==
X-Gm-Message-State: AOAM5312keAbmHzXP0jgRCcecHyy896RtA4OMwwpAK2PKa7GnQ/7R62w
        G9HrYEfDtBBpA8MflGb/e/VM
X-Google-Smtp-Source: ABdhPJwslD3qpWmb9v7DaO06+pqGs1QhpC1buZe8exF3tPsL9j8fFp1zDVkmHh5c7Jj/VYgVVoFPdQ==
X-Received: by 2002:a62:a11a:0:b029:152:60c4:13f4 with SMTP id b26-20020a62a11a0000b029015260c413f4mr4481245pff.11.1603297415803;
        Wed, 21 Oct 2020 09:23:35 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:70e:2a27:314a:6d22:ec47:a603])
        by smtp.gmail.com with ESMTPSA id o4sm2474863pjp.37.2020.10.21.09.23.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 09:23:34 -0700 (PDT)
Date:   Wed, 21 Oct 2020 21:53:28 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v4] bus: mhi: Add MHI PCI support for WWAN modems
Message-ID: <20201021162328.GF3334@Mani-XPS-13-9360>
References: <1603108844-22286-1-git-send-email-loic.poulain@linaro.org>
 <20201021152029.GB3334@Mani-XPS-13-9360>
 <CAMZdPi96x91e7hux7WK=xQY62k1=1S1v=Tk2gadPidtOA=Augw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi96x91e7hux7WK=xQY62k1=1S1v=Tk2gadPidtOA=Augw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

On Wed, Oct 21, 2020 at 06:06:25PM +0200, Loic Poulain wrote:
> Hi Mani,
> 
> On Wed, 21 Oct 2020 at 17:20, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Mon, Oct 19, 2020 at 02:00:44PM +0200, Loic Poulain wrote:
> > > This is a generic MHI-over-PCI controller driver for MHI only devices
> > > such as QCOM modems. For now it supports registering of Qualcomm SDX55
> > > based PCIe modules. The MHI channels have been extracted from mhi
> > > downstream driver.
> > >
> > > This driver is for MHI-only devices which have all functionnalities
> >
> > s/functionnalities/functionalities
> >
> > > exposed through MHI channels and accessed by the corresponding MHI
> > > device drivers (no out-of-band communication).
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > > ---
> > >  v2: - remove useless delay.h include
> > >      - remove over-logging on error
> > >      - remove controller subdir
> > >      - rename to mhi_pci_modem.c
> > >      - Fix mhi_pci_probe exit path on error
> > >      - expand module description
> > >      - drop module version
> > >  v3: - Rename to mhi_pci_generic
> > >      - Add hardware accelerated IP channel (IPA)
> > >      - Added fw/edl names for sdx55m
> > >  v4: - Configurable dma width access
> > >      - Configurable PCI BAR number (default is 0)
> > >
> > >  drivers/bus/mhi/Kconfig           |   9 +
> > >  drivers/bus/mhi/Makefile          |   3 +
> > >  drivers/bus/mhi/mhi_pci_generic.c | 336 ++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 348 insertions(+)
> > >  create mode 100644 drivers/bus/mhi/mhi_pci_generic.c
> > >
> > > diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
> > > index e841c10..daa8528 100644
> > > --- a/drivers/bus/mhi/Kconfig
> > > +++ b/drivers/bus/mhi/Kconfig
> > > @@ -20,3 +20,12 @@ config MHI_BUS_DEBUG
> > >         Enable debugfs support for use with the MHI transport. Allows
> > >         reading and/or modifying some values within the MHI controller
> > >         for debug and test purposes.
> > > +
> > > +config MHI_BUS_PCI_GENERIC
> > > +     tristate "MHI PCI controller driver"
> > > +     depends on MHI_BUS
> > > +     depends on PCI
> > > +     help
> > > +       This driver provides Modem Host Interface (MHI) PCI controller driver
> >
> > No need to expand MHI here. It is already done in CONFIG_MHI_BUS.
> >
> > > +       for devices such as Qualcomm SDX55 based PCIe modems.
> > > +
> > > diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
> > > index 19e6443..d1a4ef3 100644
> > > --- a/drivers/bus/mhi/Makefile
> > > +++ b/drivers/bus/mhi/Makefile
> > > @@ -1,2 +1,5 @@
> > >  # core layer
> > >  obj-y += core/
> > > +
> > > +obj-$(CONFIG_MHI_BUS_PCI_GENERIC) := mhi_pci_generic.o
> >
> > The driver is already under bus/mhi so no need of mhi_ prefix here.
> >
> > > +
> > > diff --git a/drivers/bus/mhi/mhi_pci_generic.c b/drivers/bus/mhi/mhi_pci_generic.c
> > > new file mode 100644
> > > index 0000000..dcd6c1a
> > > --- /dev/null
> > > +++ b/drivers/bus/mhi/mhi_pci_generic.c
> > > @@ -0,0 +1,336 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * MHI PCI driver - MHI over PCI controller driver
> > > + *
> > > + * This module is a generic driver for registering MHI-over-PCI devices,
> > > + * such as PCIe QCOM modems.
> > > + *
> > > + * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
> >
> > Is this driver completely written from scratch? If not then you need to provide
> > the copyright in downstream.
> 
> Yes, the code itself has been written from scratch, though some
> information, like channel IDs come from downstream parts.
> 

Okay, then it is fine.

> >
> >
> > > + */

[...]

> > > +
> > > +static int mhi_pci_get_irqs(struct mhi_controller *mhic,
> > > +                         const struct mhi_controller_config *mhic_config)
> > > +{
> > > +     struct pci_dev *pdev = to_pci_dev(mhic->cntrl_dev);
> > > +     int nr_vectors, i;
> > > +     int *irq;
> > > +
> > > +     /*
> > > +      * Alloc one MSI vector for BHI + one vector per event ring, ideally...
> > > +      * No explicit pci_free_irq_vectors required, done by pcim_release.
> > > +      */
> > > +     mhic->nr_irqs = 1 + mhic_config->num_events;
> > > +
> > > +     nr_vectors = pci_alloc_irq_vectors(pdev, 1, mhic->nr_irqs, PCI_IRQ_MSI);
> > > +     if (nr_vectors < 0) {
> > > +             dev_err(&pdev->dev, "Error allocating MSI vectors %d\n",
> > > +                     nr_vectors);
> > > +             return nr_vectors;
> > > +     }
> > > +
> > > +     if (nr_vectors < mhic->nr_irqs) {
> > > +             dev_warn(&pdev->dev, "Not enough MSI vectors (%d/%d)\n",
> > > +                      nr_vectors, mhic_config->num_events);
> > > +             /* continue... use shared IRQ */
> >
> > Perhaps add this info to the warning as well?
> >
> > > +     }
> > > +
> > > +     irq = devm_kcalloc(&pdev->dev, mhic->nr_irqs, sizeof(int), GFP_KERNEL);
> >
> > So you're allocating 'mhic->nr_irqs' even for (nr_vectors < mhic->nr_irqs) case?
> 
> Yes, simply because I want to keep mhi_event_config which contains IRQ
> IDs is constant (and would like to keep it constant).
> That allows a simple matching between ring ID and interrupt ID.
> 

Okay.

> >
> > > +     if (!irq)
> > > +             return -ENOMEM;
> > > +
> > > +     for (i = 0; i < mhic->nr_irqs; i++) {
> > > +             int vector = i >= nr_vectors ? (nr_vectors - 1) : i;
> > > +
> > > +             irq[i] = pci_irq_vector(pdev, vector);
> > > +     }
> > > +
> > > +     mhic->irq = irq;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int mhi_pci_runtime_get(struct mhi_controller *mhi_cntrl)
> > > +{
> > > +     /* no PM for now */
> > > +     return 0;
> > > +}
> > > +
> > > +static void mhi_pci_runtime_put(struct mhi_controller *mhi_cntrl)
> > > +{
> > > +     /* no PM for now */
> > > +     return;
> > > +}
> > > +
> > > +static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > > +{
> > > +     const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
> > > +     const struct mhi_controller_config *mhic_config;
> >
> > s/mhic_config/mhi_config
> >
> > > +     struct mhi_controller *mhic;
> > > +     int err;
> > > +
> > > +     dev_info(&pdev->dev, "MHI PCI device found: %s\n", info->name);
> >
> > Make it dev_dbg.
> >
> > > +
> > > +     mhic = devm_kzalloc(&pdev->dev, sizeof(*mhic), GFP_KERNEL);
> >
> > You should use mhi_alloc_controller() API for allocating the controller struct.
> > but then you need to free it in error paths as well...
> 
> TBH, not sure what is the point of using mhi_alloc_controller, since
> kzalloc allows
> zeroed allocation as well, and devm is so useful.
> 

I agree but the intention is not to depend on the controller drivers to zero out
the structure. The stack makes the assumption that the structure is zeroed out,
so anything not doing so will create serious issues.

Thanks,
Mani

> Regards,
> Loic
