Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB74D57B111
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jul 2022 08:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239836AbiGTG1a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jul 2022 02:27:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiGTG13 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jul 2022 02:27:29 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2310D45F40
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 23:27:28 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id o12so19992441ljc.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 23:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2RWe/5etiM/Atur64WJRybmJIj56BMtUZj35fRxxeJU=;
        b=hC0C815XFlatblvHaHA3D/3JwyDCc0lWVZUUvkD1fi4EARD8mXH7BX7uQtEVI5qriz
         6CgE98OSwz6vx0Zgg18GIU7wJ6MEWxBtXI0z/JJfQIYK0M4GK019WwEJ2NoFmpCVvRV0
         EKcdO7I3zU2/DbAl0CIgYeDLdiduo0N5BAHne3fxltLKypi8pmTJRWaMbFV/nPVU+k7b
         E8RT1MoLn6eV0WAEUvpnA/ecF0HsD6uIdSaTkwsj9PP8g4hUxhCP12ivCFFfLxPBAfF4
         w0r9DCDMszTHWdGc5Bj+Rull8zb/LAwN0wp47OVURvr7j/PQafq+nlXPzQVcYWJidwU0
         ZSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2RWe/5etiM/Atur64WJRybmJIj56BMtUZj35fRxxeJU=;
        b=YZhah5IF40f0vmjm6FtkaM1YBoPTYAAHyuKJOQ3Mak8R4zoVpFFGxIdLIEy01CxF1P
         oKNQpR+l7eARPpRpUer1tbuRwrXvPl2IPwhvZtPg0FpZE+XSPguOLvJUPcRXrjhVPFoy
         dfzH1gIqIo0NLHK1FfHEb2Edm1hXwOtZl8w/gKnU8UYIrN/lanKHUyDjzMFz039SSPds
         KY7MSCSgrcdOSHWgv6mh6Ev9ExX3L4YOCqP9drwC6jm9NskbzeX2oxIHj6lQS2Jqwhzi
         3npU/oNCgC0FYJIm/nUP5FR6e7FmTlWkGIQ3fftrEqXthP9IKbvGNWcTleZxGQlSeotl
         UVgw==
X-Gm-Message-State: AJIora80DHlSsHNiLjL7skb8JIvBaoLNcobNv1oyOsyXOGkTIbYiJaQI
        ZaxTOkBjmlSv4B4BBqPd0mhRdg==
X-Google-Smtp-Source: AGRyM1tsEpxIQZ9kT4ftSsfNFNs1JlZSItCy24gOE7mBFnUqo/n9Mj/HB/KCURSz4serspeZznlkGg==
X-Received: by 2002:a2e:2d09:0:b0:25a:816a:2e62 with SMTP id t9-20020a2e2d09000000b0025a816a2e62mr15449635ljt.147.1658298446484;
        Tue, 19 Jul 2022 23:27:26 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id p18-20020ac24ed2000000b0047255d210d6sm3617731lfr.5.2022.07.19.23.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 23:27:26 -0700 (PDT)
Message-ID: <11cc46d8-ae01-f3d2-b9c6-c366c6e4afc9@linaro.org>
Date:   Wed, 20 Jul 2022 08:27:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: add SM6375 QCOM global clock
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
References: <20220719115756.32231-1-konrad.dybcio@somainline.org>
 <20220719115756.32231-2-konrad.dybcio@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220719115756.32231-2-konrad.dybcio@somainline.org>
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

On 19/07/2022 13:57, Konrad Dybcio wrote:
> Add device tree bindings for global clock controller for SM6375 SoCs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v1:
> - dropped clock-names (switched to .index)
> 
>  .../bindings/clock/qcom,sm6375-gcc.yaml       |  65 +++++
>  include/dt-bindings/clock/qcom,sm6375-gcc.h   | 234 ++++++++++++++++++
>  2 files changed, 299 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm6375-gcc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
> new file mode 100644
> index 000000000000..2e43cd75d3d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
> @@ -0,0 +1,65 @@
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

Why you are not referencing qcom,gcc.yaml?

> +properties:
> +  compatible:
> +    const: qcom,sm6375-gcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Board XO Active-Only source
> +      - description: Sleep clock source
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> +    clock-controller@1400000 {
> +      compatible = "qcom,sm6375-gcc";
> +      reg = <0x01400000 0x1f0000>;
> +      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +               <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
> +               <&sleep_clk>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +    };
> +
> +...
> diff --git a/include/dt-bindings/clock/qcom,sm6375-gcc.h b/include/dt-bindings/clock/qcom,sm6375-gcc.h
> new file mode 100644
> index 000000000000..1e9801e1cedf
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,sm6375-gcc.h
> @@ -0,0 +1,234 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Hm, Qualcomm gave permission to relicense bindings to dual-license,
although I am not sure how this works with files where copyrights were
transferred to Linux Foundation...

> +/*
> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2022, Konrad Dybcio <konrad.dybcio@somainline.org>
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SM6375_H
> +#define _DT_BINDINGS_CLK_QCOM_GCC_SM6375_H
> +


Best regards,
Krzysztof
