Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAB30A4AF3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2019 19:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729087AbfIARob (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Sep 2019 13:44:31 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:42328 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728496AbfIARob (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Sep 2019 13:44:31 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 38AE060A00; Sun,  1 Sep 2019 17:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567359870;
        bh=t+W7GhUSBFkf6UXKVCmzE61u9r7x9uMCJGn4pNUAeh0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UhF6ktKKHUDAwqzHf9/nw8hSRMcToVsV/uFr/zbQif9t7LpIcHtVpdcW+zwSBVupj
         F4yfE+eKDC8fyI5z7kqY02W+7A2WYvZeltCWmvZOSbgSyDuaaav/jzkwGnCIJ09Uui
         s4Z7i53F2XDoq4af7vUl99afgdOmK8P/pELe2ZO0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 238546086B;
        Sun,  1 Sep 2019 17:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567359869;
        bh=t+W7GhUSBFkf6UXKVCmzE61u9r7x9uMCJGn4pNUAeh0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kpvtcnOT5TJfns8fVfSImC2N8zsL1yy5+ZB0i+4NOkSNRsuMX0XyIB9siEL0dvtMx
         pdmUEkwBloi5qfdgrnVzSoKKIM7jarm1wP7x5UOsrd+7w8Dsw1kjf0aKFrfa4ezRoK
         8da/KvUBgxlvqIjy1zUZw0LoAtsYfHtqdAhFTCEY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 238546086B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        bjorn.andersson@linaro.org
Cc:     agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sboyd@kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 2/2] dt-bindings: reset: pdc: Convert PDC Global bindings to yaml
Date:   Sun,  1 Sep 2019 23:14:07 +0530
Message-Id: <20190901174407.30756-3-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190901174407.30756-1-sibis@codeaurora.org>
References: <20190901174407.30756-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert PDC Global bindings to yaml and add SC7180 PDC global to the list
of possible bindings.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../bindings/reset/qcom,pdc-global.txt        | 52 -------------------
 .../bindings/reset/qcom,pdc-global.yaml       | 47 +++++++++++++++++
 2 files changed, 47 insertions(+), 52 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
 create mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml

diff --git a/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt b/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
deleted file mode 100644
index a62a492843e70..0000000000000
--- a/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-PDC Global
-======================================
-
-This binding describes a reset-controller found on PDC-Global (Power Domain
-Controller) block for Qualcomm Technologies Inc SDM845 SoCs.
-
-Required properties:
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be:
-		    "qcom,sdm845-pdc-global"
-
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: must specify the base address and size of the register
-	            space.
-
-- #reset-cells:
-	Usage: required
-	Value type: <uint>
-	Definition: must be 1; cell entry represents the reset index.
-
-Example:
-
-pdc_reset: reset-controller@b2e0000 {
-	compatible = "qcom,sdm845-pdc-global";
-	reg = <0xb2e0000 0x20000>;
-	#reset-cells = <1>;
-};
-
-PDC reset clients
-======================================
-
-Device nodes that need access to reset lines should
-specify them as a reset phandle in their corresponding node as
-specified in reset.txt.
-
-For a list of all valid reset indices see
-<dt-bindings/reset/qcom,sdm845-pdc.h>
-
-Example:
-
-modem-pil@4080000 {
-	...
-
-	resets = <&pdc_reset PDC_MODEM_SYNC_RESET>;
-	reset-names = "pdc_reset";
-
-	...
-};
diff --git a/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml b/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml
new file mode 100644
index 0000000000000..d7d8cec9419fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/qcom,pdc-global.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PDC Global
+
+maintainers:
+  - Sibi Sankar <sibis@codeaurora.org>
+
+description:
+  The bindings describes the reset-controller found on PDC-Global (Power Domain
+  Controller) block for Qualcomm Technologies Inc SoCs.
+
+properties:
+  compatible:
+    oneOf:
+      - description: on SC7180 SoCs the following compatibles must be specified
+        items:
+          - const: "qcom,sc7180-pdc-global"
+          - const: "qcom,sdm845-pdc-global"
+
+      - description: on SDM845 SoCs the following compatibles must be specified
+        items:
+          - const: "qcom,sdm845-pdc-global"
+
+  reg:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    pdc_reset: reset-controller@b2e0000 {
+      compatible = "qcom,sdm845-pdc-global";
+      reg = <0xb2e0000 0x20000>;
+      #reset-cells = <1>;
+    };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

