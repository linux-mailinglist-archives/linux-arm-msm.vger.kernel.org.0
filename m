Return-Path: <linux-arm-msm+bounces-80127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8C7C2CBBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 16:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AE6C44F5143
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 15:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BDB3164AA;
	Mon,  3 Nov 2025 15:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x0GPdNYK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1833A325732
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 15:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182906; cv=none; b=KEK76H1czEgl0gLdb40WOBVAGzcysNfPx5M700O1rd6yxZuQWh4kivzesZqf7QzoDUrkE8YXPZPQmWx5IEAsuQBok15cHp9rX2mjtiJGirunBNoN1JAsS9OpvbrlfCQl4i6E82CI34ck4srUVDu6pFTMsRrGA+83wAum6Y0sdgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182906; c=relaxed/simple;
	bh=/60XDylYZWmdnR0P2d/DcuaJof1BraTXpvQ8ONRUuPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s6Dk4o03EVLN9kmDc97pguzsaop6Vf3a8InEG0B6om+Tl7Ru9mXRiifxFaMxQlMjUEEaBposmOx3KWWt8lCJoLtZnjDc3C1RYOjpEVwRSZnH7ALVUjCNRvkDUMoMpS7LoF512xasS0gVkIOYI6Ga+TZpHeWbjWuAW2h5sT8kpvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x0GPdNYK; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7128683174so10851766b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 07:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762182901; x=1762787701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5y9WY5tQdT+mTRk6q/vwazJuvaGoNd7k2enU0ndko0=;
        b=x0GPdNYKA6ekn/EydkHn1fGbJzo7+HcQEFfekLlzYnVcrwf438/9u30qkrt02yoqnH
         JniqeI+qGjoPs2pUDFiuWckq/eaHPB+wfsxmMgKWs03U4l8T4KfFnGMlc9U1tVfedlQd
         W9IXUkAnaBSjyBo68qVBHMggtr1JLo75rbJhpmEdnwRdwvGKXvJppbX+85V60p04Y/JN
         ibRw4Xs9J1Iv3lfX8e/7J3a8X6X0I0LWLsHUG0yTVnKI56Sh56lFkIf3zhX7uemc823H
         30Ng+bxk+OQgIeeoYQOXwjU7JkxQKeiAnMxEjsXvhikuofhpMhooWP8R8xzIG2IBXP9B
         iNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762182901; x=1762787701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5y9WY5tQdT+mTRk6q/vwazJuvaGoNd7k2enU0ndko0=;
        b=jyeOdqiGhRMYdH1qDBO2pqywWJ4CH/h3GFHXTiGQd0RfwmxpBq8ZyXbDiUCWda6YyG
         SrVg9LXkbIDCHxMZJjDNbDaWSS6yNT6V08Vl+RNraJ4bTyqcyyJ/Wsi6MI7vpR3waF13
         Zrtl2rjhipjt9ImSlq/r9UNsaE6i7bbHbOgysj/wgfbnOlTp+8cp5amvCX4J5LX2fc+H
         54hWPEmud95EF1krvgrtI9zubiOF+Q9pH06Vr6mu8DaDVZ+30jhWeZoILFK+gtUwQoHe
         2fYLKr8awA21+raZfRBF5AJcB92klXJwZSdftAPqaYvzGYWR+KGQAut4P1koImHQjTqM
         xEkQ==
X-Gm-Message-State: AOJu0Yzae19fKYrZcAy0GFHCBkZRUizre3f4i0qQU7N1SGz1509P53dQ
	LDqBuamjPRRZmH0XTOvoiWr2RgoYemYbgEIVTyxAAWhcWGfQCBQZ8iDe/vOSxjNqlrI=
X-Gm-Gg: ASbGncsPsyxzKZByjjtvVI79iO6fQ9fWZJ1zFzMAwtNzLzpfDi6Gxm8kD2sxZnNfAOe
	+bWopO26HOhLA0BXTFBDMAd6GQSOWQdxwNk0mG4TanS0l/m4a70HuGsaLc9LPhptnQp6LrtuDuY
	jY3zeo6lLlcsXAGr+/HW2/IGeyMd6XCPmFrBXHh2Pzj3eO06ZtGVNPkrCx/16118bXR9979azMz
	eKsoZVgGGTkxuM5Xui9iRW2kPTcoUaISmH5STKSndQLyJRsrsKLOa0QkyrkXTITjkfD+hFQgc9/
	HjPHB1ehPR/9OvuDshsNWjbXaOqVb7MfIVCB+xwP/UtwtHev+4NP5B8C3fAi68wcNCXcOxGgJHQ
	c8ROstNiDyuQLLqVsCQdaouvyGy+fJVO8dI+0xOCJaF5vZXHLwudAwNrE7Xuw7zwPqn2M5dkSYI
	wspoZHiBJyK0aNGAYEwocZOx4gPjo=
X-Google-Smtp-Source: AGHT+IFJHh3FKRAF1jF0s4svcp3lNkn71MV19ZjNiPSionIE4cVq7X8wjL7Nnnyk+krA5RRXBPNYEw==
X-Received: by 2002:a17:907:d27:b0:b2b:c145:ab8a with SMTP id a640c23a62f3a-b7070129066mr765668466b.3.1762182901327;
        Mon, 03 Nov 2025 07:15:01 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077975dfdsm1045203066b.13.2025.11.03.07.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 07:15:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 03 Nov 2025 16:14:42 +0100
Subject: [PATCH 02/12] dt-bindings: PCI: qcom,pcie-sdx55: Move SDX55 to
 dedicated schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-dt-bindings-pci-qcom-v1-2-c0f6041abf9b@linaro.org>
References: <20251103-dt-bindings-pci-qcom-v1-0-c0f6041abf9b@linaro.org>
In-Reply-To: <20251103-dt-bindings-pci-qcom-v1-0-c0f6041abf9b@linaro.org>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8180;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/60XDylYZWmdnR0P2d/DcuaJof1BraTXpvQ8ONRUuPw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpCMbli7YOvEoPh2fPW6hwnE/uFbR+3GgG4k2Gc
 UAGU3qVsx+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQjG5QAKCRDBN2bmhouD
 1/pFD/wJx5AuZ0PaUyR/KGOCXyzj4ZOAyViem39CZki7OWxKv0lIvS5iRRvrJHj0pnbMm/5QN76
 JnCMqJ6r8UJ6Zu2V2VG/dFPLoIC1uk7wl0yvkIexYn3+KMklHsrPtGwIq45ET43+pCxcQg01Tvk
 w0P7xfNrVQhM2ybsA5RXQLncTw4kzxjGBPKqVfHU7f7hvWJ/TDP/yjLtR6q+IgLXSHSNhtynZsn
 XFOU6hkuSK5aBCr3DM2wdRffvoN0dUqhwWIYC8NhWP0/V+d8oBsZwqL6U7yoYVYTzb4E62RWHoV
 Oq/xyHyLWjSllWMsTbGZ9lXzn9rs2XDc7JpQ43e0uWSfKiBvcv/dBzYxExeqRTef5AjOZHc7N8e
 GBdhOqzOFHjgw9dml4kGCC746sNWVeNF48Hw0NvLYWoOpnEJkQ44ohOz41/blBPz+PqbLuVClxw
 5vTdkO0q6JfzY3hv6FM9IO8WpRB451pyrbkTll1kfHqbSPm2IwTBuuPidckA4vqoIXLrmJPWOm1
 Vb3WSXfo4QTq3YV38LWwT2JUbxew1qWIX0iAiVI3QGLz9QFh9DDHgmesFinYdvMHnF7Qqn0YQCL
 nfznNrnrumtX5hiSCUFdIquTVrt8kdth1O/Xkpl3xcElUfuMIhX4dMh5k7f7POw0MOjVzTolkwD
 NEKx1o8IRXYNJ4w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Move SDX55 PCIe devices from qcom,pcie.yaml binding to a dedicated file
to make reviewing and maintenance easier.

New schema is equivalent to the old one with few changes:
 - Adding a required compatible, which is actually redundant.
 - Drop the really obvious comments next to clock/reg/reset-names items.
 - Adding interrupts based on the DTS, which were missing in the
   all-in-one binding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie-sdx55.yaml   | 172 +++++++++++++++++++++
 .../devicetree/bindings/pci/qcom,pcie.yaml         |  48 ------
 2 files changed, 172 insertions(+), 48 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sdx55.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sdx55.yaml
new file mode 100644
index 000000000000..7f6fd81e7ed0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sdx55.yaml
@@ -0,0 +1,172 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/qcom,pcie-sdx55.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SDX55 PCI Express Root Complex
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Manivannan Sadhasivam <mani@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,pcie-sdx55
+
+  reg:
+    minItems: 5
+    maxItems: 6
+
+  reg-names:
+    minItems: 5
+    items:
+      - const: parf
+      - const: dbi
+      - const: elbi
+      - const: atu
+      - const: config
+      - const: mhi
+
+  clocks:
+    maxItems: 7
+
+  clock-names:
+    items:
+      - const: pipe
+      - const: aux
+      - const: cfg
+      - const: bus_master # Master AXI clock
+      - const: bus_slave # Slave AXI clock
+      - const: slave_q2a
+      - const: sleep
+
+  interrupts:
+    maxItems: 8
+
+  interrupt-names:
+    items:
+      - const: msi
+      - const: msi2
+      - const: msi3
+      - const: msi4
+      - const: msi5
+      - const: msi6
+      - const: msi7
+      - const: msi8
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: pci
+
+required:
+  - power-domains
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,pcie-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sdx55.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pcie@1c00000 {
+        compatible = "qcom,pcie-sdx55";
+        reg = <0x01c00000 0x3000>,
+              <0x40000000 0xf1d>,
+              <0x40000f20 0xc8>,
+              <0x40001000 0x1000>,
+              <0x40100000 0x100000>;
+        reg-names = "parf",
+                    "dbi",
+                    "elbi",
+                    "atu",
+                    "config";
+        ranges = <0x01000000 0x0 0x00000000 0x40200000 0x0 0x100000>,
+                 <0x02000000 0x0 0x40300000 0x40300000 0x0 0x3fd00000>;
+
+        device_type = "pci";
+        linux,pci-domain = <0>;
+        bus-range = <0x00 0xff>;
+        num-lanes = <1>;
+
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "msi",
+                          "msi2",
+                          "msi3",
+                          "msi4",
+                          "msi5",
+                          "msi6",
+                          "msi7",
+                          "msi8";
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0 0 0 0x7>;
+        interrupt-map = <0 0 0 1 &intc GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+                        <0 0 0 2 &intc GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+                        <0 0 0 3 &intc GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+                        <0 0 0 4 &intc GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+
+        clocks = <&gcc GCC_PCIE_PIPE_CLK>,
+                 <&gcc GCC_PCIE_AUX_CLK>,
+                 <&gcc GCC_PCIE_CFG_AHB_CLK>,
+                 <&gcc GCC_PCIE_MSTR_AXI_CLK>,
+                 <&gcc GCC_PCIE_SLV_AXI_CLK>,
+                 <&gcc GCC_PCIE_SLV_Q2A_AXI_CLK>,
+                 <&gcc GCC_PCIE_SLEEP_CLK>;
+        clock-names = "pipe",
+                      "aux",
+                      "cfg",
+                      "bus_master",
+                      "bus_slave",
+                      "slave_q2a",
+                      "sleep";
+
+        assigned-clocks = <&gcc GCC_PCIE_AUX_CLK>;
+        assigned-clock-rates = <19200000>;
+
+        iommu-map = <0x0 &apps_smmu 0x0200 0x1>,
+                    <0x100 &apps_smmu 0x0201 0x1>,
+                    <0x200 &apps_smmu 0x0202 0x1>,
+                    <0x300 &apps_smmu 0x0203 0x1>,
+                    <0x400 &apps_smmu 0x0204 0x1>;
+
+        power-domains = <&gcc PCIE_GDSC>;
+
+        phys = <&pcie_phy>;
+        phy-names = "pciephy";
+
+        resets = <&gcc GCC_PCIE_BCR>;
+        reset-names = "pci";
+
+        perst-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
+        wake-gpios = <&tlmm 53 GPIO_ACTIVE_HIGH>;
+
+        pcie@0 {
+            device_type = "pci";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+            bus-range = <0x01 0xff>;
+
+            #address-cells = <3>;
+            #size-cells = <2>;
+            ranges;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 0e1808105a81..de6439a45ef4 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -31,7 +31,6 @@ properties:
           - qcom,pcie-msm8996
           - qcom,pcie-qcs404
           - qcom,pcie-sdm845
-          - qcom,pcie-sdx55
       - items:
           - enum:
               - qcom,pcie-ipq5332
@@ -210,27 +209,6 @@ allOf:
             - const: config # PCIe configuration space
             - const: mhi # MHI registers
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,pcie-sdx55
-    then:
-      properties:
-        reg:
-          minItems: 5
-          maxItems: 6
-        reg-names:
-          minItems: 5
-          items:
-            - const: parf # Qualcomm specific registers
-            - const: dbi # DesignWare PCIe registers
-            - const: elbi # External local bus interface registers
-            - const: atu # ATU address space
-            - const: config # PCIe configuration space
-            - const: mhi # MHI registers
-
   - if:
       properties:
         compatible:
@@ -579,32 +557,6 @@ allOf:
           items:
             - const: pci # PCIe core reset
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,pcie-sdx55
-    then:
-      properties:
-        clocks:
-          minItems: 7
-          maxItems: 7
-        clock-names:
-          items:
-            - const: pipe # PIPE clock
-            - const: aux # Auxiliary clock
-            - const: cfg # Configuration clock
-            - const: bus_master # Master AXI clock
-            - const: bus_slave # Slave AXI clock
-            - const: slave_q2a # Slave Q2A clock
-            - const: sleep # PCIe Sleep clock
-        resets:
-          maxItems: 1
-        reset-names:
-          items:
-            - const: pci # PCIe core reset
-
   - if:
       not:
         properties:

-- 
2.48.1


