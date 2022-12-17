Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F22664F96E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 15:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbiLQOhd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Dec 2022 09:37:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbiLQOhb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Dec 2022 09:37:31 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3190FCC2
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 06:37:30 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b3so7693773lfv.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 06:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zKefaLMdkxpxFImO9rSvSQrWqze70i5mmS09IwMImn8=;
        b=PsKkXzVjFRhePV5DgBPkWs7gM0/LaJrzsH/TCOM4XTRj3C7Xm/jjPzmxn+eI3xTkyC
         vTsLf5I+2by+mSt9ss9jlOjWY+rqgStuumT8sKu2g6aAptGX9p/Tn0R6tUX8CEvVIOQV
         +tu2G4Ogq88UU0lMfhu23LAg3HRvR9Bd8mHnReybKAwQSouNAFJZDWT9kLPIztxRVwuc
         Mw/rZgr1dHi4CtiyVatvCXs0IpHKZ9amhpYfaTjjkxMvqVOGsTmrWFck44vsU85slmZy
         +ljPr1yuMnxz9SuUzYRQQT10ljmNzVvBUow6CaS8ZFuIdMK7cUzKn4D6L3AeT7VibaFL
         EQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zKefaLMdkxpxFImO9rSvSQrWqze70i5mmS09IwMImn8=;
        b=eWuK0P6LX5BHcEox2VCA0Sis/hSYXkJmuPSdJpFMkv3Vni8qDNPP7YyL1pndk8l3KQ
         980UgQycs+qaRZz0ENj3Gz623TcYkISv1IR9xNkVFif+rizP0DRRpbioqXsJe3nl++Qo
         S3B1rC2Vshoer6Zh4AewpQTlv4uY6o+TETgnyau4LXnXpHrYeA3gr/6dxs8w79fQwoDA
         6YBDhfw88W/w1sjAU1unkTpMXKQcqV6nQPv+fm7jRkraXMfMKMn5k7r6OpCbMbk1lpD8
         VexXrtHymz+8IoSsk1H40MhgwZmt8QpQlut2fVE7Y567ysk6Msgp8bvmEm5sR9NLEhOl
         orog==
X-Gm-Message-State: ANoB5pmdpqViNOo5kGqcY1GhRQNSAVgcHLRfKlQT5Bom9YEcc8Wxeem7
        NkZWHjY2Tz9R81vHVNdhNZOXtQ==
X-Google-Smtp-Source: AA0mqf4/IPa/JxsYHWVYQ1li28TYotjoRYvojuyW7IX0wiypQnqKzGvmwZadIE+nGYPzPpZIwYD8xg==
X-Received: by 2002:a05:6512:32ce:b0:4af:b1de:3ae1 with SMTP id f14-20020a05651232ce00b004afb1de3ae1mr11129778lfg.58.1671287849122;
        Sat, 17 Dec 2022 06:37:29 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id w23-20020a19c517000000b004b5701b5337sm526142lfe.104.2022.12.17.06.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 06:37:28 -0800 (PST)
Message-ID: <b8a13c50-e509-3709-2c69-adc84a9644c5@linaro.org>
Date:   Sat, 17 Dec 2022 15:37:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sa8295p-adp: use sa8540p-pmics
Content-Language: en-US
To:     Eric Chanudet <echanude@redhat.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
        Brian Masney <bmasney@redhat.com>
References: <20221216232606.2123341-1-echanude@redhat.com>
 <20221216232606.2123341-4-echanude@redhat.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221216232606.2123341-4-echanude@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.12.2022 00:26, Eric Chanudet wrote:
> Include the dtsi to use a single pmic descriptions.
> Both sa8295p-adp and sa8540p-adp have the same spmi pmic apparently.
> 
> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 79 +-----------------------
>  1 file changed, 1 insertion(+), 78 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> index 84cb6f3eeb56..c8437efe8235 100644
> --- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/spmi/spmi.h>
>  
>  #include "sa8540p.dtsi"
> +#include "sa8540p-pmics.dtsi"
>  
>  / {
>  	model = "Qualcomm SA8295P ADP";
> @@ -260,84 +261,6 @@ &remoteproc_nsp1 {
>  	status = "okay";
>  };
>  
> -&spmi_bus {
> -	pm8450a: pmic@0 {
> -		compatible = "qcom,pm8150", "qcom,spmi-pmic";
> -		reg = <0x0 SPMI_USID>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		rtc@6000 {
> -			compatible = "qcom,pm8941-rtc";
> -			reg = <0x6000>;
> -			reg-names = "rtc", "alarm";
> -			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
> -			wakeup-source;
> -		};
> -
> -		pm8450a_gpios: gpio@c000 {
> -			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
> -			reg = <0xc000>;
> -			gpio-controller;
> -			gpio-ranges = <&pm8450a_gpios 0 0 10>;
> -			#gpio-cells = <2>;
> -			interrupt-controller;
> -			#interrupt-cells = <2>;
> -		};
> -	};
> -
> -	pm8450c: pmic@4 {
> -		compatible = "qcom,pm8150", "qcom,spmi-pmic";
> -		reg = <0x4 SPMI_USID>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		pm8450c_gpios: gpio@c000 {
> -			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
> -			reg = <0xc000>;
> -			gpio-controller;
> -			gpio-ranges = <&pm8450c_gpios 0 0 10>;
> -			#gpio-cells = <2>;
> -			interrupt-controller;
> -			#interrupt-cells = <2>;
> -		};
> -	};
> -
> -	pm8450e: pmic@8 {
> -		compatible = "qcom,pm8150", "qcom,spmi-pmic";
> -		reg = <0x8 SPMI_USID>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		pm8450e_gpios: gpio@c000 {
> -			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
> -			reg = <0xc000>;
> -			gpio-controller;
> -			gpio-ranges = <&pm8450e_gpios 0 0 10>;
> -			#gpio-cells = <2>;
> -			interrupt-controller;
> -			#interrupt-cells = <2>;
> -		};
> -	};
> -
> -	pm8450g: pmic@c {
> -		compatible = "qcom,pm8150", "qcom,spmi-pmic";
> -		reg = <0xc SPMI_USID>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		pm8450g_gpios: gpio@c000 {
> -			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
> -			reg = <0xc000>;
> -			gpio-controller;
> -			gpio-ranges = <&pm8450g_gpios 0 0 10>;
> -			#gpio-cells = <2>;
> -			interrupt-controller;
> -			#interrupt-cells = <2>;
> -		};
> -	};
> -};
> -
>  &ufs_mem_hc {
>  	reset-gpios = <&tlmm 228 GPIO_ACTIVE_LOW>;
>  
