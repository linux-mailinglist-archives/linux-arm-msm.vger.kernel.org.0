Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B756FFBBA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2019 22:27:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfKQV1F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Nov 2019 16:27:05 -0500
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10]:40164
        "EHLO a27-10.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726128AbfKQV1F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Nov 2019 16:27:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574026023;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=5PpfUPH5hT1SepK72OYVg5oTtoV8o9G5dTu2K6VQqLM=;
        b=lN/E0YLNF/ps0RWcmycQRmoPVGQLzOlUidOBso2ZLkXUjsvZSnSdv9dWX8RA8gO2
        8LRdkVMSoy7QAm0lMvjuqLqErlrjfMAVdqQBx3HOMtvmNPhnYjjghaBYTVsVxuXsQtV
        y8PwC8JPt8xudZrtDONJdfL4QpoFbZw0mHxdFhrw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574026023;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=5PpfUPH5hT1SepK72OYVg5oTtoV8o9G5dTu2K6VQqLM=;
        b=dbcljpPFyzICvXrDoqFBpZfKXL9DO15/CwiYbE/27PJw7GocTp83tHg4moYYx52+
        wDo+6G5jBAp+MohDPTMDi9g9Ra6uWiHmqxsBqFB1BVEqUs+Wv1x+Hdt7LZyoEi2UOB9
        d9U66JSNw2e0JifoGFhvu402qzFWMGBriFyW4BDg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BA585C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v10 2/4] dt-bindings: clock: Convert qcom,mmcc to DT schema
Date:   Sun, 17 Nov 2019 21:27:03 +0000
Message-ID: <0101016e7b4311fe-8edd7849-df65-47dd-98fa-1e2063c83178-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1574025887-32667-1-git-send-email-jhugo@codeaurora.org>
References: <1574025887-32667-1-git-send-email-jhugo@codeaurora.org>
X-SES-Outgoing: 2019.11.17-54.240.27.10
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the qcom,mmcc-X clock controller binding to DT schema.  Add the
protected-clocks property to the schema to show that is it explicitly
allowed, instead of relying on the generic, pre-schema binding.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,mmcc.txt        | 28 ----------
 .../devicetree/bindings/clock/qcom,mmcc.yaml       | 60 ++++++++++++++++++++++
 2 files changed, 60 insertions(+), 28 deletions(-)
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
index 0000000..78b1a22
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -0,0 +1,60 @@
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
+  - Taniya Das <tdas@codeaurora.org>
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

