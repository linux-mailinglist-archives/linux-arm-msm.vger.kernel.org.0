Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2DE69330D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 19:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjBKSrI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 13:47:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjBKSrH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 13:47:07 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F27EF93
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 10:47:06 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id o15so5020898wrc.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 10:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KNBad6NsbeeE2FNcNuGKb8u8bOm8xtWArbSi+T9+PoY=;
        b=nuiF2WwY/92TbEXExLUCBjho7sx8HcuyGc26XDvv+ZPg87LLyxEM2LpncPSQbe6GuP
         9W1jbIwUFxjtMCVUKdZOvUyFILOdfHsLgYkSVUyPaAig/73zfNeouzs6pTl0t3zHhcp0
         WcPtz2r1CuZsl2ezTPOORwf3wrjegVbJrMBlk5qTUG+E++6FFDYVq13tvCKAw1HuLGda
         1K6wVokxA7u6oqlaWvpVuP43M4x8g2yDHMLTOnO4o7/RBy67r/VBml3IrODbtd6rRnuI
         8wkRyYb61vPNZmVY1/9QkUaLKoWHKU+gUGRmnY1YgQTJS8C6a6SXBtc7cai8ERbC1VLO
         bkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNBad6NsbeeE2FNcNuGKb8u8bOm8xtWArbSi+T9+PoY=;
        b=pCJ2nTsdkVCc3DlfNl0oKUuzvmFlRxvjc10iNuxy2efHY9qTvmSu97jQcxwVZvfNZh
         7CQ9ptZiY3PqaV5EFbfAh3YJ60hSPOHCi+hreL4abtdL+29+XlP8ASmmDNoryrfJXkI7
         nU/AEryC6/frLI8ugXoQZHnDkpvAEB+mDL+tLF/SOiL16U2L8H3A0OHjBwFnrueavqb3
         d5XaLRr5r/ULCniNafUXgDKp3A42cxsusN7nJ5iKH5XxB22qETGZJp7Qd2sr6tdxL+52
         e5VdIivIjdS/mRqjk1hAIB+hyZteb3olZ9Tym93O2Jvhxr6gZQ/Ev1tovurkmOAweMZo
         9+ww==
X-Gm-Message-State: AO0yUKUZinSvpXBdiTbkTt6UPCdQYvAySpzTUPctQXCZusxSFAlK7jhi
        OvOxP+NgPLIEvkmtdnCtIMZDIg==
X-Google-Smtp-Source: AK7set9s7CRYhJPbImN7bcy2NZQuDzbh8phSbwqhfSA5Uez3aqqIQKRtoaDSNcfw0Q0sRUJX63f7vQ==
X-Received: by 2002:a5d:67c8:0:b0:2bf:dfa3:2e78 with SMTP id n8-20020a5d67c8000000b002bfdfa32e78mr17201185wrw.64.1676141225101;
        Sat, 11 Feb 2023 10:47:05 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id f18-20020adff992000000b002c5544b3a69sm5982wrr.89.2023.02.11.10.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 10:47:04 -0800 (PST)
Date:   Sat, 11 Feb 2023 20:47:03 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] regulator: dt-bindings: qcom,rpmh: Correct PM8550 family
 supplies
Message-ID: <Y+fip91HJ8Fip49i@linaro.org>
References: <20230210155930.549082-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210155930.549082-1-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-02-10 16:59:30, Krzysztof Kozlowski wrote:
> PM8550 is different than PM8550VE/VS, because the latter has much
> smaller amount of supplies (l1-3 and s1-6) and regulators.  The PM8550
> has on theh other hand one pin for vdd-l1-l4-l10 supplies.  Correct the

Nit: ... on the other ...

> if:then: clause with their supplies.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Otherwise, LGTM:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  .../bindings/regulator/qcom,rpmh-regulator.yaml  | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> index 297a75069f60..fb9621b4b4cd 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> @@ -308,19 +308,29 @@ allOf:
>          compatible:
>            enum:
>              - qcom,pm8550-rpmh-regulators
> -            - qcom,pm8550ve-rpmh-regulators
> -            - qcom,pm8550vs-rpmh-regulators
>      then:
>        properties:
> +        vdd-l1-l4-l10-supply: true
>          vdd-l2-l13-l14-supply: true
>          vdd-l5-l16-supply: true
>          vdd-l6-l7-supply: true
>          vdd-l8-l9-supply: true
>        patternProperties:
> -        "^vdd-l([1-4]|1[0-7])-supply$": true
> +        "^vdd-l(3|1[1-7])-supply$": true
>          "^vdd-s[1-6]-supply$": true
>          "^vdd-bob[1-2]-supply$": true
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,pm8550ve-rpmh-regulators
> +            - qcom,pm8550vs-rpmh-regulators
> +    then:
> +      patternProperties:
> +        "^vdd-l[1-3]-supply$": true
> +        "^vdd-s[1-6]-supply$": true
> +
>    - if:
>        properties:
>          compatible:
> -- 
> 2.34.1
> 
