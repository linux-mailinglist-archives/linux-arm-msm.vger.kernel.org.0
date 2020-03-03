Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC74177CED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 18:13:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729993AbgCCRL7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 12:11:59 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39060 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729849AbgCCRL6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 12:11:58 -0500
Received: by mail-wm1-f65.google.com with SMTP id j1so2212081wmi.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2020 09:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WG9OW47c/SOzcUAJmIFO7wHxMk/qQfRkSNCfV4wOk3o=;
        b=oJGEbw492oMwRTCW1exJvY3UGI70SPkKQU3oZd9bqOrwEAoOpiCD+bEj5o+u3D0IQo
         Orcd6DwJO4jy1pSzI1mMTCQIZqirG+x9Kbwe6fymvFx9ndBDWLeBHb2O9uFQO8yDhRH4
         SZV7t+ySHbK1ZuJG6N3krGfj8+HAyVAaHab5s//S81D0hNcgRasoCllbjlNdPY5sVDDf
         a2o5nsnbTpSCuDzIx9YwMQIitBWiMlweTzB2TB884+Nn3fMYHT0tPtRvo8jp79VLZYZJ
         3krHJaWHrGWZf1RtrDA2IdNy7VTKh1mKx4Wph+U7FGVLjn1/yQIzD/BjDZazoxs/Qs+f
         qg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WG9OW47c/SOzcUAJmIFO7wHxMk/qQfRkSNCfV4wOk3o=;
        b=TIrtHob3hDo48blu6SFciZVsQDCjywIRUCUwfVaJfEsgDM399qUyfmb4COFeK6tr/D
         U1t+Grn9e75OkHo32DiVX1xG0/auI+DmO0TnpHwRM7QGVhq5Mvq/YGFNmrzv41lqG+ba
         ozB0rwYkT+az9SRiPnGEQOmK1C3WVgYyaoOKdGMchb1kaJZpO4fbY3tQmxLpCPz2i+gq
         TmxuuUKMFJp6cRZfCzsqPekJhFcbIRr9mcO9XvwttEEpuw3UDtMPBc55vkF4j7hN/6Pl
         3PU0WHjik1zbARKNDVc5sv9ZIWjDxeJfkWqqYmWZj4MBM/nqOqeb3DTgvsIc/YmYLdq0
         jjlw==
X-Gm-Message-State: ANhLgQ1GeWXSNDHWjiwsa0SmaKG5PPYC644uZG5oOJ+EIuY56Z+A/mFV
        4pPZ9cVVhLrx32EWVE1blPADxdBPj/Y=
X-Google-Smtp-Source: ADFU+vvOjVRFm/QXN6OLeEKElNVNpdE0fdGMJkLkZuJBIblhB7yphzOzBdKQjMpfGEjh+j2WKaQJAw==
X-Received: by 2002:a1c:a70a:: with SMTP id q10mr5145324wme.88.1583255513206;
        Tue, 03 Mar 2020 09:11:53 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id z13sm5425319wrw.88.2020.03.03.09.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 09:11:52 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Sriharsha Allenki <sallenki@codeaurora.org>,
        Anu Ramanathan <anur@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v7 02/18] dt-bindings: phy: Add Qualcomm Synopsys Hi-Speed USB PHY binding
Date:   Tue,  3 Mar 2020 17:11:43 +0000
Message-Id: <20200303171159.246992-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
References: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sriharsha Allenki <sallenki@codeaurora.org>

Adds bindings for Qualcomm's 28 nm USB PHY supporting Low-Speed, Full-Speed
and Hi-Speed USB connectivity on Qualcomm chipsets.

[bod: Converted to YAML. Changed name dropping snps, 28nm components]

Signed-off-by: Sriharsha Allenki <sallenki@codeaurora.org>
Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/phy/qcom,usb-hs-28nm.yaml        | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-hs-28nm.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-28nm.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-hs-28nm.yaml
new file mode 100644
index 000000000000..ca6a0836b53c
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-28nm.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/qcom,usb-hs-28nm.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Synopsys DesignWare Core 28nm High-Speed PHY
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  Qualcomm Low-Speed, Full-Speed, Hi-Speed 28nm USB PHY
+
+properties:
+  compatible:
+    enum:
+      - qcom,usb-hs-28nm-femtophy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: rpmcc ref clock
+      - description: PHY AHB clock
+      - description: Rentention clock
+
+  clock-names:
+    items:
+      - const: ref
+      - const: ahb
+      - const: sleep
+
+  resets:
+    items:
+      - description: PHY core reset
+      - description: POR reset
+
+  reset-names:
+    items:
+      - const: phy
+      - const: por
+
+  vdd-supply:
+    description: phandle to the regulator VDD supply node.
+
+  vdda1p8-supply:
+    description: phandle to the regulator 1.8V supply node.
+
+  vdda3p3-supply:
+    description: phandle to the regulator 3.3V supply node.
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - vdd-supply
+  - vdda1p8-supply
+  - vdda3p3-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcs404.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    usb2_phy_prim: phy@7a000 {
+        compatible = "qcom,usb-hs-28nm-femtophy";
+        reg = <0x0007a000 0x200>;
+        #phy-cells = <0>;
+        clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
+                 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
+                 <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
+        clock-names = "ref", "ahb", "sleep";
+        resets = <&gcc GCC_USB_HS_PHY_CFG_AHB_BCR>,
+                 <&gcc GCC_USB2A_PHY_BCR>;
+        reset-names = "phy", "por";
+        vdd-supply = <&vreg_l4_1p2>;
+        vdda1p8-supply = <&vreg_l5_1p8>;
+        vdda3p3-supply = <&vreg_l12_3p3>;
+    };
+...
-- 
2.25.1

