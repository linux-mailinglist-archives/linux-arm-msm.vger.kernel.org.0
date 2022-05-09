Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5232E51F5EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 May 2022 09:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbiEIHkQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 May 2022 03:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236134AbiEIH0k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 May 2022 03:26:40 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC2D073789
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 May 2022 00:22:04 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id d6so15164575ede.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 May 2022 00:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=r8EzK3JJsKUErCg00miKoLyoqzj/mxXqLt2F2OYDn18=;
        b=h3nYTW6STSrguhBxcKdiMGFTd91R63i5a+BH8Ybs25nAbv51D6zqqTa0WixnBk0fqp
         txvE/7mCgql9wb7EaqGIafjIXnbDYOQkZPmhdNxScdRg5EHyltKa/SXLo0BMUxU5Svvq
         SvsoqBkuPTBP/cOBFmKmXncWPXHxr84Jpy8M9okii5HQPrL2gaZg+4GbTrHYmL6qq/Fc
         9x4tcxLBJ4H+AXyOmyQhh+NySursoKLAip6foicxUTW7V9Yi1um1X4XuzIR/yvBwqcG/
         zdI+EJx58KaVMqnse9A1qR5AYQAN6pikR4Sv4jxGkbmXB69J4xopjcp7bvYu5YsbNOsC
         if5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=r8EzK3JJsKUErCg00miKoLyoqzj/mxXqLt2F2OYDn18=;
        b=QQY6KULvXMg5JwRJpmTP3EY1mKUl3wN4WO27Zhh1KJPxN8vd2VBeF5EA6LPhxbdnYi
         53Ay/pkinak2b9levjEc5ZAHoqEtSXwi2xOLlUw0/3hJnM9dA89YEXxyzsXUVr0XlIio
         1s+QW0ge3jq9UoQjtEpF1JFymLY/OTC1Mho2YNFlKCvXTJ3bT4aDFTgc0RdElftsCld4
         ZNUc4ZbRkfH6c95GrtwX/nBnc9IKJh69GJT/06050DWX1vgGNSg2bbqa52lgGI5VZ062
         V9Xk1Y8nEowa7R2u1b8NUYew5ClxMe5+dIiqAdeWjcBFu8fBKga8T7d1va7FfKOVsGcW
         074w==
X-Gm-Message-State: AOAM532SxzF5n6D/nBxOguFCP8Bky07j9t8lM2fEg8J/BWpywq4p3QTW
        kzYERH7EhAkzEFBgETSuBvYifw==
X-Google-Smtp-Source: ABdhPJxc79htoQFhb6lZqPqWa/gAX0T5VaQupgDvXbnSToB3iz7+sI1cX79YGbfhWbB0c4V07AY0QA==
X-Received: by 2002:a05:6402:400f:b0:428:325a:b6bb with SMTP id d15-20020a056402400f00b00428325ab6bbmr16212581eda.145.1652080923245;
        Mon, 09 May 2022 00:22:03 -0700 (PDT)
Received: from [192.168.0.242] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h25-20020a1709070b1900b006f3ef214e5esm4735367ejl.196.2022.05.09.00.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 00:22:02 -0700 (PDT)
Message-ID: <c267066c-40b3-4afd-4050-edc1abfdeb1e@linaro.org>
Date:   Mon, 9 May 2022 09:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 07/11] dt-bindings: clocks: qcom,gcc-ipq8074: support
 power domains
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
References: <20220508104855.78804-1-robimarko@gmail.com>
 <20220508104855.78804-7-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220508104855.78804-7-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/05/2022 12:48, Robert Marko wrote:
> GCC inside of IPQ8074 also provides power management via built-in GDSCs.
> In order to do so, '#power-domain-cells' must be set to 1.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  .../devicetree/bindings/clock/qcom,gcc-ipq8074.yaml          | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
> index 98572b4a9b60..e3e236e4ce7d 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
> @@ -27,6 +27,9 @@ properties:
>    '#reset-cells':
>      const: 1
>  
> +  '#power-domain-cells':
> +    const: 1

It seems I reviewed your v2 - please put it before reset-cells. The same
in next hunks.


Best regards,
Krzysztof
