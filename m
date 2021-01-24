Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A494301D5D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 16:56:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbhAXPzm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 10:55:42 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:33832 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbhAXPzl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 10:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1611503567;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:From:
        Subject:Sender;
        bh=hXjBU9JyESKm7fyW04/N/0toB1V1shGmq3XnBTE9hFY=;
        b=KQYbo+ylFJ8NSvGQKh4dxhRydyJIMgwERaJOadLigjESh0kzcbSu92I4ow3Xdu6IDK
        ikUpxkhBGOMZvvPoNpnhQS9xVemifPWgXg0S2Mq/Z3jaAlElBpbNsH5LVUXoiiYOawPV
        +TK48UtXj5YJKtyoCX8feXtx6OijgyYPk1JhGLQ9BPxTmRpTLz1vbD1XFaw0X8EcOM2X
        VTpsMXRLfF1fmDQ0ONHSczU+r+pFIpdZ6ywAw1noTfttIUBl7Aw4d3Mn6HNRK4K9f1p1
        2ynf6/pVs+M8zNNDkpexR+zViS12W3ZdUpnaPjgcfnjC1x6/yLDAGWxhmHU9sKUNhGWI
        IeLQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7IczBa4o="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id R0a218x0OFqggSU
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 24 Jan 2021 16:52:42 +0100 (CET)
Date:   Sun, 24 Jan 2021 16:52:40 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Jonathan Albrieux <jonathan.albrieux@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8916: Add blsp_i2c3
Message-ID: <YA2XyLbrEzN3tvJr@gerhold.net>
References: <20210124135409.5473-1-jonathan.albrieux@gmail.com>
 <20210124135409.5473-3-jonathan.albrieux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210124135409.5473-3-jonathan.albrieux@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jan 24, 2021 at 02:54:06PM +0100, Jonathan Albrieux wrote:
> MSM8916 has another I2C QUP controller that can be enabled on
> GPIO 10 and 11.
> 
> Add blsp_i2c3 to msm8916.dtsi and disable it by default.
> 
> Signed-off-by: Jonathan Albrieux <jonathan.albrieux@gmail.com>

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

> ---
>  arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 16 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8916.dtsi      | 15 +++++++++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
> index 4dc437f13fa5..7dedb91b9930 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
> @@ -220,6 +220,22 @@
>  		bias-disable;
>  	};
>  
> +	i2c3_default: i2c3-default {
> +		pins = "gpio10", "gpio11";
> +		function = "blsp_i2c3";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	i2c3_sleep: i2c3-sleep {
> +		pins = "gpio10", "gpio11";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>  	i2c4_default: i2c4-default {
>  		pins = "gpio14", "gpio15";
>  		function = "blsp_i2c4";
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 402e891a84ab..1045d7e518f3 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1528,6 +1528,21 @@
>  			status = "disabled";
>  		};
>  
> +		blsp_i2c3: i2c@78b7000 {
> +			compatible = "qcom,i2c-qup-v2.2.1";
> +			reg = <0x078b7000 0x500>;
> +			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
> +				 <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>;
> +			clock-names = "iface", "core";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&i2c3_default>;
> +			pinctrl-1 = <&i2c3_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		blsp_spi3: spi@78b7000 {
>  			compatible = "qcom,spi-qup-v2.2.1";
>  			reg = <0x078b7000 0x500>;
> -- 
> 2.17.1
> 
