Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B125F13A156
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2020 08:08:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728820AbgANHIZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jan 2020 02:08:25 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:26173 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728874AbgANHIY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jan 2020 02:08:24 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578985704; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ZVAjfFnR5g5tt+dHhDf+Jgdpgx3yDYML3pSfUkW0yvY=; b=KQDQR8UvN5BDgkGsqgZ/0LuVte1g3G97rSMWD4mDhUy9pHj3LhCSzPREjQxhQUPDrCnvw/yV
 GyKwwMJwlmxiPtzBVQtGqT4nLStAYp1MF6ZNLPNha6LpBUWAn/IFHjwELbW/QtXzM6ciSk5Z
 eZe75Tf67P9nKt8F5huUZlllihQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1d68e7.7f9d94fbdae8-smtp-out-n03;
 Tue, 14 Jan 2020 07:08:23 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 240D6C433A2; Tue, 14 Jan 2020 07:08:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from sthella-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sthella)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6CEEBC43383;
        Tue, 14 Jan 2020 07:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6CEEBC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sthella@codeaurora.org
From:   Shyam Kumar Thella <sthella@codeaurora.org>
To:     agross@kernel.org, srinivas.kandagatla@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com
Cc:     Shyam Kumar Thella <sthella@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5] dt-bindings: nvmem: add binding for QTI SPMI SDAM
Date:   Tue, 14 Jan 2020 12:38:12 +0530
Message-Id: <1578985692-20309-1-git-send-email-sthella@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QTI SDAM allows PMIC peripherals to access the shared memory that is
available on QTI PMICs. Add documentation for it.

Signed-off-by: Shyam Kumar Thella <sthella@codeaurora.org>
---
 .../devicetree/bindings/nvmem/qcom,spmi-sdam.yaml  | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml b/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
new file mode 100644
index 0000000..7bbd4e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/qcom,spmi-sdam.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SPMI SDAM DT bindings
+
+maintainers:
+  - Shyam Kumar Thella <sthella@codeaurora.org>
+
+description: |
+  The SDAM provides scratch register space for the PMIC clients. This
+  memory can be used by software to store information or communicate
+  to/from the PBUS.
+
+allOf:
+  - $ref: "nvmem.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - qcom,spmi-sdam
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+required:
+  - compatible
+  - reg
+  - ranges
+
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    type: object
+
+    properties:
+      reg:
+        maxItems: 1
+        description:
+          Offset and size in bytes within the storage device.
+
+      bits:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        maxItems: 1
+        items:
+          items:
+            - minimum: 0
+              maximum: 7
+              description:
+                Offset in bit within the address range specified by reg.
+            - minimum: 1
+              description:
+                Size in bit within the address range specified by reg.
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+examples:
+  - |
+      sdam_1: nvram@b000 {
+          #address-cells = <1>;
+          #size-cells = <1>;
+          compatible = "qcom,spmi-sdam";
+          reg = <0xb000 0x100>;
+          ranges = <0 0xb000 0x100>;
+
+          /* Data cells */
+          restart_reason: restart@50 {
+              reg = <0x50 0x1>;
+              bits = <6 2>;
+          };
+      };
+...
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project
