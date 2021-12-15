Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D993A475170
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 04:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239598AbhLODlU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 22:41:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239593AbhLODlU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 22:41:20 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31083C06173E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 19:41:20 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id n104-20020a9d2071000000b005799790cf0bso23335464ota.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 19:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=39beibYXZFc+n6a3S0izqKqnxN7s3U+tkJicGUx8Uns=;
        b=gWBkBgBB0PcPzq4CvXX60UePrjvGxJYhgTOZ02s+Zfjt23gHBv0yXJ9PY/7X7NjGdJ
         ZQ65KkY9p100K6t9zXH8yeEOofPAS+6KBb3yUGWl2ZQkODOdOJOe+kBoMMxEbAI2gVPJ
         Ko3PxPfYmxAKbc+ykJZUtURhppjI79ifNh2A+PYbmV9EOIkj+1wSvaJ+B2TU7k+O2276
         nyADmXrUsdlOflOi24nur0tvZvRUTdNzeFoIr6GFs47p9kmJJgn27mS9NZ7pB9EgHbQk
         l8oo2ggC0+ySf3dPrU75EHhbntdW+BVeJRyCt588LnkK3FKPbNp20Y/g3qF8qFj/dX54
         SuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=39beibYXZFc+n6a3S0izqKqnxN7s3U+tkJicGUx8Uns=;
        b=LKoEknJGSTxjHCwSuSzDiEcys1Oru4fmizuMRBM4l5vPwyavSFziHn2OcH9934PTOA
         4ON4tKai9agXEdkTCNhO+XHwt7ICP9wzu8DlNVrBxv0hNPkwyLjGzKBb3odcikGwKCDD
         ajkJoGrUjAjHAgTr8D7JlaU1grWQXGwLqdnbSATK2nPs9zpTr2ZBzx2z1AFjgOhiaZ3/
         brng5E/PthisuJg882PNwHP6UiYhrcmgUu+z5Oopy5o0VouBHwwBduBcila3YDBLTEZr
         GTD8jqslx3Tcd4EE13PNuPcfD8/JiNU0DEkfp89HE1mkyE6cfipAjm5VCq2Y5WqzNWKh
         hEAw==
X-Gm-Message-State: AOAM532GMrUEIX013fvkCT6oyhLpTmS69TuwG4Ct11guuoAid7h6UzrY
        otbZus1xHf0huCZNNE0nXdjXANJRCk4XqA==
X-Google-Smtp-Source: ABdhPJwN32xuYQcouJPWhAbMD8r0EttulSezPtnaaTxsBfolYjGi/QmEcdUceZEcK/paIC14a5U7zw==
X-Received: by 2002:a9d:7cce:: with SMTP id r14mr7236950otn.114.1639539679357;
        Tue, 14 Dec 2021 19:41:19 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p10sm181504otp.53.2021.12.14.19.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 19:41:18 -0800 (PST)
Date:   Tue, 14 Dec 2021 21:41:14 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, shawn.guo@linaro.org
Subject: Re: [PATCH v2 2/2] dt-bindings: clock: Add qualcomm QCM2290 DISPCC
 bindings
Message-ID: <Yblj2j7t9/NVASed@builder.lan>
References: <1639058951-12660-1-git-send-email-loic.poulain@linaro.org>
 <1639058951-12660-2-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1639058951-12660-2-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 09 Dec 08:09 CST 2021, Loic Poulain wrote:

> Add device tree bindings for display clock controller on QCM2290 SoCs.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  v2: no change
> 
>  .../bindings/clock/qcom,qcm2290-dispcc.yaml        | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
> new file mode 100644
> index 00000000..44d5ce7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,qcm2290-dispcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display Clock & Reset Controller Binding for qcm2290
> +
> +maintainers:
> +  - Loic Poulain <loic.poulain@linaro.org>
> +
> +description: |
> +  Qualcomm display clock control module which supports the clocks, resets and
> +  power domains on qcm2290.
> +
> +  See also dt-bindings/clock/qcom,dispcc-qcm2290.h.
> +
> +properties:
> +  compatible:
> +    const: qcom,qcm2290-dispcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Board active-only XO source
> +      - description: GPLL0 source from GCC
> +      - description: GPLL0 div source from GCC
> +      - description: Byte clock from DSI PHY
> +      - description: Pixel clock from DSI PHY
> +
> +  clock-names:
> +    items:
> +      - const: bi_tcxo
> +      - const: bi_tcxo_ao
> +      - const: gcc_disp_gpll0_clk_src
> +      - const: gcc_disp_gpll0_div_clk_src
> +      - const: dsi0_phy_pll_out_byteclk
> +      - const: dsi0_phy_pll_out_dsiclk
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
> +  - clock-names
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
> +    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> +    clock-controller@5f00000 {
> +            compatible = "qcom,qcm2290-dispcc";
> +            reg = <0x5f00000 0x20000>;
> +            clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +                     <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
> +                     <&gcc GCC_DISP_GPLL0_CLK_SRC>,
> +                     <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
> +                     <&dsi0_phy 0>,
> +                     <&dsi0_phy 1>;
> +            clock-names = "bi_tcxo",
> +                          "bi_tcxo_ao",
> +                          "gcc_disp_gpll0_clk_src",
> +                          "gcc_disp_gpll0_div_clk_src",
> +                          "dsi0_phy_pll_out_byteclk",
> +                          "dsi0_phy_pll_out_dsiclk";
> +            #clock-cells = <1>;
> +            #reset-cells = <1>;
> +            #power-domain-cells = <1>;
> +    };
> +...
> -- 
> 2.7.4
> 
