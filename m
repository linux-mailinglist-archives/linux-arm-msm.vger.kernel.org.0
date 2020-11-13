Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 951412B22A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 18:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbgKMRg1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 12:36:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgKMRg1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 12:36:27 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E6EC0617A6
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 09:36:27 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id f23so14695544ejk.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 09:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=knpF3oUf4iLcVmTV1xbM3Xgaop8GXXYjImmWtLfUy7s=;
        b=VQXRtOXFS3Aep/7WsECFYMNESgr93p+oh9BAgnfNyyo2ikY9hxoFU8BEifm6SlXnZ0
         TqhUSVW70atK5VpAfDtXKZk7y/XxVQswrYXHtfKqeZ/Ar3558mIZZynXNU+KoxuV8oFV
         pvnOBqmYiRKnulX7O/0WDk2KbWQeOblJPakWeHsCsd2hKNgVmA45vX+D66eA+0OdUHEX
         1aGMXZcMDuAY7HX3NxWh7biEzBOJo52wtFM4VaPmjYI4fljoQ03trEpXGTBuooVDiZaw
         meEw5gC7wEEqv51x8EviaiEEWUHh8bZQvkzbUu1iRg4GBKv7Md1IQ/D0e6wwZVdomF0r
         HgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=knpF3oUf4iLcVmTV1xbM3Xgaop8GXXYjImmWtLfUy7s=;
        b=XF6wPsTmfZQRDiBj/0XlQNjGnJbpx8PpRDdAYb2pOmANlxczBBgagR1Gir/piaZODJ
         4ipxuigSGRRXyWQP/D7TW7ecj1wBWctMZ9TDRnccxirDmX16g3SU/yGKAr2b1BFjykbL
         FoclwZwSG5B2jCCb4DQkG3G/izEC2D9b3M4tFBMkYIjyw2jSIGGlzigvjsEb7eWGYHDv
         nVog2SsWbWLhTTMXlKDdbcvybwO+UBqrMQsJqtxBA8zOWpnH0Zm8ejl5I0V9cl3o7ho/
         Nj4voYaG72bmLwjQT39nioiBICkhtOJI6lseZeBRsA2HNPh+EfqLuF9mwfbSYjNsKxTq
         XwcA==
X-Gm-Message-State: AOAM533nICpiqXU//gFjJYhxkU6F//kZfRP0n4/mFk7Wgd6YGjf8eMtA
        19cs2KeC74wK1T0U88xUM3N4BLXIGH8wJ+vCKXR+PsH2ugbvLA==
X-Google-Smtp-Source: ABdhPJyyC+vWOukAgyYJzhOqte4Xr0SAz+klGIhrlxPBCpQktlCXPWB+SPzdiGshzB8GpRC2nchPoBNvWYOGlA9gWbw=
X-Received: by 2002:a17:906:180b:: with SMTP id v11mr2999943eje.466.1605288985527;
 Fri, 13 Nov 2020 09:36:25 -0800 (PST)
MIME-Version: 1.0
References: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
 <1605279602-18749-5-git-send-email-loic.poulain@linaro.org> <d207bf6fde62bafd217ef7427d7f00c8@codeaurora.org>
In-Reply-To: <d207bf6fde62bafd217ef7427d7f00c8@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Fri, 13 Nov 2020 18:42:30 +0100
Message-ID: <CAMZdPi_13oSO6j2K15uCM9PcP4MB8wDo-2CxvueLrwcEhkSG8Q@mail.gmail.com>
Subject: Re: [PATCH 4/8] mhi: pci_generic: Add support for reset
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhaumik,

On Fri, 13 Nov 2020 at 18:12, Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:
>
> On 2020-11-13 06:59, Loic Poulain wrote:
> > Add support for resetting the device, reset can be triggered in case
> > of error or manually via sysfs (/sys/bus/pci/devices/*/reset).
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  drivers/bus/mhi/pci_generic.c | 117
> > +++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 104 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/bus/mhi/pci_generic.c
> > b/drivers/bus/mhi/pci_generic.c
> > index 0c07cf5..b48c382 100644
> > --- a/drivers/bus/mhi/pci_generic.c
> > +++ b/drivers/bus/mhi/pci_generic.c
> > @@ -8,6 +8,7 @@
> >   * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
> >   */
> >
> > +#include <linux/delay.h>
> >  #include <linux/device.h>
> >  #include <linux/mhi.h>
> >  #include <linux/module.h>
> > @@ -179,6 +180,16 @@ static const struct pci_device_id
> > mhi_pci_id_table[] = {
> >  };
> >  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
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
> >  static int mhi_pci_read_reg(struct mhi_controller *mhi_cntrl,
> >                           void __iomem *addr, u32 *out)
> >  {
> > @@ -203,6 +214,20 @@ static inline void mhi_pci_reset(struct
> > mhi_controller *mhi_cntrl)
> >       writel(1, mhi_cntrl->regs + DEV_RESET_REG);
> >  }
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
> >  static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
> >                        unsigned int bar_num, u64 dma_mask)
> >  {
> > @@ -298,16 +323,18 @@ static int mhi_pci_probe(struct pci_dev *pdev,
> > const struct pci_device_id *id)
> >  {
> >       const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *)
> > id->driver_data;
> >       const struct mhi_controller_config *mhi_cntrl_config;
> > +     struct mhi_pci_device *mhi_pdev;
> >       struct mhi_controller *mhi_cntrl;
> >       int err;
> >
> >       dev_dbg(&pdev->dev, "MHI PCI device found: %s\n", info->name);
> >
> > -     mhi_cntrl = mhi_alloc_controller();
> > -     if (!mhi_cntrl)
> Not recommended.
> > +     mhi_pdev = devm_kzalloc(&pdev->dev, sizeof(*mhi_pdev), GFP_KERNEL);
> > +     if (!mhi_pdev)
> >               return -ENOMEM;
> Why move away from the mhi_alloc_controller/mhi_free_controller pair we
> recommended for use?

Because now I don't allocate mhi controller separately, it's part of
the allocated mhi_pci_device that inherit from it. If necessary we
would need something like mhi_init_controller() to initialize the
field, but AFAIU everything needs to be zeroed.

Regards,
Loic
