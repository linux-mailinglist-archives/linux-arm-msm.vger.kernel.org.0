Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 468176377EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 12:48:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbiKXLs2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Nov 2022 06:48:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbiKXLsX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Nov 2022 06:48:23 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54995193E9
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 03:48:21 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id a29so2169293lfj.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 03:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N2HKGTSGqqVFsCX/081YYxGW7i7DJTZQgpoCnaIwzdY=;
        b=Sj+Lgjkh68ggiTzrpmbB3Sm+Y9MsE5iHEDvY4odizpycBHXvNlpArV5Uv1HNQk7SVq
         0g1g/26u5u+68CwK34lbARrC0+xHiVoW/90osPr/IPTXvTv4INxpOmNRqw/JgYcqnmqb
         iJDKbN+owA3pqbH0MRb5A12zUUgYpefduN/NxXHwEarRmUXf6QNwhsJ4YPfjy6Bwa/nK
         AE1J9GOcJbt8h0rqPbHMKRcAuW+LtDCyeqcWRSG7fCSwJzMVZ5zX7S+w1rVE9FGeXv1E
         qREnI1sga7NY8wJdV4ayuYAsRT1NQgMsN8TakfwcUdcRJj3H2h3R8xEHA6U8aogHncL9
         vPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2HKGTSGqqVFsCX/081YYxGW7i7DJTZQgpoCnaIwzdY=;
        b=JDA9UrReP1rDUHQImlQHsyQYN4+O+WdhH0xP+avHpUVlMlh2mNQX4iEFR4w5Ktl9VR
         H0QVjFkiV/CwVhBjkDcmzQh0WQIU7PA9hlXHFzG670ueTIVDae0QooVwdqTRR25D7Y2R
         IYbuOCZzv2vUr5PW68IYZArarZMWm6zTtYWoc/nrcZmN6s6HOUay4yirqJErZzT8Pgpo
         Rlga10Y8nm1VvONyyTXadz8PyR7cJb0gvKnreI9cx+buwcKB5W748zmKzTQd0l1d0RUq
         bMoRPKVLNq7qZ+M+U1ioMniyXDPqVx6VEM8tiVwIoxvnOdaSWqkkfzlAyPxtqDooLjj9
         UG4w==
X-Gm-Message-State: ANoB5pnEX2W3S8+dEK+2KiBt0UR5imFMhROagmmT7UDUCbYDSdMs4zp0
        JfxourslvlLiiWLEMUrkPPU1uQ==
X-Google-Smtp-Source: AA0mqf6tMtlpmOneA7Hh0wom7iAN9hJaITM2oQA4FbiF9KPqqfkvJpZ94SmKrlz0TMIh8vZvDF0+ww==
X-Received: by 2002:a19:4316:0:b0:4a2:2c37:e1bb with SMTP id q22-20020a194316000000b004a22c37e1bbmr7728147lfa.487.1669290499715;
        Thu, 24 Nov 2022 03:48:19 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id x3-20020a056512078300b004ad5f5c2b28sm98868lfr.119.2022.11.24.03.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 03:48:19 -0800 (PST)
Message-ID: <1078fdea-bbb4-2a07-85f9-a81bc876dcbe@linaro.org>
Date:   Thu, 24 Nov 2022 12:48:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/9] dt-bindings: clock: Add SM8550 GCC clocks
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20221123142009.594781-1-abel.vesa@linaro.org>
 <20221123142009.594781-2-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123142009.594781-2-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/11/2022 15:20, Abel Vesa wrote:
> Add device tree bindings for global clock controller on SM8550 SoCs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> 
> Changes since v1:
>  * dropped clock-names since driver uses IDs now
>  * based on recent bindings, like Krzysztof asked
>  * used qcom,gcc.yaml and dropped redundant properties
>  * renamed qcom,gcc-sm8550.h to qcom,sm8550-gcc.h, to match
>    compatible
>  * dropped "Optional", like Krzysztof asked
> 
>  .../bindings/clock/qcom,sm8550-gcc.yaml       |  56 +++++
>  include/dt-bindings/clock/qcom,sm8550-gcc.h   | 231 ++++++++++++++++++
>  2 files changed, 287 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm8550-gcc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
> new file mode 100644
> index 000000000000..acc540aa137d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sm8550-gcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller on SM8550
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +
> +description: |
> +  Qualcomm global clock control module provides the clocks, resets and power
> +  domains on SM8550
> +
> +  See also:: include/dt-bindings/clock/qcom,sm8550-gcc.h
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8550-gcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Sleep clock source
> +      - description: PCIE 0 Pipe clock source
> +      - description: PCIE 1 Pipe clock source
> +      - description: PCIE 1 Phy Auxiliary clock source
> +      - description: UFS Phy Rx symbol 0 clock source
> +      - description: UFS Phy Rx symbol 1 clock source
> +      - description: UFS Phy Tx symbol 0 clock source
> +      - description: USB3 Phy wrapper pipe clock source
> +    minItems: 2

I didn't mention in your v1 this explicitly (although I asked Melody to
drop it), so apologies for this. Based on my understand and our IRC
discussion, these clocks are needed for the driver (even if optional in
some states of hardware). If driver needs them, let's make them
required, so please drop "minItems: 2".

Best regards,
Krzysztof

