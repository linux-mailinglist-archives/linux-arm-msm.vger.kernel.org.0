Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1F9D6AA9AB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Mar 2023 13:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjCDM6S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Mar 2023 07:58:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjCDM6Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Mar 2023 07:58:16 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EAD91F5CA
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Mar 2023 04:57:48 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id s22so6941049lfi.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Mar 2023 04:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677934666;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HItay+PL2v1GbV7mEtNl/Zx/781VO+kx6PorfBarEts=;
        b=fGMyhkE8TUXu3ksMKFf9OWegAbIavnVQ8msuAK/1+1kUfqXb7UyHSRMM6K5anOxxyZ
         Af8u2SRLxmMznXu3beRe0AnG7DrRtfIWyaX2GQfKom4ZiJj68sqHNBg3VeL2wbNVkIQj
         komjbyZgFWlRHmAwrYJAVj5wCr3AU1GxcN9J+I90HYaUFAtUJ3MVXpw00pH/90pO37yg
         qgy5Y6YJFPUq/oFdVUUALPUlRDE5Aoi2OTMv8QFRx0zHg4lys5/yawPJUucdMYnhdYlJ
         B7RvjL+GunZQPt2nk+YBnawE+gkSRd4nAuhxSG5WioHVupNJhMI94StISCjGl7ADlBdR
         gTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677934666;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HItay+PL2v1GbV7mEtNl/Zx/781VO+kx6PorfBarEts=;
        b=wuyyZttrHT1nRuYvsHWPTioHUVqD+7S6V1yzd1SRN6Vef2sVAWMOwzMB/S45bpbbl7
         nZLw2QwoXZCeW2PM0rDc6UsSs7Pxnz1qfiYJapsbHRkP2orcmy495rEmg2cMeGGtlZ4h
         /2bbU4J4fYM7ltcFmiyM0CaFCyu5VtKqMVuG0kN31osoRzuPAXNJTZbiIHDrSRXN4vPa
         /7xFRPYXbWNEPDW/jDMvEbPOlOYkqvs+HnP/xiEI75zM4JRWrjnj2MDfOf52R//ope7b
         eqdTznOW1jGIQhV0Q75qgFb4KCSDtE9jMDnqD6GdVHWC97T10jeSSJLnHyEGCzy0pPom
         cW3g==
X-Gm-Message-State: AO0yUKXvAzoQPT3WAMEgYUeOYyVtOFvu+z6mYh/y5rhc10Z7VPVK6a6b
        jhDueYGuCi/g62nBBsQ8K+42ww==
X-Google-Smtp-Source: AK7set/2ECzyRzihXfRjdZIX2HDDQQq/RmqC8yQ7qFJv4u6lWF98CzmEfHcxSLhesLOTB6LSnwF3vg==
X-Received: by 2002:a05:6512:76:b0:4dd:a788:7783 with SMTP id i22-20020a056512007600b004dda7887783mr1387482lfo.61.1677934666258;
        Sat, 04 Mar 2023 04:57:46 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id b16-20020ac24110000000b004d862e9b453sm815813lfi.196.2023.03.04.04.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Mar 2023 04:57:45 -0800 (PST)
Message-ID: <9fc18ef2-87ea-33df-864c-916aaef7d3bf@linaro.org>
Date:   Sat, 4 Mar 2023 13:57:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 6/8] arm64: dts: qcom: sm6115p-lenovo-j606f: correct GPIO
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
 <20230304123358.34274-6-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230304123358.34274-6-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4.03.2023 13:33, Krzysztof Kozlowski wrote:
> gpio-keys,wakeup is a deprecated property:
> 
>   sm6115p-lenovo-j606f.dtb: gpio-keys: key-volume-up: Unevaluated properties are not allowed ('gpio-key,wakeup' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
> index 4ce2d905d70e..00b153aa1b7d 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
> @@ -49,7 +49,7 @@ key-volume-up {
>  			gpios = <&pm6125_gpios 5 GPIO_ACTIVE_LOW>;
>  			debounce-interval = <15>;
>  			linux,can-disable;
> -			gpio-key,wakeup;
> +			wakeup-source;
>  		};
>  	};
>  };
