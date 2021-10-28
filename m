Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7C0343E4C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 17:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbhJ1PSZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 11:18:25 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:4896 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231258AbhJ1PSY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 11:18:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635434157; x=1666970157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=ZsTGD6LnmvRdNp3+ESduJQO/rR3qFGzF5Aaf8Jf9sWY=;
  b=yOhbLi8Kv9KRBRs+yboZoXWOmZCd1+xy3e3fWYNqRMiq7s3VnRiYcbJX
   D1RVOMUra58Mfbu7ggftG6Odor6GeVWOzShYOB6Sj1EKt2wLMKXXlzAj7
   KYtgZQMy668R/HvdPeY3OXjA0Lc176GOCWA1OQ5xySF45MgGJ6eXzd1o5
   g=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 28 Oct 2021 08:15:57 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2021 08:15:57 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 28 Oct 2021 08:15:56 -0700
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 28 Oct 2021 08:15:52 -0700
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, <swboyd@chromium.org>,
        <collinsd@codeurora.org>, <subbaram@codeaurora.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>,
        "Lee Jones" <lee.jones@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Subject: [PATCH V3 2/4] dt-bindings: mfd: pm8008: Add pm8008 regulator node
Date:   Thu, 28 Oct 2021 20:44:30 +0530
Message-ID: <1635434072-32055-3-git-send-email-quic_c_skakit@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635434072-32055-1-git-send-email-quic_c_skakit@quicinc.com>
References: <1635434072-32055-1-git-send-email-quic_c_skakit@quicinc.com>
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
---
Changes in V2:
 - As per Rob's comments changed "pm8008[a-z]?-regulator" to
   "^pm8008[a-z]?-regulators".

Changes in V3:
 - Fixed bot errors.
 - As per stephen's comments, changed "^pm8008[a-z]?-regulators$" to
   "regulators".

 .../devicetree/bindings/mfd/qcom,pm8008.yaml       | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index ec3138c..717e012 100644
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

