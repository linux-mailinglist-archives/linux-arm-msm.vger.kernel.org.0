Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD02572E4BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 16:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240917AbjFMN76 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 09:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242669AbjFMN7u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 09:59:50 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A06E7A
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 06:59:46 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f62b512fe2so7106360e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 06:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686664784; x=1689256784;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1mADjsfDJkxGtcZrymPiSVSjnbcrh9hAWcbKAPmnEZQ=;
        b=qSj+Zzh+c/VNrK7C4xUDmWi8Y/IduuZfs8jbMeytG/zqUhhLarGebfdUBgdowRfEJH
         INkNeHnxHZ8scsWNNCbjFfME+AmhdXSi9EvSk4l+cpPMyr+4PRDqYUV/c2ergH6l3Dbt
         krQ37YSWEYl3tIiPtLUQuOq+5Zon4bW+n33IW4QlCTdsJ7iyDwOQQv85vZJajl93oO5D
         D1UaRC2pyAOrcLUzYXj7G+Qu+Y3/oRf2wnF0s4W60fFinEv8h9h4jbtox+iGFZffRade
         vcMmLI6/BoBYKVRTDAdKuJV9DrjYheFneCAvNQmktwSZYlSTAt+IBTZ3vyxo7zOZ00nA
         4hgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686664784; x=1689256784;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1mADjsfDJkxGtcZrymPiSVSjnbcrh9hAWcbKAPmnEZQ=;
        b=FJynwX/EI9rhRZXYCV784V7orN0n+CgyYpOKA/k52pEMF2jai0bahrwxSp2EZptGwe
         JCNEIInXUcRZ0BXzr3YEYKmtwOD3rWoyDvZPRaQcmIeTqygQ6+WbGuoq8Lrp0IIKlUC+
         Bmp24EsynrNWRNoR12Vs8RqLGopwlnpKRE8n2jV/ToAe8ha1XjnqsyssA8yl3RFp+uTm
         xfEc9+qf0zeiMuA06VJ1eYMAM3LIZtwDTxFzsKYh0wbFsdxPbxaZgSyDb9KfkqeBHkOI
         3lGrUoEr9ZohF5Wuht4ieW+g+ufkbGnkssR/TRfOGT8xfty/a4Nh8h7VkhQWM0tLf0qK
         Reqw==
X-Gm-Message-State: AC+VfDzpKQzCyJB5HMUIXh9liorXx32gKxCFsD5RjCsDzV2Wdz40auMN
        skWL+HgUJpvp9l2C+Ebox5PeUA==
X-Google-Smtp-Source: ACHHUZ7riD3zaD6lw0pGI8tv6DWzKltKqyB2z9V2gdqksMlF5U3hUTpQIGJAMLjSLqp5WgCqwHpHTw==
X-Received: by 2002:a19:6446:0:b0:4e8:5e39:6234 with SMTP id b6-20020a196446000000b004e85e396234mr5437012lfj.16.1686664784348;
        Tue, 13 Jun 2023 06:59:44 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id k12-20020ac2456c000000b004f60d782682sm1777815lfm.220.2023.06.13.06.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 06:59:44 -0700 (PDT)
Message-ID: <4f2e7e6a-31fa-f35b-ca51-7374580931c9@linaro.org>
Date:   Tue, 13 Jun 2023 15:59:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] arm64: dts: qcom: qrb5165-rb5: fix thermal zone conflict
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230613131224.666668-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230613131224.666668-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.06.2023 15:12, Dmitry Baryshkov wrote:
> The commit 3a786086c6f8 ("arm64: dts: qcom: Add missing "-thermal"
> suffix for thermal zones") renamed the thermal zone in the pm8150l.dtsi
> file to comply with the schema. However this resulted in a clash with
> the RB5 board file, which already contained the pm8150l-thermal zone for
> the on-board sensor. This resulted in the board file definition
> overriding the thermal zone defined in the PMIC include file (and thus
> the on-die PMIC temp alarm was not probing at all).
> 
> Rename the thermal zone in qcom/qrb5165-rb5.dts to remove this override.
> 
> Fixes: 3a786086c6f8 ("arm64: dts: qcom: Add missing "-thermal" suffix for thermal zones")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Wonder if one can add some sort of non-label override warnings in
dtc.. That would be useful!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index dd924331b0ee..ec066a89436a 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -121,7 +121,7 @@ active-config0 {
>  			};
>  		};
>  
> -		pm8150l-thermal {
> +		pm8150l-pcb-thermal {
>  			polling-delay-passive = <0>;
>  			polling-delay = <0>;
>  			thermal-sensors = <&pm8150l_adc_tm 1>;
