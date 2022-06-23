Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 808B15578F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 13:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbiFWLrn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 07:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231421AbiFWLrm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 07:47:42 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA2E34CD64
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 04:47:40 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id g12so16915937ljk.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 04:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fv1CnzZON0JY092A1gbceDkbwjjWMEW2SS9t0ptHP00=;
        b=d2+uU/+dtTkkRGlCvBOxkfbJxOjQD3AJkN9iUAGhqND1ZMwFnG/3nOy92JwQghQCtn
         iDcWWhUn+22BKUU2x6DDr08x3y1QPk2jrD3b1YaM+LLNyYPfE9IvO2WDHUS5ngIy7L8s
         RaQzn8tVwcTdBT+OtPGk8z92yv4IVh6nlb5cceNg7x+i6y7jZgN+aoqX6i4odsEiC1Jy
         WE7jqnoaeJTSpgjzAW3GFLPcpsj+NXoehQeJ4NpL/febb2uUS31pxOrW1CzySgXANaJh
         jl6Qupz6VcHqyn4wooygZXydT+lJ425cH8xEZotmnCOEf5S2cy3Ky/pCohGjeJ3o/4YM
         McMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fv1CnzZON0JY092A1gbceDkbwjjWMEW2SS9t0ptHP00=;
        b=QQ3kUDItPhQrHb/oD7mYyyHAfirLN9j7nzUBhtY0gl4zSfKY3BtY4C/g9i+c17bNpg
         y4AkxDK/IOf7Ws2QVO87CTUdCIRwCSSB5DbkWkhFKSiZsNd1GgNwI4siUls7Si2bc6xR
         pCREfr5c2sovwEdCLSgNx7rJMipgiaHG1q+h39M1zVbokK5ve6mJB4HmEncKdR7O0iX6
         LpZa+czhMgbbtyRrRl7iIauyrW/CRAgavBmt8QibNVy7XIdtrMwhbd+jy6jka5/dU6Si
         I92+Lze4ScD8WHWcg4axgqoUn2VUpIyt6HcCOR+y5CeSq0QD1kfX2LSrP6FupkJKCLa2
         Y2fQ==
X-Gm-Message-State: AJIora/GhbPEWh5Cppe7PPFoaIg/ymWj6brGcLuDlpYBAJzoy+gQepI6
        nticw2YhzZwWkYL4+2xnUMLUfg==
X-Google-Smtp-Source: AGRyM1tIn0nc7ZoMdnHP2t1fsfsOicpivOwTkmi+N6MNKzKWeqZTDmHcQMzjSNugi89LjFVgVEQ1hA==
X-Received: by 2002:a2e:547:0:b0:25a:6ad0:7b4c with SMTP id 68-20020a2e0547000000b0025a6ad07b4cmr4642974ljf.249.1655984858915;
        Thu, 23 Jun 2022 04:47:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x5-20020a056512078500b0047f77729723sm1369968lfr.43.2022.06.23.04.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 04:47:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v1 1/4] dt-bindings: clock: qcom: add bindings for dispcc on SM8450
Date:   Thu, 23 Jun 2022 14:47:34 +0300
Message-Id: <20220623114737.247703-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623114737.247703-1-dmitry.baryshkov@linaro.org>
References: <20220623114737.247703-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for the display clock controller on Qualcomm
SM8450 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,dispcc-sm8450.yaml    | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm8450.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8450.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8450.yaml
new file mode 100644
index 000000000000..953d20a25cfb
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8450.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8450.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Clock & Reset Controller Binding for SM8450
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+description: |
+  Qualcomm display clock control module which supports the clocks, resets and
+  power domains on SM8450.
+
+  See also:
+    dt-bindings/clock/qcom,dispcc-sm8450.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8450-dispcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board Always On XO source
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY0
+      - description: Byte clock from DSI PHY1
+      - description: Pixel clock from DSI PHY1
+      - description: Link clock from DP PHY0
+      - description: VCO DIV clock from DP PHY0
+      - description: Link clock from DP PHY1
+      - description: VCO DIV clock from DP PHY1
+      - description: Link clock from DP PHY2
+      - description: VCO DIV clock from DP PHY2
+      - description: Link clock from DP PHY3
+      - description: VCO DIV clock from DP PHY3
+      - description: sleep clock
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: bi_tcxo_ao
+      - const: dsi0_phy_pll_out_byteclk
+      - const: dsi0_phy_pll_out_dsiclk
+      - const: dsi1_phy_pll_out_byteclk
+      - const: dsi1_phy_pll_out_dsiclk
+      - const: dp0_phy_pll_link_clk
+      - const: dp0_phy_pll_vco_div_clk
+      - const: dp1_phy_pll_link_clk
+      - const: dp1_phy_pll_vco_div_clk
+      - const: dp2_phy_pll_link_clk
+      - const: dp2_phy_pll_vco_div_clk
+      - const: dp3_phy_pll_link_clk
+      - const: dp3_phy_pll_vco_div_clk
+      - const: sleep_clk
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the MMCX power domain.
+    maxItems: 1
+
+  required-opps:
+    description:
+      A phandle to an OPP node describing required MMCX performance point.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    clock-controller@af00000 {
+      compatible = "qcom,sm8450-dispcc";
+      reg = <0x0af00000 0x10000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&dsi0_phy 0>,
+               <&dsi0_phy 1>,
+               <&dsi1_phy 0>,
+               <&dsi1_phy 1>,
+               <0>, <0>,
+               <0>, <0>,
+               <0>, <0>,
+               <0>, <0>,
+               <&sleep_clk>;
+      clock-names = "bi_tcxo",
+                    "bi_tcxo_ao",
+                    "dsi0_phy_pll_out_byteclk",
+                    "dsi0_phy_pll_out_dsiclk",
+                    "dsi1_phy_pll_out_byteclk",
+                    "dsi1_phy_pll_out_dsiclk",
+                    "dp0_phy_pll_link_clk",
+                    "dp0_phy_pll_vco_div_clk",
+                    "dp1_phy_pll_link_clk",
+                    "dp1_phy_pll_vco_div_clk",
+                    "dp2_phy_pll_link_clk",
+                    "dp2_phy_pll_vco_div_clk",
+                    "dp3_phy_pll_link_clk",
+                    "dp3_phy_pll_vco_div_clk",
+                    "sleep_clk";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      power-domains = <&rpmhpd SM8450_MMCX>;
+      required-opps = <&rpmhpd_opp_low_svs>;
+    };
+...
-- 
2.35.1

