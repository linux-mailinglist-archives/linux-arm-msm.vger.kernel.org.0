Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB8A4F85E9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Apr 2022 19:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346168AbiDGRZN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Apr 2022 13:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346167AbiDGRYR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Apr 2022 13:24:17 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E6192FE62
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Apr 2022 10:22:12 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id bx5so6189870pjb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Apr 2022 10:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=She3iuzrzbaRPTDd7X1kPR3PqaIMp+t50YFOrpufiXk=;
        b=IxfhMKVqwDA57n3w64UxRNmCnwWO8EYUJOMKmVANIi45zdJ2IUS1jg2dE3mgR2kjnV
         NCWxfyBol7MXkbweK9+2Swr/MgmO91Pf7SaAlCYtF9OyPZ2H6ZYe7fK/JQVb8Uk7I6NG
         AGzIwD+Rc/fteCao/lmkMVt+rRXToa0OAjUTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=She3iuzrzbaRPTDd7X1kPR3PqaIMp+t50YFOrpufiXk=;
        b=dERlo8vtN8x4Jsodx3mvrLc37O8DwxS4H/wjvgXKkyoibRKNyA9TS63I69N+3sOYYz
         CxWd93E5hU9yZ/9WJFvB7uR3zuFnqOf1famRT/nEQZf9mVLLeZYEI5RxNWgT3v2s0mbA
         aCG4acwgOW6VfDpUA73/euRW7USgB/pc+HCimJlLzqo7JccM88gf+wjujIPqetrDIEoM
         LVHPjgdLlJupetmx3hjvSVPxH6UvDtzo1fTOd6DDcE8OfoP1Qfw2onbw+ABg0RXDMwuv
         pU4KsDD7EFuffXTre58hfDOX20Xw5yjm/i7uEmrQpYK1Dw9FGpovH3I/PKr+p/klKpm5
         w5pA==
X-Gm-Message-State: AOAM531f03F63c7oz0zXYqUSZ/6RuW9v3zVdf8FrISeqram8GySRPtXO
        68DC9oE1kD0h04TuqRVbvRiePQ==
X-Google-Smtp-Source: ABdhPJztnYKWD0X7iGmVdvLXP4E9csn/kOzp+ih1iJwiRFjwqK6xCqUyjfuNRE/7cSV8KpsXM4p/Ng==
X-Received: by 2002:a17:90b:4f8e:b0:1c7:3652:21bc with SMTP id qe14-20020a17090b4f8e00b001c7365221bcmr16931794pjb.38.1649352131931;
        Thu, 07 Apr 2022 10:22:11 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:693e:9ca0:42a0:6bf7])
        by smtp.gmail.com with UTF8SMTPSA id a38-20020a056a001d2600b004f70d5e92basm23833193pfx.34.2022.04.07.10.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 10:22:11 -0700 (PDT)
Date:   Thu, 7 Apr 2022 10:22:09 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com,
        quic_kriskura@quicinc.com, quic_vpulyala@quicinc.com
Subject: Re: [PATCH v12 1/6] usb: dwc3: core: Host wake up support from
 system suspend
Message-ID: <Yk8dwZqo7WnoolOd@google.com>
References: <1649321104-31322-1-git-send-email-quic_c_sanm@quicinc.com>
 <1649321104-31322-2-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1649321104-31322-2-git-send-email-quic_c_sanm@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 07, 2022 at 02:14:59PM +0530, Sandeep Maheswaram wrote:
> During suspend read the status of all port and set hs phy mode
> based on current speed. Use this hs phy mode to configure wakeup
> interrupts in qcom glue driver.
> 
> Also check during suspend if any wakeup capable devices are
> connected to the controller (directly or through hubs), if there
> are none set a flag to indicate that the PHY is powered
> down during suspend.
> 
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> ---
>  drivers/usb/dwc3/core.c | 29 ++++++++++++++++++++---------
>  drivers/usb/dwc3/core.h |  4 ++++
>  drivers/usb/dwc3/host.c | 25 +++++++++++++++++++++++++
>  3 files changed, 49 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 1170b80..b102a22 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -32,6 +32,7 @@
>  #include <linux/usb/gadget.h>
>  #include <linux/usb/of.h>
>  #include <linux/usb/otg.h>
> +#include <linux/usb/hcd.h>
>  
>  #include "core.h"
>  #include "gadget.h"
> @@ -1723,6 +1724,7 @@ static int dwc3_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, dwc);
>  	dwc3_cache_hwparams(dwc);
> +	device_init_wakeup(&pdev->dev, of_property_read_bool(dev->of_node, "wakeup-source"));
>  
>  	spin_lock_init(&dwc->lock);
>  	mutex_init(&dwc->mutex);
> @@ -1865,6 +1867,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  {
>  	unsigned long	flags;
>  	u32 reg;
> +	struct usb_hcd  *hcd = platform_get_drvdata(dwc->xhci);
>  
>  	switch (dwc->current_dr_role) {
>  	case DWC3_GCTL_PRTCAP_DEVICE:
> @@ -1877,10 +1880,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  		dwc3_core_exit(dwc);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> -		if (!PMSG_IS_AUTO(msg)) {
> -			dwc3_core_exit(dwc);
> -			break;
> -		}
> +		dwc3_set_phy_speed_mode(dwc);
>  
>  		/* Let controller to suspend HSPHY before PHY driver suspends */
>  		if (dwc->dis_u2_susphy_quirk ||
> @@ -1896,6 +1896,16 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  
>  		phy_pm_runtime_put_sync(dwc->usb2_generic_phy);
>  		phy_pm_runtime_put_sync(dwc->usb3_generic_phy);
> +
> +		if (!PMSG_IS_AUTO(msg)) {
> +			if (device_may_wakeup(dwc->dev) &&
> +			    usb_wakeup_enabled_descendants(hcd->self.root_hub)) {

Did you ever try whether you could use device_children_wakeup_capable() from
[1] instead of usb_wakeup_enabled_descendants()?

[1] https://patchwork.kernel.org/project/linux-usb/patch/1635753224-23975-2-git-send-email-quic_c_sanm@quicinc.com/#24566065

> +				dwc->phy_power_off = false;
> +			} else {
> +				dwc->phy_power_off = true;
> +				dwc3_core_exit(dwc);
> +			}
> +		}
>  		break;
>  	case DWC3_GCTL_PRTCAP_OTG:
>  		/* do nothing during runtime_suspend */
> @@ -1939,11 +1949,12 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
>  		if (!PMSG_IS_AUTO(msg)) {
> -			ret = dwc3_core_init_for_resume(dwc);
> -			if (ret)
> -				return ret;
> -			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
> -			break;
> +			if (dwc->phy_power_off) {
> +				ret = dwc3_core_init_for_resume(dwc);
> +				if (ret)
> +					return ret;
> +				dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
> +			}
>  		}
>  		/* Restore GUSB2PHYCFG bits that were modified in suspend */
>  		reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 5c9d467..de58995 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1154,6 +1154,9 @@ struct dwc3 {
>  
>  	bool			phys_ready;
>  
> +	unsigned int            hs_phy_mode;
> +	bool			phy_power_off;
> +
>  	struct ulpi		*ulpi;
>  	bool			ulpi_ready;
>  
> @@ -1537,6 +1540,7 @@ int dwc3_core_soft_reset(struct dwc3 *dwc);
>  #if IS_ENABLED(CONFIG_USB_DWC3_HOST) || IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
>  int dwc3_host_init(struct dwc3 *dwc);
>  void dwc3_host_exit(struct dwc3 *dwc);
> +void dwc3_set_phy_speed_mode(struct dwc3 *dwc);
>  #else
>  static inline int dwc3_host_init(struct dwc3 *dwc)
>  { return 0; }
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index eda8719..74e7d92 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -13,6 +13,7 @@
>  #include <linux/platform_device.h>
>  
>  #include "core.h"
> +#include "../host/xhci.h"
>  
>  static void dwc3_host_fill_xhci_irq_res(struct dwc3 *dwc,
>  					int irq, char *name)
> @@ -138,3 +139,27 @@ void dwc3_host_exit(struct dwc3 *dwc)
>  {
>  	platform_device_unregister(dwc->xhci);
>  }
> +
> +void dwc3_set_phy_speed_mode(struct dwc3 *dwc)

IMO the name is a bit confusing, it suggests that the speed at which
the PHY operates is changed, which isn't the case. I suggest to change
the name to dwc3_determine_phy_speed_mode() (or something similar).

> +{
> +
> +	int i, num_ports;
> +	u32 reg;
> +	struct usb_hcd	*hcd = platform_get_drvdata(dwc->xhci);
> +	struct xhci_hcd	*xhci_hcd = hcd_to_xhci(hcd);
> +
> +	dwc->hs_phy_mode = 0;
> +
> +	reg = readl(&xhci_hcd->cap_regs->hcs_params1);
> +
> +	num_ports = HCS_MAX_PORTS(reg);
> +	for (i = 0; i < num_ports; i++) {
> +		reg = readl(&xhci_hcd->op_regs->port_status_base + i * NUM_PORT_REGS);
> +		if (reg & PORT_PE) {
> +			if (DEV_HIGHSPEED(reg) || DEV_FULLSPEED(reg))
> +				dwc->hs_phy_mode |= PHY_MODE_USB_HOST_HS;
> +			else if (DEV_LOWSPEED(reg))
> +				dwc->hs_phy_mode |= PHY_MODE_USB_HOST_LS;
> +		}
> +	}
> +}
> -- 
> 2.7.4
> 
