Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF88E6AA9A1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Mar 2023 13:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjCDM5M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Mar 2023 07:57:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjCDM5L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Mar 2023 07:57:11 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DCC21C7C5
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Mar 2023 04:57:09 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id m6so6972457lfq.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Mar 2023 04:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677934627;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mO1sAXF+6QCjiffJElUIidRoOLXs18nn/yCVfg1HHf0=;
        b=G6hdCQqAS66LcJxdvvQM4J/dxjpaNIYr3FXiPZGwCMbQme2JTT8fqkDAJty5nmbxvz
         D4YNKwegEBOD9BZkevBL8sXgOXv9M0bwrCmxwOuT1yn9ZWz80+BM9wXh7c3bApY3Vjha
         Q+CVIHxBnZvxX42cTT7JXN2cByskke6lbfmv3fNwx3W+2MOmBr65kcOIp36JRrGi5thZ
         xqte6FlPMTczG450wzxx4rCwpohi8XWic+RF1YeKYLwC3V67/GJ8LMmsXCUHbak3HWx5
         LRP/thcVAHdiA/8bu5MzId9XIfRfecs3gpYWLhP+lpXO+cLtU2OddnehDyk1vXTJ2jUI
         ic2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677934627;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mO1sAXF+6QCjiffJElUIidRoOLXs18nn/yCVfg1HHf0=;
        b=m359gECJzLCZxbQR/Jxm0cqBKMtSST6n3tsr+iT7DApM/QlOAIxcOsRLiMLZumGj/8
         x2LP86Y8IQz49g1LqBF+N9Ao4OXHM5xs24YQSeI1j+c0rb/FIKOEHKEszOtzAQ91TfiS
         KeRgdmKWiK8umCR/ADZLkLfP/72EE4yr8h92ZJkoAdOW0TROokxzWMZ+cdVrKzwpiBnO
         2Wj5iI+v6Kd4D+7cDjU7moNwu9ezcfzMufr/2h9jYJkGqnPkCCVs6NJLFctnWNmcUMKW
         x6ReKDYoo+VlCSluXKXDX6oCvQlng6yJlWRbbeOUWCq5Latm4ELGNvU4YC/vDsR3ohCg
         nQOg==
X-Gm-Message-State: AO0yUKWyzx9oap0DRlekRMxqOZ0WPKW6zmLv3xHndmm2AuPpyzRTr+cS
        mUouOn9RwJvgKZjfyblizuHkQQ==
X-Google-Smtp-Source: AK7set/pM1O8i2E4JIFrEIbS3FewijpoZXdJc9G5pgsdAvYTUhCv5xzaGCNOom4rmGQJP4opno9y8g==
X-Received: by 2002:ac2:560b:0:b0:4db:2c28:8974 with SMTP id v11-20020ac2560b000000b004db2c288974mr1508158lfd.12.1677934627402;
        Sat, 04 Mar 2023 04:57:07 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id 7-20020ac24847000000b004dcfee9e4a9sm809212lfy.247.2023.03.04.04.57.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Mar 2023 04:57:07 -0800 (PST)
Message-ID: <19c95fa7-d436-5171-e3bb-d466ace1fe74@linaro.org>
Date:   Sat, 4 Mar 2023 13:57:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/8] arm64: dts: qcom: msm8998-sony-xperia: correct GPIO
 keys wakeup
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230304123358.34274-1-krzysztof.kozlowski@linaro.org>
 <20230304123358.34274-3-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230304123358.34274-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4.03.2023 13:33, Krzysztof Kozlowski wrote:
> gpio-keys,wakeup is a deprecated property:
> 
>   msm8998-sony-xperia-yoshino-lilac.dtb: gpio-keys: button-vol-down: Unevaluated properties are not allowed ('gpio-key,wakeup' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
> index 820414758888..fa02e45f1c24 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
> @@ -106,7 +106,7 @@ button-vol-down {
>  			gpios = <&pm8998_gpios 5 GPIO_ACTIVE_LOW>;
>  			linux,input-type = <EV_KEY>;
>  			linux,code = <KEY_VOLUMEDOWN>;
> -			gpio-key,wakeup;
> +			wakeup-source;
>  			debounce-interval = <15>;
>  		};
>  
> @@ -138,7 +138,7 @@ event-hall-sensor0 {
>  			gpios = <&tlmm 124 GPIO_ACTIVE_LOW>;
>  			linux,input-type = <EV_SW>;
>  			linux,code = <SW_LID>;
> -			gpio-key,wakeup;
> +			wakeup-source;
>  			debounce-interval = <30>;
>  		};
>  	};
