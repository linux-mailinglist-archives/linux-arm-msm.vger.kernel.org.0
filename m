Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B6640F629
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 12:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240908AbhIQKrq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 06:47:46 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:40285 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240756AbhIQKrp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 06:47:45 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 17 Sep 2021 03:46:24 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 17 Sep 2021 03:46:22 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 17 Sep 2021 16:15:57 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 63E6A500B; Fri, 17 Sep 2021 16:15:56 +0530 (IST)
From:   Satya Priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, mka@chromium.org,
        swboyd@chromium.org, Das Srinagesh <gurus@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Satya Priya <skakit@codeaurora.org>
Subject: [PATCH 1/4] dt-bindings: mfd: pm8008: Add pm8008 regulator node
Date:   Fri, 17 Sep 2021 16:15:35 +0530
Message-Id: <1631875538-22473-2-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631875538-22473-1-git-send-email-skakit@codeaurora.org>
References: <1631875538-22473-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add pm8008-regulator node and example.

Signed-off-by: Satya Priya <skakit@codeaurora.org>
---
 .../devicetree/bindings/mfd/qcom,pm8008.yaml       | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index ec3138c..de182f8 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -45,6 +45,10 @@ properties:
     const: 0
 
 patternProperties:
+  "^pm8008[a-z]?-regulator$":
+    type: object
+    $ref: "../regulator/qcom,pm8008-regulator.yaml#"
+
   "^gpio@[0-9a-f]+$":
     type: object
 
@@ -122,6 +126,26 @@ examples:
           interrupt-controller;
           #interrupt-cells = <2>;
         };
+
+        pm8008-regulator {
+          compatible = "qcom,pm8008-regulator";
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          vdd_l1_l2-supply = <&vreg_s8b_1p2>;
+          vdd_l3_l4-supply = <&vreg_s1b_1p8>;
+          vdd_l5-supply = <&vreg_bob>;
+          vdd_l6-supply = <&vreg_bob>;
+          vdd_l7-supply = <&vreg_bob>;
+
+          pm8008_l1: regulator@4000 {
+            reg = <0x4000>;
+            regulator-name = "pm8008_l1";
+            regulator-min-microvolt = <950000>;
+            regulator-max-microvolt = <1300000>;
+            qcom,min-dropout-voltage = <96000>;
+          };
+        };
       };
     };
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

