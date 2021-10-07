Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F042D424B47
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 02:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240098AbhJGAqJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 20:46:09 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:24518 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240093AbhJGAqI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 20:46:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633567455; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=F9LFd7zEp2fy5P7bq+8J1pgiTkSQRvBHWbOHAJ8Jwf8=; b=iFDYAPVpXMAzjl45OKw7rvUtPMBvMXHfOptwQYHeKzl+Pu82VlkPbyVz0cHs6hIe5T4HBFBp
 1To5t5oXJRnrLBoaQ0BdNPYMmXiuDhAQu26q81FAbygL8IEeFYwKUSlAjLZWO6bC2X+Y8/VG
 Z3TIMLd2SCUybewOZcqMASOUNDE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 615e42ce003e680efb8fc085 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Oct 2021 00:43:58
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8A85EC4360D; Thu,  7 Oct 2021 00:43:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 152A2C4338F;
        Thu,  7 Oct 2021 00:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 152A2C4338F
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
Subject: [PATCH v1 1/2] dt-bindings: clock: Add YAML schemas for CAMCC clocks on SC7280
Date:   Thu,  7 Oct 2021 06:13:44 +0530
Message-Id: <1633567425-11953-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The camera clock controller clock provider have a bunch of generic
properties that are needed in a device tree. Add the CAMCC clock IDs for
camera client to request for the clocks.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../bindings/clock/qcom,sc7280-camcc.yaml          |  71 ++++++++++++
 include/dt-bindings/clock/qcom,camcc-sc7280.h      | 127 +++++++++++++++++++++
 2 files changed, 198 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7280-camcc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,camcc-sc7280.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-camcc.yaml
new file mode 100644
index 0000000..f27ca6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-camcc.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sc7280-camcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Clock & Reset Controller Binding for SC7280
+
+maintainers:
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm camera clock control module which supports the clocks, resets and
+  power domains on SC7280.
+
+  See also dt-bindings/clock/qcom,camcc-sc7280.h
+
+properties:
+  compatible:
+    const: qcom,sc7280-camcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board XO active source
+      - description: Sleep clock source
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: bi_tcxo_ao
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
+    clock-controller@ad00000 {
+      compatible = "qcom,sc7280-camcc";
+      reg = <0x0ad00000 0x10000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&sleep_clk>;
+      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,camcc-sc7280.h b/include/dt-bindings/clock/qcom,camcc-sc7280.h
new file mode 100644
index 0000000..56640f4
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,camcc-sc7280.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_SC7280_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_SC7280_H
+
+/* CAM_CC clocks */
+#define CAM_CC_PLL0				0
+#define CAM_CC_PLL0_OUT_EVEN			1
+#define CAM_CC_PLL0_OUT_ODD			2
+#define CAM_CC_PLL1				3
+#define CAM_CC_PLL1_OUT_EVEN			4
+#define CAM_CC_PLL2				5
+#define CAM_CC_PLL2_OUT_AUX			6
+#define CAM_CC_PLL2_OUT_AUX2			7
+#define CAM_CC_PLL3				8
+#define CAM_CC_PLL3_OUT_EVEN			9
+#define CAM_CC_PLL4				10
+#define CAM_CC_PLL4_OUT_EVEN			11
+#define CAM_CC_PLL5				12
+#define CAM_CC_PLL5_OUT_EVEN			13
+#define CAM_CC_PLL6				14
+#define CAM_CC_PLL6_OUT_EVEN			15
+#define CAM_CC_PLL6_OUT_ODD			16
+#define CAM_CC_BPS_AHB_CLK			17
+#define CAM_CC_BPS_AREG_CLK			18
+#define CAM_CC_BPS_AXI_CLK			19
+#define CAM_CC_BPS_CLK				20
+#define CAM_CC_BPS_CLK_SRC			21
+#define CAM_CC_CAMNOC_AXI_CLK			22
+#define CAM_CC_CAMNOC_AXI_CLK_SRC		23
+#define CAM_CC_CAMNOC_DCD_XO_CLK		24
+#define CAM_CC_CCI_0_CLK			25
+#define CAM_CC_CCI_0_CLK_SRC			26
+#define CAM_CC_CCI_1_CLK			27
+#define CAM_CC_CCI_1_CLK_SRC			28
+#define CAM_CC_CORE_AHB_CLK			29
+#define CAM_CC_CPAS_AHB_CLK			30
+#define CAM_CC_CPHY_RX_CLK_SRC			31
+#define CAM_CC_CSI0PHYTIMER_CLK			32
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC		33
+#define CAM_CC_CSI1PHYTIMER_CLK			34
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC		35
+#define CAM_CC_CSI2PHYTIMER_CLK			36
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC		37
+#define CAM_CC_CSI3PHYTIMER_CLK			38
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC		39
+#define CAM_CC_CSI4PHYTIMER_CLK			40
+#define CAM_CC_CSI4PHYTIMER_CLK_SRC		41
+#define CAM_CC_CSIPHY0_CLK			42
+#define CAM_CC_CSIPHY1_CLK			43
+#define CAM_CC_CSIPHY2_CLK			44
+#define CAM_CC_CSIPHY3_CLK			45
+#define CAM_CC_CSIPHY4_CLK			46
+#define CAM_CC_FAST_AHB_CLK_SRC			47
+#define CAM_CC_GDSC_CLK				48
+#define CAM_CC_ICP_AHB_CLK			49
+#define CAM_CC_ICP_CLK				50
+#define CAM_CC_ICP_CLK_SRC			51
+#define CAM_CC_IFE_0_AXI_CLK			52
+#define CAM_CC_IFE_0_CLK			53
+#define CAM_CC_IFE_0_CLK_SRC			54
+#define CAM_CC_IFE_0_CPHY_RX_CLK		55
+#define CAM_CC_IFE_0_CSID_CLK			56
+#define CAM_CC_IFE_0_CSID_CLK_SRC		57
+#define CAM_CC_IFE_0_DSP_CLK			58
+#define CAM_CC_IFE_1_AXI_CLK			59
+#define CAM_CC_IFE_1_CLK			60
+#define CAM_CC_IFE_1_CLK_SRC			61
+#define CAM_CC_IFE_1_CPHY_RX_CLK		62
+#define CAM_CC_IFE_1_CSID_CLK			63
+#define CAM_CC_IFE_1_CSID_CLK_SRC		64
+#define CAM_CC_IFE_1_DSP_CLK			65
+#define CAM_CC_IFE_2_AXI_CLK			66
+#define CAM_CC_IFE_2_CLK			67
+#define CAM_CC_IFE_2_CLK_SRC			68
+#define CAM_CC_IFE_2_CPHY_RX_CLK		69
+#define CAM_CC_IFE_2_CSID_CLK			70
+#define CAM_CC_IFE_2_CSID_CLK_SRC		71
+#define CAM_CC_IFE_2_DSP_CLK			72
+#define CAM_CC_IFE_LITE_0_CLK			73
+#define CAM_CC_IFE_LITE_0_CLK_SRC		74
+#define CAM_CC_IFE_LITE_0_CPHY_RX_CLK		75
+#define CAM_CC_IFE_LITE_0_CSID_CLK		76
+#define CAM_CC_IFE_LITE_0_CSID_CLK_SRC		77
+#define CAM_CC_IFE_LITE_1_CLK			78
+#define CAM_CC_IFE_LITE_1_CLK_SRC		79
+#define CAM_CC_IFE_LITE_1_CPHY_RX_CLK		80
+#define CAM_CC_IFE_LITE_1_CSID_CLK		81
+#define CAM_CC_IFE_LITE_1_CSID_CLK_SRC		82
+#define CAM_CC_IPE_0_AHB_CLK			83
+#define CAM_CC_IPE_0_AREG_CLK			84
+#define CAM_CC_IPE_0_AXI_CLK			85
+#define CAM_CC_IPE_0_CLK			86
+#define CAM_CC_IPE_0_CLK_SRC			87
+#define CAM_CC_JPEG_CLK				88
+#define CAM_CC_JPEG_CLK_SRC			89
+#define CAM_CC_LRME_CLK				90
+#define CAM_CC_LRME_CLK_SRC			91
+#define CAM_CC_MCLK0_CLK			92
+#define CAM_CC_MCLK0_CLK_SRC			93
+#define CAM_CC_MCLK1_CLK			94
+#define CAM_CC_MCLK1_CLK_SRC			95
+#define CAM_CC_MCLK2_CLK			96
+#define CAM_CC_MCLK2_CLK_SRC			97
+#define CAM_CC_MCLK3_CLK			98
+#define CAM_CC_MCLK3_CLK_SRC			99
+#define CAM_CC_MCLK4_CLK			100
+#define CAM_CC_MCLK4_CLK_SRC			101
+#define CAM_CC_MCLK5_CLK			102
+#define CAM_CC_MCLK5_CLK_SRC			103
+#define CAM_CC_SLEEP_CLK			104
+#define CAM_CC_SLEEP_CLK_SRC			105
+#define CAM_CC_SLOW_AHB_CLK_SRC			106
+#define CAM_CC_XO_CLK_SRC			107
+
+/* CAM_CC power domains */
+#define CAM_CC_BPS_GDSC				0
+#define CAM_CC_IFE_0_GDSC			1
+#define CAM_CC_IFE_1_GDSC			2
+#define CAM_CC_IFE_2_GDSC			3
+#define CAM_CC_IPE_0_GDSC			4
+#define CAM_CC_TITAN_TOP_GDSC			5
+
+#endif
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

