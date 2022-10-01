Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC3B5F1B40
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Oct 2022 11:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbiJAJZz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Oct 2022 05:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiJAJZy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Oct 2022 05:25:54 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EDC040E15
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Oct 2022 02:25:52 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id l12so7083981ljg.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Oct 2022 02:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=zDKG4xvaTROTTwvu1n5jojrvui3PrTe86kZ7nDAgig0=;
        b=Hc5YObQXfvDHWU48NuQC+7/kgVe5mXh4LNq+HcBKh7ANpEGdWwljCCfga5Yb9COYag
         JYq8OJUKaRJZyjsh0v45jrgcr7acCT0jk8nx9LZvAoxUi1wxUuulAd5viSS0INTyv9G0
         xE4iBhIFiT1bqck597wQjvUxi/bNwSrgJPHpK7q+gvQepGl0YoeWZCGO6LnjOabFnbD+
         iULEiMw+oI0vJuHjCCvZkFMOIlHseOjdAIIBAI5MxLK1/tugIlXNxhSSmeEOh5nRAK6V
         mTpnqnRDi2lIi9DEjdVDhK9b7XI9pFWtPQ/MefVfDqOoHKdrWbNj+Z7YQ6egLsH/Tsnr
         ytxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=zDKG4xvaTROTTwvu1n5jojrvui3PrTe86kZ7nDAgig0=;
        b=FAnbh+HwyN+qs6PNXMowZuo6sW07AAihusOOGJxtTNIyh/N75JRdtW+KICTPyRjko5
         P1s1WNLL5E0LhbHLdbHbvngJr445XQxjIEHYNfGyFu93qREnAlxavJRPJSCJ9GIBYJ7+
         mSO86Ufyg//gQ/DNPUEbV858WQkL4Yw1n4P6YMmKOyDw+5yDfHteD54cx/ylK0EQsohT
         JFbcaKOsjGFPHl0rSOgnJ5CgwxhqoRiB7lzmzuu7ZsZpBk3VVVFhW7DBdN5vYgrQcAAZ
         nd7fL0S3wNFdbRB6XOnAU7fm0Rt916qBwTiUY2mlXWAh2MEfNAJD4uMkpE1AcFrWEmQx
         muuA==
X-Gm-Message-State: ACrzQf11uun/11vqKdHabTXXMsQvbl34AkwtaOeT8wdcl+WwIVftCrvU
        lr4Ak1XjOOrc77cevOCYUQd++A==
X-Google-Smtp-Source: AMsMyM6L0UreN90dNJ8WzYrRKQf6N9NmkMMy/Q1cI2aGdCdQT6mXeu+XgtWmscSuRQJZKmh0Pp+sjw==
X-Received: by 2002:a2e:bd0e:0:b0:268:c03b:cf56 with SMTP id n14-20020a2ebd0e000000b00268c03bcf56mr4015713ljq.393.1664616350834;
        Sat, 01 Oct 2022 02:25:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512318800b004a05402c5c3sm705576lfe.93.2022.10.01.02.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Oct 2022 02:25:50 -0700 (PDT)
Message-ID: <09f5d364-320e-9ecc-2c2b-68066c61f802@linaro.org>
Date:   Sat, 1 Oct 2022 11:25:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/5] dt-bindings: firmware: scm: Add QDU1000/QRU1000
 compatibles
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221001030641.29354-1-quic_molvera@quicinc.com>
 <20221001030641.29354-2-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221001030641.29354-2-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/10/2022 05:06, Melody Olvera wrote:
> Add compatibles for scm driver for QDU1000 and QRU1000 platforms.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> index c5b76c9f7ad0..b47a5dda3c3e 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> @@ -51,6 +51,8 @@ properties:
>            - qcom,scm-sm8250
>            - qcom,scm-sm8350
>            - qcom,scm-sm8450
> +          - qcom,scm-qdu1000
> +          - qcom,scm-qru1000

Items should be ordered alphabetically.

>            - qcom,scm-qcs404
>        - const: qcom,scm

Patch is incomplete. Missing changes for allOf.

>  

Best regards,
Krzysztof

