Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7894312300D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 16:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727546AbfLQPUV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 10:20:21 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:64432 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728276AbfLQPUV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 10:20:21 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576596020; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=PeUBldwfg7nCHCKJvZtlT5BQ/Bx4+9edoBFRqZKZ76g=; b=LV6kVEV0Y2R/4RZxTsgs3eKi4dHtuoanhdRMoGqyWiYZGXBnwiTvusggrMn/9ROEVKvQkRei
 MLgkQeNz8IrCqPjseXSbOhLUAPLpJzxEOVdJvQOpN75/CaqdGf/Fhu5Ce39BGrznUdtloW7A
 DzbghXafNtyLU7sutTY7XTGtmwI=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df8f22f.7fd0bdd18810-smtp-out-n01;
 Tue, 17 Dec 2019 15:20:15 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D555DC447A5; Tue, 17 Dec 2019 15:20:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DDCA2C43383;
        Tue, 17 Dec 2019 15:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DDCA2C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     sboyd@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, mturquette@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v11 2/4] dt-bindings: clock: Convert qcom,mmcc to DT schema
Date:   Tue, 17 Dec 2019 08:20:03 -0700
Message-Id: <1576596003-10093-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1576595954-9991-1-git-send-email-jhugo@codeaurora.org>
References: <1576595954-9991-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the qcom,mmcc-X clock controller binding to DT schema.  Add the
protected-clocks property to the schema to show that is it explicitly
allowed, instead of relying on the generic, pre-schema binding.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
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
