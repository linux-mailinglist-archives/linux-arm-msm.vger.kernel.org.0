Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0978113AE7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2019 05:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728490AbfLEEm7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Dec 2019 23:42:59 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:44874 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728470AbfLEEm7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Dec 2019 23:42:59 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 05 Dec 2019 10:12:56 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 05 Dec 2019 10:12:37 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id AD1951A09; Thu,  5 Dec 2019 10:12:36 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v2 3/3] dt-bindings: phy: qcom-qusb2: Add SC7180 QUSB2 phy support
Date:   Thu,  5 Dec 2019 10:11:21 +0530
Message-Id: <1575520881-31458-4-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575520881-31458-1-git-send-email-sanm@codeaurora.org>
References: <1575520881-31458-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add QUSB2 phy entries for SC7180 in device tree bindings.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml
index 3ef94bc..5eff9016 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - qcom,msm8996-qusb2-phy
       - qcom,msm8998-qusb2-phy
+      - qcom,sc7180-qusb2-phy
       - qcom,sdm845-qusb2-phy
 
   reg:
@@ -66,7 +67,7 @@ properties:
         It is a 6 bit value that specifies offset to be
         added to PHY refgen RESCODE via IMP_CTRL1 register. It is a PHY
         tuning parameter that may vary for different boards of same SOC.
-        This property is applicable to only QUSB2 v2 PHY (sdm845).
+        This property is applicable to only QUSB2 v2 PHY (sc7180, sdm845).
     $ref: /schemas/types.yaml#/definitions/uint32
 
   qcom,hstx-trim-value:
@@ -75,7 +76,7 @@ properties:
         output current.
         Possible range is - 15mA to 24mA (stepsize of 600 uA).
         See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
-        This property is applicable to only QUSB2 v2 PHY (sdm845).
+        This property is applicable to only QUSB2 v2 PHY (sc7180, sdm845).
         Default value is 22.2mA for sdm845.
     $ref: /schemas/types.yaml#/definitions/uint32
 
@@ -84,7 +85,7 @@ properties:
         It is a 2 bit value that specifies pre-emphasis level.
         Possible range is 0 to 15% (stepsize of 5%).
         See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
-        This property is applicable to only QUSB2 v2 PHY (sdm845).
+        This property is applicable to only QUSB2 v2 PHY (sc7180, sdm845).
         Default value is 10% for sdm845.
     $ref: /schemas/types.yaml#/definitions/uint32
 
@@ -94,7 +95,7 @@ properties:
         pre-emphasis (specified using qcom,preemphasis-level) must be in
         effect. Duration could be half-bit of full-bit.
         See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
-        This property is applicable to only QUSB2 v2 PHY (sdm845).
+        This property is applicable to only QUSB2 v2 PHY (sc7180, sdm845).
         Default value is full-bit width for sdm845.
     $ref: /schemas/types.yaml#/definitions/uint32
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

