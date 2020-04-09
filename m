Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5241A3C89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 00:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgDIWwq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 18:52:46 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:42792 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726975AbgDIWwo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 18:52:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586472764; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=h0FSuIUefockKuhVSAXTy3J0iwWzl0qO7vd4uJJG7io=; b=XM/83Ud44bkVUrfX2ZSZ0HWjYE81NmFWXmMiyEE5riHMSvYUtrqk8u35Kc9O1I4bCMWoSCRU
 mOyva85bKQz6iKA1qNuriHbSB2KdwtrUDG+4TMcQ6jxVU8NTGpHGRn6k6kT4LCSMxRDEULlN
 dld0s9h7pMyZNdP22Ex0Cc92aIU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8fa736.7fe93dae73e8-smtp-out-n05;
 Thu, 09 Apr 2020 22:52:38 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C2C01C44791; Thu,  9 Apr 2020 22:52:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 52161C433BA;
        Thu,  9 Apr 2020 22:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 52161C433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de,
        mgautam@codeaurora.org, vkoul@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v6 1/5] dt-bindings: phy: Add binding for qcom,usb-snps-femto-v2
Date:   Thu,  9 Apr 2020 15:52:25 -0700
Message-Id: <1586472749-18599-2-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1586472749-18599-1-git-send-email-wcheng@codeaurora.org>
References: <1586472749-18599-1-git-send-email-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This binding shows the descriptions and properties for the
Synopsis Femto USB PHY V2 used on QCOM platforms.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/phy/qcom,usb-snps-femto-v2.yaml       | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
new file mode 100644
index 0000000..a912df0
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/qcom,usb-snps-femto-v2.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Synopsys Femto High-Speed USB PHY V2
+
+maintainers:
+  - Wesley Cheng <wcheng@codeaurora.org>
+
+description: |
+  Qualcomm Hi-Speed USB PHY
+
+properties:
+  compatible:
+    enum:
+      - qcom,usb-snps-hs-7nm-phy
+      - qcom,sm8150-usb-hs-phy
+      - qcom,usb-snps-femto-v2-phy
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
+        compatible = "qcom,sm8150-usb-hs-phy";
+        reg = <0 0x088e2000 0 0x400>;
+        status = "disabled";
+        #phy-cells = <0>;
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "ref";
+
+        resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+    };
+...
\ No newline at end of file
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
