Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0193636C41E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 12:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237994AbhD0Kfr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Apr 2021 06:35:47 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:33578 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238815AbhD0KeR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Apr 2021 06:34:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619519614; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=zo8OC4B7xlvjSm+go+a516DwHNfsC42YPAAtkBGQ0rA=; b=KiZAXKiSDojplrlwYe8bydbj22MkO6OmaC0GMfdHn5RtGRsG5umruvdT1v4qfKf6hK2CsHUW
 IECE8b26bsdafxQ/vCi/2tSCGn8sB+dWRfRygKqa0r6TbEsanFGQnulsxktxPrPP1Ez7AUYy
 jWDsrk/V365nPAgfnAa/gO3vAPo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6087e879febcffa80fbc5e92 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Apr 2021 10:33:29
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2B0ACC433F1; Tue, 27 Apr 2021 10:33:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D3221C4160D;
        Tue, 27 Apr 2021 10:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D3221C4160D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 1/6] dt-bindings: clock: Add SC7280 DISPCC clock binding
Date:   Tue, 27 Apr 2021 16:03:05 +0530
Message-Id: <1619519590-3019-2-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619519590-3019-1-git-send-email-tdas@codeaurora.org>
References: <1619519590-3019-1-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for display clock controller subsystem for
Qualcomm Technology Inc's SC7280 SoCs.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../bindings/clock/qcom,sc7280-dispcc.yaml         | 94 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,dispcc-sc7280.h     | 55 +++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7280-dispcc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sc7280.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-dispcc.yaml
new file mode 100644
index 0000000..2178666
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-dispcc.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sc7280-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Clock & Reset Controller Binding for SC7280
+
+maintainers:
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm display clock control module which supports the clocks, resets and
+  power domains on SC7280.
+
+  See also dt-bindings/clock/qcom,dispcc-sc7280.h.
+
+properties:
+  compatible:
+    const: qcom,sc7280-dispcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: GPLL0 source from GCC
+      - description: Byte clock from DSI PHY
+      - description: Pixel clock from DSI PHY
+      - description: Link clock from DP PHY
+      - description: VCO DIV clock from DP PHY
+      - description: Link clock from EDP PHY
+      - description: VCO DIV clock from EDP PHY
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: gcc_disp_gpll0_clk
+      - const: dsi0_phy_pll_out_byteclk
+      - const: dsi0_phy_pll_out_dsiclk
+      - const: dp_phy_pll_link_clk
+      - const: dp_phy_pll_vco_div_clk
+      - const: edp_phy_pll_link_clk
+      - const: edp_phy_pll_vco_div_clk
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
+    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@af00000 {
+      compatible = "qcom,sc7280-dispcc";
+      reg = <0x0af00000 0x200000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&gcc GCC_DISP_GPLL0_CLK_SRC>,
+               <&dsi_phy 0>,
+               <&dsi_phy 1>,
+               <&dp_phy 0>,
+               <&dp_phy 1>,
+               <&edp_phy 0>,
+               <&edp_phy 1>;
+      clock-names = "bi_tcxo",
+                    "gcc_disp_gpll0_clk",
+                    "dsi0_phy_pll_out_byteclk",
+                    "dsi0_phy_pll_out_dsiclk",
+                    "dp_phy_pll_link_clk",
+                    "dp_phy_pll_vco_div_clk",
+                    "edp_phy_pll_link_clk",
+                    "edp_phy_pll_vco_div_clk";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7280.h b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
new file mode 100644
index 0000000..2074b30
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SC7280_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_SC7280_H
+
+/* DISP_CC clocks */
+#define DISP_CC_PLL0					0
+#define DISP_CC_MDSS_AHB_CLK				1
+#define DISP_CC_MDSS_AHB_CLK_SRC			2
+#define DISP_CC_MDSS_BYTE0_CLK				3
+#define DISP_CC_MDSS_BYTE0_CLK_SRC			4
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC			5
+#define DISP_CC_MDSS_BYTE0_INTF_CLK			6
+#define DISP_CC_MDSS_DP_AUX_CLK				7
+#define DISP_CC_MDSS_DP_AUX_CLK_SRC			8
+#define DISP_CC_MDSS_DP_CRYPTO_CLK			9
+#define DISP_CC_MDSS_DP_CRYPTO_CLK_SRC			10
+#define DISP_CC_MDSS_DP_LINK_CLK			11
+#define DISP_CC_MDSS_DP_LINK_CLK_SRC			12
+#define DISP_CC_MDSS_DP_LINK_DIV_CLK_SRC		13
+#define DISP_CC_MDSS_DP_LINK_INTF_CLK			14
+#define DISP_CC_MDSS_DP_PIXEL_CLK			15
+#define DISP_CC_MDSS_DP_PIXEL_CLK_SRC			16
+#define DISP_CC_MDSS_EDP_AUX_CLK			17
+#define DISP_CC_MDSS_EDP_AUX_CLK_SRC			18
+#define DISP_CC_MDSS_EDP_LINK_CLK			19
+#define DISP_CC_MDSS_EDP_LINK_CLK_SRC			20
+#define DISP_CC_MDSS_EDP_LINK_DIV_CLK_SRC		21
+#define DISP_CC_MDSS_EDP_LINK_INTF_CLK			22
+#define DISP_CC_MDSS_EDP_PIXEL_CLK			23
+#define DISP_CC_MDSS_EDP_PIXEL_CLK_SRC			24
+#define DISP_CC_MDSS_ESC0_CLK				25
+#define DISP_CC_MDSS_ESC0_CLK_SRC			26
+#define DISP_CC_MDSS_MDP_CLK				27
+#define DISP_CC_MDSS_MDP_CLK_SRC			28
+#define DISP_CC_MDSS_MDP_LUT_CLK			29
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK			30
+#define DISP_CC_MDSS_PCLK0_CLK				31
+#define DISP_CC_MDSS_PCLK0_CLK_SRC			32
+#define DISP_CC_MDSS_ROT_CLK				33
+#define DISP_CC_MDSS_ROT_CLK_SRC			34
+#define DISP_CC_MDSS_RSCC_AHB_CLK			35
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK			36
+#define DISP_CC_MDSS_VSYNC_CLK				37
+#define DISP_CC_MDSS_VSYNC_CLK_SRC			38
+#define DISP_CC_SLEEP_CLK				39
+#define DISP_CC_XO_CLK					40
+
+/* DISP_CC power domains */
+#define DISP_CC_MDSS_CORE_GDSC				0
+
+#endif
-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

