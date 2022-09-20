Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36B2C5BDE31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 09:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbiITHbt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 03:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbiITHbq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 03:31:46 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB755A3C8
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 00:31:45 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id i26so2290128lfp.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 00:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=jnQTMRJFYigIA33SCaz3qFtz2tTG96QP1qgq/1/BZcI=;
        b=T0y+y6A1fvkqDFPe4IcALqvk6i6V6IeL/T42HmYnQ/iEvssRXvoGNXQK2QK2l9krs8
         ylSJI39dQ1svBpruOpx9+f+Ti7Ty1xvoVCbTtSyd87OSudH/Dup9M1gCQNKxfjuCXBsy
         ercJGw3wc4E+wz7EbEXGNAW6IKHGrRUMcA5bMbFoDcZN7drVoWGhZaAc9nZClDsM5iK1
         +H/cnT2lvzgTLxqmC7dzTkaSeJ/SUIjZeDHmgWGe9FgFqwxbqcfAAUA70/5ZElnLMWEK
         rtOlV7Zd86Ul81C3ho1Js8L556epC32JMPNCrD74SoiMxcBe1rQ0fY8ypwKrdXqi5DCq
         F8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=jnQTMRJFYigIA33SCaz3qFtz2tTG96QP1qgq/1/BZcI=;
        b=R08emMN50SpooKeK1MJQ8qrDnsjMnxPvoPe0Zilk/Om6IkOzA0MWMp/HrwDkQxtDlT
         LK0rcEWst+s9jZdv3mqbNCOoYk5HnBiCUfZ0I72JaHaVIEY6HDS38auFlnxnwtqq6TVk
         4/6+evmSwkuFgG8XqgtSivmcdBMLGeaRx8F3s0/jPB1NOuB0PpNtJFKDvdX0QAElrlKW
         7OnsToyiJdxzwHJaAsjHJYtJOFNw/oAdLb7J0dpj4XAUO+LxSuCeR5GnweuJ8DCH17iu
         vP6TMIwq6l24GDLDjv+QI++cVKq1qmcHvBtcatSO7ZlaJCXMfmx+UerEU16XC5Bkc5D6
         LiEw==
X-Gm-Message-State: ACrzQf3BWaIvs3zlj0ASe+CLlSKBiiTZe4szKkzBVjIC8rmUR4NpFFkW
        8uLqSeGC30ooqukk0ryBlsi+kw==
X-Google-Smtp-Source: AMsMyM5yIu9IkKRq6w5n9mdk+CKiqWTaJs++Wf9rCvN4lj2CHpn0F5WW7oZBBev+DaqYQIfxRg/R4Q==
X-Received: by 2002:a05:6512:6d6:b0:499:27c:1aa0 with SMTP id u22-20020a05651206d600b00499027c1aa0mr7981676lff.88.1663659103935;
        Tue, 20 Sep 2022 00:31:43 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q25-20020a2e8759000000b0026c2e0258bcsm125089ljj.42.2022.09.20.00.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 00:31:42 -0700 (PDT)
Message-ID: <30756e6f-952f-ccf2-b493-e515ba4f0a64@linaro.org>
Date:   Tue, 20 Sep 2022 09:31:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 4/4] dt-bindings: qcom-qce: Add new SoC compatible
 strings in dt-binding doc
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, thara.gopinath@gmail.com,
        robh@kernel.org, andersson@kernel.org, bhupesh.linux@gmail.com,
        Jordan Crouse <jorcrous@amazon.com>
References: <20220919195618.926227-1-bhupesh.sharma@linaro.org>
 <20220919195618.926227-5-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919195618.926227-5-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/09/2022 21:56, Bhupesh Sharma wrote:
> Newer Qualcomm chips support newer versions of the qce crypto IP, so add
> soc specific compatible strings for qcom-qce instead of using crypto
> IP version specific ones.
> 
> Keep the old strings for backward-compatibility, but mark them as
> deprecated.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Tested-by: Jordan Crouse <jorcrous@amazon.com>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  .../devicetree/bindings/crypto/qcom-qce.yaml         | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> index 4e00e7925fed..aa2f676f5382 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> @@ -15,7 +15,15 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,crypto-v5.1
> +    enum:
> +      - qcom,crypto-v5.1 # Deprecated. Kept only for backward compatibility

deprecated:true in its own oneOf entry (see other examples).

> +      - qcom,ipq6018-qce
> +      - qcom,ipq8074-qce
> +      - qcom,msm8996-qce
> +      - qcom,sdm845-qce
> +      - qcom,sm8150-qce
> +      - qcom,sm8250-qce
> +      - qcom,sm8350-qce

Entire change is not backwards compatible thus not bisectable and not
ABI-safe.

Best regards,
Krzysztof
