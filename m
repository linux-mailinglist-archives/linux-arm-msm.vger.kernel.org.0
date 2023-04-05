Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1CA6D82AA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 17:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239135AbjDEPwj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 11:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239157AbjDEPwd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 11:52:33 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1056199
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 08:51:59 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id d7so2239188lfj.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Apr 2023 08:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680709917;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1cKSHRYDJuL73gyjRW08bcPXREGJZF2Tn344M39OF38=;
        b=LfwxblKtQCGZwoKh3PoeIXRtHPJVVM4FtkYoUcBZEZSD0qTAZoNESMw8IGIvsnPzXH
         FlThAoYxVpqi7KyNomuYQvyUfIfmbzzIEmkEhmzFZh+EedgHcGC/En6Izjy4uibkNvaf
         Bb5iaiOG52RKhNsoJALQNXHZB8nYY/xKjQP/YC2lV8S3cfvUHI5mEBuryK1O0Yx3LUei
         rGGRfZC+9nMYBcBZdXuY5oVvMQwW8K6LN2/zCBDeU6VJ+EXG9Ht7BariodNjlKiZdFb3
         8h2Pefb7fQlG2B8rkmkAXafXCTx+qQScNp4p0ekBH0RMS5h6cAF1OOIdr7++qpKeUQNf
         5Qxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680709917;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1cKSHRYDJuL73gyjRW08bcPXREGJZF2Tn344M39OF38=;
        b=hzn2SIiuMEg+OF5WZIFq118wPhGevILGmxyzVDnBz5rWhvffVF6oIANTADSvTlGzcM
         nEyGvrjcdTrPOqL0yrtne3XibIc3Ty/+rHz4O8UvsNfwk8uOudiI9o4bFUQ1PtXoGYpj
         djTRZJhm+jghqH1BEpAwJG1c/E+ILS26tYjR9hIkCbU88bOhQv6DnujndeqHAMSr2cQD
         wyt87UmdfCX4W/oCUtIfOGSlm5nX23L552qfC/1xJ4d/0oqX/O6QFljj0cPzv1A0ail9
         rIV+wo7i43xcmV9PCPGXwgrty/TyqgjlvUEkCP0O0n4JtnrBvsXHxZ2/eR+4sHTY6Qsf
         JUmw==
X-Gm-Message-State: AAQBX9dVtQRAgVFy3V6N+qDAXHpOmSJny/y7JV+X2z3pPW2Uba7kKx9z
        MqraYIa+rruyzIaHtOmpBclItw==
X-Google-Smtp-Source: AKy350ZSCHUxvjWiIhfiuCEHVpI7YqChNofOvbUvUvaGRpYf5wkIQ3wArB3n3zzfM/LeSxeOx7+qfg==
X-Received: by 2002:a19:c209:0:b0:4eb:4552:61aa with SMTP id l9-20020a19c209000000b004eb455261aamr1900518lfc.12.1680709917364;
        Wed, 05 Apr 2023 08:51:57 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id f15-20020ac2532f000000b004e887fd71acsm2857372lfh.236.2023.04.05.08.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 08:51:57 -0700 (PDT)
Message-ID: <94f58e02-0154-491e-094b-f1dadbaa67f0@linaro.org>
Date:   Wed, 5 Apr 2023 17:51:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm8250: simplify
 interrupts-extended
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230405060906.143058-1-krzysztof.kozlowski@linaro.org>
 <20230405060906.143058-4-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230405060906.143058-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5.04.2023 08:09, Krzysztof Kozlowski wrote:
> The parent controller for the interrupt is GIC, so no need for
> interrupts-extended.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 7b78761f2041..fae30dc58eb5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2366,7 +2366,7 @@ txmacro: txmacro@3220000 {
>  		swr2: soundwire-controller@3230000 {
>  			reg = <0 0x03230000 0 0x2000>;
>  			compatible = "qcom,soundwire-v1.5.1";
> -			interrupts-extended = <&intc GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "core";
>  			status = "disabled";
>  
