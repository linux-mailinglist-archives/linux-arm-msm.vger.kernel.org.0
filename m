Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 895FB1E421E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 14:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729737AbgE0MZG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 08:25:06 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:15000 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729635AbgE0MZD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 08:25:03 -0400
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 27 May 2020 05:25:01 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg01-sd.qualcomm.com with ESMTP; 27 May 2020 05:24:57 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id 3764721792; Wed, 27 May 2020 17:54:56 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: [PATCH V6 1/5] dt-bindings: clock: add ipq6018 a53 pll compatible
Date:   Wed, 27 May 2020 17:54:48 +0530
Message-Id: <1590582292-13314-2-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590582292-13314-1-git-send-email-sivaprak@codeaurora.org>
References: <1590582292-13314-1-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

cpus on ipq6018 are clocked by a53 pll, add device compatible for a53
pll found on ipq6018 devices.

Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
* [V6]
    re-ordered compatible string, dropped Rob's review tag for this change.
 .../devicetree/bindings/clock/qcom,a53pll.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
index 20d2638..a4f2d01 100644
--- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
@@ -15,6 +15,7 @@ description:
 
 properties:
   compatible:
+    const: qcom,ipq6018-a53pll
     const: qcom,msm8916-a53pll
 
   reg:
@@ -23,6 +24,14 @@ properties:
   '#clock-cells':
     const: 0
 
+  clocks:
+    items:
+      - description: board XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
 required:
   - compatible
   - reg
@@ -38,3 +47,12 @@ examples:
         reg = <0xb016000 0x40>;
         #clock-cells = <0>;
     };
+  #Example 2 - A53 PLL found on IPQ6018 devices
+  - |
+    a53pll_ipq: clock@b116000 {
+        compatible = "qcom,ipq6018-a53pll";
+        reg = <0x0b116000 0x40>;
+        #clock-cells = <0>;
+        clocks = <&xo>;
+        clock-names = "xo";
+    };
-- 
2.7.4

