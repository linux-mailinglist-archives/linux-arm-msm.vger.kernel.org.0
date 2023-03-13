Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76B1D6B7184
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 09:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbjCMIt5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 04:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbjCMIt3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 04:49:29 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BAA4C27
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 01:48:01 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id n2so14624984lfb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 01:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678697268;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hkh81Hk4IBD2Mj0Ttoa7j6orABVvinEHcPZpvgXghU=;
        b=fqV5WXhUTox+H0r05qvd5V0i5Scb28L/B4fFjy/NcULkxWMwkcniNK+kYM4CKMD/pw
         9Xjs3XgKCZeJhSkwFiFMw1dRm6Q0jBLp//JVrkhR90Nr1q/tHB1mQAKXaK9Glzt0Cjki
         37ZwxMGmcN0jyIDHre3QbT2sG7NXCzQmPDvwxDErqXzpPgJ91WV0/wRH2ZPBnRvus2sv
         fTSyu6GIRaP/hG8a9sQnK00YPlt5XJ9nY5uJ/AnmDSm7P++eBnecnVKerG+HQJlgSzMT
         2rrZQuDVOJKKrt6gBkdFPr9JbwNy4bbtspJX5BTMpvlKIAB19iE/YrYFzPxRahacY65Y
         yzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678697268;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0hkh81Hk4IBD2Mj0Ttoa7j6orABVvinEHcPZpvgXghU=;
        b=UYFEQt1OY/BMFxjEC28wA+sjdH4HUFHY//m6LZjwmVtZIrsOhM1emPtQ2k6F/lsZot
         Hk8Aq9dNzxaUrjGdPtFTiEzaeyK8xNHISUyVzPxFgxQ0avUdFtWixtx8BGOqM5w3MWWZ
         T+GstqtadlRuPHIKBPzNY9iKKn2H93+WW6k8M4iArK5rm2kDKgzcXqQVN5vQA6wb1t2Z
         L3bAcKfnDPgp2UAJxzr/245Lsp+jzJD384FGmjxAVD9T/HbZBvpxO2DVc6ksycPzPmFn
         nU1cqukj84RxWCtaLtGkPJzVnmGX9TgpX7btsP8hE/s2vRIRwM42BZMlz/NKIsyqKmTB
         5kjQ==
X-Gm-Message-State: AO0yUKUrlupcWbUYt0g7RGG9gm+r17LD1PbcyAEqkjeBC5XDLw5DIjnj
        zaNeFSGjQNntV3TpaxwswkSSBA==
X-Google-Smtp-Source: AK7set9qbJXhjmJWHOynapSYU+hcoQIl8F5J3cM8k/5YjR3JqTFdDJGuSS2aEc07/olbum2nOq1RSw==
X-Received: by 2002:ac2:5fa4:0:b0:4dc:790c:910b with SMTP id s4-20020ac25fa4000000b004dc790c910bmr3221023lfe.20.1678697268483;
        Mon, 13 Mar 2023 01:47:48 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id m6-20020a195206000000b004cee11feda1sm900848lfb.9.2023.03.13.01.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 01:47:48 -0700 (PDT)
Message-ID: <cfff90c2-268b-ad27-2c40-23dd01f0be38@linaro.org>
Date:   Mon, 13 Mar 2023 09:47:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/8] arm64: dts: qcom: sda660-inforce: correct key node
 name
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230312183622.460488-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230312183622.460488-1-krzysztof.kozlowski@linaro.org>
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



On 12.03.2023 19:36, Krzysztof Kozlowski wrote:
> gpio-key bindings expect children to be named with generic prefix:
> 
>   sda660-inforce-ifc6560.dtb: gpio-keys: 'volup' does not match any of the regexes: ...
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> index 7c81918eee66..7459525d9982 100644
> --- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> +++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> @@ -29,7 +29,7 @@ chosen {
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  
> -		volup {
> +		key-volup {
>  			label = "Volume Up";
>  			gpios = <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
>  			linux,code = <KEY_VOLUMEUP>;
