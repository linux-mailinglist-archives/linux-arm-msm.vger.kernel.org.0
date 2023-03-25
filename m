Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB026C8DC4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Mar 2023 13:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbjCYMDm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Mar 2023 08:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbjCYMDj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Mar 2023 08:03:39 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C5367AB2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 05:03:32 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id o20so1350863ljp.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 05:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679745811;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A+HvbnHAFO6mX+JqArCA+vYEYcRN5IjHek0RMpHLSYE=;
        b=pmlxprMkzSvX3zwFUp25X3fcETxfhi7YTQEyol6Hac9WwBrOuVVgMbQPKY7oO8O8Xx
         P957xQYV2akDnvN6w0yjR57x1D7EN140MWXRSC6p7QTbcwRiDMYJXz3ieqhZlq5+yPQj
         yUsTLd8A1ZcxtXuwT0Kj/L5WBy/wtdq/stJS5LlcYvngVY1MHjPkVlTB8i2aPxMovigi
         L7U9k3/VAPTi8jpMISrCTrADhcFYyWcGyXlKKBKD544/lBEU4ce5hZGWKAqoywHa+bnX
         cs+L6t0rnIMHiOKZEs+IjMNtOnQTmwHAmRGo/vvOF76rfjhr1ifwGUo0zSGVL0txunMl
         jq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679745811;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A+HvbnHAFO6mX+JqArCA+vYEYcRN5IjHek0RMpHLSYE=;
        b=sN19lUH4VZLrqzp7h+8jXx68MwsS6dzlhqJ13GBIyoYAYM6eVH9mUztdGOJgsOr/eh
         xHFmTYrGYFE00hDuRcoUTCbDggJ2093iBOtYQB5DfUsYLJAvs9+5B0Q/kFk0KAFJk8vX
         QrEUYTe9JAUR2KIhraBKLL/AtQA2XzGWmE5dNHmst17kvR+RtGzl4SaG5jZZHicgCH0z
         hwpUvK+iOUN1CPQiQHF6NJfpqVkYnAKHYVYFu/WBJ8z7SxPonRu8qLzi0J2x6HuB6RnZ
         FaAT+3Mborwpglt+xJHhwmTxw26y5CGBLaRqYgTlT7Z3ytyvIg+sI3d8EMkwhcB8sSS/
         jJ3g==
X-Gm-Message-State: AAQBX9eTpOcUWPcSuzhX0oSpuEvgl0l2uFWg8s2COcLnDGKk/FJBA7D5
        VT8KNyf1tFCG/TRAQXMAy6k4LQ==
X-Google-Smtp-Source: AKy350ZGsgRIDOvaMDS3h3addre0DOEsaX5Ta6RVe2+xSwrnaX50tJynYFBELwXJsjD0h7OfZv9lUw==
X-Received: by 2002:a2e:9c04:0:b0:29e:e7b1:1202 with SMTP id s4-20020a2e9c04000000b0029ee7b11202mr1671306lji.43.1679745810922;
        Sat, 25 Mar 2023 05:03:30 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id n12-20020a2e904c000000b00299f0194108sm3786959ljg.31.2023.03.25.05.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 05:03:30 -0700 (PDT)
Message-ID: <adea74ab-5fdf-f073-a2c7-d39f5d3cd2bd@linaro.org>
Date:   Sat, 25 Mar 2023 13:03:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/5] arm64: dts: qcom: msm8994-msft-lumia: drop simple-bus
 from clocks
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230324202244.744271-1-krzysztof.kozlowski@linaro.org>
 <20230324202244.744271-3-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230324202244.744271-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 24.03.2023 21:22, Krzysztof Kozlowski wrote:
> 'clocks' node is not a bus, but just a placeholder for clocks:
> 
>   msm8992-msft-lumia-octagon-talkman.dtb: clocks: $nodename:0: 'clocks' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
>     From schema: dtschema/schemas/simple-bus.yaml
>   msm8992-msft-lumia-octagon-talkman.dtb: clocks: xo-board: {'compatible': ['fixed-clock'], '#clock-cells': [[0]], ...
>     From schema: dtschema/schemas/simple-bus.yaml
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
> index 0c112b7b57ea..2861bcdf87b7 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
> @@ -46,8 +46,6 @@ chosen {
>  	};
>  
>  	clocks {
> -		compatible = "simple-bus";
> -
>  		divclk4: divclk4 {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
