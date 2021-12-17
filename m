Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF6944792E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Dec 2021 18:32:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233481AbhLQRcS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Dec 2021 12:32:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhLQRcR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Dec 2021 12:32:17 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C11FC06173E
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Dec 2021 09:32:17 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id z4-20020a1c7e04000000b0032fb900951eso4543712wmc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Dec 2021 09:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=QMMzlJVDJjNMbWqgE5EJfkkyutHBkoBYhgsjQi1KDP4=;
        b=qHqplZ9DaZH2Vmw+l/m1lAK+9wdQpcPWPYtNXqHgOSEv+4puv0wiswAMvARI5Lk1iB
         ziLnhvkTswVSQCuJypzropFwuVwtjJrx4ieeMeRrZiR2ep/v0ngFtEiHSsxjrK3i+hVX
         13DXBYzWtUy+/rAw2sowdySYOf6W8TUGVW9/VNWcB9qxOQyAqzTtJTLi688eAhPwS6HU
         gBy36DlQOBI+dxes9ZFLknvO+UviiX/JvB58iEJQVCkU8D+LreG+67otrFgSiMlUam/d
         wj1+yGgY15z0Fe8pjKdJZT7BTTPlh8aMDzWfqJ0xsotUkTVPiEHrdKqPPKkvS8GoA8KD
         9F2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QMMzlJVDJjNMbWqgE5EJfkkyutHBkoBYhgsjQi1KDP4=;
        b=bRcPswHtQ8VPX4ND+GIfXGTlTuWmgyvkFJNwlYvqfyxAUGGiHYkj93A6+1acO0Wrc/
         GC1ZFgLKImPheeVDndXC+n9YPuJZ8sYORMBek1HSc0W8uu+qqj9cISOxGfHq2pf7fpij
         Gf37YcXS0mA6SdzLlcdHxKv6MQYQoC4rQisebGAKbHWOIv0kunzxWOBtb/TGWkL6hchR
         TTj7KU88xrpF/PrkGV+FQatdeEbk8b9B5eJTOJQ4QhcGdvdcageIeL1jOGi2PHPDoekT
         uX4lNrFT5s1S34cal2sZeb6lQkqQZjFYCd7vLjpbET+eS0pZ6U8VQNCnecvyf+wZGvEf
         QKYQ==
X-Gm-Message-State: AOAM531+HOQa8vAOIAOkYt/VRNiKIZLi2OikfBFq+cokdLDi+81b8VHl
        uTXgn7Y+qiZQJhPEs5IqH8PHsAyD3vfbEBj1
X-Google-Smtp-Source: ABdhPJwJtrL0rTEP9Y9mpH9MlyrXn5fZhNpPmSZ0cr+OMad/q4nSeu1rq7xU/3dnnxXxPII79NyF3w==
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr3513549wmh.164.1639762335693;
        Fri, 17 Dec 2021 09:32:15 -0800 (PST)
Received: from localhost.localdomain ([88.160.176.23])
        by smtp.gmail.com with ESMTPSA id p19sm8884667wmq.4.2021.12.17.09.32.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Dec 2021 09:32:15 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, shawn.guo@linaro.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        sboyd@kernel.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings: clock: Add qualcomm QCM2290 DISPCC bindings
Date:   Fri, 17 Dec 2021 18:44:19 +0100
Message-Id: <1639763060-24524-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for display clock controller on QCM2290 SoCs.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 v2: no change
 v3: Include dt-bindings header (qcom,dispcc-qcm2290.h) in that commit
 v4: Dual license for qcom dt related binding/header

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

