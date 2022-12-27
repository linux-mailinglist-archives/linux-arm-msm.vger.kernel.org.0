Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5635F6569D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 12:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbiL0LVT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 06:21:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbiL0LVK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 06:21:10 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F6F3218B
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 03:21:09 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id e13so10894489ljn.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 03:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Rr9KwVBocOpEGEus6MIWlUchghbyTf7iLz4w2ytIZE=;
        b=QeqL4LN6kW2G5mp9nfPZFHvHrcJ+jZ9dbvJgrc32HZYtrPZNYoXb9hcnTPHfeBHC5d
         iSUywnBYo7GTP3mxjyRCecjtc5QAITXCZXbX+ACbSSHS5AAEJ+Of33Z2phCOgfASIoz0
         xM0tPRdo3nJZ8A58z0YicDNbgoYLkbyAN0zMSuitG526f/H7hnr7T1BgZXTfrACQ4J5k
         Lz9yvC9zNw4F0aT4WIc7q1pUods5xtQJIAhlBQmrKTYskdNXfvbRp7BWUZpSsNRoJ8ZK
         VL3N5oHJtuZJb/6aRS6akWhaadlZ37UAoozRP0zNhn6wMO0GzFur8c2Csz/ZMWG71wOS
         +TwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Rr9KwVBocOpEGEus6MIWlUchghbyTf7iLz4w2ytIZE=;
        b=KP7+xNa3MujWEqsaFbluTEVduY7nDB08sHuWQStztF8DI+8X2wnDMg2oyKPbcnMgXc
         LrdYm+tKtP/utaDEe0sXpVS0URnldXt6WcgazZYyRq06orbLPdIFBfXje0s1IKv+tu7S
         T+8J4Uzm403U4ueZRGmqE4BHhcihneswtLVDbXBQpR1fGW1gLPfPbLEm43ZiTVOF8T25
         nfECXHPomzg1wI4uAEJvekA6iJQzHiWwjWDIPfoH7PG/bffbNYgNhrGWdJEWF+1ZC9wK
         bdDZStVfb6iZXMRyXNdacIwlwDDxGzVTl6zs8fdoqN0Sw5P6ouRKstY/8dBea6AUoqyX
         Huow==
X-Gm-Message-State: AFqh2kp2RDc7AzifULGbkR8P3sF1Yt6zpGSNrjpCekyDXuNnCfBxsM3s
        oe88QmDu7AW2338+aOIWgc3ONQ==
X-Google-Smtp-Source: AMrXdXvexKQjMlY0zi90dgQteF2tLVKAxfmUMGHkQdiK1CC9FmVpPE/P3WhvJcrdL4YdXwEntwkf4A==
X-Received: by 2002:a05:651c:1725:b0:27f:b31a:aad with SMTP id be37-20020a05651c172500b0027fb31a0aadmr3303169ljb.13.1672140067775;
        Tue, 27 Dec 2022 03:21:07 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id p15-20020a2eb98f000000b0027fbf63901dsm608921ljp.84.2022.12.27.03.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 03:21:07 -0800 (PST)
Message-ID: <df77619d-ef0a-b325-878c-0832ef3d4148@linaro.org>
Date:   Tue, 27 Dec 2022 12:21:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sm8250: drop unused clock-frequency
 from va-macro
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221224154255.43499-1-krzysztof.kozlowski@linaro.org>
 <20221224154255.43499-3-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221224154255.43499-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 24.12.2022 16:42, Krzysztof Kozlowski wrote:
> Neither qcom,sm8250-lpass-va-macro bindings nor the driver use
> "clock-frequency" property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index b5c51203672e..b5920d8a89af 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2263,7 +2263,6 @@ vamacro: codec@3370000 {
>  			clock-names = "mclk", "macro", "dcodec";
>  
>  			#clock-cells = <0>;
> -			clock-frequency = <9600000>;
>  			clock-output-names = "fsgen";
>  			#sound-dai-cells = <1>;
>  		};
