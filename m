Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E949157419
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 13:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727606AbgBJMH2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 07:07:28 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53785 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727573AbgBJMHZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 07:07:25 -0500
Received: by mail-wm1-f66.google.com with SMTP id s10so9636387wmh.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 04:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x0ouoTkt3Ut5OXKfPgK1h53EOxbNSeKO18hqFnETzgE=;
        b=VdCgYUjQtOvHs10av2SRGg41TliOoFZSiT0HYGbU4ZMxYl5gneInWejN1cCOn3Z41X
         UjJkAqECV+l1GTn9/L08WCdbqROXon1JE6tGtIAmCARGG+aaiatcrf1MABgH88Lm9wTi
         oTmTZgjWum2BUEnp5Xeb2XGdcbF+UqI5XNYd3WDUqLiM0C7CtE6uOwuODiM2scdx6mZm
         GFUsQeR0pRIbOlr305HYSBLBvfikaCYGf8Fkui+aAxNlPEGn3cgB+fIPyGkDiHVzsvNm
         undIYueSWCX+GCE7Sa5lKccwAnQp2ilPXCd2u1RQ6SXqbUtzG/gnk6spBjyTElJw5cmh
         KT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x0ouoTkt3Ut5OXKfPgK1h53EOxbNSeKO18hqFnETzgE=;
        b=OLzj2sQvLfCJMFp6Svzc2kesKkF0vh4tcmO7ALsgXKvTGSrpEBS4o+pCUC9q/+tObF
         wRX/iHh28wcAvE0WsENg+pw2nw5wAw08r7qExwgclCLpB3MAzpJ1HGAcERMt7cGj59mi
         WalrdYKG8n4Vz7qO5F5x9xKHWhhEmOJrzDwIE3maE8KSK3uT1PBPX565ZUKVi14xinI3
         jrWzrs/S+yqCs40iS593yNJT3O4NkVSVBtU/eco1fbdWQqJR5CeTKY5UA/yM68sQABLp
         pSkcXUVEETYqCAhdY8uQ3A+yEQ1P53KOPXJuoWQDz6LFT10arsfHygiX2a5SK8v5FTAr
         AWTw==
X-Gm-Message-State: APjAAAVCsQ+4zahhS/+Pv0mb4YCclWbjariWqxA5SXL0Jry+3ccBaNbk
        eXzSGJAdXIyUhij/m8GN8I/qHv3jpzE=
X-Google-Smtp-Source: APXvYqwcSVpYsFOBYoVofOHclUzN5NIEP4opVx8xD1ELu0zcVr9kZjaqIql+5yY/caF3pHRnLmId5Q==
X-Received: by 2002:a1c:3d46:: with SMTP id k67mr15728835wma.171.1581336441867;
        Mon, 10 Feb 2020 04:07:21 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id i204sm293124wma.44.2020.02.10.04.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 04:07:21 -0800 (PST)
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
Subject: [PATCH v6 02/18] dt-bindings: phy: Add Qualcomm Synopsys Hi-Speed USB PHY binding
Date:   Mon, 10 Feb 2020 12:07:07 +0000
Message-Id: <20200210120723.91794-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
References: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
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
2.25.0

