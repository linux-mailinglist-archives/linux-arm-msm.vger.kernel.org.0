Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF2D2D6C7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 01:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394229AbgLKA0c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 19:26:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390562AbgLKA0Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 19:26:25 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D8CC0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 16:25:45 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id t3so5887856pgi.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 16:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jsFAhpaoE3Fs09MPdxNqXe75al0gQVy1aKtmcbUC/60=;
        b=S2T6qH6737POAJ3jUBBdUIcfLwvdsyulbZwI92sUnfd6OdFr4tBnU4TrUpUkqkdv5l
         akcopsU/b6sltU5xNKQMFCxIC32jrDnJX4FhS/GIF2kJp5sHDro+QAyi4vLGWeASmgI6
         BE4kIceEadyOAmEsuCjvw+1yLV3mvRQpDWVQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jsFAhpaoE3Fs09MPdxNqXe75al0gQVy1aKtmcbUC/60=;
        b=IYyY69b5/Lz8Ode9bGI8bTvz+V9yugoIZNMcBa67J43+fbZfFSxL88/q8QSP7gVl0v
         tGZ8CkmUMqrqzVWsFrOgxfelEZvlazxKamVcz/7fCt1R2MVTnKXyM0JUemPbLZ1bMMDC
         DTVHtfUKdmYK5h10I6cEtk2KBk87YuF161pMendaC4UdjDgDbGK8Csf+1LmbU6J7TIyC
         gPlJdjkIh0xYW7j5KwWcMrGOUHxJbMD2xOOIMdjsO4QVXwoI9XuIhP2TweBuaRlel6mx
         QcQzkODOAfHAZaOqyGj0vkyisqYMRGgkOLfbiKtXNmgK0auYGviKUJ2WNd3W+WwhVpIu
         ABwA==
X-Gm-Message-State: AOAM533jcmYh8hu79wVBSIlF7bWbzetySF2FmOaDnwtWuk4TxfvjZtq6
        CW+XkYmEgC2UdpHMnKZ481/jkQ==
X-Google-Smtp-Source: ABdhPJwL02IzV5egzbEf8JQBW75Uk75CMT3Aar7snktYxpb8rjDlIC+4dsQIGdl5RPsyXJYqVztK3Q==
X-Received: by 2002:a17:90a:c20b:: with SMTP id e11mr10158273pjt.43.1607646345032;
        Thu, 10 Dec 2020 16:25:45 -0800 (PST)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id a14sm7796567pfl.141.2020.12.10.16.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Dec 2020 16:25:44 -0800 (PST)
Date:   Thu, 10 Dec 2020 16:25:42 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v4 2/5] usb: dwc3: host: Add suspend_quirk for dwc3 host
Message-ID: <X9K8hmAgzoWyMS9q@google.com>
References: <1603831083-2025-1-git-send-email-sanm@codeaurora.org>
 <1603831083-2025-3-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1603831083-2025-3-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 28, 2020 at 02:08:00AM +0530, Sandeep Maheswaram wrote:
> Adding suspend quirk function for dwc3 host which will be called
> during xhci suspend.
> Setting hs_phy_mode, ss_phy_mode flags and phy mode during host suspend.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/usb/dwc3/host.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index e195176..db03db8 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -11,6 +11,13 @@
>  #include <linux/platform_device.h>
>  
>  #include "core.h"
> +#include "../host/xhci.h"
> +#include "../host/xhci-plat.h"
> +int xhci_dwc3_suspend_quirk(struct usb_hcd *hcd);
> +
> +static const struct xhci_plat_priv xhci_plat_dwc3_xhci = {
> +	.suspend_quirk = xhci_dwc3_suspend_quirk,
> +};
>  
>  static int dwc3_host_get_irq(struct dwc3 *dwc)
>  {
> @@ -115,6 +122,13 @@ int dwc3_host_init(struct dwc3 *dwc)
>  		}
>  	}
>  
> +	ret = platform_device_add_data(xhci, &xhci_plat_dwc3_xhci,
> +			sizeof(struct xhci_plat_priv));
> +	if (ret) {
> +		dev_err(dwc->dev, "failed to add data to xHCI\n");
> +		goto err;
> +	}
> +
>  	ret = platform_device_add(xhci);
>  	if (ret) {
>  		dev_err(dwc->dev, "failed to register xHCI device\n");
> @@ -127,6 +141,43 @@ int dwc3_host_init(struct dwc3 *dwc)
>  	return ret;
>  }
>  
> +static void dwc3_set_phy_mode(struct usb_hcd *hcd)
> +{
> +
> +	int i, num_ports;
> +	u32 reg;
> +	unsigned int ss_phy_mode = 0;
> +	struct device *dev = hcd->self.controller;
> +	struct dwc3 *dwc = dev_get_drvdata(dev->parent);

nit: the use of 'dev' seems misleading here. By convention 'dev' refers
to the 'struct device' of the driver, here it refers to a child of that
device. It's probably not super-important, but 'dev' is also not realy
needed, you could omit it and change the assignment of 'dwc3' to:

	struct dwc3 *dwc = dev_get_drvdata(hcd->self.controller->parent);

> +	struct xhci_hcd	*xhci_hcd = hcd_to_xhci(hcd);
> +
> +	dwc->hs_phy_mode = 0;
> +
> +	reg = readl(&xhci_hcd->cap_regs->hcs_params1);
> +
> +	num_ports = HCS_MAX_PORTS(reg);
> +	for (i = 0; i < num_ports; i++) {
> +		reg = readl(&xhci_hcd->op_regs->port_status_base + i * 0x04);
> +		if (reg & PORT_PE) {
> +			if (DEV_HIGHSPEED(reg) || DEV_FULLSPEED(reg))
> +				dwc->hs_phy_mode |= PHY_MODE_USB_HOST_HS;
> +			else if (DEV_LOWSPEED(reg))
> +				dwc->hs_phy_mode |= PHY_MODE_USB_HOST_LS;
> +
> +			if (DEV_SUPERSPEED(reg))
> +				ss_phy_mode |= PHY_MODE_USB_HOST_SS;
> +		}
> +	}
> +	phy_set_mode(dwc->usb2_generic_phy, dwc->hs_phy_mode);
> +	phy_set_mode(dwc->usb3_generic_phy, ss_phy_mode);
> +}
> +
> +int xhci_dwc3_suspend_quirk(struct usb_hcd *hcd)
> +{
> +	dwc3_set_phy_mode(hcd);
> +	return 0;
> +}
> +
>  void dwc3_host_exit(struct dwc3 *dwc)
>  {
>  	platform_device_unregister(dwc->xhci);

Other than the nit:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
