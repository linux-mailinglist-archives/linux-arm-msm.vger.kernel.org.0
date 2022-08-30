Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 881025A63A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 14:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbiH3Mkl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 08:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbiH3Mkc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 08:40:32 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FBAB2E691
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 05:40:30 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id m16so14021116wru.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 05:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=7z9Pqzt9hk2WN83EB611zYm/PTUAOC0jcQmMgCYGpxg=;
        b=bZUmg+pmdT2tolVXR9Fqgn9LcYt521sI6D19Q0iJ0JmJKpypHGbARM6gqzgJ61VGw/
         5H2ImJrOAMvCqAEfeEJa+rGQLnSjsfuey0s8q1KKlgVJsY99fmskBh36hGxoFAKDJohG
         SyjSk3iGn+jPXgwMFCg/ktLV+HUoHo/CyHNCd/AwAbtpzZMa1+eumfA/FRIasHFnfFWW
         PW98m0aEzOyrwGb+tTT/QfxHTdRQTy8OTplnYJIHFDscogHkRwomH8UAxIYl/qiWtYPn
         3/W3fPlznQMCcwZkLtsQ06mZKhCvzxITJ3upljmWSsdjFecSNpVi7R2TmwoQUlqSFB11
         XrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=7z9Pqzt9hk2WN83EB611zYm/PTUAOC0jcQmMgCYGpxg=;
        b=Z3f0u6Q28lwtTZfw+4FjufKPAiDvgrqZZRiWVjC/AZHGuoOVWNLPdMlUvlq6pdWw/5
         pMYjynrFw3adVj9LyMTANuyL+zUgxHibVHyOLtfCaZF7P2sB1hJZVj+nUT2rQLWpzLj8
         DZrZcejpDGPZVJgOdFszCsHA1gj3PmuSpqMtkRazXik5NRUy98jw9Q3gFe6de1SXW9Dn
         i9l64iB+u3/SlMatfErOpnQesCMYWvq7Dd56E/6Sd+QnR5UF7FYasqfDrbsc/bytJGiO
         V7VXe8UVzFjbNDI9QBWD3FAthRTi2/K9ZMyi1/9Nj01ysga05IILUFjqMQjsuZxcnk+A
         FfCA==
X-Gm-Message-State: ACgBeo3vVrxlDUHYQn3WRYok2titCwSQGGb1FI5RUwgLkyIHwy4s0+Zc
        Jz585A3zMGvb1M07XXVEv5VTtA==
X-Google-Smtp-Source: AA6agR6G6biZprUethAunY+sacCBtYPcpWnzVd7O9AZ4u3KtieS3HHgUJbMoHeyDhGYDnzpQ/Fdl7Q==
X-Received: by 2002:a05:6000:904:b0:21a:3dca:4297 with SMTP id bz4-20020a056000090400b0021a3dca4297mr8789004wrb.487.1661863229217;
        Tue, 30 Aug 2022 05:40:29 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id x14-20020a5d60ce000000b002252e5a6841sm9671188wrt.57.2022.08.30.05.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 05:40:28 -0700 (PDT)
Message-ID: <8b03a71a-6b5d-e84a-4ea1-351b46954f12@linaro.org>
Date:   Tue, 30 Aug 2022 13:40:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH RESEND - dt 1/2] dt-bindings: nvmem: qfprom: add IPQ8064
 and SDM630 compatibles
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220825125410.232377-1-krzysztof.kozlowski@linaro.org>
 <20220825125410.232377-2-krzysztof.kozlowski@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220825125410.232377-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Krzysztof,

I seems to have missed this one,


On 25/08/2022 13:54, Krzysztof Kozlowski wrote:
> Document compatibles for QFPROM used on IPQ8064 and SDM630.  They are
> compatible with generic QFPROM fallback.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Applied thanks,
Srini
> ---
>   Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index dede8892ee01..b4163086a5be 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -18,6 +18,7 @@ properties:
>         - enum:
>             - qcom,apq8064-qfprom
>             - qcom,apq8084-qfprom
> +          - qcom,ipq8064-qfprom
>             - qcom,msm8974-qfprom
>             - qcom,msm8916-qfprom
>             - qcom,msm8996-qfprom
> @@ -25,6 +26,7 @@ properties:
>             - qcom,qcs404-qfprom
>             - qcom,sc7180-qfprom
>             - qcom,sc7280-qfprom
> +          - qcom,sdm630-qfprom
>             - qcom,sdm845-qfprom
>         - const: qcom,qfprom
>   
