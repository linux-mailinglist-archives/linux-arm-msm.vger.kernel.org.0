Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 837065B20E6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 16:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232283AbiIHOll (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 10:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232280AbiIHOlZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 10:41:25 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A87F9139
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 07:41:22 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id bt10so28104400lfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 07:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Xy9pb3RiM0xLWbx8fAyLLiqpkCXXyc0gWIl/bOQpt+c=;
        b=Nf6doMw2TpIAOg9qwOtXBF4OkTdbF+PFn+/kNIpJXujcMTegwsMkbrz5hOABKwEyTB
         WfvQpgmCNvyBfHVvhnstmh3pmqYYInUlw+gI0zKYOcuERwgf64N2UM8YRB6O6eRmnw7b
         ikmVYPE0Lm4mbKR++H/xHg22wd7xiUJMXdzlGD4x0Ysj35YVT87DFZGUcmJ2hRkhb5Xm
         q7BuRNJUhBkKgGRX2Li09DLISa3jNP8QrZ8CDaeuacZGUvjMqR3SvwshcEwc6Ma8nsCw
         QjbmRSjUGTfLw6GSy00bOgaM7cZCNMcguKhYgvwhOgNRdEeo+1+HEyEf5BlTofpxJBAF
         RjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Xy9pb3RiM0xLWbx8fAyLLiqpkCXXyc0gWIl/bOQpt+c=;
        b=wG0GDO2Dl6aH87h/KLkj8R+fcrA5SEyRtQMLIdvw0+IeGYDWk2dyXOSzbdGNTBAvuM
         a7/d/BhlhCpyz3pmq2h2Hx04ZwHm6IXzgxd4KZ+9uNJxZMmZWwERnDOmno4/sJ/uNG9M
         Ri0e3BVbFKpic3Qv1dAi4WbnZdIhNxZMyl0jKCLsIDeEQOJxRrFA9g0gaUqWjh9C3aoH
         AswHbh09gl3IU9Ra6r0nEQ0RcDdthw1fQLhMRWzGk8iaDaLxjAUAWBbF/hg/pkzY591G
         Y6AsKjEpYfQvhZGq6CCvB7PtND4ePdI4D5/AJVz8At/+oh95tpr/rbJ2r8pOUt0KgA0z
         0tMg==
X-Gm-Message-State: ACgBeo1mqroJ5njdJwDIOiOjdwBFHPqyDeQeWckMUibvZkwuym73zFmW
        FEwGQFBw2o3NtY3G02Ifcf+PPtlFyYIGHg==
X-Google-Smtp-Source: AA6agR4Naxulk0AE+BJy9l397YzzatWz5GlQhCpsnL30L2VVmgEoBDtCkTcFVURBWa8Uo2eT7Pd+8Q==
X-Received: by 2002:a05:6512:e84:b0:497:71e0:3793 with SMTP id bi4-20020a0565120e8400b0049771e03793mr2777791lfb.171.1662648080630;
        Thu, 08 Sep 2022 07:41:20 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id r7-20020a2e94c7000000b0026548b59479sm3084598ljh.64.2022.09.08.07.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 07:41:20 -0700 (PDT)
Message-ID: <da383499-fe9f-816e-8180-a9661a9c0496@linaro.org>
Date:   Thu, 8 Sep 2022 16:41:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 3/4] dt-bindings: net: snps,dwmac: Update reg maxitems
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Miller <davem@davemloft.net>
References: <20220907204924.2040384-1-bhupesh.sharma@linaro.org>
 <20220907204924.2040384-4-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907204924.2040384-4-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2022 22:49, Bhupesh Sharma wrote:
> Since the Qualcomm dwmac based ETHQOS ethernet block
> supports 64-bit register addresses, update the
> reg maxitems inside snps,dwmac YAML bindings.

Please wrap commit message according to Linux coding style / submission
process:
https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586

> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: David Miller <davem@davemloft.net>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 2b6023ce3ac1..f89ca308d55f 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -94,7 +94,7 @@ properties:
>  
>    reg:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 4

Qualcomm ETHQOS schema allows only 2 in reg-names, so this does not make
sense for Qualcomm and there are no users of 4 items.

Best regards,
Krzysztof
