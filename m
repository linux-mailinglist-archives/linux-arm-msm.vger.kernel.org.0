Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCE0243CC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 17:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgHMPto (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 11:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbgHMPtn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 11:49:43 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36ED5C061384
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2020 08:49:42 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id f5so2794670plr.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2020 08:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QisyeHY3ZHMM3TerX6llGGeWvEX6TJlY7NstZgbx+iA=;
        b=LKuthNgyTESR2Nb5oycvHkDmSlKMH02vcClqoGbLB+Q3J0FfgdtV/KW/wYLum4WUiZ
         OfVxpFSYY5d8YHZ3+iqoHu/a+DIQeHox5ug7EO6gbNtt/HujRCr9O0uZruzuirhrVqMC
         7tXN7EGsBqpcLjldCm3M1WB/akMnXU8vn394U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QisyeHY3ZHMM3TerX6llGGeWvEX6TJlY7NstZgbx+iA=;
        b=tQRROdMYnaH/tdWt3tMDtcy+VksAIpvvt8BfWaYo/6xRtyQXzRgCCDddsbAVICOrV5
         76qVgEk5ntlm7h4+cXKV9ZRMD0sFdYZE/m6eDdKnq82Cx1mhZGliJPr9tPl7D8lbyOZt
         1GQaAKCDrpMK0gXDlR6ImZJ++ihk08Wor+zASif0i/eekgmD5GyUyq/FzTOMH6hcVsn+
         7+OWxkoQfxn5mk78vqdMfqNWL2z2+260zb27iP4Uane0X4yFsRbLKmrYvueLzMO9rlTr
         63/9fe1UQEAxKV4dQu+zOfkKzSVMfzubKJdtqnV0tpSiRb4mvYM1pBQPfMB6gE+45O1C
         NIeA==
X-Gm-Message-State: AOAM530mNqamKGxdqBPulZPog53eDoMTbpfKRgGYYJR2ZbgapPRVJ9j4
        hOKjeFfoitN80o1ia2XYpF3uvQ==
X-Google-Smtp-Source: ABdhPJz1M1P1S51YzM2m55MEu1bwSyYnt8Ac/RYg3NEhBAQvrxXf7zaV/15+/gOI8U5pzir/Bpl51Q==
X-Received: by 2002:a17:90a:6d96:: with SMTP id a22mr5449139pjk.165.1597333782100;
        Thu, 13 Aug 2020 08:49:42 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id b185sm6329480pfg.71.2020.08.13.08.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 08:49:40 -0700 (PDT)
Date:   Thu, 13 Aug 2020 08:49:39 -0700
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
Message-ID: <20200813154939.GB2995789@google.com>
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
> +				if (ret)
> +					return ret;
> +				dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
> +				break;
> +			}
>  		}
>  		/* Restore GUSB2PHYCFG bits that were modified in suspend */
>  		reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 013f42a..5367d510e 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1094,6 +1094,8 @@ struct dwc3 {
>  	struct phy		*usb3_generic_phy;
>  
>  	bool			phys_ready;
> +	bool                    need_phy_for_wakeup;
> +	unsigned int            hs_phy_flags;
>  
>  	struct ulpi		*ulpi;
>  	bool			ulpi_ready;

Should this include a check for the 'wakeup-source' DT attribute as in
xhci-mtk.c, to make wakeup support optional?
