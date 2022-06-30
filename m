Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A45956222C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 20:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236380AbiF3Shs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 14:37:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233011AbiF3Shs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 14:37:48 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D5D43396
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 11:37:46 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id e2so42638edv.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 11:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UGGrUYFGtLESoSS2rsNev5359I+9qUzB9ek9G4Qz7uw=;
        b=BMDwOu1iMHdN/94k0T57BSZk6Ka2rjPA+yoEJvBvvMc/Gwo6WSABuWeZmjb68VZxsC
         cf/ddiswpYS37nUGMgrVNctpRxdymbfFaWTVgIyQbSHsW7DLYsRXUb+rGAZ5Bm6q9ITT
         BM9SrGQGZhCGmnVmirm6lxkoy9aVsforz+HxYqh87vp8+fzspUmnm8kLgXe9Hl6qjyk4
         edIuRV5ceN4gtJzGoO+F9o7OYHLvO/RTG+kWp7yj05N2Dy8CYs8X3pf3mk9LZyoMT/ga
         1/V1DqJEx8+Ivzhrq3esF5osKtBoo9jZEsIFusx5B7bmDX8D+EoEVzb+bnp8GwtEF7qr
         nQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UGGrUYFGtLESoSS2rsNev5359I+9qUzB9ek9G4Qz7uw=;
        b=ILs4EAxi0zHYg+CZTdJhLHWkHDMjkU19KHcPUp0y9LajSYJqGRMHZfr5SZ33/QcMJ+
         WJsPq33QN5JQ31ef7wj01uXRuZc//+Eq/LuGPHexpXHVqxVrf5ZTotpxB5lvi8UoPqC+
         WE121oEDuegjd8/pbhaKq94RDtolWrV+DTPSmZ/c17z6obO7FCYknw7EpJOgVTyte5Jq
         wOOo3+76Lb2xteepAXJfJ0S7mHnpvdAyL0kLGAZWSRNzPuZ4CLUz6SvAioEAQsRF0hBg
         MjfW1YVT3TnDabdAAE6AjofhYFPQ/jU6wq/MbfoFl1xtiW/tk2aq2yn+NcTlx1mvMxph
         d0RQ==
X-Gm-Message-State: AJIora/EywJwzYmSOzBYBS0mWPaUvlt3On049EzfeW9rt0QmW9gj2Q9/
        ecmWRjxy22eU73gOknQVx58K+Q==
X-Google-Smtp-Source: AGRyM1u3+PvK76fsXCzRLEryKlS/LLxqIEfJGGkbPSWvuPgDleiH5x/0VdYGGFhx9tY7hChc96qMkA==
X-Received: by 2002:a05:6402:42c8:b0:435:b99c:35f9 with SMTP id i8-20020a05640242c800b00435b99c35f9mr13853065edc.137.1656614265507;
        Thu, 30 Jun 2022 11:37:45 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s12-20020a170906354c00b0072637b9c8c0sm8669926eja.219.2022.06.30.11.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 11:37:44 -0700 (PDT)
Message-ID: <7824e14b-89fb-a816-441d-012d76def59a@linaro.org>
Date:   Thu, 30 Jun 2022 20:37:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: qcom: Add syscon const for
 relevant entries
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, jassisinghbrar@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220630043536.3308546-1-bryan.odonoghue@linaro.org>
 <20220630043536.3308546-2-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220630043536.3308546-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/06/2022 06:35, Bryan O'Donoghue wrote:
> msm8916, msm8939, msm8953, msm8994 and qcs404 already declare or should
> declare syscon as they have drivers that use syscon inside of the apcs-kpss
> block.
> 
> grep apcs arch/arm64/boot/dts/qcom/* | grep syscon
> 
> Add in the additional syscon in the documentation for the above mentioned
> parts.

Subject should have prefix:
dt-bindings: mailbox: qcom,apcs-kpss-global:

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../mailbox/qcom,apcs-kpss-global.yaml        | 44 ++++++++++---------
>  1 file changed, 24 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> index 3b5ba7ecc19d9..f342494fd6108 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -15,26 +15,30 @@ maintainers:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,ipq6018-apcs-apps-global
> -      - qcom,ipq8074-apcs-apps-global
> -      - qcom,msm8916-apcs-kpss-global
> -      - qcom,msm8939-apcs-kpss-global
> -      - qcom,msm8953-apcs-kpss-global
> -      - qcom,msm8976-apcs-kpss-global
> -      - qcom,msm8994-apcs-kpss-global
> -      - qcom,msm8996-apcs-hmss-global
> -      - qcom,msm8998-apcs-hmss-global
> -      - qcom,qcm2290-apcs-hmss-global
> -      - qcom,qcs404-apcs-apps-global
> -      - qcom,sc7180-apss-shared
> -      - qcom,sc8180x-apss-shared
> -      - qcom,sdm660-apcs-hmss-global
> -      - qcom,sdm845-apss-shared
> -      - qcom,sm6125-apcs-hmss-global
> -      - qcom,sm6115-apcs-hmss-global
> -      - qcom,sm8150-apss-shared
> -
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,ipq6018-apcs-apps-global
> +              - qcom,ipq8074-apcs-apps-global
> +              - qcom,msm8976-apcs-kpss-global
> +              - qcom,msm8996-apcs-hmss-global
> +              - qcom,msm8998-apcs-hmss-global
> +              - qcom,qcm2290-apcs-hmss-global
> +              - qcom,sc7180-apss-shared
> +              - qcom,sc8180x-apss-shared
> +              - qcom,sdm660-apcs-hmss-global
> +              - qcom,sdm845-apss-shared
> +              - qcom,sm6125-apcs-hmss-global
> +              - qcom,sm6115-apcs-hmss-global
> +              - qcom,sm8150-apss-shared

These are not items, but one item, so enum directly under oneOf.

> +      - items:
> +          - enum:
> +              - qcom,msm8916-apcs-kpss-global
> +              - qcom,msm8939-apcs-kpss-global
> +              - qcom,msm8953-apcs-kpss-global
> +              - qcom,msm8994-apcs-kpss-global
> +              - qcom,qcs404-apcs-apps-global
> +          - const: syscon
>    reg:
>      maxItems: 1
>  


Best regards,
Krzysztof
