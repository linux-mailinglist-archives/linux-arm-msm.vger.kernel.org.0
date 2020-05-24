Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 524641DFE39
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2020 12:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729294AbgEXKFE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 May 2020 06:05:04 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:53597 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387614AbgEXKFA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 May 2020 06:05:00 -0400
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 24 May 2020 03:04:59 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg04-sd.qualcomm.com with ESMTP; 24 May 2020 03:04:55 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id BD956217FE; Sun, 24 May 2020 15:34:49 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: [PATCH V5 6/8] dt-bindings: mailbox: Add dt-bindings for ipq6018 apcs global block
Date:   Sun, 24 May 2020 15:34:44 +0530
Message-Id: <1590314686-11749-7-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590314686-11749-1-git-send-email-sivaprak@codeaurora.org>
References: <1590314686-11749-1-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add dt-bindings for ipq6018 mailbox driver

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml         | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 12eff94..e05bff4 100644
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
@@ -38,12 +39,12 @@ properties:
     const: 1
 
   '#clock-cells':
-    const: 0
+    enum: [ 0, 1 ]
 
   clock-names:
     items:
       - const: pll
-      - const: aux
+      - enum: [ aux, xo ]
 
 required:
   - compatible
@@ -84,3 +85,15 @@ examples:
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

