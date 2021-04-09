Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1D4C359E05
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 13:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbhDILzO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 07:55:14 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:34463 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233768AbhDILzN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 07:55:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617969301; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=pwOyVsDSJZr2OlFw6nHHCdGFvhhwxrSHAgpVHaaW3kE=; b=VpJOw+Cnd2GmV21rn7++4t3+fgWtVTXGlqWxRe6j19oyPvueZ4oKyv0uZYhUeBVYM/xARYws
 rccXxazX1Sid2fGFhkX5eXwGbpBeocK1Z41yycCUT/sGs7p0OHHHy5RvrgWE2G540wscPkG+
 HUoL1SUGahesKyq3+wwYj8a6UX8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6070408bf34440a9d4ec566d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Apr 2021 11:54:51
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1CF7EC433CA; Fri,  9 Apr 2021 11:54:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AAF08C433CA;
        Fri,  9 Apr 2021 11:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AAF08C433CA
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
Subject: [PATCH v1 1/2] dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7280
Date:   Fri,  9 Apr 2021 17:24:31 +0530
Message-Id: <1617969272-10246-1-git-send-email-tdas@codeaurora.org>
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

