Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0D2C62F6EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 15:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242215AbiKRONj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 09:13:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242211AbiKRONf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 09:13:35 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498886561
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 06:13:32 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id s24so6894023ljs.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 06:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cqLaNkblV1LV9pgYgi/64RZJna6jVfmG5ouM5RL4vvs=;
        b=q1CS8BiaLWEYfYmqXbHtd0JgL2ss0AyvGG14nZ7+2STHpjpNusBtrIxwQFUvj6GGBz
         JmF0OfXh/NDIE7WfRQmhFHxIwLW3p8wTHUAvN0+pW7+evHlFfUx1w8cr7PbvvGo7Ppfx
         GEHryc0X8iDaIepU59wkUI25xBHwWqCnC8hV10jl+tt66ou4HjAKNoX3B/XRlgPWryDJ
         ILeo+iM9xLswHxnV0nd62jZCLk+WEiOXWQQuxEjiFcWDxVpgfPaf7hPKFZ0oMchIvNV0
         pro7Tp4ef87Bm4XvlMD4lyDuXP/HeFJf8zL87SwA7gUFqx1wcL6FJvI1xPj5czROwwVP
         dCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cqLaNkblV1LV9pgYgi/64RZJna6jVfmG5ouM5RL4vvs=;
        b=46Fv0oSWWtX2mUZEOTsrgqWTB9C60KdMa2Ajw6DKmYp9t+4N1qgRPvlVLy49ZC3MA/
         GXx+B0zLiUwoRGvcXwyYnsrt5icLdrEER7hOEDbyPuN8YrQI3P33o2Kglfn1omf9/w3l
         YCXQq+lOh43m81gdBzoIChiNYD7ezOjN3xtadGcfM/Pnn7E9mP5REXqcGfHoGHgkWPUB
         h+t2rcUEsuo1IVseoio0gGOUhCk9VvmpDCXyNqhL/JZVd6bkO0MJYZUXj62jLAG7My6e
         ozFOi28pfIhcdQYSr0nEfgFujKKZnhT5KbM+2V7mpNlEZruXV0Um5AXRSIKBsciu3lSV
         RTPg==
X-Gm-Message-State: ANoB5plPdGQewXZCTx9VNjOZmuvCg6r4zTUo3kdtprNc0SEI3HpX5cgS
        0nvoZEpF15pX3NGfNC6HpUSKPA==
X-Google-Smtp-Source: AA0mqf6ppqWmgIkzm1J6G6yQ557Z8RpbYUlaeYOVZu0S6+yUmn2AEKw3w6XFgr7tE4vj94d9wnWlJw==
X-Received: by 2002:a05:651c:549:b0:277:5059:82c8 with SMTP id q9-20020a05651c054900b00277505982c8mr2686953ljp.315.1668780810494;
        Fri, 18 Nov 2022 06:13:30 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o19-20020ac24e93000000b004acd6e441cesm673510lfr.205.2022.11.18.06.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 06:13:29 -0800 (PST)
Message-ID: <e93a61ce-4c7b-ecb2-7b82-1bde388ec6bb@linaro.org>
Date:   Fri, 18 Nov 2022 15:13:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document the sc7280 CRD Pro
 boards
Content-Language: en-US
To:     Rajendra Nayak <quic_rjendra@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org
References: <20221118073017.26128-1-quic_rjendra@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118073017.26128-1-quic_rjendra@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/11/2022 08:30, Rajendra Nayak wrote:
> Add compatibles for the Pro SKU of the sc7280 CRD boards
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 463509f0f23a..2550ab251f7b 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -613,6 +613,11 @@ properties:
>            - const: google,hoglin
>            - const: qcom,sc7280
>  
> +      - description: Qualcomm Technologies, Inc. sc7280 CRD Pro platform (newest rev)

Such entry is already documented. I think this is not based on recent
kernel.


> +        items:
> +          - const: google,hoglin-sku1536
> +          - const: qcom,sc7280
> +
>        - description: Qualcomm Technologies, Inc. sc7280 IDP SKU1 platform
>          items:
>            - const: qcom,sc7280-idp

Best regards,
Krzysztof

