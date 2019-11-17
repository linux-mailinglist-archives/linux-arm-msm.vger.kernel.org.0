Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBA35FFBC8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2019 22:32:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbfKQVcQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Nov 2019 16:32:16 -0500
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186]:32876
        "EHLO a27-186.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726119AbfKQVcQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Nov 2019 16:32:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574025992;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=9AOx5Q+RJ0560RuXHckXHRjw7aV17Sj+XjiitrpNRJI=;
        b=EAkv/zYDcWxTqutMctt7HWRVqikaGLEheL9Sq7w/bFMhW/NwwDVn/z7xUet0OX82
        vMABfLCWRpfLKjhV0kWX5BX0ORQmEowfQ+txSE0dY2Bbf7Fvl/fONz+m8cxCz31FCvy
        o63JIbLJg3DOL2tVfNhLjaiLw7lxeO+c0STrZCrU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574025992;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=9AOx5Q+RJ0560RuXHckXHRjw7aV17Sj+XjiitrpNRJI=;
        b=V3W+uu6owxlVftGF7HGrUq5EaNLKWUZxeCWFcvh4jeJ8lgPSrpG6luDLfS1lsU19
        vOBy+va6Fr9H0Nhth145n5LbxxqVWCraQbNlHgbVwUlLJ3wIL0HUNUuUPhScyzZK20D
        jsnoUO65tSjzKbKDo9h8hphF1Wvg6KVmI11jSoCY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 03B61C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v10 1/4] dt-bindings: clock: Document external clocks for MSM8998 gcc
Date:   Sun, 17 Nov 2019 21:26:31 +0000
Message-ID: <0101016e7b42967c-5fa46814-6107-475f-9029-aa7ea052615b-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1574025887-32667-1-git-send-email-jhugo@codeaurora.org>
References: <1574025887-32667-1-git-send-email-jhugo@codeaurora.org>
X-SES-Outgoing: 2019.11.17-54.240.27.186
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The global clock controller on MSM8998 can consume a number of external
clocks.  Document them.

For 7180 and 8150, the hardware always exists, so no clocks are truly
optional.  Therefore, simplify the binding by removing the min/max
qualifiers to clocks.  Also, fixup an example so that dt_binding_check
passes.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/qcom,gcc.yaml        | 73 +++++++++++++++++-----
 1 file changed, 59 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
index e73a56f..f2b5cd6 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
@@ -40,20 +40,40 @@ properties:
        - qcom,gcc-sm8150
 
   clocks:
-    minItems: 1
-    maxItems: 3
-    items:
-      - description: Board XO source
-      - description: Board active XO source
-      - description: Sleep clock source
+    oneOf:
+      #qcom,gcc-sm8150
+      #qcom,gcc-sc7180
+      - items:
+        - description: Board XO source
+        - description: Board active XO source
+        - description: Sleep clock source
+      #qcom,gcc-msm8998
+      - items:
+        - description: Board XO source
+        - description: Sleep clock source
+        - description: USB 3.0 phy pipe clock
+        - description: UFS phy rx symbol clock for pipe 0
+        - description: UFS phy rx symbol clock for pipe 1
+        - description: UFS phy tx symbol clock
+        - description: PCIE phy pipe clock
 
   clock-names:
-    minItems: 1
-    maxItems: 3
-    items:
-      - const: bi_tcxo
-      - const: bi_tcxo_ao
-      - const: sleep_clk
+    oneOf:
+      #qcom,gcc-sm8150
+      #qcom,gcc-sc7180
+      - items:
+        - const: bi_tcxo
+        - const: bi_tcxo_ao
+        - const: sleep_clk
+      #qcom,gcc-msm8998
+      - items:
+        - const: xo
+        - const: sleep_clk
+        - const: usb3_pipe
+        - const: ufs_rx_symbol0
+        - const: ufs_rx_symbol1
+        - const: ufs_tx_symbol0
+        - const: pcie0_pipe
 
   '#clock-cells':
     const: 1
@@ -118,6 +138,7 @@ else:
       compatible:
         contains:
           enum:
+            - qcom,gcc-msm8998
             - qcom,gcc-sm8150
             - qcom,gcc-sc7180
   then:
@@ -179,10 +200,34 @@ examples:
     clock-controller@100000 {
       compatible = "qcom,gcc-sc7180";
       reg = <0x100000 0x1f0000>;
-      clocks = <&rpmhcc 0>, <&rpmhcc 1>;
-      clock-names = "bi_tcxo", "bi_tcxo_ao";
+      clocks = <&rpmhcc 0>, <&rpmhcc 1>, <0>;
+      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+
+  # Example of MSM8998 GCC:
+  - |
+    clock-controller@100000 {
+      compatible = "qcom,gcc-msm8998";
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
+      reg = <0x00100000 0xb0000>;
+      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+               <&sleep>,
+               <0>,
+               <0>,
+               <0>,
+               <0>,
+               <0>;
+      clock-names = "xo",
+                    "sleep",
+                    "usb3_pipe",
+                    "ufs_rx_symbol0",
+                    "ufs_rx_symbol1",
+                    "ufs_tx_symbol0",
+                    "pcie0_pipe";
     };
 ...
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

