Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 646B22C8081
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 10:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgK3JDe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 04:03:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgK3JDd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 04:03:33 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B26C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 01:02:47 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id k4so14983672edl.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 01:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PABc/eBXJZCyGcSKYNfLd4juTqKxKphbp1a9rL66Ubc=;
        b=JoZm3gfAwZw3kO4S6mrG2ywQZpq0A3iyNwb8Y7SrhdpkcROCAOH6wZAKkYgWI4clmP
         SYPaOvAXjWXTB6bqSqr3ch2tAbvUfjaep7zlYB5nNbFD8svRekQLTKeGFg+weKBmAkvO
         Jr2YIL7tns681yTj9QbTY2cT3Xh/O01TnzQEzUESTrwFmQdpVZQHZIyEpe/Q04+9qH1P
         qSb3Ye0TRR4CARmy/P7JcS0N5xRbP6fvq2djOAJ/StTBCYyC+ndRK/yaGTuW/mh4AT77
         FIbhc7XDWB9jF7cE+0j4K3mN0hwGr56fgmhlrnyEIvbedbvAillyKlp+go0WpLUGLHq0
         oNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PABc/eBXJZCyGcSKYNfLd4juTqKxKphbp1a9rL66Ubc=;
        b=QPFR6FF8yC9SKd0QVRj2cQ2ZrBoPg7EF8HB6fIHyTqC9H/5IoYSjHaCbzxsiXn89Wy
         qqh03JtQX1QveyOD1f7At/8BvfJuaXIOUphSOPwLjTDAUfnVxO+r/wOBO37r6TyF4H0H
         XJeIzpuS9dicJdmo5EIuz5DvizlnAT2Wkg6sC2LV1JpDlz38Yvz/ZEE20gRiY614QUAC
         o/oow4qnwov53BcRbRtggr05wM4ULXbYYeu4LZhleb4+7J22XCLCeK2MLOCyb0mdLPBO
         UsOGhpT77DisyEOliHnPAniVdXWUjTP+AEhui5VXgLQCnQyRC429W53CS8To4IbjwSSc
         8UwQ==
X-Gm-Message-State: AOAM532CWZbQymXxarJiRw1qfzOLcHrYR8+99cy2lg/xBvbBGxhODVxR
        TtRwqmgirR6EaIy6zeEWlN82nHWOg+BpnEOrRky4sw==
X-Google-Smtp-Source: ABdhPJxPfDJwOgXMVZw4XWy+HZc0E1TEzmTNyilCqEw03AL9IrmbnXqRLPjlU9a9AmzkKwBeVMXPOGJA5vGjoRL2T9w=
X-Received: by 2002:aa7:d883:: with SMTP id u3mr20537430edq.69.1606726965563;
 Mon, 30 Nov 2020 01:02:45 -0800 (PST)
MIME-Version: 1.0
References: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
 <1606404547-10737-6-git-send-email-loic.poulain@linaro.org> <20201128054941.GD3077@thinkpad>
In-Reply-To: <20201128054941.GD3077@thinkpad>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 30 Nov 2020 10:08:57 +0100
Message-ID: <CAMZdPi_VE5WBq50WcDfUvS6kc=Y9jyY6S5N82tOwx3TyZ2nwnw@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] mhi: pci_generic: Add support for reset
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani, Bhaumik,

On Sat, 28 Nov 2020 at 06:49, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> >  {
> > @@ -298,16 +323,20 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >  {
> >       const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
> >       const struct mhi_controller_config *mhi_cntrl_config;
> > +     struct mhi_pci_device *mhi_pdev;
> >       struct mhi_controller *mhi_cntrl;
> >       int err;
> >
> >       dev_dbg(&pdev->dev, "MHI PCI device found: %s\n", info->name);
> >
> > -     mhi_cntrl = mhi_alloc_controller();
> > -     if (!mhi_cntrl)
> > +     mhi_pdev = devm_kzalloc(&pdev->dev, sizeof(*mhi_pdev), GFP_KERNEL);
> > +     if (!mhi_pdev)
> >               return -ENOMEM;
>
> Still not agreeing to use the alloc API? I know that it does only one
> job but the reason for pushing this API is that the MHI stack will
> misbehave terribly if a non-initialized structure is passed to it. And
> the only way to ensure is to provide an API and recommend the users to
> use it.

I think there is a misunderstanding of my will here :-), actually, I'm
not against using a specific API, but as you see here I'm not
allocating a mhi_controller structure but a mhi_pci_device structure,
which in turn includes (or inherit from) mhi_controller struct.

If mhi_alloc_controller() is the only API allowing to
create+initialize a mhi_controller object, that implies:
a. Statically allocated mhi_controller is not possible
b. non-standalone mhi_controller structure is not possible (my case)

If you mandate this and do not allow a. and b. , then yes, I'll use
mhi_controller_alloc, but that would mean having two nested dynamic
allocations, one for mhi_pdev and one for mhi_pdev->mhi_cntrl,
cross-referencing (for finding mhi_pdev from mhi_cntrl since no more
container_of), and double freeing... that complicates a bit, is
suboptimal and does not really make sense, since conceptually,
mhi_pdev and its mhi_cntl member are the same 'object' (exactly like
mhi_dev and mhi_dev->dev are the same object in MHI core).

I understand we may have to perform some extra initialization and
cannot just do zeroed allocation for the mhi_controller, but what I
say is that this initialization should be do-able, regardless you want
to (also) dynamically allocate the device or not. That why I proposed
to introduce mhi_initialize_controller() as a solution to keep things
simple, in the same way as other subsystems: device_initialize,
snd_device_initialize, nand_controller_init...

Regards,
Loic


>
> >
> >       mhi_cntrl_config = info->config;
> > +     mhi_cntrl = &mhi_pdev->mhi_cntrl;
> > +
> > +     mhi_initialize_controller(mhi_cntrl);
>
> No, please just stick to alloc API.
>
> Thanks,
> Mani
>
> >       mhi_cntrl->cntrl_dev = &pdev->dev;
> >       mhi_cntrl->iova_start = 0;
> >       mhi_cntrl->iova_stop = (dma_addr_t)DMA_BIT_MASK(info->dma_data_width);
> > @@ -322,17 +351,21 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >
> >       err = mhi_pci_claim(mhi_cntrl, info->bar_num, DMA_BIT_MASK(info->dma_data_width));
> >       if (err)
> > -             goto err_release;
> > +             return err;
> >
> >       err = mhi_pci_get_irqs(mhi_cntrl, mhi_cntrl_config);
> >       if (err)
> > -             goto err_release;
> > +             return err;
> > +
> > +     pci_set_drvdata(pdev, mhi_pdev);
> >
> > -     pci_set_drvdata(pdev, mhi_cntrl);
> > +     /* Have stored pci confspace at hand for restore in sudden PCI error */
> > +     pci_save_state(pdev);
> > +     mhi_pdev->pci_state = pci_store_saved_state(pdev);
> >
> >       err = mhi_register_controller(mhi_cntrl, mhi_cntrl_config);
> >       if (err)
> > -             goto err_release;
> > +             return err;
> >
> >       /* MHI bus does not power up the controller by default */
> >       err = mhi_prepare_for_power_up(mhi_cntrl);
> > @@ -347,37 +380,97 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >               goto err_unprepare;
> >       }
> >
> > +     set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
> > +
> >       return 0;
> >
> >  err_unprepare:
> >       mhi_unprepare_after_power_down(mhi_cntrl);
> >  err_unregister:
> >       mhi_unregister_controller(mhi_cntrl);
> > -err_release:
> > -     mhi_free_controller(mhi_cntrl);
> >
> >       return err;
> >  }
> >
> >  static void mhi_pci_remove(struct pci_dev *pdev)
> >  {
> > -     struct mhi_controller *mhi_cntrl = pci_get_drvdata(pdev);
> > +     struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> > +     struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> > +
> > +     if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
> > +             mhi_power_down(mhi_cntrl, true);
> > +             mhi_unprepare_after_power_down(mhi_cntrl);
> > +     }
> >
> > -     mhi_power_down(mhi_cntrl, true);
> > -     mhi_unprepare_after_power_down(mhi_cntrl);
> >       mhi_unregister_controller(mhi_cntrl);
> >
> >       /* MHI-layer reset could not be enough, always hard-reset the device */
> >       mhi_pci_reset(mhi_cntrl);
> > +}
> > +
> > +void mhi_pci_reset_prepare(struct pci_dev *pdev)
> > +{
> > +     struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> > +     struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> > +
> > +     dev_info(&pdev->dev, "reset\n");
> > +
> > +     /* Clean up MHI state */
> > +     if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
> > +             mhi_power_down(mhi_cntrl, false);
> > +             mhi_unprepare_after_power_down(mhi_cntrl);
> > +     }
> > +
> > +     /* cause internal device reset */
> > +     mhi_pci_reset(mhi_cntrl);
> > +
> > +     /* Be sure device reset has been executed */
> > +     msleep(500);
> > +}
> > +
> > +void mhi_pci_reset_done(struct pci_dev *pdev)
> > +{
> > +     struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> > +     struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> > +     int err;
> > +
> > +     /* Restore initial known working PCI state */
> > +     pci_load_saved_state(pdev, mhi_pdev->pci_state);
> > +     pci_restore_state(pdev);
> > +
> > +     /* Is device status available ? */
> > +     if (!mhi_pci_is_alive(mhi_cntrl)) {
> > +             dev_err(&pdev->dev, "reset failed\n");
> > +             return;
> > +     }
> >
> > -     mhi_free_controller(mhi_cntrl);
> > +     err = mhi_prepare_for_power_up(mhi_cntrl);
> > +     if (err) {
> > +             dev_err(&pdev->dev, "failed to prepare MHI controller\n");
> > +             return;
> > +     }
> > +
> > +     err = mhi_sync_power_up(mhi_cntrl);
> > +     if (err) {
> > +             dev_err(&pdev->dev, "failed to power up MHI controller\n");
> > +             mhi_unprepare_after_power_down(mhi_cntrl);
> > +             return;
> > +     }
> > +
> > +     set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
> >  }
> >
> > +static const struct pci_error_handlers mhi_pci_err_handler = {
> > +     .reset_prepare = mhi_pci_reset_prepare,
> > +     .reset_done = mhi_pci_reset_done,
> > +};
> > +
> >  static struct pci_driver mhi_pci_driver = {
> >       .name           = "mhi-pci-generic",
> >       .id_table       = mhi_pci_id_table,
> >       .probe          = mhi_pci_probe,
> > -     .remove         = mhi_pci_remove
> > +     .remove         = mhi_pci_remove,
> > +     .err_handler    = &mhi_pci_err_handler,
> >  };
> >  module_pci_driver(mhi_pci_driver);
> >
> > --
> > 2.7.4
> >
