Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 662391573E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 13:07:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727572AbgBJMH0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 07:07:26 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55829 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727592AbgBJMH0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 07:07:26 -0500
Received: by mail-wm1-f68.google.com with SMTP id q9so9609761wmj.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 04:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uiB9oi1d6cb2tytj3R3C6lZe2r0DaI1xlBmtpgD+bqM=;
        b=SCiB8u0sPb577KblCfYsriqtB1i6vpEWTP+w9XcuzZjz6k1WjLt4DCOLnECKSJgymi
         TSkdytwihM9ZfGxWtNUv1g8+IkLD3dBe3a2bZNODDoEPAAk+cblc/z9f1ahzl27ZnYjF
         igUjmKxKM2NOY71mS5R+mBpWd+gWFe9rFlEsDST8tm0WPA9zl0dTO87mmgymMZ10io86
         8Hi50x9v8TnWZ+agbLy01R0qSFbbvjgGY0qkRvnB0KrSvFfS2tXB32+c8UTlzhmnSPzS
         OfXX+aOg0u/B9zu0RTLaFg50Vp+QbCm7qpjcSZ3uvKZfrdZ6aMZht+/b3tolRHweHmc7
         xoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uiB9oi1d6cb2tytj3R3C6lZe2r0DaI1xlBmtpgD+bqM=;
        b=TV/3KqSYRMFY7Lf+QH+cRQZUZpszkUmrbTD8r4IB2dqWGRsr3Ynt2GAaT1WTVOUKFw
         uBqPha/PiN+52Me+Ht7NY3inGPGCgyunwvVbgS1VEo0hxQ899bJH7nswCORQ/LkGuC69
         RLmaW1we2C5A9pUtPDG+ZRTnBzfilsUJt/2NylrZYmgNCRFCyNC240mY5h3WLYR7bVk+
         isadNta7ZS0ToQ+i37O1NpxwnS+8rOiwzAd2C+aFQFQtSbpD92Fn2XX158/seEalpOPJ
         VWyFP//CWazJ/2Vh2nM5rNCIRjRH7Tez7ZCyxheTWo+ozQIDKEjW/GZK71d/Ha4ZRvW7
         5gcw==
X-Gm-Message-State: APjAAAWwaSJRozNyqMlt3poWFS72iQgVlnLnxi9iq/71/l0OQJTIyLz6
        q9dwsrl0yQYNQDXWdD+fwv55IyLRUno=
X-Google-Smtp-Source: APXvYqykCI+rg0czVweX1aLGHsHxNjwPPCJk9O7vsXXLEnfNbKOkLFilG4ks1EoMS/ue4XJjYCSvUg==
X-Received: by 2002:a1c:a404:: with SMTP id n4mr15244154wme.186.1581336444186;
        Mon, 10 Feb 2020 04:07:24 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id i204sm293124wma.44.2020.02.10.04.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 04:07:23 -0800 (PST)
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
Subject: [PATCH v6 04/18] dt-bindings: Add Qualcomm USB SuperSpeed PHY bindings
Date:   Mon, 10 Feb 2020 12:07:09 +0000
Message-Id: <20200210120723.91794-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
References: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
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

