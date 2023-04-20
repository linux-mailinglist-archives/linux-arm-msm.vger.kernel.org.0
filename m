Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 035726E9086
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 12:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjDTKmn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 06:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234783AbjDTKmX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 06:42:23 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A354ECB
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:41:19 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2a8bca69e8bso4063461fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681987278; x=1684579278;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yYJib+KQpRN6Chzv9c6xYxJsgyv5cT5aVycO+xQckao=;
        b=VBUTkbmrolkfG2HfEcgTK0vDuXwjt6JD29+KkTRVwL/3szw1ASTwqK1tfPffuYb3Ji
         4K4Ijw7CasoMUf2pLiGr35Pi2Fq+YlI1U9gBRhSYZU/n9WO/Dlnn/Iot3GjzKtMNKJSX
         IGhL2vLPMC8YaqZrO9s5cF94R+Lk9D/kQS0YfhA5o+++uBY3xX3AY/BXKZJqBDZQ8N2W
         UJKvF9GQOlRcofDCf8qU5zmjTINV78rsbZPBgktwrn6hqTJrpuAENz8nQCZSmzSqGjXi
         eiPxN7VA1HwSY4kRvGLYqn/85LfagJEtte9GsiNFUYkUOjimR4Plwydj9uxVJA0yQo+t
         6kvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681987278; x=1684579278;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yYJib+KQpRN6Chzv9c6xYxJsgyv5cT5aVycO+xQckao=;
        b=DiWqvru/fAlQbgK5hZroQ/1HUl1SaaX6TH5bs8LK6S3ZpcYK3lfdLh2x0rOpvMajZa
         3IEAmQrxuUJrBAyvx3u1/fcee8dd5Jocfp4QYSsiHPR5rl6yjY1HBO6OAjOJOj27XrV/
         izUV85fTsvQQrFJcAmdhqihFTTy10O5FU4u0yagZpCBgvUZ1iZeYmS4M3HWOGDC5uwnk
         OQ8aRWYUmKMGPsJUJxCuzEx6uEtiA4/5hCpO80WrP1XCsvt1XGsPCmlf5TZNXxZcQvlQ
         wrnfQF2I6MU9j/oyTBvDQcir82VdlE98yehLlcWLxYN1Wz0TyG8LUoksA18Tu1UR5Dn9
         jxcg==
X-Gm-Message-State: AAQBX9eBceGmVRQfcuaMCfbVxNkWYHCyEVAvv9zT9jlDnpdtUNQWT03V
        zLZLa28kK7yqlfArlTHlUtjgaQ==
X-Google-Smtp-Source: AKy350bflVL4FNLvEiOCx3SDmmD4O9EV3jKBx3p9B/hdDwhOXn3V1VVtrkWhvhhaPJtrfxeCjcsQ4A==
X-Received: by 2002:ac2:5550:0:b0:4db:4fe8:fd0f with SMTP id l16-20020ac25550000000b004db4fe8fd0fmr302284lfk.25.1681987278035;
        Thu, 20 Apr 2023 03:41:18 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id e13-20020ac2546d000000b004b567e1f8e5sm174205lfn.125.2023.04.20.03.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 03:41:17 -0700 (PDT)
Message-ID: <2549bb8a-c64f-ee23-307a-1e39a86d9814@linaro.org>
Date:   Thu, 20 Apr 2023 12:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] dt-bindings: thermal: qcom-tsens: correct unit address
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230420072429.36255-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230420072429.36255-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20.04.2023 09:24, Krzysztof Kozlowski wrote:
> Match unit-address to first reg entry.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index b6452ed78802..d9aa54c11663 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -328,7 +328,7 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      // Example 1 (new calbiration data: for pre v1 IP):
> -    thermal-sensor@900000 {
> +    thermal-sensor@4a9000 {
>          compatible = "qcom,msm8916-tsens", "qcom,tsens-v0_1";
>          reg = <0x4a9000 0x1000>, /* TM */
>                <0x4a8000 0x1000>; /* SROT */
> @@ -358,7 +358,7 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      // Example 1 (legacy: for pre v1 IP):
> -    tsens1: thermal-sensor@900000 {
> +    tsens1: thermal-sensor@4a9000 {
>             compatible = "qcom,msm8916-tsens", "qcom,tsens-v0_1";
>             reg = <0x4a9000 0x1000>, /* TM */
>                   <0x4a8000 0x1000>; /* SROT */
