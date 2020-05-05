Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5A731C547A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 13:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728736AbgEELd7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 07:33:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:49238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728664AbgEELd7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 07:33:59 -0400
Received: from localhost (unknown [122.181.213.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2F82C20735;
        Tue,  5 May 2020 11:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588678439;
        bh=BIDNivoYYArr1mgNzZNlFHarjyA+1JxmkV0Pd9IfbtU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Hei2vThh3fDPJJe5S3ZSQeNuun9d/8uHbm3ksqhgvpfA+IF0olXgQ9b0u8FkhW7xG
         kGappr474a7EgDcoD7MyXyWqmJDpdwzWS5WEHepav4d5I7wYvo7wTkuZn2Fumc3JWi
         BufJSxUhnpt1nj3X4/CbkNR8POXcUA+hiCbChQBA=
Date:   Tue, 5 May 2020 17:03:54 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Christian Lamparter <chunkeey@googlemail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andreas =?iso-8859-1?Q?B=F6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 2/5] usb: renesas-xhci: Add the renesas xhci driver
Message-ID: <20200505113354.GX1375924@vkoul-mobl>
References: <20200430165920.1345409-1-vkoul@kernel.org>
 <20200430165920.1345409-3-vkoul@kernel.org>
 <81e0eff0-8b40-3c47-e39b-929e1dc07fd5@linux.intel.com>
 <20200504143438.GT1375924@vkoul-mobl>
 <20200505110438.GC93160@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200505110438.GC93160@kroah.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-05-20, 13:04, Greg Kroah-Hartman wrote:
> On Mon, May 04, 2020 at 08:04:38PM +0530, Vinod Koul wrote:

> > > > --- a/drivers/usb/host/Makefile
> > > > +++ b/drivers/usb/host/Makefile
> > > > @@ -70,7 +70,7 @@ obj-$(CONFIG_USB_OHCI_HCD_DAVINCI)	+= ohci-da8xx.o
> > > >  obj-$(CONFIG_USB_UHCI_HCD)	+= uhci-hcd.o
> > > >  obj-$(CONFIG_USB_FHCI_HCD)	+= fhci.o
> > > >  obj-$(CONFIG_USB_XHCI_HCD)	+= xhci-hcd.o
> > > > -obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o
> > > > +obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o xhci-pci-renesas.o
> > > 
> > > Hmm, now we end up with two modules, xhci-pci and xhci-pci-renesas, even if
> > > xhci-pci-renesas just includes helper functions to load firmware for renesas.
> > 
> > Right, these are two modules. Do you forsee an issue with two ko's
> 
> Two kos should be fine, but as you aren't giving people the option to
> not select this, it's a bit harsh to add it.
> 
> Can this be a separate module/config option?  Why force everyone to need
> this additional code if they do not have this hardware?

Since the code is moved out and is based on PCI ID of the device, this
wont be invoked at all for folks not having this hardware. But adding a
config option would work too and avoid renaming file.

I think this looks as a better option to me atm. We no longer have load
order issue with current approach so we dont care about that as well.

Mathias, let me know if you are okay with approach, I can respin this,
or if you have better idea do let us know

Thanks
-- 
~Vinod
