Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5E93BC4EC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 04:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbhGFCyP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jul 2021 22:54:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:37872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229879AbhGFCyO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jul 2021 22:54:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A558D6109D;
        Tue,  6 Jul 2021 02:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625539896;
        bh=DOj5t4ByBa5Zd1xRABEC1HHiGOWLQi/qVtIsko5gLFM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZrnCCTY3T1Q4l7y+WZGxF63CrFnQDzjbRcO4XPnpdkliU7o2FHbRNSGUrW7S+PUyb
         +H5SC3SP6AyjwBBiBFosayq7Na0koPEdrmCsbiypI9qllsMTCmTl0wKbpCVgMvPJ7C
         29FEFnaZVJ+nXTk82Tpp3LOOu1u2HHagq4/EN+eM7pjCa+6DRGroaJ4QoINRFKw2rn
         57xkvFpi86Q5qL55HMcMUyPirussFssY//kly3rVz8DQwzwUpGzU/Q2AhXGNlKETB7
         TfvKnBdf0+1xJZJ3OKmQ2V40e/oaVC6SN9WkEIr6peAS3V7JRB9L8hcoRfaDj9wsSy
         gIwxi8kzSuztg==
Date:   Tue, 6 Jul 2021 10:51:30 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     balbi@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org,
        wcheng@codeaurora.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: dwc3: Add role switch relay support
Message-ID: <20210706025130.GA19460@nchen>
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210704013314.200951-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704013314.200951-3-bryan.odonoghue@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-07-04 02:33:13, Bryan O'Donoghue wrote:
> Add the ability to relay a role switch message from the core to the parent
> device of the controller.
> 
> This is useful for the qcom-dwc3 wrapper which wants to receive role-switch
> notifications in order to waggle internal SoC UTMI signals.
> 
> Having the core trigger the parent wrapper has the advantage of keeping the
> connector mechanism agnostic from dwc3 wrapper code and means that any
> other wrapper implementation on any other SoC or architecture need not
> write custom code to find various types of Type-C role switch mechanisms.

If I understand correctly, the call trace like below:

Connector (GPIO/Type-C, usb_role_switch_set_role) -> dwc3 core (func: dwc3_usb_role_switch_set)
-> dwc3 qcom glue (func: dwc3_qcom_usb_role_switch_set)

And, at dts, the property "usb-role-switch" will be at both dwc3 glue and core node
dwc3 core is the connector (GPIO/Type-C)'s role switch 
dwc3 glue is the dwc3 core's role switch

right?

Peter

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/usb/dwc3/core.h |  2 ++
>  drivers/usb/dwc3/drd.c  | 10 ++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index dccdf13b5f9e..974104cc16f7 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -993,6 +993,7 @@ struct dwc3_scratchpad_array {
>   *		- USBPHY_INTERFACE_MODE_UTMI
>   *		- USBPHY_INTERFACE_MODE_UTMIW
>   * @role_sw: usb_role_switch handle
> + * @role_sw_relay: usb_role_switch relay handle
>   * @role_switch_default_mode: default operation mode of controller while
>   *			usb role is USB_ROLE_NONE.
>   * @usb_psy: pointer to power supply interface.
> @@ -1136,6 +1137,7 @@ struct dwc3 {
>  	struct notifier_block	edev_nb;
>  	enum usb_phy_interface	hsphy_mode;
>  	struct usb_role_switch	*role_sw;
> +	struct usb_role_switch	*role_sw_relay;
>  	enum usb_dr_mode	role_switch_default_mode;
>  
>  	struct power_supply	*usb_psy;
> diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> index 8fcbac10510c..74293861bd8f 100644
> --- a/drivers/usb/dwc3/drd.c
> +++ b/drivers/usb/dwc3/drd.c
> @@ -507,6 +507,9 @@ static int dwc3_usb_role_switch_set(struct usb_role_switch *sw,
>  	}
>  
>  	dwc3_set_mode(dwc, mode);
> +	if (dwc->role_sw_relay)
> +		usb_role_switch_set_role(dwc->role_sw_relay, role);
> +
>  	return 0;
>  }
>  
> @@ -563,6 +566,10 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
>  	if (IS_ERR(dwc->role_sw))
>  		return PTR_ERR(dwc->role_sw);
>  
> +	dwc->role_sw_relay = usb_role_switch_get(dwc->dev);
> +	if (IS_ERR(dwc->role_sw_relay))
> +		return PTR_ERR(dwc->role_sw_relay);
> +
>  	dwc3_set_mode(dwc, mode);
>  	return 0;
>  }
> @@ -630,6 +637,9 @@ void dwc3_drd_exit(struct dwc3 *dwc)
>  {
>  	unsigned long flags;
>  
> +	if (dwc->role_sw_relay)
> +		usb_role_switch_put(dwc->role_sw_relay);
> +
>  	if (dwc->role_sw)
>  		usb_role_switch_unregister(dwc->role_sw);
>  
> -- 
> 2.30.1
> 

-- 

Thanks,
Peter Chen

