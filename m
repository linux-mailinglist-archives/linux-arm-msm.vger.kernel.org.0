Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A34BA39423E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 13:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236141AbhE1L6m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 07:58:42 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.168]:14924 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233262AbhE1L6m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 07:58:42 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1622203024; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=antOzkoX49nOE9T3UJfhvXSv6XH0ztXYwa5304znwlFmSLtCvKXYkowTgHxBCBGIzN
    mXvEb6FVQvCcVvla3R7XIwgiha7WXNm+m3mA0dELO3VJf3+SRtRz39EmjwXzvY85Zv8H
    HvRjHzx79NvQ74WMWC8M9JaO29e9POkHxGEZ9/tGnb7UG8d2ybwzMz0vHYfjv+jXvG5k
    NiTabIJQnQRhSA1UlWGzx7sGHEakfQQQm77Mj3Dn4eVz4oJRjptKZj/gJHp16bkuNNRk
    HFPVGzbhzs9n0PGWOj28aZeov+OxGFPusv0B8jNjo3F0J7YNInBsykdRHpOpQBmLNa7r
    T2Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622203024;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Q/L9hl8VwyWHuAq5AZ8u3vsGnL+SPsZZXhvKMIEnenY=;
    b=ovbbj5CIw3nO/nHP+jKkZeIzZXBJmXwzRFXAgB2AFxrs1uJzdMxUC/+XnPw6WT2c+9
    ofEyiWLD/76dCh1wKXcEAzXo85LZBLN7P9Me2QTA+RlZw3HM+tXn5T7lKaEEfb1cl/Vx
    MSoSQlilbd3rk6WA5X+6LigkGx/TjlaKHaH56XXvobt4NViY8t6ASgiOBCuH1Ar0HAIz
    PcXn0AFLAklB2FSslpCpgDr8wO2iHeDwgkCujJeIVSvcs8xlNOKSDhSQ1E3IMunv8COQ
    pjGpEQkO0iki563RF0jCJHPJ2t7oVYq0scc8sUvvHNdAH5Te7xqUEw7MVWlTQ+/xCt7L
    EbIA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622203024;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Q/L9hl8VwyWHuAq5AZ8u3vsGnL+SPsZZXhvKMIEnenY=;
    b=EQA3JCAeZizbYsJpQINZk3qkAIqkhg84lxkkxLR3KcCdtIHF7yYDeU8K7ENdwywS9l
    bV9vspwlIMQ0heWlTMCIYPnyuF7Rq+kSNwPscNPUqRGfctTnXzfRNuWala5ScOj+HpiB
    DCCiJwE6CZnf044SLwj0hCVOi7TD60EYbDikBehD2zEvyMNusRyqNqqyQdAJiCqMt051
    ZO1TdrGPgSv1j1S0aEBVGWNY5zGum2SSY/ehiVSncSXWeYP2PqWmlBdSBbJz5d6Ejr3X
    iJ/RYD8FrEy4I2MyhrIQWJOZRoF7QPkbQRZgo47FToy5ybHokfFbQgahKyeLDIIztewp
    ZQdg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j6IczFY4o="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.26.3 DYNA|AUTH)
    with ESMTPSA id U0b2c9x4SBv366O
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 28 May 2021 13:57:03 +0200 (CEST)
Date:   Fri, 28 May 2021 13:57:02 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8916-alcatel-idol347: enable
 touchscreen
Message-ID: <YLDajqW826vi/edi@gerhold.net>
References: <20210528114345.543761-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528114345.543761-1-vincent.knecht@mailoo.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 28, 2021 at 01:43:45PM +0200, Vincent Knecht wrote:
> Enable the MStar msg2638 touchscreen.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

Thanks!
Stephan

> ---
>  .../boot/dts/qcom/msm8916-alcatel-idol347.dts | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
> index 540b1fa4b260..670bd1bebd73 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
> @@ -45,6 +45,24 @@ &blsp1_uart2 {
>  	status = "okay";
>  };
>  
> +&blsp_i2c4 {
> +	status = "okay";
> +
> +	touchscreen@26 {
> +		compatible = "mstar,msg2638";
> +		reg = <0x26>;
> +		interrupt-parent = <&msmgpio>;
> +		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&msmgpio 100 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&ts_int_reset_default>;
> +		vdd-supply = <&pm8916_l17>;
> +		vddio-supply = <&pm8916_l5>;
> +		touchscreen-size-x = <2048>;
> +		touchscreen-size-y = <2048>;
> +	};
> +};
> +
>  &blsp_i2c5 {
>  	status = "okay";
>  
> @@ -281,6 +299,14 @@ proximity_int_default: proximity-int-default {
>  		bias-pull-up;
>  	};
>  
> +	ts_int_reset_default: ts-int-reset-default {
> +		pins = "gpio13", "gpio100";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>  	usb_id_default: usb-id-default {
>  		pins = "gpio69";
>  		function = "gpio";
> -- 
> 2.31.1
> 
> 
> 
