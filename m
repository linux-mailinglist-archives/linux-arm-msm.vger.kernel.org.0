Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA999456C97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 10:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234622AbhKSJqV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 04:46:21 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:18913 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232417AbhKSJqU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 04:46:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637314999; x=1668850999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=X1tDE7vkHYpL0hMd/tCBbkY1HuSgxqvSZmK9kvK9ZwE=;
  b=uzEmhRmsvy3E8q+DVOJBHZeRDLnXF0WIXo6Oj4ipOiZqqzmkMkPEzffG
   dQe89k0xWY/Pu7aeCtzOz3sfeIsO9fnQqrXHL+GjbLddQof8BauvGACoB
   UAonKsHimOhd3nGObHJZygRsYn6jlMjGkJ5X7EcIxcfN+T+OdNzTRcSUJ
   c=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 19 Nov 2021 01:43:19 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 01:43:18 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 19 Nov 2021 01:43:18 -0800
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 19 Nov 2021 01:43:13 -0800
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, <swboyd@chromium.org>,
        <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>,
        "Lee Jones" <lee.jones@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Subject: [PATCH V4 3/6] dt-bindings: mfd: pm8008: Add pm8008 regulator node
Date:   Fri, 19 Nov 2021 15:12:30 +0530
Message-ID: <1637314953-4215-4-git-send-email-quic_c_skakit@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637314953-4215-1-git-send-email-quic_c_skakit@quicinc.com>
References: <1637314953-4215-1-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add pm8008-regulator node and example.

Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
Changes in V2:
 - As per Rob's comments changed "pm8008[a-z]?-regulator" to
   "^pm8008[a-z]?-regulators".

Changes in V3:
 - Fixed bot errors.
 - As per stephen's comments, changed "^pm8008[a-z]?-regulators$" to
   "regulators".

Changes in V4:
 - Changed compatible string to "qcom,pm8008-regulators"

 .../devicetree/bindings/mfd/qcom,pm8008.yaml       | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index ec3138c..ab6166d 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -44,6 +44,10 @@ properties:
   "#size-cells":
     const: 0
 
+  regulators:
+    type: object
+    $ref: "../regulator/qcom,pm8008-regulator.yaml#"
+
 patternProperties:
   "^gpio@[0-9a-f]+$":
     type: object
@@ -122,6 +126,26 @@ examples:
           interrupt-controller;
           #interrupt-cells = <2>;
         };
+
+        regulators {
+          compatible = "qcom,pm8008-regulators";
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          vdd_l1_l2-supply = <&vreg_s8b_1p2>;
+          vdd_l3_l4-supply = <&vreg_s1b_1p8>;
+          vdd_l5-supply = <&vreg_bob>;
+          vdd_l6-supply = <&vreg_bob>;
+          vdd_l7-supply = <&vreg_bob>;
+
+          pm8008_l1: l1@4000 {
+            reg = <0x4000>;
+            regulator-name = "pm8008_l1";
+            regulator-min-microvolt = <950000>;
+            regulator-max-microvolt = <1300000>;
+            regulator-min-dropout-voltage-microvolt = <96000>;
+          };
+        };
       };
     };
 
-- 
2.7.4

