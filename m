Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0E41F1586
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 11:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729144AbgFHJhg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 05:37:36 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:37169 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729203AbgFHJhg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 05:37:36 -0400
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 08 Jun 2020 02:37:33 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg03-sd.qualcomm.com with ESMTP; 08 Jun 2020 02:37:31 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id 6C2F5217F8; Mon,  8 Jun 2020 15:07:29 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, sivaprak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V3 2/4] dt-bindings: mailbox: Add dt-bindings for ipq6018 apcs global block
Date:   Mon,  8 Jun 2020 15:07:25 +0530
Message-Id: <1591609047-29995-3-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591609047-29995-1-git-send-email-sivaprak@codeaurora.org>
References: <1591609047-29995-1-git-send-email-sivaprak@codeaurora.org>
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

