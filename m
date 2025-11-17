Return-Path: <linux-arm-msm+bounces-82170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7ADC66819
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 00:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 311EA34ACDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 23:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB1723BF9F;
	Mon, 17 Nov 2025 23:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CUYJWMN/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73797202F7E;
	Mon, 17 Nov 2025 23:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763420434; cv=none; b=k61jMCtjo8pQA5megvSeWa0446sdDVjyNYzJbIZYIw3EQ+xOGRImCMvUocBvKVhHyD0ny6kLMSYO7ZNZBgj0ybOkb2aoHJVenAVsXxGkAfY0kmorxrDQBOJTq5T0EPit+GGyGzIOc7PKb3+Zho/jM3jCb0yzGJ2b4j7/K2vFQGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763420434; c=relaxed/simple;
	bh=Wzt0LlTwI3f+J1SRPFBter72TOpmalqky+KIXLvk7DE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEPO16OvEMZthGIFqllxzF3UcoqYPRmK5s3FNbMq5MXhKHDN9GhBP0ngwTEJk2hkAQT6uAmVJzhjqKpYmPYqunXE3h1cSYPOiXqDwu810zw3l94+aR7FsXlFxII0PDwEMzQIzDfPoInsz7vTW4yFkHPdxgJlbz5e9nryE78ZNJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CUYJWMN/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC60DC19423;
	Mon, 17 Nov 2025 23:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763420433;
	bh=Wzt0LlTwI3f+J1SRPFBter72TOpmalqky+KIXLvk7DE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CUYJWMN/ogkfT5Np8FQK2IE3Ni852XAtUSzAankbX1CgvnwayzW3OqJ0rxlK1bYxb
	 c5iEUd15hYahnqyG6l5iS22mu+MBe4CLZcvONVYIuFzkHtIu5wYzzuCEK7/s72Pz5i
	 XPzhnG0lYhnR4LLu0ycwOZa+zD1eRmI5cZ4R95yXfeQ5ZcjURXO3dDfoaluyHI2UE4
	 Ud6Fl9nisi+BgV2efbvcgn2FH0ekciYaNI00fSmfVZbfKAPZ0b1ajwU5FOlS/XjE/z
	 fS2oBbbyaKNPmSXdZKR9mRUBTUGfMrXI/mCOCGl6CLw2mIpuYmBB2cOBQTXVhU7SJD
	 luECqLO7327ng==
Date: Mon, 17 Nov 2025 17:05:17 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: qcom: Add waveshare MIPI-DSI
 panels support
Message-ID: <hodshirikj4ohp62rlq5jaujqvxrlgnzd7jpcbt42taj6jgkq5@glybzef6jnjx>
References: <20251111104245.3420041-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111104245.3420041-1-tessolveupstream@gmail.com>

On Tue, Nov 11, 2025 at 04:12:44PM +0530, Sudarshan Shetty wrote:
> Device tree bindings for Waveshare MIPI-DSI panels
> of various sizes (5.0, 5.5, 7.0, 8.0, and 10.1).
> These panels require proper power sequencing via an external
> regulator and a backlight node for brightness control.
> 
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  .../display/panel/waveshare,dsi-panel.yaml    | 84 +++++++++++++++++++
>  ...waveshare,touchscreen-panel-regulator.yaml | 72 ++++++++++++++++
>  2 files changed, 156 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/waveshare,dsi-panel.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/waveshare,touchscreen-panel-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/waveshare,dsi-panel.yaml b/Documentation/devicetree/bindings/display/panel/waveshare,dsi-panel.yaml
> new file mode 100644
> index 000000000000..a42ce065124f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/waveshare,dsi-panel.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/waveshare,dsi-panel.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Waveshare 10.1" DSI Touch Display Panel
> +
> +maintainers:
> +  - Sudarshan Shetty <tessolveupstream@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - waveshare,12.3-dsi-touch-a,4lane
> +      - waveshare,10.1-dsi-touch-a
> +      - waveshare,10.1-dsi-touch-a-4lane
> +      - waveshare,10.1-dsi-touch-b
> +      - waveshare,10.1-dsi-touch-b,4lane
> +      - waveshare,9.0-dsi-touch-b
> +      - waveshare,9.0-dsi-touch-b,4lane
> +      - waveshare,8.8-dsi-touch-a
> +      - waveshare,8.0-dsi-touch-a
> +      - waveshare,8.0-dsi-touch-a-4lane
> +      - waveshare,7.0-dsi-touch-a
> +      - waveshare,7.0-dsi-touch-b
> +      - waveshare,5.5-dsi-touch-a
> +      - waveshare,5.0-dsi-touch-a
> +      - waveshare,4.0-dsi-touch-c
> +      - waveshare,3.4-dsi-touch-c
> +
> +  reg:
> +    description: DSI virtual channel
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Power supply regulator for the panel
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO to control panel reset
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO to control panel power enable

If this is the correct description of this pin, then this should be a
regulator provided by the regulator node and it should likely have the
3.3V (and 5V?) listed as -supply.

> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +  - reset-gpios
> +  - enable-gpios
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi@ae94000 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@1 {
> +            compatible = "waveshare,10.1-dsi-touch-a";
> +            reg = <1>;
> +            vdd-supply = <&vreg_l11a>;
> +            reset-gpios = <&display_mcu 1 GPIO_ACTIVE_HIGH>;
> +            enable-gpios = <&display_mcu 2 GPIO_ACTIVE_HIGH>;
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&mdss_dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +    mdss_dsi0_out: endpoint {
> +        remote-endpoint = <&panel_in>;
> +    };
> diff --git a/Documentation/devicetree/bindings/regulator/waveshare,touchscreen-panel-regulator.yaml b/Documentation/devicetree/bindings/regulator/waveshare,touchscreen-panel-regulator.yaml
> new file mode 100644
> index 000000000000..be81be5d2d74
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/waveshare,touchscreen-panel-regulator.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/waveshare,touchscreen-panel-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Waveshare Touchscreen Panel Regulator
> +
> +maintainers:
> +  - Sudarshan Shetty <tessolveupstream@gmail.com>
> +
> +description: |
> +  Regulator driver for Waveshare touchscreen display units.
> +  This regulator enables and disables panel power and provides
> +  backlight control over I2C.
> +
> +properties:
> +  compatible:
> +    const: waveshare,touchscreen-panel-regulator
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C address of the regulator device
> +
> +  vin-supply:
> +    description: Input supply regulator for the panel

The Waveshare takes 3.3V and 5V inputs, which then is distributed to the
panel and the touch through some regulators controlled by the MCU that
this binding represents.

So I'm pretty sure we need one more supply, and we need better
descriptions of what they are.

> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO to enable/disable regulator

This too is a pin controlled by the MCU, i.e. provided by the entity you
describe by this node.

> +

The driver that you also posted, which should have been sent together
with the binding, registers a GPIO controller, so you need
"gpio-controller" and "#gpio-cells" here as well.

> +required:
> +  - compatible
> +  - reg
> +  - vin-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    /dts-v1/;
> +    /plugin/;
> +
> +    / {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        gpio: gpio-controller {
> +            compatible = "test,gpio";
> +            #gpio-cells = <2>;
> +        };
> +
> +        vdd_3v3: regulator {
> +            compatible = "regulator-fixed";
> +            regulator-name = "vdd_3v3";
> +            regulator-min-microvolt = <3300000>;
> +            regulator-max-microvolt = <3300000>;
> +        };
> +
> +        i2c@980000 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            compatible = "test,i2c";
> +
> +            panel-regulator@3c {
> +                compatible = "waveshare,touchscreen-panel-regulator";
> +                reg = <0x3c>;

Are you sure/ All the material I've found says it's 0x45

> +                vin-supply = <&vdd_3v3>;
> +                enable-gpios = <&gpio 2 0>; /* active high */
> +            };
> +        };

This example does not show how the waveshare,touchscreen-panel-regulator
should be added to a DeviceTree!

Based on how you wrote the driver, enable-gpios should point back into
panel-regulator itself. vin-supply 

Regards,
Bjorn

> +    };
> -- 
> 2.34.1
> 

