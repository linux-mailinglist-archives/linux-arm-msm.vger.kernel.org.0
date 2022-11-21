Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84B186329CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Nov 2022 17:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiKUQll (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Nov 2022 11:41:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbiKUQlk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Nov 2022 11:41:40 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D33FCE6
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 08:41:39 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id s8so19665758lfc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 08:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hETnp47GPkBfCDYgveE6+CDOudWSz0w3XG/QpSsWSLA=;
        b=Sljwr6evv6j9XkziKUMPUpoldKWpZf08EjDHG1D6ZgRISmD4RNwb+/vZeQ7rLjSs9S
         bUouI+BkCQJwltjhqdcMX+5/ncqvOCPg+nN+aOhhxxSTW0WNTbBss9YfxCETlPaq2AgS
         ztwbl/sND+UOF5vYUMhSA0dblbl2kCcHnEIzWsaQU0oSrwvULKR7lbxZr4LjlTbD71wP
         kweTn0pskRRRtBDHtOxyebZ3AFUqmQZIJxhI6HSU7E8nemrjPdscYHAXfawayUHJFUTD
         o/jtHOh2c1EEjmSdgGEguohvfD1Ar153pe1kJtcce+cbRkA7Xdx87gd9xHVVcGmXRLGP
         8Apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hETnp47GPkBfCDYgveE6+CDOudWSz0w3XG/QpSsWSLA=;
        b=jymCQSNKaL/Jfc+OiDZG+XY0DMfsYhI+e0DvAsL3GIeLquEya0CCYEBafFhSwYC30g
         vZrqMi+NBfIGOmRyjVjDbdhZ9KlDUU/QClXfYOchhw2n1utmRdyWa6cUN9a6RWtJuwf3
         3fcv0GPxK4XPIyDYyPYtWUQf2k4jU4lT3+20nM9w8dFz112MzIDBmCrSKUMVnfGXTzBn
         gZUpPEGgtvGMM4l9rN2KI2crcpTgqcNt/yXeLO+up61MWprwg+xvxtyaYG3y+qM34z1r
         PWJNNQ5aURhR7k6J5U2urzT0E19pgctLB4Q48fe6W2JZGis2Cx8Z8NQhHwDv3qJyXWsM
         yYXw==
X-Gm-Message-State: ANoB5pmVgL8N6I4C8mj5hfCsvxT6aKoX+U6UVLJ6FVwb6JyOTzOV1fqR
        Klqh3TV2CgP40rmBQ2HAD0x9tA==
X-Google-Smtp-Source: AA0mqf681K6J2C3yPwMc1YNd9swupnJH2JoyPNOPzpchMzoFQRmftgxTWlMooFCjpJMrDIbwx2N7tA==
X-Received: by 2002:a05:6512:4023:b0:4a2:5008:d235 with SMTP id br35-20020a056512402300b004a25008d235mr6897956lfb.7.1669048897832;
        Mon, 21 Nov 2022 08:41:37 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q20-20020a056512211400b00497a1f92a72sm2099108lfr.221.2022.11.21.08.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 08:41:37 -0800 (PST)
Message-ID: <2442d912-cc1c-7aac-face-b3a81456a162@linaro.org>
Date:   Mon, 21 Nov 2022 17:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/9] dt-bindings: arm: Add support for DSB element
Content-Language: en-US
To:     Tao Zhang <quic_taozha@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mike Leach <mike.leach@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Jinlong Mao <quic_jinlmao@quicinc.com>,
        Leo Yan <leo.yan@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Hao Zhang <quic_hazha@quicinc.com>,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org
References: <1669018873-4718-1-git-send-email-quic_taozha@quicinc.com>
 <1669018873-4718-2-git-send-email-quic_taozha@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1669018873-4718-2-git-send-email-quic_taozha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/11/2022 09:21, Tao Zhang wrote:
> Add property "qcom,dsb-elem-size" to support DSB(Discrete Single
> Bit) element for TPDA. Specifies the DSB element size supported
> by each monitor connected to the aggregator on each port. Should
> be specified in pairs (port, dsb element size).
> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
> index c46ddea..e3b58b5 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
> @@ -58,6 +58,13 @@ properties:
>      minItems: 1
>      maxItems: 2
>  
> +  qcom,dsb-elem-size:
> +    description: |
> +      Specifies the DSB element size supported by each monitor
> +      connected to the aggregator on each port. Should be specified
> +      in pairs (port, dsb element size).
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix

Then you need items, probably with maxItems as well, like:

https://elixir.bootlin.com/linux/v5.19/source/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml#L278

> +
>    clocks:
>      maxItems: 1

>  

Best regards,
Krzysztof

