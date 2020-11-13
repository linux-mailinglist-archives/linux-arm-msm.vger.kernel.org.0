Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC552B22C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 18:44:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgKMRop (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 12:44:45 -0500
Received: from z5.mailgun.us ([104.130.96.5]:59601 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726070AbgKMRop (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 12:44:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605289483; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=tKmyAhgKMTKheWCkd9Cp5o7C0ALxf2YMrfNdqb5DFaI=;
 b=t6SDqCxXPXit86XM5AKf2zKgfqsY6sfBtxIsu8g3SucUIW+n0iGmPWfJAJct3hH2VhRy2LH2
 mihKOfZnhSVbaPZRziW/3p2gVBWvJ0enBHbGfOkyaE2RlsxZe90WKMEdgvle4KXXwZ+8qQbt
 KGKqWgJZKrEl1atpPGD4pksqqIM=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5faec60b8bd2e3c22200d695 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 13 Nov 2020 17:44:43
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1767FC433C6; Fri, 13 Nov 2020 17:44:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 43B1CC433C8;
        Fri, 13 Nov 2020 17:44:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 13 Nov 2020 09:44:42 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 4/8] mhi: pci_generic: Add support for reset
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <CAMZdPi_13oSO6j2K15uCM9PcP4MB8wDo-2CxvueLrwcEhkSG8Q@mail.gmail.com>
References: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
 <1605279602-18749-5-git-send-email-loic.poulain@linaro.org>
 <d207bf6fde62bafd217ef7427d7f00c8@codeaurora.org>
 <CAMZdPi_13oSO6j2K15uCM9PcP4MB8wDo-2CxvueLrwcEhkSG8Q@mail.gmail.com>
Message-ID: <f2112583228fc9e2a2dfae895f99a115@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-13 09:42, Loic Poulain wrote:
> Hi Bhaumik,
> 
> On Fri, 13 Nov 2020 at 18:12, Bhaumik Bhatt <bbhatt@codeaurora.org> 
> wrote:
>> 
>> On 2020-11-13 06:59, Loic Poulain wrote:
>> > Add support for resetting the device, reset can be triggered in case
>> > of error or manually via sysfs (/sys/bus/pci/devices/*/reset).
>> >
>> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>> > ---
>> >  drivers/bus/mhi/pci_generic.c | 117
>> > +++++++++++++++++++++++++++++++++++++-----
>> >  1 file changed, 104 insertions(+), 13 deletions(-)
>> >
>> > diff --git a/drivers/bus/mhi/pci_generic.c
>> > b/drivers/bus/mhi/pci_generic.c
>> > index 0c07cf5..b48c382 100644
>> > --- a/drivers/bus/mhi/pci_generic.c
>> > +++ b/drivers/bus/mhi/pci_generic.c
>> > @@ -8,6 +8,7 @@
>> >   * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
>> >   */
>> >
>> > +#include <linux/delay.h>
>> >  #include <linux/device.h>
>> >  #include <linux/mhi.h>
>> >  #include <linux/module.h>
>> > @@ -179,6 +180,16 @@ static const struct pci_device_id
>> > mhi_pci_id_table[] = {
>> >  };
>> >  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
>> >
>> > +enum mhi_pci_device_status {
>> > +     MHI_PCI_DEV_STARTED,
>> > +};
>> > +
>> > +struct mhi_pci_device {
>> > +     struct mhi_controller mhi_cntrl;
>> > +     struct pci_saved_state *pci_state;
>> > +     unsigned long status;
>> > +};
>> > +
>> >  static int mhi_pci_read_reg(struct mhi_controller *mhi_cntrl,
>> >                           void __iomem *addr, u32 *out)
>> >  {
>> > @@ -203,6 +214,20 @@ static inline void mhi_pci_reset(struct
>> > mhi_controller *mhi_cntrl)
>> >       writel(1, mhi_cntrl->regs + DEV_RESET_REG);
>> >  }
>> >
>> > +static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
>> > +{
>> > +     struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
>> > +     u16 vendor = 0;
>> > +
>> > +     if (pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor))
>> > +             return false;
>> > +
>> > +     if (vendor == (u16) ~0 || vendor == 0)
>> > +             return false;
>> > +
>> > +     return true;
>> > +}
>> > +
>> >  static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
>> >                        unsigned int bar_num, u64 dma_mask)
>> >  {
>> > @@ -298,16 +323,18 @@ static int mhi_pci_probe(struct pci_dev *pdev,
>> > const struct pci_device_id *id)
>> >  {
>> >       const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *)
>> > id->driver_data;
>> >       const struct mhi_controller_config *mhi_cntrl_config;
>> > +     struct mhi_pci_device *mhi_pdev;
>> >       struct mhi_controller *mhi_cntrl;
>> >       int err;
>> >
>> >       dev_dbg(&pdev->dev, "MHI PCI device found: %s\n", info->name);
>> >
>> > -     mhi_cntrl = mhi_alloc_controller();
>> > -     if (!mhi_cntrl)
>> Not recommended.
>> > +     mhi_pdev = devm_kzalloc(&pdev->dev, sizeof(*mhi_pdev), GFP_KERNEL);
>> > +     if (!mhi_pdev)
>> >               return -ENOMEM;
>> Why move away from the mhi_alloc_controller/mhi_free_controller pair 
>> we
>> recommended for use?
> 
> Because now I don't allocate mhi controller separately, it's part of
> the allocated mhi_pci_device that inherit from it. If necessary we
> would need something like mhi_init_controller() to initialize the
> field, but AFAIU everything needs to be zeroed.
Let's make sure we use the mhi_alloc/free_controller APIs because it 
will
help us have better control in case we need track of some allocations.
> 
> Regards,
> Loic

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
