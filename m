Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAF926CCED1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 02:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjC2AdS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 20:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjC2AdR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 20:33:17 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 959A51BD1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 17:33:15 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id j11so18020273lfg.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 17:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680049994;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1cWLenDml9QEyh634Ft1tBrvF5LOzf+yeqtGoSOmnPs=;
        b=d/ySbksxMNFXvwAHPRcrjtnCs66crKjYJLRRZBGYyu7IooWiq4RGdDrsDNiHEXvwz5
         BLnBzYmheDYCvPQD6Wmz0mTFuHnXWaS7nStkaqczLwmRQ/M84M7oXUWkAM+Jqmg3A2Cr
         GxDaen6dPg7jDPi0+Y3u6WrKDp8yOhTKYgx9XRdi2uL+wZJibV+SzhO38t4AdqNNMnsM
         bvz2J+goqf8m9qpfhuuDsqDX+vf11oFjJQSgUNteNQYl83Kzu9G6PPogneNHU6d7SpFK
         W9H6rR2t0mPXErKSZrCVtZLOfeIAUtwahPf6QnfDBnscjaf0VpsalK0cgn1Q3MhO0cwm
         ciHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680049994;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1cWLenDml9QEyh634Ft1tBrvF5LOzf+yeqtGoSOmnPs=;
        b=Ck1ttkrF+w4qnZ2XWI43QzoOnkMCQ4mgOI20/tVtMbacGqzQaRbPhZ7A1r6Znmd2Ex
         hSTK+SN4DU8S3TJ6zPajRbE0M2ERatnbEkM9SlxA8fDRTOuV/0+cHJvzJg5GvvlwmBZa
         nSdSa87lWLNEkImag84vj7jNe6sO5RZ81JKmyFMRfg9WWFH+cBeqLKi0iPVu6LEiel9a
         ipEywwkYZDFVcVS1CkRD/jkefkv5fizQxGAJUN9Qx6LQo946vi0xiZR2Vjz9ZxL57GeJ
         uZ8M1NJB3DbAdSaRGVKwrIrmSrZXitHHLZKGe0HcQFDNIdQt8LNFbvNzt57NU3yoYmLg
         k4jA==
X-Gm-Message-State: AAQBX9fQzFZ9ZDFHTbT2+zV71lz/J4nwBKpBYFn/DzR1Sn92i58lqZNz
        Ji41m6/y/KI7DuAbdCmJtO+t2g==
X-Google-Smtp-Source: AKy350bqX8VPKa0jVQOpcA/2wlpD65xGBF9cizNFBC3dagTLluecTFhhm6LbJ4M8WK4yvTQ2HitQYQ==
X-Received: by 2002:ac2:43c9:0:b0:4ea:fa82:7f75 with SMTP id u9-20020ac243c9000000b004eafa827f75mr4939865lfl.32.1680049993853;
        Tue, 28 Mar 2023 17:33:13 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id w19-20020ac24433000000b004eb00c0d417sm2445182lfl.130.2023.03.28.17.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 17:33:13 -0700 (PDT)
Message-ID: <281c27da-a0a9-b866-b156-50db681cd656@linaro.org>
Date:   Wed, 29 Mar 2023 02:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 4/6] arm64: dts: qcom: pm8350: include SID into labels
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        devicetree@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
References: <20230329000833.2507594-1-dmitry.baryshkov@linaro.org>
 <20230329000833.2507594-5-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230329000833.2507594-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 29.03.2023 02:08, Dmitry Baryshkov wrote:
> The platform can use several instances of PM8350 PMIC. Include SID into
> all the labels to simplify such platforms configuration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8350.dtsi          | 31 +++++++++++++------
>  .../dts/qcom/sm8350-sony-xperia-sagami.dtsi   |  4 +--
>  .../dts/qcom/sm8450-sony-xperia-nagara.dtsi   |  4 +--
>  3 files changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8350.dtsi b/arch/arm64/boot/dts/qcom/pm8350.dtsi
> index 2dfeb99300d7..f1ef242760f2 100644
> --- a/arch/arm64/boot/dts/qcom/pm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8350.dtsi
> @@ -6,21 +6,30 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/spmi/spmi.h>
>  
> +/* (Sadly) this PMIC can be configured to be at different SIDs */
> +#ifndef PM8350_SID
> +	#define PM8350_SID 1
> +#endif
> +
> +#define __LABEL(pmic, sid, name) pmic ## _ ## sid ## _ ## name
> +#define _LABEL(pmic, sid, name) __LABEL(pmic, sid, name)
Perhaps that should go to some Qcom PMIC-common include now!

Also, at one point, an idea came up to stop writing so much dt, I'm
not necessarily a fan of creating .dtsc (like ACPI-C sources), but
perhaps we could explore having e.g. a "gen_dt.py" which would take
in some data and generate device trees based on that.. Not very
related to this patch, but I'm just throwing it in the open


Konrad
> +#define LABEL(name) _LABEL(pm8350, PM8350_SID, name)
> +
>  / {
>  	thermal-zones {
> -		pm8350_thermal: pm8350c-thermal {
> +		LABEL(thermal): pm8350c-thermal {
>  			polling-delay-passive = <100>;
>  			polling-delay = <0>;
> -			thermal-sensors = <&pm8350_temp_alarm>;
> +			thermal-sensors = <&LABEL(temp_alarm)>;
>  
>  			trips {
> -				pm8350_trip0: trip0 {
> +				LABEL(trip0): trip0 {
>  					temperature = <95000>;
>  					hysteresis = <0>;
>  					type = "passive";
>  				};
>  
> -				pm8350_crit: pm8350c-crit {
> +				LABEL(crit): pm8350c-crit {
>  					temperature = <115000>;
>  					hysteresis = <0>;
>  					type = "critical";
> @@ -33,25 +42,29 @@ pm8350_crit: pm8350c-crit {
>  &spmi_bus {
>  	pm8350: pmic@1 {
>  		compatible = "qcom,pm8350", "qcom,spmi-pmic";
> -		reg = <0x1 SPMI_USID>;
> +		reg = <PM8350_SID SPMI_USID>;
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> -		pm8350_temp_alarm: temp-alarm@a00 {
> +		LABEL(temp_alarm): temp-alarm@a00 {
>  			compatible = "qcom,spmi-temp-alarm";
>  			reg = <0xa00>;
> -			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			interrupts = <PM8350_SID 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
>  			#thermal-sensor-cells = <0>;
>  		};
>  
> -		pm8350_gpios: gpio@8800 {
> +		LABEL(gpios): gpio@8800 {
>  			compatible = "qcom,pm8350-gpio", "qcom,spmi-gpio";
>  			reg = <0x8800>;
>  			gpio-controller;
> -			gpio-ranges = <&pm8350_gpios 0 0 10>;
> +			gpio-ranges = <&LABEL(gpios) 0 0 10>;
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  		};
>  	};
>  };
> +
> +#undef LABEL
> +#undef _LABEL
> +#undef __LABEL
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
> index e28f49e31b9f..5c09b1d8881b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
> @@ -72,7 +72,7 @@ key-camera-snapshot {
>  
>  		key-google-assist {
>  			label = "Google Assistant Key";
> -			gpios = <&pm8350_gpios 9 GPIO_ACTIVE_LOW>;
> +			gpios = <&pm8350_1_gpios 9 GPIO_ACTIVE_LOW>;
>  			linux,code = <KEY_LEFTMETA>;
>  			debounce-interval = <15>;
>  			linux,can-disable;
> @@ -564,7 +564,7 @@ &mpss {
>  	firmware-name = "qcom/sm8350/Sony/sagami/modem.mbn";
>  };
>  
> -&pm8350_gpios {
> +&pm8350_1_gpios {
>  	gpio-line-names = "ASSIGN1_THERM", /* GPIO_1 */
>  			  "LCD_ID",
>  			  "SDR_MMW_THERM",
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
> index 99e9b776b93d..d90e3fedb742 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
> @@ -56,7 +56,7 @@ key-camera-snapshot {
>  		key-volume-down {
>  			label = "Volume Down";
>  			linux,code = <KEY_VOLUMEDOWN>;
> -			gpios = <&pm8350_gpios 6 GPIO_ACTIVE_LOW>;
> +			gpios = <&pm8350_1_gpios 6 GPIO_ACTIVE_LOW>;
>  			debounce-interval = <15>;
>  			linux,can-disable;
>  			wakeup-source;
> @@ -622,7 +622,7 @@ &pcie0_phy {
>  	status = "okay";
>  };
>  
> -&pm8350_gpios {
> +&pm8350_1_gpios {
>  	gpio-line-names = "ASSIGN1_THERM", /* GPIO_1 */
>  			  "LCD_ID",
>  			  "SDR_MMW_THERM",
