Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9AD11F5A19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 19:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729794AbgFJRSw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jun 2020 13:18:52 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:52974 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729773AbgFJRSv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jun 2020 13:18:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591809530; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=mvJnOjCTFy51EqY58xPrv2ALTEZd8rxcWmel8cKtiwk=; b=J0lQqn4JCWld+Taupabuo5anzT+Zj/gEkkHLf1uq2QvWHFsC4RW6PhJhaSiXA9FNCO/QuaCg
 qQQUGd23UB/kjoVC8E8H1rZYPTm5kq02rxJdz6ekN1BCiCdwDNKkpQzDquvvoWiXIS3tVx4c
 isRvJ9pUJAQleYBqvBXWu059/CA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5ee115eb6f2ee827da0633c3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Jun 2020 17:18:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BB769C433CA; Wed, 10 Jun 2020 17:18:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D949EC433CA;
        Wed, 10 Jun 2020 17:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D949EC433CA
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
Subject: [PATCH v3 2/4] dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7180
Date:   Wed, 10 Jun 2020 22:48:05 +0530
Message-Id: <1591809487-5588-3-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591809487-5588-1-git-send-email-tdas@codeaurora.org>
References: <1591809487-5588-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The LPASS(Low Power Audio Subsystem) clock provider have a bunch of generic
properties that are needed in a device tree. Also add clock ids for GCC
LPASS and LPASS Core clock IDs for LPASS client to request for the clocks.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../bindings/clock/qcom,sc7180-lpasscorecc.yaml    | 98 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc7180.h        |  1 +
 .../dt-bindings/clock/qcom,lpasscorecc-sc7180.h    | 29 +++++++
 3 files changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
new file mode 100644
index 0000000..5af4048
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
@@ -0,0 +1,98 @@
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
+      - const: iface
+
+  power-domains:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 2
+    items:
+      - description: lpass core cc register
+      - description: lpass audio cc register
+
+  reg-names:
+    items:
+      - const: lpass_core_cc
+      - const: lpass_audio_cc
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: qcom,sc7180-lpasshm
+then:
+  properties:
+    reg:
+      maxItems: 1
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
+        clock-names = "iface";
+        #clock-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+
+  - |
+    clock-controller@62d00000 {
+        compatible = "qcom,sc7180-lpasscorecc";
+        reg = <0 0x62d00000 0 0x50000>,
+            <0 0x62780000 0 0x30000>;
+        reg-names = "lpass_core_cc", "lpass_audio_cc";
+        clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
+        clock-names = "iface";
+        power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
+        #clock-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,gcc-sc7180.h b/include/dt-bindings/clock/qcom,gcc-sc7180.h
index 992b67b..bdf43adc 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc7180.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc7180.h
@@ -138,6 +138,7 @@
 #define GCC_MSS_Q6_MEMNOC_AXI_CLK				128
 #define GCC_MSS_SNOC_AXI_CLK					129
 #define GCC_SEC_CTRL_CLK_SRC					130
+#define GCC_LPASS_CFG_NOC_SWAY_CLK				131
 
 /* GCC resets */
 #define GCC_QUSB2PHY_PRIM_BCR					0
diff --git a/include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h b/include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h
new file mode 100644
index 0000000..a55d01d
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,lpasscorecc-sc7180.h
@@ -0,0 +1,29 @@
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
+/* LPASS Core power domains */
+#define LPASS_CORE_HM_GDSCR				0
+
+/* LPASS Audio power domains */
+#define LPASS_AUDIO_HM_GDSCR				0
+#define LPASS_PDC_HM_GDSCR				1
+
+#endif
-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

