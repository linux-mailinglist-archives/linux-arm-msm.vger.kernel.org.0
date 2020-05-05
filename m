Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 334901C6188
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 22:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728853AbgEEUAJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 16:00:09 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:19937 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729079AbgEET7s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 15:59:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588708787; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=kd6wo7B9LgknuihDe5FEIjtKMZh037dhOhnOBjgpUoI=; b=nKTdk6wFal1HYAWIVoJ+yjQO5fSm3jV9vx+J5llydZsN9g6niaUTiNFsDo1SH6Qj3TwSmq1Y
 WLQsRbz3IQBxQP2qwWzMMf1Z4e/lTT4ALGhWw5SokLbzJW5vQDRTIVjW3TrnKv9paVzQt69U
 cxXcxrhw0WIa8KbN3nPmCThCTvA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb1c5b3.7f04b837ba08-smtp-out-n04;
 Tue, 05 May 2020 19:59:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D24D4C44798; Tue,  5 May 2020 19:59:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9313FC433F2;
        Tue,  5 May 2020 19:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9313FC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de,
        mgautam@codeaurora.org, vkoul@kernel.org, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jackp@codeaurora.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v9 1/5] dt-bindings: phy: Add binding for qcom,usb-snps-femto-v2
Date:   Tue,  5 May 2020 12:59:32 -0700
Message-Id: <1588708776-16774-2-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588708776-16774-1-git-send-email-wcheng@codeaurora.org>
References: <1588708776-16774-1-git-send-email-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This binding shows the descriptions and properties for the
Synopsis Femto USB PHY V2 used on QCOM platforms.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 .../bindings/phy/qcom,usb-snps-femto-v2.yaml       | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
new file mode 100644
index 0000000..574f890
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -0,0 +1,80 @@
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
+  Qualcomm High-Speed USB PHY
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
+    phy@88e2000 {
+        compatible = "qcom,sm8150-usb-hs-phy";
+        reg = <0 0x088e2000 0 0x400>;
+        #phy-cells = <0>;
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "ref";
+
+        resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+        vdda-pll-supply = <&vdd_usb_hs_core>;
+        vdda33-supply = <&vdda_usb_hs_3p1>;
+        vdda18-supply = <&vdda_usb_hs_1p8>;
+    };
+...
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
