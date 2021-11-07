Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12DB8447621
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Nov 2021 22:58:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235308AbhKGWBR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 Nov 2021 17:01:17 -0500
Received: from m-r2.th.seeweb.it ([5.144.164.171]:41363 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235100AbhKGWBR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 Nov 2021 17:01:17 -0500
Received: from [192.168.1.222] (adsl-d210.84-47-0.t-com.sk [84.47.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4D63C3EC75;
        Sun,  7 Nov 2021 22:58:32 +0100 (CET)
Date:   Sun, 07 Nov 2021 22:58:25 +0100
From:   Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sdm660-xiaomi-lavender: Add volume
 up button
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
        paul.bouchara@somainline.org,
        angelogioacchino.delregno@somainline.org
Message-Id: <DD282R.VFVA9P993X2G2@somainline.org>
In-Reply-To: <20211107195511.3346734-5-danct12@riseup.net>
References: <20211107195511.3346734-1-danct12@riseup.net>
        <20211107195511.3346734-5-danct12@riseup.net>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Martin Botka <martin.botka@somainline.org>

On Mon, Nov 8 2021 at 02:55:08 AM +0700, Dang Huynh 
<danct12@riseup.net> wrote:
> This enables the volume up key.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>  .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 20 
> +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts 
> b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> index 28408240735b..5e4682f54fbe 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> @@ -9,6 +9,9 @@
>  #include "sdm660.dtsi"
>  #include "pm660.dtsi"
>  #include "pm660l.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/input/gpio-keys.h>
> 
>  / {
>  	model = "Xiaomi Redmi Note 7";
> @@ -31,6 +34,23 @@ vph_pwr: vph-pwr-regulator {
>  		regulator-boot-on;
>  	};
> 
> +	gpio_keys {
> +		status = "okay";
> +		compatible = "gpio-keys";
> +		input-name = "gpio-keys";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		vol_up {
> +			label = "Volume Up";
> +			gpios = <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <1>;
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpio-key,wakeup;
> +			debounce-interval = <15>;
> +		};
> +	};
> +
>  	reserved-memory {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> --
> 2.33.1
> 


