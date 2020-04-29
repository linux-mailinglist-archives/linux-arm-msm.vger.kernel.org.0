Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5604F1BDF8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 15:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgD2NvG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 09:51:06 -0400
Received: from mga14.intel.com ([192.55.52.115]:1064 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726765AbgD2NvG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 09:51:06 -0400
IronPort-SDR: Ng+yXLcrpUtjYv09z69wLrDf3QqJvHaJG0Dh3pNqYgp9V3aE7tqik8yxBQ63qXh0YR6/9O32iN
 Z6e1WTLXXCGw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 06:51:05 -0700
IronPort-SDR: 27Nfe+pEKXhm3/a2G6zAkIengMeyvSIh5Pc4tcDGdxwM/1Fs0roRy8cHEFwbwbdbWAUcrYK+Uu
 1dVd6lVGl8+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; 
   d="scan'208";a="257966047"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga003.jf.intel.com with ESMTP; 29 Apr 2020 06:51:02 -0700
Subject: Re: [PATCH v10 3/5] usb: xhci: Add support for Renesas controller
 with memory
To:     Vinod Koul <vkoul@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        =?UTF-8?Q?Andreas_B=c3=b6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200424101410.2364219-1-vkoul@kernel.org>
 <20200424101410.2364219-4-vkoul@kernel.org>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <79023293-8ad8-751c-b4ca-8393cdbbf4a2@linux.intel.com>
Date:   Wed, 29 Apr 2020 16:53:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200424101410.2364219-4-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24.4.2020 13.14, Vinod Koul wrote:
> Some rensas controller like uPD720201 and uPD720202 need firmware to be
> loaded. Add these devices in table and invoke renesas firmware loader
> functions to check and load the firmware into device memory when
> required.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/usb/host/xhci-pci.c | 28 ++++++++++++++++++++++++++++
>  drivers/usb/host/xhci.h     |  1 +
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index b6c2f5c530e3..f26cf072836d 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -15,6 +15,7 @@
>  
>  #include "xhci.h"
>  #include "xhci-trace.h"
> +#include "xhci-pci.h"
>  
>  #define SSIC_PORT_NUM		2
>  #define SSIC_PORT_CFG2		0x880c
> @@ -319,6 +320,8 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
>  	return xhci_pci_reinit(xhci, pdev);
>  }
>  
> +static bool renesas_device;

hmm, we shouldn't need this

> +
>  /*
>   * We need to register our own PCI probe function (instead of the USB core's
>   * function) in order to create a second roothub under xHCI.
> @@ -328,6 +331,16 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	int retval;
>  	struct xhci_hcd *xhci;
>  	struct usb_hcd *hcd;
> +	struct xhci_driver_data *driver_data;
> +
> +	renesas_device = false;
> +	driver_data = (struct xhci_driver_data *)id->driver_data;
> +	if (driver_data && driver_data->quirks & XHCI_RENESAS_FW_QUIRK) {
> +		retval = renesas_xhci_check_request_fw(dev, id);
> +		if (retval)
> +			return retval;
> +		renesas_device = true;
> +	}
>  
>  	/* Prevent runtime suspending between USB-2 and USB-3 initialization */
>  	pm_runtime_get_noresume(&dev->dev);
> @@ -388,6 +401,9 @@ static void xhci_pci_remove(struct pci_dev *dev)
>  {
>  	struct xhci_hcd *xhci;
>  
> +	if (renesas_device)
> +		renesas_xhci_pci_exit(dev);
> +

Ah, I see, what we really should do is make sure the quirks in the driver data get
added to xhci->quirks, and then just check for the correct quirk in xhci_pci_remove.

if (xhci->quirks & XHCI_RENESAS_FW_QUIRK)
	renesas_xhci_pci_exit(dev);
 

Heikki Krogerus did some work on this a long time ago, below code is based on his
work. It needs to be added:
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index f26cf072836d..5ae4fc10fc31 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -88,8 +88,16 @@ static int xhci_pci_reinit(struct xhci_hcd *xhci, struct pci_dev *pdev)
 
 static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 {
-	struct pci_dev		*pdev = to_pci_dev(dev);
+	struct pci_dev			*pdev = to_pci_dev(dev);
+	struct xhci_driver_data		*driver_data;
+	const struct pci_device_id	*id;
 
+	id = pci_match_id(pdev->driver->id_table, pdev);
+
+	if (id && id->driver_data) {
+		driver_data = (struct xhci_driver_data *)id->driver_data;
+		xhci->quirks |= driver_data->quirks;
+	}
 	/* Look for vendor-specific quirks */
 	if (pdev->vendor == PCI_VENDOR_ID_FRESCO_LOGIC &&
 			(pdev->device == PCI_DEVICE_ID_FRESCO_LOGIC_PDK ||


-Mathias
