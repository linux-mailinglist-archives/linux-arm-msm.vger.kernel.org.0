Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08439181764
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 13:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729284AbgCKMEz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 08:04:55 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:28645 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729275AbgCKMEz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 08:04:55 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 11 Mar 2020 17:34:47 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 11 Mar 2020 17:34:27 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 0415726C0; Wed, 11 Mar 2020 17:34:25 +0530 (IST)
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
Subject: [PATCH v4 2/4] dt-bindings: phy: qcom,qmp: Add support for SC7180
Date:   Wed, 11 Mar 2020 17:34:10 +0530
Message-Id: <1583928252-21246-3-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583928252-21246-1-git-send-email-sanm@codeaurora.org>
References: <1583928252-21246-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for SC7180 in QMP PHY bindings.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 39ec3f24..c7c413c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -23,6 +23,7 @@ properties:
       - qcom,msm8998-qmp-pcie-phy
       - qcom,msm8998-qmp-ufs-phy
       - qcom,msm8998-qmp-usb3-phy
+      - qcom,sc7180-qmp-usb3-phy
       - qcom,sdm845-qhp-pcie-phy
       - qcom,sdm845-qmp-pcie-phy
       - qcom,sdm845-qmp-ufs-phy
@@ -108,6 +109,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sc7180-qmp-usb3-phy
               - qcom,sdm845-qmp-usb3-phy
               - qcom,sdm845-qmp-usb3-uni-phy
     then:
@@ -265,7 +267,9 @@ allOf:
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

