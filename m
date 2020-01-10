Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97059136CEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2020 13:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbgAJMUD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jan 2020 07:20:03 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:5304 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727999AbgAJMUD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jan 2020 07:20:03 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 10 Jan 2020 17:49:07 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 10 Jan 2020 17:48:57 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 2D48522B4; Fri, 10 Jan 2020 17:48:56 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v3 3/5] dt-bindings: phy: qcom-qusb2: Add support for overriding Phy tuning parameters
Date:   Fri, 10 Jan 2020 17:48:17 +0530
Message-Id: <1578658699-30458-4-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578658699-30458-1-git-send-email-sanm@codeaurora.org>
References: <1578658699-30458-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for overriding QUSB2 V2 phy tuning parameters
in device tree bindings.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 83cd01d..df4e000 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -84,6 +84,28 @@ properties:
         maximum: 63
         default: 0
 
+  qcom,bias-ctrl-value:
+    description:
+        It is a 6 bit value that specifies bias-ctrl-value. It is a PHY
+        tuning parameter that may vary for different boards of same SOC.
+        This property is applicable to only QUSB2 v2 PHY.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+        maximum: 63
+        default: 0
+
+  qcom,charge-ctrl-value:
+    description:
+        It is a 2 bit value that specifies charge-ctrl-value. It is a PHY
+        tuning parameter that may vary for different boards of same SOC.
+        This property is applicable to only QUSB2 v2 PHY.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+        maximum: 3
+        default: 0
+
   qcom,hstx-trim-value:
     description:
         It is a 4 bit value that specifies tuning for HSTX
@@ -122,6 +144,17 @@ properties:
         maximum: 1
         default: 0
 
+  qcom,hsdisc-trim-value:
+    description:
+        It is a 2 bit value tuning parameter that control disconnect
+	threshold and may vary for different boards of same SOC.
+        This property is applicable to only QUSB2 v2 PHY.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+        maximum: 3
+        default: 0
+
 required:
   - compatible
   - reg
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

