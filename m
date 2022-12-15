Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87E6064DBAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Dec 2022 13:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbiLOMxG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Dec 2022 07:53:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiLOMxF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Dec 2022 07:53:05 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E66B2AE1B
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 04:53:03 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id bf43so2206905lfb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 04:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ptGRtK+Ib6emho74ijoc4hQMZ7OQDoXaebgGIFze/iw=;
        b=p14y9a+UIQUX6OjSmkSg3f1Bopt591BcI3r9N+jCAhRhPbKG+aELEQJT78nMlNgKcT
         crDq0MDvxGleL/HSka9K9rL/XabBPH5u121/Goxp40htnMiQ2fzfqjS3v+SVEY1vnClc
         t19fjASNBpY22I/FDLw2dHb//t5ohTmNM9mGp/H9RhqRx2Uq+wUrhAgpLGEimIQaopms
         FFG/eYlQ0xmINPqhAp8Oxf7ENa1eEpNLvNQtoJXp8jz4WfoGvIYhsFDz/aKiGxwKg2V7
         hYs5g3d/jVkQuYEudSNotGa0MYXOfZLOhyak6poB/p59+HenzOMJwfKwggcVGixA1WK4
         xVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ptGRtK+Ib6emho74ijoc4hQMZ7OQDoXaebgGIFze/iw=;
        b=YXgI+ZjR7u1PfCFVLXge6azUHnLIlm0jp8wJJ3Ll2YKJ3rENkBdBrVCpKx8a/N0azC
         +eDMiZ+82AWoXITPcNLmI5xoDSu49TI0MCtcZkeQK623Gh5lk64WMQuA4FTcFtcl1qS/
         Utzgb+nnRhRpwF9LD7+3YTV8pqblg37P0S4TbvymDqhv0FADKbdZq1jXp0Nfc4Ws1J/f
         hz38N7PK1HpSvGdwuBQBLrdjevgbbj/0bnvsm1i2mBUv9MIh9SzO7S344tcbONaLcC4+
         MPKGHyFw5H4r4+stsi7VsYrs/ckHJnjv/4omAp3nhJYQKWyHnflGJHOiNdLbuR05CGay
         PVqg==
X-Gm-Message-State: ANoB5pkpjq2mbU6SMry3jI9rAL+Qsvu+fpVSXIVS8gMK+IDFEE+OZSAe
        UZDGse25f6rxwnQIDql91am1Fw==
X-Google-Smtp-Source: AA0mqf44/kkeK0V0oc13RssATRClhel9qXC+DIGZQH54zeTqWE2SQb+jAqqo0TXGnbctF7gCMR2Q1A==
X-Received: by 2002:a05:6512:b91:b0:4a4:68b8:c2e4 with SMTP id b17-20020a0565120b9100b004a468b8c2e4mr11455248lfv.59.1671108781282;
        Thu, 15 Dec 2022 04:53:01 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id p8-20020ac24ec8000000b004b4e4671212sm1147174lfr.232.2022.12.15.04.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 04:53:00 -0800 (PST)
Message-ID: <504dcfd0-2b37-922f-9638-6255741a3060@linaro.org>
Date:   Thu, 15 Dec 2022 13:52:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/7] arm64: dts: qcom: sc8280xp: rename qup2_i2c5 to
 i2c21
Content-Language: en-US
To:     Brian Masney <bmasney@redhat.com>, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     quic_shazhuss@quicinc.com, robh+dt@kernel.org,
        johan+linaro@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ahalaney@redhat.com, echanude@redhat.com
References: <20221214171145.2913557-1-bmasney@redhat.com>
 <20221214171145.2913557-3-bmasney@redhat.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221214171145.2913557-3-bmasney@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 14.12.2022 18:11, Brian Masney wrote:
> In preparation for adding the missing SPI and I2C nodes to
> sc8280xp.dtsi, it was decided to rename all of the existing qupX_
> uart, spi, and i2c nodes to drop the qupX_ prefix. Let's go ahead
> and rename qup2_i2c5 to i2c21. Under the old name, this was the 5th
> index under qup2, which starts at index 16. Note that some nodes are
> moved in the file by this patch to preserve the expected sort order in
> the file.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Link: https://lore.kernel.org/lkml/20221212182314.1902632-1-bmasney@redhat.com/
> ---
> This is a new patch that's introduced in v2.
> 
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     |  90 ++++++-------
>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 120 +++++++++---------
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |   2 +-
>  3 files changed, 106 insertions(+), 106 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> index db273face248..0de1bdb68e2c 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> @@ -228,6 +228,43 @@ vreg_l9d: ldo9 {
>  	};
>  };
>  
> +&i2c21 {
> +	clock-frequency = <400000>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c21_default>;
> +
> +	status = "okay";
> +
> +	touchpad@15 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x15>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 182 IRQ_TYPE_LEVEL_LOW>;
> +		vdd-supply = <&vreg_misc_3p3>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tpad_default>;
> +
> +		wakeup-source;
> +	};
> +
> +	keyboard@68 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x68>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 104 IRQ_TYPE_LEVEL_LOW>;
> +		vdd-supply = <&vreg_misc_3p3>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&kybd_default>;
> +
> +		wakeup-source;
> +	};
> +};
> +
>  &pcie2a {
>  	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
>  	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
> @@ -326,43 +363,6 @@ &qup2 {
>  	status = "okay";
>  };
>  
> -&qup2_i2c5 {
> -	clock-frequency = <400000>;
> -
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&qup2_i2c5_default>;
> -
> -	status = "okay";
> -
> -	touchpad@15 {
> -		compatible = "hid-over-i2c";
> -		reg = <0x15>;
> -
> -		hid-descr-addr = <0x1>;
> -		interrupts-extended = <&tlmm 182 IRQ_TYPE_LEVEL_LOW>;
> -		vdd-supply = <&vreg_misc_3p3>;
> -
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&tpad_default>;
> -
> -		wakeup-source;
> -	};
> -
> -	keyboard@68 {
> -		compatible = "hid-over-i2c";
> -		reg = <0x68>;
> -
> -		hid-descr-addr = <0x1>;
> -		interrupts-extended = <&tlmm 104 IRQ_TYPE_LEVEL_LOW>;
> -		vdd-supply = <&vreg_misc_3p3>;
> -
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&kybd_default>;
> -
> -		wakeup-source;
> -	};
> -};
> -
>  &remoteproc_adsp {
>  	firmware-name = "qcom/sc8280xp/qcadsp8280.mbn";
>  
> @@ -494,6 +494,14 @@ hastings_reg_en: hastings-reg-en-state {
>  &tlmm {
>  	gpio-reserved-ranges = <74 6>, <83 4>, <125 2>, <128 2>, <154 7>;
>  
> +	i2c21_default: i2c21-default-state {
> +		pins = "gpio81", "gpio82";
> +		function = "qup21";
> +
> +		bias-disable;
> +		drive-strength = <16>;
This is rather nitty, but other DTs usually do

pins
function
drive-strength
bias-
in/output-


I see this patch just moves things around, but if you were to
send a v(n+1), please consider shuffling these properties
around.

Regardless of that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +	};
> +
>  	kybd_default: kybd-default-state {
>  		disable-pins {
>  			pins = "gpio102";
> @@ -598,14 +606,6 @@ qup0_i2c4_default: qup0-i2c4-default-state {
>  		drive-strength = <16>;
>  	};
>  
> -	qup2_i2c5_default: qup2-i2c5-default-state {
> -		pins = "gpio81", "gpio82";
> -		function = "qup21";
> -
> -		bias-disable;
> -		drive-strength = <16>;
> -	};
> -
>  	tpad_default: tpad-default-state {
>  		int-n-pins {
>  			pins = "gpio182";
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 568c6be1ceaa..d7af2040cbcb 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -282,6 +282,59 @@ vreg_l9d: ldo9 {
>  	};
>  };
>  
> +&i2c21 {
> +	clock-frequency = <400000>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c21_default>;
> +
> +	status = "okay";
> +
> +	touchpad@15 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x15>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 182 IRQ_TYPE_LEVEL_LOW>;
> +		vdd-supply = <&vreg_misc_3p3>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tpad_default>;
> +
> +		wakeup-source;
> +
> +		status = "disabled";
> +	};
> +
> +	touchpad@2c {
> +		compatible = "hid-over-i2c";
> +		reg = <0x2c>;
> +
> +		hid-descr-addr = <0x20>;
> +		interrupts-extended = <&tlmm 182 IRQ_TYPE_LEVEL_LOW>;
> +		vdd-supply = <&vreg_misc_3p3>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tpad_default>;
> +
> +		wakeup-source;
> +	};
> +
> +	keyboard@68 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x68>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 104 IRQ_TYPE_LEVEL_LOW>;
> +		vdd-supply = <&vreg_misc_3p3>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&kybd_default>;
> +
> +		wakeup-source;
> +	};
> +};
> +
>  &pcie2a {
>  	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
>  	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
> @@ -531,59 +584,6 @@ &qup2 {
>  	status = "okay";
>  };
>  
> -&qup2_i2c5 {
> -	clock-frequency = <400000>;
> -
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&qup2_i2c5_default>;
> -
> -	status = "okay";
> -
> -	touchpad@15 {
> -		compatible = "hid-over-i2c";
> -		reg = <0x15>;
> -
> -		hid-descr-addr = <0x1>;
> -		interrupts-extended = <&tlmm 182 IRQ_TYPE_LEVEL_LOW>;
> -		vdd-supply = <&vreg_misc_3p3>;
> -
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&tpad_default>;
> -
> -		wakeup-source;
> -
> -		status = "disabled";
> -	};
> -
> -	touchpad@2c {
> -		compatible = "hid-over-i2c";
> -		reg = <0x2c>;
> -
> -		hid-descr-addr = <0x20>;
> -		interrupts-extended = <&tlmm 182 IRQ_TYPE_LEVEL_LOW>;
> -		vdd-supply = <&vreg_misc_3p3>;
> -
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&tpad_default>;
> -
> -		wakeup-source;
> -	};
> -
> -	keyboard@68 {
> -		compatible = "hid-over-i2c";
> -		reg = <0x68>;
> -
> -		hid-descr-addr = <0x1>;
> -		interrupts-extended = <&tlmm 104 IRQ_TYPE_LEVEL_LOW>;
> -		vdd-supply = <&vreg_misc_3p3>;
> -
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&kybd_default>;
> -
> -		wakeup-source;
> -	};
> -};
> -
>  &remoteproc_adsp {
>  	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn";
>  
> @@ -698,6 +698,13 @@ hall_int_n_default: hall-int-n-state {
>  		bias-disable;
>  	};
>  
> +	i2c21_default: i2c21-default-state {
> +		pins = "gpio81", "gpio82";
> +		function = "qup21";
> +		bias-disable;
> +		drive-strength = <16>;
> +	};
> +
>  	kybd_default: kybd-default-state {
>  		disable-pins {
>  			pins = "gpio102";
> @@ -801,13 +808,6 @@ qup0_i2c4_default: qup0-i2c4-default-state {
>  		drive-strength = <16>;
>  	};
>  
> -	qup2_i2c5_default: qup2-i2c5-default-state {
> -		pins = "gpio81", "gpio82";
> -		function = "qup21";
> -		bias-disable;
> -		drive-strength = <16>;
> -	};
> -
>  	tpad_default: tpad-default-state {
>  		int-n-pins {
>  			pins = "gpio182";
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 951cb1b6fcc4..929365cff555 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -827,7 +827,7 @@ uart17: serial@884000 {
>  				status = "disabled";
>  			};
>  
> -			qup2_i2c5: i2c@894000 {
> +			i2c21: i2c@894000 {
>  				compatible = "qcom,geni-i2c";
>  				reg = <0 0x00894000 0 0x4000>;
>  				clock-names = "se";
