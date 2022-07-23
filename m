Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2627D57F0C0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Jul 2022 19:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238628AbiGWRq6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Jul 2022 13:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238593AbiGWRqx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Jul 2022 13:46:53 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5488193FF
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 10:46:51 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id z25so12292541lfr.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 10:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FhF1lM8uv7zCgVno1Bu+pNe+UUVrUzTJdVFGUkHjEf8=;
        b=NmNX/+YN4XgyaM1U06F1zfqFtqna51ec/Yy3mGYCUqUXO4X7OF+zw78zSPGl117dlR
         VNAvari39WHZHC/BwNaMt0gzwq50ZJUPDKPsoPm2IfjtQr+/CVm0RbtosfNkOZ3e7Uq4
         nLyaqxoyNY7karS25w7hR88PoIkWxAVjCV1y4eCSxVkUFewIFBHPCKNdJ+rliIjsT8aB
         pnuZL0gkdUGNL5wXE7PkupnmXwT6ryZuFQNwWW57e5fnT8i/9Ggp0j69XXlxB+dmh6Xr
         g3F4bfCDj9D9cvAUpXcpzto7pxLB1dUsykcvxw9ct0CzED+nWprqUJRmDt+AA77H8qyy
         yfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FhF1lM8uv7zCgVno1Bu+pNe+UUVrUzTJdVFGUkHjEf8=;
        b=5BdFWSLAej/GmnnWvsaRL1UNHyIH68msmUMv0EsdfdPeCfA9oXiG4Ez5UpzreVwc/o
         OLLbN8LQN6T/Tx+M2zIoxyOgXXpenQTWUmOZtNseYp5MRud7NwcUhwuqnyoZPbVkXM4f
         I6GxK97opM4AttMXCKqZrAJJAEO2Gh8Snjbr6/Q9c05FaTfZPY91Fr6pUe0QTZ72woWP
         biHbmMGWK6fUfNiE0EHymqweJzOUOYArQWmBR3d86wJwFQDEufpwfYE3ElVwIGuuAUCw
         95TSwleAQKKD/v/CNOqgCtT+GYpzurdj85J+ybZodv3QhutfkWSjsDJXg1aCAwZ6+fvv
         +sqQ==
X-Gm-Message-State: AJIora+3P7zv6AHV2rTbi8glrsOVOQnDu3fA+v9tltq3armihozWSZP9
        02dYBbLD+0MvQ9hQUHHR8JrZWA==
X-Google-Smtp-Source: AGRyM1uX+gFSaWXXAS8SGkFsPBu7j2yWCVmTN2HX9zVyTRZZK2Xl1IwzTXuemK0iQRBEuenZEHDyrw==
X-Received: by 2002:a05:6512:5cd:b0:48a:6914:c081 with SMTP id o13-20020a05651205cd00b0048a6914c081mr1929323lfo.29.1658598410244;
        Sat, 23 Jul 2022 10:46:50 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id r12-20020a2e8e2c000000b0025d53cbba2bsm1770815ljk.45.2022.07.23.10.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jul 2022 10:46:49 -0700 (PDT)
Message-ID: <27154a09-d79b-7814-22ec-c84496596abc@linaro.org>
Date:   Sat, 23 Jul 2022 19:46:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/3] dt-bindings: clock: add SM6375 QCOM global clock
 bindings
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220723100135.91784-1-konrad.dybcio@somainline.org>
 <20220723100135.91784-2-konrad.dybcio@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220723100135.91784-2-konrad.dybcio@somainline.org>
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

On 23/07/2022 12:01, Konrad Dybcio wrote:
> Add device tree bindings for global clock controller for SM6375 SoCs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v2:
> - reference qcom,gcc.yaml
> 
>  .../bindings/clock/qcom,sm6375-gcc.yaml       |  48 ++++
>  include/dt-bindings/clock/qcom,sm6375-gcc.h   | 234 ++++++++++++++++++
>  2 files changed, 282 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm6375-gcc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
> new file mode 100644
> index 000000000000..fb1c36888d18
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sm6375-gcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller Binding for SM6375
> +
> +maintainers:
> +  - Konrad Dybcio <konrad.dybcio@somainline.org>
> +
> +description: |
> +  Qualcomm global clock control module which supports the clocks, resets and
> +  power domains on SM6375
> +
> +  See also:
> +  - dt-bindings/clock/qcom,sm6375-gcc.h
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sm6375-gcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Board XO Active-Only source
> +      - description: Sleep clock source

What happened to clock-names?

> +

I would assume these are required for the clock controller... and they
were before, so what happened?


Best regards,
Krzysztof
