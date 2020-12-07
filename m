Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED122D12F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Dec 2020 15:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727229AbgLGOAP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 09:00:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727218AbgLGOAN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 09:00:13 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A03C0613D0
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Dec 2020 05:59:38 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id u19so13828761edx.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Dec 2020 05:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2TjuAk1tf0hQvN5CoqeKIPGFstjbSpbvuERLZz1Ibrg=;
        b=IRT7A19fNmDjw2F++8fc5xtUIQItdrDhKCI5MU2Y7IZgXYH3RsJ/Ec3bjsrF3BQsSN
         FIiNIMW3ULJEbWsIoXigHMERr+Wci3CgCtvog6uh6RqdaQRw7Bb/8vp7kqIkPLlPZ/IC
         /fwXiW2pN8U6bYplh+DFVVULgAK2IMqiH+88xTTmGG84wTbLAbJw5Roz8yyJKHmgkKKn
         2Wx8y6gWzn2MAR/XCTeEXCAGTxem0XjsIxMgh0rKgq0auxokmQyViXCqGzc5CAfbVtAE
         l74WWbV1/5dRnOUe9HgzQxAmvFLcHl2DLbhtVIl4WjSNSJpK6SufXcatoRL1U/0d858V
         5huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2TjuAk1tf0hQvN5CoqeKIPGFstjbSpbvuERLZz1Ibrg=;
        b=kiHxaxcbXcZYf+nZZ+0DCr041Mir6teuP7363ZDYKzIGsDDpctVI9zVPiSJfc6FUht
         58m28+Q3I2loA5yhygzMbJuP31O5/cEYQmmFXEf8/rsBKirIkH1MGD98qZegBQJ5n8OA
         KpnMjCLrzEFGqtTE6+uK941/auKEuQPb0i3giXBrbC0NeCl8NPqk+0Tx2oAGjlM6l56c
         2vS6VTgAr0xMyKkLELAUYFdGOxcgBlckOSCteivHRbkC5fiKJ3WoLSw0eSY2WQqZWWy9
         HpdNaCD6lcKvrJ9kncxGL0Jw9DbY4tMNd1okgQb7W5dkiXoDHthCoZarD0E/EP8Jcn9l
         f4SA==
X-Gm-Message-State: AOAM5300U91cKw0b8EpP08+/NOsPMq81VVMWrmPdHjsY2dQOT+JCAzvP
        aQTJYR0Sc7Rh7EFEJesY+5ajRyLbvtlR9rnWC8N2Hw==
X-Google-Smtp-Source: ABdhPJy8yVh730bWMNurVRERSCn+MlyYB5F1XkbNvr2+7vbZoXkjdTAC+ue1HxP4JAcWi0FffZW8s2U1p5THuaj7rDg=
X-Received: by 2002:aa7:dacf:: with SMTP id x15mr19751632eds.134.1607349577166;
 Mon, 07 Dec 2020 05:59:37 -0800 (PST)
MIME-Version: 1.0
References: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
 <1606404547-10737-6-git-send-email-loic.poulain@linaro.org>
 <20201128054941.GD3077@thinkpad> <CAMZdPi_VE5WBq50WcDfUvS6kc=Y9jyY6S5N82tOwx3TyZ2nwnw@mail.gmail.com>
 <2a87668357b7f3e7788b9459a6b0319a@codeaurora.org>
In-Reply-To: <2a87668357b7f3e7788b9459a6b0319a@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 7 Dec 2020 15:05:59 +0100
Message-ID: <CAMZdPi91jpH=2Yz_OGsHq9BufO3df4tgp7SKZFTY+pMQUPoAgQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] mhi: pci_generic: Add support for reset
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On Wed, 2 Dec 2020 at 02:24, Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:
> > On Sat, 28 Nov 2020 at 06:49, Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org> wrote:
> >>
> >> >  {
> >> > @@ -298,16 +323,20 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >> >  {
> >> >       const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
> >> >       const struct mhi_controller_config *mhi_cntrl_config;
> >> > +     struct mhi_pci_device *mhi_pdev;
> >> >       struct mhi_controller *mhi_cntrl;
> >> >       int err;
> >> >
> >> >       dev_dbg(&pdev->dev, "MHI PCI device found: %s\n", info->name);
> >> >
> >> > -     mhi_cntrl = mhi_alloc_controller();
> >> > -     if (!mhi_cntrl)
> >> > +     mhi_pdev = devm_kzalloc(&pdev->dev, sizeof(*mhi_pdev), GFP_KERNEL);
> >> > +     if (!mhi_pdev)
> >> >               return -ENOMEM;
> >>
> >> Still not agreeing to use the alloc API? I know that it does only one
> >> job but the reason for pushing this API is that the MHI stack will
> >> misbehave terribly if a non-initialized structure is passed to it. And
> >> the only way to ensure is to provide an API and recommend the users to
> >> use it.
> >
> > I think there is a misunderstanding of my will here :-), actually, I'm
> > not against using a specific API, but as you see here I'm not
> > allocating a mhi_controller structure but a mhi_pci_device structure,
> > which in turn includes (or inherit from) mhi_controller struct.
> >
> > If mhi_alloc_controller() is the only API allowing to
> > create+initialize a mhi_controller object, that implies:
> > a. Statically allocated mhi_controller is not possible
> > b. non-standalone mhi_controller structure is not possible (my case)
> >
> > If you mandate this and do not allow a. and b. , then yes, I'll use
> > mhi_controller_alloc, but that would mean having two nested dynamic
> > allocations, one for mhi_pdev and one for mhi_pdev->mhi_cntrl,
> > cross-referencing (for finding mhi_pdev from mhi_cntrl since no more
> > container_of), and double freeing... that complicates a bit, is
> > suboptimal and does not really make sense, since conceptually,
> > mhi_pdev and its mhi_cntl member are the same 'object' (exactly like
> > mhi_dev and mhi_dev->dev are the same object in MHI core).
> >
> > I understand we may have to perform some extra initialization and
> > cannot just do zeroed allocation for the mhi_controller, but what I
> > say is that this initialization should be do-able, regardless you want
> > to (also) dynamically allocate the device or not. That why I proposed
> > to introduce mhi_initialize_controller() as a solution to keep things
> > simple, in the same way as other subsystems: device_initialize,
> > snd_device_initialize, nand_controller_init...
> >
> > Regards,
> > Loic
> >
> >
> I don't see using the new API as a problem but it is more work for the
> controller and having one API is better than having two and having to
> explain
> why we have them.

Before going with V4, I would like your feedback here.

Thanks,
Loic

>
> If Mani agrees with this approach I am OK with it.
> >>
> >> >
> >> >       mhi_cntrl_config = info->config;
> >> > +     mhi_cntrl = &mhi_pdev->mhi_cntrl;
> >> > +
> >> > +     mhi_initialize_controller(mhi_cntrl);
> >>
> >> No, please just stick to alloc API.
> >>
> >> Thanks,
> >> Mani
> >>
> >> >       mhi_cntrl->cntrl_dev = &pdev->dev;
> >> >       mhi_cntrl->iova_start = 0;
> >> >       mhi_cntrl->iova_stop = (dma_addr_t)DMA_BIT_MASK(info->dma_data_width);
> >> > @@ -322,17 +351,21 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >> >
> >> >       err = mhi_pci_claim(mhi_cntrl, info->bar_num, DMA_BIT_MASK(info->dma_data_width));
> >> >       if (err)
> >> > -             goto err_release;
> >> > +             return err;
> >> >
> >> >       err = mhi_pci_get_irqs(mhi_cntrl, mhi_cntrl_config);
> >> >       if (err)
> >> > -             goto err_release;
> >> > +             return err;
> >> > +
> >> > +     pci_set_drvdata(pdev, mhi_pdev);
> >> >
> >> > -     pci_set_drvdata(pdev, mhi_cntrl);
> >> > +     /* Have stored pci confspace at hand for restore in sudden PCI error */
> >> > +     pci_save_state(pdev);
> >> > +     mhi_pdev->pci_state = pci_store_saved_state(pdev);
> >> >
> >> >       err = mhi_register_controller(mhi_cntrl, mhi_cntrl_config);
> >> >       if (err)
> >> > -             goto err_release;
> >> > +             return err;
> >> >
> >> >       /* MHI bus does not power up the controller by default */
> >> >       err = mhi_prepare_for_power_up(mhi_cntrl);
> >> > @@ -347,37 +380,97 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >> >               goto err_unprepare;
> >> >       }
> >> >
> >> > +     set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
> >> > +
> >> >       return 0;
> >> >
> >> >  err_unprepare:
> >> >       mhi_unprepare_after_power_down(mhi_cntrl);
> >> >  err_unregister:
> >> >       mhi_unregister_controller(mhi_cntrl);
> >> > -err_release:
> >> > -     mhi_free_controller(mhi_cntrl);
> >> >
> >> >       return err;
> >> >  }
> >> >
> >> >  static void mhi_pci_remove(struct pci_dev *pdev)
> >> >  {
> >> > -     struct mhi_controller *mhi_cntrl = pci_get_drvdata(pdev);
> >> > +     struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> >> > +     struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> >> > +
> >> > +     if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
> >> > +             mhi_power_down(mhi_cntrl, true);
> >> > +             mhi_unprepare_after_power_down(mhi_cntrl);
> >> > +     }
> >> >
> >> > -     mhi_power_down(mhi_cntrl, true);
> >> > -     mhi_unprepare_after_power_down(mhi_cntrl);
> >> >       mhi_unregister_controller(mhi_cntrl);
> >> >
> >> >       /* MHI-layer reset could not be enough, always hard-reset the device */
> >> >       mhi_pci_reset(mhi_cntrl);
> >> > +}
> >> > +
> >> > +void mhi_pci_reset_prepare(struct pci_dev *pdev)
> >> > +{
> >> > +     struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> >> > +     struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> >> > +
> >> > +     dev_info(&pdev->dev, "reset\n");
> >> > +
> >> > +     /* Clean up MHI state */
> >> > +     if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
> >> > +             mhi_power_down(mhi_cntrl, false);
> >> > +             mhi_unprepare_after_power_down(mhi_cntrl);
> >> > +     }
> >> > +
> >> > +     /* cause internal device reset */
> >> > +     mhi_pci_reset(mhi_cntrl);
> >> > +
> >> > +     /* Be sure device reset has been executed */
> >> > +     msleep(500);
> >> > +}
> >> > +
> >> > +void mhi_pci_reset_done(struct pci_dev *pdev)
> >> > +{
> >> > +     struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> >> > +     struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> >> > +     int err;
> >> > +
> >> > +     /* Restore initial known working PCI state */
> >> > +     pci_load_saved_state(pdev, mhi_pdev->pci_state);
> >> > +     pci_restore_state(pdev);
> >> > +
> >> > +     /* Is device status available ? */
> >> > +     if (!mhi_pci_is_alive(mhi_cntrl)) {
> >> > +             dev_err(&pdev->dev, "reset failed\n");
> >> > +             return;
> >> > +     }
> >> >
> >> > -     mhi_free_controller(mhi_cntrl);
> >> > +     err = mhi_prepare_for_power_up(mhi_cntrl);
> >> > +     if (err) {
> >> > +             dev_err(&pdev->dev, "failed to prepare MHI controller\n");
> >> > +             return;
> >> > +     }
> >> > +
> >> > +     err = mhi_sync_power_up(mhi_cntrl);
> >> > +     if (err) {
> >> > +             dev_err(&pdev->dev, "failed to power up MHI controller\n");
> >> > +             mhi_unprepare_after_power_down(mhi_cntrl);
> >> > +             return;
> >> > +     }
> >> > +
> >> > +     set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
> >> >  }
> >> >
> >> > +static const struct pci_error_handlers mhi_pci_err_handler = {
> >> > +     .reset_prepare = mhi_pci_reset_prepare,
> >> > +     .reset_done = mhi_pci_reset_done,
> >> > +};
> >> > +
> >> >  static struct pci_driver mhi_pci_driver = {
> >> >       .name           = "mhi-pci-generic",
> >> >       .id_table       = mhi_pci_id_table,
> >> >       .probe          = mhi_pci_probe,
> >> > -     .remove         = mhi_pci_remove
> >> > +     .remove         = mhi_pci_remove,
> >> > +     .err_handler    = &mhi_pci_err_handler,
> >> >  };
> >> >  module_pci_driver(mhi_pci_driver);
> >> >
> >> > --
> >> > 2.7.4
> >> >
>
> Thanks,
> Bhaumik
> ---
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> Forum,
> a Linux Foundation Collaborative Project
