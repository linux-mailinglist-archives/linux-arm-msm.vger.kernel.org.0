Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 305161C0037
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 17:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgD3P0z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 11:26:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:34502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726534AbgD3P0y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 11:26:54 -0400
Received: from localhost (unknown [122.182.217.38])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8276920731;
        Thu, 30 Apr 2020 15:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588260414;
        bh=Gc4CSNIYpNL1Sg9aqBxD4gp1PKP4X9xSXcXPNS+Bx0A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PJ/uIJou43m0kJET6CvgCvR7YIAAP+pe//6F8guEs95z2CUfJ/NDPTQ/9rM4LSFJ0
         NbzWBBhknCEV4wj/v/FWMa4RtiuIm5BuD/bTaeo3WesaPVcMZJ1kgJgdM+Hu2u8HSM
         uJ55r1b03YwOhgpPzxrGfd/0TJyNo6KUx4+CVnJQ=
Date:   Thu, 30 Apr 2020 20:56:50 +0530
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
Subject: Re: [PATCH v11 2/5] usb: renesas-xhci: Add the renesas xhci driver
Message-ID: <20200430152650.GK948789@vkoul-mobl.Dlink>
References: <20200430101019.1130956-1-vkoul@kernel.org>
 <20200430101019.1130956-3-vkoul@kernel.org>
 <8ffd119b-192f-8fcc-46cc-3a405e30338c@linux.intel.com>
 <20200430144641.GJ948789@vkoul-mobl.Dlink>
 <20200430145302.GB3495619@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430145302.GB3495619@kroah.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30-04-20, 16:53, Greg Kroah-Hartman wrote:
> On Thu, Apr 30, 2020 at 08:16:41PM +0530, Vinod Koul wrote:
> > > > diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
> > > > index b191361257cc..c3a79f626393 100644
> > > > --- a/drivers/usb/host/Makefile
> > > > +++ b/drivers/usb/host/Makefile
> > > > @@ -70,7 +70,8 @@ obj-$(CONFIG_USB_OHCI_HCD_DAVINCI)	+= ohci-da8xx.o
> > > >  obj-$(CONFIG_USB_UHCI_HCD)	+= uhci-hcd.o
> > > >  obj-$(CONFIG_USB_FHCI_HCD)	+= fhci.o
> > > >  obj-$(CONFIG_USB_XHCI_HCD)	+= xhci-hcd.o
> > > > -obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o
> > > > +usb-xhci-pci-objs		:= xhci-pci.o xhci-pci-renesas.o
> > > > +obj-$(CONFIG_USB_XHCI_PCI)	+= usb-xhci-pci.o
> > > 
> > > I don't think it's a good idea to rename the xhci-pci module to usb-xhci-pci
> > > 
> > > does
> > > 
> > > xhci-pci-y			:= xhci-pci.o xhci-pci-renesas.o
> > > obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o
> > > 
> > > cause some kbuild issues?
> > 
> > Yes with this version I get the warning:
> > make[4]: Circular drivers/usb/host/xhci-pci.o <- drivers/usb/host/xhci-pci.o dependency dropped.
> > 
> > I don't speak enough Kbuild, but I guess it does make sense that we have
> > xhci-pci.o as target for both xhci-pci.o xhci-pci-renesas.o! That was
> > the reason for adding usb tag to this to resolve the conflict.
> > 
> > I am okay for any other mechanism which can work well here. Btw what
> > issues do you foresee with adding usb tag to module name.
> 
> It will break all sorts of things.  Happens every time we rename
> modules, let's not do it unless we absolutely have to.

Hmm that is interesting, am not sure why though :)

Anyway, I have fixed it up and was able to make both as modules and
export two symbols for xhci-pci.ko to use :)

Makefile change looks like:

+obj-$(CONFIG_USB_XHCI_PCI)     += xhci-pci.o xhci-pci-renesas.o

Thanks
-- 
~Vinod
