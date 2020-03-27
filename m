Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED7A8195F1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2020 20:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgC0Tsx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Mar 2020 15:48:53 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:23187 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727505AbgC0Tsw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Mar 2020 15:48:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585338532; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=lFClKp9YImPAe7HParWpT3YvwvHYdK4vNuSzrBWlskU=; b=fJUnOent0JozhYNMQqQxG/oxiggsNH4kvd62l5Utb7vJnluurFBhUVqtkb5tFGEqXo440Equ
 MZ1BPM2qT77mUXSmu48DQ92qnp4n20eZU2BgcZ1ZEFxmiRKdNQd6pfrCnVWUpwY57awj6u1g
 vDVoVt5UZv/GW/4F2tBlmC0ZmDU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7e588f.7fb70b6d5d50-smtp-out-n01;
 Fri, 27 Mar 2020 19:48:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4E20EC433BA; Fri, 27 Mar 2020 19:48:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 75C61C43637;
        Fri, 27 Mar 2020 19:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 75C61C43637
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 2/4] dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7180
Date:   Sat, 28 Mar 2020 01:18:03 +0530
Message-Id: <1585338485-31820-3-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585338485-31820-1-git-send-email-tdas@codeaurora.org>
References: <1585338485-31820-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The LPASS(Low Power Audio Subsystem) clock provider have a bunch of generic
properties that are needed in a device tree. Also add clock ids for GCC
LPASS and LPASS Core clock IDs for LPASS client to request for the clocks.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../bindings/clock/qcom,sc7180-lpasscorecc.yaml    | 81 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc7180.h        |  1 +
 .../dt-bindings/clock/qcom,lpasscorecc-sc7180.h    | 28 ++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
new file mode 100644
index 0000000..d040bd1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sc7180-lpasscorecc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LPASS Core Clock Controller Binding for SC7180
+
+maintainers:
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm LPASS core clock control module which supports the clocks and
+  power domains on SC7180.
+
+  See also:
+  - dt-bindings/clock/qcom,lpasscorecc-sc7180.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sc7180-lpasshm
+      - qcom,sc7180-lpasscorecc
+
+  clocks:
+    items:
+      - description: gcc_lpass_sway clock from GCC
+
+  clock-names:
+    items:
+      - const: gcc_lpass_sway
+
+  power-domains:
+    items:
+      - description: LPASS CORE HM GSDCR
+
+  '#clock-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
+    #include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
+    clock-controller@63000000 {
+      compatible = "qcom,sc7180-lpasshm";
+        reg = <0 0x63000000 0 0x28>;
+        clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
+        clock-names = "gcc_lpass_sway";
+        #clock-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+
+  - |
+    clock-controller@62d00000 {
+        compatible = "qcom,sc7180-lpasscorecc";
+        reg = <0 0x62d00000 0 0x50000>,
+            <0 0x62780000 0 0x30000>;
+        clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
+        clock-names = "gcc_lpass_sway";
+        power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
+        #clock-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,gcc-sc7180.h b/include/dt-bindings/clock/qcom,gcc-sc7180.h
index 1258fd0..439476c 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc7180.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc7180.h
@@ -137,6 +137,7 @@
 #define GCC_MSS_NAV_AXI_CLK					127
 #define GCC_MSS_Q6_MEMNOC_AXI_CLK				128
 #define GCC_MSS_SNOC_AXI_CLK					129
+#define GCC_LPASS_CFG_NOC_SWAY_CLK				130

 /* GCC resets */
 #define GCC_QUSB2PHY_PRIM_BCR					0
diff --git a/include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h b/include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h
new file mode 100644
index 0000000..9466d5e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASS_CORE_CC_SC7180_H
+#define _DT_BINDINGS_CLK_QCOM_LPASS_CORE_CC_SC7180_H
+
+/* LPASS_CORE_CC clocks */
+#define LPASS_LPAAUDIO_DIG_PLL				0
+#define LPASS_LPAAUDIO_DIG_PLL_OUT_ODD			1
+#define CORE_CLK_SRC					2
+#define EXT_MCLK0_CLK_SRC				3
+#define LPAIF_PRI_CLK_SRC				4
+#define LPAIF_SEC_CLK_SRC				5
+#define LPASS_AUDIO_CORE_CORE_CLK			6
+#define LPASS_AUDIO_CORE_EXT_MCLK0_CLK			7
+#define LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK		8
+#define LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK		9
+#define LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK		10
+
+/* LPASS power domains */
+#define LPASS_CORE_HM_GDSCR				0
+
+#define LPASS_AUDIO_HM_GDSCR				0
+#define LPASS_PDC_HM_GDSCR				1
+
+#endif
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
