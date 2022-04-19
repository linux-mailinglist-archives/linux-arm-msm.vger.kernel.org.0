Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47514507A1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 21:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355520AbiDSTXL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 15:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346734AbiDSTXI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 15:23:08 -0400
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 321E011C08;
        Tue, 19 Apr 2022 12:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1650396013;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=/S7QQNXSIodjS291auN45CN/uRH39zC/cKPVcmR9cQw=;
    b=iqA5s4xJ0Gdw+lqdEAk13JM/YZsO9TUujYw48QAUMy9JiqOKoM2kKiyMxr+aLg4aJ8
    UmQwB0EV6GYZR7OH9wtmyGad33+3lreA6jSmDQx1Ix1CSILoTTNN6Px9H0gs9aGRwnNR
    PeYr9C/BIdD1XkSjignq7vDx57zsDVP3XiQxKQwowx5wv9XKVOyGOoFckYRK3gAnLRpL
    9WcZdgpKGwPF9TCAVcPg7jC0S7vLwdhzzz0CoA/QgJCdnmkABMwJM1cpCEAnNY1Pc9/D
    AY1kgEowibDwrsCNIFj/VbIBLxvLZRSmMkazdcv2RPGFKJLz7QAkRMnr8/Z0xvLaHlPe
    CwZQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrK88/6Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.42.2 AUTH)
    with ESMTPSA id u05e50y3JJKCuUX
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 19 Apr 2022 21:20:12 +0200 (CEST)
Date:   Tue, 19 Apr 2022 21:20:11 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, shawn.guo@linaro.org,
        jun.nie@linaro.org, benl@squareup.com, jwillcox@squareup.com,
        jgates@squareup.com, mchen@squareup.com, zac@squareup.com,
        Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v1 3/4] arm64: dts: Add aqp8039-t2 board
Message-ID: <Yl8La/pFbQJNUQTy@gerhold.net>
References: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
 <20220419010903.3109514-4-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419010903.3109514-4-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 19, 2022 at 02:09:02AM +0100, Bryan O'Donoghue wrote:
> The apq8039-t2 is an apq8039/msm8939 based board paired with a wcn3680b
> WiFi chipset.
>
> [...]
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/apq8039-t2-pinctl.dtsi      | 277 +++++++++++++++
>  arch/arm64/boot/dts/qcom/apq8039-t2.dts       | 326 ++++++++++++++++++
>  3 files changed, 604 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/apq8039-t2-pinctl.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/apq8039-t2.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index f9e6343acd03..5b8a0eb34733 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= apq8039-t2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
> diff --git a/arch/arm64/boot/dts/qcom/apq8039-t2-pinctl.dtsi b/arch/arm64/boot/dts/qcom/apq8039-t2-pinctl.dtsi
> new file mode 100644
> index 000000000000..60adb3da826a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/apq8039-t2-pinctl.dtsi

We stopped separating the pinctrl in an extra .dtsi. Please just put it
at the end of the apq8039-t2.dts or sorted with the other nodes.
(I put them at the end for all the msm8916 device trees, but on newer
 SoCs it's usually just put normally in alphebetical order.)

> [...]
> @@ -0,0 +1,277 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +
> +/*
> + * Line names are taken from the schematic of T2, Ver X03.
> + * July 14, 2018. Page 4 in particular.
> + */
> +
> +&msmgpio {
> + [...]
> +	typec_pins: typec_pins {
> +		pinmux_irqz {
> +			function = "gpio";
> +			pins = "gpio107";
> +		};
> +		pinconf_irqz {
> +			pins = "gpio107";
> +			bias-pull-up;
> +			input-enable;
> +		};
> +	};

You can write this like:

typec_pins: typec_pins {
	pins = "gpio107";
	function = "gpio";

	bias-pull-up;
	input-enable;
};

The separation and separate "pinmux" etc nodes shouldn't be needed. Also
see commit 6554a295042f7 ("arm64: dts: qcom: msm8916: Simplify pinctrl
configuration").

> + [...]
> +};
> + [...]
> diff --git a/arch/arm64/boot/dts/qcom/apq8039-t2.dts b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
> new file mode 100644
> index 000000000000..558f37945d94
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
> @@ -0,0 +1,326 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2015, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2022, Linaro Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

SPDX should be enough. :)

> + */
> + [...]
> +};
> +&otg {
> +	status = "okay";
> +	usb-role-switch;
> +
> +	pinctrl-names = "default", "host", "device";
> +	pinctrl-0 = <&pinctrl_otg_default>;
> +	pinctrl-1 = <&pinctrl_otg_host>;
> +	pinctrl-2 = <&pinctrl_otg_device>;
> +	pin-switch-delay-us = <100000>;
> +
> +	ulpi {
> +		usb_hs_phy: phy {
> +			qcom,enable-vbus-pullup;

Hm, what handles the USB detection on this port? The tps6598x?
Can it provide an extcon so that you don't need to keep the USB PHY
powered permanently?

> + [...]
> +&pronto {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&wcnss_pin_a &wcnss_pin_antennae>;
> +	status = "okay";
> +
> +	iris {
> +		compatible = "qcom,wcn3680";
> +	};
> +
> +	smd-edge {
> +		wcnss {
> +			bt {
> +				local-bd-address = [ 55 44 33 22 11 00 ];

Is this really needed?

The DB410c LK and U-Boot port (and also lk2nd) automatically generate a
WiFi/BT address based on the eMMC serial number. That's probably a
better solution than a fixed MAC address specified here.

Thanks,
Stephan
