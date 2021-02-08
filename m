Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11219313D76
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235545AbhBHS1e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:27:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234181AbhBHS04 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:26:56 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 241D6C06178A
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Feb 2021 10:26:16 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id m7so16575326oiw.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Feb 2021 10:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w2bs1jNylzHBAeRpSQWmE5k5+qmesQnum/GX7yJm6Do=;
        b=eC0jYKs11Hzwuqg/IM7punueI3VwBVmIeAz5s/MMxL93H7G/sk6ozb9JLILF8rxS6p
         cAfx3TcRCB3TOUr09alnw4r3uKzdnj6wvWJ7jnJmttHEZ6NG1CeRer6M9yKagylpSjVC
         1E+JPJxvXOXj6jbxpTfEpnlXGjonDeX4/nDbbyxIwei9XZj5fp8+e/F+ku+1+UvHIkLp
         LDyh1MU11nDAjM4x4qKwRdapMJTAAZXZdQGJ1m0MF5gUYyf64VmFNNZ7cB28zzR3RIds
         ZnSWBnQzv4wOg04aw20dlV16VA4jLg4yKmhzbTCcRKmhlzS84uaLDjlG3HNCEES0yY23
         6TRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w2bs1jNylzHBAeRpSQWmE5k5+qmesQnum/GX7yJm6Do=;
        b=P9aqj+hTBPvHaXJ5YxbVphsFKv4GGX/5/bf2JNdqg0oobppXfkV1eaQiZwERG6rsM5
         6dJVuo0adCmTHD3DymUyFFp2YDZ20CuhkyfjJvgwf4JoU3vNIeNtaSjCDQ3pPwjL4Bl5
         4bbCOGxGKzEYQ5uDMDgzHr4iRwLZQyavzn9vjDqjbKp5aBJgjkBl4HfNCKFPWrRTWaQz
         Fe2s5pumwC/cZ6XR5iNVhljaf+QBoN187tAXEjlBUN3uQ/FtXQvc11ke8A6HEx1OZBkn
         X4Zs3nite8lNyDwPunAMA7or9qhV6U/tSXMdb6lKWyxXP8F4UJfioxDghwqLT/21f/HM
         MnRg==
X-Gm-Message-State: AOAM533c83NupkF2HQqMwF9c/n6M+32k/ImiUaWgfX6JDQDpIOqjNYav
        1WD1TcPm7Funf5ry1VH1WPb30A==
X-Google-Smtp-Source: ABdhPJxlojqvFU7c81BNhmI5mz56dvLqoVVxbKceJGrel8NuoQVVZC0Jf97UResasi5bkkD0bP0Q0Q==
X-Received: by 2002:aca:72cf:: with SMTP id p198mr38522oic.51.1612808775552;
        Mon, 08 Feb 2021 10:26:15 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e6sm2939112otl.63.2021.02.08.10.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 10:26:14 -0800 (PST)
Date:   Mon, 8 Feb 2021 12:26:13 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Kathiravan T <kathirav@codeaurora.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: reference clock configuration
Message-ID: <YCGCRQpqVNI2KZyi@builder.lan>
References: <8fc38cb73afd31269f1ea0c28e73604c53cebb17.1612764006.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fc38cb73afd31269f1ea0c28e73604c53cebb17.1612764006.git.baruch@tkos.co.il>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 08 Feb 00:00 CST 2021, Baruch Siach wrote:

> From: Balaji Prakash J <bjagadee@codeaurora.org>
> 
> DWC_USB3_GFLADJ and DWC_USB3_GUCTL registers contain options
> to control the behavior of controller with respect to SOF and ITP.
> The reset values of these registers are aligned for 19.2 MHz
> reference clock source. This change will add option to override
> these settings for reference clock other than 19.2 MHz
> 
> Tested on IPQ6018 SoC based CP01 board with 24MHz reference clock.
> 
> Signed-off-by: Balaji Prakash J <bjagadee@codeaurora.org>
> [ baruch: mention tested hardware ]
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../devicetree/bindings/usb/dwc3.txt          |  5 ++
>  drivers/usb/dwc3/core.c                       | 52 +++++++++++++++++++
>  drivers/usb/dwc3/core.h                       | 12 +++++
>  3 files changed, 69 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 1aae2b6160c1..4ffa87b697dc 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -89,6 +89,11 @@ Optional properties:
>   - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
>  	register for post-silicon frame length adjustment when the
>  	fladj_30mhz_sdbnd signal is invalid or incorrect.
> + - snps,quirk-ref-clock-adjustment: Value for GFLADJ_REFCLK_* fields of GFLADJ
> +	register for reference clock other than 19.2 MHz is used.

What are typical values for this property? What unit does it have? How
does it actually relate to the frequency of the reference clock?

> + - snps,quirk-ref-clock-period: Value for REFCLKPER filed of GUCTL. This field
> +	indicates in terms of nano seconds the period of ref_clk. To calculate the
> +	ideal value, REFCLKPER = (1/ref_clk in Hz)*10^9.

Can't we make the dwc3 reference this clock and use clk_get_rate() and
then do this math in the driver?

>   - snps,rx-thr-num-pkt-prd: periodic ESS RX packet threshold count - host mode
>  			only. Set this and rx-max-burst-prd to a valid,
>  			non-zero value 1-16 (DWC_usb31 programming guide
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 841daec70b6e..85e40ec8e23b 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -325,6 +325,48 @@ static void dwc3_frame_length_adjustment(struct dwc3 *dwc)
>  	}
>  }
>  
> +/**
> + * dwc3_ref_clk_adjustment - Reference clock settings for SOF and ITP
> + *		Default reference clock configurations are calculated assuming
> + *		19.2 MHz clock source. For other clock source, this will set
> + *		configuration in DWC3_GFLADJ register
> + * @dwc: Pointer to our controller context structure
> + */
> +static void dwc3_ref_clk_adjustment(struct dwc3 *dwc)
> +{
> +	u32 reg;
> +
> +	if (dwc->ref_clk_adj == 0)
> +		return;
> +
> +	reg = dwc3_readl(dwc->regs, DWC3_GFLADJ);
> +	reg &= ~DWC3_GFLADJ_REFCLK_MASK;
> +	reg |=  (dwc->ref_clk_adj << DWC3_GFLADJ_REFCLK_SEL);

	reg = FIELD_SET(DWC3_GFLADJ_REFCLK_MASK, adj, reg);

Regards,
Bjorn

> +	dwc3_writel(dwc->regs, DWC3_GFLADJ, reg);
> +}
> +
> +/**
> + * dwc3_ref_clk_period - Reference clock period configuration
> + *		Default reference clock period is calculated assuming
> + *		19.2 MHz as clock source. For other clock source, this
> + *		will set clock period in DWC3_GUCTL register
> + * @dwc: Pointer to our controller context structure
> + * @ref_clk_per: reference clock period in ns
> + */
> +static void dwc3_ref_clk_period(struct dwc3 *dwc)
> +{
> +	u32 reg;
> +
> +	if (dwc->ref_clk_per == 0)
> +		return;
> +
> +	reg = dwc3_readl(dwc->regs, DWC3_GUCTL);
> +	reg &= ~DWC3_GUCTL_REFCLKPER_MASK;
> +	reg |=  (dwc->ref_clk_per << DWC3_GUCTL_REFCLKPER_SEL);
> +	dwc3_writel(dwc->regs, DWC3_GUCTL, reg);
> +}
> +
> +
>  /**
>   * dwc3_free_one_event_buffer - Frees one event buffer
>   * @dwc: Pointer to our controller context structure
> @@ -982,6 +1024,12 @@ static int dwc3_core_init(struct dwc3 *dwc)
>  	/* Adjust Frame Length */
>  	dwc3_frame_length_adjustment(dwc);
>  
> +	/* Adjust Reference Clock Settings */
> +	dwc3_ref_clk_adjustment(dwc);
> +
> +	/* Adjust Reference Clock Period */
> +	dwc3_ref_clk_period(dwc);
> +
>  	dwc3_set_incr_burst_type(dwc);
>  
>  	usb_phy_set_suspend(dwc->usb2_phy, 0);
> @@ -1351,6 +1399,10 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>  				    &dwc->hsphy_interface);
>  	device_property_read_u32(dev, "snps,quirk-frame-length-adjustment",
>  				 &dwc->fladj);
> +	device_property_read_u32(dev, "snps,quirk-ref-clock-adjustment",
> +				 &dwc->ref_clk_adj);
> +	device_property_read_u32(dev, "snps,quirk-ref-clock-period",
> +				 &dwc->ref_clk_per);
>  
>  	dwc->dis_metastability_quirk = device_property_read_bool(dev,
>  				"snps,dis_metastability_quirk");
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 1b241f937d8f..469e94512414 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -379,6 +379,14 @@
>  #define DWC3_GFLADJ_30MHZ_SDBND_SEL		BIT(7)
>  #define DWC3_GFLADJ_30MHZ_MASK			0x3f
>  
> +/* Global User Control Register*/
> +#define DWC3_GUCTL_REFCLKPER_MASK		0xffc00000
> +#define DWC3_GUCTL_REFCLKPER_SEL		22
> +
> +/* Global reference clock Adjustment Register */
> +#define DWC3_GFLADJ_REFCLK_MASK			0xffffff00
> +#define DWC3_GFLADJ_REFCLK_SEL			8
> +
>  /* Global User Control Register 2 */
>  #define DWC3_GUCTL2_RST_ACTBITLATER		BIT(14)
>  
> @@ -956,6 +964,8 @@ struct dwc3_scratchpad_array {
>   * @regs: base address for our registers
>   * @regs_size: address space size
>   * @fladj: frame length adjustment
> + * @ref_clk_adj: reference clock adjustment
> + * @ref_clk_per: reference clock period configuration
>   * @irq_gadget: peripheral controller's IRQ number
>   * @otg_irq: IRQ number for OTG IRQs
>   * @current_otg_role: current role of operation while using the OTG block
> @@ -1118,6 +1128,8 @@ struct dwc3 {
>  	enum usb_dr_mode	role_switch_default_mode;
>  
>  	u32			fladj;
> +	u32			ref_clk_adj;
> +	u32			ref_clk_per;
>  	u32			irq_gadget;
>  	u32			otg_irq;
>  	u32			current_otg_role;
> -- 
> 2.30.0
> 
