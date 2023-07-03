Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9F22745B7B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 13:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbjGCLrB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 07:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbjGCLrA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 07:47:00 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5812F11F
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 04:46:58 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b6a084a34cso63876781fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 04:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688384816; x=1690976816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4iXxqYGW4w/BVK1iKrNjNyLHz3KNDd/kNF6tItOuXyY=;
        b=kJkuUlJsHrNmkaKfaRTmhoUpMrCMKo5c4AVXl7MsifEjXvRNCMh+vp779fxQINfABU
         1/NkMtnByieMPcUU6GDhNdCKX3lHoFqnc2GVhppvz1Zp3VhW+ysbDhXnSw78ZSD16ICs
         F3Hj+IZUoAdN1+hH+DcPBqqPHEFvAKHAj815WZEoaSVCGYKj/G+A4IG+7/bjGEtBx9tS
         3t4cTPfKSIBIdOcaCt8iyHPMOCzbADBrvihqcqddj1nmZSCgEFCjVN/NAUOJxW11V/hb
         GWrH2Dja81XUu+63I/Vhe6/TghOfLyRG6GJUKTnV9xv/6BO7JPFKA93abRP9Yvqqv6G4
         rDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688384816; x=1690976816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4iXxqYGW4w/BVK1iKrNjNyLHz3KNDd/kNF6tItOuXyY=;
        b=dQ8UbZxZvZGIn3LAf9oMTOpvqfB9l/zLRuuL5F7JQ1bTFkSq6PA4/VDFz9ICwI3qg8
         F/UCxKA89rF119Gl8qQxhfneKXTbA2IJl01IMGai1wnlMQkp+2FVL9Zqi6vUEEt5nwae
         RuveewKY/ABdp/Aq4jdfJRd8sKbfvZiRWA/8/Dps2ou+nax23TThTFpSdxPJnkpxjkdv
         Qi8CtmNHDE+nhZUCsSQJuWEU6kLztZ+oCisbeIK4QCy+Vx6Pf6tp9IPgcH3/jKF+u+At
         pH6ilJvYA4sxWfFT/DW+z8TVeDDWJnql6eP+xqLfO6YoKstOVFN+cmHlKNiDJ1KhUXji
         3SaQ==
X-Gm-Message-State: ABy/qLZTEysBlOhh00Rsy4bhP9nXIy3iEptYyjOjeqclOyPXGhcghvc3
        JKF4xr+nqgFCYphIMgCp2Yh9bg==
X-Google-Smtp-Source: APBJJlE0jOBoc8xwsj48HSLfbK9fID34p41m7rAIZ6aj67fhcaXXucFHktflyyGdbCpxyD+6lPrxww==
X-Received: by 2002:a05:6512:3284:b0:4f8:4177:e087 with SMTP id p4-20020a056512328400b004f84177e087mr5493892lfe.47.1688384816628;
        Mon, 03 Jul 2023 04:46:56 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id n15-20020a19550f000000b004e95f53adc7sm4288782lfe.27.2023.07.03.04.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 04:46:56 -0700 (PDT)
Message-ID: <73af2d53-d1b5-e53e-c7d9-0be5aed61fd7@linaro.org>
Date:   Mon, 3 Jul 2023 13:46:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 08/27] ARM: dts: qcom: mdm9615: fix PMIC node labels
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
 <20230702134320.98831-9-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230702134320.98831-9-dmitry.baryshkov@linaro.org>
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
> Change PM8018 node labels to start with pm8018_ prefix, following other
> Qualcomm PMIC device nodes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi |  2 +-
>  arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi        | 14 +++++++-------
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
> index 92c8003dac25..dac3aa793f71 100644
> --- a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
> @@ -76,7 +76,7 @@ reset-out-pins {
>  	};
>  };
>  
> -&pmicgpio {
> +&pm8018_gpio {
>  	usb_vbus_5v_pins: usb-vbus-5v-state {
>  		pins = "gpio4";
>  		function = "normal";
> diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
> index b40c52ddf9b4..e79582c6220b 100644
> --- a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
> @@ -246,7 +246,7 @@ qcom,ssbi@500000 {
>  			reg = <0x500000 0x1000>;
>  			qcom,controller-type = "pmic-arbiter";
>  
> -			pmicintc: pmic {
> +			pm8018: pmic {
>  				compatible = "qcom,pm8018", "qcom,pm8921";
>  				interrupts = <GIC_PPI 226 IRQ_TYPE_LEVEL_HIGH>;
>  				#interrupt-cells = <2>;
> @@ -257,38 +257,38 @@ pmicintc: pmic {
>  				pwrkey@1c {
>  					compatible = "qcom,pm8018-pwrkey", "qcom,pm8921-pwrkey";
>  					reg = <0x1c>;
> -					interrupt-parent = <&pmicintc>;
> +					interrupt-parent = <&pm8018>;
>  					interrupts = <50 IRQ_TYPE_EDGE_RISING>,
>  						     <51 IRQ_TYPE_EDGE_RISING>;
>  					debounce = <15625>;
>  					pull-up;
>  				};
>  
> -				pmicmpp: mpps@50 {
> +				pm8018_mpps: mpps@50 {
>  					compatible = "qcom,pm8018-mpp", "qcom,ssbi-mpp";
>  					interrupt-controller;
>  					#interrupt-cells = <2>;
>  					reg = <0x50>;
>  					gpio-controller;
>  					#gpio-cells = <2>;
> -					gpio-ranges = <&pmicmpp 0 0 6>;
> +					gpio-ranges = <&pm8018_mpps 0 0 6>;
>  				};
>  
>  				rtc@11d {
>  					compatible = "qcom,pm8018-rtc", "qcom,pm8921-rtc";
> -					interrupt-parent = <&pmicintc>;
> +					interrupt-parent = <&pm8018>;
>  					interrupts = <39 IRQ_TYPE_EDGE_RISING>;
>  					reg = <0x11d>;
>  					allow-set-time;
>  				};
>  
> -				pmicgpio: gpio@150 {
> +				pm8018_gpio: gpio@150 {
>  					compatible = "qcom,pm8018-gpio", "qcom,ssbi-gpio";
>  					reg = <0x150>;
>  					interrupt-controller;
>  					#interrupt-cells = <2>;
>  					gpio-controller;
> -					gpio-ranges = <&pmicgpio 0 0 6>;
> +					gpio-ranges = <&pm8018_gpio 0 0 6>;
>  					#gpio-cells = <2>;
>  				};
>  			};
