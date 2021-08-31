Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA1D3FC60C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 13:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241300AbhHaKjX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 06:39:23 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:27258 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241206AbhHaKiu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 06:38:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630406276; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=pwOyVsDSJZr2OlFw6nHHCdGFvhhwxrSHAgpVHaaW3kE=; b=rJJZgQqUVrrWRwFioIJGjrGEPi69m4EK/bFj04jO7dDJgyhdjkUynRQmtzh1fIVAXKPVTFkJ
 ZOHwlu6JjgGFpHweBrm5/PlAmobcHf889CPpWTbX4E6ePgpEianMhaqNIgEAhpsaYlIFpBTn
 N+F3YTzqJ1mGbV0IXznij8b2YrY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 612e06784cd9015037e578ba (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 31 Aug 2021 10:37:44
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 36194C4360C; Tue, 31 Aug 2021 10:37:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8BC96C4338F;
        Tue, 31 Aug 2021 10:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8BC96C4338F
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
Subject: [PATCH v1 1/2] dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7280
Date:   Tue, 31 Aug 2021 16:06:41 +0530
Message-Id: <1630406202-3919-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The LPASS(Low Power Audio Subsystem) clock provider have a bunch of generic
properties that are needed in a device tree. Add the LPASS clock IDs for
LPASS PIL client to request for the clocks.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../bindings/clock/qcom,sc7280-lpasscc.yaml        | 69 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,lpass-sc7280.h      | 16 +++++
 2 files changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,lpass-sc7280.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml
new file mode 100644
index 0000000..7b62763
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sc7280-lpasscc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LPASS Core Clock Controller Binding for SC7280
+
+maintainers:
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm LPASS core clock control module which supports the clocks and
+  power domains on SC7280.
+
+  See also:
+  - dt-bindings/clock/qcom,lpass-sc7280.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sc7280-lpasscc
+
+  clocks:
+    items:
+      - description: gcc_cfg_noc_lpass_clk from GCC
+
+  clock-names:
+    items:
+      - const: iface
+
+  '#clock-cells':
+    const: 1
+
+  reg:
+    minItems: 3
+    items:
+      - description: LPASS qdsp6ss register
+      - description: LPASS top-cc register
+      - description: LPASS cc register
+
+  reg-names:
+    items:
+      - const: qdsp6ss
+      - const: top_cc
+      - const: cc
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+    #include <dt-bindings/clock/qcom,lpass-sc7280.h>
+    clock-controller@3000000 {
+      compatible = "qcom,sc7280-lpasscc";
+      reg = <0x03000000 0x40>, <0x03c04000 0x4>, <0x03389000 0x24>;
+      reg-names = "qdsp6ss", "top_cc", "cc";
+      clocks = <&gcc GCC_CFG_NOC_LPASS_CLK>;
+      clock-names = "iface";
+      #clock-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,lpass-sc7280.h b/include/dt-bindings/clock/qcom,lpass-sc7280.h
new file mode 100644
index 0000000..a259463
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,lpass-sc7280.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASS_SC7280_H
+#define _DT_BINDINGS_CLK_QCOM_LPASS_SC7280_H
+
+#define LPASS_Q6SS_AHBM_CLK				0
+#define LPASS_Q6SS_AHBS_CLK				1
+#define LPASS_TOP_CC_LPI_Q6_AXIM_HS_CLK			2
+#define LPASS_QDSP6SS_XO_CLK				3
+#define LPASS_QDSP6SS_SLEEP_CLK				4
+#define LPASS_QDSP6SS_CORE_CLK				5
+
+#endif
-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

