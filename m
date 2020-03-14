Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA5218537C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2020 01:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgCNAzS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 20:55:18 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:53494 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726893AbgCNAzM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 20:55:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584147311; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=hb6tu0nDOFJcrv92gcih7zFdKzp38gkPg0cH8w+wR+w=; b=ea/GpIqgmrIc/1lA395UOVihpExWhm4l0Dhjsetj0w18mzr77ImRHOFYSzPzdv0OYuHo2AMd
 4k7taePN0IogPPgomOZW2TdQylJAAgrUn15fQt8a3uaR8xlQVIJ54WSZLXjgd87CJcDWmIqL
 K8hE/lPyV62+Cf8vTj0KpXO9se4=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6c2b66.7f25ed075848-smtp-out-n01;
 Sat, 14 Mar 2020 00:55:02 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BCCCAC433CB; Sat, 14 Mar 2020 00:55:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DAF9FC433D2;
        Sat, 14 Mar 2020 00:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DAF9FC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH 1/4] dt-bindings: phy: Add binding for qcom,usb-hs-7nm
Date:   Fri, 13 Mar 2020 17:54:50 -0700
Message-Id: <1584147293-6763-2-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1584147293-6763-1-git-send-email-wcheng@codeaurora.org>
References: <1584147293-6763-1-git-send-email-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This binding shows the descriptions and properties for the
7nm Synopsis HS USB PHY used on QCOM platforms.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 .../devicetree/bindings/phy/qcom,usb-hs-7nm.yaml   | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.yaml
new file mode 100644
index 0000000..ec64ceb
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/qcom,usb-hs-7nm.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Synopsys 7nm High-Speed USB PHY
+
+description: |
+  Qualcomm Hi-Speed 7nm USB PHY
+
+properties:
+  compatible:
+    enum:
+      - qcom,usb-snps-hs-7nm-phy
+      - qcom,sm8150-usb-hs-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: rpmhcc ref clock
+
+  clock-names:
+    items:
+      - const: ref
+
+  resets:
+    items:
+      - description: PHY core reset
+
+  vdda-pll-supply:
+    description: phandle to the regulator VDD supply node.
+
+  vdda18-supply:
+    description: phandle to the regulator 1.8V supply node.
+
+  vdda33-supply:
+    description: phandle to the regulator 3.3V supply node.
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - resets
+  - vdda-pll-supply
+  - vdda18-supply
+  - vdda33-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8150.h>
+    usb_1_hsphy: phy@88e2000 {
+        compatible = "qcom,usb-snps-hs-7nm-phy",
+                        "qcom,sm8150-usb-hs-phy";
+        reg = <0 0x088e2000 0 0x400>;
+        status = "disabled";
+        #phy-cells = <0>;
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "ref";
+
+        resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+	};
+...
\ No newline at end of file
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
