Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6411443523
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 19:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232211AbhKBSL4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 14:11:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:49500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230392AbhKBSL4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 14:11:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4827C60EBB;
        Tue,  2 Nov 2021 18:09:16 +0000 (UTC)
Date:   Tue, 2 Nov 2021 23:39:12 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Aleksander Morgado <aleksander@aleksander.es>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Thomas Perrot <thomas.perrot@bootlin.com>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
Message-ID: <20211102180912.GD5646@thinkpad>
References: <20211009105132.GA204538@thinkpad>
 <CAAP7uc+kPCyASq1ki_qZdft7W9rJxnx4-4TmhRJjMDQuQAHsFA@mail.gmail.com>
 <20211022044229.GD3138@workstation>
 <CAAP7ucJrj1HSvqeoXGOc3F2_z2tv5ZgTTexmX8xr57La=_H4ow@mail.gmail.com>
 <20211022144026.GA7657@thinkpad>
 <CAAP7ucJGkAKqyvUJJnCgX8AejsHSaY0AeAxKoCJahAeVLw5ThQ@mail.gmail.com>
 <20211102105035.GB5646@thinkpad>
 <CAAP7ucLVtOR7+NJiWK_is0yv+zWKB9vmxpy4PyO5FQdVUE6uzA@mail.gmail.com>
 <20211102162259.GC5646@thinkpad>
 <CAAP7ucLLaYVBgLU7Fp5r21wtnqBhoYK-+9=qr3Rf1O1S81xDBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAP7ucLLaYVBgLU7Fp5r21wtnqBhoYK-+9=qr3Rf1O1S81xDBw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 02, 2021 at 05:55:34PM +0100, Aleksander Morgado wrote:
> > > > > [    7.189547] mhi mhi0: Transitioning from PM state: Linkdown or
> > > > > Error Fatal Detect to: SYS ERROR Process
> > > >
> > > > Hmm, I think the use of sync_power_up might be causing the issue here as it
> > > > forces the MHI state to fatal error.
> > > >
> > > > Ignore the previous diff and try the below one:
> > > >
> > > > diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> > > > index 59a4896a8030..b1e8c7de4e54 100644
> > > > --- a/drivers/bus/mhi/pci_generic.c
> > > > +++ b/drivers/bus/mhi/pci_generic.c
> > > > @@ -637,7 +637,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
> > > >         if (err)
> > > >                 goto err_try_reset;
> > > >
> > > > -       err = mhi_sync_power_up(mhi_cntrl);
> > > > +       err = mhi_async_power_up(mhi_cntrl);
> >
> > Doh! Sorry, I modified the wrong function. Here is the correct one:
> >
> > diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> > index 59a4896a8030..1e3c74bfbe34 100644
> > --- a/drivers/bus/mhi/pci_generic.c
> > +++ b/drivers/bus/mhi/pci_generic.c
> > @@ -743,7 +743,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >                 goto err_unregister;
> >         }
> >
> > -       err = mhi_sync_power_up(mhi_cntrl);
> > +       err = mhi_async_power_up(mhi_cntrl);
> >         if (err) {
> >                 dev_err(&pdev->dev, "failed to power up MHI controller\n");
> >                 goto err_unprepare;
> >
> > Let's see how it goes :)
> >
> 
> Oh, wow, what a difference a single extra byte in the correct place makes! :D
> 
> This looks waaaaay better; I've rebooted the board at least 10 times
> now and all of them worked nicely, at least just the process to probe
> the device and get the control and net ports exposed looks very
> reliable now. I'll test the setup with ModemManager in the next days
> and see how everything goes. Thank you very much!
> 

That's great to hear! Let me know how your testing goes with ModemManager. I'll
then submit a patch to fix the pci-generic driver.

Thanks,
Mani
