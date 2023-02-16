Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B729E6991E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 11:41:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbjBPKlH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 05:41:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbjBPKlF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 05:41:05 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 517BA552BE
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 02:40:38 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id f34so2193622lfv.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 02:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/TVWhVS43s8xDTAu0t2V/t7Nq7LdTHIHkKeaMryH4Dw=;
        b=q7CEIQTncSwHCByYjvipay1UBSR9Po1wQOLBdCiWR04BpfIWqRfCcX0Avkm2EVspIc
         980fjttopa6W1IiD6pEyZqojw6xtE8pEpKKoqcpro22bdfxg9e3now6TyKMHdrEzTSJ6
         1QAFhrFTjxezZoGyOx+qVebjZkNC5msyb2HQV20M4VV2bWYpGdukR9Up/o60kD5wo9FW
         X0+A7kii82a381BlLBe5Dkzr0R4W9PCXQBadiW9euN4J6ez/MdnM3aGZdM545zc9u7vA
         yv3sEWfVCZJFYx0Wy/wCC9P8B04nGvOKIjdRHdDdS2LS14d8zaWBuMnDr48+/6O08xDZ
         Ooaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/TVWhVS43s8xDTAu0t2V/t7Nq7LdTHIHkKeaMryH4Dw=;
        b=6C8bLHXwLxmlTxjl/L8qHUFQsygjmsbf+5Y+DYqpj/aLfPKGxUPdtAwGkzaU9ikU/k
         Fj6Q6Hwb5ZqU1QknuFndoxuqBmvvY5UTGZq4SWrOxfMAU2uit2uejuMZITfU7C+5xoYV
         zJv53qLngUXdJfGGlB7PT20fQt2229+X18pxA0aQZVGrdye8x72u2N6NadL4XBpFmp6L
         coHAwMkQZCqr69JSgz/jlXKatbaK0DMRq4xtWrXt0/arS963goPWmT8v7+33G7ILQpQc
         JqhAiJ5h99kWigAToC3qUfUpKk7Gi6unOqLgFXl7RFz7gg00euAf1pO+n97KMdf+ZumP
         BJkA==
X-Gm-Message-State: AO0yUKXKDK8lZy7N3GC5m7cmbwcrlt0AKI8SMCugpjdpeAyoOCqho0sn
        vi9e4l238FCuXTvYvc5i6tln8A==
X-Google-Smtp-Source: AK7set8Pn1dglUEj361rqazSx8r+nK4K40+DVDgT36Edlslmw/QhRlSMuiMduYXdi4SZSsHKdSJ3uA==
X-Received: by 2002:a19:5510:0:b0:4db:3e1a:fc7 with SMTP id n16-20020a195510000000b004db3e1a0fc7mr1633950lfe.31.1676544024408;
        Thu, 16 Feb 2023 02:40:24 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id u9-20020ac251c9000000b004b40c1f1c70sm245132lfm.212.2023.02.16.02.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 02:40:24 -0800 (PST)
Message-ID: <a6e099d1-a201-cdb6-f037-42f94642d8c6@linaro.org>
Date:   Thu, 16 Feb 2023 11:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RESEND PATCH 12/12] arm64: dts: qcom: sm6115: Supply clock from
 cpufreq node to CPUs
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, viresh.kumar@linaro.org
References: <20230215070400.5901-1-manivannan.sadhasivam@linaro.org>
 <20230215070400.5901-13-manivannan.sadhasivam@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230215070400.5901-13-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 15.02.2023 08:04, Manivannan Sadhasivam wrote:
> Qualcomm platforms making use of CPUFreq HW Engine (EPSS/OSM) supply clocks
> to the CPU cores. But this relationship is not represented in DTS so far.
> 
> So let's make cpufreq node as the clock provider and CPU nodes as the
> consumers. The clock index for each CPU node is based on the frequency
> domain index.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index 4d6ec815b78b..f55b193139bf 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -39,6 +39,7 @@ CPU0: cpu@0 {
>  			device_type = "cpu";
>  			compatible = "qcom,kryo260";
>  			reg = <0x0 0x0>;
> +			clocks = <&cpufreq_hw 0>;
>  			capacity-dmips-mhz = <1024>;
>  			dynamic-power-coefficient = <100>;
>  			enable-method = "psci";
> @@ -54,6 +55,7 @@ CPU1: cpu@1 {
>  			device_type = "cpu";
>  			compatible = "qcom,kryo260";
>  			reg = <0x0 0x1>;
> +			clocks = <&cpufreq_hw 0>;
>  			capacity-dmips-mhz = <1024>;
>  			dynamic-power-coefficient = <100>;
>  			enable-method = "psci";
> @@ -65,6 +67,7 @@ CPU2: cpu@2 {
>  			device_type = "cpu";
>  			compatible = "qcom,kryo260";
>  			reg = <0x0 0x2>;
> +			clocks = <&cpufreq_hw 0>;
>  			capacity-dmips-mhz = <1024>;
>  			dynamic-power-coefficient = <100>;
>  			enable-method = "psci";
> @@ -76,6 +79,7 @@ CPU3: cpu@3 {
>  			device_type = "cpu";
>  			compatible = "qcom,kryo260";
>  			reg = <0x0 0x3>;
> +			clocks = <&cpufreq_hw 0>;
>  			capacity-dmips-mhz = <1024>;
>  			dynamic-power-coefficient = <100>;
>  			enable-method = "psci";
> @@ -87,6 +91,7 @@ CPU4: cpu@100 {
>  			device_type = "cpu";
>  			compatible = "qcom,kryo260";
>  			reg = <0x0 0x100>;
> +			clocks = <&cpufreq_hw 1>;
>  			enable-method = "psci";
>  			capacity-dmips-mhz = <1638>;
>  			dynamic-power-coefficient = <282>;
> @@ -102,6 +107,7 @@ CPU5: cpu@101 {
>  			device_type = "cpu";
>  			compatible = "qcom,kryo260";
>  			reg = <0x0 0x101>;
> +			clocks = <&cpufreq_hw 1>;
>  			capacity-dmips-mhz = <1638>;
>  			dynamic-power-coefficient = <282>;
>  			enable-method = "psci";
> @@ -113,6 +119,7 @@ CPU6: cpu@102 {
>  			device_type = "cpu";
>  			compatible = "qcom,kryo260";
>  			reg = <0x0 0x102>;
> +			clocks = <&cpufreq_hw 1>;
>  			capacity-dmips-mhz = <1638>;
>  			dynamic-power-coefficient = <282>;
>  			enable-method = "psci";
> @@ -124,6 +131,7 @@ CPU7: cpu@103 {
>  			device_type = "cpu";
>  			compatible = "qcom,kryo260";
>  			reg = <0x0 0x103>;
> +			clocks = <&cpufreq_hw 1>;
>  			capacity-dmips-mhz = <1638>;
>  			dynamic-power-coefficient = <282>;
>  			enable-method = "psci";
> @@ -2123,6 +2131,7 @@ cpufreq_hw: cpufreq@f521000 {
>  			clock-names = "xo", "alternate";
>  
>  			#freq-domain-cells = <1>;
> +			#clock-cells = <1>;
>  		};
>  	};
>  
