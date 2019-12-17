Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 650B9123009
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 16:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728247AbfLQPUM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 10:20:12 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:29358 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728118AbfLQPUJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 10:20:09 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576596005; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=at6Q9HgyoubIf4gg4ufGlVz7NLnvEC1D7+LwMbGBMJk=; b=Y/oypte/yU9ccevaxyBuA+hOy2gYYorq8mcedXeP7DjEo8CPoghQCeoiF98KP8B/WApNf/1B
 KgCf/FlxF1VzypmWsQWvHVJsQToUpZSQyCtfUDVXcdI7zIbcE9cZyAn/7BbfhkMCqg/K7BSl
 tuiVQAF5NgpwBb/ffr1SmTvm5wg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df8f21f.7fefd1b8a768-smtp-out-n02;
 Tue, 17 Dec 2019 15:19:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 18BDDC447A5; Tue, 17 Dec 2019 15:19:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6695BC433CB;
        Tue, 17 Dec 2019 15:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6695BC433CB
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
Subject: [PATCH v11 1/4] dt-bindings: clock: Document external clocks for MSM8998 gcc
Date:   Tue, 17 Dec 2019 08:19:47 -0700
Message-Id: <1576595987-10043-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1576595954-9991-1-git-send-email-jhugo@codeaurora.org>
References: <1576595954-9991-1-git-send-email-jhugo@codeaurora.org>
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
