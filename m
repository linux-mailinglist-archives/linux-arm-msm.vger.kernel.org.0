Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7EC263A909
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 14:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231600AbiK1NLj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 08:11:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231655AbiK1NLV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 08:11:21 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE3091CB21
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 05:11:05 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id bp15so17192944lfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 05:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K5nXFovIdkTWxvrn23UZMB4l8m8KTICo3uv4Go8CBfY=;
        b=AmB2dZeTwsjUBZhyilr/357t/EW9pLFzLtXa+5BLjvr214Cc7XXohihOHmkYZHFhxy
         ymnUMqIqe/mzK7sUJ37uH6m0BaGZUyztUSUSjZAUFr6j3dF7XqNex8kD+3PU02ZP7HuX
         I4+Tt1cTo4cqX9aEzEJoC3zV0Bo80cHI1SXIuUfD8HMCz9AH3z2dMOVIFK+rGYlyKaRV
         wL/P5nr7cuwJ9qkaCiNBKRG6fbkkL4vXNRvQjse4TpP/9Q//8JeyMo7vHSj7AhulQwR6
         /D0eg6CpAm5xjTt2TssSnLsiT2f/ohc0fWv7LAfEZG7EngRdrsxwJYd5uc1qd8TWuSqg
         UWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K5nXFovIdkTWxvrn23UZMB4l8m8KTICo3uv4Go8CBfY=;
        b=rMcvJwadrQ8vkg4Hld9snecjw2kkeGUnwHVprgne7j3tNFhgi9uyJPnainON53qict
         lNGC+qjoqkbHYSSNommNsJ11mwcqTGJ3J0epCRJaVUCkL0oz68T8Yk0JJJxeAHTm5Bq5
         dCFJhJpPeLAK1sXcIWi87zIsOMw4HQwcYSb/OSgh/HXPj4GpNtsuJ/asqG4UYdjyzCLh
         NIalRcXnlJ/lG9rf8rHfy7OIPqPE9h0oehqyXkJjZQvN2OVPX1gUzelMksTnRoLbBi4a
         2d2zwx583yo1O6MSJe9fsRXRc7bYFdc6bP78C2ad288+kfOb5GYwAwlU5W144L6bZ5cR
         V/4g==
X-Gm-Message-State: ANoB5pnIGFIWlMbQ+By1DF7+mKSdplqTyxTaA9w7gza6eZX5EpCbF2Ko
        QBJTJ6W0NI/cd27uCcyr0asLmA==
X-Google-Smtp-Source: AA0mqf6WcUug8CZuqYHLTJgnG/WhNJTDwZJMpf1uERvsLHLJ7GZpLQ8wwRdyTODlDjpMScOGVl8YWg==
X-Received: by 2002:a05:6512:3189:b0:4b4:e3bd:6ca0 with SMTP id i9-20020a056512318900b004b4e3bd6ca0mr10435582lfe.278.1669641064113;
        Mon, 28 Nov 2022 05:11:04 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a23-20020ac25e77000000b0048a9e899693sm1732189lfr.16.2022.11.28.05.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 05:11:03 -0800 (PST)
Message-ID: <48aa8f92-d28b-0164-06da-5fcca909413e@linaro.org>
Date:   Mon, 28 Nov 2022 14:11:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: split MSM8974 Pro and MSM8974
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20221128130545.857338-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221128130545.857338-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/11/2022 14:05, Dmitry Baryshkov wrote:
> The MSM8974 Pro (AC) and bare MSM8974 are slightly different platforms.
> Split the compat strings accordingly to clearly specify the platform
> used by the device.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 463509f0f23a..5977b4fdf38e 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -165,14 +165,18 @@ properties:
>  
>        - items:
>            - enum:
> -              - fairphone,fp2
>                - lge,hammerhead
> -              - samsung,klte
>                - sony,xperia-amami
> -              - sony,xperia-castor
>                - sony,xperia-honami
>            - const: qcom,msm8974
>  
> +      - items:
> +          - enum:
> +              - fairphone,fp2
> +              - samsung,klte
> +              - sony,xperia-castor
> +          - const: qcom,msm8974pro

Just like msm8996 this should be followed by qcom,msm8974 from logical
reasons (it is still compatible?) and ABI.


Best regards,
Krzysztof

