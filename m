Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB99193E4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 12:51:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbgCZLvX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 07:51:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:57368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727994AbgCZLvX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 07:51:23 -0400
Received: from localhost (unknown [106.201.104.212])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AC56820409;
        Thu, 26 Mar 2020 11:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585223481;
        bh=aq4QLDizm5z7XgE90omYxZwQkaswl8l1jr6TALu8Phc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UGPLyM704qblOPPjpT5K1M9Ecn5EpP5jWs9XYImiwvu6cBkvOQ2a0dbCnY2tSgKOJ
         +pZty14fMTVBnluwP4QxTP+Gdi5NZDwfQur5zWwLlOMc89X77XaBYHPsetP2zZL6CF
         ZIX+fVfVPbfxuFWo4yRBKpNUBTqmGXO16tqtyoug=
Date:   Thu, 26 Mar 2020 17:21:17 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andreas =?iso-8859-1?Q?B=F6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/5] usb: xhci: Add support for Renesas controller
 with memory
Message-ID: <20200326115117.GZ72691@vkoul-mobl>
References: <20200323170601.419809-1-vkoul@kernel.org>
 <20200323170601.419809-4-vkoul@kernel.org>
 <6ea778a7-6d58-6dae-bd65-3a63a945fb97@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ea778a7-6d58-6dae-bd65-3a63a945fb97@linux.intel.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26-03-20, 13:29, Mathias Nyman wrote:
> Hi Vinod
> 
> On 23.3.2020 19.05, Vinod Koul wrote:
> > Some rensas controller like uPD720201 and uPD720202 need firmware to be
> > loaded. Add these devices in table and invoke renesas firmware loader
> > functions to check and load the firmware into device memory when
> > required.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/usb/host/xhci-pci-renesas.c |  1 +
> >  drivers/usb/host/xhci-pci.c         | 29 ++++++++++++++++++++++++++++-
> >  drivers/usb/host/xhci-pci.h         |  3 +++
> >  3 files changed, 32 insertions(+), 1 deletion(-)
> > 
> 
> It's unfortunate if firmware loading couldn't be initiated in a PCI fixup hook
> for this Renesas controller. What was the reason it failed?
> 
> Nicolas Saenz Julienne just submitted a solution like that for Raspberry Pi 4
> where firmware loading is initiated in pci-quirks.c quirk_usb_early_handoff()
> 
> https://lore.kernel.org/lkml/20200324182812.20420-1-nsaenzjulienne@suse.de
> 
> Is he doing something different than what was done for the Renesas controller?

I tried and everytime ended up not getting firmware. Though I did not
investigate a lot. Christian seemed to have tested sometime back as
well.

Another problem is that we dont get driver_data in the quirk and there
didnt seem a way to find the firmware name.

> > diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
> > index c588277ac9b8..d413d53df94b 100644
> > --- a/drivers/usb/host/xhci-pci-renesas.c
> > +++ b/drivers/usb/host/xhci-pci-renesas.c
> > @@ -336,6 +336,7 @@ static void renesas_fw_callback(const struct firmware *fw,
> >  		goto cleanup;
> >  	}
> >  
> > +	xhci_pci_probe(pdev, ctx->id);
> >  	return;
> 
> I haven't looked into this but instead of calling xhci_pci_probe() here in the async fw
> loading callback could we just return -EPROBE_DEFER until firmware is loaded when
> xhci_pci_probe() is originally called?

Hmm, initially my thinking was how to tell device core to probe again,
and then digging up I saw wait_for_device_probe() which can be used, let
me try that

> >  cleanup:
> > diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> > index a19752178216..7e63658542ac 100644
> > --- a/drivers/usb/host/xhci-pci.c
> > +++ b/drivers/usb/host/xhci-pci.c
> > @@ -15,6 +15,7 @@
> >  
> >  #include "xhci.h"
> >  #include "xhci-trace.h"
> > +#include "xhci-pci.h"
> >  
> >  #define SSIC_PORT_NUM		2
> >  #define SSIC_PORT_CFG2		0x880c
> > @@ -312,11 +313,25 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
> >   * We need to register our own PCI probe function (instead of the USB core's
> >   * function) in order to create a second roothub under xHCI.
> >   */
> > -static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
> > +int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
> >  {
> >  	int retval;
> >  	struct xhci_hcd *xhci;
> >  	struct usb_hcd *hcd;
> > +	char *renesas_fw;
> > +
> > +	renesas_fw = (char *)id->driver_data;
> 
> driver_data is useful for other things than just renesas firmware loading.
> Heikki suggested a long time ago to use it for passing the quirk flags as well, which
> makes sense.
> 
> We probably need a structure, something like
> 
> struct xhci_driver_data = {
> 	u64 quirks;
> 	const char *firmware;
> };
> 
> > +	if (renesas_fw) {
> > +		retval = renesas_xhci_pci_probe(dev, id);
> > +		switch (retval) {
> > +		case 0: /* fw check success, continue */
> > +			break;
> > +		case 1: /* fw will be loaded by async load */
> > +			return 0;
> > +		default: /* error */
> > +			return retval;
> > +		}
> > +	}
> >  
> 
> If returning -EPROBE_DEFER until firmware is loaded is an option then we would prevent probe
> from returning success while the renesas controller is still loading firmware.
> 
> So we would end up with something like this:
> (we can add a quirk flag for renesas firmware loading)
> 
> int xhci_pci_probe(..)
> {
> 	...
> 	struct xhci_driver_data *data = id->driver_data;
> 	if (data && data->quirks & XHCI_RENESAS_FW_QUIRK) { 
> 		if (!xhci_renesas_fw_ready(...))
> 			return -EPROBE_DEFER
> 	}
> }
> 
> xhci_renesas_fw_ready() would need to initiate firmware loading unless
> firmware is already running or loading.
> 
> Would that work for you?

I think yes that should work, let me try that..

-- 
~Vinod
