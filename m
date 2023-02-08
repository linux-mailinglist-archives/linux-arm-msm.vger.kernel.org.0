Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5218068E9D7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 09:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjBHIZc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 03:25:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjBHIZb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 03:25:31 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 610C71C58C
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 00:25:29 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id p9so3322397ejj.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 00:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i0tjf5bOdya1SAOSzwjPrA8wEI9QG75gdxmrCv7IQRU=;
        b=WqTeOEEm+XZ4EQSj0CJVpiGag+IMvYAWv97c9fHJshb0FweRC/kgCLEZIy3S+IInPk
         ZAV9wJmRoh3OxtVHNF7WSekXzrs8pvAMyW0Hr62aEo1tUx5kUNqqp8cFVLt5F9co99al
         btptW8Vb154mjTIxF/7ppWVDd6qPxBSbtJ115fmISxIaOa9gDFfbkaHCmpG2IMBWEzvB
         0bOYtJ7uN9egxGUpJxOE5tblk24aB5w9kg+UCRsnQzG+kU5tMoW1l5hwWZAktVVKJ2w/
         Fb+wBQ5y6fPWzMZSgWVk/rJWNmboNhzaTh5ecPFlK5IGzklw06DpjXVy3mA74V02ymDw
         ge5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i0tjf5bOdya1SAOSzwjPrA8wEI9QG75gdxmrCv7IQRU=;
        b=uoEshv4Xv+TcMLxPXn/3JaFAIL6JJJcm4y91WViQC8sdzBGZR+h4N8SZWCDd9ij99u
         nUxR/D5Kh37eKB9zv8Xh3EsjLCqFgEvJl9Py7AaqgGzyNkZPbvlKBzfr1QmfhZ46H67F
         cD9zUCvyS3w51TAi9pX0xpwWQBQInpVtYvcFqjnoWhMnmmkjH2GKKHm7Magifs4gLPgR
         KimUsN1iqmnHDTX49Eti3GL7P4tCgd7EdDsuVlh1jl6Ab7rawUG2XMZvk0ywxRlBxLyb
         ykvT3gRAqnnJkWHX3Mehzgv6EYTb+Nudg4MawLygKWakXd+I3W1cLuyD31wIRcdE/M9Z
         qwiQ==
X-Gm-Message-State: AO0yUKXXd5PwFVNbUpIIEUkw4nq4mvpv6KSHxqwabNqwIFcmWDUAI/ik
        oXq+U1KchtVSa5EDotGw+MUOcQ==
X-Google-Smtp-Source: AK7set+htJDiUcMQiBN0Q2V/YcqNp3RNT+mcHyVIubVIJkF1oZFmyV2neM3xAaBxniiMrvD9BfQu2Q==
X-Received: by 2002:a17:907:9914:b0:873:393f:1bda with SMTP id ka20-20020a170907991400b00873393f1bdamr6666688ejc.47.1675844727974;
        Wed, 08 Feb 2023 00:25:27 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id qt17-20020a170906ecf100b0085fc3dec567sm8114020ejb.175.2023.02.08.00.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 00:25:26 -0800 (PST)
Message-ID: <0a1e1e27-f704-4875-7789-0995525235f8@linaro.org>
Date:   Wed, 8 Feb 2023 09:25:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: thinkpad-x13s: Add bluetooth
Content-Language: en-US
To:     Steev Klimaszewski <steev@kali.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Sven Peter <sven@svenpeter.dev>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>
References: <20230207052829.3996-1-steev@kali.org>
 <20230207052829.3996-5-steev@kali.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230207052829.3996-5-steev@kali.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7.02.2023 06:28, Steev Klimaszewski wrote:
> The Lenovo Thinkpad X13s has a WCN6855 Bluetooth controller on uart2,
> add this.
> 
> Signed-off-by: Steev Klimaszewski <steev@kali.org>
> ---
> 
> Changes since v3:
>  * Add vreg_s1c
>  * Add regulators and not dead code
>  * Fix commit message changelog
> 
> Changes since v2:
>  * Remove dead code and add TODO comment
>  * Make dtbs_check happy with the pin definitions
> ---
>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index f936b020a71d..8e3c6524e7c6 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -24,6 +24,8 @@ / {
>  	aliases {
>  		i2c4 = &i2c4;
>  		i2c21 = &i2c21;
> +		serial0 = &uart17;
> +		serial1 = &uart2;
>  	};
>  
>  	wcd938x: audio-codec {
> @@ -297,6 +299,14 @@ pmc8280c-rpmh-regulators {
>  		qcom,pmic-id = "c";
>  		vdd-bob-supply = <&vreg_vph_pwr>;
>  
> +		vreg_s1c: smps1 {
> +			regulator-name = "vreg_s1c";
> +			regulator-min-microvolt = <1880000>;
> +			regulator-max-microvolt = <1900000>;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_AUTO>;
Wouldn't you be interested in MODE_RET too?


> +			regulator-allow-set-load;
> +		};
> +
>  		vreg_l1c: ldo1 {
>  			regulator-name = "vreg_l1c";
>  			regulator-min-microvolt = <1800000>;
> @@ -712,6 +722,32 @@ &qup0 {
>  	status = "okay";
>  };
>  
> +&uart2 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart2_state>;
pinctrl-0
pinctrl-names
status

> +
> +	bluetooth {
> +		compatible = "qcom,wcn6855-bt";
> +
> +		vddio-supply = <&vreg_s10b>;
> +		vddbtcxmx-supply = <&vreg_s12b>;
> +		vddrfacmn-supply = <&vreg_s12b>;
> +		vddrfa0p8-supply = <&vreg_s12b>;
> +		vddrfa1p2-supply = <&vreg_s11b>;
> +		vddrfa1p7-supply = <&vreg_s1c>;
> +
> +		max-speed = <3200000>;
> +
> +		enable-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
> +		swctrl-gpios = <&tlmm 132 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bt_en>;
pinctrl-0
pinctrl-names

> +	};
> +};
> +
>  &qup1 {
>  	status = "okay";
>  };
> @@ -720,6 +756,12 @@ &qup2 {
>  	status = "okay";
>  };
>  
> +&uart17 {
> +	compatible = "qcom,geni-debug-uart";
> +
Not sure if this newline is necessary.


Konrad
> +	status = "okay";
> +};
> +
>  &remoteproc_adsp {
>  	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn";
>  
> @@ -980,6 +1022,19 @@ hastings_reg_en: hastings-reg-en-state {
>  &tlmm {
>  	gpio-reserved-ranges = <70 2>, <74 6>, <83 4>, <125 2>, <128 2>, <154 7>;
>  
> +	bt_en: bt-en-state {
> +		hstp-sw-ctrl-pins {
> +			pins = "gpio132";
> +			function = "gpio";
> +		};
> +
> +		hstp-bt-en-pins {
> +			pins = "gpio133";
> +			function = "gpio";
> +			drive-strength = <16>;
> +		};
> +	};
> +
>  	edp_reg_en: edp-reg-en-state {
>  		pins = "gpio25";
>  		function = "gpio";
> @@ -1001,6 +1056,27 @@ i2c4_default: i2c4-default-state {
>  		bias-disable;
>  	};
>  
> +	uart2_state: uart2-state {
> +		cts-pins {
> +			pins = "gpio122";
> +			function = "qup2";
> +			bias-disable;
> +		};
> +
> +		rts-tx-pins {
> +			pins = "gpio122", "gpio123";
> +			function = "qup2";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		rx-pins {
> +			pins = "gpio124";
> +			function = "qup2";
> +			bias-pull-up;
> +		};
> +	};
> +
>  	i2c21_default: i2c21-default-state {
>  		pins = "gpio81", "gpio82";
>  		function = "qup21";
