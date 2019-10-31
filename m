Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 165C6EB005
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 13:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbfJaMVo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 08:21:44 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38196 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfJaMVn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 08:21:43 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 321E860A7E; Thu, 31 Oct 2019 12:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572524502;
        bh=nsH96Kik9qFez1Lwet5qkqW2IjtmNMrbExdN1sG1AMQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lXs/edc/8ApaF0BOm4dWKUHjeVpvF1b7gdXCiHcwthIPngYXGDH9evjH/VvxWsxih
         Ym+kUPt61gH3rmaxzNJUY7VABGOh5EeTlQKvlgPCl8m2kMMDJXAZ+cE/wWVpb5fCaq
         em6uCh5/i8/W216KCWK7L2DayiRbCAaqUVLoXhv4=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EE00F60A73;
        Thu, 31 Oct 2019 12:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572524501;
        bh=nsH96Kik9qFez1Lwet5qkqW2IjtmNMrbExdN1sG1AMQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W0GAzPPBWuVANadaQw2bOKf8vIUAEbyzm+qumtAW343HVZ+9xnTeYMxBeGqo+Zzlc
         kIAYiO4de+DhHjabHHtOBvPi8GGQhUa8yYFJ0w8icxUhRsJmmFX7PcwFLxvJonEyj2
         TMA8qFjjdn75qGo798w5FL5e7f3y6s6OW8WHm1JA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EE00F60A73
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
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
Subject: [PATCH v1 2/7] dt-bindings: clock: Add YAML schemas for the QCOM GPUCC clock bindings
Date:   Thu, 31 Oct 2019 17:51:08 +0530
Message-Id: <1572524473-19344-3-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572524473-19344-1-git-send-email-tdas@codeaurora.org>
References: <1572524473-19344-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GPUCC clock provider have a bunch of generic properties that
are needed in a device tree. Add a YAML schemas for those.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,gpucc.txt       | 24 --------
 .../devicetree/bindings/clock/qcom,gpucc.yaml      | 69 ++++++++++++++++++++++
 2 files changed, 69 insertions(+), 24 deletions(-)
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
index 0000000..96aaf36
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -0,0 +1,69 @@
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
+      - qcom,sdm845-gpucc
+      - qcom,msm8998-gpucc
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+    items:
+      - description: Board XO source
+      - description: GPLL0 source from GCC
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      - const: xo
+      - const: gpll0
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
+      clocks = <&rpmhcc 0>, <&gcc 32>;
+      clock-names = "xo", "gpll0";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+     };
+...
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

