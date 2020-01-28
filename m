Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51AA314C143
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 20:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgA1Tx0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 14:53:26 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46660 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbgA1Tx0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 14:53:26 -0500
Received: by mail-pg1-f194.google.com with SMTP id z124so7543163pgb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2020 11:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fd0Bf5ciOLDTzu4NvqY5lz18CA8ytAWcDkClCt4wOyA=;
        b=VzBbyfrXVyTu7+qADXfLaD3EjrI4fRju5zzq6rggViLj1t/lQA5k01gHSHLjHTTFQD
         1W4boLRmulXdcHOS3sn7t2I4ZwVPsNWq2uq9VvKzMNc/jboiF6Mml59qVjX5mB5mZQaL
         ZOuCxQKhPWuI9boE0o/Y/80zNA7ioPQIGtPa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fd0Bf5ciOLDTzu4NvqY5lz18CA8ytAWcDkClCt4wOyA=;
        b=IXLZco2WchBQc7T7JqvEJ36C5qBtQszF8NKyRbgSt8E1ST9laCzzup4Gz87B9SZdrW
         DneQj7eGDOSjKwpjxF/05klSWi57pTFhvzFhoW3fwhwhzSIaZHrbT95w6LK9U2iwmH1H
         5NjlBX3crsT1AoaK3xWIZGZHGkARejNeneKT8B2D4Oo98pZpt9DjI7qMfqmsw1So8u+s
         2pXMhIpHkqZKB7MvqFOlGR33/dhFnBvHRYmDQpdhJLQlmC3Jhiiji9aWTD/HDdw2tNfl
         KuGJaRSUH/SMr46nAssbPbaNirItLvAjeLfjQtOkYblnAFwuQUyyKFFTM2jHndYrSMxd
         yJwg==
X-Gm-Message-State: APjAAAVDTarD/5Es3HWphN2TrGorvbmp1yapVC8U8jLFvQb8bD/vzK/9
        2sNyRRrCbI0g9A30l/liO7DEOv+LOCE=
X-Google-Smtp-Source: APXvYqxnNBwdER95BEHw3GteU6AfO0/0iBE9siRHXhDTs3M6ALIsjR66bbcQH9s8Amw+OkFTtECJBw==
X-Received: by 2002:a65:484d:: with SMTP id i13mr27036413pgs.32.1580241205473;
        Tue, 28 Jan 2020 11:53:25 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id w3sm20442356pgj.48.2020.01.28.11.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2020 11:53:24 -0800 (PST)
Date:   Tue, 28 Jan 2020 11:53:23 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org
Subject: Re: [v1] arm64: dts: sc7180: add dsi controller and phy entries for
 idp dts
Message-ID: <20200128195323.GC46072@google.com>
References: <1580218617-30293-1-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1580218617-30293-1-git-send-email-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jan 28, 2020 at 07:06:57PM +0530, Harigovindan P wrote:
> Adding dsi controller and phy entries for idp dt.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 56 +++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 388f50a..9f42367 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -7,6 +7,7 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sc7180.dtsi"
>  #include "pm6150.dtsi"
> @@ -232,6 +233,50 @@
>  	};
>  };
>  
> +&dsi_controller {
> +	status = "okay";
> +
> +	vdda-supply = <&vreg_l3c_1p2>;
> +
> +	panel@0 {
> +		compatible = "visionox,rm69299-1080p-display";

This depends on the series "Add support for rm69299 Visionox panel
driver and add devicetree bindings for visionox panel"
(https://patchwork.kernel.org/cover/11320773/) which hasn't landed
IIUC. This should be mentioned after '---'.

> +		reg = <0>;
> +
> +		vdda-supply = <&vreg_l8c_1p8>;
> +		vdd3p3-supply = <&vreg_l18a_2p8>;
> +
> +		pinctrl-names = "default", "suspend";
> +		pinctrl-0 = <&disp_pins_default>;
> +		pinctrl-1 = <&disp_pins_default>;

Is there a point for listing a suspend configuration if it is the same
as the default?

> +		reset-gpios = <&pm6150l_gpio 3 GPIO_ACTIVE_HIGH>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			port@0 {
> +				reg = <0>;
> +				panel0_in: endpoint {
> +					remote-endpoint = <&dsi0_out>;

The 'dsi0_out' node is added by 'arm64: dts: sc7180: add display dt nodes'
(https://patchwork.kernel.org/patch/11354253/), which has not landed. So
either you should list it as dependency below the commit message, or
(probably better) send the two patches in the same series.

> +				};
> +			};
> +		};
> +	};
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&panel0_in>;
> +				data-lanes = <0 1 2 3>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi_phy {

Also this node does not exist yet, it also depends on the patch mentioned
above.

> +	status = "okay";
> +};
> +
>  &qspi {
>  	status = "okay";
>  	pinctrl-names = "default";
> @@ -289,6 +334,17 @@
>  
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
>  
> +&pm6150l_gpio {
> +	disp_pins_default: disp-pins-default{

nit: missing blank before curly brace

If there is no suspend configuration you can get rid of the 'default'
suffix.

Since this is only a single pin I would suggest to use a name that
describes the function of the pin or the name used in the schematic
instead of 'disp-pins'.

Thanks

Matthias
