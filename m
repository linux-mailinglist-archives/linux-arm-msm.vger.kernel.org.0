Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDD0365093C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 10:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbiLSJQs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 04:16:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231370AbiLSJQp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 04:16:45 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21473117B
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 01:16:44 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id g14so8393036ljh.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 01:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/FjB5JXmDES2VPNlWMj2mHFDZX6qCMhDUQfH/EbbPPA=;
        b=pnzPivHrib8qRe9pF4RYmYlVy/o9HYSUt3Qs4A02PrAFl6LUdtxKWSEpr1T/x4H8ex
         mQ8VqYnEy7gDzPiTL57Zp7JRrDi1WpIeS8p3P8cXcEBF/vLYo66tN5r4zAOBl8JzkfnJ
         /IIaBXCjRJmFmRuCHUVB303+VBEQ3MdPNyWzMNCudsp3uqXAreEqvv7iDbC55oY47mmG
         2ZAF4BRggfGDKhpU499EcyGf3P5/xpKxSECZVUr2xAksoYpQ4xAEe2C77fzleO5sDkdm
         F/R7jVQkvvj4r6XSXX7VLDof3wz58L2Oz9JoGh06cFnpKw1TBhnDSS3zmB79Tk4ba16d
         YvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/FjB5JXmDES2VPNlWMj2mHFDZX6qCMhDUQfH/EbbPPA=;
        b=NTQUqg+IBUXuTgdZnkf2FBMXO1UCZkUCQ9jrRF7trUg4Uy1yV4H7vgoT2nijcHJLe1
         UXN8vBJAAalZ1eBuAdImnTBuNF0ZuPTHyD/yDbVUjXtaSOwRThGTkF0optbYjDCUTl4o
         /Tm0JzbwuVPGUioEEqce0GuNvDsVsM908yvrD+oeo9GJdqUEzADXPQuQknyZDm791kdA
         wlAfVLbi7V62oeuQiECY1q+E8ZjTWxX8sT72gxpV89ApMNBvg1MceX3mzrJoE63/gF60
         pDyjQxc6kBE3l0+KjfIL6TDCOVL4XUDYCqhmcHxyxGJ7Zr18J1rmgakVoPTReoToBFUp
         WfuA==
X-Gm-Message-State: ANoB5pkIFbmCCgpZncj9Sd7aGsC6dlTpE9VBFmRZqP+LWSpk3Nj4sRSK
        MkVXxgsmuh5hxnQdJN423B1eww==
X-Google-Smtp-Source: AA0mqf6h/VU+p+DL8VHfXCZIjRHPaxM8oXFoXjCDtucWvcsCeGsGI3Gl1lT7SWhaDTSn2zOhVsb8fQ==
X-Received: by 2002:a2e:7d11:0:b0:279:cdff:4a2c with SMTP id y17-20020a2e7d11000000b00279cdff4a2cmr10854297ljc.19.1671441402506;
        Mon, 19 Dec 2022 01:16:42 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b3-20020a2eb903000000b0027c8bc7d6fcsm657434ljb.136.2022.12.19.01.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 01:16:42 -0800 (PST)
Message-ID: <da81c0f0-8ad5-cf2d-a62b-0bbb1d98795f@linaro.org>
Date:   Mon, 19 Dec 2022 10:16:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,pcie2-phy: convert to YAML
 format
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20221216234027.539917-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221216234027.539917-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/12/2022 00:40, Dmitry Baryshkov wrote:
> Convert the bindings for the Qualcomm PCIe2 PHY into the YAML format
> from the text description.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/phy/qcom,pcie2-phy.yaml          | 87 +++++++++++++++++++
>  .../bindings/phy/qcom-pcie2-phy.txt           | 42 ---------
>  2 files changed, 87 insertions(+), 42 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,pcie2-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,pcie2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,pcie2-phy.yaml
> new file mode 100644
> index 000000000000..497850a5b428
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,pcie2-phy.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,pcie2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm PCIe2 PHY controller
> +
> +maintainers:
> +  - Vinod Koul <vkoul@kernel.org>
> +
> +description:
> +  The Qualcomm PCIe2 PHY is a Synopsys based phy found in a number of Qualcomm
> +  platforms.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,qcs404-pcie2-phy
> +      - const: qcom,pcie2-phy
> +
> +  reg:
> +    items:
> +      - description: PHY register set
> +
> +  clocks:
> +    items:
> +      - description: a clock-specifier pair for the "pipe" clock
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  vdda-vp-supply:
> +    description: phandle to low voltage regulator

Drop "phandle to"

> +
> +  vdda-vph-supply:
> +    description: phandle to high voltage regulator

Drop "phandle to"


> +
> +  resets:
> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: phy
> +      - const: pipe

Blank line

> +  "#clock-cells":
> +    const: 0
> +
> +  clock-output-names:
> +    maxItems: 1

Maybe keep both next to "clocks"? And same order in "required:".

> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - clocks
> +  - vdda-vp-supply
> +  - vdda-vph-supply
> +  - resets
> +  - reset-names
> +  - clock-output-names
> +  - "#clock-cells"
> +


Best regards,
Krzysztof

