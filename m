Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 240A367E4CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 13:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbjA0MMm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 07:12:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232785AbjA0MMV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 07:12:21 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAFE18306E
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 04:06:41 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id s3so4560509edd.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 04:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HJ2NjQXcqXdRVl5VMFDhhQWaQWB8ySKN7vsz4BGLMDg=;
        b=Qe21yJb8985M2arX8ZeewrE3oge1uk6YFGa2LIl799xSe7aGQk809YqBThWAUprpyJ
         jN3Rqdm3fK3JV1huv4bQ7Aqejn+/tL89XH+2JmEdJHpwETk0HLJ4ZKPvSbPYFt4KBkrk
         uWVeS3u80Jfj5UXZKSW9ItbFEz2GB9wi5VDFaJ9NTjIcHte+DLa06jYg0VCq9cbry7og
         ZYfdIgjWGNikwPg3dHxlR+oxUM/0Dsr7jocR6gMhXCHo5yB+xsu5/9zHzDFcZrZaM7Kb
         wmjgaeGX9Z91frKbe80R5nHSeOjaDUJQY7lrarM8y2v97YUaY5dAwR4t8d/75LycKuF0
         rpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HJ2NjQXcqXdRVl5VMFDhhQWaQWB8ySKN7vsz4BGLMDg=;
        b=1HRZSK9WyC9fF32FttIFBNTxX+7O0gZXuLjHqpKgteuYho9fPgnVXOeM+tvnRnGT1Z
         iP/XZMWJ2h7KOYFeCf5NoL0yffqprXF+XMRZ8Bbnt3pN2rqwpJKAWTbU+GCVd8/uTlh6
         vbh4lJpnCVhZaVoBVoFWwolCVFeNKep0VI6+fDFaSBOtrtmiVdrIvSv6rG1IwvQvsYWb
         fDBxuM0Udh/22/dSgfYEo7OX0vWzaOluHSmFGLj91wcupfw9KFIvG5MfxLGv/X58gml5
         4bUgdAYM7h40cvtNJw8eN416/Sd2VkfgzvCMe0muPBSKb+yrnTSw4LNBv+V1aV/PQfLn
         hBBA==
X-Gm-Message-State: AFqh2ko4CMT2f6EilLerK0Q0b5Que3bNNtNhZB3nQms5Cx0iUljlY1c0
        RENIXxLLhV/QvNGnRCGcpUBvUaW0wXcOu1jg
X-Google-Smtp-Source: AK7set+kfaz+Uwb52Ks+u4MI258mb7NZ3dwQP1UzLnvSJ/B/H3DTUJfy807BO6FVJiU3enExoSbHbg==
X-Received: by 2002:a05:6402:26c8:b0:49f:da01:a412 with SMTP id x8-20020a05640226c800b0049fda01a412mr18660429edd.29.1674820376133;
        Fri, 27 Jan 2023 03:52:56 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id n10-20020a056402514a00b0049148f6461dsm758325edd.65.2023.01.27.03.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 03:52:55 -0800 (PST)
Message-ID: <8be6ac00-3a72-68ed-aa11-0758d0e74ca8@linaro.org>
Date:   Fri, 27 Jan 2023 12:52:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 05/11] arm64: dts: qcom: sc8280xp: align RPMh regulator
 nodes with bindings
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230127114347.235963-1-krzysztof.kozlowski@linaro.org>
 <20230127114347.235963-5-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230127114347.235963-5-krzysztof.kozlowski@linaro.org>
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



On 27.01.2023 12:43, Krzysztof Kozlowski wrote:
> Device node names should be generic and bindings expect certain pattern
> for RPMh regulator nodes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts                  | 6 +++---
>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> index 20c629172477..2f43b2fbc2a1 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> @@ -142,7 +142,7 @@ linux,cma {
>  };
>  
>  &apps_rsc {
> -	pmc8280-1-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8350-rpmh-regulators";
>  		qcom,pmic-id = "b";
>  
> @@ -179,7 +179,7 @@ vreg_l6b: ldo6 {
>  		};
>  	};
>  
> -	pmc8280c-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pm8350c-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
> @@ -208,7 +208,7 @@ vreg_l13c: ldo13 {
>  		};
>  	};
>  
> -	pmc8280-2-rpmh-regulators {
> +	regulators-2 {
>  		compatible = "qcom,pm8350-rpmh-regulators";
>  		qcom,pmic-id = "d";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index b60185d9bdea..e41b630141fc 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -287,7 +287,7 @@ map1 {
>  };
>  
>  &apps_rsc {
> -	pmc8280-1-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8350-rpmh-regulators";
>  		qcom,pmic-id = "b";
>  
> @@ -338,7 +338,7 @@ vreg_l6b: ldo6 {
>  		};
>  	};
>  
> -	pmc8280c-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pm8350c-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  		vdd-bob-supply = <&vreg_vph_pwr>;
> @@ -372,7 +372,7 @@ vreg_bob: bob {
>  		};
>  	};
>  
> -	pmc8280-2-rpmh-regulators {
> +	regulators-2 {
>  		compatible = "qcom,pm8350-rpmh-regulators";
>  		qcom,pmic-id = "d";
>  
