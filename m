Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 935135501B6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 03:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbiFRBkT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 21:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236246AbiFRBkT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 21:40:19 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC8315A17C
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 18:40:17 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id k127so324678pfd.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 18:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GMHF/u9bPDg4lVJbvtFVsKtsQngEdOA06oMBpGPsk2g=;
        b=uilQBylMCOu8HTrM/uvoYdevNLPwOdrfdJ56FIrpT1KowIi5+cAH9zcEBpIpywXqKQ
         kYGY7hRlFZkHpLdEPzjTZ4MfbwtYd6NMq4wrg63qsKqtewAw1xAn/BA3xDV4vnQM0/yT
         t/mOp/dDLcWiIH3XOLHq/CPS8G4TV+28XkA1kN8NKIB1xM+qkxwMG3cR7Px5SknRmpKj
         24hBzAU+P+7zuMRFkSgQj4Tvt6fd3jRHB6kLr4QiEMSQY6VCjLsI7LKLCEIEQ/uwysCZ
         BV6thugXQKyUP0WtqSoWkH68mXicdsiTEfdm20zibVq2x0QqBKrc3vVWw0VhUpU0na3Q
         99eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GMHF/u9bPDg4lVJbvtFVsKtsQngEdOA06oMBpGPsk2g=;
        b=Cd+9L6qzAfLB/P8O7KFcxveVN7hxI5H0xsWeYTbBb/hkanokns2YxEG5TIn9AGWeIc
         LOavqVc5w4KsJmJFamN0g4qdKLUZuNFxn/MVts41gt1ig8I58k00kvbmSNljGIiZvmWN
         A/X+ua4sE9f4TjIFKljTc6KL2DcUaJiH+lHCLd9TN4xRhtZZW+UsDqufOMBoxnueEl2r
         zBOs8zAtIjZFn1buhMFLob/nzuZuqiTLIglTuGs9gAKHS6aB9tpyA8pk8wHeTjIUoR7M
         HamwOwcp0eTL9RwADjy7QXNdrRMPdjSk3qqamKRoEluYqBDD6Hs9YgUQUzlF5lrCsj9l
         9hqw==
X-Gm-Message-State: AJIora/KDQ8FMaWpjGU1nV3TJV2fhF3un/XnYrBryb/LrgkW86VEcrYB
        MRyiRXyPS4cBSyDFVRDzKHxTvg==
X-Google-Smtp-Source: AGRyM1u8Otwha/+YXvvaGP0YeA0BFSEeABIPl8Nsoy8r8VLEpl7pD+kzP1A7uB7ZYZ74C80Fgcj8VA==
X-Received: by 2002:a05:6a00:162a:b0:51e:73c4:f895 with SMTP id e10-20020a056a00162a00b0051e73c4f895mr12923091pfc.82.1655516417243;
        Fri, 17 Jun 2022 18:40:17 -0700 (PDT)
Received: from [172.31.235.92] ([216.9.110.6])
        by smtp.gmail.com with ESMTPSA id 75-20020a62184e000000b0051b915c1a47sm4281811pfy.113.2022.06.17.18.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 18:40:16 -0700 (PDT)
Message-ID: <4a614c32-35c5-2dfa-3e15-d54c3c3c5836@linaro.org>
Date:   Fri, 17 Jun 2022 18:40:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/7] dt-bindings: clock: separate bindings for MSM8916 GCC
 device
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
 <20220617144714.817765-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220617144714.817765-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/06/2022 07:47, Dmitry Baryshkov wrote:
> Separate bindings for GCC on Qualcomm MSM8916 platforms. This adds new
> clocks/clock-names properties to be used for clock links.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-msm8916.yaml      | 61 +++++++++++++++++++
>  .../bindings/clock/qcom,gcc-other.yaml        |  1 -
>  2 files changed, 61 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
> new file mode 100644
> index 000000000000..564aa764b17b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8916.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller Binding for MSM8916
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +  - Taniya Das <quic_tdas@quicinc.com>
> +
> +description: |
> +  Qualcomm global clock control module which supports the clocks, resets and
> +  power domains on MSM8916.
> +
> +  See also:
> +  - dt-bindings/clock/qcom,gcc-msm8916.h
> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-msm8916
> +
> +  clocks:
> +    items:
> +      - description: XO source
> +      - description: Sleep clock source
> +      - description: DSI phy instance 0 dsi clock
> +      - description: DSI phy instance 0 byte clock
> +      - description: External MCLK clock
> +      - description: External Primary I2S clock
> +      - description: External Secondary I2S clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: sleep_clk

Just "sleep"

Best regards,
Krzysztof
