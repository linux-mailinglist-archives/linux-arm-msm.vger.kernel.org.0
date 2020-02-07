Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A146155F6B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 21:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbgBGUSZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 15:18:25 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:56069 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727507AbgBGUQ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 15:16:56 -0500
Received: by mail-wm1-f68.google.com with SMTP id q9so3800131wmj.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2020 12:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uiB9oi1d6cb2tytj3R3C6lZe2r0DaI1xlBmtpgD+bqM=;
        b=oYJY6h4tihi8TAS/meDAdDl9onV1VdgDjJUE+Wmq7O6dXM75aMzW/8ySg8Vel11Y8/
         lqIB1P518qzQyvTBwhc057zwjckEM7WGRIQNxmxHUNv2/wP6g+U8LOaPxNsHW0hg4m4z
         6/73u6Pen/7V7hA3vFxPKc8izHA3Pqm+HHfm02l8cCHUU9SUAClIklvSU/hfW8SeapoC
         mRSlYyU/1wqAbu4PKJMkaEhwVbcN7GHC51wk7QyrD1sk0wxkA1+b2Tc82l43ahSqeA+T
         1Py21us9AyNg0DxYY6xG03+KPUYvQH2B7FkNBuzfzVYo/qkxTSeQEUCUNw4p4rRAEqkm
         5cqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uiB9oi1d6cb2tytj3R3C6lZe2r0DaI1xlBmtpgD+bqM=;
        b=NX4w5bFTTfYbYop+0wdyCKCzhInN0oBBpG7t1fgguaKbrTG/wRvQTx7aDLUokiOkMg
         UvKXkQjo6cis0eW+zlj1Sfb5xFR4LhAlIhbriKgTo9jrBjK9AEEooftcW5biXNVpajtY
         HmtqO9fNd3KYbXYa3pel9cOlADSgD0BVP+N+ul73EPrfyudD6YivWgNmEGfspsyWXzbH
         uYQmSlYH6IhamQGnXCX06EB1+VjEHb4vlNAG7FILyZS9PCYTXy0eI2Yp4kZb4h2gWSxt
         wYSDapTXbkN0G21VBNCsWBygmBzq6/jgvjNXBbLrZNF8SAEh+Y2O2mlScqLxccwPnkwJ
         TOYw==
X-Gm-Message-State: APjAAAVM35wshbbcjKYbAqrSW047uwB/kP0GHBX2gCu68huoBcvJtvpH
        dd1CHpjA8lXt5otFl8zkCrYc6/4znsI=
X-Google-Smtp-Source: APXvYqwWxuxX0023O5sLTXMYLEdunIjJAiDwSS1cjEvGxIN4mthdy+RWf4Y+I70YK8yWyPl3rmjoSA==
X-Received: by 2002:a05:600c:22d3:: with SMTP id 19mr66065wmg.20.1581106614572;
        Fri, 07 Feb 2020 12:16:54 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id h2sm5018542wrt.45.2020.02.07.12.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 12:16:54 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v5 04/18] dt-bindings: Add Qualcomm USB SuperSpeed PHY bindings
Date:   Fri,  7 Feb 2020 20:16:40 +0000
Message-Id: <20200207201654.641525-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
References: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Binding description for Qualcomm's Synopsys 1.0.0 SuperSpeed PHY. This PHY
appears in a number of SoCs on various flavors of 20nm and 28nm nodes.

Based on Sriharsha Allenki's <sallenki@codeaurora.org> original
definitions.

[bod: converted to yaml format]

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/phy/qcom,usb-ss.yaml  | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml
new file mode 100644
index 000000000000..377b9e1e39d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/qcom,usb-ss.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Synopsys 1.0.0 SuperSpeed USB PHY
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  Qualcomm Synopsys 1.0.0 SuperSpeed USB PHY
+
+properties:
+  compatible:
+    enum:
+      - qcom,usb-ssphy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: rpmcc clock
+      - description: PHY AHB clock
+      - description: SuperSpeed pipe clock
+
+  clock-names:
+    items:
+      - const: ref
+      - const: ahb
+      - const: pipe
+
+  vdd-supply:
+    description: phandle to the regulator VDD supply node.
+
+  vdda1p8-supply:
+    description: phandle to the regulator 1.8V supply node.
+
+  resets:
+    items:
+      - description: COM reset
+      - description: PHY reset line
+
+  reset-names:
+    items:
+      - const: com
+      - const: phy
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - vdd-supply
+  - vdda1p8-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcs404.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    usb3_phy: usb3-phy@78000 {
+        compatible = "qcom,usb-ssphy";
+        reg = <0x78000 0x400>;
+        #phy-cells = <0>;
+        clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
+                 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
+                 <&gcc GCC_USB3_PHY_PIPE_CLK>;
+        clock-names = "ref", "ahb", "pipe";
+        resets = <&gcc GCC_USB3_PHY_BCR>,
+                 <&gcc GCC_USB3PHY_PHY_BCR>;
+        reset-names = "com", "phy";
+        vdd-supply = <&vreg_l3_1p05>;
+        vdda1p8-supply = <&vreg_l5_1p8>;
+    };
+...
-- 
2.25.0

