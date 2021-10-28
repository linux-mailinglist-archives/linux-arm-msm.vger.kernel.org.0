Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307CB43E4C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 17:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbhJ1PSO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 11:18:14 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:14326 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231411AbhJ1PSO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 11:18:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635434147; x=1666970147;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=AA3KK50yy3ltGWJhZti15MA71/l+su1dGHylYURdO5s=;
  b=osRvVMHKA/igptcEWWbk2GTy+JlU/DcuNFS0GQUCeMce0WmvD0R8XIiU
   HszLWNvi2glgQKkVzZ4Ns5FSY950JTeZDr04U7NkZTOE1IXXeLDP56+sD
   MjyRjLdLClRLXMKIHUBhO9W1+DCXM9CoU/XtkkG1tn1lvm+38KuzXLL/C
   Q=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 28 Oct 2021 08:15:47 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2021 08:15:46 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 28 Oct 2021 08:15:46 -0700
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 28 Oct 2021 08:15:42 -0700
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
Subject: [PATCH V3 1/4] regulator: dt-bindings: Add pm8008 regulator bindings
Date:   Thu, 28 Oct 2021 20:44:29 +0530
Message-ID: <1635434072-32055-2-git-send-email-quic_c_skakit@quicinc.com>
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

Add bindings for pm8008 pmic regulators.

Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
---
Changes in V2:
 - Moved this patch before "mfd: pm8008: Add pm8008 regulator node" to
   resolve dtschema errors. Removed regulator-min-microvolt and 
   regulator-max-microvolt properties.

Changes in V3:
 - As per Rob's comments added standard unit suffix for mindropout property,
   added blank lines where required and added description for reg property.

 - As per Stephen's comments, changed the qcom,min-dropout-voltage to standard
   property regulator-min-dropout-voltage-microvolt.

 .../bindings/regulator/qcom,pm8008-regulator.yaml  | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml
new file mode 100644
index 0000000..cc624d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/qcom,pm8008-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. PM8008 Regulator bindings
+
+maintainers:
+  - Satya Priya <skakit@codeaurora.org>
+
+description:
+  Qualcomm Technologies, Inc. PM8008 is an I2C controlled PMIC
+  containing 7 LDO regulators.
+
+properties:
+  compatible:
+    const: qcom,pm8008-regulator
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  vdd_l1_l2-supply:
+    description: Input supply phandle of ldo1 and ldo2 regulators.
+
+  vdd_l3_l4-supply:
+    description: Input supply phandle of ldo3 and ldo4 regulators.
+
+  vdd_l5-supply:
+    description: Input supply phandle of ldo5 regulator.
+
+  vdd_l6-supply:
+    description: Input supply phandle of ldo6 regulator.
+
+  vdd_l7-supply:
+    description: Input supply phandle of ldo7 regulator.
+
+patternProperties:
+  "^l[1-7]@[0-9a-f]+$":
+    type: object
+
+    $ref: "regulator.yaml#"
+
+    description: PM8008 regulator peripherals of PM8008 regulator device
+
+    properties:
+      reg:
+        maxItems: 1
+        description: Base address of the regulator.
+
+      regulator-name: true
+
+      regulator-min-dropout-voltage-microvolt:
+        description:
+          Specifies the minimum voltage in microvolts that the parent
+          supply regulator must output, above the output of this
+          regulator.
+
+    required:
+      - reg
+      - regulator-name
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+...
-- 
2.7.4

