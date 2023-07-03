Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15CA8745B9B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 13:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231420AbjGCLvL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 07:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjGCLvK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 07:51:10 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC881AD
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 04:51:08 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fb7769f15aso6770827e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 04:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688385066; x=1690977066;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9WLZQDTgDdy/lxeM29bIajrql/HESkHjJ2jkNrkBR2Q=;
        b=o/OBrgb3xNmP/HYUvDKaAk3qetJnv2wB25G0nTDnux1zvjGwnN7TMpbIjgr6W0sgmU
         LrbI5rDSHeOVNull7YzyL89B83khI35W3tSnfMfZ+JfBpGOqs5sAGSi8qWbhFSOlopy5
         gwUrhtdCY5C1N3kjvwD3b7bDNLc1a7bVN2u5WvNNh82/uK3EpDQ1516KnDEztwmK9MKF
         OQbU6mkN304O1YF8JpefndmX8pOBI+BXgGzGFmdEyMjECMp5rb055D8E0yDkruQQ0wtF
         iq6sg7uxc8Efb48O/gUnbpdlReFuGkkJ4758E/gKxX8hanE4gNZJra3/EWtju2fMd+pz
         uqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688385066; x=1690977066;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9WLZQDTgDdy/lxeM29bIajrql/HESkHjJ2jkNrkBR2Q=;
        b=mBdVhhPeo+vLiTNXrxdNBWcMeemm24Qid73FLvoSlVVcABQzRZZ/5RBO+LZzOuf5Ib
         iGhfM7BmtVKn+bLF6dq1x/YLakkfX1irF8jSGZlOfVIKXTglREup/Y5Xc4pUshV5XJdm
         x5EZsPvIged/b6gtKjzA3VYAWn4m0ZF1VCm7K8FCtCw43YS7LsvWnLDdMENV5urvsFMY
         6KCfHViusRTIeia7f0//BVtiS3epHnbganc2Je067N9WLYwW9EXmUDvuOLt7SLStdLip
         2POIbdRJRSGIq71eTc/LJogjkO3VAgJHl0TXHNAXWQkhBl8cbz4Nw57l5hpbw1pPY1kB
         WAJA==
X-Gm-Message-State: ABy/qLYNAHcZbnmkMxuqLNz7uCX0aCsPLIKN2BRf++AULAHK6mzmIArD
        h4RGYNHt/V+lM8K/1f3MG4eM4g==
X-Google-Smtp-Source: APBJJlGPtz3PWm3uFtBIrSuYIkJYhh05OOPKTleie/Lmw9WDDOOURDcghgpzQr04DmzzunmR7Kr9tQ==
X-Received: by 2002:a19:9147:0:b0:4f9:b649:23d2 with SMTP id y7-20020a199147000000b004f9b64923d2mr6002353lfj.42.1688385066585;
        Mon, 03 Jul 2023 04:51:06 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id c4-20020ac25304000000b004fb8c0f247fsm2951210lfh.129.2023.07.03.04.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 04:51:06 -0700 (PDT)
Message-ID: <f8162527-5c31-ec3b-0ddf-d756fe415671@linaro.org>
Date:   Mon, 3 Jul 2023 13:51:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 15/27] ARM: dts: qcom: pm8058: reorder nodes
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
 <20230702134320.98831-16-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230702134320.98831-16-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2.07.2023 15:43, Dmitry Baryshkov wrote:
> Move pm8058 device nodes to follow the alphanumberic sorting order.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom/pm8058.dtsi | 90 +++++++++++++++---------------
>  1 file changed, 45 insertions(+), 45 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/pm8058.dtsi b/arch/arm/boot/dts/qcom/pm8058.dtsi
> index ad581c3bcbd2..913a511719fa 100644
> --- a/arch/arm/boot/dts/qcom/pm8058.dtsi
> +++ b/arch/arm/boot/dts/qcom/pm8058.dtsi
> @@ -8,15 +8,24 @@ pm8058: pmic {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> -		pm8058_gpio: gpio@150 {
> -			compatible = "qcom,pm8058-gpio",
> -				     "qcom,ssbi-gpio";
> -			reg = <0x150>;
> -			interrupt-controller;
> -			#interrupt-cells = <2>;
> -			gpio-controller;
> -			gpio-ranges = <&pm8058_gpio 0 0 44>;
> -			#gpio-cells = <2>;
> +		pwrkey@1c {
> +			compatible = "qcom,pm8058-pwrkey";
> +			reg = <0x1c>;
> +			interrupt-parent = <&pm8058>;
> +			interrupts = <50 1>, <51 1>;
> +			debounce = <15625>;
> +			pull-up;
> +		};
> +
> +		pm8058_led48: led@48 {
> +			compatible = "qcom,pm8058-keypad-led";
> +			reg = <0x48>;
> +			status = "disabled";
> +		};
> +
> +		vibrator@4a {
> +			compatible = "qcom,pm8058-vib";
> +			reg = <0x4a>;
>  		};
>  
>  		pm8058_mpps: mpps@50 {
> @@ -30,13 +39,22 @@ pm8058_mpps: mpps@50 {
>  			#interrupt-cells = <2>;
>  		};
>  
> -		pwrkey@1c {
> -			compatible = "qcom,pm8058-pwrkey";
> -			reg = <0x1c>;
> -			interrupt-parent = <&pm8058>;
> -			interrupts = <50 1>, <51 1>;
> -			debounce = <15625>;
> -			pull-up;
> +		pm8058_led131: led@131 {
> +			compatible = "qcom,pm8058-led";
> +			reg = <0x131>;
> +			status = "disabled";
> +		};
> +
> +		pm8058_led132: led@132 {
> +			compatible = "qcom,pm8058-led";
> +			reg = <0x132>;
> +			status = "disabled";
> +		};
> +
> +		pm8058_led133: led@133 {
> +			compatible = "qcom,pm8058-led";
> +			reg = <0x133>;
> +			status = "disabled";
>  		};
>  
>  		pm8058_keypad: keypad@148 {
> @@ -49,6 +67,17 @@ pm8058_keypad: keypad@148 {
>  			row-hold = <91500>;
>  		};
>  
> +		pm8058_gpio: gpio@150 {
> +			compatible = "qcom,pm8058-gpio",
> +				     "qcom,ssbi-gpio";
> +			reg = <0x150>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			gpio-controller;
> +			gpio-ranges = <&pm8058_gpio 0 0 44>;
> +			#gpio-cells = <2>;
> +		};
> +
>  		pm8058_xoadc: xoadc@197 {
>  			compatible = "qcom,pm8058-adc";
>  			reg = <0x197>;
> @@ -109,35 +138,6 @@ rtc@1e8 {
>  			interrupts = <39 1>;
>  			allow-set-time;
>  		};
> -
> -		vibrator@4a {
> -			compatible = "qcom,pm8058-vib";
> -			reg = <0x4a>;
> -		};
> -
> -		pm8058_led48: led@48 {
> -			compatible = "qcom,pm8058-keypad-led";
> -			reg = <0x48>;
> -			status = "disabled";
> -		};
> -
> -		pm8058_led131: led@131 {
> -			compatible = "qcom,pm8058-led";
> -			reg = <0x131>;
> -			status = "disabled";
> -		};
> -
> -		pm8058_led132: led@132 {
> -			compatible = "qcom,pm8058-led";
> -			reg = <0x132>;
> -			status = "disabled";
> -		};
> -
> -		pm8058_led133: led@133 {
> -			compatible = "qcom,pm8058-led";
> -			reg = <0x133>;
> -			status = "disabled";
> -		};
>  	};
>  };
>  
