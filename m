Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92E1E1BFE5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 16:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726782AbgD3OdU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 10:33:20 -0400
Received: from mga06.intel.com ([134.134.136.31]:34754 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726571AbgD3OdU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 10:33:20 -0400
IronPort-SDR: Q6doJSoDXBXzHRsTFxX/go+ZrrmtK1dgrU5uNed92Pccrmk15LavZXWaccd5elwe9x4+i8kBi8
 NxrSJfcg26GA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2020 07:33:19 -0700
IronPort-SDR: Nj8aldPz8EtixhdgRFYIMZbnlonNQ5lHzCvYg3eQ5LPJU0YsrABCoc1hCal0oggzNpounrRXuP
 fJXU910ggtTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,336,1583222400"; 
   d="scan'208";a="258318594"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga003.jf.intel.com with ESMTP; 30 Apr 2020 07:33:16 -0700
Subject: Re: [PATCH v11 2/5] usb: renesas-xhci: Add the renesas xhci driver
To:     Vinod Koul <vkoul@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Christian Lamparter <chunkeey@googlemail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        =?UTF-8?Q?Andreas_B=c3=b6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200430101019.1130956-1-vkoul@kernel.org>
 <20200430101019.1130956-3-vkoul@kernel.org>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <8ffd119b-192f-8fcc-46cc-3a405e30338c@linux.intel.com>
Date:   Thu, 30 Apr 2020 17:36:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200430101019.1130956-3-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30.4.2020 13.10, Vinod Koul wrote:
> From: Christian Lamparter <chunkeey@googlemail.com>
> 
> This add a new driver for renesas xhci which is basically a firmware
> loader for uPD720201 and uPD720202 w/o ROM. It uses xhci-pci driver for
> most of the work.
> 
> This is added in Makefile before the xhci-pci driver so that it first
> get probed for renesas devices before the xhci-pci driver has a chance
> to claim any device.

Most of the above is no longer correct

> 
> This patch adds a firmware loader for the uPD720201K8-711-BAC-A
> and uPD720202K8-711-BAA-A variant. Both of these chips are listed
> in Renesas' R19UH0078EJ0500 Rev.5.00 "User's Manual: Hardware" as
> devices which need the firmware loader on page 2 in order to
> work as they "do not support the External ROM".
> 
> The "Firmware Download Sequence" is describe in chapter
> "7.1 FW Download Interface" R19UH0078EJ0500 Rev.5.00 page 131.
> 
> The firmware "K2013080.mem" is available from a USB3.0 Host to
> PCIe Adapter (PP2U-E card) "Firmware download" archive. An
> alternative version can be sourced from Netgear's WNDR4700 GPL
> archives.
> 
> The release notes of the PP2U-E's "Firmware Download" ver 2.0.1.3
> (2012-06-15) state that the firmware is for the following devices:
>  - uPD720201 ES 2.0 sample whose revision ID is 2.
>  - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
>  - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.
> 
> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> [vkoul: fixed comments:
> 	used macros for timeout count and delay
> 	removed renesas_fw_alive_check
> 	cleaned renesas_fw_callback
> 	removed recursion for renesas_fw_download
> 	add register defines and field names
> 	move to a separate file
> 	make fw loader as sync probe so that we execute in probe and
>         prevent race]
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/usb/host/Makefile           |   3 +-
>  drivers/usb/host/xhci-pci-renesas.c | 361 ++++++++++++++++++++++++++++
>  drivers/usb/host/xhci-pci.h         |  16 ++
>  3 files changed, 379 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/usb/host/xhci-pci-renesas.c
>  create mode 100644 drivers/usb/host/xhci-pci.h
> 
> diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
> index b191361257cc..c3a79f626393 100644
> --- a/drivers/usb/host/Makefile
> +++ b/drivers/usb/host/Makefile
> @@ -70,7 +70,8 @@ obj-$(CONFIG_USB_OHCI_HCD_DAVINCI)	+= ohci-da8xx.o
>  obj-$(CONFIG_USB_UHCI_HCD)	+= uhci-hcd.o
>  obj-$(CONFIG_USB_FHCI_HCD)	+= fhci.o
>  obj-$(CONFIG_USB_XHCI_HCD)	+= xhci-hcd.o
> -obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o
> +usb-xhci-pci-objs		:= xhci-pci.o xhci-pci-renesas.o
> +obj-$(CONFIG_USB_XHCI_PCI)	+= usb-xhci-pci.o

I don't think it's a good idea to rename the xhci-pci module to usb-xhci-pci

does

xhci-pci-y			:= xhci-pci.o xhci-pci-renesas.o
obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o

cause some kbuild issues?

-Mathias
