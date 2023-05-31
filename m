Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03B647189B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 20:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjEaS7K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 14:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjEaS7J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 14:59:09 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4114B123
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 11:59:07 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9741caaf9d4so368905566b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 11:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685559546; x=1688151546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a1MZNTYhCmjvVCApD+9eAKa10iGthZoDa2+QDE5F5+w=;
        b=FHA0BgP6jqltMkKCIjHJvqXy1gQ7ln9Jfg+4RriF5E1CjueUAp1jkCMVGg8abT2NaI
         R4/zgHKr8pgpFwdmUi2lz/F/yC0WTgf3crDqgAlHvSdimw780QQqVh6JHvu1619lZmfF
         1I9YeDTpW4xYzQkSaUaCYTD+jkaTRfG+QZ9lMo1o6f3ECp0WAZ4BZHh4pTRTZ8va7e6m
         A9PX5iscZWZjqzUPB2HRNkgiJehlhe2OJ6ObUVvpurhhvhVmZq0aXDotEl1Qlq4ElZdH
         zz6dPH8Gci4opMA4zLaVLtQGYa5gs0COsqOXqD8AvDAbLQrRyKCoWm4ADehV4aeZoIQp
         4ciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685559546; x=1688151546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a1MZNTYhCmjvVCApD+9eAKa10iGthZoDa2+QDE5F5+w=;
        b=Sp1biUaCEkXmV0pWDx0YgyD6Bk4RT8r8BWmv4MVwxpTQsCwQEL301h9DAMUe8Kq9BC
         wBuQl5ClIfuvPl5oeTH+4rDOka+0+4CyNeXrXujQ2XRST8PCiFxCPu46SiSOFzWPM3Ym
         rlx0Mjt3EiLNaXuTfkV21C5utOFPZv5NeeojKeIVNQO9/Wv/Wr9GCST9H5+wKlFC1KW4
         EqQUvZHY+E2RXavszDJD4P6w9jmpkDhPwuH4qt8kX47o7l5QQ7wFTay7VRKB257Y1zMY
         4E3MI7LM+5ej/sdVutepHljEoVcF/nnpMF563NuDhc3wm61UDcmTIcH/rtu/VwZ4x5VB
         vbSA==
X-Gm-Message-State: AC+VfDxQp4gRvMMoM5q9+SeWRLwShVRl2IjwJYLCP3CjRN7riFOaTTUR
        r0aBCvHENxzeFX68lCxztB1Bvg==
X-Google-Smtp-Source: ACHHUZ6l18e7/7xgENAGDK4rpksLHqeamm8sr4QQ3KVCi6olOkfHhpnr5Ztg2gv+gDDyeI3L9Dp1Ag==
X-Received: by 2002:a17:907:3e9d:b0:96f:f451:1874 with SMTP id hs29-20020a1709073e9d00b0096ff4511874mr6727695ejc.59.1685559545750;
        Wed, 31 May 2023 11:59:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id e12-20020a17090681cc00b0096650f46004sm9298592ejx.56.2023.05.31.11.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 11:59:05 -0700 (PDT)
Message-ID: <3a0deecb-8235-8cf5-262e-8cb8d2349a4c@linaro.org>
Date:   Wed, 31 May 2023 20:59:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/4] dt-bindings: power: reset: qcom-pon: define
 pm8941-pon
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230531014248.3824043-1-dmitry.baryshkov@linaro.org>
 <20230531014248.3824043-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531014248.3824043-2-dmitry.baryshkov@linaro.org>
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

On 31/05/2023 03:42, Dmitry Baryshkov wrote:
> On PM8941 pon doesn't store the reset reason. However we still need the
> wrapping node for pwrkey and resin nodes. Add bindings for pm8941-pon
> device.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/power/reset/qcom,pon.yaml    | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> index d96170eecbd2..eb3c88e501ef 100644
> --- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> +++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> @@ -19,6 +19,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,pm8916-pon
> +      - qcom,pm8941-pon
>        - qcom,pms405-pon
>        - qcom,pm8998-pon
>        - qcom,pmk8350-pon
> @@ -56,13 +57,22 @@ required:
>  unevaluatedProperties: false
>  
>  allOf:
> -  - $ref: reboot-mode.yaml#
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: qcom,pm8941-pon
> +    then:
> +      $ref: reboot-mode.yaml#

Are you sure that this works, so pm8941 does not allow mode-*
properties? I am afraid they would still be considered evaluated, thus
your if-not is not effective.

Best regards,
Krzysztof

