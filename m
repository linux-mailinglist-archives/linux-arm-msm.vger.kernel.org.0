Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5F117DCAD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 10:54:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgCIJyJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 05:54:09 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:55522 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726465AbgCIJyI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 05:54:08 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 09 Mar 2020 15:24:02 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 09 Mar 2020 15:23:44 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 4808B230B; Mon,  9 Mar 2020 15:23:43 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v5 4/9] dt-bindings: phy: qcom-qusb2: Add support for overriding Phy tuning parameters
Date:   Mon,  9 Mar 2020 15:23:04 +0530
Message-Id: <1583747589-17267-5-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583747589-17267-1-git-send-email-sanm@codeaurora.org>
References: <1583747589-17267-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for overriding QUSB2 V2 phy tuning parameters
in device tree bindings.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 32 +++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 60124a3..144ae29 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -75,7 +75,7 @@ if:
   properties:
     compatible:
       contains:
-        const: qcom,sdm845-qusb2-phy
+        const: qcom,qusb2-v2-phy
 then:
   properties:
     qcom,imp-res-offset-value:
@@ -89,6 +89,26 @@ then:
           maximum: 63
           default: 0
 
+    qcom,bias-ctrl-value:
+      description:
+        It is a 6 bit value that specifies bias-ctrl-value. It is a PHY
+        tuning parameter that may vary for different boards of same SOC.
+      allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32
+        - minimum: 0
+          maximum: 63
+          default: 0
+
+    qcom,charge-ctrl-value:
+     description:
+        It is a 2 bit value that specifies charge-ctrl-value. It is a PHY
+        tuning parameter that may vary for different boards of same SOC.
+     allOf:
+       - $ref: /schemas/types.yaml#/definitions/uint32
+       - minimum: 0
+         maximum: 3
+         default: 0
+
     qcom,hstx-trim-value:
       description:
         It is a 4 bit value that specifies tuning for HSTX
@@ -124,6 +144,16 @@ then:
           maximum: 1
           default: 0
 
+    qcom,hsdisc-trim-value:
+      description:
+        It is a 2 bit value tuning parameter that control disconnect
+        threshold and may vary for different boards of same SOC.
+      allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32
+        - minimum: 0
+          maximum: 3
+          default: 0
+
 required:
   - compatible
   - reg
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

