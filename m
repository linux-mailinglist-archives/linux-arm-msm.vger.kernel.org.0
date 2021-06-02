Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A92FC3988FB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 14:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbhFBMJx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 08:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbhFBMJv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 08:09:51 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01540C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jun 2021 05:08:08 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id m13-20020a17090b068db02901656cc93a75so3330402pjz.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 05:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WvMmXhTxHZnXNL1q69wHChx/x73KLtybaTJDDd58n6o=;
        b=IA5S0gstqxEGIewvObCuPYmOo+eQZVBHq3AC9fuvTtPKlP1t5QGR7C/vQMhqnDeE1s
         E0CIQBEruKhlvIHovbLh3xEeThdIZMkr2jmBJLLYvGzwgxGoThk3tA5DWDg3WqTmv0+M
         oLxtoj55BvGnJowv8KiE5LbWB/pwv6zdXPQ3yllGhVx2mrK2s/Ku79UT2TpCMwHtJ13w
         P/XprsIROcP+FhH8uAY2K+mLCdTVHJ+D1eReu/NfpOkr2Ci2S0LiMcJ7RZ4FkH+Y6mfs
         XRq+7BNrN6oA01+5mbsXTKdDp3rB8QJ5uKx6RnlOOFacWBHSHgrZsRRb/C7oyBpBAfWP
         nHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WvMmXhTxHZnXNL1q69wHChx/x73KLtybaTJDDd58n6o=;
        b=TZkgcmNVrFZCJ8sqDQtXmbvR7Vt17Jp07B/zjJ1PuhrRSFlAXx4Cd/t3GbNdMMrzso
         qUc2Z8jx+l2+ySmQclKf0JJaGF5q0IHgpuiVnNXuPc5E0d6TTenn72dKZK3djugg2lew
         nwid9BVnRG8pKZtQtapoUNPbIJmblJ6z7+LzkHX51tH+v6q5jTpYIgX7DuthHEMGUXay
         Dlv1BBqtFvaNnTbGomirw5qiLRtCSs2PkPuO7pM8f8iyb2go+aw99+Ep6eeylA6abumX
         gaULbn+zYVJlKEeuFu4BLw/fCN8Y+x5YmD2MgkPObqHF3vTnyijOosMrXS806ZWhh0hD
         6ZUQ==
X-Gm-Message-State: AOAM530uN7PSM5QEW+ZdHjxedcykR9Z0tOJRrj3a7f4oNbHwtj9vZ8Rj
        SpVJFzVXbrqTI5MPxKjafazj
X-Google-Smtp-Source: ABdhPJyL2MP1U4TFzNwYyn2DTPsXQ1gifT4OpKrdbzOPbdutN3Ydkn1OjNc48gJo9lPRnzHpmhmlXA==
X-Received: by 2002:a17:90a:d98f:: with SMTP id d15mr5337754pjv.51.1622635687528;
        Wed, 02 Jun 2021 05:08:07 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.54])
        by smtp.gmail.com with ESMTPSA id h18sm12502907pgl.87.2021.06.02.05.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 05:08:07 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lorenzo.pieralisi@arm.com, robh@kernel.org, bhelgaas@google.com
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/3] dt-bindings: pci: Add devicetree binding for Qualcomm PCIe EP controller
Date:   Wed,  2 Jun 2021 17:37:50 +0530
Message-Id: <20210602120752.46154-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210602120752.46154-1-manivannan.sadhasivam@linaro.org>
References: <20210602120752.46154-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree binding for Qualcomm PCIe EP controller used in platforms
like SDX55. The EP controller is based on the Designware core with
Qualcomm specific wrappers.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie-ep.yaml | 139 ++++++++++++++++++
 1 file changed, 139 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
new file mode 100644
index 000000000000..0f9140e93bcb
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -0,0 +1,139 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/qcom,pcie-ep.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PCIe Endpoint Controller binding
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+allOf:
+  - $ref: "pci-ep.yaml#"
+
+properties:
+  compatible:
+    const: qcom,pcie-ep
+
+  reg:
+    items:
+      - description: Designware PCIe registers
+      - description: External local bus interface registers
+      - description: Address Translation Unit (ATU) registers
+      - description: Memory region used to map remote RC address space
+      - description: Qualcomm specific PARF configuration registers
+      - description: Qualcomm specific TCSR registers
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: elbi
+      - const: atu
+      - const: addr_space
+      - const: parf
+      - const: tcsr
+
+  clocks:
+    items:
+      - description: PCIe CFG AHB clock
+      - description: PCIe Auxiliary clock
+      - description: PCIe Master AXI clock
+      - description: PCIe Slave AXI clock
+      - description: PCIe Reference clock
+      - description: PCIe Sleep clock
+      - description: PCIe Slave Q2A AXI clock
+
+  clock-names:
+    items:
+      - const: cfg
+      - const: aux
+      - const: bus_master
+      - const: bus_slave
+      - const: ref
+      - const: sleep
+      - const: slave_q2a
+
+  interrupts:
+    maxItems: 1
+    description: PCIe Global interrupt
+
+  interrupt-names:
+    const: int_global
+
+  perst-gpios:
+    description: PCIe endpoint reset GPIO
+    maxItems: 1
+
+  wake-gpios:
+    description: PCIe endpoint wake GPIO
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: core_reset
+
+  power-domains:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: pciephy
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - perst-gpios
+  - resets
+  - reset-names
+  - power-domains
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sdx55.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pcie_ep: pcie-ep@40000000 {
+        compatible = "qcom,pcie-ep";
+
+        reg = <0x40000000 0xf1d>,
+              <0x40000f20 0xc8>,
+              <0x40001000 0x1000>,
+              <0x42000000 0x1000>,
+              <0x01c00000 0x3000>,
+              <0x01fcb000 0x1000>;
+        reg-names = "dbi", "elbi", "atu", "addr_space", "parf", "tcsr";
+
+        clocks = <&gcc GCC_PCIE_CFG_AHB_CLK>,
+             <&gcc GCC_PCIE_AUX_CLK>,
+             <&gcc GCC_PCIE_MSTR_AXI_CLK>,
+             <&gcc GCC_PCIE_SLV_AXI_CLK>,
+             <&gcc GCC_PCIE_0_CLKREF_CLK>,
+             <&gcc GCC_PCIE_SLEEP_CLK>,
+             <&gcc GCC_PCIE_SLV_Q2A_AXI_CLK>;
+        clock-names = "cfg", "aux", "bus_master", "bus_slave",
+                      "ref", "sleep", "slave_q2a";
+
+        interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "int_global";
+        perst-gpios = <&tlmm 57 GPIO_ACTIVE_HIGH>;
+        wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
+        resets = <&gcc GCC_PCIE_BCR>;
+        reset-names = "core_reset";
+        power-domains = <&gcc PCIE_GDSC>;
+        phys = <&pcie0_lane>;
+        phy-names = "pciephy";
+        max-link-speed = <3>;
+        num-lanes = <2>;
+    };
-- 
2.25.1

