Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2D86CFD6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 09:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjC3Hyp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 03:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjC3Hyo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 03:54:44 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F16B13D
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 00:54:43 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id c29so23439514lfv.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 00:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680162881;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ddhkThE+AJAUa2yi3Fg+1zmLo5PqMkQ+wXEwb5TWLE=;
        b=bR8Nf7KYA3VPzvR4BPVFeYVAGYEgqymw2XyOLw45rnG2lOtFTlgJtbq5xg09VqonHu
         2SrxQdrOtWf+h0mtFqFF+Itxxp/ja2S6YeSnIoqnLXddgL+iqWGVr1tR7QyQDt5mf4Xw
         dg9QfHkZpJoz98LsewRBaGemOpEcODluIo8TJQKKChn8TGpeUwN7GLCFRZVABjQ/DsGR
         eGtfr4Z6VBTybP3NwMTzMXbKCzJ0TWU8XhtxyjJubsCXcsARO/Fkz5FxizjqGjwfTgQ+
         r+IcMFq3p/goU8S0k04L8pa/HQEHBNyEgKL5QQ2YS8RGozbb/42YMurlNzsXM+963+tk
         yZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680162881;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ddhkThE+AJAUa2yi3Fg+1zmLo5PqMkQ+wXEwb5TWLE=;
        b=ifftsSzyOMtoLwPqB6qkuHA4rsamzN0x3VTDXq1gc/OuDXIfdt38aFMqNDe5dTyy7X
         SeJwd/Uem8fVxWjlSFJO2uxf3gkP56zPgWqrJb7owo3a7KLQMWjL0LzG3QdA7YKE4Caz
         IZzkff5eI63cqMVYVmliLV2lBf7sZPcuxFOtyLnqgXBrB+YHw32Yd4ikFN/wTxqgCWQy
         n0DJDEAdVQ1uhbixiQ2Gcmr71jwXsd8SpztGnH7USzHGu2VT+sd8QKJAFQbvypUf5dqR
         C0hrdMQ9JsZW6bp9zMieLqbVgS3prZv7jNREDQQ9YnvXnS/3jl+5E0nHmzTm0cdQuilM
         VO7w==
X-Gm-Message-State: AAQBX9fC7B5MBp2xlquBQ2HR+sRxyTU1IKDTGGn5KcceH7+adO2e0b0V
        +oUpwxo6K0xUPMKlDdZEM2LmUg==
X-Google-Smtp-Source: AKy350ZitQbsiP2xHB7OfFJ3miJV9AvHp04k7JYMEuzI51ar2hQwAAiwR4VuF1AjANXVlrAS+uKMUw==
X-Received: by 2002:a19:7419:0:b0:4cb:280b:33c9 with SMTP id v25-20020a197419000000b004cb280b33c9mr6769371lfe.24.1680162881266;
        Thu, 30 Mar 2023 00:54:41 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c26-20020ac244ba000000b004dc4feeb7c6sm5767060lfm.65.2023.03.30.00.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 00:54:40 -0700 (PDT)
Message-ID: <cc13d781-f6d8-0cb9-17e2-0a6089f60fd2@linaro.org>
Date:   Thu, 30 Mar 2023 09:54:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 8/8] dt-bindings: arm: Add support for TPDM CMB element
 size
Content-Language: en-US
To:     Mao Jinlong <quic_jinlmao@quicinc.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Leo Yan <leo.yan@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Hao Zhang <quic_hazha@quicinc.com>
References: <20230329084744.5705-1-quic_jinlmao@quicinc.com>
 <20230329084744.5705-9-quic_jinlmao@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230329084744.5705-9-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/03/2023 10:47, Mao Jinlong wrote:
> Add property "qcom,cmb-elem-size" to support CMB element for TPDM.
> The associated aggregator will read this size before it is enabled.
> CMB element size currently only supports 8-bit, 32-bit and 64-bit.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-tpdm.yaml        | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
> index 283dfb39d46f..c5169de81e58 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
> @@ -53,6 +53,14 @@ properties:
>      minimum: 32
>      maximum: 64
>  
> +  qcom,cmb-element-size:

s/size/bits/
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml

> +    description:
> +      Specifies the CMB (Continuous multi-bit) element size supported by
> +      the monitor. The associated aggregator will read this size before it
> +      is enabled. CMB element size currently supports 8-bit, 32-bit, 64-bit.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [8, 32, 64]
> +
>    qcom,dsb_msr_num:
>      description:
>        Specifies the number of DSB(Discrete Single Bit) MSR(mux select register)
> @@ -95,6 +103,12 @@ required:
>    - clocks
>    - clock-names
>  
> +anyOf:
> +  - required:
> +      - qcom,dsb_msr_num

There is no such property.

> +  - required:
> +      - qcom,cmb-msr-num

Why this is part of this patch?

> +
>  additionalProperties: false
>  
>  examples:
> @@ -105,6 +119,8 @@ examples:
>        reg = <0x0684c000 0x1000>;
>  
>        qcom,dsb-element-size = <32>;
> +      qcom,cmb-element-size = <32>;
> +
>        qcom,dsb_msr_num = <16>;
>        qcom,cmb-msr-num = <6>;
>  

Best regards,
Krzysztof

