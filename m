Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3E72D9950
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 14:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408052AbgLNN6m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 08:58:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407099AbgLNN6m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 08:58:42 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF42AC0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 05:58:01 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id v22so17186844edt.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 05:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kkm83GmOTzwRwCEreD37UdZzaPsJ2YVfNEcd6JLhZLE=;
        b=mOevQ/g7sLvOMGxATmyBe7F7NITXXU5NUIjfW4LbAeMA1GGFMA2/Mdc/TSgiQ5AG/i
         SZZ4Fag4NsYuOmBIR291liP8IR0fDGc1BZjNrD2755fBBh7OxPh03kqdfnHJHbTPEDk4
         CVwHUOYE+fktrckfcmJeP/S1mqxrb5U+bDWgwZL5GJtPbKAFWNwIfxy6PYMwxys3yt9W
         ng7Qy7wWbznU9et8OpoED5n/8ZBkkM1XyvkhrCK3EBabW3Gkk3h9pUh+5OYG9xcC0QLO
         Pmcgtc3Y/Bj2xMaAOPdDzlDAbcIQd8YNmXWEewxfAnCxbvJds8+1pevE5tH30bYjh9UU
         +LSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kkm83GmOTzwRwCEreD37UdZzaPsJ2YVfNEcd6JLhZLE=;
        b=NzWVGPAuEGS7B197Ne9S7YSj45G68pJW+sVjIPDxcRDzJnwBPRzv/Z31CO4oyro9SF
         WWDU6KmK+i11VfWQu/peSgVSJ0RVmEVe6hcRiIGMbxHm+0rBBkcB+b9IH/kk5u2c49ej
         4zf9xKD7yackYwsdeF5VOoTMVRUxrnPHZ8BCgE3xDVmmurXhKWPSl8sWapMyGClPlRIs
         a7L/8p7Es890q0mtI178GvVYjD6NLMaI2DeNxZqzDMfagRc+2MAgc8keKT+ip428bXYu
         Tg0Lf4DGt/tXii4SVrow6pNcoGoych+rfq5LCyj6VKBmaYkfgRSM6MBPWaPVh1v9SFzg
         QBuw==
X-Gm-Message-State: AOAM530r4ocXbAO7hP/6xfol3b4uGbI5PF5Svb1WIsS3JrGYkS1MxUAg
        tOZasOQSs83KX6yu8G16uCKV29kFL0ZRY7pwo0b1bKh29xc=
X-Google-Smtp-Source: ABdhPJzacwaf+Jm0Sc8kEcN44JAPk1q10udIxxIbrUh/AUQiOomyRuxu5I+wr105TtG21/jIzAnnV+24IyD4vSxZ1TY=
X-Received: by 2002:a50:f307:: with SMTP id p7mr24930529edm.368.1607954280454;
 Mon, 14 Dec 2020 05:58:00 -0800 (PST)
MIME-Version: 1.0
References: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
 <1607594575-31590-6-git-send-email-loic.poulain@linaro.org> <35126c4f-fd60-9859-be8f-0529a0c392f5@codeaurora.org>
In-Reply-To: <35126c4f-fd60-9859-be8f-0529a0c392f5@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 14 Dec 2020 15:04:36 +0100
Message-ID: <CAMZdPi99HkZxZquBKBf4XTuixW_aBt7Ta1VVstZXfpjOGdadCA@mail.gmail.com>
Subject: Re: [PATCH v4 05/10] mhi: pci_generic: Add support for reset
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 11 Dec 2020 at 21:15, Hemant Kumar <hemantk@codeaurora.org> wrote:
>
>
> Hi Loic,
> On 12/10/20 2:02 AM, Loic Poulain wrote:
> > Add support for resetting the device, reset can be triggered in case
> > of error or manually via sysfs (/sys/bus/pci/devices/*/reset).
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >   drivers/bus/mhi/pci_generic.c | 120 +++++++++++++++++++++++++++++++++++++-----
> >   1 file changed, 107 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> > index 077595c..d70d3ea 100644
> > --- a/drivers/bus/mhi/pci_generic.c
> > +++ b/drivers/bus/mhi/pci_generic.c
> > @@ -8,6 +8,7 @@
> >    * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
> >    */
> >
> > +#include <linux/delay.h>
> >   #include <linux/device.h>
> >   #include <linux/mhi.h>
> >   #include <linux/module.h>
> > @@ -177,6 +178,16 @@ static const struct pci_device_id mhi_pci_id_table[] = {
> >   };
> >   MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> >
> > +enum mhi_pci_device_status {
> > +     MHI_PCI_DEV_STARTED,
> > +};
> > +
> > +struct mhi_pci_device {
> > +     struct mhi_controller mhi_cntrl;
> > +     struct pci_saved_state *pci_state;
> > +     unsigned long status;
> > +};
> > +
> >   static int mhi_pci_read_reg(struct mhi_controller *mhi_cntrl,
> >                           void __iomem *addr, u32 *out)
> >   {
> > @@ -196,6 +207,20 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
> >       /* Nothing to do for now */
> >   }
> >
> > +static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
> > +{
> > +     struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
> > +     u16 vendor = 0;
> > +
> > +     if (pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor))
> > +             return false;
> > +
> > +     if (vendor == (u16) ~0 || vendor == 0)
> > +             return false;
> > +
> > +     return true;
> > +}
> > +
> >   static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
> >                        unsigned int bar_num, u64 dma_mask)
> >   {
> > @@ -291,16 +316,20 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >   {
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
> >
> >       mhi_cntrl_config = info->config;
> > +     mhi_cntrl = &mhi_pdev->mhi_cntrl;
> > +
> > +     mhi_initialize_controller(mhi_cntrl);
> >       mhi_cntrl->cntrl_dev = &pdev->dev;
> >       mhi_cntrl->iova_start = 0;
> >       mhi_cntrl->iova_stop = DMA_BIT_MASK(info->dma_data_width);
> > @@ -315,17 +344,21 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
> > @@ -340,33 +373,94 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >               goto err_unprepare;
> >       }
> >
> > +     set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
> > +
> >       return 0;
> >
> >   err_unprepare:
> >       mhi_unprepare_after_power_down(mhi_cntrl);
> >   err_unregister:
> >       mhi_unregister_controller(mhi_cntrl);
> > -err_release:
> > -     mhi_free_controller(mhi_cntrl);
> >
> >       return err;
> >   }
> >
> >   static void mhi_pci_remove(struct pci_dev *pdev)
> >   {
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
> > -     mhi_free_controller(mhi_cntrl);
> >   }
> >
> > +void mhi_pci_reset_prepare(struct pci_dev *pdev)
> any reason for not making it static ?
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
> > +     mhi_reg_soc_reset(mhi_cntrl);
> > +
> > +     /* Be sure device reset has been executed */
> > +     msleep(500);
> one suggestion, since you are adding this support for any generic MHI
> controller, would it be good to make this configurable in case some
> devcices need mode time to complete reset?

I can add a define, but 500ms is more than enough to cause device
reset, it's overkill to have a per controller value, in worst case we
can increase the value.

Regards,
Loic
