Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC9042A421
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 14:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236332AbhJLMQ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 08:16:29 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:26667 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236343AbhJLMQ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 08:16:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1634040867;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=uyT4j6Z+8OZyW+GPfqKbCaSpAq/N21qHVmY8DwUAS/4=;
    b=MW1zdUMGBZkj3vGx6Mz32KfCVmaNsEUUsUjDAPjuALjuQlThSaps4DozRLH6uUFkUd
    vBNuPztWeTCIxC1LYNoy76I3xmo9ZvGQjvBlesBP9rRJK1tzY5z3TtGhBxlX4xli8SkE
    npRxEjlDJqXl+GgRfZACDABEEhiFULObjmJCXHPNwTxucqdIpZRQid10Hp5jlSLqpFBe
    IqEEiL3kzQXMrN0pxpRyVuDr7rm0WnHhuy/sWRxgP9M03Tn65H0TH4O7HKDom6l6xGbz
    RZlaBtuHL13Rpjv0dAsVlUITljKoHVAF6UyYEX3zedIbpBll0m6qvbet9UN8Ud1yt9E7
    rppA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4pSA8p7h"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.33.8 SBL|AUTH)
    with ESMTPSA id 301038x9CCEQzv7
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 12 Oct 2021 14:14:26 +0200 (CEST)
Date:   Tue, 12 Oct 2021 14:14:25 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     "J.R. Divya Antony" <d.antony.jr@gmail.com>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8916-asus-z00l: Add sensors
Message-ID: <YWV8IYeaV701wuIb@gerhold.net>
References: <20211012112735.2765-1-d.antony.jr@gmail.com>
 <20211012112735.2765-3-d.antony.jr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012112735.2765-3-d.antony.jr@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 12, 2021 at 04:57:35PM +0530, J.R. Divya Antony wrote:
> This device has MPU-6515 imu and Asahi Kasei AK09911 magnetometer,
> Add support for it.
> 
> Signed-off-by: J.R. Divya Antony <d.antony.jr@gmail.com>

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

> ---
>  .../arm64/boot/dts/qcom/msm8916-asus-z00l.dts | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
> index 355c95365fcd..c2afda74b5b3 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
> @@ -65,6 +65,41 @@ usb_id: usb-id {
>  	};
>  };
>  
> +&blsp_i2c2 {
> +	status = "okay";
> +
> +	magnetometer@c {
> +		compatible = "asahi-kasei,ak09911";
> +		reg = <0x0c>;
> +
> +		vdd-supply = <&pm8916_l8>;
> +		vid-supply = <&pm8916_l6>;
> +
> +		reset-gpios = <&msmgpio 112 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&mag_reset_default>;
> +	};
> +
> +	imu@68 {
> +		compatible = "invensense,mpu6515";
> +		reg = <0x68>;
> +
> +		interrupt-parent = <&msmgpio>;
> +		interrupts = <36 IRQ_TYPE_EDGE_RISING>;
> +
> +		vdd-supply = <&pm8916_l17>;
> +		vddio-supply = <&pm8916_l6>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&imu_default>;
> +
> +		mount-matrix = "1",  "0", "0",
> +			       "0", "-1", "0",
> +			       "0",  "0", "1";
> +	};
> +};
> +
>  &blsp_i2c5 {
>  	status = "okay";
>  
> @@ -235,6 +270,22 @@ gpio_keys_default: gpio-keys-default {
>  		bias-pull-up;
>  	};
>  
> +	imu_default: imu-default {
> +		pins = "gpio36";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	mag_reset_default: mag-reset-default {
> +		pins = "gpio112";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>  	sd_vmmc_en_default: sd-vmmc-en-default {
>  		pins = "gpio87";
>  		function = "gpio";
> -- 
> 2.33.0
> 
