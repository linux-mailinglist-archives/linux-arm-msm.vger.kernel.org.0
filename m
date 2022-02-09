Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C06F24AFBCE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 19:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240922AbiBISua (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 13:50:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240594AbiBISts (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 13:49:48 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 334E3C1DF808
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 10:45:13 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id i14so5582727wrc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 10:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=MDTFOP0ZVLcSgSiBcHgvR2UN4No5GnymFw2d8uiYcvk=;
        b=FdNU5tTmSod/jSM8KX6alPbME79WSYKwnPZd3rghnlVvFQlGWK4qG6o6CPAjFQpXPt
         46kgNHKv11KuQ6xvHax3mreStQTu9H7M2QQUy4/j6Tw4tgSeK6/ZO1/IE3zLCINwdq7j
         Dfq2qfq27ASmLnEFlwDsS7sQ0XZGx3L8FwiXiNcVek9AfU7AmYx0P1JUP8CXXgW7yyMb
         RMbEgAmbFKNwaEU9ph92jV6cu+W+i8UxZkXVUJkFpFQRfRje2OjRxMimG7S854srZOGT
         u/NziF81BCR8NakNXQRgjmGdhd0xwE/jS+/NTuGpKxJwx40gn9kUcXf5c6uaHNQDm46z
         QmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MDTFOP0ZVLcSgSiBcHgvR2UN4No5GnymFw2d8uiYcvk=;
        b=0JTZsNM8nIL0yQwkPsHtP5+G8oHjterhFKNqSBoWcFLYF8frG1D6HUizozEzc9OeKY
         2kx5+hanxVZX327uRynnlabXRZ80JGa2u9sOm5zbE889Cyb7DrlaXr9GmK+fVqxhDHnL
         AnP+i7Awy3y3tFpzPJkraCh2mTL2oi4tRLVLBPsiLVTXx1yUc7sYwc7ByFKL465z0aWh
         sJD5sd5ofrcDGc/dZdQIlef1x2aXgiJ1SuJBCzmsGUDUGJvbZsM4FkEY+oPhpYp0hki6
         SPOiqjZ2ffcjGge6+wcvaWMVYXL7qcRvy9HTpRA+Z82rEc7dd+K/0F0Q3holsQsN0AK+
         rwyA==
X-Gm-Message-State: AOAM530tBDVYVQamB4yU3bBeQbryl6v9RHsICLFGJT2nwzAMlABOGiN3
        g78ZEa/o7sSA3gJtGCEmww2JQg==
X-Google-Smtp-Source: ABdhPJyg6PEx0zDNrerIJSprqpSwL3vIKQRiQ7VcehSCsrzZAe7DPFmKI7iYFo+An+aViFo3gOu3nA==
X-Received: by 2002:adf:e350:: with SMTP id n16mr3109759wrj.160.1644432311558;
        Wed, 09 Feb 2022 10:45:11 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:682b:4712:4b40:6814])
        by smtp.gmail.com with ESMTPSA id o3sm9634315wrc.41.2022.02.09.10.45.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Feb 2022 10:45:11 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v5 1/2] dt-bindings: clock: Add qualcomm QCM2290 DISPCC bindings
Date:   Wed,  9 Feb 2022 19:45:07 +0100
Message-Id: <1644432308-21099-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for display clock controller on QCM2290 SoCs.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 v2: no change
 v3: Include dt-bindings header (qcom,dispcc-qcm2290.h) in that commit
 v4: Dual license for qcom dt related binding/header
 v5: no change

 .../bindings/clock/qcom,qcm2290-dispcc.yaml        | 87 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,dispcc-qcm2290.h    | 34 +++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-qcm2290.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
new file mode 100644
index 00000000..973e408
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,qcm2290-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Clock & Reset Controller Binding for qcm2290
+
+maintainers:
+  - Loic Poulain <loic.poulain@linaro.org>
+
+description: |
+  Qualcomm display clock control module which supports the clocks, resets and
+  power domains on qcm2290.
+
+  See also dt-bindings/clock/qcom,dispcc-qcm2290.h.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-dispcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active-only XO source
+      - description: GPLL0 source from GCC
+      - description: GPLL0 div source from GCC
+      - description: Byte clock from DSI PHY
+      - description: Pixel clock from DSI PHY
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: bi_tcxo_ao
+      - const: gcc_disp_gpll0_clk_src
+      - const: gcc_disp_gpll0_div_clk_src
+      - const: dsi0_phy_pll_out_byteclk
+      - const: dsi0_phy_pll_out_dsiclk
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
+    #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    clock-controller@5f00000 {
+            compatible = "qcom,qcm2290-dispcc";
+            reg = <0x5f00000 0x20000>;
+            clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+                     <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
+                     <&gcc GCC_DISP_GPLL0_CLK_SRC>,
+                     <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+                     <&dsi0_phy 0>,
+                     <&dsi0_phy 1>;
+            clock-names = "bi_tcxo",
+                          "bi_tcxo_ao",
+                          "gcc_disp_gpll0_clk_src",
+                          "gcc_disp_gpll0_div_clk_src",
+                          "dsi0_phy_pll_out_byteclk",
+                          "dsi0_phy_pll_out_dsiclk";
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+            #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,dispcc-qcm2290.h b/include/dt-bindings/clock/qcom,dispcc-qcm2290.h
new file mode 100644
index 00000000..1db513d
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,dispcc-qcm2290.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_QCM2290_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_QCM2290_H
+
+/* DISP_CC clocks */
+#define DISP_CC_PLL0				0
+#define DISP_CC_MDSS_AHB_CLK			1
+#define DISP_CC_MDSS_AHB_CLK_SRC		2
+#define DISP_CC_MDSS_BYTE0_CLK			3
+#define DISP_CC_MDSS_BYTE0_CLK_SRC		4
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC		5
+#define DISP_CC_MDSS_BYTE0_INTF_CLK		6
+#define DISP_CC_MDSS_ESC0_CLK			7
+#define DISP_CC_MDSS_ESC0_CLK_SRC		8
+#define DISP_CC_MDSS_MDP_CLK			9
+#define DISP_CC_MDSS_MDP_CLK_SRC		10
+#define DISP_CC_MDSS_MDP_LUT_CLK		11
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK		12
+#define DISP_CC_MDSS_PCLK0_CLK			13
+#define DISP_CC_MDSS_PCLK0_CLK_SRC		14
+#define DISP_CC_MDSS_VSYNC_CLK			15
+#define DISP_CC_MDSS_VSYNC_CLK_SRC		16
+#define DISP_CC_SLEEP_CLK			17
+#define DISP_CC_SLEEP_CLK_SRC			18
+#define DISP_CC_XO_CLK				19
+#define DISP_CC_XO_CLK_SRC			20
+
+#define MDSS_GDSC				0
+
+#endif
-- 
2.7.4

