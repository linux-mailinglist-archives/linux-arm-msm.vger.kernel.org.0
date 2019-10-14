Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCC34D6012
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2019 12:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731505AbfJNKXp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Oct 2019 06:23:45 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:54048 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731466AbfJNKXp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Oct 2019 06:23:45 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 93B1660A23; Mon, 14 Oct 2019 10:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571048623;
        bh=E9Zby+aWyleSv13Hn0OHQ6O0Tbci6jopB5831fc3/d0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fYTGf1GekaRxF8P7qa5VddYf/2xyaBgU+6ohACqmTp1a3LEDQorQoO4HERflmkIFL
         1zmSarPiBpiMwTm/eBng5ZLos4glYZK91m9PcbSSpPO/YbkelZwrpGinvpLwXEable
         6bLemLl0WvFSoRR4YqnPSbmYLQg+S7UISVH8CwRM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8A48B60615;
        Mon, 14 Oct 2019 10:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571048618;
        bh=E9Zby+aWyleSv13Hn0OHQ6O0Tbci6jopB5831fc3/d0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FAwEGO3zA3jsUat7D+gEbyHPmN7v5hPfrzAkKHh376TRac5kLYdMDqi4K0In8MDUL
         H7iA2LbAQF+pzeBsk+VnqwzZFnX1Ord5PB/tTfw3jH1IvbWdf2ejT93dv9SvG84vmV
         eIUl62P80eEApMpc0z8RZ/NpaPye1qQfO9d84nGg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8A48B60615
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v4 3/5] dt-bindings: clock: Add YAML schemas for the QCOM GCC clock bindings
Date:   Mon, 14 Oct 2019 15:53:06 +0530
Message-Id: <20191014102308.27441-4-tdas@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191014102308.27441-1-tdas@codeaurora.org>
References: <20191014102308.27441-1-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GCC clock provider have a bunch of generic properties that
are needed in a device tree. Add a YAML schemas for those.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,gcc.txt    |  94 ----------
 .../devicetree/bindings/clock/qcom,gcc.yaml   | 174 ++++++++++++++++++
 2 files changed, 174 insertions(+), 94 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
deleted file mode 100644
index d14362ad4132..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
+++ /dev/null
@@ -1,94 +0,0 @@
-Qualcomm Global Clock & Reset Controller Binding
-------------------------------------------------
-
-Required properties :
-- compatible : shall contain only one of the following:
-
-			"qcom,gcc-apq8064"
-			"qcom,gcc-apq8084"
-			"qcom,gcc-ipq8064"
-			"qcom,gcc-ipq4019"
-			"qcom,gcc-ipq8074"
-			"qcom,gcc-msm8660"
-			"qcom,gcc-msm8916"
-			"qcom,gcc-msm8960"
-			"qcom,gcc-msm8974"
-			"qcom,gcc-msm8974pro"
-			"qcom,gcc-msm8974pro-ac"
-			"qcom,gcc-msm8994"
-			"qcom,gcc-msm8996"
-			"qcom,gcc-msm8998"
-			"qcom,gcc-mdm9615"
-			"qcom,gcc-qcs404"
-			"qcom,gcc-sdm630"
-			"qcom,gcc-sdm660"
-			"qcom,gcc-sdm845"
-			"qcom,gcc-sm8150"
-
-- reg : shall contain base register location and length
-- #clock-cells : shall contain 1
-- #reset-cells : shall contain 1
-
-Optional properties :
-- #power-domain-cells : shall contain 1
-- Qualcomm TSENS (thermal sensor device) on some devices can
-be part of GCC and hence the TSENS properties can also be
-part of the GCC/clock-controller node.
-For more details on the TSENS properties please refer
-Documentation/devicetree/bindings/thermal/qcom-tsens.txt
-- protected-clocks : Protected clock specifier list as per common clock
- binding.
-
-For SM8150 only:
-       - clocks: a list of phandles and clock-specifier pairs,
-                 one for each entry in clock-names.
-       - clock-names: "bi_tcxo" (required)
-                      "sleep_clk" (optional)
-                      "aud_ref_clock" (optional)
-
-Example:
-	clock-controller@900000 {
-		compatible = "qcom,gcc-msm8960";
-		reg = <0x900000 0x4000>;
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-		#power-domain-cells = <1>;
-	};
-
-Example of GCC with TSENS properties:
-	clock-controller@900000 {
-		compatible = "qcom,gcc-apq8064";
-		reg = <0x00900000 0x4000>;
-		nvmem-cells = <&tsens_calib>, <&tsens_backup>;
-		nvmem-cell-names = "calib", "calib_backup";
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-		#thermal-sensor-cells = <1>;
-	};
-
-Example of GCC with protected-clocks properties:
-	clock-controller@100000 {
-		compatible = "qcom,gcc-sdm845";
-		reg = <0x100000 0x1f0000>;
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-		#power-domain-cells = <1>;
-		protected-clocks = <GCC_QSPI_CORE_CLK>,
-				   <GCC_QSPI_CORE_CLK_SRC>,
-				   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
-				   <GCC_LPASS_Q6_AXI_CLK>,
-				   <GCC_LPASS_SWAY_CLK>;
-	};
-
-Example of GCC with clocks
-	gcc: clock-controller@100000 {
-		compatible = "qcom,gcc-sm8150";
-		reg = <0x00100000 0x1f0000>;
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-		#power-domain-cells = <1>;
-		clock-names = "bi_tcxo",
-		              "sleep_clk";
-		clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
-			 <&sleep_clk>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
new file mode 100644
index 000000000000..b3ef1e24e91a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
@@ -0,0 +1,174 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/clock/qcom,gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains.
+
+properties:
+  compatible :
+    enum:
+       - qcom,gcc-apq8064
+       - qcom,gcc-apq8084
+       - qcom,gcc-ipq8064
+       - qcom,gcc-ipq4019
+       - qcom,gcc-ipq8074
+       - qcom,gcc-msm8660
+       - qcom,gcc-msm8916
+       - qcom,gcc-msm8960
+       - qcom,gcc-msm8974
+       - qcom,gcc-msm8974pro
+       - qcom,gcc-msm8974pro-ac
+       - qcom,gcc-msm8994
+       - qcom,gcc-msm8996
+       - qcom,gcc-msm8998
+       - qcom,gcc-mdm9615
+       - qcom,gcc-qcs404
+       - qcom,gcc-sdm630
+       - qcom,gcc-sdm660
+       - qcom,gcc-sdm845
+       - qcom,gcc-sm8150
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+    items:
+      - description: Board XO source
+      - description: Board active XO source
+      - description: Sleep clock source
+
+  clock-names:
+    minItems: 1
+    maxItems: 3
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
+  nvmem-cells:
+    minItems: 1
+    maxItems: 2
+    description:
+      Qualcomm TSENS (thermal sensor device) on some devices can
+      be part of GCC and hence the TSENS properties can also be part
+      of the GCC/clock-controller node.
+      For more details on the TSENS properties please refer
+      Documentation/devicetree/bindings/thermal/qcom-tsens.txt
+
+  nvmem-cell-names:
+    minItems: 1
+    maxItems: 2
+    description:
+      Names for each nvmem-cells specified.
+    items:
+      - const: calib
+      - const: calib_backup
+
+  'thermal-sensor-cells':
+    const: 1
+
+  protected-clocks:
+    description:
+       Protected clock specifier list as per common clock binding
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: qcom,gcc-apq8064
+
+then:
+  required:
+    - nvmem-cells
+    - nvmem-cell-names
+    - '#thermal-sensor-cells'
+
+else:
+  if:
+    properties:
+      compatible:
+        contains:
+          enum:
+            - qcom,gcc-sm8150
+  then:
+    required:
+       - clocks
+       - clock-names
+
+
+examples:
+  # Example for GCC for MSM8960:
+  - |
+    clock-controller@900000 {
+      compatible = "qcom,gcc-msm8960";
+      reg = <0x900000 0x4000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+
+
+  # Example of GCC with TSENS properties:
+  - |
+    clock-controller@900000 {
+      compatible = "qcom,gcc-apq8064";
+      reg = <0x00900000 0x4000>;
+      nvmem-cells = <&tsens_calib>, <&tsens_backup>;
+      nvmem-cell-names = "calib", "calib_backup";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      #thermal-sensor-cells = <1>;
+    };
+
+  # Example of GCC with protected-clocks properties:
+  - |
+    clock-controller@100000 {
+      compatible = "qcom,gcc-sdm845";
+      reg = <0x100000 0x1f0000>;
+      protected-clocks = <187>, <188>, <189>, <190>, <191>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+
+  # Example of GCC with clock node properties for SM8150:
+  - |
+    clock-controller@100000 {
+      compatible = "qcom,gcc-sm8150";
+      reg = <0x00100000 0x1f0000>;
+      clocks = <&rpmhcc 0>, <&rpmhcc 1>, <&sleep_clk>;
+      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+     };
+...
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

