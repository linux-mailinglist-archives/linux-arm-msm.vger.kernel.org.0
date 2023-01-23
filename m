Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA85B6781F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 17:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233213AbjAWQnD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 11:43:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjAWQnC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 11:43:02 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5971D2BF17
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 08:42:39 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id u19so32066635ejm.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 08:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oz9O2z+IVBfv4cXE56ajIYgEI1z8EWwSY7ATfOxkyzU=;
        b=Bds3sKSZkbeHd5MeunsYtYMDA8f0/EGEhw+m+7gHUvDn+6T5/uo2CxmkDRsQdS9x8t
         XtwVxIIN2Lh92yaNDu+BJRISwJ/kBwnzvTICSNrjJh2saZT/JY0aM0aflobTzsujcyA5
         y9BsH8gRGAxZDagq5BtOdGVlBYvL/+mg9K94MAZlUeIQhtNhtNMuAcxjiOLEMpHQ6JC6
         EYlBCdCSR1hoBDW6dWT/Y3Xkss9GUr9oZGqgauTg0S9S40X9wvtO2U2FWCl16laJzwaw
         wkJHkXpC71wTE2MNKW5Kv9mlZbP78enjNb5Vy2h8gl4p8XUid+yQ4amFXg6j06ibiJy7
         lOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oz9O2z+IVBfv4cXE56ajIYgEI1z8EWwSY7ATfOxkyzU=;
        b=VKNaw4j+4OXwCMhF99mUFtJct60ptXnZp9urrcLZn1Vsvk6aR1vNADmJWQB7RKE873
         I7R/dog1dxZ9vyCzWo+p6zWLe1oTPgMa0SrWIdNfHg4HfWYoOKTFPUIW+ZyA904Bi+X8
         7LqkrjJ8cCbZgALAku16yYSyWsEEGgB4PjTSLyxTeCcJXe5It6SCyGOIPygKdhk5QoY5
         0m7Z8+ql/ey2OLXUA1LH2gnQ5qFPKwnrZJQCwEj/slrq3OKgNF6x0OVabMUXRmQ54s0h
         tOKaMMov2orCOfent4YUlD2WTcFmpCw8iN9QSUXsAWjkHypqqDsVM1C5slFkxG6cAWt5
         up/g==
X-Gm-Message-State: AFqh2kqHfKACg1xu5P5E8fKOg19m/f/ZZVz/Rp352b72vqRwIy4htM0y
        qCvs1OmF0Ii4RRUWcAFM0jRa5w==
X-Google-Smtp-Source: AMrXdXvM0dKByeQ25Ewp07t/3M7rn4P3UM12DzVRodzO8ctPfozxh43mopdgduBZasU6idAkhDM7Dw==
X-Received: by 2002:a17:907:29c4:b0:86e:a761:c5bd with SMTP id ev4-20020a17090729c400b0086ea761c5bdmr21734761ejc.34.1674492157401;
        Mon, 23 Jan 2023 08:42:37 -0800 (PST)
Received: from [192.168.1.101] (abxi24.neoplus.adsl.tpnet.pl. [83.9.2.24])
        by smtp.gmail.com with ESMTPSA id u9-20020a1709061da900b00877a351cedcsm5167351ejh.110.2023.01.23.08.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 08:42:36 -0800 (PST)
Message-ID: <060f2917-da5a-22c8-33e9-c7350078ed4c@linaro.org>
Date:   Mon, 23 Jan 2023 17:42:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 3/5] ARM: dts: qcom: msm8974-oneplus-bacon: Add volume
 keys and hall sensor
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230122-msm8974-bacon-features-v1-0-4049f565c24c@z3ntu.xyz>
 <20230122-msm8974-bacon-features-v1-3-4049f565c24c@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230122-msm8974-bacon-features-v1-3-4049f565c24c@z3ntu.xyz>
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



On 22.01.2023 17:48, Luca Weiss wrote:
> Add nodes for the volume buttons and the hall sensor that are found on
> the device.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  .../arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
> index 63180fe1d292..10ba3c94e26d 100644
> --- a/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
> @@ -19,6 +19,38 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_keys_default>, <&gpio_hall_sensor_default>;
pinctrl-N
pinctrl-names

please

> +
> +		key-volume-down {
> +			label = "Volume Down";
> +			gpios = <&pm8941_gpios 2 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			wakeup-source;
> +			debounce-interval = <15>;
> +		};
> +
> +		key-volume-up {
> +			label = "Volume Up";
> +			gpios = <&pm8941_gpios 5 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +			wakeup-source;
> +			debounce-interval = <15>;
> +		};
> +
> +		event-hall-sensor {
> +			label = "Hall Effect Sensor";
> +			gpios = <&tlmm 68 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			linux,can-disable;
> +			debounce-interval = <150>;
> +		};
> +	};
>  };
>  
>  &blsp1_i2c1 {
> @@ -95,6 +127,17 @@ &pm8941_coincell {
>  	status = "okay";
>  };
>  
> +&pm8941_gpios {
> +	gpio_keys_default: gpio-keys-active-state {
> +		pins = "gpio2", "gpio5";
> +		function = "normal";
> +
Unnecessary newline

Konrad
> +		input-enable;
> +		bias-disable;
> +		power-source = <PM8941_GPIO_S3>;
> +	};
> +};
> +
>  &pm8941_vib {
>  	status = "okay";
>  };
> @@ -349,6 +392,13 @@ &sdhc_1 {
>  };
>  
>  &tlmm {
> +	gpio_hall_sensor_default: gpio-hall-sensor-default-state {
> +		pins = "gpio68";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-up;
> +	};
> +
>  	sdc1_on: sdc1-on-state {
>  		clk-pins {
>  			pins = "sdc1_clk";
> 
