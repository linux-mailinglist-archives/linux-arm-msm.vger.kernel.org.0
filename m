Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5103E2E7F9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Dec 2020 12:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbgLaLPY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 06:15:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgLaLPX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 06:15:23 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F9CAC061573
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Dec 2020 03:14:43 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id x12so9909385plr.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Dec 2020 03:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Md1bC9DvWCS0Jox1mIfzpEc+NiHyWTkysUV9ixac2zg=;
        b=yf0agF5e22T1dsNUadBgghAFWZ1gYwhHBYz6BCBVUPbElkmJtVVj2kJgrwMXSapEZU
         Q38IUZ9ROXrd+o2OrNAEAJgR4NC7xnwoyjuu4lUi3mf1Hek3tivqISGnX8FBWEl3JGvM
         VupfjS5xih0aqZ83rydkWDQnKF4sm+xqPohBmeN47/7xMT8kE9OzceFPh3IT+UO0ApBZ
         7ZzXp/MvBOTkCY6vyfD0XrCFhjYGqG0kltHts9USeFrdPT9rFe7h/6vpSBcWj3glRPH3
         VME8s+c9FC5WvSz1N7EDROjPtYC9U5N5MFhBhr8gkP3v46/6eS5imzgvCpcajnBoMvYg
         FQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Md1bC9DvWCS0Jox1mIfzpEc+NiHyWTkysUV9ixac2zg=;
        b=Tj2eq4qdBVgbWawPEEV/Op1RPt1ecZqJcyiKVN6D4Uusc3tiufKEtQ8ZET5J0seW7b
         zTFos8bc3MfsIZNio6SYzwcAFCOsCV42JQ139hg12fusBcNgcbGAEFklm7UC7WtJqY/4
         QV3lVYjaWvioZKdMXd/bAf43Ppmu1SJc0UrMUxWD6K57lwD3RrIUjSIQRBsLkdg7XrFG
         YN2znA9QXP4aWoLEsHWUS6cOXw8O+gsbVQpNf7xHq9lOwTP6CW0lzxDA0Lv25VUzzzm0
         Ql9l+bVCRtCkK8LhV/KQgjrxMtawNGdPywWc02I14lObYbEZFvvmk7P1GpwWve7ExFDH
         P8Lg==
X-Gm-Message-State: AOAM532W2c67+2w+L4VwkA2BVnite48jqzJTYdzrPuLURdJXDIurzYBW
        lglRWBCbGb2TG4P7upF+3Si3ztB0kQAm
X-Google-Smtp-Source: ABdhPJyBIaBxawSo/C82VTdmhWdcFbNxAQ3OgwS4omK+1zDE3jh5Sy97SM1KfJF6ebB+Cedp3UXjmA==
X-Received: by 2002:a17:90a:bf05:: with SMTP id c5mr12644421pjs.95.1609413282176;
        Thu, 31 Dec 2020 03:14:42 -0800 (PST)
Received: from thinkpad ([2409:4072:6d1f:be3b:71a9:d2bf:a32d:897d])
        by smtp.gmail.com with ESMTPSA id gz5sm10474111pjb.15.2020.12.31.03.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 03:14:41 -0800 (PST)
Date:   Thu, 31 Dec 2020 16:44:34 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: Re: [PATCH v6 07/10] mhi: pci_generic: Add PCI error handlers
Message-ID: <20201231111434.GJ7345@thinkpad>
References: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
 <1609231431-10048-8-git-send-email-loic.poulain@linaro.org>
 <20201231071816.GB7345@thinkpad>
 <CAMZdPi8+qFPbkiQz8rnC=2X6Z6fTfY=4e1HsBbXk9DJfi-AU3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi8+qFPbkiQz8rnC=2X6Z6fTfY=4e1HsBbXk9DJfi-AU3g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 31, 2020 at 10:27:01AM +0100, Loic Poulain wrote:
> Hi Mani,
> 
> On Thu, 31 Dec 2020 at 08:18, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Tue, Dec 29, 2020 at 09:43:48AM +0100, Loic Poulain wrote:
> > > In AER capable root complex, errors are reported to the host which
> > > can then act accordingly and perform PCI recovering procedure.
> > >
> > > This patch enables error reporting and implements error_detected,
> > > slot_reset and resume callbacks.
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > > Reviewed-by Hemant Kumar <hemantk@codeaurora.org>
> > > ---
> > >  drivers/bus/mhi/pci_generic.c | 50 +++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 50 insertions(+)
> 
> > > +static pci_ers_result_t mhi_pci_slot_reset(struct pci_dev *pdev)
> > > +{
> > > +     if (pci_enable_device(pdev)) {
> > > +             dev_err(&pdev->dev, "Cannot re-enable PCI device after reset.\n");
> > > +             return PCI_ERS_RESULT_DISCONNECT;
> > > +     }
> > > +
> >
> > This callback will be called after PCI slot reset, so we should also be resetting
> > the device after enabling it.
> 
> Yes, but that is done in mhi_pci_io_resume.
> 
> From the PCI error recovery documentation, "drivers should not restart
> normal I/O processing operations at this point (in slot_reset) If all
> device drivers report success on this callback, the platform will call
> resume() to complete the sequence, and let the driver restart normal
> I/O processing."
> The actual MHI PCI/recovery is then done in resume (mhi_pci_io_resume).
> 

If you read one paragraph above,

"This call gives drivers the chance to re-initialize the hardware
(re-download firmware, etc.).  At this point, the driver may assume
that the card is in a fresh state and is fully functional. The slot
is unfrozen and the driver has full access to PCI config space,
memory mapped I/O space and DMA."

So at the end of this call, the device is assumed to be functional (then only
PCI_ERS_RESULT_RECOVERED makes sense).

IMO, you should call mhi_pci_reset_prepare() in this callback and
mhi_pci_reset_done() in resume(). No need to schedule the recovery work.

Thanks,
Mani

> Regards,
> Loic
