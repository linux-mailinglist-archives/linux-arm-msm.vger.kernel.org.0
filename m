Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB3A3BE26F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 07:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhGGFRl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 01:17:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbhGGFRi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 01:17:38 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04190C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jul 2021 22:14:58 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id z3so1193214oib.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 22:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sWI0MwVL7tUjizAU6sPQDWKC1BUe31htMOlyqwAiNeI=;
        b=MWAHDWDSvpucsScuTxVSMXWQGGRYtgUt9KQB1CgRtRA0N1UDW2eT4k4b6Nthf4iVfZ
         opwQyqPVKpl0YPF2aOW2hO0oYfSdYPybJgupNiuJzUOG949ImjbGBit725Hi+N+JqRYN
         qRgrHwmNVu/9uOcrd5P0efP0rkC5jW3p8sTlYs7UbYFxmMTXJ973WfdZMXVkwOnAeWpz
         cSdSdtUBz/cXPrMnB1T/Bn+KeTWa9iJqbG9r6t7t2ksHS0loS0S7IGG9hzBl1neNihTX
         vsNZ2ACO1ZiM+LAm58uzS4EZEvtw6taQD/wPGyfWbZ/9KZJuczufTByCUB30tHIHw1yD
         MMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sWI0MwVL7tUjizAU6sPQDWKC1BUe31htMOlyqwAiNeI=;
        b=CBUQ2sQH7aGg40HHqCz5REMxW3UQeJvXcbU3vHhkke/4XI7WNFgNyIpephSTftT05x
         CTFxvB6jV/g3hoZ4wMK0Mg9lodVj04KQgwyWH5DtgpZrPJyGfvzxTEvpIde2yxf2Jes5
         VoOEqmaAn55wsUm838e1u1otB/dJ8xAEZxeQlSRj5/tYXqIz4HjaLU/B/1fBYZpbjiux
         hnKArb8jqdAFTWNqQAnwVxfKens38EIL3qiEmlT18hb4isfkw6v0351Oj4T5PBc44w/f
         FJ7wTAX5MAtfU5+sOVVeQNJPADOcqlTLUXo7SLtzjElz8mjqAsLcpDxz5r71M2R5Dec0
         0hUQ==
X-Gm-Message-State: AOAM533u+zYkkdQCjeqG59xsjyNHdSs4eAwXzLIeMCc41XqfUY/neyF5
        kNwTDhroSyhFBMC0grhSJJSdQg==
X-Google-Smtp-Source: ABdhPJxxizfsvdUiQk+Rg8PWA2ZuOHCOthQlVNPl/d1C8odCiQp9nibhk+ivZkXluGBbqlpuP1+/jQ==
X-Received: by 2002:aca:3017:: with SMTP id w23mr1663077oiw.141.1625634897348;
        Tue, 06 Jul 2021 22:14:57 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m126sm3860034oib.55.2021.07.06.22.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 22:14:56 -0700 (PDT)
Date:   Wed, 7 Jul 2021 00:14:54 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     balbi@kernel.org, agross@kernel.org, gregkh@linuxfoundation.org,
        jackp@codeaurora.org, wcheng@codeaurora.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: dwc3: Add role switch relay support
Message-ID: <YOU4Tqol/CPzHNwM@yoga>
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210704013314.200951-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704013314.200951-3-bryan.odonoghue@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 03 Jul 20:33 CDT 2021, Bryan O'Donoghue wrote:

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

So you're going to rely on DT to create a role-switch link between the
dwc3 core driver and the qcom wrapper?

As I said the other day, this is just a hack to get around the fact that
of_platform_populate() may return before the dwc3 core has probed.

Another such case can be seen in [1], where Wesley is patching the DT
node in runtime in order to pass a boolean parameter between the two
driver parts.

If we fix that we don't need these kinds of workarounds.

[1] https://lore.kernel.org/linux-arm-msm/1625218655-14180-6-git-send-email-wcheng@codeaurora.org/

Regards,
Bjorn

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
