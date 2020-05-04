Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08DA21C3D22
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 16:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728881AbgEDOet (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 10:34:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:51236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728187AbgEDOes (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 10:34:48 -0400
Received: from localhost (unknown [171.76.84.84])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D506220757;
        Mon,  4 May 2020 14:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588602887;
        bh=A61gpXUG4UlZNcao5CGbMn9uCY5KgqwpBqAKkoOg+To=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rKhHTMP32JxNwlJgGzU7jatQB87jrHF+dIUMRHmHCJfCrlk20uFsz24BOpZ1KG76Z
         t+vupbHqjyGE4KOqOorfwez/JSQGl76/4mTP1wQEyYs7Uu3whJoV/yKUGbth5E3jc5
         Ab7fiLo4EZn6eEfjq7ZYfuvuuJ6Ee3E9I953cBso=
Date:   Mon, 4 May 2020 20:04:38 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Christian Lamparter <chunkeey@googlemail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andreas =?iso-8859-1?Q?B=F6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 2/5] usb: renesas-xhci: Add the renesas xhci driver
Message-ID: <20200504143438.GT1375924@vkoul-mobl>
References: <20200430165920.1345409-1-vkoul@kernel.org>
 <20200430165920.1345409-3-vkoul@kernel.org>
 <81e0eff0-8b40-3c47-e39b-929e1dc07fd5@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81e0eff0-8b40-3c47-e39b-929e1dc07fd5@linux.intel.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathias,

On 04-05-20, 16:01, Mathias Nyman wrote:
> On 30.4.2020 19.59, Vinod Koul wrote:
> > From: Christian Lamparter <chunkeey@googlemail.com>
> > 
> > This add a new driver for renesas xhci which is basically a firmware
> > loader for uPD720201 and uPD720202 w/o ROM. The xhci-pci driver will
> > invoke this driver for loading/unloading on relevant devices.
> > 
> > This patch adds a firmware loader for the uPD720201K8-711-BAC-A
> > and uPD720202K8-711-BAA-A variant. Both of these chips are listed
> > in Renesas' R19UH0078EJ0500 Rev.5.00 "User's Manual: Hardware" as
> > devices which need the firmware loader on page 2 in order to
> > work as they "do not support the External ROM".
> > 
> > The "Firmware Download Sequence" is describe in chapter
> > "7.1 FW Download Interface" R19UH0078EJ0500 Rev.5.00 page 131.
> > 
> > The firmware "K2013080.mem" is available from a USB3.0 Host to
> > PCIe Adapter (PP2U-E card) "Firmware download" archive. An
> > alternative version can be sourced from Netgear's WNDR4700 GPL
> > archives.
> > 
> > The release notes of the PP2U-E's "Firmware Download" ver 2.0.1.3
> > (2012-06-15) state that the firmware is for the following devices:
> >  - uPD720201 ES 2.0 sample whose revision ID is 2.
> >  - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
> >  - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.
> > 
> > Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > [vkoul: fixed comments:
> > 	used macros for timeout count and delay
> > 	removed renesas_fw_alive_check
> > 	cleaned renesas_fw_callback
> > 	removed recursion for renesas_fw_download
> > 	add register defines and field names
> > 	move to a separate file
> > 	make fw loader as sync probe so that we execute in probe and
> >         prevent race
> > 	export symbols for xhci-pci to use]
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/usb/host/Makefile           |   2 +-
> >  drivers/usb/host/xhci-pci-renesas.c | 365 ++++++++++++++++++++++++++++
> >  drivers/usb/host/xhci-pci.h         |  16 ++
> >  3 files changed, 382 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/usb/host/xhci-pci-renesas.c
> >  create mode 100644 drivers/usb/host/xhci-pci.h
> > 
> > diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
> > index b191361257cc..f3a5a2f01874 100644
> > --- a/drivers/usb/host/Makefile
> > +++ b/drivers/usb/host/Makefile
> > @@ -70,7 +70,7 @@ obj-$(CONFIG_USB_OHCI_HCD_DAVINCI)	+= ohci-da8xx.o
> >  obj-$(CONFIG_USB_UHCI_HCD)	+= uhci-hcd.o
> >  obj-$(CONFIG_USB_FHCI_HCD)	+= fhci.o
> >  obj-$(CONFIG_USB_XHCI_HCD)	+= xhci-hcd.o
> > -obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o
> > +obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o xhci-pci-renesas.o
> 
> Hmm, now we end up with two modules, xhci-pci and xhci-pci-renesas, even if
> xhci-pci-renesas just includes helper functions to load firmware for renesas.

Right, these are two modules. Do you forsee an issue with two ko's
> 
> My kbuild knowledge is limited, but one way to solve this would be to 
> rename xhci-pci.c to xhci-pci-core.c and add:

Yeah i wanted to avoid the rename (stopped short of suggesting that)..
> 
> xhci-pci-y := xhci-pci-core.o xhci-pci-renesas.o
> 
> unless someone can suggest a better way to solve this

I dont have any better idea atm!

So if you are okay with rename of file, I can do that first and then
these patches

Thanks
-- 
~Vinod
