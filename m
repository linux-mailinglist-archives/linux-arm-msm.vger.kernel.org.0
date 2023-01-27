Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5B8967E486
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 13:04:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233204AbjA0MEg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 07:04:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232048AbjA0MDx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 07:03:53 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DBF081B15
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 03:58:53 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id m2so12599583ejb.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 03:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uU1s+3m1DBLSNe4CWIbSxloC96on8mbihIx3MOx2XX0=;
        b=Xy9lBuF2FL7cKHMMxVmpJxx72GWKBXwP8rmNQejorqj/4CEcgyJOlOVig62u9fDbXE
         vVMH9FQmQ7J2kheB2DEYvyrcIxmVk3VVEnvLSMEVLPbGOUUxAqb1/cn5ULKTzzuqz/Sq
         meIPay9Vp418EYAH4+FFgN5gmkeV8Rff55Q3oRMQG8KXc//bU0G5Dh8qUd83dTBxG+se
         b0uZ5J5Kad3R2md9sza7IkEsxTTLeRJrUG6EscPIA0JO5YsY72mYRB3dTr1o1REy1Pwi
         PhwhfKUmRJbCVbVS29VBCaZ/D2v3HMzHMbx3z5txrGE822sgjt2yMk4NBCSgSvyE1rIj
         VVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uU1s+3m1DBLSNe4CWIbSxloC96on8mbihIx3MOx2XX0=;
        b=6mkVhHRpBcNRRFrPF5bCkkunNBJ4dAix/qrt45JCskF9tpqFpjXSqhj1cRsqazEV8x
         xVdrA3PbZ719SNS+7SF5HpJh1+D18kbU85uqO/aHbPfF0awRIb1qGopABn9iHYwdeL2m
         0q4UOzI18nGOjLhKFtjtQLYh1yX+gF/YpAr2rDsO5+1YP4t0ZClwl6Kxw2zU7MtFgWHx
         l5NA8faolnDGdUAVhbRLbljBbxDWs/3NUuvddrceEh5aXalA50ZTNdAZY8VVhbi9cgsx
         pnPcUAcIYzw5SqF5sW53y30RIV3oxZnA+V/i6jLr2KGv4BmHo61VvQDnxOyHnWyE78ER
         tE5A==
X-Gm-Message-State: AO0yUKWG6iSaYIoz5dq8RpmjE+w7pIBdwh9Z/qYELzlVpRAg9kTeVR0q
        dvtK+IEduytRgsiizBPaLWNfQQFUnKTR1wBR
X-Google-Smtp-Source: AMrXdXs8JNl60aj7KeJKwpbGIrqI6U/oOvwH/WIaV/Tt16X5nDTOGNzjz1w/j0XCTws67HKpFiQU1Q==
X-Received: by 2002:a17:906:60d0:b0:877:612e:516e with SMTP id f16-20020a17090660d000b00877612e516emr114238657ejk.61.1674820652718;
        Fri, 27 Jan 2023 03:57:32 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id i16-20020a17090639d000b008711cab8875sm2080874eje.216.2023.01.27.03.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 03:57:32 -0800 (PST)
Message-ID: <24ddf582-e398-5183-5904-6d80585fd498@linaro.org>
Date:   Fri, 27 Jan 2023 12:57:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 10/11] arm64: dts: qcom: sm8350: align RPMh regulator
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
 <20230127114347.235963-10-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230127114347.235963-10-krzysztof.kozlowski@linaro.org>
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
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts                    | 4 ++--
>  arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts | 4 ++--
>  arch/arm64/boot/dts/qcom/sm8350-mtp.dts                    | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index 5a4c4ea4d122..0dab73c0c537 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -73,7 +73,7 @@ &adsp {
>  };
>  
>  &apps_rsc {
> -	pm8350-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8350-rpmh-regulators";
>  		qcom,pmic-id = "b";
>  
> @@ -178,7 +178,7 @@ vreg_l9b_1p2: ldo9 {
>  		};
>  	};
>  
> -	pm8350c-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pm8350c-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts b/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
> index 00f16cde6c4a..b536ae36ae6d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
> @@ -44,7 +44,7 @@ &adsp {
>  };
>  
>  &apps_rsc {
> -	pm8350-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8350-rpmh-regulators";
>  		qcom,pmic-id = "b";
>  
> @@ -135,7 +135,7 @@ vreg_l9b_1p2: ldo9 {
>  		};
>  	};
>  
> -	pm8350c-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pm8350c-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
> index f70e0de0509c..d21d2aacf201 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
> @@ -43,7 +43,7 @@ &adsp {
>  };
>  
>  &apps_rsc {
> -	pm8350-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8350-rpmh-regulators";
>  		qcom,pmic-id = "b";
>  
> @@ -134,7 +134,7 @@ vreg_l9b_1p2: ldo9 {
>  		};
>  	};
>  
> -	pm8350c-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pm8350c-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
