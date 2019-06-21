Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62E804EFAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2019 21:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbfFUTxf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jun 2019 15:53:35 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53380 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbfFUTxf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jun 2019 15:53:35 -0400
Received: by mail-wm1-f65.google.com with SMTP id x15so7308861wmj.3;
        Fri, 21 Jun 2019 12:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eAnKudYoq6jZczgn9fG4XqCKdkFdaZnAytNFcfCmgvE=;
        b=fxdEPz5FzKVKBa9ar1R4Ypm9ApuhJ5cxEDRojtGb8AOjecS6PQsIiiczljs19rTEbj
         o34Ad8cn8nVibM9bxJ0nVL3BpbN8yONpH4/ylD6hxYI/deeLtuO9bm5O+IS68RQ6EiFF
         Jp5QV5aIaF//3oviBF7c4u1sWZXx+qArjQGny/k8CpP9515YNv82E/AP4c/2Ok2BmpPD
         HyLoyGEUkXLA0l7dcoYmSuGZkHN2kGWOV8lb4GLs8/vqKHToiqwuvUdAxU4i8KLWkg63
         mXSQew6DLmEU26P/CuTv9bLDBcLo4oDUgZT1RgR9fgHI+icPPkHQfvknf/A4veSv3eA0
         1p0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eAnKudYoq6jZczgn9fG4XqCKdkFdaZnAytNFcfCmgvE=;
        b=fquXHic7ca0ZY210LsV3NLsk6yx5+siz6G7WJSvkV87GNT9pScSn/WzjJJ/nR4RBZn
         JoSau2slxsoHQKw2rzG9lJKyCth6+NYTbwVUjiWwtNW+9DEFMifHrsLB/OlWKTmZbSxq
         ZulF2SmWZdaQf0V8XqxGPDSd+k6VlpOiIW6lPWcSd1Knn4HSb/0/qquA2Pv8nX9+v5vZ
         bej1v7pkvkzz+qAc0Pw6bGqGs1Pxtlje/4sbSPVP0ro4jxugXU5pEEh0SJMafc24Ph5G
         XODj1bECkP7a05rsX5GxQ3kJvlnTnbGUyfen3gdj7OZwjYA7vOpqXfkV5xeiRB5X7Jxy
         DFTA==
X-Gm-Message-State: APjAAAXjThviEyVtz2RjqBiluK7UFEGYMSBkUf2CUHPJfaJdGh4rufLs
        vlVRhhz6rio6J8FXnPN4b7U=
X-Google-Smtp-Source: APXvYqzy1XXzS6iArof8LCwkLyMLZk7HtzDHlHevRk5ukuGMoQ+ynlgmqchqWhz4W52tTyJLLVDYHA==
X-Received: by 2002:a05:600c:2201:: with SMTP id z1mr4863220wml.59.1561146812417;
        Fri, 21 Jun 2019 12:53:32 -0700 (PDT)
Received: from debian64.daheim (pD9E297F7.dip0.t-ipconnect.de. [217.226.151.247])
        by smtp.gmail.com with ESMTPSA id m9sm364524wrn.92.2019.06.21.12.53.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 12:53:31 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1] helo=debian64.localnet)
        by debian64.daheim with esmtp (Exim 4.92)
        (envelope-from <chunkeey@gmail.com>)
        id 1hePbH-0006fn-6g; Fri, 21 Jun 2019 21:53:31 +0200
From:   Christian Lamparter <chunkeey@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] usb: xhci: handle uPD720201 and uPD720202 w/o ROM
Date:   Fri, 21 Jun 2019 21:53:31 +0200
Message-ID: <2243374.tJjtY2ZRGj@debian64>
In-Reply-To: <20190621085913.8722-3-vkoul@kernel.org>
References: <20190621085913.8722-1-vkoul@kernel.org> <20190621085913.8722-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Friday, June 21, 2019 10:59:10 AM CEST Vinod Koul wrote:
> From: Christian Lamparter <chunkeey@googlemail.com>
> 
> This patch adds a firmware check for the uPD720201K8-711-BAC-A
> and uPD720202K8-711-BAA-A variant. Both of these chips are listed
> in Renesas' R19UH0078EJ0500 Rev.5.00 "User's Manual: Hardware" as
> devices which need a firmware in order to work as they do not have
> support to load the firmware from an external ROM.
> 
> Currently, the xhci-pci driver is unable to initialize the hcd in
> this case. Instead it will wait for 30 seconds and cause a timeout
> in xhci_handshake() and fails.
> 
> [    5.116990] xhci_hcd 0000:45:00.0: new USB bus registered ...
> [   32.335215] xhci_hcd 0000:45:00.0: can't setup: -110
> [   32.340179] xhci_hcd 0000:45:00.0: USB bus 2 deregistered
> [   32.345587] xhci_hcd 0000:45:00.0: init 0000:45:00.0 fail, -110
> [   32.351496] xhci_hcd: probe of 0000:45:00.0 failed with error -110
> 
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

From what I remember, this was the "backup" patch that just prevented
a stuck device (since the xhci-pci would trigger the watchdog on the
powerpc APM82181). I posted because it because I didn't get any reply
from Greg or Felipe. This patch should be skipable since patch 1/5 adds
the full loader.

> ---
>  drivers/usb/host/xhci-pci.c | 59 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 724d0f567d98..65de5e961892 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -711,6 +711,55 @@ static int renesas_fw_download_to_hw(struct pci_dev *pdev,
>  	return 1;
>  }
>  
> +static int renesas_check_if_fw_dl_is_needed(struct pci_dev *pdev)
> +{
> +	int err;
> +	u8 fw_state;
> +
> +	/*
> +	 * Only the uPD720201K8-711-BAC-A or uPD720202K8-711-BAA-A
> +	 * are listed in R19UH0078EJ0500 Rev.5.00 as devices which
> +	 * need a firmware in order to work.
> +	 *
> +	 *  - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.
> +	 *  - uPD720201 ES 2.0 sample whose revision ID is 2.
> +	 *  - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
> +	 */
> +	if (!((pdev->vendor == PCI_VENDOR_ID_RENESAS) &&
> +	    ((pdev->device == 0x0015 && pdev->revision == 0x02) ||
> +	    (pdev->device == 0x0014 &&
> +	    (pdev->revision == 0x02 || pdev->revision == 0x03)))))
> +		return 0;
> +
> +	/*
> +	 * Test if the firmware was uploaded and is running.
> +	 * As most BIOSes will initialize the device for us.
> +	 */
> +	err = pci_read_config_byte(pdev, 0xf4, &fw_state);
> +	if (err)
> +		return pcibios_err_to_errno(err);
> +
> +	/* Check the "Result Code" Bits (6:4) and act accordingly */
> +	switch (fw_state & 0x70) {
> +	case 0: /* No result yet */
> +		dev_err(&pdev->dev, "FW is not ready/loaded yet.");
> +		return -ENODEV;
> +
> +	case BIT(4): /* Success, device should be working. */
> +		dev_dbg(&pdev->dev, "FW is ready.");
> +		return 0;
> +
> +	case BIT(5): /* Error State */
> +		dev_err(&pdev->dev, "HW is in an error state.");
> +		return -ENODEV;
> +
> +	default: /* All other states are marked as "Reserved states" */
> +		dev_err(&pdev->dev, "HW is in an invalid state (%x).",
> +			(fw_state & 0x70) >> 4);
> +		return -EINVAL;
> +	}
> +}
> +
>  /* called during probe() after chip reset completes */
>  static int xhci_pci_setup(struct usb_hcd *hcd)
>  {
> @@ -765,6 +814,11 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  		return retval;
>  	};
>  
> +	/* Check if this device is a RENESAS uPD720201/2 device. */
> +	retval = renesas_check_if_fw_dl_is_needed(dev);
> +	if (retval)
> +		return retval;
> +
>  	driver = (struct hc_driver *)id->driver_data;
>  
>  	/* Prevent runtime suspending between USB-2 and USB-3 initialization */
> @@ -966,6 +1020,11 @@ static int xhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
>  	if (pdev->vendor == PCI_VENDOR_ID_INTEL)
>  		usb_enable_intel_xhci_ports(pdev);
>  
> +	/* Check if this device is a RENESAS uPD720201/2 device. */
> +	retval = renesas_check_if_fw_dl_is_needed(pdev);
> +	if (retval)
> +		return retval;
> +
>  	if (xhci->quirks & XHCI_SSIC_PORT_UNUSED)
>  		xhci_ssic_port_unused_quirk(hcd, false);
>  
> 




