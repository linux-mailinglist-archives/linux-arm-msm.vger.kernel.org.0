Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3DDD55E241
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240529AbiF0VJe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 17:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbiF0VJc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 17:09:32 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59AEF2675
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 14:09:31 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 9D55B206DA;
        Mon, 27 Jun 2022 23:09:28 +0200 (CEST)
Date:   Mon, 27 Jun 2022 23:09:27 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH v3 2/7] dt-bindings: clock: separate bindings for MSM8916
 GCC device
Message-ID: <20220627210927.y5met4ir3doempxn@SoMainline.org>
References: <20220619212735.1244953-1-dmitry.baryshkov@linaro.org>
 <20220619212735.1244953-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220619212735.1244953-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-06-20 00:27:30, Dmitry Baryshkov wrote:
> Separate bindings for GCC on Qualcomm MSM8916 platforms. This adds new
> clocks/clock-names properties to be used for clock links.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

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
>        - qcom,gcc-mdm9607
>        - qcom,gcc-msm8226
>        - qcom,gcc-msm8660
> -      - qcom,gcc-msm8916
>        - qcom,gcc-msm8939
>        - qcom,gcc-msm8953
>        - qcom,gcc-msm8974
> -- 
> 2.35.1
> 
