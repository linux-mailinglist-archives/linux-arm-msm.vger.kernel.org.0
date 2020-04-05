Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4345A19EAD4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2020 13:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgDELaW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Apr 2020 07:30:22 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:52995 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726647AbgDELaJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Apr 2020 07:30:09 -0400
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 05 Apr 2020 04:30:08 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg02-sd.qualcomm.com with ESMTP; 05 Apr 2020 04:30:04 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id D2DC821659; Sun,  5 Apr 2020 17:00:02 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sivaprak@codeaurora.org
Subject: [PATCH V2 6/8] dt-bindings: mailbox: Add dt-bindings for ipq6018 apcs global block
Date:   Sun,  5 Apr 2020 16:59:23 +0530
Message-Id: <1586086165-19426-7-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586086165-19426-1-git-send-email-sivaprak@codeaurora.org>
References: <1586086165-19426-1-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add dt-bindings for ipq6018 mailbox driver

Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml         | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index b46474b..07180c0 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -16,6 +16,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - qcom,ipq6018-apcs-apps-global
       - qcom,ipq8074-apcs-apps-global
       - qcom,msm8916-apcs-kpss-global
       - qcom,msm8996-apcs-hmss-global
@@ -36,7 +37,7 @@ properties:
     const: 1
 
   '#clock-cells':
-    const: 0
+    enum: [ 0, 1 ]
 
   clock-names:
     description:
@@ -45,7 +46,7 @@ properties:
     maxItems: 2
     items:
       - const: pll
-      - const: aux
+      - enum: [ aux, xo ]
 
 required:
   - compatible
@@ -86,3 +87,15 @@ examples:
         clock-names = "pll", "aux";
         #clock-cells = <0>;
     };
+
+  # Example apcs with ipq6018
+  - |
+    #include "dt-bindings/clock/qcom,apss-ipq.h"
+    apcs_ipq: mailbox@b111000 {
+        compatible = "qcom,ipq6018-apcs-apps-global";
+        reg = <0x0b111000 0x1000>;
+        #clock-cells = <1>;
+        clocks = <&a53pll>, <&xo>;
+        clock-names = "pll", "xo";
+        #mbox-cells = <1>;
+    };
-- 
2.7.4

