Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 960FF17CC9D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2020 08:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbgCGHUJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Mar 2020 02:20:09 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38235 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbgCGHUJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Mar 2020 02:20:09 -0500
Received: by mail-pf1-f195.google.com with SMTP id g21so2251599pfb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2020 23:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=e3PMYYBHQGex2U1IYow6ZhmcfHguiYqwTzhAXYhQp2g=;
        b=jW2BNI0m13J9kLuQvuXNLnXtrbLSv1uykgB+aL82tn77ODy9ZIoiKHtxQ1I5n8TVSl
         sAiZT3NOqvSMzS96NDpFRPc1B/nJ+IQEPGuZSKY1Oe3muoyHhsLuw09txYt6Z1Q1dIXN
         lFWdJu6uhqsfU/AR0uA2HdZb5IyjRRGZgyN84hJMZOPqUEX43wjM9k0h8JG2LSB/GxDp
         Dg2ow6Tc4jtJHCwZ2h7g2QmUYmlGXyT0aSm2tyCiMDjl1q45ZHWFNTQRo6Z0geFlJQjp
         ROq3jZ/hA7lN55+lmi2qXsEFenbkr5+qF6Wd/z23ILScvrlQuW1+NoZL1hLnRzQG3BnE
         WLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=e3PMYYBHQGex2U1IYow6ZhmcfHguiYqwTzhAXYhQp2g=;
        b=JM5zn3Eh9nTkD76RKzgSXQquocgyB1hdUwLU9sXHcTnbqDegT1ckQtGIR+cnzzMsAP
         JR/MxWoxTeFwTnhepEFbj+cJ33YgHGrjJ5k1J3p8GNDp1q3GtXsZeWtWQYPMUzxvccnS
         tTD4sEWVuwQjlYKQR9sPyv3pz/zX8luDsJtqDVTfd3VINyKP3Djhv7z7y6jbVdYXfLBy
         RS2fpijQVC2Hu5g1eMhf8Sw1m90DMCXSxEI5v6Xsj1AwTENZtDs+m6upX7NwhgOdu46o
         oFMKMmoYlWzj56IsU86CH/FETblhphHqRaDSh0dbZmddhhl0TgfixJW58c/8OxiF7RIh
         m2dQ==
X-Gm-Message-State: ANhLgQ1YpAhbwgGOjoHMwqtA2ZVfqXXUG9eegazjzSBDXMEUj/koosf2
        bQLfab5sOqPc+gJwU7iPGJio6g==
X-Google-Smtp-Source: ADFU+vt5OUcqIil2Ct4vz63TlxrwHEsqPTuii1IorFFwcmTz22ozqVVbfCRZsWhbsRGbPxnR73O5PA==
X-Received: by 2002:a62:fb07:: with SMTP id x7mr7417872pfm.125.1583565607694;
        Fri, 06 Mar 2020 23:20:07 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y14sm8776103pfp.59.2020.03.06.23.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 23:20:06 -0800 (PST)
Date:   Fri, 6 Mar 2020 23:20:04 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        robh@kernel.org, linux-kernel@vger.kernel.org,
        Yu Chen <chenyu56@huawei.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Guillaume Gardet <Guillaume.Gardet@arm.com>,
        devicetree@vger.kernel.org, John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v7 06/18] usb: dwc3: Registering a role switch in the DRD
 code.
Message-ID: <20200307072004.GI1094083@builder>
References: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
 <20200303171159.246992-7-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303171159.246992-7-bryan.odonoghue@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 03 Mar 09:11 PST 2020, Bryan O'Donoghue wrote:

> From: Yu Chen <chenyu56@huawei.com>
> 
> The Type-C drivers use USB role switch API to inform the
> system about the negotiated data role, so registering a role
> switch in the DRD code in order to support platforms with
> USB Type-C connectors.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> CC: ShuFan Lee <shufan_lee@richtek.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Cc: Yu Chen <chenyu56@huawei.com>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: Jun Li <lijun.kernel@gmail.com>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: Guillaume Gardet <Guillaume.Gardet@arm.com>
> Cc: Jack Pham <jackp@codeaurora.org>
> Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Cc: linux-usb@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Yu Chen <chenyu56@huawei.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  drivers/usb/dwc3/core.h |  3 ++
>  drivers/usb/dwc3/drd.c  | 77 ++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 79 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 77c4a9abe365..a99e57636172 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -25,6 +25,7 @@
>  #include <linux/usb/ch9.h>
>  #include <linux/usb/gadget.h>
>  #include <linux/usb/otg.h>
> +#include <linux/usb/role.h>
>  #include <linux/ulpi/interface.h>
>  
>  #include <linux/phy/phy.h>
> @@ -953,6 +954,7 @@ struct dwc3_scratchpad_array {
>   * @hsphy_mode: UTMI phy mode, one of following:
>   *		- USBPHY_INTERFACE_MODE_UTMI
>   *		- USBPHY_INTERFACE_MODE_UTMIW
> + * @role_sw: usb_role_switch handle
>   * @usb2_phy: pointer to USB2 PHY
>   * @usb3_phy: pointer to USB3 PHY
>   * @usb2_generic_phy: pointer to USB2 PHY
> @@ -1086,6 +1088,7 @@ struct dwc3 {
>  	struct extcon_dev	*edev;
>  	struct notifier_block	edev_nb;
>  	enum usb_phy_interface	hsphy_mode;
> +	struct usb_role_switch	*role_sw;
>  
>  	u32			fladj;
>  	u32			irq_gadget;
> diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> index c946d64142ad..331c6e997f0c 100644
> --- a/drivers/usb/dwc3/drd.c
> +++ b/drivers/usb/dwc3/drd.c
> @@ -476,6 +476,73 @@ static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
>  	return edev;
>  }
>  
> +#if IS_ENABLED(CONFIG_USB_ROLE_SWITCH)
> +#define ROLE_SWITCH 1
> +static int dwc3_usb_role_switch_set(struct device *dev, enum usb_role role)

The prototype for set and get was changed in 'bce3052f0c16 ("usb: roles:
Provide the switch drivers handle to the switch in the API")', so this
no longer compiles.

The new prototype should be:
static int dwc3_usb_role_switch_set(struct usb_role_switch *sw, enum usb_role role)

> +{
> +	struct dwc3 *dwc = dev_get_drvdata(dev);

And this would then be:
	struct dwc3 *dwc = usb_role_switch_get_drvdata(sw);

> +	u32 mode;
> +
> +	switch (role) {
> +	case USB_ROLE_HOST:
> +		mode = DWC3_GCTL_PRTCAP_HOST;
> +		break;
> +	case USB_ROLE_DEVICE:
> +		mode = DWC3_GCTL_PRTCAP_DEVICE;
> +		break;
> +	default:
> +		mode = DWC3_GCTL_PRTCAP_DEVICE;
> +		break;
> +	}
> +
> +	dwc3_set_mode(dwc, mode);
> +	return 0;
> +}
> +
> +static enum usb_role dwc3_usb_role_switch_get(struct device *dev)

static enum usb_role dwc3_usb_role_switch_get(struct usb_role_switch sw)

> +{
> +	struct dwc3 *dwc = dev_get_drvdata(dev);

	struct dwc3 *dwc = usb_role_switch_get_drvdata(sw);

> +	unsigned long flags;
> +	enum usb_role role;
> +
> +	spin_lock_irqsave(&dwc->lock, flags);
> +	switch (dwc->current_dr_role) {
> +	case DWC3_GCTL_PRTCAP_HOST:
> +		role = USB_ROLE_HOST;
> +		break;
> +	case DWC3_GCTL_PRTCAP_DEVICE:
> +		role = USB_ROLE_DEVICE;
> +		break;
> +	case DWC3_GCTL_PRTCAP_OTG:
> +		role = dwc->current_otg_role;
> +		break;
> +	default:
> +		role = USB_ROLE_DEVICE;
> +		break;
> +	}
> +	spin_unlock_irqrestore(&dwc->lock, flags);
> +	return role;
> +}
> +
> +static int dwc3_setup_role_switch(struct dwc3 *dwc)
> +{
> +	struct usb_role_switch_desc dwc3_role_switch = {NULL};
> +
> +	dwc3_role_switch.fwnode = dev_fwnode(dwc->dev);
> +	dwc3_role_switch.set = dwc3_usb_role_switch_set;
> +	dwc3_role_switch.get = dwc3_usb_role_switch_get;

And you need to pass dwc as .driver_data here:

	dwc3_role_switch.driver_data = dwc;

With this the series compiles and both dwc3 devices probes nicely. I
haven't done any further testing though...

Regards,
Bjorn

> +	dwc->role_sw = usb_role_switch_register(dwc->dev, &dwc3_role_switch);
> +	if (IS_ERR(dwc->role_sw))
> +		return PTR_ERR(dwc->role_sw);
> +
> +	dwc3_set_mode(dwc, DWC3_GCTL_PRTCAP_DEVICE);
> +	return 0;
> +}
> +#else
> +#define ROLE_SWITCH 0
> +#define dwc3_setup_role_switch(x) 0
> +#endif
> +
>  int dwc3_drd_init(struct dwc3 *dwc)
>  {
>  	int ret, irq;
> @@ -484,7 +551,12 @@ int dwc3_drd_init(struct dwc3 *dwc)
>  	if (IS_ERR(dwc->edev))
>  		return PTR_ERR(dwc->edev);
>  
> -	if (dwc->edev) {
> +	if (ROLE_SWITCH &&
> +	    device_property_read_bool(dwc->dev, "usb-role-switch")) {
> +		ret = dwc3_setup_role_switch(dwc);
> +		if (ret < 0)
> +			return ret;
> +	} else if (dwc->edev) {
>  		dwc->edev_nb.notifier_call = dwc3_drd_notifier;
>  		ret = extcon_register_notifier(dwc->edev, EXTCON_USB_HOST,
>  					       &dwc->edev_nb);
> @@ -531,6 +603,9 @@ void dwc3_drd_exit(struct dwc3 *dwc)
>  {
>  	unsigned long flags;
>  
> +	if (dwc->role_sw)
> +		usb_role_switch_unregister(dwc->role_sw);
> +
>  	if (dwc->edev)
>  		extcon_unregister_notifier(dwc->edev, EXTCON_USB_HOST,
>  					   &dwc->edev_nb);
> -- 
> 2.25.1
> 
