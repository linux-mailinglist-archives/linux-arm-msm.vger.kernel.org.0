Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37AB06C9D0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 10:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbjC0IAW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 04:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232570AbjC0IAW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 04:00:22 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0790421C
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 01:00:18 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id e18so7659396wra.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 01:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679904017;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zyFUNg7n9En5R9qIpd5WTwBxBqNXal61tLrhnEg793Y=;
        b=nf2hQVNadEfcLR3PzlLieEiKhWqMbZvnv+T5JHtQq6q18vncdxeWlpG1FX2InzLpPE
         2dtvmswoL6c9wQUB2pPm3NGjMway7kEsoax4iTZnCuypi/8I6p4mBP8RE4ldW12a8GL6
         wgFbpnC3Ky6r/9kfKjsIQP162It6m8G4LTFAX1pGioPLkFwl0ucWgfb9+tnKtEKo8E9M
         5AdzWjhIX/FT9HxJaBlDuyD0DoyQG8lQvwnZjDFzLovtkpXXQANP+rgJfaW3oY/nMDa4
         a0vF9kdgy05qSelJCynPJtzrHaMPIDJa+tLt0gMbghUFWeb1ShEeduRTVaYhIJs2s9Ir
         A2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679904017;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyFUNg7n9En5R9qIpd5WTwBxBqNXal61tLrhnEg793Y=;
        b=y0/P6xPjNpgts0sFC0AXp4RO910XuZzfMnbxkqtRmx5IDMcNXHfDL0D1omU70eo4Qb
         8ZPNeI1fnn58rRJDKJHbfrcfc+zKGJen2wvl9ebSCupjJ8cjYetZh5TCbKroeiMUIFdW
         thApaQQONXmglmw0VJ8RkD5JN0cbEENOM4PlUQyycSXgUTUchjBM8unm1DvAUVczqiuW
         duA+oYiF5oKtSDFo9ipG7qNJMDvCR3ZR7yB5z0gryLmQnofrR2Po6E2pbZ29RKPx7G2j
         Q16NkPQ+R5gScWqnjyZKeYPWCa0iHsj/rJwjF7zqntZzooiOcH9TNb81OyUBQBuns99M
         aTZw==
X-Gm-Message-State: AAQBX9euZsPxnJ6gKgDyXPrv1uV+4bSR5H7B0cv7UL23tIbzZZVhyeCa
        gN8DAbWIlRBnpbaSl23ZweC3rQ==
X-Google-Smtp-Source: AKy350ZVpzk0g8Uo/mKh0MckpKDCypHEEztwKTgYIDvcHkBMmu/0AcXbH9P7NLS4OlzLxlPLPp3Ipw==
X-Received: by 2002:a5d:4350:0:b0:2dd:11b8:8ab2 with SMTP id u16-20020a5d4350000000b002dd11b88ab2mr7811188wrr.38.1679904017407;
        Mon, 27 Mar 2023 01:00:17 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id v3-20020adfe4c3000000b002cf8220cc75sm16450063wrm.24.2023.03.27.01.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 01:00:17 -0700 (PDT)
Message-ID: <656c6ae6-41c5-9b7e-8602-02d8b3b4149e@linaro.org>
Date:   Mon, 27 Mar 2023 10:00:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 4/5] dt-bindings: phy: qcom,msm8996-qmp-usb3-phy: drop
 legacy bindings
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>,
        devicetree@vger.kernel.org
References: <20230324215550.1966809-1-dmitry.baryshkov@linaro.org>
 <20230324215550.1966809-5-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230324215550.1966809-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 24/03/2023 22:55, Dmitry Baryshkov wrote:
> The qcom,msm8996-qmp-usb3-phy.yaml defines bindings for several PHYs
> which predate USB -> USB+DP migration. Now as sm8150 has been migrated,
> drop the legacy bindings completely. No device trees use them anymore.
> Newer USB+DP bindings should use combo bindings from the beginning.

Shouldn't we mark then as deprecated first ?

Neil

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../phy/qcom,msm8996-qmp-usb3-phy.yaml        | 80 -------------------
>   1 file changed, 80 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> index e81a38281f8c..5684eaf170e4 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> @@ -24,26 +24,17 @@ properties:
>         - qcom,msm8996-qmp-usb3-phy
>         - qcom,msm8998-qmp-usb3-phy
>         - qcom,qcm2290-qmp-usb3-phy
> -      - qcom,sc7180-qmp-usb3-phy
> -      - qcom,sc8180x-qmp-usb3-phy
> -      - qcom,sdm845-qmp-usb3-phy
>         - qcom,sdm845-qmp-usb3-uni-phy
>         - qcom,sdx55-qmp-usb3-uni-phy
>         - qcom,sdx65-qmp-usb3-uni-phy
>         - qcom,sm6115-qmp-usb3-phy
> -      - qcom,sm8150-qmp-usb3-phy
>         - qcom,sm8150-qmp-usb3-uni-phy
> -      - qcom,sm8250-qmp-usb3-phy
>         - qcom,sm8250-qmp-usb3-uni-phy
> -      - qcom,sm8350-qmp-usb3-phy
>         - qcom,sm8350-qmp-usb3-uni-phy
> -      - qcom,sm8450-qmp-usb3-phy
>   
>     reg:
> -    minItems: 1
>       items:
>         - description: serdes
> -      - description: DP_COM
>   
>     "#address-cells":
>       enum: [ 1, 2 ]
> @@ -128,28 +119,6 @@ required:
>   additionalProperties: false
>   
>   allOf:
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,sc7180-qmp-usb3-phy
> -    then:
> -      properties:
> -        clocks:
> -          maxItems: 4
> -        clock-names:
> -          items:
> -            - const: aux
> -            - const: cfg_ahb
> -            - const: ref
> -            - const: com_aux
> -        resets:
> -          maxItems: 1
> -        reset-names:
> -          items:
> -            - const: phy
> -
>     - if:
>         properties:
>           compatible:
> @@ -204,7 +173,6 @@ allOf:
>           compatible:
>             contains:
>               enum:
> -              - qcom,sm8150-qmp-usb3-phy
>                 - qcom,sm8150-qmp-usb3-uni-phy
>                 - qcom,sm8250-qmp-usb3-uni-phy
>                 - qcom,sm8350-qmp-usb3-uni-phy
> @@ -225,29 +193,6 @@ allOf:
>               - const: phy
>               - const: common
>   
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,sm8250-qmp-usb3-phy
> -              - qcom,sm8350-qmp-usb3-phy
> -    then:
> -      properties:
> -        clocks:
> -          maxItems: 3
> -        clock-names:
> -          items:
> -            - const: aux
> -            - const: ref_clk_src
> -            - const: com_aux
> -        resets:
> -          maxItems: 2
> -        reset-names:
> -          items:
> -            - const: phy
> -            - const: common
> -
>     - if:
>         properties:
>           compatible:
> @@ -271,28 +216,6 @@ allOf:
>               - const: phy_phy
>               - const: phy
>   
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,sdm845-qmp-usb3-phy
> -              - qcom,sm8150-qmp-usb3-phy
> -              - qcom,sm8350-qmp-usb3-phy
> -              - qcom,sm8450-qmp-usb3-phy
> -    then:
> -      patternProperties:
> -        "^phy@[0-9a-f]+$":
> -          properties:
> -            reg:
> -              items:
> -                - description: TX lane 1
> -                - description: RX lane 1
> -                - description: PCS
> -                - description: TX lane 2
> -                - description: RX lane 2
> -                - description: PCS_MISC
> -
>     - if:
>         properties:
>           compatible:
> @@ -319,13 +242,10 @@ allOf:
>                 - qcom,ipq6018-qmp-usb3-phy
>                 - qcom,ipq8074-qmp-usb3-phy
>                 - qcom,qcm2290-qmp-usb3-phy
> -              - qcom,sc7180-qmp-usb3-phy
> -              - qcom,sc8180x-qmp-usb3-phy
>                 - qcom,sdx55-qmp-usb3-uni-phy
>                 - qcom,sdx65-qmp-usb3-uni-phy
>                 - qcom,sm6115-qmp-usb3-phy
>                 - qcom,sm8150-qmp-usb3-uni-phy
> -              - qcom,sm8250-qmp-usb3-phy
>       then:
>         patternProperties:
>           "^phy@[0-9a-f]+$":

