Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 760E414A9F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2020 19:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgA0Snu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 13:43:50 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38904 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgA0Snu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 13:43:50 -0500
Received: by mail-oi1-f196.google.com with SMTP id l9so7664757oii.5;
        Mon, 27 Jan 2020 10:43:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kuhUPMd+zYAgWz6fKJAfj/zyuyEErCMf41bcAyXMeG8=;
        b=GvO/IGeMEQ/n6o1TDVcm7TOkp9xkm6akeyOZuxAnzMZT1NTci+tftLDBp3efhM9Wm1
         yCSDN7gOptxoRjPjFUbCk2MdcNB9tG+AexGSrddHULfMuwXeSy8Ey9OmvXQxt+d65EU7
         Sm9uXUhVwsk6cSeOPd9Yr4dwnXzwHAo5nse/ef1qUTjxs5es/HJTUI5V3MNnKPeiF0NT
         JblVvtqVC2yN+dCSL5VUOpnqbtzuYqJtl/c77iI5J2vCk4CkRD2+zH3cc3nlmv1F0rwq
         pCtnF3+uSENCR3cR760yD9UdNGV4OBpnxS8WfM229cJh/Ik9ptYtDDQDpss0g9mirZ0u
         Gxgg==
X-Gm-Message-State: APjAAAUGShexsL4LAkPwZqY8pLxcPHU4xRbOi5KHtF5jAFGSak7zx6uG
        Ht7bMGMM3xslshOJvZJdDjIemyk=
X-Google-Smtp-Source: APXvYqwIL62yTsib7ww0bYJgMGDd0XRUETmkoyWk4Mw/rwMUqd3hSP/eIsHvDGeYCHovkA1uBnb0dQ==
X-Received: by 2002:a05:6808:9ba:: with SMTP id e26mr295469oig.81.1580150629151;
        Mon, 27 Jan 2020 10:43:49 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t21sm4326765otr.42.2020.01.27.10.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 10:43:48 -0800 (PST)
Received: (nullmailer pid 3867 invoked by uid 1000);
        Mon, 27 Jan 2020 18:43:47 -0000
Date:   Mon, 27 Jan 2020 12:43:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 06/19] dt-bindings: usb: dwc3: Add a
 gpio-usb-connector description
Message-ID: <20200127184347.GA27080@bogus>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
 <20200122185610.131930-7-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200122185610.131930-7-bryan.odonoghue@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 22, 2020 at 06:55:57PM +0000, Bryan O'Donoghue wrote:
> A USB connector should be a child node of the USB controller
> connector/usb-connector.txt. This patch adds a property
> "gpio_usb_connector" which declares a connector child device. Code in the
> DWC3 driver will then
> 
> - Search for "gpio_usb_controller"
> - Do an of_platform_populate() if found
> 
> This will have the effect of making the declared node a child of the USB
> controller and will make sure that USB role-switch events detected with the
> gpio_usb_controller driver propagate into the DWC3 controller code
> appropriately.

This is all driver specifics. This is a binding patch.

> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-usb@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 66780a47ad85..b019bd472f83 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -108,6 +108,9 @@ Optional properties:
>  			When just one value, which means INCRX burst mode enabled. When
>  			more than one value, which means undefined length INCR burst type
>  			enabled. The values can be 1, 4, 8, 16, 32, 64, 128 and 256.
> + - gpio_usb_connector: Declares a USB connector named 'gpio_usb_connector' as a
> +		       child node of the DWC3 block. Use when modelling a USB
> +		       connector based on the gpio-usb-b-connector driver.

Should be just 'connector'. That's already implicitly allowed for any 
USB controller, so you don't really need a binding change. And the 
specific type of connector is outside the scope of the DWC3 binding.

>  
>   - in addition all properties from usb-xhci.txt from the current directory are
>     supported as well
> @@ -121,4 +124,12 @@ dwc3@4a030000 {
>  	interrupts = <0 92 4>
>  	usb-phy = <&usb2_phy>, <&usb3,phy>;
>  	snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
> +	usb_con: gpio_usb_connector {
> +		compatible = "gpio-usb-b-connector";
> +		id-gpio = <&tlmm 116 GPIO_ACTIVE_HIGH>;
> +		vbus-gpio = <&pms405_gpios 12 GPIO_ACTIVE_HIGH>;

*-gpios is the preferred form and should be what's documented.

> +		vbus-supply = <&usb3_vbus_reg>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb3_id_pin>, <&usb3_vbus_pin>;
> +	};
>  };
> -- 
> 2.25.0
> 
