Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D477202F42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 06:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgFVE2j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 00:28:39 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:44055 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726036AbgFVE2i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 00:28:38 -0400
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 21 Jun 2020 21:28:37 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg04-sd.qualcomm.com with ESMTP; 21 Jun 2020 21:28:33 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id EA2BA2168E; Mon, 22 Jun 2020 09:58:31 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        sivaprak@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V8 1/4] dt-bindings: clock: add ipq6018 a53 pll compatible
Date:   Mon, 22 Jun 2020 09:58:09 +0530
Message-Id: <1592800092-20533-2-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592800092-20533-1-git-send-email-sivaprak@codeaurora.org>
References: <1592800092-20533-1-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

cpus on ipq6018 are clocked by a53 pll, add device compatible for a53
pll found on ipq6018 devices.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
[V8]
 * converted compatible strings from const to enum to avoid dt binding error
 * retained Rob's review tag as the change is minimal
 .../devicetree/bindings/clock/qcom,a53pll.yaml      | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
index 20d2638b4cd2..db3d0ea6bc7a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
@@ -15,7 +15,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,msm8916-a53pll
+    enum:
+      - qcom,ipq6018-a53pll
+      - qcom,msm8916-a53pll
 
   reg:
     maxItems: 1
@@ -23,6 +25,14 @@ properties:
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
@@ -38,3 +48,12 @@ examples:
         reg = <0xb016000 0x40>;
         #clock-cells = <0>;
     };
+  #Example 2 - A53 PLL found on IPQ6018 devices
+  - |
+    a53pll_ipq: clock-controller@b116000 {
+        compatible = "qcom,ipq6018-a53pll";
+        reg = <0x0b116000 0x40>;
+        #clock-cells = <0>;
+        clocks = <&xo>;
+        clock-names = "xo";
+    };
-- 
2.7.4

