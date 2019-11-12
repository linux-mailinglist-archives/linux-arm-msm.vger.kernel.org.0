Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32DC4F9B0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 21:45:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbfKLUo6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 15:44:58 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:42212 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727241AbfKLUo5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 15:44:57 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5D0F360B12; Tue, 12 Nov 2019 20:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573591496;
        bh=vsnXFE/lucznnDnKku4KoIPj3E87kYLTHEEgeZlZPyA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VOqiwERPVgUgyHzAPkYVpVxeCWCLs8AUGpbSGbk9QfLxb2o9It2Hf1saJ9n2MCB/O
         DgX6TW4LTScHju393UyyXcFzJTT06yZfjIw6yAVPEv9ZuN+NZmq+fjpkuanlKiVMLy
         fE6dW+SnfaigZQHk5cE5LGekuwj4cpzLnkxKbDaY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 839ED60AD9;
        Tue, 12 Nov 2019 20:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573591495;
        bh=vsnXFE/lucznnDnKku4KoIPj3E87kYLTHEEgeZlZPyA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jzWfA6wIwoAg04C02+aw2V18hJxfqBLDokDkAy5dj2dSa0ZHOwNoH9JMaUKgA26ZA
         Ylu5WA0grdDmaAmS+deZG85nFMtwlwlA/j16hKAH/GCg8mQabLSKffSV7MUfdq/hzs
         kRRQgL5Xm1m/quiIzr3AiVkuVt98jer3ejj00UdA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 839ED60AD9
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v9 2/4] dt-bindings: clock: Convert qcom,mmcc to DT schema
Date:   Tue, 12 Nov 2019 13:44:46 -0700
Message-Id: <1573591486-15216-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1573591382-14225-1-git-send-email-jhugo@codeaurora.org>
References: <1573591382-14225-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the qcom,mmcc-X clock controller binding to DT schema.  Add the
protected-clocks property to the schema to show that is it explictly
allowed, instead of relying on the generic, pre-schema binding.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,mmcc.txt        | 28 ----------
 .../devicetree/bindings/clock/qcom,mmcc.yaml       | 59 ++++++++++++++++++++++
 2 files changed, 59 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,mmcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,mmcc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.txt b/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
deleted file mode 100644
index 8b0f784..0000000
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Qualcomm Multimedia Clock & Reset Controller Binding
-----------------------------------------------------
-
-Required properties :
-- compatible : shall contain only one of the following:
-
-			"qcom,mmcc-apq8064"
-			"qcom,mmcc-apq8084"
-			"qcom,mmcc-msm8660"
-			"qcom,mmcc-msm8960"
-			"qcom,mmcc-msm8974"
-			"qcom,mmcc-msm8996"
-
-- reg : shall contain base register location and length
-- #clock-cells : shall contain 1
-- #reset-cells : shall contain 1
-
-Optional properties :
-- #power-domain-cells : shall contain 1
-
-Example:
-	clock-controller@4000000 {
-		compatible = "qcom,mmcc-msm8960";
-		reg = <0x4000000 0x1000>;
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-		#power-domain-cells = <1>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
new file mode 100644
index 0000000..61ed4a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/clock/qcom,mmcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Multimedia Clock & Reset Controller Binding
+
+maintainers:
+  - Jeffrey Hugo <jhugo@codeaurora.org>
+
+description: |
+  Qualcomm multimedia clock control module which supports the clocks, resets and
+  power domains.
+
+properties:
+  compatible :
+    enum:
+       - qcom,mmcc-apq8064
+       - qcom,mmcc-apq8084
+       - qcom,mmcc-msm8660
+       - qcom,mmcc-msm8960
+       - qcom,mmcc-msm8974
+       - qcom,mmcc-msm8996
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
+examples:
+  # Example for MMCC for MSM8960:
+  - |
+    clock-controller@4000000 {
+      compatible = "qcom,mmcc-msm8960";
+      reg = <0x4000000 0x1000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

