Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4ADC66ADB5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jan 2023 21:35:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbjANUfA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Jan 2023 15:35:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbjANUe7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Jan 2023 15:34:59 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E9C4C05
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jan 2023 12:34:58 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id p25so19780040ljn.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jan 2023 12:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oSosmk2q0rd/nqYyEKeSyJ+7beyfYM/6hm4HaeDuLs8=;
        b=hvIqTQkDVaqCYU0ficPlBpFLBJTEL/jej8/XrmBWi/VGMeHfMu0OMHZbwe7aYEuQmH
         1X5XmayuFEkrk8jEKk0FIx3GDTC+eH4F1gwURDE1TJk23iQ4uwtCyFiIvHGMKfkK8Rom
         kHx38NyyDPPI7MfciBAejVpAzAGLYdTfqt/yq948Sw9IVWqV+F0JIosHNrpt9Sx95Skl
         aRw19USYDqPCfWt1qpqG+8OAStj1E6PiQ6601m0yXCGlSMD2DNxlZ8rPNhupcdYPcBTG
         nsOHHKp+MIgN+staLG+Fdqadnw219FtOldeaKU/+CCYqI2gLK43irA6EvjJ2RQbEPdF+
         3kSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oSosmk2q0rd/nqYyEKeSyJ+7beyfYM/6hm4HaeDuLs8=;
        b=gka1ufiMqiR9mkQQiBEFP6UqVCxF1PKftRs940nzcx0mLXDkYUbxU1bAyqz+p8Aaym
         HzCr3MYZz4mV8N9XslFz2Vo4cZjHwmU7e0o3vUE+y5PEZFXn8ZxjD45iNZY5ps4xmnXR
         mWqSAb2ddSLfFK+unEsDI/kOX4sQ9FcA12ZoMyeFY6n65KTFCgG4yCeXOBU3J7QznFAx
         Y6LN2R+9196t2CLHsd86wo0SkD6pvZvNleIhKNvxC+aj/OO7Hw5f3HdvEHNcF9CNNWzj
         +OIb7aE3YdjFmBJz6NnDtbRIdV9Xqb39zNalZdaB7+8T+l6yVPygkzsEDhElLinU+mcL
         x93A==
X-Gm-Message-State: AFqh2kqbOZ+ZwP3hvnVuvJHGceS7YYFyIKr4xnfjmScayxsjKgGwSC1r
        nR5BhNH0G025ADqiXXub52jLBQ==
X-Google-Smtp-Source: AMrXdXuuhzy8tWf83FNxwj6CWYdNcMJ11r7ZV0lwR87t3IlUORXT6rII3lUrcuhiHoxhc7lXUy77SA==
X-Received: by 2002:a2e:9107:0:b0:28b:6b4f:9110 with SMTP id m7-20020a2e9107000000b0028b6b4f9110mr1725294ljg.2.1673728496587;
        Sat, 14 Jan 2023 12:34:56 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id z7-20020a2e8e87000000b002834cfbd857sm2738928ljk.52.2023.01.14.12.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jan 2023 12:34:56 -0800 (PST)
Message-ID: <281c493c-d2e4-a40a-eff1-781b79c42882@linaro.org>
Date:   Sat, 14 Jan 2023 21:34:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sc8280xp: drop unused properties
 from tx-macro
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230113162245.117324-1-krzysztof.kozlowski@linaro.org>
 <20230113162245.117324-6-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230113162245.117324-6-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.01.2023 17:22, Krzysztof Kozlowski wrote:
> tx-macro does not have children and does not allow address/size cells:
> 
>   sc8280xp-crd.dtb: txmacro@3220000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 5f2bb35a39bf..4986db9d35ad 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -1788,8 +1788,6 @@ txmacro: txmacro@3220000 {
>  			clock-output-names = "mclk";
>  
>  			#clock-cells = <0>;
> -			#address-cells = <2>;
> -			#size-cells = <2>;
>  			#sound-dai-cells = <1>;
>  		};
>  
