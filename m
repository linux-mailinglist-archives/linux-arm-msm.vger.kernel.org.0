Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54DB0161450
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2020 15:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbgBQOPI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Feb 2020 09:15:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:47296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726760AbgBQOPI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Feb 2020 09:15:08 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C13582072C;
        Mon, 17 Feb 2020 14:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581948906;
        bh=Shzw2PTES55J4aj4NRVAVAR0mDFpO/yXwhg/BA3New8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=agxYjoaTMIx4QSUJkwvv8MhTusnIBnnCedYHzmDEUNi5CKlrXnBoRuDID8xa6TAqP
         Q8IDa3RkIorYx34BUiDpPSazOoAtzeRKci9O/P6niZAcDzS9ZS8xcCalVxF/pYZAxh
         y2kVs1Ht6KrytMcnUWmxzv55Vt2Vg7AkSsJnwv7s=
Date:   Mon, 17 Feb 2020 15:15:03 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     arnd@arndb.de, smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/16] bus: mhi: core: Add support for registering MHI
 controllers
Message-ID: <20200217141503.GA1110972@kroah.com>
References: <20200206165755.GB3894455@kroah.com>
 <20200211184130.GA11908@Mani-XPS-13-9360>
 <20200211192055.GA1962867@kroah.com>
 <20200213152013.GB15010@mani>
 <20200213153418.GA3623121@kroah.com>
 <20200213154809.GA26953@mani>
 <20200213155302.GA3635465@kroah.com>
 <20200217052743.GA4809@Mani-XPS-13-9360>
 <20200217115930.GA218071@kroah.com>
 <20200217130419.GA13993@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200217130419.GA13993@Mani-XPS-13-9360>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 17, 2020 at 06:34:19PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Feb 17, 2020 at 12:59:30PM +0100, Greg KH wrote:
> > On Mon, Feb 17, 2020 at 10:57:43AM +0530, Manivannan Sadhasivam wrote:
> > > Hi Greg,
> > > 
> > > On Thu, Feb 13, 2020 at 07:53:02AM -0800, Greg KH wrote:
> > > > On Thu, Feb 13, 2020 at 09:18:09PM +0530, Manivannan Sadhasivam wrote:
> > > > > Hi Greg,
> > > > > 
> > > > > On Thu, Feb 13, 2020 at 07:34:18AM -0800, Greg KH wrote:
> > > > > > On Thu, Feb 13, 2020 at 08:50:13PM +0530, Manivannan Sadhasivam wrote:
> > > > > > > On Tue, Feb 11, 2020 at 11:20:55AM -0800, Greg KH wrote:
> > > > > > > > On Wed, Feb 12, 2020 at 12:11:30AM +0530, Manivannan Sadhasivam wrote:
> > > > > > > > > Hi Greg,
> > > > > > > > > 
> > > > > > > > > On Thu, Feb 06, 2020 at 05:57:55PM +0100, Greg KH wrote:
> > > > > > > > > > On Fri, Jan 31, 2020 at 07:19:55PM +0530, Manivannan Sadhasivam wrote:
> > > > > > > > > > > --- /dev/null
> > > > > > > > > > > +++ b/drivers/bus/mhi/core/init.c
> > > > > > > > > > > @@ -0,0 +1,407 @@
> > > > > > > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > > > > > > +/*
> > > > > > > > > > > + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> > > > > > > > > > > + *
> > > > > > > > > > > + */
> > > > > > > > > > > +
> > > > > > > > > > > +#define dev_fmt(fmt) "MHI: " fmt
> > > > > > > > > > 
> > > > > > > > > > This should not be needed, right?  The bus/device name should give you
> > > > > > > > > > all you need here from what I can tell.  So why is this needed?
> > > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > The log will have only the device name as like PCI-E. But that won't specify
> > > > > > > > > where the error is coming from. Having "MHI" prefix helps the users to
> > > > > > > > > quickly identify that the error is coming from MHI stack.
> > > > > > > > 
> > > > > > > > If the driver binds properly to the device, the name of the driver will
> > > > > > > > be there in the message, so I suggest using that please.
> > > > > > > > 
> > > > > > > > No need for this prefix...
> > > > > > > > 
> > > > > > > 
> > > > > > > So the driver name will be in the log but that won't help identifying where
> > > > > > > the log is coming from. This is more important for MHI since it reuses the
> > > > > > > `struct device` of the transport device like PCI-E. For instance, below is
> > > > > > > the log without MHI prefix:
> > > > > > > 
> > > > > > > [   47.355582] ath11k_pci 0000:01:00.0: Requested to power on
> > > > > > > [   47.355724] ath11k_pci 0000:01:00.0: Power on setup success
> > > > > > > 
> > > > > > > As you can see, this gives the assumption that the log is coming from the
> > > > > > > ath11k_pci driver. But the reality is, it is coming from MHI bus.
> > > > > > 
> > > > > > Then you should NOT be trying to "reuse" a struct device.
> > > > > > 
> > > > > > > With the prefix added, we will get below:
> > > > > > > 
> > > > > > > [   47.355582] ath11k_pci 0000:01:00.0: MHI: Requested to power on
> > > > > > > [   47.355724] ath11k_pci 0000:01:00.0: MHI: Power on setup success
> > > > > > > 
> > > > > > > IMO, the prefix will give users a clear idea of logs and that will be very
> > > > > > > useful for debugging.
> > > > > > > 
> > > > > > > Hope this clarifies.
> > > > > > 
> > > > > > Don't try to reuse struct devices, if you are a bus, have your own
> > > > > > devices as that's the correct way to do things.
> > > > > > 
> > > > > 
> > > > > I assumed that the buses relying on a different physical interface for the
> > > > > actual communication can reuse the `struct device`. I can see that the MOXTET
> > > > > bus driver already doing it. It reuses the `struct device` of SPI.
> > > > 
> > > > How can you reuse anything?
> > > > 
> > > > > And this assumption has deep rooted in MHI bus design.
> > > > 
> > > > Maybe I do not understand what this is at all, but a device can only be
> > > > on one "bus" at a time.  How is that being broken here?
> > > > 
> > > 
> > > Let me share some insight on how it is being used:
> > > 
> > > The MHI bus sits on top of the actual physical bus like PCI-E and requires
> > > the physical bus for doing activities like allocating I/O virtual address,
> > > runtime PM etc... The part which gets tied to the PCI-E from MHI is called MHI
> > > controller driver. This MHI controller driver is also the actual PCI-E driver
> > > managing the device.
> > > 
> > > For instance, we have QCA6390 PCI-E WLAN device. For this device, there is a
> > > ath11k PCI-E driver and the same driver also registers as a MHI controller and
> > > acts as a MHI controller driver. This is where I referred to reusing the PCI-E
> > > struct device. It's not that MHI bus itself is reusing the PCI-E struct device
> > > but we need the PCI-E device pointer to do above mentioned IOVA, PM operations
> > > in some places. One of the usage is below:
> > > 
> > > ```
> > > void *buf = dma_alloc_coherent(mhi_cntrl->dev, size, dma_handle, gfp);
> > > ```
> > 
> > Wait, why do you need to call this with the parent dev?  Why not with
> > your struct device?  What does the parent pointer have that yours does
> > not?  Is it not correctly having whatever dma attributes the parent has
> > set properly for your device as well?  If not, why not just fix that and
> > then _your_ device can be doing the allocation?
> > 
> 
> This is _one_ of the usecases of the parent dev. We are also using it to manage
> the runtime PM operations of the physical device (pcie) when the MHI stack goes
> into respective states. For instance,
> 
> ```
>         if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
>                 mhi_cntrl->runtime_get(mhi_cntrl);
>                 mhi_cntrl->runtime_put(mhi_cntrl);
>         }
> ```
> 
> These runtime_put() and runtime_get() are the callbacks to be provided by the
> controller drivers for managing its runtime PM states.
> 
> Also, the MHI devices for the channels will be created later on after the
> controller probe, so at that time we need this parent dev to set the MHI device
> parent:
> 
> ```
> struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
> {
> ...
> dev->parent = mhi_cntrl->dev;
> ...
> ```
> 
> Hence, having the parent dev pointer really helps.

Yes, saving the parent device is fine, but you should be doing your own
dma calls using _your_ device, not the parents.  Only mess with the
parent pointer if you need to do something "normal" for a parent.

thanks,

greg k-h
