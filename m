Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77067683306
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 17:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231142AbjAaQut (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 11:50:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbjAaQur (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 11:50:47 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB3D244A0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 08:50:45 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso11103576wmq.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 08:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5XuvLcDLAk/pmrbKQwlDowxpATVa8cUm39NsNa3Uaak=;
        b=Ndf4M2282U4vn98N8DKnwdT4/h8DhaWfBL+udLuVr5X9f4+bs/dC1PzEM55nqx25dW
         UF4kCNf2WXjpO6p1Il/WbXhHgvzm/GWYX0dlGA+ZlaKRb0t9JDAQAggxgOGogGPbUavG
         PxA2+6VhvnYi24tGYuiScVWp/RGA1Z3yc2Tji+mAl/8WewAC0EJ7RpxwOY4FI0huDXmE
         aMuxhLxcu6S83g84KonPNBtLg4NWFGqxjw7GnoDrClJqrgo7qytS5qUxKOqhMfvwtMxW
         SvJGyfaYeVnNvNdJSsBUelqcqR5LzN16314JF42TNFWCnwNxRnKv6Hq3tDYDP1Dxll5X
         9v6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5XuvLcDLAk/pmrbKQwlDowxpATVa8cUm39NsNa3Uaak=;
        b=13Fs4gKXh3oqUxkNHGUWyPnUL2E9CsEI7740vLExw87En5uEl/3u7iKg5/V/1Q0P0B
         U3pnoaRT3dUCbGmvK366HiZzqp+bUoLclcGFr128K2mrWowUu8+1NX2lK2JD4h5bh9DO
         2L4WtCwEMNejBhXowvUSsDVBnzl15fqvk4tLPKM4/EH9htQTXWICchCr1SRg2a6CFk8y
         hkXknIWTlbv1ciDvAQm5eY2Fnn9m23rFpdkKUL447Bkvdd2cqZFCcVL37uBjGYik8J2D
         teUPjHaowDXoLKJq7W6eY9uCm6+X+nCGyCv6ZOUaC4w1HIChU2ZRz6kGG97I902cvflv
         NCeQ==
X-Gm-Message-State: AFqh2kpRO6n74pq8jVY3jhZmiBWcEPyvMj2p/JJ8Iq2AFnaScVNzaLoe
        +/slLwMBzBqA5ogtqWHuGCE2HA==
X-Google-Smtp-Source: AMrXdXulAFl2rPcGHYe/Vg7Mc32h7TSOaot+MsYdOQScg65kYGdSM3YlAkJ5dURTcACfNim10dLSaw==
X-Received: by 2002:a05:600c:1c1f:b0:3db:2d7e:1204 with SMTP id j31-20020a05600c1c1f00b003db2d7e1204mr45231041wms.27.1675183844534;
        Tue, 31 Jan 2023 08:50:44 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q17-20020a05600c2e5100b003dd1c45a7b0sm2828762wmf.23.2023.01.31.08.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 08:50:44 -0800 (PST)
Message-ID: <8b93062d-9d79-ad8f-0797-8ababc2066de@linaro.org>
Date:   Tue, 31 Jan 2023 17:50:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 7/8] dt-bindings: clock: Add Qcom SM6115 GPUCC
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230130153252.2310882-1-konrad.dybcio@linaro.org>
 <20230130153252.2310882-8-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230130153252.2310882-8-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/01/2023 16:32, Konrad Dybcio wrote:
> Add device tree bindings for graphics clock controller for Qualcomm
> Technology Inc's SM6115 SoCs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> v2 -> v3:
> 
> - Mention resets in description:
> - Use gcc.yaml
> 
>  .../bindings/clock/qcom,sm6115-gpucc.yaml     | 58 +++++++++++++++++++
>  include/dt-bindings/clock/qcom,sm6115-gpucc.h | 36 ++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm6115-gpucc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml
> new file mode 100644
> index 000000000000..354ace48301d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sm6115-gpucc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Graphics Clock & Reset Controller on SM6115
> +
> +maintainers:
> +  - Konrad Dybcio <konrad.dybcio@linaro.org>
> +
> +description: |
> +  Qualcomm graphics clock control module provides clocks, resets and power
> +  domains on Qualcomm SoCs.
> +
> +  See also:: include/dt-bindings/clock/qcom,sm6115-gpucc.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm6115-gpucc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: GPLL0 main branch source
> +      - description: GPLL0 main div source
> +
> +required:
> +  - compatible
> +  - clocks
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +additionalProperties: false

unevaluatedProperties: false


Best regards,
Krzysztof

