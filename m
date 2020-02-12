Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6487815A7B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 12:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbgBLLWB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 06:22:01 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:59066 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728207AbgBLLWB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 06:22:01 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 12 Feb 2020 16:51:55 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 12 Feb 2020 16:51:34 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id BD62424FD; Wed, 12 Feb 2020 16:51:33 +0530 (IST)
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
Subject: [PATCH v3 2/4] dt-bindings: phy: qcom,qmp: Add support for SC7180
Date:   Wed, 12 Feb 2020 16:51:26 +0530
Message-Id: <1581506488-26881-3-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581506488-26881-1-git-send-email-sanm@codeaurora.org>
References: <1581506488-26881-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for SC7180 in qmp phy bindings.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index b39a594..8c153e3 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -23,6 +23,7 @@ properties:
       - qcom,msm8998-qmp-usb3-phy
       - qcom,msm8998-qmp-ufs-phy
       - qcom,msm8998-qmp-pcie-phy
+      - qcom,sc7180-qmp-usb3-phy
       - qcom,sdm845-qmp-usb3-phy
       - qcom,sdm845-qmp-usb3-uni-phy
       - qcom,sdm845-qmp-ufs-phy
@@ -105,9 +106,10 @@ allOf:
       properties:
         compatible:
           contains:
-             enum:
-               - qcom,sdm845-qmp-usb3-phy
-               - qcom,sdm845-qmp-usb3-uni-phy
+            enum:
+              - qcom,sc7180-qmp-usb3-phy
+              - qcom,sdm845-qmp-usb3-phy
+              - qcom,sdm845-qmp-usb3-uni-phy
     then:
       properties:
         clocks:
@@ -238,7 +240,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,sdm845-qmp-usb3-phy
+            enum:
+              - qcom,sc7180-qmp-usb3-phy
+              - qcom,sdm845-qmp-usb3-phy
     then:
       required:
         - reg-names
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

