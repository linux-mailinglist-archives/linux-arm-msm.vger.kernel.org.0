Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E90DC364CA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Apr 2021 22:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241394AbhDSU4U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Apr 2021 16:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234098AbhDSUz5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Apr 2021 16:55:57 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D2B5C061350
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Apr 2021 13:53:16 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id lr7so2493023pjb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Apr 2021 13:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oULCgofDCr3IKol4CZm7G0o//okmzQkN3R5Hp16/Ue8=;
        b=PRfRzGaTIZDsL3wTTlVgGI06CnIMFMTv8pN0WiVKjO1yxjUxfUCOOv8RJT6vZ1ryCV
         +cDK1gLSgpQBwbnd7pfF/YVkIrm4Qk2YjlM3UCErvIhQ52Je132mA+IK6yX0r6hu6QB6
         ++3j6S0TdChypVnxHhj/REa9w98cc1mO6g0ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oULCgofDCr3IKol4CZm7G0o//okmzQkN3R5Hp16/Ue8=;
        b=Tpyjf/Xldw0howbxgPigdqEjV5/ZPZxAC2dPggzlziC+viRKF+Zfzi8ke8ja/Dlj/V
         DmFRMWMjfHodSFdWILFZfhkx7fuchDbaANvZro5Qk0gXUnXdwfseo9JAg2YzkSppGxqC
         ek6L1XK+AviceMPJgw8PMkXtw6sFZhvRatEaPPocov86CMlHijjdy6k4T/xrMVMg0qbs
         TZwaoyyn7h06WKoqv7Ip1oGN0YLlLKvKhggYqDa0pPedcp5wHMn72Z4vxPykP++AiUkS
         oefooKv6wRmhafXXUk+z1qWnhEGWOXr3o+jqIhoc7XGuqUFR16IYKPcnq0bKKPytB1t3
         q/xQ==
X-Gm-Message-State: AOAM532SMHAN94lR5C7/MFP5fiUWlNoO8yvcteuHXYYmQ1WuW8GQTeNX
        StgsEXpLGc+YKB7OmjW94zLGdQ==
X-Google-Smtp-Source: ABdhPJxJrsfjt/GcLeN3qwtoq2slf1gMFTkTmr11hYO0bkxLzfjols+Aib2YcFe7rCTHsHx4JlOADw==
X-Received: by 2002:a17:90a:7783:: with SMTP id v3mr1022551pjk.177.1618865595769;
        Mon, 19 Apr 2021 13:53:15 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:7401:678f:e510:6700])
        by smtp.gmail.com with UTF8SMTPSA id q6sm680577pfs.33.2021.04.19.13.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 13:53:15 -0700 (PDT)
Date:   Mon, 19 Apr 2021 13:53:14 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v6 1/5] usb: dwc3: host: Add suspend_quirk for dwc3 host
Message-ID: <YH3tuppS0Xjxobmj@google.com>
References: <1618567313-25373-1-git-send-email-sanm@codeaurora.org>
 <1618567313-25373-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1618567313-25373-2-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 16, 2021 at 03:31:49PM +0530, Sandeep Maheswaram wrote:

> Subject: usb: dwc3: host: Add suspend_quirk for dwc3 host
>
> Adding suspend quirk function for dwc3 host which will be called
> during xhci suspend.
> Setting hs_phy_mode, ss_phy_mode , phy_power_off flags and phy mode
> during host suspend.

This describes in other words what the code already tells us, but
doesn't really explain why this change is needed.

An attempt to be a bit clearer:

  Subject: usb: dwc3: host: Set PHY mode during suspend

  During suspend read the status of all port and make sure the PHYs
  are in the correct mode (mka@: why is it necessary to call
  phy_set_mode(), shouldn't the PHYs already be in the correct mode
  if they are operational?). Keep track of the mode of the HS PHY to
  be able to configure wakeup properly.

  Also check during suspend if any wakeup capable devices are
  connected to the controller (directly or through hubs), if there
  are none set a flag to indicate that the PHY should be powered
  down during suspend.

Just a starting point, I'm sure it has room for improvement.

> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/usb/dwc3/core.h |  3 +++
>  drivers/usb/dwc3/host.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 6e9abfb..f409dc1 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1111,6 +1111,9 @@ struct dwc3 {
>  
>  	bool			phys_ready;
>  
> +	unsigned int            hs_phy_mode;
> +	bool			phy_power_off;
> +
>  	struct ulpi		*ulpi;
>  	bool			ulpi_ready;
>  
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index f29a264..527f04c 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -11,6 +11,14 @@
>  #include <linux/platform_device.h>
>  
>  #include "core.h"
> +#include "../host/xhci.h"
> +#include "../host/xhci-plat.h"
> +
> +static int xhci_dwc3_suspend_quirk(struct usb_hcd *hcd);
> +
> +static const struct xhci_plat_priv xhci_plat_dwc3_xhci = {
> +	.suspend_quirk = xhci_dwc3_suspend_quirk,
> +};
>  
>  static int dwc3_host_get_irq(struct dwc3 *dwc)
>  {
> @@ -115,6 +123,13 @@ int dwc3_host_init(struct dwc3 *dwc)
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
> @@ -127,6 +142,50 @@ int dwc3_host_init(struct dwc3 *dwc)
>  	return ret;
>  }
>  
> +static void dwc3_set_phy_mode(struct usb_hcd *hcd)
> +{
> +
> +	int i, num_ports;
> +	u32 reg;
> +	unsigned int ss_phy_mode = 0;
> +	struct dwc3 *dwc = dev_get_drvdata(hcd->self.controller->parent);
> +	struct xhci_hcd	*xhci_hcd = hcd_to_xhci(hcd);
> +
> +	dwc->hs_phy_mode = 0;
> +
> +	reg = readl(&xhci_hcd->cap_regs->hcs_params1);
> +	num_ports = HCS_MAX_PORTS(reg);
> +
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
> +	struct dwc3 *dwc = dev_get_drvdata(hcd->self.controller->parent);
> +
> +	dwc3_set_phy_mode(hcd);
> +
> +	if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
> +		dwc->phy_power_off = false;
> +	else
> +		dwc->phy_power_off = true;
> +
> +	return 0;
> +}
> +
>  void dwc3_host_exit(struct dwc3 *dwc)
>  {
>  	platform_device_unregister(dwc->xhci);
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
