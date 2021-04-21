Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C21AC36632F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Apr 2021 02:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234424AbhDUAvP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Apr 2021 20:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234276AbhDUAvP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Apr 2021 20:51:15 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F051DC06138A
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Apr 2021 17:50:42 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id b17so28116526pgh.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Apr 2021 17:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8YLOYTL9uFfTlsUBTt4KtFnsgrD3qMKDwpIsIQc1OzQ=;
        b=GTHAWJyYH+TVJoASsZJVT+rFImVeTfbBdAU0ib1vxL3BQwDL7OWyZZRY+dVfY+CbpJ
         teVIlUg3keh/0L70wBaEjFOe9F0jWuGp5A/2LL2L+QU1LNxy3sEJmhmPc3v7dSxnSngQ
         I87A7TZRRHK9Zj4RcZGYcgJgbC3ctsHHRvmxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8YLOYTL9uFfTlsUBTt4KtFnsgrD3qMKDwpIsIQc1OzQ=;
        b=g5/f7TBXvzJG0TglepbNP0DNdhE0v8ZMJjXwGQivVhIlZnqAq91nFcdgHhBF1PYe1w
         cOtR63DC2XlcGv4ANJCKyjSFRgHhydoOX5toc7VcgaQ/M3UNN6nL8CIm/ayNCfgFPDnF
         Hg74f6NfjhBNx+c0tFMRcNLkoEuJIDxTqczdroPFWUglTgF4Z+a1lvCMls1v60rXsC+V
         DqeUNnw03s3+skCx3zVGjRTwP9+vfOTPIQQgcDIhUdt6ONtNcNOymEPlAW3+LyCfyjKw
         C7O7HVaMlLYIRQ99SktDVwOBlsQuMEG2ZNDp9qpiQKgJ686QEj79ZPJiL+P3kyHj4If8
         dGBQ==
X-Gm-Message-State: AOAM532ZGr8b4ljDMaS10O5RBWPYlfr7EQVIjhmNRtIEHAfWTERibbik
        LgVM4XIDLluc058QVirbGPo33g==
X-Google-Smtp-Source: ABdhPJyqsXFJPEW53dgWZWzIl1MKNJhSGg4Hv/Awq+xELaEHiZszta5Vzv92f/tFkQR8imMYCtKe3w==
X-Received: by 2002:a63:1a47:: with SMTP id a7mr19505511pgm.437.1618966242338;
        Tue, 20 Apr 2021 17:50:42 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:b1f0:79e0:c1ca:fd1])
        by smtp.gmail.com with UTF8SMTPSA id x38sm183812pfu.22.2021.04.20.17.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 17:50:41 -0700 (PDT)
Date:   Tue, 20 Apr 2021 17:50:40 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org
Subject: Re: [PATCH v2 2/3] dt-bindings: net: bluetooth: Convert to DT schema
Message-ID: <YH924M62b7PDd/r6@google.com>
References: <1618936010-16579-1-git-send-email-gubbaven@codeaurora.org>
 <1618936010-16579-3-git-send-email-gubbaven@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1618936010-16579-3-git-send-email-gubbaven@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 20, 2021 at 09:56:49PM +0530, Venkata Lakshmi Narayana Gubba wrote:

> Subject: dt-bindings: net: bluetooth: Convert to DT schema

This doesn't convert the generic binding or all bindings to DT schema
as the subject suggests, but the Qualcomm BT binding.

>
> Converted Qualcomm Bluetooth binidings to DT schema.
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
>  .../devicetree/bindings/net/qualcomm-bluetooth.txt | 69 -----------------
>  .../bindings/net/qualcomm-bluetooth.yaml           | 87 ++++++++++++++++++++++
>  2 files changed, 87 insertions(+), 69 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>  create mode 100644 Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> deleted file mode 100644
> index 709ca6d..0000000
> --- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -Qualcomm Bluetooth Chips
> ----------------------
> -
> -This documents the binding structure and common properties for serial
> -attached Qualcomm devices.
> -
> -Serial attached Qualcomm devices shall be a child node of the host UART
> -device the slave device is attached to.
> -
> -Required properties:
> - - compatible: should contain one of the following:
> -   * "qcom,qca6174-bt"
> -   * "qcom,qca9377-bt"
> -   * "qcom,wcn3990-bt"
> -   * "qcom,wcn3991-bt"
> -   * "qcom,wcn3998-bt"
> -   * "qcom,qca6390-bt"
> -
> -Optional properties for compatible string qcom,qca6174-bt:
> -
> - - enable-gpios: gpio specifier used to enable chip
> - - clocks: clock provided to the controller (SUSCLK_32KHZ)
> - - firmware-name: specify the name of nvm firmware to load
> -
> -Optional properties for compatible string qcom,qca9377-bt:
> -
> - - max-speed: see Documentation/devicetree/bindings/serial/serial.yaml
> -
> -Required properties for compatible string qcom,wcn399x-bt:
> -
> - - vddio-supply: VDD_IO supply regulator handle.
> - - vddxo-supply: VDD_XO supply regulator handle.
> - - vddrf-supply: VDD_RF supply regulator handle.
> - - vddch0-supply: VDD_CH0 supply regulator handle.
> -
> -Optional properties for compatible string qcom,wcn399x-bt:
> -
> - - max-speed: see Documentation/devicetree/bindings/serial/serial.yaml
> - - firmware-name: specify the name of nvm firmware to load
> - - clocks: clock provided to the controller
> -
> -Examples:
> -
> -serial@7570000 {
> -	label = "BT-UART";
> -	status = "okay";
> -
> -	bluetooth {
> -		compatible = "qcom,qca6174-bt";
> -
> -		enable-gpios = <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
> -		clocks = <&divclk4>;
> -		firmware-name = "nvm_00440302.bin";
> -	};
> -};
> -
> -serial@898000 {
> -	bluetooth {
> -		compatible = "qcom,wcn3990-bt";
> -
> -		vddio-supply = <&vreg_s4a_1p8>;
> -		vddxo-supply = <&vreg_l7a_1p8>;
> -		vddrf-supply = <&vreg_l17a_1p3>;
> -		vddch0-supply = <&vreg_l25a_3p3>;
> -		max-speed = <3200000>;
> -		firmware-name = "crnv21.bin";
> -		clocks = <&rpmhcc RPMH_RF_CLK2>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
> new file mode 100644
> index 0000000..55cd995
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/qualcomm-bluetooth.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Bluetooth Chips
> +
> +maintainers:
> +  - Rob Herring <robh@kernel.org>
> +  - Marcel Holtmann <marcel@holtmann.org>
> +
> +description:
> +  This binding describes Qualcomm UART-attached bluetooth chips.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,qca6174-bt
> +      - qcom,qca9377-bt
> +      - qcom,wcn3990-bt
> +      - qcom,wcn3991-bt
> +      - qcom,wcn3998-bt
> +      - qcom,qca6390-bt      

delete trailing blanks

> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: gpio specifier used to enable chip
> +   

delete blanks

> +  clocks:
> +    maxItems: 1
> +    description: clock provided to the controller (SUSCLK_32KHZ)
> +
> +  vddio-supply:
> +    description: VDD_IO supply regulator handle
> +
> +  vddxo-supply:
> +    description: VDD_XO supply regulator handle
> +
> +  vddrf-supply:
> +    description: VDD_RF supply regulator handle
> +
> +  vddch0-supply:
> +    description: VDD_CH0 supply regulator handle
> +
> +  max-speed: 

delete trailing blank

> +    description: see Documentation/devicetree/bindings/serial/serial.yaml
> +
> +  firmware-name:
> +    description: specify the name of nvm firmware to load
> +
> +  local-bd-address:
> +    description: see Documentation/devicetree/bindings/net/bluetooth.txt
> +
> +
> +required:
> +  - compatible

it seems you could make the supplies conditionally required based on the
compatible string. See Documentation/devicetree/bindings/connector/usb-connector.yaml
for an example

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    uart {
> +        label = "BT-UART";
> +        status = "okay";
> +
> +        bluetooth {
> +            compatible = "qcom,qca6174-bt";
> +            enable-gpios = <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
> +            clocks = <&divclk4>;
> +            firmware-name = "nvm_00440302.bin";
> +        };
> +    };
> +  - |
> +    uart {
> +
> +        bluetooth {
> +            compatible = "qcom,wcn3990-bt";
> +            vddio-supply = <&vreg_s4a_1p8>;
> +            vddxo-supply = <&vreg_l7a_1p8>;
> +            vddrf-supply = <&vreg_l17a_1p3>;
> +            vddch0-supply = <&vreg_l25a_3p3>;
> +            max-speed = <3200000>;
> +            firmware-name = "crnv21.bin";		

delete trailing blanks
