Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0879442B2A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 10:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbhKBJ76 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 05:59:58 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55310 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230497AbhKBJ75 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 05:59:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635847043; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Jx+vM8qVdfYsag9vp1I2pf9xO/y/giRpEdOmBIiVHF8=; b=ai086zfdCNApbdy31++gZ+JhF/a7VlhmSlUufx/rSb/m8FIf1Jee02urXW5UFeei/5BA3WqA
 j8+WFTUKaFQ9QZv83DS1Y4Ni8vl0PyN4ZcckKB0OXejElA+lP+lgAcIPyv0hRmhPeAmR08qk
 tASI8oV3KgU/i+qpIZlh5BJmWiM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 61810b822e144ac4d3c44e8f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Nov 2021 09:57:22
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2E96DC4361A; Tue,  2 Nov 2021 09:57:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4A840C43619;
        Tue,  2 Nov 2021 09:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4A840C43619
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 3/4] dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7280
Date:   Tue,  2 Nov 2021 15:26:52 +0530
Message-Id: <1635847013-3220-4-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635847013-3220-1-git-send-email-tdas@codeaurora.org>
References: <1635847013-3220-1-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The LPASS(Low Power Audio Subsystem) clock provider have a bunch of generic
properties that are needed in a device tree. Also add clock ids for
LPASS core clocks and audio clock IDs for LPASS client to request for
the clocks.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../bindings/clock/qcom,sc7280-lpasscorecc.yaml    | 137 +++++++++++++++++++++
 .../dt-bindings/clock/qcom,lpassaudiocc-sc7280.h   |  43 +++++++
 .../dt-bindings/clock/qcom,lpasscorecc-sc7280.h    |  26 ++++
 3 files changed, 206 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,lpassaudiocc-sc7280.h
 create mode 100644 include/dt-bindings/clock/qcom,lpasscorecc-sc7280.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
new file mode 100644
index 0000000..9c437c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sc7280-lpasscorecc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LPASS Core & Audio Clock Controller Binding for SC7280
+
+maintainers:
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm LPASS core and audio clock control module which supports the
+  clocks and power domains on SC7280.
+
+  See also:
+  - dt-bindings/clock/qcom,lpasscorecc-sc7280.h
+  - dt-bindings/clock/qcom,lpassaudiocc-sc7280.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sc7280-lpassaoncc
+      - qcom,sc7280-lpassaudiocc
+      - qcom,sc7280-lpasscorecc
+      - qcom,sc7280-lpasshm
+
+  clocks:
+    items:
+      - description: gcc_cfg_noc_lpass_clk
+      - description: Board XO source
+      - description: lpass_aon_cc_main_rcg source clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bi_tcxo
+      - const: lpass_aon_cc_main_rcg
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
+    maxItems: 1
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: qcom,sc7280-lpasshm
+then:
+  properties:
+    clocks:
+      maxItems: 2
+
+else:
+  properties:
+    clocks:
+      minItems: 1
+
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
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+    #include <dt-bindings/clock/qcom,lpassaudiocc-sc7280.h>
+    #include <dt-bindings/clock/qcom,lpasscorecc-sc7280.h>
+    clock-controller@3c00000 {
+      compatible = "qcom,sc7280-lpasshm";
+      reg = <0x3c00000 0x28>;
+      clocks = <&gcc GCC_CFG_NOC_LPASS_CLK>;
+      clock-names = "iface";
+      #clock-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+    #include <dt-bindings/clock/qcom,lpassaudiocc-sc7280.h>
+    #include <dt-bindings/clock/qcom,lpasscorecc-sc7280.h>
+    clock-controller@3900000 {
+      compatible = "qcom,sc7280-lpasscorecc";
+      reg = <0x3900000 0x50000>;
+      clocks = <&gcc GCC_CFG_NOC_LPASS_CLK>, <&rpmhcc RPMH_CXO_CLK>;
+      clock-names = "iface", "bi_tcxo";
+      power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>;
+      #clock-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+    #include <dt-bindings/clock/qcom,lpassaudiocc-sc7280.h>
+    #include <dt-bindings/clock/qcom,lpasscorecc-sc7280.h>
+    clock-controller@3380000 {
+      compatible = "qcom,sc7280-lpassaoncc";
+      reg = <0x3380000 0x30000>;
+      clocks = <&lpasscc LPASS_CORE_CC_CORE_CLK>, <&rpmhcc RPMH_CXO_CLK>;
+      clock-names = "iface", "bi_tcxo";
+      #clock-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+    #include <dt-bindings/clock/qcom,lpassaudiocc-sc7280.h>
+    #include <dt-bindings/clock/qcom,lpasscorecc-sc7280.h>
+    clock-controller@3300000 {
+      compatible = "qcom,sc7280-lpassaudiocc";
+      reg = <0x3300000 0x30000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&lpass_aon LPASS_AON_CC_MAIN_RCG_CLK_SRC>;
+      clock-names = "bi_tcxo", "lpass_aon_cc_main_rcg";
+      power-domains = <&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+      #clock-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,lpassaudiocc-sc7280.h b/include/dt-bindings/clock/qcom,lpassaudiocc-sc7280.h
new file mode 100644
index 0000000..20ef2ea
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,lpassaudiocc-sc7280.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASS_AUDIO_CC_SC7280_H
+#define _DT_BINDINGS_CLK_QCOM_LPASS_AUDIO_CC_SC7280_H
+
+/* LPASS_AUDIO_CC clocks */
+#define LPASS_AUDIO_CC_PLL				0
+#define LPASS_AUDIO_CC_PLL_OUT_AUX2			1
+#define LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC		2
+#define LPASS_AUDIO_CC_PLL_OUT_MAIN_DIV_CLK_SRC		3
+#define LPASS_AUDIO_CC_CDIV_RX_MCLK_DIV_CLK_SRC		4
+#define LPASS_AUDIO_CC_CODEC_MEM0_CLK			5
+#define LPASS_AUDIO_CC_CODEC_MEM1_CLK			6
+#define LPASS_AUDIO_CC_CODEC_MEM2_CLK			7
+#define LPASS_AUDIO_CC_CODEC_MEM_CLK			8
+#define LPASS_AUDIO_CC_EXT_MCLK0_CLK			9
+#define LPASS_AUDIO_CC_EXT_MCLK0_CLK_SRC		10
+#define LPASS_AUDIO_CC_EXT_MCLK1_CLK			11
+#define LPASS_AUDIO_CC_EXT_MCLK1_CLK_SRC		12
+#define LPASS_AUDIO_CC_RX_MCLK_2X_CLK			13
+#define LPASS_AUDIO_CC_RX_MCLK_CLK			14
+#define LPASS_AUDIO_CC_RX_MCLK_CLK_SRC			15
+
+/* LPASS_AON_CC clocks */
+#define LPASS_AON_CC_PLL				0
+#define LPASS_AON_CC_PLL_OUT_EVEN			1
+#define LPASS_AON_CC_PLL_OUT_MAIN_CDIV_DIV_CLK_SRC	2
+#define LPASS_AON_CC_PLL_OUT_ODD			3
+#define LPASS_AON_CC_AUDIO_HM_H_CLK			4
+#define LPASS_AON_CC_CDIV_TX_MCLK_DIV_CLK_SRC		5
+#define LPASS_AON_CC_MAIN_RCG_CLK_SRC			6
+#define LPASS_AON_CC_TX_MCLK_2X_CLK			7
+#define LPASS_AON_CC_TX_MCLK_CLK			8
+#define LPASS_AON_CC_TX_MCLK_RCG_CLK_SRC		9
+#define LPASS_AON_CC_VA_MEM0_CLK			10
+
+/* LPASS_AON_CC power domains */
+#define LPASS_AON_CC_LPASS_AUDIO_HM_GDSC		0
+
+#endif
diff --git a/include/dt-bindings/clock/qcom,lpasscorecc-sc7280.h b/include/dt-bindings/clock/qcom,lpasscorecc-sc7280.h
new file mode 100644
index 0000000..28ed2a0
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,lpasscorecc-sc7280.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASS_CORE_CC_SC7280_H
+#define _DT_BINDINGS_CLK_QCOM_LPASS_CORE_CC_SC7280_H
+
+/* LPASS_CORE_CC clocks */
+#define LPASS_CORE_CC_DIG_PLL				0
+#define LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC	1
+#define LPASS_CORE_CC_DIG_PLL_OUT_ODD			2
+#define LPASS_CORE_CC_CORE_CLK				3
+#define LPASS_CORE_CC_CORE_CLK_SRC			4
+#define LPASS_CORE_CC_EXT_IF0_CLK_SRC			5
+#define LPASS_CORE_CC_EXT_IF0_IBIT_CLK			6
+#define LPASS_CORE_CC_EXT_IF1_CLK_SRC			7
+#define LPASS_CORE_CC_EXT_IF1_IBIT_CLK			8
+#define LPASS_CORE_CC_LPM_CORE_CLK			9
+#define LPASS_CORE_CC_LPM_MEM0_CORE_CLK			10
+#define LPASS_CORE_CC_SYSNOC_MPORT_CORE_CLK		11
+
+/* LPASS_CORE_CC power domains */
+#define LPASS_CORE_CC_LPASS_CORE_HM_GDSC		0
+
+#endif
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

