Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4859541E66A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 06:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351904AbhJAEDm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 00:03:42 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:5008 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237618AbhJAEDd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 00:03:33 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 30 Sep 2021 21:01:42 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 30 Sep 2021 21:01:40 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 01 Oct 2021 09:31:17 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 119F0533C; Fri,  1 Oct 2021 09:31:15 +0530 (IST)
From:   Satya Priya <skakit@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, collinsd@codeurora.org,
        subbaram@codeaurora.org, kgunda@codeaurora.org,
        Satya Priya <skakit@codeaurora.org>
Subject: [PATCH V2 1/4] regulator: dt-bindings: Add pm8008 regulator bindings
Date:   Fri,  1 Oct 2021 09:30:56 +0530
Message-Id: <1633060859-22969-2-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633060859-22969-1-git-send-email-skakit@codeaurora.org>
References: <1633060859-22969-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bindings for pm8008 pmic regulators.

Signed-off-by: Satya Priya <skakit@codeaurora.org>
---
Changes in V2:
 - Moved this patch before "mfd: pm8008: Add pm8008 regulator node" to
   resolve dtschema errors. Removed regulator-min-microvolt and 
   regulator-max-microvolt properties.

 .../bindings/regulator/qcom,pm8008-regulator.yaml  | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml
new file mode 100644
index 0000000..31ac1eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml
@@ -0,0 +1,72 @@
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
+  "^regulator@[0-9a-f]+$":
+    type: object
+
+    $ref: "regulator.yaml#"
+
+    description: PM8008 regulator peripherals of PM8008 regulator device
+
+    properties:
+      reg:
+        maxItems: 1
+      regulator-name: true
+      qcom,min-dropout-voltage:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Specifies the minimum voltage in microvolts that the parent
+          supply regulator must output, above the output of this
+          regulator.
+
+    required:
+      - reg
+      - regulator-name
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+...
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

