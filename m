Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE0CC16129D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2020 14:04:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgBQNE1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Feb 2020 08:04:27 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42593 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgBQNE1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Feb 2020 08:04:27 -0500
Received: by mail-pg1-f195.google.com with SMTP id w21so9115992pgl.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2020 05:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iEIBfVN8ix9KBBgtQRWCGVqUnRRp30TBqeX8vW+9K1w=;
        b=jtKtZbvUwH1Vtw3obAbdrw4H7ANlZCpiQFuTcpU945D0GaPYWbfG1oFfocpzb5BUyn
         qASY1OBb8LV+5IZ0TBIxSSu+DjrGAzqpQR5RTa6OwveVqgeTA2RSl0yb2paBi9sQH4nb
         9dus45Smr2Y6vgh5h0rVDUnG/gmidzloB4o6bikxgYdJRZS7m0ItQHppgocgnxw1nyp2
         mlm598/r1kEknDBoKHzWIXJtJOcSBKPnP+DKBPH0TMTcmH/Tv9BaK+lLJWXHkTonxpv+
         NSfg4m0+eott7gx9MbdHpm8l4k4iOBy8LDKGc21/aQTEwTSWLS0q7IwdV0LYNIkS/QLG
         K8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iEIBfVN8ix9KBBgtQRWCGVqUnRRp30TBqeX8vW+9K1w=;
        b=SsbosQCl8nWnrUf0y9Kqdnn5G/nsisI48txDPxVKlHjGTZ4fLdt6PcRPMQtmaOCgTC
         m04QDpGDXwu3WfzE+TNo1CNYuTmTomAMEtkVg+hMq85fJrVUQ9jep8nOMgGSUh2POZ/o
         cwkQXJDsws0W7kueBye39dWmv69wM+XhCBKxIs1LD13p+UIfkuS3t5oCkcX0Vd2mspvf
         A6fbdAmBRFraz/Kitrj7kc3kIIXEUE0Oqfb7VgQkkgUr0k6mowAEeQ50V+O+UE1BMYlG
         FkgM227hLi9ia0W7GIDZzzLKUGZzgfmt5nwj9jL1cVLUPLgsymi0k4mOFbckLAxrR0c/
         bbCg==
X-Gm-Message-State: APjAAAWGwK2r4FDe1H2bfOe3OvFqIYsRyBZkUIriniyFnF4iTzkcn7kt
        FO5GDv8jZujrInT9bDXhuLzu
X-Google-Smtp-Source: APXvYqzJ8ntqVrujukpP/ziTva1saysE6WW2r9/8mGzaJazarWwL3ADKrsyu2VHAWmPG9yh1Es/PEQ==
X-Received: by 2002:a62:8245:: with SMTP id w66mr16364886pfd.93.1581944666331;
        Mon, 17 Feb 2020 05:04:26 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:48d:3349:6027:e3e7:afa3:2ab9])
        by smtp.gmail.com with ESMTPSA id a18sm441085pfl.138.2020.02.17.05.04.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 05:04:25 -0800 (PST)
Date:   Mon, 17 Feb 2020 18:34:19 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     arnd@arndb.de, smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/16] bus: mhi: core: Add support for registering MHI
 controllers
Message-ID: <20200217130419.GA13993@Mani-XPS-13-9360>
References: <20200131135009.31477-3-manivannan.sadhasivam@linaro.org>
 <20200206165755.GB3894455@kroah.com>
 <20200211184130.GA11908@Mani-XPS-13-9360>
 <20200211192055.GA1962867@kroah.com>
 <20200213152013.GB15010@mani>
 <20200213153418.GA3623121@kroah.com>
 <20200213154809.GA26953@mani>
 <20200213155302.GA3635465@kroah.com>
 <20200217052743.GA4809@Mani-XPS-13-9360>
 <20200217115930.GA218071@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200217115930.GA218071@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 17, 2020 at 12:59:30PM +0100, Greg KH wrote:
> On Mon, Feb 17, 2020 at 10:57:43AM +0530, Manivannan Sadhasivam wrote:
> > Hi Greg,
> > 
> > On Thu, Feb 13, 2020 at 07:53:02AM -0800, Greg KH wrote:
> > > On Thu, Feb 13, 2020 at 09:18:09PM +0530, Manivannan Sadhasivam wrote:
> > > > Hi Greg,
> > > > 
> > > > On Thu, Feb 13, 2020 at 07:34:18AM -0800, Greg KH wrote:
> > > > > On Thu, Feb 13, 2020 at 08:50:13PM +0530, Manivannan Sadhasivam wrote:
> > > > > > On Tue, Feb 11, 2020 at 11:20:55AM -0800, Greg KH wrote:
> > > > > > > On Wed, Feb 12, 2020 at 12:11:30AM +0530, Manivannan Sadhasivam wrote:
> > > > > > > > Hi Greg,
> > > > > > > > 
> > > > > > > > On Thu, Feb 06, 2020 at 05:57:55PM +0100, Greg KH wrote:
> > > > > > > > > On Fri, Jan 31, 2020 at 07:19:55PM +0530, Manivannan Sadhasivam wrote:
> > > > > > > > > > --- /dev/null
> > > > > > > > > > +++ b/drivers/bus/mhi/core/init.c
> > > > > > > > > > @@ -0,0 +1,407 @@
> > > > > > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > > > > > +/*
> > > > > > > > > > + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> > > > > > > > > > + *
> > > > > > > > > > + */
> > > > > > > > > > +
> > > > > > > > > > +#define dev_fmt(fmt) "MHI: " fmt
> > > > > > > > > 
> > > > > > > > > This should not be needed, right?  The bus/device name should give you
> > > > > > > > > all you need here from what I can tell.  So why is this needed?
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > The log will have only the device name as like PCI-E. But that won't specify
> > > > > > > > where the error is coming from. Having "MHI" prefix helps the users to
> > > > > > > > quickly identify that the error is coming from MHI stack.
> > > > > > > 
> > > > > > > If the driver binds properly to the device, the name of the driver will
> > > > > > > be there in the message, so I suggest using that please.
> > > > > > > 
> > > > > > > No need for this prefix...
> > > > > > > 
> > > > > > 
> > > > > > So the driver name will be in the log but that won't help identifying where
> > > > > > the log is coming from. This is more important for MHI since it reuses the
> > > > > > `struct device` of the transport device like PCI-E. For instance, below is
> > > > > > the log without MHI prefix:
> > > > > > 
> > > > > > [   47.355582] ath11k_pci 0000:01:00.0: Requested to power on
> > > > > > [   47.355724] ath11k_pci 0000:01:00.0: Power on setup success
> > > > > > 
> > > > > > As you can see, this gives the assumption that the log is coming from the
> > > > > > ath11k_pci driver. But the reality is, it is coming from MHI bus.
> > > > > 
> > > > > Then you should NOT be trying to "reuse" a struct device.
> > > > > 
> > > > > > With the prefix added, we will get below:
> > > > > > 
> > > > > > [   47.355582] ath11k_pci 0000:01:00.0: MHI: Requested to power on
> > > > > > [   47.355724] ath11k_pci 0000:01:00.0: MHI: Power on setup success
> > > > > > 
> > > > > > IMO, the prefix will give users a clear idea of logs and that will be very
> > > > > > useful for debugging.
> > > > > > 
> > > > > > Hope this clarifies.
> > > > > 
> > > > > Don't try to reuse struct devices, if you are a bus, have your own
> > > > > devices as that's the correct way to do things.
> > > > > 
> > > > 
> > > > I assumed that the buses relying on a different physical interface for the
> > > > actual communication can reuse the `struct device`. I can see that the MOXTET
> > > > bus driver already doing it. It reuses the `struct device` of SPI.
> > > 
> > > How can you reuse anything?
> > > 
> > > > And this assumption has deep rooted in MHI bus design.
> > > 
> > > Maybe I do not understand what this is at all, but a device can only be
> > > on one "bus" at a time.  How is that being broken here?
> > > 
> > 
> > Let me share some insight on how it is being used:
> > 
> > The MHI bus sits on top of the actual physical bus like PCI-E and requires
> > the physical bus for doing activities like allocating I/O virtual address,
> > runtime PM etc... The part which gets tied to the PCI-E from MHI is called MHI
> > controller driver. This MHI controller driver is also the actual PCI-E driver
> > managing the device.
> > 
> > For instance, we have QCA6390 PCI-E WLAN device. For this device, there is a
> > ath11k PCI-E driver and the same driver also registers as a MHI controller and
> > acts as a MHI controller driver. This is where I referred to reusing the PCI-E
> > struct device. It's not that MHI bus itself is reusing the PCI-E struct device
> > but we need the PCI-E device pointer to do above mentioned IOVA, PM operations
> > in some places. One of the usage is below:
> > 
> > ```
> > void *buf = dma_alloc_coherent(mhi_cntrl->dev, size, dma_handle, gfp);
> > ```
> 
> Wait, why do you need to call this with the parent dev?  Why not with
> your struct device?  What does the parent pointer have that yours does
> not?  Is it not correctly having whatever dma attributes the parent has
> set properly for your device as well?  If not, why not just fix that and
> then _your_ device can be doing the allocation?
> 

This is _one_ of the usecases of the parent dev. We are also using it to manage
the runtime PM operations of the physical device (pcie) when the MHI stack goes
into respective states. For instance,

```
        if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
                mhi_cntrl->runtime_get(mhi_cntrl);
                mhi_cntrl->runtime_put(mhi_cntrl);
        }
```

These runtime_put() and runtime_get() are the callbacks to be provided by the
controller drivers for managing its runtime PM states.

Also, the MHI devices for the channels will be created later on after the
controller probe, so at that time we need this parent dev to set the MHI device
parent:

```
struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
{
...
dev->parent = mhi_cntrl->dev;
...
```

Hence, having the parent dev pointer really helps.

Thanks,
Mani
> thanks,
> 
> greg k-h
