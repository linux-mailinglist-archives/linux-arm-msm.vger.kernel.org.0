Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A60EE62D612
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 10:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239770AbiKQJLr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 04:11:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239763AbiKQJLq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 04:11:46 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED5F5ADE6
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 01:11:44 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id a29so1770333lfj.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 01:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tXsXw7w8JkDyLDSiu5Yh3b/Fm7Pg0MvbhiI5xkmFvEQ=;
        b=sJI+yHq6jI9RKj27iv5vUpNLdWA5qhagCvsg/fUkU9/uX7QCgoRDwAv8HuM3amvBNQ
         hFwqhudVgBZwYo3URfxk6OI/l4q31WUXJvsR+il7b6AAhHcRz/swm4DnmNApRcfkM9pW
         6/Jtr6MsAY6GMTKtJM+C8sGhzzUPKhJNTc/xdpC84tXF0IMXze2VbnVuKQO6rtoete/M
         C5giK9iAS/8+mJLK04g2dX0jvBrXeGD4yCjSO8vKh0uuPPztqoogsJo8DeXdM+QVRIGR
         xPqOv+MvEMoe/sl6NqwdK0kHpbiMOei2eG2WmONaRH54t0nUnVtc9DMCP3oaTP8u09pS
         SaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tXsXw7w8JkDyLDSiu5Yh3b/Fm7Pg0MvbhiI5xkmFvEQ=;
        b=i/BAbvCK9kDG1RJ6k7JJLLFXqPWqHTsZ1WO7ZOmO0xGjnV/ScmSxrxI9E0MIZmAKKp
         JN974bSsooNLFNVifDGeX8nhyd3M4iod59EGNvIA/gRIvcpdkiY0LRxCnl8fDXrRjsbs
         ndQ+5dqa5ReLfd7VA6lIYac5XVyfN7AzWEv28HEFRkeoZ69UiGt8zqIedK7iGjgcTAu8
         pS7S+/KM86bdlmDaRV65ZxvPL+Fs2BxJQVhZM+ao+MeaESeIdmJJw4P3loZUncHZhJmx
         zk9A2u4iNK+fW2bAqVJrXDgQ28gs25k/YnEWpz9dvwjgZUVI3k/p6+So50myx/a+L56f
         on+A==
X-Gm-Message-State: ANoB5pk5b77VJnd2Do6o2SfHd6WrVYzQJCWPndLjvHdRDyKiD79gP18x
        J75ME/0AhhWREdVVCs6ZfDA0cg==
X-Google-Smtp-Source: AA0mqf4044tYKx6ExfC2MbzhI+XwYSMmNHU0iUsw4EitOvbeYN1pD+BGpwbiItp7kPYEunzwdT1IvQ==
X-Received: by 2002:a05:6512:3e6:b0:4aa:f1f2:ad77 with SMTP id n6-20020a05651203e600b004aaf1f2ad77mr558259lfq.171.1668676302580;
        Thu, 17 Nov 2022 01:11:42 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a27-20020a19ca1b000000b004a8f824466bsm53093lfg.188.2022.11.17.01.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 01:11:42 -0800 (PST)
Message-ID: <a9c269cd-5939-7753-9d3e-3bb2e08ccb5b@linaro.org>
Date:   Thu, 17 Nov 2022 10:11:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 8/9] dt-bindings: clock: Add SM8550 TCSR CC clock bindings
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20221116104716.2583320-1-abel.vesa@linaro.org>
 <20221116104716.2583320-9-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116104716.2583320-9-abel.vesa@linaro.org>
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

On 16/11/2022 11:47, Abel Vesa wrote:
> Add bindings documentation for clock TCSR driver on SM8550.

All bindings should go as first patches in the series.

Subject: drop second, redundant "bindings".

> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../bindings/clock/qcom,tcsrcc-sm8550.yaml    | 46 +++++++++++++++++++
>  .../dt-bindings/clock/qcom,tcsrcc-sm8550.h    | 18 ++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,tcsrcc-sm8550.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,tcsrcc-sm8550.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,tcsrcc-sm8550.yaml b/Documentation/devicetree/bindings/clock/qcom,tcsrcc-sm8550.yaml
> new file mode 100644
> index 000000000000..7d7bacb23610
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,tcsrcc-sm8550.yaml

Filename matching compatible.

> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,tcsrcc-sm8550.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm TCSR Clock Controller Binding for SM8550

Same issue as your GCC patch.

> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +
> +description: |
> +  Qualcomm TCSR clock control module which supports the clocks,
> +  resets and power domains on SM8550

Same issue as your GCC patch.

> +
> +  See also:
> +  - dt-bindings/clock/qcom,tcsrcc-sm8550.h

Same issue as your GCC patch.

> +
> +properties:
> +  compatible:
> +    const: qcom,sm8550-tcsrcc
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false

additionalProperties: false instead
> +
> +examples:
> +  - |
> +    clock-controller@1fc0000 {
> +      compatible = "qcom,sm8550-tcsrcc";
> +      reg = <0x1fc0000 0x30000>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +    };
> +
> +...
> diff --git a/include/dt-bindings/clock/qcom,tcsrcc-sm8550.h b/include/dt-bindings/clock/qcom,tcsrcc-sm8550.h
> new file mode 100644
> index 000000000000..eda360e84f0a
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,tcsrcc-sm8550.h

Filename matching compatible.

> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Dual license.

> +/*
> + * Copyright (c) 2022, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2022, Linaro Limited
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_SM8550_H
> +#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_SM8550_H
> +
> +/* GCC clocks */
> +#define TCSR_PCIE_0_CLKREF_EN					0
> +#define TCSR_PCIE_1_CLKREF_EN					1
> +#define TCSR_UFS_CLKREF_EN					2
> +#define TCSR_UFS_PAD_CLKREF_EN					3
> +#define TCSR_USB2_CLKREF_EN					4
> +#define TCSR_USB3_CLKREF_EN					5
> +
> +#endif

Best regards,
Krzysztof

