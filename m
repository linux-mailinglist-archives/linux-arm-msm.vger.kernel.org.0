Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BDE845AA2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 18:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238658AbhKWRnx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 12:43:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234143AbhKWRnw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 12:43:52 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EAB0C061714
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 09:40:44 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id p17so18978834pgj.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 09:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CdO3e2pDhMNJ+/pMA6Znc3yR1BY8F0IUwXILZu7t3/g=;
        b=oVFTPn/YH2jTuPO2rvZ+bni4tcXtnBMXdNR2m3bx8ldO3dZEs97CiwZT15EpcQdIw5
         CHJxX2qEi+3nJ9dj5kISe86jLAzHVWGVOLGAPvE4npPJghtMEOv3rDU70yEexawgs7WX
         xnspRZEUUXaxP7YACnmStBcyCsl17/gyQCLF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CdO3e2pDhMNJ+/pMA6Znc3yR1BY8F0IUwXILZu7t3/g=;
        b=nccZZxBvRfrC63otvc412cqp6IuMPVPejTpKhO1Y/f/vr6FKNDSdkAxPMdEIzE/oZ5
         aICHINzueRbPHGyJJyb2sFELd0mq19qwvydG+Xrc8bB0OBLSU+t9SJ5kswIatb3GQpPI
         OB2svww76C2yxL0UWr03EQ97emeHDB0G8joR/dQSPJR7YCr1udqV3gJaieLryb6W4v+8
         KV4x3XbBqaBiXFh9W4BMoBmJNTIsL2nocHZSi8QbLR7G4Rm4GVabPPOVUN3IXLAqh+HB
         39l5M8oP03dcnakC2QjI47002uDN2Ac1wO7pGgXzK5soZDcJQJAE+vH44Fm2kDmQRnii
         wJ4w==
X-Gm-Message-State: AOAM5324Rj4RfAouBiQIDynBtBhC2uSXh78bYKhc4MfLXFO0rGK8B931
        AEzHHsVRy4DCacmwEcH/bsWonCD2PezgwQ==
X-Google-Smtp-Source: ABdhPJyHfEZlhram/t4364Twny6+kpl7aix7nHDqV8ZCLTjEJS/craA9npwH1mwvP0JxjD3EK7lt2Q==
X-Received: by 2002:a63:414:: with SMTP id 20mr5067331pge.178.1637689244184;
        Tue, 23 Nov 2021 09:40:44 -0800 (PST)
Received: from localhost ([2620:15c:202:201:5fa5:d920:9d68:9c16])
        by smtp.gmail.com with UTF8SMTPSA id i2sm13864246pfg.90.2021.11.23.09.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 09:40:43 -0800 (PST)
Date:   Tue, 23 Nov 2021 09:40:42 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sboyd@codeaurora.org,
        dianders@chromium.org, kgodara@codeaurora.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc7280: Define EC and H1 nodes
Message-ID: <YZ0nmrGHwIMdN2v6@google.com>
References: <1637650813-16654-1-git-send-email-rnayak@codeaurora.org>
 <1637650813-16654-4-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1637650813-16654-4-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 23, 2021 at 12:30:12PM +0530, Rajendra Nayak wrote:

> Subject: arm64: dts: qcom: sc7280: Define EC and H1 nodes

that seems to suggest that EC and H1 nodes are something generic of the
sc7280, however these two chips are only present on systems that target
Chrome OS, and the specific nodes are added are only used by the QCA
sc7280 IDP and CRD, not other sc7280 boards using Chrome OS, like
herobrine. I suggest to change it to "arm64: dts: qcom: sc7280: Define
EC and H1 nodes for IDP/CRD".

> From: Kshitiz Godara <kgodara@codeaurora.org>
> 
> The IDP2 and CRD boards share the EC and H1 parts, so define
> all related device nodes into a common file and include them
> in the idp2 and crd dts files to avoid duplication.
> 
> Signed-off-by: Kshitiz Godara <kgodara@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-crd.dts    |   1 +
>  arch/arm64/boot/dts/qcom/sc7280-ec-h1.dtsi | 110 +++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280-idp2.dts   |   1 +
>  3 files changed, 112 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-ec-h1.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> index 09d02c2..8c2aee6 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> @@ -8,6 +8,7 @@
>  /dts-v1/;
>  
>  #include "sc7280-idp.dtsi"
> +#include "sc7280-ec-h1.dtsi"
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. sc7280 CRD platform";
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-ec-h1.dtsi b/arch/arm64/boot/dts/qcom/sc7280-ec-h1.dtsi
> new file mode 100644
> index 0000000..78fb5eb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7280-ec-h1.dtsi

Similar comment as for the subject, the file name seems to imply
that the include could be useful for any board with an EC and H1,
however it will be only used by the IDP and CRD. Maybe name it
'sc7280-idp-ec-h1.dtsi', from the CRD DT file it is alreay clear
that it is related with the IDP, so it shouldn't be too confusing
that the file name only says IDP.

Also a birdie told me that the EC and H1 configuration is going to
change in future revisions of the CRD, which is another reason for
being more specific with the file name (a sc7280-crd-ec-h1.dtsi
might be needed at that point, or the new not-any-longer-shared
config goes directly into the sc7280-crd-revN.dts.

> @@ -0,0 +1,110 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * sc7280 EC/H1 over SPI (common between IDP2 and CRD)
> + *
> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + */
> +
> +ap_ec_spi: &spi10 {
> +	status = "okay";
> +
> +	pinctrl-0 = <&qup_spi10_cs_gpio_init_high>, <&qup_spi10_cs_gpio>;

Shouldn't this also have <&qup_spi10_data_clk>?

> +	cs-gpios = <&tlmm 43 GPIO_ACTIVE_LOW>;
> +
> +	cros_ec: ec@0 {
> +		compatible = "google,cros-ec-spi";
> +		reg = <0>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&ap_ec_int_l>;
> +		spi-max-frequency = <3000000>;
> +
> +		cros_ec_pwm: ec-pwm {
> +			compatible = "google,cros-ec-pwm";
> +			#pwm-cells = <1>;
> +		};
> +
> +		i2c_tunnel: i2c-tunnel {
> +			compatible = "google,cros-ec-i2c-tunnel";
> +			google,remote-bus = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		typec {
> +			compatible = "google,cros-ec-typec";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			usb_c0: connector@0 {
> +				compatible = "usb-c-connector";
> +				reg = <0>;
> +				label = "left";
> +				power-role = "dual";
> +				data-role = "host";
> +				try-power-role = "source";
> +			};
> +
> +			usb_c1: connector@1 {
> +				compatible = "usb-c-connector";
> +				reg = <1>;
> +				label = "right";
> +				power-role = "dual";
> +				data-role = "host";
> +				try-power-role = "source";
> +			};
> +		};
> +	};
> +};
> +
> +#include <arm/cros-ec-keyboard.dtsi>
> +#include <arm/cros-ec-sbs.dtsi>
> +
> +ap_h1_spi: &spi14 {
> +	status = "okay";
> +
> +	pinctrl-0 = <&qup_spi14_cs_gpio_init_high>, <&qup_spi14_cs_gpio>;

<&qup_spi14_data_clk> missing?

> +	cs-gpios = <&tlmm 59 GPIO_ACTIVE_LOW>;
> +
> +	cr50: tpm@0 {
> +		compatible = "google,cr50";
> +		reg = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&h1_ap_int_odl>;
> +		spi-max-frequency = <800000>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <104 IRQ_TYPE_EDGE_RISING>;
> +	};
> +};
> +
> +&tlmm {
> +	ap_ec_int_l: ap-ec-int-l {
> +		pins = "gpio18";
> +		function = "gpio";
> +		input-enable;
> +		bias-pull-up;
> +		drive-strength = <2>;

Is the explicit drive-strength setting actually needed?

Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml:

  drive-strength:
    enum: [2, 4, 6, 8, 10, 12, 14, 16]
    default: 2 <=
    description:
      Selects the drive strength for the specified pins, in mA.

The default is 2, hence it shouldn't be necessary it set it explicitly.

> +	};
> +
> +	h1_ap_int_odl: h1-ap-int-odl {
> +		pins = "gpio104";
> +		function = "gpio";
> +		input-enable;
> +		bias-pull-up;
> +		drive-strength = <2>;

see above

> +	};
> +
> +	qup_spi10_cs_gpio_init_high: qup-spi10-cs-gpio-init-high {
> +		pins = "gpio43";
> +		output-high;
> +		drive-strength = <2>;

see above

> +	};
> +
> +	qup_spi14_cs_gpio_init_high: qup-spi14-cs-gpio-init-high {
> +		pins = "gpio59";
> +		output-high;
> +		drive-strength = <2>;

see above

> +	};
> +};
> +
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
> index 3ae9969..208ca69 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
> @@ -8,6 +8,7 @@
>  /dts-v1/;
>  
>  #include "sc7280-idp.dtsi"
> +#include "sc7280-ec-h1.dtsi"
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. sc7280 IDP SKU2 platform";
