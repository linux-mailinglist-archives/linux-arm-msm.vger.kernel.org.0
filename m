Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 901DF2B8E81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 10:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbgKSJPu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 04:15:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgKSJPt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 04:15:49 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F55C0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 01:15:49 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id gj5so6867827ejb.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 01:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LmQQdKftmB/1qs40aOn5NovKYOb1O9wjbiLe6FVkSGs=;
        b=Ah0szKYX6msDdyYAzwimor5sdJGE5vbtrjf8xj/xlugiGo8t+l3Icc92dFmZLbh1Z+
         wyM768wLrPxz3cNYMcLZYEof+M3wz40P9YON0ZduDII1WcSOW2chrMV2789WiZgSrYV7
         bKPN+MXBl/mTkgbJNcpdQcR/rup8ERtzSeousKs3ENrzm5QI9PzbP+UkFTKGaJoCATH2
         KNqHLtXJHBH1BuuEad7syEzz3cyNAhAk0SgIEQl7D6u5l6RcJtONTyOr8v4hANe90m9H
         oc6uW36tZQIbx9D/AdKAcSjT9dyd4cif33sH7X+TdioSZrbGYvzxnZi8O3jAOI5E7EfA
         CXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LmQQdKftmB/1qs40aOn5NovKYOb1O9wjbiLe6FVkSGs=;
        b=pw1RNh0FADSicH3sRsu2kioG2P54HYNVkHhPi869GJM3jVFSFd9zjkwzoE+epWcQcU
         DKqSPbAMtLpgG7OdiqLK/tqf6m8P5uBQmZj1z7EVzrPBds6iZaLJHNhCNBuhm5sBy0Xb
         Q4ixLei0WSHzdM/qZPNzSWS2J0M9nPNn1ggzlWpA1A9QYqXR/D+5O4U6QKQcc1eQwBO3
         NBWAaYiyxa4z8NeLyhrfcopTIDgMrwjnoLarQ7evjFB6SYAfVDj3ckmfMAbD49StEsl7
         4nLK41BtN1NtkaFidFmUVPGeisVIkp8UEvU9ynMJdI4U+tWnVeYS0W/+kEZpjzejn/NF
         +9QQ==
X-Gm-Message-State: AOAM533cI8VHTYbz7rtWJ/ba7iQj0fnbJYNnNtTy3UI46xTYHlI0G+/j
        yqg2nRfOVcUebi2vJ011jX/XYQ0NaJXRpoCTP/9wr5u74AMFomtu
X-Google-Smtp-Source: ABdhPJz96RbwBEhCXHvPYPeZFuCfqsJupEm6jUPSIC3Sv6EEMAJSD2Nzk5wU06sIAGfVs5LdrirpT7T5p9pNNFZq9dU=
X-Received: by 2002:a17:906:e254:: with SMTP id gq20mr27934457ejb.520.1605777348118;
 Thu, 19 Nov 2020 01:15:48 -0800 (PST)
MIME-Version: 1.0
References: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
 <1605279602-18749-3-git-send-email-loic.poulain@linaro.org> <ad4fa874-163a-227b-3291-727b1ee27f06@codeaurora.org>
In-Reply-To: <ad4fa874-163a-227b-3291-727b1ee27f06@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 19 Nov 2020 10:21:51 +0100
Message-ID: <CAMZdPi8pOVB6rsERsbyLEkRuf4tjNaC-eZa1mFnyiTBws1K9=Q@mail.gmail.com>
Subject: Re: [PATCH 2/8] mhi: pci-generic: Perform hard reset on remove
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Hemant,

On Thu, 19 Nov 2020 at 02:46, Hemant Kumar <hemantk@codeaurora.org> wrote:
>
> Hi Loic,
>
> On 11/13/20 6:59 AM, Loic Poulain wrote:
> > Ensure that the device is hard-reset on remove to restore its initial
> > state and avoid further issues on subsequent probe.
> >
> > This has been tested with Telit FN980m module.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >   drivers/bus/mhi/pci_generic.c | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> > index 13a7e4f..09c6b26 100644
> > --- a/drivers/bus/mhi/pci_generic.c
> > +++ b/drivers/bus/mhi/pci_generic.c
> > @@ -15,6 +15,8 @@
> >
> >   #define MHI_PCI_DEFAULT_BAR_NUM 0
> >
> > +#define DEV_RESET_REG (0xB0)
> > +
> >   /**
> >    * struct mhi_pci_dev_info - MHI PCI device specific information
> >    * @config: MHI controller configuration
> > @@ -166,6 +168,11 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
> >       /* Nothing to do for now */
> >   }
> >
> > +static inline void mhi_pci_reset(struct mhi_controller *mhi_cntrl)
> > +{
> > +     writel(1, mhi_cntrl->regs + DEV_RESET_REG);
> > +}
> > +
> >   static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
> >                        unsigned int bar_num, u64 dma_mask)
> >   {
> > @@ -329,6 +336,10 @@ static void mhi_pci_remove(struct pci_dev *pdev)
> >       mhi_power_down(mhi_cntrl, true);
> >       mhi_unprepare_after_power_down(mhi_cntrl);
> >       mhi_unregister_controller(mhi_cntrl);
> > +
> > +     /* MHI-layer reset could not be enough, always hard-reset the device */
> > +     mhi_pci_reset(mhi_cntrl);
>
> Referring to MHI spec:
> Hosts writes this register to trigger a reset. This can be used when the
> host detects a timeout in the MHI protocol and can use the reset as a
> last resort to recover the device. Host should first attempt an MHI
> Reset procedure before resetting the entire device.
>
> What issue are you facing which requires you to do full device reset ?
> Based on the spec recommendation, looks like this should be a last resort.

On module unload/reload, the device does not go through cold reset and
can be in error state on further reload, causing mhi power up to fail.
This patch simply resets the device in remove so that it is in the
exact same condition as before probing (not only MHI layer, but all
the device context), I think it makes sense and prevents any
unexpected state on further reloading. Note also that unloading the
module (or unbinding the device) is not something that usually
happens, except when the user does it explicitly for any reason.

Regards,
Loic
