Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BAD0718AAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 22:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbjEaT76 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 15:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbjEaT75 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 15:59:57 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9406C12C
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 12:59:52 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-973bf581759so1077448866b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 12:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685563191; x=1688155191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0nuapp2peW9rsg039y+YqZAN05vEK02l4Fawi+Wbszw=;
        b=oi4rREC3tY+NLTUYps0r8Pn4T3q9QeWcr6qH/itNHrdikqopXjHJ2yWvh+OKotaagT
         4FgT8UBtYh9ium79IqHTh47eM7xrfRlyuaSrjVgm4L9iyX8ouRRk2Vzzp+KMMtKoFN+5
         vhc0Zz7koUD+Szdh+xE+yQi7z8FqxOOzFdq2GxwGgWIy5/Z+TbE5bAda1d+HCtHOKy4x
         p2ChWnIhs8No0nGla5Xp4jGwQJw+t+scSKtbVhDyPV80wlIiFP3Gttvr9aYPYSjntv5y
         oX6qhiC2gpdcjp6voKt5o8JLBPQXkzYuuompUNBFzLtPeL8waR2MHDSyfnrnMTEqn7fw
         uHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685563191; x=1688155191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0nuapp2peW9rsg039y+YqZAN05vEK02l4Fawi+Wbszw=;
        b=iRu8lydfpzMsYBKTgBZ4xiIunh+H0ZfMDjikG0iwt6N5bUAeCtZiemd12HbymdHyk2
         LOZIfzi1LoQub8AjlABVHiN/wKulYnBj5K4EfubPOfwHzn3hylDc+4Y+YEu901zmVJGk
         9i1L3ZWdGw2/gMq2NSCcDKmty/DJ2LSpWJaLTJ6N6BE/mtmHXymC4Sf38By78Eov4LOI
         e14iDJY/OmshqpAkKkKBg9l/5kGU3tdT9udysW++rPn0K3JdeMAn6cc7THjE+Ux4PvRg
         1WFpHQ0NPFsAZ8UyjfcLksfFk1hLaEgPGc1WiD36TzXo8/29BL+CdkY6o/6mV+elOvus
         EAbA==
X-Gm-Message-State: AC+VfDz6PaBceqsukvLdSLK8jAFcwN6K3pnWiG1BRPOiM4w1Qfdr8fVj
        bmZQpc1Pb9m0IqRKQprdBBshbQ==
X-Google-Smtp-Source: ACHHUZ6Mk9v+4KBNarQJTj3XmiwQgXNXHoFx4OlFCgh+FrNAH2D7GuTb1cJOdV40pq1JsDVuc1Etqw==
X-Received: by 2002:a17:907:6d84:b0:974:1ced:6a57 with SMTP id sb4-20020a1709076d8400b009741ced6a57mr7202197ejc.30.1685563190994;
        Wed, 31 May 2023 12:59:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id p3-20020a170906838300b0097436a54b4bsm1558229ejx.0.2023.05.31.12.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 12:59:50 -0700 (PDT)
Message-ID: <ebe8dc00-d937-240f-e9a5-e9049fd278ad@linaro.org>
Date:   Wed, 31 May 2023 21:59:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/6] dt-bindings: clock: Add YAML schemas for LPASS
 AUDIOCC and reset on SC8280XP
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
 <20230525122930.17141-3-srinivas.kandagatla@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230525122930.17141-3-srinivas.kandagatla@linaro.org>
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

On 25/05/2023 14:29, Srinivas Kandagatla wrote:
> The LPASS (Low Power Audio Subsystem) Audio clock controller provides reset
> support when it is under the control of Q6DSP.
> 

A nit, subject: drop second/last, redundant "YAML schemas for". The
"dt-bindings" prefix is already stating that these are
bindings/schemas/YAML/etc.

Same comment for first patch.


> Add support for those resets and adds IDs for clients to request the reset.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/clock/qcom,sc8280xp-lpasscc.yaml         | 11 +++++++++++
>  include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h     |  5 +++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
> index 08a9ae60a365..0557e74d3c3b 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
> @@ -21,6 +21,7 @@ properties:
>  
>    compatible:
>      enum:
> +      - qcom,sc8280xp-lpassaudiocc
>        - qcom,sc8280xp-lpasscc
>  
>    qcom,adsp-pil-mode:
> @@ -45,6 +46,16 @@ required:
>  additionalProperties: false
>  
>  examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,lpasscc-sc8280xp.h>
> +    lpass_audiocc: clock-controller@32a9000 {
> +        compatible = "qcom,sc8280xp-lpassaudiocc";
> +        reg = <0x032a9000 0x1000>;
> +        qcom,adsp-pil-mode;
> +        #reset-cells = <1>;
> +        #clock-cells = <1>;
> +    };

No need for new example - it's basically the same.

Best regards,
Krzysztof

