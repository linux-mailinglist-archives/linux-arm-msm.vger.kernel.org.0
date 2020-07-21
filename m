Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09443228B78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 23:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731209AbgGUVgH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 17:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731144AbgGUVgH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 17:36:07 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213EDC0619DB
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 14:36:07 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t6so10826597plo.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 14:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QnFBaTSg1O0oHUaCso2bk1qAOV9FQ15i24q2Wj9c11M=;
        b=YOUL4cnKo2x3TaJ+BAr/95ETT6x9gObK2WQYwFGJgK/9RUBdjb9MfbaMiHffHRHyKC
         LGPxmxmDr3JtJgytD9mZPSCsbbH8QO2j0gNH8SXz+CGy6SykntBW6W3e46GhrYKLD/as
         8vk+cPDlyjlX5x6BntZR1v6ykrBCcA+fBZIkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QnFBaTSg1O0oHUaCso2bk1qAOV9FQ15i24q2Wj9c11M=;
        b=U1Mo8lhs22wBrGGflOHFza2v3kRoTI1gPrKGVvSglkWHPZx47v0oq28tkcg7GeiPu0
         W5Yl3iGz0KxdsZ9T/92aD7wlvY4m52khmX1PxDiQYhXJc4gBDtcujS1xpjEdU4MIGWCd
         i8knJQFzDxZqViJGPsnJHtJfDMd6qVxWfyUWEusxhKqrn2E35xJPC0ZcdoVFaMDc6MmZ
         dOgoIrKHz0SvEespx70mt9Wfl2+5HfNs4lx7fWpQU4Q9gtgIqGwoN0bsU4QA+gyZv9w6
         AkpsNhSGS5vfz6NTLZqVfJE8EBXReYVsJeizNtjoUi2gECJappSV5+EisCnBZICxLB1Y
         VLag==
X-Gm-Message-State: AOAM530YUEBU1q5Zdokva7r+xns4S6rwQ23PS92EtAPStNOacLpBc9H+
        IuIxDeAa1Q9tYJVOT0saMTCeKA==
X-Google-Smtp-Source: ABdhPJwTp73CGx2NZOG1F3slWn6h4XRPSmBMoPPr4bTFkCrHZLbZxCeKsBovc096clKCXXQIzGNjEA==
X-Received: by 2002:a17:902:7c8b:: with SMTP id y11mr10339693pll.142.1595367366620;
        Tue, 21 Jul 2020 14:36:06 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id b4sm21711441pfo.137.2020.07.21.14.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 14:36:05 -0700 (PDT)
Date:   Tue, 21 Jul 2020 14:36:04 -0700
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
Subject: Re: [PATCH v2 1/3] usb: dwc3: core: Host wake up support from system
 suspend
Message-ID: <20200721213604.GW3191083@google.com>
References: <1594235417-23066-1-git-send-email-sanm@codeaurora.org>
 <1594235417-23066-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1594235417-23066-2-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sandeep,

On Thu, Jul 09, 2020 at 12:40:15AM +0530, Sandeep Maheswaram wrote:
> Avoiding phy powerdown in host mode so that it can be wake up by devices.
> Added need_phy_for_wakeup flag to distinugush resume path and hs_phy_flags
> to check connection status and set phy mode and  configure interrupts.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/usb/dwc3/core.c | 47 ++++++++++++++++++++++++++++++++++++++++-------
>  drivers/usb/dwc3/core.h |  2 ++
>  2 files changed, 42 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 25c686a7..eb7c225 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -31,12 +31,14 @@
>  #include <linux/usb/gadget.h>
>  #include <linux/usb/of.h>
>  #include <linux/usb/otg.h>
> +#include <linux/usb/hcd.h>
>  
>  #include "core.h"
>  #include "gadget.h"
>  #include "io.h"
>  
>  #include "debug.h"
> +#include "../host/xhci.h"
>  
>  #define DWC3_DEFAULT_AUTOSUSPEND_DELAY	5000 /* ms */
>  
> @@ -1627,10 +1629,36 @@ static int dwc3_core_init_for_resume(struct dwc3 *dwc)
>  	return ret;
>  }
>  
> +static void dwc3_set_phy_speed_flags(struct dwc3 *dwc)
> +{
> +
> +	int i, num_ports;
> +	u32 reg;
> +	struct usb_hcd	*hcd = platform_get_drvdata(dwc->xhci);
> +	struct xhci_hcd	*xhci_hcd = hcd_to_xhci(hcd);
> +
> +	dwc->hs_phy_flags &= ~(PHY_MODE_USB_HOST_HS | PHY_MODE_USB_HOST_LS);

Where is hs_phy_flags initialized? As far as I can tell it isn't, hence when
dwc3_set_phy_speed_flags() is executed the first time it is 0 (from
devm_kzalloc()), and after the '&=' it is still 0. The next time it will have
whatever value it was set to in the below loop, which is then cleared by
the '&='. It seems you could as well just write 'dwc->hs_phy_flags = 0',
which is clearer, unless the field is used in some other way that isn't
obvious to me.

> +
> +	reg = readl(&xhci_hcd->cap_regs->hcs_params1);
> +
> +	num_ports = HCS_MAX_PORTS(reg);
> +	for (i = 0; i < num_ports; i++) {
> +		reg = readl(&xhci_hcd->op_regs->port_status_base + i * 0x04);
> +		if (reg & PORT_PE) {
> +			if (DEV_HIGHSPEED(reg) || DEV_FULLSPEED(reg))
> +				dwc->hs_phy_flags |= PHY_MODE_USB_HOST_HS;
> +			else if (DEV_LOWSPEED(reg))
> +				dwc->hs_phy_flags |= PHY_MODE_USB_HOST_LS;

Is another entry for DEV_SUPERSPEED needed?

> +		}
> +	}
> +	phy_set_mode(dwc->usb2_generic_phy, dwc->hs_phy_flags);
> +}
> +
>  static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  {
>  	unsigned long	flags;
>  	u32 reg;
> +	struct usb_hcd  *hcd = platform_get_drvdata(dwc->xhci);
>  
>  	switch (dwc->current_dr_role) {
>  	case DWC3_GCTL_PRTCAP_DEVICE:
> @@ -1643,9 +1671,12 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  		dwc3_core_exit(dwc);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> +		dwc3_set_phy_speed_flags(dwc);
>  		if (!PMSG_IS_AUTO(msg)) {
> -			dwc3_core_exit(dwc);
> -			break;
> +			if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
> +				dwc->need_phy_for_wakeup = true;
> +			else
> +				dwc->need_phy_for_wakeup = false;
>  		}
>  
>  		/* Let controller to suspend HSPHY before PHY driver suspends */
> @@ -1705,11 +1736,13 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
>  		if (!PMSG_IS_AUTO(msg)) {
> -			ret = dwc3_core_init_for_resume(dwc);
> -			if (ret)
> -				return ret;
> -			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
> -			break;
> +			if (!dwc->need_phy_for_wakeup) {
> +				ret = dwc3_core_init_for_resume(dwc);

Before this patch we had the combo dwc3_core_exit() / dwc3_core_init_for_resume(),
now it is only dwc3_core_init_for_resume() for !dwc->need_phy_for_wakeup.
Doesn't this cause trouble with enable counts, e.g. with clk_bulk_prepare_enable()
being called in dwc3_core_init_for_resume(), without the corresponding
clk_bulk_disable_unprepare() calls in dwc3_core_exit()?
