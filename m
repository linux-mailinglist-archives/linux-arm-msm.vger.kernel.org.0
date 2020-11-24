Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 690DA2C1F28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 08:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729630AbgKXHx4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 02:53:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730064AbgKXHx4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 02:53:56 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 663F5C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 23:53:54 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id k1so6902264eds.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 23:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NW8jtftqPfHaavl6bt2neMCyUcavCYm/Pc+o0AAZuCE=;
        b=HSkyjnUVf4e4ofnxe1fp17aIVuGd+dwHP6NAcNE79P+Wsu0PVHF1qjCvK2r9MuRupr
         HY4tQTXSwIIf0B0t3HXMm3XHjW0dnx0GysHXPYmZkqnDU3/XxPG75ZGHu4xiEG0yMhbu
         sCz5o6TN/gCT6G5b6FmcSB83F9mG8bdUmVOx7FXrsN6RCWMsOF/yMdrVSoDXq1fHvJa4
         RDFXfUHY5ovpwC6quycxJTdiH4SWTxrMfl584N8Oenckz3rk0QV8QhBdtljgK9oZdtP1
         JESM+QbwA7muqPke7/UNw3/0j6ovWshVeEi0axSVMWl5Rj9IjtaWXk/wOhbhOMSpukfD
         bPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NW8jtftqPfHaavl6bt2neMCyUcavCYm/Pc+o0AAZuCE=;
        b=H3a4GI/G4ooBjKGOYIRYsMGQtkkH5mriHCkhalD7LvKqeBwFhL0cGiELdtj50jOlnJ
         FLp+3OtaoisHwXkfs+VqyeTGR74VCJITGnRpzP90KI4rJnL5ZRq7oviHkielE0hFxhUl
         rMUiaywDhiXvB8x2C3CnF71NVCNTZgtBSLkzTlKWCpaejhOGBQ16i/rEWuQQKEy1ifGf
         6GMmKeM9OVxocbOYlfo7hZeYCCOrR6IwSOKwNQ2npQp254F5prSj2SkNymAezxwWJQP6
         akZtYZ0oL6P/5Mf+r4GRrlTiayl1CBQZCgVGrnCeWGBacBIIyoSVZEpIc1je18cIuE2E
         q4iQ==
X-Gm-Message-State: AOAM5302L9eELcNj6a4OxJSVNGfhJZtEcV9P2r5hDj/Msw2/bRANBAmv
        9amSqlME1lepD5R5E96zV03uQ5St4HQSWknwrGVmNGnP3ko8FxRh
X-Google-Smtp-Source: ABdhPJwk5Z7WkceMedCRB39MpDTjkG+Hd3XXRozJ9H2WicodvL5iG55f+MVpJIuHulZ+Z1AwBIAIPATvJU4KCgAh6MQ=
X-Received: by 2002:aa7:d601:: with SMTP id c1mr2690528edr.323.1606204432952;
 Mon, 23 Nov 2020 23:53:52 -0800 (PST)
MIME-Version: 1.0
References: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
 <1606140666-4986-5-git-send-email-loic.poulain@linaro.org> <cb248c4e1281ae368909f225b46e0710@codeaurora.org>
In-Reply-To: <cb248c4e1281ae368909f225b46e0710@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 24 Nov 2020 09:00:08 +0100
Message-ID: <CAMZdPi9tF3ih-_2QcazjFnEp2ngWfJqAvVtTK6fZCSrf9nSQ_w@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] mhi: pci_generic: Add support for reset
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 24 Nov 2020 at 02:02, Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:
>
> Hi Loic,
> On 2020-11-23 06:11 AM, Loic Poulain wrote:
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
> > +     mhi_pdev = devm_kzalloc(&pdev->dev, sizeof(*mhi_pdev), GFP_KERNEL);
> > +     if (!mhi_pdev)
> >               return -ENOMEM;
> Were you able to look in to using alloc/free APIs? We do want to mandate
> these for any controller as they would read garbage serial/OEM PK HASH
> values
> if they were to not abide by it and end up using kmalloc instead of
> kzalloc.
>
> We understand you're using kzalloc but it still deviates from furthering
> our
> recommendations of using exported APIs.

OK, understood, I need to create a mhi_initialize_controller() then,
to initialize structure for non dynamically allocated controller and
non-standalone controller structures. will do in v3.

Regards,
Loic
