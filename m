Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 303A76657AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 10:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231747AbjAKJit (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 04:38:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232486AbjAKJha (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 04:37:30 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0F52AEB
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 01:36:16 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so12149531wms.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 01:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=agrBGzLEfDLBSaCHOLwWqzPW8aLKgXJ9Qn5pOrzQb5Y=;
        b=L1ew/2SCwJ61mAaiVWmR/o/h0rvj5/f8oWZHWzHzYRw3DibCnHMEDLdOE6f3JibAv4
         TIbFr3b6wleD09DJbyz69vNg50+ZP+SzNowSevdxBHlyMEYmtkEs/cfgpI3fBLmNFK7R
         nj/kwt7wwkxVeqOcx6fTIfreTT7aXZpE185iHv1G3KCJnJjK4GbWVrbx2EC8H+LPLZO4
         cbbthMcG4ULnar4283XFnePmqly+AR2Whbt32lHWAYJi4KAkQCudsQm8EvBNcH5Pn4bV
         LGXG9pwErge9lO8e+ELGjblOWgaA8i8KSoo0pcm6JEtRNmzguwM2yBmgb+xfeuMicRhs
         VcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=agrBGzLEfDLBSaCHOLwWqzPW8aLKgXJ9Qn5pOrzQb5Y=;
        b=YbULa1EtmBGAYuycZ7dLRTBTtQF7qNi4psUOG/3jq7WzDgwPkJDitu1tfmfM4D2IOK
         +DULMnm9a7h/kN4C3JZHHI/lGDAXqD/2LgV1Onw/8YL4YfU14PQKeZjw4dnCCATYrix7
         bjv+2d7WnD/E7vK27GWoCOtd3RpeuLyNLSMK+mdzmxhmks2kZg0ikDYPLDReG56lrD8d
         R74cHxIAyxJ9FxE4jnV9EEzvI+UsWvsWbfWCiKno3mLtjHCNlqSz6Cb894m3Sjv+WBIp
         34uW/i10UbVkU92eqBHrB8kOX/0qZwvGuVqPiJ/deodPByP0gx4613l1xVqkWfJPTn6W
         jv1g==
X-Gm-Message-State: AFqh2kp1Xj3BJxA8HR5oYpyrIvg7xTixrz0goCN/g1ARfkwgbvLmNQiV
        xhc5tam6sZ9a55v2+I5RvjhZBQ==
X-Google-Smtp-Source: AMrXdXur2VYSsIb72rrxWp6CTmFDaeh2Stw30IqyKOpakPOnkVDT29DdV1AQ6EJLmwgaYmiy5MRsiw==
X-Received: by 2002:a05:600c:4d25:b0:3d3:5b7a:1791 with SMTP id u37-20020a05600c4d2500b003d35b7a1791mr62592799wmp.41.1673429776076;
        Wed, 11 Jan 2023 01:36:16 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id he5-20020a05600c540500b003d9ed40a512sm13601488wmb.45.2023.01.11.01.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 01:36:15 -0800 (PST)
Message-ID: <603f9c39-3e36-bb44-2305-1d37fe033dd5@linaro.org>
Date:   Wed, 11 Jan 2023 10:36:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/7] dt-bindings: arm64: ipq9574: Add binding descriptions
 for clock and reset
Content-Language: en-US
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230110121316.24892-1-quic_devipriy@quicinc.com>
 <20230110121316.24892-2-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230110121316.24892-2-quic_devipriy@quicinc.com>
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

On 10/01/2023 13:13, devi priya wrote:
> Adding support for the global clock controller found on
> IPQ9574 based devices

Subject: drop second/last, redundant "bindings descriptions for". The
"dt-bindings" prefix is already stating that these are bindings.

> 
> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> ---
>  .../bindings/clock/qcom,gcc-other.yaml        |   4 +
>  .../devicetree/bindings/clock/qcom,gcc.yaml   |   9 +-
>  include/dt-bindings/clock/qcom,gcc-ipq9574.h  | 226 ++++++++++++++++++
>  include/dt-bindings/reset/qcom,gcc-ipq9574.h  | 164 +++++++++++++
>  4 files changed, 402 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-ipq9574.h
>  create mode 100644 include/dt-bindings/reset/qcom,gcc-ipq9574.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
> index 2e8acca64af1..cc563d640336 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
> @@ -18,6 +18,8 @@ description: |
>      include/dt-bindings/clock/qcom,gcc-ipq4019.h
>      include/dt-bindings/clock/qcom,gcc-ipq6018.h
>      include/dt-bindings/reset/qcom,gcc-ipq6018.h
> +    include/dt-bindings/clock/qcom,gcc-ipq9574.h
> +    include/dt-bindings/reset/qcom,gcc-ipq9574.h
>      include/dt-bindings/clock/qcom,gcc-msm8953.h
>      include/dt-bindings/clock/qcom,gcc-mdm9607.h
>      include/dt-bindings/clock/qcom,gcc-mdm9615.h
> @@ -34,6 +36,8 @@ properties:
>        - qcom,gcc-mdm9607
>        - qcom,gcc-msm8953
>        - qcom,gcc-mdm9615
> +      - qcom,gcc-ipq9574

Incorrect order but anyway let's switch to new naming style just like
SM8550 and SA8775p.

> +

Not related change.

>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> index 7129fbcf2b6c..5a71268538e6 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> @@ -24,6 +24,14 @@ properties:
>    '#power-domain-cells':
>      const: 1
>  
> +  clocks:
> +    minItems: 1
> +    maxItems: 8
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 8

This does not look correct, neither related.
> +
>    reg:
>      maxItems: 1
>  
> @@ -35,7 +43,6 @@ required:
>    - reg
>    - '#clock-cells'
>    - '#reset-cells'
> -  - '#power-domain-cells'

Eee? Why? What's this?




Best regards,
Krzysztof

