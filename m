Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9DA0551832
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 14:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241293AbiFTMGf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 08:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240977AbiFTMGe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 08:06:34 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF58513D48
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 05:06:31 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id d19so11647083lji.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 05:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=y/BBzGS6z1y3lcCHOFhj5sQmIJ3GeU5t9jYdhTDlx/Q=;
        b=a5fHb2VhvsL55IXv7qRkXjlxq2zQB8FhHtrJrKpJs6aVUssfxSZm4QvC07H+A5A2tS
         suQBmOoRXAmkfij/b8O7fCsmtJubBDtBO+L1YhDqNbQEowuxBZGH8gEG6ckK7XZjUdmp
         IKyBvzUOBovzyFJA88vwCd8cTQKga28cyg+qNTl38U8doUileDKhptjb0Bufci6/3b8z
         EM6fhV5kHlMjximbciVOpWq46DpxW/A5OHu1+7o5Jkl3LMeT8RbWNX/e7LjqcQ31emLr
         lnpKBbH5wQ6MKuxUT3OQnrAw8kjBDdbHTINce4Oe20wHlzXZ0mwnNYC8eXqC0HKMQThX
         Ak8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=y/BBzGS6z1y3lcCHOFhj5sQmIJ3GeU5t9jYdhTDlx/Q=;
        b=v2EBRAM7sZ2mWQbYRc4DhN3IEVFa31Q3xr0DDJ+dkfg+w4tQ7FDnEOqQka21sF49Ly
         8TPqqH5sTxF3TuOKmZvjIp9pFGMF9F0a9/uAR2XCV+5MHxef5rymeUVVlf+AHIj0jKYW
         epuKHaxUDGRNSwuZ49UU/Tyj0BshTfouzCLkZjrSv+Au7NqzHtk3XG9HNbbgCyaJEgvs
         jmlXCmWIpouvksLe0mUwWqqOVPQQdMHchKwn4HrvcS2HuQNgsLCY0fTQbb4lrE2o+mzv
         N2j84EwC7P/F2/Jfsn7ybleU8Oo4T9JGiiTCBd3bHkFEsWUqilqWp3IWb/vq1T9Herwf
         CYFg==
X-Gm-Message-State: AJIora9/BMsurUCNOelaJbqYiXdX361wqquOSsFFHyXydv9vHbkK+/Wb
        egvjwdIAje8KNTWRrSzrYw3BuoiYPvzrfBXv
X-Google-Smtp-Source: AGRyM1u6G5E/X9Fxb7PZheb2s/oIe+m+kHEyQi3M5m7OmfTwuzoi+RDs93KMN4y/P5KQrDz2mr8Nug==
X-Received: by 2002:a2e:a54a:0:b0:25a:7010:4aee with SMTP id e10-20020a2ea54a000000b0025a70104aeemr1868289ljn.245.1655726790310;
        Mon, 20 Jun 2022 05:06:30 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r8-20020a2e8e28000000b0025a6751f35esm712911ljk.16.2022.06.20.05.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 05:06:29 -0700 (PDT)
Message-ID: <380a5163-a942-0677-5bef-52b3ee0f6f24@linaro.org>
Date:   Mon, 20 Jun 2022 15:06:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 2/7] dt-bindings: clock: separate bindings for MSM8916
 GCC device
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20220619212735.1244953-1-dmitry.baryshkov@linaro.org>
 <20220619212735.1244953-3-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220619212735.1244953-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/06/2022 00:27, Dmitry Baryshkov wrote:
> Separate bindings for GCC on Qualcomm MSM8916 platforms. This adds new
> clocks/clock-names properties to be used for clock links.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Forgot to carry over from v1:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> ---
>   .../bindings/clock/qcom,gcc-msm8916.yaml      | 61 +++++++++++++++++++
>   .../bindings/clock/qcom,gcc-other.yaml        |  1 -
>   2 files changed, 61 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
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
> +      - const: dsi0pll
> +      - const: dsi0pllbyte
> +      - const: ext_mclk
> +      - const: ext_pri_i2s
> +      - const: ext_sec_i2s
> +
> +required:
> +  - compatible
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@300000 {
> +      compatible = "qcom,gcc-msm8916";
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +      reg = <0x300000 0x90000>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
> index 6c78df0c46a9..61b90e836b5b 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
> @@ -41,7 +41,6 @@ properties:
>         - qcom,gcc-mdm9607
>         - qcom,gcc-msm8226
>         - qcom,gcc-msm8660
> -      - qcom,gcc-msm8916
>         - qcom,gcc-msm8939
>         - qcom,gcc-msm8953
>         - qcom,gcc-msm8974


-- 
With best wishes
Dmitry
