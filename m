Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A66B12B1EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 07:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfL0Giz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Dec 2019 01:38:55 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:26267 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726343AbfL0Giz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Dec 2019 01:38:55 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577428735; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=8dAnzPgbDxui/gCRrL49i+EQgE15hTm8hyMSDLmvGSw=; b=sxC1/FfWB081hUzpwGpYX6XV/Bo23WCsb0Yk/RuDu8jP3w8TE904hTYfK+OvUGo2lREDxNk6
 AXnj3iWEQDg4KTtgPhtvwGab5rHOisWT+K4FnTqC21YhHuqzJ6FDspkFAw29y6wRhvVrpHyK
 efMbCcNtXQ7gZr1kMCr1jljbrwo=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e05a6fe.7fee5bcedce0-smtp-out-n01;
 Fri, 27 Dec 2019 06:38:54 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 38135C447A9; Fri, 27 Dec 2019 06:38:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1DAB5C4479C;
        Fri, 27 Dec 2019 06:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1DAB5C4479C
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
Subject: [PATCH v3 1/6] dt-bindings: clock: Add YAML schemas for the QCOM GPUCC clock bindings
Date:   Fri, 27 Dec 2019 12:08:29 +0530
Message-Id: <1577428714-17766-2-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577428714-17766-1-git-send-email-tdas@codeaurora.org>
References: <1577428714-17766-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GPUCC clock provider have a bunch of generic properties that
are needed in a device tree. Add a YAML schemas for those.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,gpucc.txt       | 24 --------
 .../devicetree/bindings/clock/qcom,gpucc.yaml      | 71 ++++++++++++++++++++++
 2 files changed, 71 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.txt b/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
deleted file mode 100644
index 269afe8a..0000000
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Qualcomm Graphics Clock & Reset Controller Binding
---------------------------------------------------
-
-Required properties :
-- compatible : shall contain "qcom,sdm845-gpucc" or "qcom,msm8998-gpucc"
-- reg : shall contain base register location and length
-- #clock-cells : from common clock binding, shall contain 1
-- #reset-cells : from common reset binding, shall contain 1
-- #power-domain-cells : from generic power domain binding, shall contain 1
-- clocks : shall contain the XO clock
-	   shall contain the gpll0 out main clock (msm8998)
-- clock-names : shall be "xo"
-		shall be "gpll0" (msm8998)
-
-Example:
-	gpucc: clock-controller@5090000 {
-		compatible = "qcom,sdm845-gpucc";
-		reg = <0x5090000 0x9000>;
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-		#power-domain-cells = <1>;
-		clocks = <&rpmhcc RPMH_CXO_CLK>;
-		clock-names = "xo";
-	};
diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
new file mode 100644
index 0000000..993913d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/clock/qcom,gpucc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller Binding
+
+maintainers:
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm grpahics clock control module which supports the clocks, resets and
+  power domains.
+
+properties:
+  compatible:
+    enum:
+      - qcom,msm8998-gpucc
+      - qcom,sdm845-gpucc
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+    items:
+      - description: Board XO source
+      - description: GPLL0 main branch source from GCC(gcc_gpu_gpll0_clk_src)
+      - description: GPLL0 div branch source from GCC(gcc_gpu_gpll0_div_clk_src)
+
+  clock-names:
+    minItems: 1
+    maxItems: 3
+    items:
+      - const: xo
+      - const: gpll0_main
+      - const: gpll0_div
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
+examples:
+  # Example of GPUCC with clock node properties for SDM845:
+  - |
+    clock-controller@5090000 {
+      compatible = "qcom,sdm845-gpucc";
+      reg = <0x5090000 0x9000>;
+      clocks = <&rpmhcc 0>, <&gcc 31>, <&gcc 32>;
+      clock-names = "xo", "gpll0_main", "gpll0_div";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+     };
+...
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
