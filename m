Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEB156AA99A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Mar 2023 13:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbjCDM4t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Mar 2023 07:56:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjCDM4s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Mar 2023 07:56:48 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD87A1C337
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Mar 2023 04:56:46 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id t14so5028475ljd.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Mar 2023 04:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677934605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=euPQBZ+O84JepLENNP29sgyAYE/FyQnSuC7CkRcQi40=;
        b=hLbIT1UbpMLRq/ek/YMMS6FD6xnl9kGaC80dx96YCRj/n5I12AJpMVkdLVos+xJLTi
         0L/ph2k17/nnTE+NFOSz8FQTkLjQ3HTKxwl41gmZ9X9EopFTe05XV7F8N5CfnkjjO2h2
         ttayd+McUliZHmciRdBdnNFfZl71bUMX168oMXv8vnzsZCXMha2hvkdinYUQoJOs6UfH
         /l43U5QIIJkzp9DwdYKiCfhk5jdwWBOh/WHzqUkW8DiFjfb5qYboA52SYrcAGfC/Hvo0
         9/lTWGAez2+PHMSfDmT9UqJa5y2Ij0GqPp+0Twhd60UplKU4u/thSYVDHK84YrWoh31g
         t0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677934605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=euPQBZ+O84JepLENNP29sgyAYE/FyQnSuC7CkRcQi40=;
        b=nabQKLdIKSVZsXE76utT5pzV4xxAvKGWoGUtnepPRxbm9dzFqbvtBUgGg0MSIhYYfA
         XZWZVDm5m4+WbhW8brmtvYCs1sQlJZnN2mI/DYsNNIRWAday+1J3jG4wFolDzx6xA6um
         7/gYbsfPeSONm0e8Gg68/JSo/Rbsw8ZhJKY7LU3KcE5tpssiGsb5Yr5r+v9gliqTVs0c
         rQ+m8mVnq7mrXCax5zFMK5AG2qgK+/qocs7k9WZCCQfABQSbY0bb7QxQVOR7RP++TrLo
         8hIPUcd72imFQVDmj7FhR/88/tv+fZFeoI1o3BQM7yobntx5tWfoqhOKoIzMbRNNchL/
         wSrA==
X-Gm-Message-State: AO0yUKU1eCqaGc1lo08vwZmswYVZP8n+gETRrK5zoIJyu7nOgFi9RxaQ
        3wvZlbQJjzO3sEqje4nyspZlsg==
X-Google-Smtp-Source: AK7set/8qZevPIuD1zTF3ZJPXYVYpH4sIrxmQugfumBAh4L1L00sw+ZY9p0Scctj2N68n/w+HUGIdg==
X-Received: by 2002:a2e:a3d7:0:b0:290:6c15:ee26 with SMTP id w23-20020a2ea3d7000000b002906c15ee26mr1317084lje.31.1677934604897;
        Sat, 04 Mar 2023 04:56:44 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id m22-20020a2e97d6000000b00295a33eda65sm773239ljj.137.2023.03.04.04.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Mar 2023 04:56:44 -0800 (PST)
Message-ID: <10f8c7b5-2237-d2ac-cfbb-776e25272085@linaro.org>
Date:   Sat, 4 Mar 2023 13:56:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/8] arm64: dts: qcom: sm8150-kumano: correct GPIO keys
 wakeup
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230304123358.34274-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230304123358.34274-1-krzysztof.kozlowski@linaro.org>
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
>   sm8150-sony-xperia-kumano-bahamut.dtb: gpio-keys: key-camera-focus: Unevaluated properties are not allowed ('gpio-key,wakeup' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
> index ff77cc3c879a..47e2430991ca 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
> @@ -59,7 +59,7 @@ key-camera-focus {
>  			gpios = <&pm8150b_gpios 2 GPIO_ACTIVE_LOW>;
>  			debounce-interval = <15>;
>  			linux,can-disable;
> -			gpio-key,wakeup;
> +			wakeup-source;
>  		};
>  
>  		key-camera-snapshot {
> @@ -68,7 +68,7 @@ key-camera-snapshot {
>  			gpios = <&pm8150b_gpios 1 GPIO_ACTIVE_LOW>;
>  			debounce-interval = <15>;
>  			linux,can-disable;
> -			gpio-key,wakeup;
> +			wakeup-source;
>  		};
>  
>  		key-vol-down {
> @@ -77,7 +77,7 @@ key-vol-down {
>  			gpios = <&pm8150_gpios 1 GPIO_ACTIVE_LOW>;
>  			debounce-interval = <15>;
>  			linux,can-disable;
> -			gpio-key,wakeup;
> +			wakeup-source;
>  		};
>  	};
>  
