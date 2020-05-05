Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCE411C5503
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 14:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728180AbgEEMFP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 08:05:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:57864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727090AbgEEMFO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 08:05:14 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6260C206A4;
        Tue,  5 May 2020 12:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588680313;
        bh=bK5N6cPviP+5CuDHCJsCJS64jDtjE4iLNlvSfRpPdJ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ATTDZkYhTWScPWm7/yMYpCBcnZoLEuEXwCmNTSf3BhAqni2MqDeUVhEn6WlfWsLMR
         J+9KiJt1WUJ301j+8xFZu1E6cZNOZaYsGr8c85O1QqazB6iB4hBvAoXxMWwowYoJP5
         gyhLIgD1E1XDMi+WTCv9MMQZHdZCSCsTdB6b8y1E=
Date:   Tue, 5 May 2020 14:05:09 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Vinod Koul <vkoul@kernel.org>
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
Message-ID: <20200505120509.GA116918@kroah.com>
References: <20200430165920.1345409-1-vkoul@kernel.org>
 <20200430165920.1345409-3-vkoul@kernel.org>
 <81e0eff0-8b40-3c47-e39b-929e1dc07fd5@linux.intel.com>
 <20200504143438.GT1375924@vkoul-mobl>
 <20200505110438.GC93160@kroah.com>
 <20200505113354.GX1375924@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200505113354.GX1375924@vkoul-mobl>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 05, 2020 at 05:03:54PM +0530, Vinod Koul wrote:
> On 05-05-20, 13:04, Greg Kroah-Hartman wrote:
> > On Mon, May 04, 2020 at 08:04:38PM +0530, Vinod Koul wrote:
> 
> > > > > --- a/drivers/usb/host/Makefile
> > > > > +++ b/drivers/usb/host/Makefile
> > > > > @@ -70,7 +70,7 @@ obj-$(CONFIG_USB_OHCI_HCD_DAVINCI)	+= ohci-da8xx.o
> > > > >  obj-$(CONFIG_USB_UHCI_HCD)	+= uhci-hcd.o
> > > > >  obj-$(CONFIG_USB_FHCI_HCD)	+= fhci.o
> > > > >  obj-$(CONFIG_USB_XHCI_HCD)	+= xhci-hcd.o
> > > > > -obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o
> > > > > +obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o xhci-pci-renesas.o
> > > > 
> > > > Hmm, now we end up with two modules, xhci-pci and xhci-pci-renesas, even if
> > > > xhci-pci-renesas just includes helper functions to load firmware for renesas.
> > > 
> > > Right, these are two modules. Do you forsee an issue with two ko's
> > 
> > Two kos should be fine, but as you aren't giving people the option to
> > not select this, it's a bit harsh to add it.
> > 
> > Can this be a separate module/config option?  Why force everyone to need
> > this additional code if they do not have this hardware?
> 
> Since the code is moved out and is based on PCI ID of the device, this
> wont be invoked at all for folks not having this hardware. But adding a
> config option would work too and avoid renaming file.

Yes, it would not be "invoked", but it still would always be loaded into
memory.  Please only load this code if the hardware is present in the
system.

thanks,

greg k-h
