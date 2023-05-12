Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E04C87000E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 08:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239936AbjELGwa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 02:52:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239978AbjELGw3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 02:52:29 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEFC87685
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 23:52:27 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9660af2499dso1474212566b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 23:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683874346; x=1686466346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R7RJpOY1ANYNLH6FwbI3vzAAsHKQVRNZFSBYSrqockU=;
        b=CIf4Yeuy0QTu+b3t6ageiMZtGs9MIOu+ChQcCAryCCcljb14t7wsw3iExahG37yslW
         OXV9LRxbokxgr5WVuhs+AtUIIMg6KwAH0ZO/dhu8f1L+fldoN1X9M8Q4eh+FBAh4hBrG
         mOUTP3nh/iUFeoI0aBViAKbStA9onL8qdTQk/Sy1giULJzsOoBDAv6mW/FKvzYY2Jeh8
         zoF5APasPu1RBkFP6f1NWTwJdrcdVYvvF1Q9n1EYdEZ6nCZDaQ2lwNP/TN9C+MOS6EHM
         7Mrk82/hv93Gxhwt7JGwXOHmGe1jIZpQEKa33iVZIg+n2RSvKUiqz+QQiS0/vi0ubQWu
         0ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683874346; x=1686466346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R7RJpOY1ANYNLH6FwbI3vzAAsHKQVRNZFSBYSrqockU=;
        b=F0TxtwdLiis4JWTQQp2GHtNi+CiWCCF1E8UHu6BdI1FKXNub5sSKEpEzfSdl7Sn5vn
         Xk7sBELjbFW08ggjPOqZNto+8tSvQnQE5y06LrbcDfRzT4FIelfpT6RmXde4OSrmyHlv
         VM9mj1M0KTI5H1uUuiw7qusJe4GRAx6JiNpzLfaGPXouoqFokHOQ7GphoryrQ/JXp2RL
         ZUDvSObwv8T78QEYyaoFrkBKBO+eGeUCT9QalX808d/jG0/V8WFLEY/5ZtFCqVY3E3f+
         YI3ADh6h7oIujvB0wYThBjWV7+ckMii5IypaC32n2ELiUBBh2CqUSqs6w+aK+25BaG9T
         L5ag==
X-Gm-Message-State: AC+VfDxR+ExMoNrJmnTssKrxDDLiF/OBxk+MEjfOT+rgUuATWnDVQvdt
        3QsxvGn7icCwsQSiRiBbM/FjTA==
X-Google-Smtp-Source: ACHHUZ52L2C0SjQIH/NJDx0iwF5TGp/jLgm842OdU8qGrzZq0Svnn3x0eOLv1Tlxcq1nYKUgbyxXgg==
X-Received: by 2002:a17:906:fe0c:b0:961:78c2:1d27 with SMTP id wy12-20020a170906fe0c00b0096178c21d27mr20498125ejb.19.1683874346326;
        Thu, 11 May 2023 23:52:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883? ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id jy17-20020a170907763100b00969dc13d0b1sm4666502ejc.43.2023.05.11.23.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 23:52:25 -0700 (PDT)
Message-ID: <d3daccb6-8b4e-7016-5545-097dba2188b2@linaro.org>
Date:   Fri, 12 May 2023 08:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 03/10] dt-bindings: clock: provide separate bindings
 for qcom,gcc-mdm9615
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
 <20230512003230.3043284-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512003230.3043284-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/05/2023 02:32, Dmitry Baryshkov wrote:
> The global clock controller on MDM9615 uses external CXO and PLL7
> clocks. Split the qcom,gcc-mdm9615 to the separate schema file.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-mdm9615.yaml      | 48 +++++++++++++++++++
>  .../bindings/clock/qcom,gcc-other.yaml        |  3 --
>  2 files changed, 48 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
> new file mode 100644
> index 000000000000..bc9786f2c1d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,gcc-mdm9615.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller on MDM9615
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +  - Taniya Das <quic_tdas@quicinc.com>
> +
> +description: |
> +  Qualcomm global clock control module provides the clocks, resets and power
> +  domains on MDM9615.
> +
> +  See also::
> +    include/dt-bindings/clock/qcom,gcc-mdm9615.h
> +    include/dt-bindings/reset/qcom,gcc-mdm9615.h
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-mdm9615
> +
> +  clocks:
> +    maxItems: 2

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

Best regards,
Krzysztof

