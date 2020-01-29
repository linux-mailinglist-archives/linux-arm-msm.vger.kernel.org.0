Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B45514CBCE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2020 14:53:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbgA2Nwg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 08:52:36 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:11989 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726797AbgA2Nwe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 08:52:34 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 29 Jan 2020 19:22:26 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 29 Jan 2020 19:22:06 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id A4C66257F; Wed, 29 Jan 2020 19:22:04 +0530 (IST)
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
        devicetree@vger.kernel.org,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v4 2/8] dt-bindings: phy: qcom,qusb2: Add compatibles for QUSB2 V2 phy and SC7180
Date:   Wed, 29 Jan 2020 19:21:53 +0530
Message-Id: <1580305919-30946-3-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580305919-30946-1-git-send-email-sanm@codeaurora.org>
References: <1580305919-30946-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatibles for generic QUSB2 V2 phy which can be used for
sdm845 and sc7180.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 90b3cc6..43082c8 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -15,10 +15,17 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,msm8996-qusb2-phy
-      - qcom,msm8998-qusb2-phy
-      - qcom,sdm845-qusb2-phy
+    oneOf:
+      - items:
+        - enum:
+          - qcom,msm8996-qusb2-phy
+          - qcom,msm8998-qusb2-phy
+          - qcom,qusb2-v2-phy
+      - items:
+        - enum:
+          - qcom,sc7180-qusb2-phy
+          - qcom,sdm845-qusb2-phy
+        - const: qcom,qusb2-v2-phy
   reg:
     maxItems: 1
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

