Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB43C50F274
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 09:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343985AbiDZHeb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 03:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344072AbiDZHeY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 03:34:24 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8787F69A3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 00:31:17 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id b24so21180241edu.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 00:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hDKTIYN4i5nFyBUGL7uoauPQ423HAoriavcd1j64Az8=;
        b=u3bqqMSvlW4cfsGgKtL7IFsr1OG1ndSI06ptdEvSlZjODo/20QdbA4s+3nqQccB1Vk
         IwhzaaIwzQZXVmet7Xmfr3BA0gSEMc60Y78E9eWWNwhY3zIvzT3OBknyjAOi8hsC77RZ
         J8dN8cjhoklQAOlVsT2Lfnss8OLhSWouKGQSwVDJIcwSnzf2JhVsgt97cUlDhn1qmQ8t
         PMAYPl+Man/QQFD2cy6GRhlHpcFzSyaHW3wQDR4cR9cTVzVPtv2otB5g49Y+o1Xd9tF4
         ZyRJ4MSLrbhIno25KZVr3vpBXVW93qlkqYZ7G2X3OTStLmqmF9+9H3isESUeIc+5zplP
         VZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hDKTIYN4i5nFyBUGL7uoauPQ423HAoriavcd1j64Az8=;
        b=jDkGoioUN3McHYAbfqPOr+R/4lxcdFqMTlR7WUWMg7RRBdLUZXetrl8bPynP+D89da
         KDE0Q5F+OK7BZeXxQoSR/WTkz04wW0KP8+z2fvKBJhvkyNWZ6G1b0HZG5CA7Q812Kk3G
         q8zpFdDUcW01A/MEKYVYMLtfUbfKMMp7LYxBbmFUx+CRBrg0uL/81D0XeQ1S32Jn7jpZ
         UdekanBmVn6n1PhFQYdeYl2vSaCQoxgdBGpkmUgPTdyosEaBM/5zo8eaPR1S/XXb47wt
         3m6Zq+bbRc63Rg1yTEHZVlHT2TD3v5B7Hu0l3EBbLu72wIOOZ1g6Phb9YL3r+LXU+2yt
         hxeQ==
X-Gm-Message-State: AOAM530adeOvgWLuVvopJ2wZHkJKuo+anQHlDgpdajL61PLksVy238sZ
        riQdBEs3f9OdPwrvaHkCLxEm5g==
X-Google-Smtp-Source: ABdhPJxOoxx3PJB02EFKKSQbdQfKx1ZLb1DlOgrSRi5goG1/nM3MOOa4oQx/pWacryTUQl4GbQ+BVQ==
X-Received: by 2002:a05:6402:2c4:b0:425:ac5c:4376 with SMTP id b4-20020a05640202c400b00425ac5c4376mr23591726edx.10.1650958276401;
        Tue, 26 Apr 2022 00:31:16 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x14-20020a1709064bce00b006f006948581sm4482897ejv.170.2022.04.26.00.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 00:31:15 -0700 (PDT)
Message-ID: <6b766f08-5cac-fbda-cdb5-364aabb54fb3@linaro.org>
Date:   Tue, 26 Apr 2022 09:31:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: clock: gcc-apq8064: move qcom,apq8084 back
 to gcc-other.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220426072451.2905910-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220426072451.2905910-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/04/2022 09:24, Dmitry Baryshkov wrote:
> The global clock controller on apq8084 has nothing to do with the schema
> for apq8064. It uses the schema defined in qcom,gcc-other.yaml. Move
> respective declarations back.
> 
> Instead add what was really meant to be present in qcom,gcc-apq8064
> schema: the compatibility string for qcom,apq8064 device.
> 

Reported-by: Rob Herring <robh@kernel.org>


> Fixes: a469bf89a009 ("dt-bindings: clock: simplify qcom,gcc-apq8064 Documentation")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc-apq8064.yaml         | 6 +++---
>  Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml | 3 +++
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
> index 97936411b6b4..b867da12761e 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
> @@ -20,12 +20,12 @@ description: |
>    See also:
>    - dt-bindings/clock/qcom,gcc-msm8960.h
>    - dt-bindings/reset/qcom,gcc-msm8960.h
> -  - dt-bindings/clock/qcom,gcc-apq8084.h
> -  - dt-bindings/reset/qcom,gcc-apq8084.h
>  
>  properties:
>    compatible:
> -    const: qcom,gcc-apq8084
> +    enum:
> +      - qcom,gcc-apq8064
> +      - qcom,gcc-msm8060

This looks wrong. msm8060 was not broken by that commit and was never
here, was it?

Best regards,
Krzysztof
