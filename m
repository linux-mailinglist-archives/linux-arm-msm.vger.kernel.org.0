Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6218A15C512
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2020 16:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbgBMPxK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Feb 2020 10:53:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:57752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388170AbgBMPxD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Feb 2020 10:53:03 -0500
Received: from localhost (unknown [104.132.1.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D0B4E20675;
        Thu, 13 Feb 2020 15:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581609182;
        bh=FMfC9moU8ewBagpU75MLiV8NmlJku+z4d5ntWxhtmPk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ko0g4PMvx7Tl5DjaEdW1cD3ygfNr6WmnxSTzqPN9YlticY3jy30MzILCszhPdqGyD
         +Ti3b27JLDSQ/EShZEXuUlHFDG91Q1YmjMPBZmdX3/6JenuapGjNBWDscxTBg9ZDau
         f6+0f/7MM20QZzw0cFx7Y36LlEPBrF0gncOW7eoc=
Date:   Thu, 13 Feb 2020 07:53:02 -0800
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     arnd@arndb.de, smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/16] bus: mhi: core: Add support for registering MHI
 controllers
Message-ID: <20200213155302.GA3635465@kroah.com>
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
 <20200131135009.31477-3-manivannan.sadhasivam@linaro.org>
 <20200206165755.GB3894455@kroah.com>
 <20200211184130.GA11908@Mani-XPS-13-9360>
 <20200211192055.GA1962867@kroah.com>
 <20200213152013.GB15010@mani>
 <20200213153418.GA3623121@kroah.com>
 <20200213154809.GA26953@mani>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213154809.GA26953@mani>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 13, 2020 at 09:18:09PM +0530, Manivannan Sadhasivam wrote:
> Hi Greg,
> 
> On Thu, Feb 13, 2020 at 07:34:18AM -0800, Greg KH wrote:
> > On Thu, Feb 13, 2020 at 08:50:13PM +0530, Manivannan Sadhasivam wrote:
> > > On Tue, Feb 11, 2020 at 11:20:55AM -0800, Greg KH wrote:
> > > > On Wed, Feb 12, 2020 at 12:11:30AM +0530, Manivannan Sadhasivam wrote:
> > > > > Hi Greg,
> > > > > 
> > > > > On Thu, Feb 06, 2020 at 05:57:55PM +0100, Greg KH wrote:
> > > > > > On Fri, Jan 31, 2020 at 07:19:55PM +0530, Manivannan Sadhasivam wrote:
> > > > > > > --- /dev/null
> > > > > > > +++ b/drivers/bus/mhi/core/init.c
> > > > > > > @@ -0,0 +1,407 @@
> > > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > > +/*
> > > > > > > + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> > > > > > > + *
> > > > > > > + */
> > > > > > > +
> > > > > > > +#define dev_fmt(fmt) "MHI: " fmt
> > > > > > 
> > > > > > This should not be needed, right?  The bus/device name should give you
> > > > > > all you need here from what I can tell.  So why is this needed?
> > > > > > 
> > > > > 
> > > > > The log will have only the device name as like PCI-E. But that won't specify
> > > > > where the error is coming from. Having "MHI" prefix helps the users to
> > > > > quickly identify that the error is coming from MHI stack.
> > > > 
> > > > If the driver binds properly to the device, the name of the driver will
> > > > be there in the message, so I suggest using that please.
> > > > 
> > > > No need for this prefix...
> > > > 
> > > 
> > > So the driver name will be in the log but that won't help identifying where
> > > the log is coming from. This is more important for MHI since it reuses the
> > > `struct device` of the transport device like PCI-E. For instance, below is
> > > the log without MHI prefix:
> > > 
> > > [   47.355582] ath11k_pci 0000:01:00.0: Requested to power on
> > > [   47.355724] ath11k_pci 0000:01:00.0: Power on setup success
> > > 
> > > As you can see, this gives the assumption that the log is coming from the
> > > ath11k_pci driver. But the reality is, it is coming from MHI bus.
> > 
> > Then you should NOT be trying to "reuse" a struct device.
> > 
> > > With the prefix added, we will get below:
> > > 
> > > [   47.355582] ath11k_pci 0000:01:00.0: MHI: Requested to power on
> > > [   47.355724] ath11k_pci 0000:01:00.0: MHI: Power on setup success
> > > 
> > > IMO, the prefix will give users a clear idea of logs and that will be very
> > > useful for debugging.
> > > 
> > > Hope this clarifies.
> > 
> > Don't try to reuse struct devices, if you are a bus, have your own
> > devices as that's the correct way to do things.
> > 
> 
> I assumed that the buses relying on a different physical interface for the
> actual communication can reuse the `struct device`. I can see that the MOXTET
> bus driver already doing it. It reuses the `struct device` of SPI.

How can you reuse anything?

> And this assumption has deep rooted in MHI bus design.

Maybe I do not understand what this is at all, but a device can only be
on one "bus" at a time.  How is that being broken here?

thanks,

greg k-h
