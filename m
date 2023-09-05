Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F849793018
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 22:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238204AbjIEUem (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 16:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239847AbjIEUek (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 16:34:40 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DBEAD1
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 13:34:35 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-52a250aa012so4153197a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 13:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693946073; x=1694550873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+vkcQl2agBJ5k2hYdAGxqtdUpbX0mFxRfiot9JstVTs=;
        b=JBQPpe3hO0atA5z9nlsxwZaJcOaSR01EKNqeyhG+GuYrxgMZghZJ58cO3MJFOnPtbZ
         BU8xwjYNhvUfodCWKMDWd6YVUjmgyDexZVNUSRpRsjPXrVa5kqTUrv6AsJFte8gNnoMO
         Z7wy5DuGYu7fJj4l7Fzi840JoP77+hux3/a8lZ3gu+B24QYzoLG5YH9TZP+fgD6ujTtk
         QZLOC1h/8G3shBal6vLC88b8Ig3SfISJrO7z0efE8g69oev5Q/U7puAi6NYZxj5YF/cT
         57iZllHee9Zkx7wwijS9AVja3Q5TDAIDxmeGTJkg2E9puce+aULy9lyoSkYM9HsTuRb/
         7ddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693946073; x=1694550873;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vkcQl2agBJ5k2hYdAGxqtdUpbX0mFxRfiot9JstVTs=;
        b=YbJg1cE1ubPp0xon+IifJE0+xln5PK/Kyit3Dsnt7jyFECl8YQUnA9tdbpKxKZlP63
         //GEtkAfcB4rWFgJ7G5HVYbROd0hbqr4Epta4Xvs4TOhBycUX6+PONizykOKjnAc8MaH
         zmeG3mKPs5BjlUEMGnK/vt1nVImsEtmiJ779/Qg1rwZ0ASvq7j9iGaApx36N3ptBQLvC
         WNsHzpI+fmKBzQs3rQ2oibenGpBjE5Or7Z1HtKrAh0mRMHMbqL7qLF9q7EDLCBBikYT+
         dJ8yA/FGTdDG523KVDx5UKCgPSexqNZ8cSMfOlZWBR9Qz5Ex1QcXPdNeEifjPXMa39sG
         1nMg==
X-Gm-Message-State: AOJu0YxAgzgvzNZfprSEfQ5nrBMYErLy6iFlsCyXKCOSD8fbNZs1kJdC
        NRwOZ9g8N5q2eLUuI0dU4n5ebw==
X-Google-Smtp-Source: AGHT+IGjL6jmXzEcCrmkf6DxJTuuAYKEE4MikTeuDJUCnbpphzZ+ui84G3WJmi+u6BuAtU3OUSGt5g==
X-Received: by 2002:a17:906:23f2:b0:9a5:7887:ef09 with SMTP id j18-20020a17090623f200b009a57887ef09mr647126ejg.32.1693946073684;
        Tue, 05 Sep 2023 13:34:33 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x24-20020a170906299800b0099cadcf13cesm8044460eje.66.2023.09.05.13.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 13:34:32 -0700 (PDT)
Message-ID: <37fe0c7e-60ad-4c27-b40f-471cc3d92e1c@linaro.org>
Date:   Tue, 5 Sep 2023 23:34:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: phy: qcom,qmp-usb: Add SDX75 USB3 PHY
Content-Language: en-GB
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, abel.vesa@linaro.org,
        quic_wcheng@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, kernel@quicinc.com
References: <1693909838-6682-1-git-send-email-quic_rohiagar@quicinc.com>
 <1693909838-6682-3-git-send-email-quic_rohiagar@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1693909838-6682-3-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/09/2023 13:30, Rohit Agarwal wrote:
> Add dt-bindings for USB3 PHY found on Qualcomm SDX75.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>   .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        | 40 ++++++++++++++++++++--
>   1 file changed, 37 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> index f99fbbc..5725620 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> @@ -20,6 +20,7 @@ properties:
>         - qcom,qcm2290-qmp-usb3-phy
>         - qcom,sa8775p-qmp-usb3-uni-phy
>         - qcom,sc8280xp-qmp-usb3-uni-phy
> +      - qcom,sdx75-qmp-usb3-uni-phy

I think the ident is wrong here.

>         - qcom,sm6115-qmp-usb3-phy
>   
>     reg:
> @@ -38,9 +39,7 @@ properties:
>       maxItems: 2
>   
>     reset-names:
> -    items:
> -      - const: phy
> -      - const: phy_phy
> +    maxItems: 2
>   
>     vdda-phy-supply: true
>   
> @@ -75,6 +74,7 @@ allOf:
>             contains:
>               enum:
>                 - qcom,ipq9574-qmp-usb3-phy
> +              - qcom,sdx75-qmp-usb3-uni-phy
>       then:
>         properties:
>           clock-names:
> @@ -122,6 +122,40 @@ allOf:
>         required:
>           - power-domains
>   
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq9574-qmp-usb3-phy
> +              - qcom,qcm2290-qmp-usb3-phy
> +              - qcom,sa8775p-qmp-usb3-uni-phy
> +              - qcom,sc8280xp-qmp-usb3-uni-phy
> +              - qcom,sm6115-qmp-usb3-phy
> +    then:
> +      properties:
> +        resets:
> +          maxItems: 2
> +        reset-names:
> +          items:
> +            - const: phy
> +            - const: phy_phy
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sdx75-qmp-usb3-uni-phy
> +    then:
> +      properties:
> +        resets:
> +          maxItems: 2
> +        reset-names:
> +          items:
> +            - const: phy
> +            - const: common

Could you please point us to the actual DTS patch adding this PHY? I'd 
say, it is highly likely that you are trying to bring in the unnecessary 
change.

> +
>   additionalProperties: false
>   
>   examples:

-- 
With best wishes
Dmitry

