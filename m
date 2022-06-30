Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF4AD56228F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 21:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236790AbiF3TEK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 15:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235847AbiF3TEK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 15:04:10 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12350377FA
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 12:04:09 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id ay16so40811693ejb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 12:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=A5BPRjCLjMz6n70RysGv/HeCg7F5lkJ+/NTpqGV0Rcw=;
        b=HKUSRukkVJd1EOTlpGzZ8EDl1SGJ3FY3+yWHHTsOwej3pK7VoxUl4bMC7BB7wWBk+H
         gXpnTxmEyNKNvIqHMmGlvkqBoBB5Cg4z89Ca2ybIHgT2M3XlW8SqZa4usMtgr+3S3Y4b
         sH2A1vu/YuaaFjFKg9iggU7HOABsmeAPdWbSI4whOSykXCyjG7zITAQgMkgUk4jLO0BI
         ptcOUnGDxXvioZDKIbO+9bsA2ZLU6NP2zJsENoDrcGwiS0CZRRrAO6Q8BX2ho1kRdjbA
         SmubYJTFhqQRODWBrOPP4c8UC7DB8LDVo9Id/V/x89Up3g9SXkpmXlfnE4MJ/HD3lBHs
         bCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=A5BPRjCLjMz6n70RysGv/HeCg7F5lkJ+/NTpqGV0Rcw=;
        b=5YuVcGxCvMOG/AH2gkRIer2pxINjTV3kCbxlr1peLcuaQ1ubIxXExCcfGyt148U/ZO
         qWDe6iAMlOhQqY1JkCO1K7bWqtKfhU0+xf+NSLPp2dhA/43mNq31lB+9zX3T2faeyjyu
         T3js6ZXtK8GeeoZXFdovPrPNfEHEvHphaHQUtB77bNHsKcn/wux4R+9mug3GufXJA062
         zeDK61MW7LE3YMukWcVDY1QzMzKUAJRLibf4DM37q2GWmIXNrMwtyoGBLDvitkqcA1UN
         0MXifIDlmiLu6nK+VnNdJF6FMMPslkMf7ueX65yHOvsP0HTicaANJI4J48Dfk3+pLrY7
         IBgA==
X-Gm-Message-State: AJIora+AzyLIgcN9A4H+wJ01+H+wnpqmB0iKyFzs2HHYjL/IHMJuvzB3
        xkXHu9OLANj4xNgI64P216hPhA==
X-Google-Smtp-Source: AGRyM1t6404Tdoq6Wq/sQaLZ0Ytbji5kaAU5uTST3P1dC2xlN/EQMnBp1Pbl9D8/U74kNDTA9wujZg==
X-Received: by 2002:a17:907:961c:b0:726:9f09:6b3c with SMTP id gb28-20020a170907961c00b007269f096b3cmr10496797ejc.711.1656615847677;
        Thu, 30 Jun 2022 12:04:07 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x13-20020a170906b08d00b00724261b592esm9419163ejy.186.2022.06.30.12.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 12:04:06 -0700 (PDT)
Message-ID: <a19ea366-6607-e54b-4ee2-8d8fa7fb9752@linaro.org>
Date:   Thu, 30 Jun 2022 21:04:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/7] dt-bindings: msm: dsi: Fix clock declarations
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-6-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220630120845.3356144-6-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/06/2022 14:08, Bryan O'Donoghue wrote:
> When converting from .txt to .yaml dt-binding descriptions we appear to
> have missed some of the previous detail on the number and names of
> permissible clocks.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../display/msm/dsi-controller-main.yaml      | 23 +++++++++++++------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index fd9d472437853..b24ba6c346a77 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -28,22 +28,31 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: Display byte clock
> -      - description: Display byte interface clock
> -      - description: Display pixel clock
> -      - description: Display escape clock
> -      - description: Display AHB clock
> -      - description: Display AXI clock
> +    minItems: 6
> +    maxItems: 9
>  
>    clock-names:
>      items:
>        - const: byte
> +        description: Display byte clock

Descriptions should stay where they were. Just add minItems and new items.

>        - const: byte_intf
> +        description: Display byte interface clock
>        - const: pixel
> +        description: Display pixel clock
>        - const: core
> +        description: Display escape clock
>        - const: iface
> +        description: Display AHB clock
>        - const: bus
> +        description: Display AXI clock
> +      - const: core_mmss
> +        description: Core MultiMedia SubSystem clock
> +      - const: mdp_core
> +        description: MDP Core clock
> +      - const: mnoc
> +        description: MNOC clock
> +    minItems: 6
> +    maxItems: 9

maxItems are not needed.

>  
>    phys:
>      maxItems: 1


Best regards,
Krzysztof
