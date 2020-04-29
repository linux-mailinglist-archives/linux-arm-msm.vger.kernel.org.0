Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D93F41BE0E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 16:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgD2O2z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 10:28:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:54020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726423AbgD2O2z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 10:28:55 -0400
Received: from localhost (unknown [106.201.124.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5EFF321D93;
        Wed, 29 Apr 2020 14:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588170534;
        bh=YzU6Ng+159DDfZWYTV68QlK6v9DUyq5R+ZQDcZUiUx8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=izUMkjWzLlNiVXHcZbJejiKpzerolTqTNI8BJ67TfQhqalNs7xHuufbr6ihu5hpaF
         g2PTjTFggGuBz0s6m8Sa+e5SkeJK6V+cUSH1xzsqUArXSaUxceBIWi07uabQtOJgoY
         SXKlK4GA8piz+MAvfnz1bTS2ompffGDsqWA/AVf8=
Date:   Wed, 29 Apr 2020 19:58:50 +0530
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
Subject: Re: [PATCH v10 3/5] usb: xhci: Add support for Renesas controller
 with memory
Message-ID: <20200429142850.GM56386@vkoul-mobl.Dlink>
References: <20200424101410.2364219-1-vkoul@kernel.org>
 <20200424101410.2364219-4-vkoul@kernel.org>
 <79023293-8ad8-751c-b4ca-8393cdbbf4a2@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79023293-8ad8-751c-b4ca-8393cdbbf4a2@linux.intel.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29-04-20, 16:53, Mathias Nyman wrote:
> On 24.4.2020 13.14, Vinod Koul wrote:
> > Some rensas controller like uPD720201 and uPD720202 need firmware to be
> > loaded. Add these devices in table and invoke renesas firmware loader
> > functions to check and load the firmware into device memory when
> > required.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/usb/host/xhci-pci.c | 28 ++++++++++++++++++++++++++++
> >  drivers/usb/host/xhci.h     |  1 +
> >  2 files changed, 29 insertions(+)
> > 
> > diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> > index b6c2f5c530e3..f26cf072836d 100644
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
> > @@ -319,6 +320,8 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
> >  	return xhci_pci_reinit(xhci, pdev);
> >  }
> >  
> > +static bool renesas_device;
> 
> hmm, we shouldn't need this
> 
> > +
> >  /*
> >   * We need to register our own PCI probe function (instead of the USB core's
> >   * function) in order to create a second roothub under xHCI.
> > @@ -328,6 +331,16 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
> >  	int retval;
> >  	struct xhci_hcd *xhci;
> >  	struct usb_hcd *hcd;
> > +	struct xhci_driver_data *driver_data;
> > +
> > +	renesas_device = false;
> > +	driver_data = (struct xhci_driver_data *)id->driver_data;
> > +	if (driver_data && driver_data->quirks & XHCI_RENESAS_FW_QUIRK) {
> > +		retval = renesas_xhci_check_request_fw(dev, id);
> > +		if (retval)
> > +			return retval;
> > +		renesas_device = true;
> > +	}
> >  
> >  	/* Prevent runtime suspending between USB-2 and USB-3 initialization */
> >  	pm_runtime_get_noresume(&dev->dev);
> > @@ -388,6 +401,9 @@ static void xhci_pci_remove(struct pci_dev *dev)
> >  {
> >  	struct xhci_hcd *xhci;
> >  
> > +	if (renesas_device)
> > +		renesas_xhci_pci_exit(dev);
> > +
> 
> Ah, I see, what we really should do is make sure the quirks in the driver data get
> added to xhci->quirks, and then just check for the correct quirk in xhci_pci_remove.

Ah sure that does sound better, I will update this as well and send an
update with these changes

> 
> if (xhci->quirks & XHCI_RENESAS_FW_QUIRK)
> 	renesas_xhci_pci_exit(dev);
>  
> 
> Heikki Krogerus did some work on this a long time ago, below code is based on his
> work. It needs to be added:
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index f26cf072836d..5ae4fc10fc31 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -88,8 +88,16 @@ static int xhci_pci_reinit(struct xhci_hcd *xhci, struct pci_dev *pdev)
>  
>  static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>  {
> -	struct pci_dev		*pdev = to_pci_dev(dev);
> +	struct pci_dev			*pdev = to_pci_dev(dev);
> +	struct xhci_driver_data		*driver_data;
> +	const struct pci_device_id	*id;
>  
> +	id = pci_match_id(pdev->driver->id_table, pdev);
> +
> +	if (id && id->driver_data) {
> +		driver_data = (struct xhci_driver_data *)id->driver_data;
> +		xhci->quirks |= driver_data->quirks;
> +	}
>  	/* Look for vendor-specific quirks */
>  	if (pdev->vendor == PCI_VENDOR_ID_FRESCO_LOGIC &&
>  			(pdev->device == PCI_DEVICE_ID_FRESCO_LOGIC_PDK ||
> 
> 
> -Mathias

-- 
~Vinod
