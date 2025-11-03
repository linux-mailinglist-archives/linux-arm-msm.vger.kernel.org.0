Return-Path: <linux-arm-msm+bounces-80132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E8DC2CBD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 16:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 91AA64F33A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 15:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0EAA329E4F;
	Mon,  3 Nov 2025 15:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="txIchyjf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF153271E9
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 15:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182914; cv=none; b=QYy8LrQKz8J4FL48DIpkEJGFnqZDUOBBlZkGGwmnVskBgvnybJYmAeqebI6dziMaqtiQf0XJ3nzitlAgp5ZZF/5+f4wDB9PjUH7kVy6M0Q/CTvimfAmQx5R816fMtjSl+IhREYadbrMLP8S8Nj3wEH/hOm40LPrUvWXtRlSVxYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182914; c=relaxed/simple;
	bh=GdnyJiF2SvA5uIAMq/hgOZYgMf4S3fKIQz/rPO1rTps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U70J4raVnCaBX+OOTcJFitbdk/K1gagn9TtjGFd1etip6anP77vIV12iz6jWymWz+FtGjr8TyEqk9k9LEBX/lJwR/aYI2vcbNPOGUub9EC2KaoHnqD2m9NOUGLvHDIMeodbfvJl5yNhnGyrVKq4chibMo00An6hC+PYUJT35CaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=txIchyjf; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-640e40d4596so847a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 07:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762182911; x=1762787711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioIXshONfo7KD2SpyWyfHADZJi0tff/xzzkpFvsjTAc=;
        b=txIchyjf8XfgJE1gr5VQcme5KwlzLjxJp2LJr44+wzyYteAG3tnWiggoP8xr0JzsMK
         /jemLo/9ZG35/rRCyixPW+VU8qNyfoLSL/hK01fOL9LqCj7Ed3GY9B9F7w2J9n2w2CQs
         Pfns3IT2SyX7VItpbo8QQ6Eueiu5YW6vSypm1+Th7RXHaGaZ9dxZNJ3XhYcTC98YmqBL
         8AaACbtTRSSvTZqsQeOF+uFMGR+l5GS/C99uFmcXX7eQRCRwI5ddwO+AQ0lL1Hq+6v6H
         GPd9SBmmMssGYO5ENdGTkgh8eX5VcLvF+eGZcQEBpdOHS2nXsI/aiRjRb6A+DGO0h6LX
         pMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762182911; x=1762787711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ioIXshONfo7KD2SpyWyfHADZJi0tff/xzzkpFvsjTAc=;
        b=C+J8qm2YsoeoS/K4TFosi6WMul42+Rj7/5lg1dMI+k82nwRdRuPZJZ83UEOMKXU8aM
         0jT6CoboPqK9/yE28wTbQ+NaQsJjrE9M9QOmPdnfRKN/4VI+piY28cuNTHmqkdVGv8MZ
         A8dM75BmSh4b489vuI93iGBr6RTZqjCcRYHBUpy43tfi9Rylrn2E1PdS9F5aJ+zP0HJM
         ZiLFRYCIlVjezZzyK2Pu0Q79jIHpVY0oDXJLe+jYF4LfDVv9ZitduYwDf+pjbymxamBl
         gy4+DqgEJJQHjGeSIpuU0ZF4SrD5FXspiRRXDJMRk7EjQ+sn4qh1WeQLK8QPI4iBcC+g
         qDjw==
X-Gm-Message-State: AOJu0YwTQNm/8dfQ7RjcWbpRZjkSJQph6OxO5qQTygiQ2X+LkfpKf4rp
	Zk4UE9DrMoshhgUdHwgKjLbvma0n1rT8Fr1xs9paeRXib/mLwV/ooq4BW5Pjnluu/eU=
X-Gm-Gg: ASbGncviPjZNZMFN3hbB3WcX8EwzYHKxZWTTXUCuM8F/NWn6TZ2gIPoQLhzmwwZfdh2
	uT6LmYv1rsw0YkCTMpkb7I3Y+D2/aIeAO2UVtDh45KCV7DqNN3ZOb162qtvBEDJ+8SyVyVMVFKA
	se4voMXZgAPOCD81lu4hg+oNB1DDJBZjOtTPjps4XdgaMdu1GeAetEVnjyK3sTZd78Uk7uxprhw
	WqQHpB5D2MKzdDsT12m+6075CtfK2HABukHi/yPbVrbRdwKtwyFMhFGAK9Nh9cHV0kr8Qcs0ass
	mqsWpiLE+m8zAQFz0eywOGWW3xBrg+vjNik8pA1Rb6TzvB3p09gIaTHaWAlInsOrJF6HUbbGURG
	2CknDJdRRz8ThRgggkkJY6FYNl8Bh9mw1+L3qc8CEkfMy00RIB/Z+zdhEQ4BGmep373KW2WmyaI
	a3iZLFlJ0+5rjZmYtw
X-Google-Smtp-Source: AGHT+IF5Qs39BDlH4FucuOdA1sqzrZGMVwFxQQ9MDO96IZI88EJut/t4JwJ9XeWpVghluL43Jxeo4w==
X-Received: by 2002:a17:906:e17:b0:b70:e685:5ac8 with SMTP id a640c23a62f3a-b70e68592a2mr155321866b.3.1762182910631;
        Mon, 03 Nov 2025 07:15:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077975dfdsm1045203066b.13.2025.11.03.07.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 07:15:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 03 Nov 2025 16:14:47 +0100
Subject: [PATCH 07/12] dt-bindings: PCI: qcom,pcie-ipq8074: Move IPQ8074 to
 dedicated schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-dt-bindings-pci-qcom-v1-7-c0f6041abf9b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8349;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=GdnyJiF2SvA5uIAMq/hgOZYgMf4S3fKIQz/rPO1rTps=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpCMbqyfMLniFLiSlsOUX6PInIJYhb4fIEWpFiC
 1OnX5A3fQmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQjG6gAKCRDBN2bmhouD
 1xCCD/9H2YGq3HOAqGewY+jOApb48tKAjtgTFslz6Zipmgbzm2cOUGnH7rkpP06/uCF2qVDsEiO
 D36EB2y9fBbeIQbfHsNorFTN0VdlbA6ulKz1EtSFvyjB5fStfAO87D4G06SWRkTuGbi9zfA1QqK
 EVfAk+Etdecus/VD5TCV25XkqZPKvmxBMognDpjustFAFeNYOMYFkzx9vppR6im0BnsVq5CIrop
 agv4QIAbGBr+oo7VM3wdgCufSueYIx0jKZghEueSvzESYqDZAZvdSnhRHGUcardsb2QOZjnIPCT
 yRUUX/rCOLRKRG8YQqxqJXAQwGZ9iN8BHLwQY5XoHi/eXk/8w7fqxtaG7chN5DvMGy6Z8oinClb
 areKTybBmtfbm/paSmqWX89s2wSNn9BJuEAst3c4GG0BTPe0ZhYhINPfTmkfAx784t2/ojJQvWt
 OwCCu8YxOG5eYBiUt6ZwLNTX6V2P81Zk2OQ+WnVwpbxVlF8l85Zekx2vFohy5IDGEvkRRIHZLnG
 8yYinS+7EBKbUP5ZH6X2PAStU1wozzqOCOAlyhtJU+Eo6oveQ7HJ5z45cNj+hsj3WyjN66f1ETn
 Q9EBQ7hsMoKMNkzQPoo8FqzRZmIk2ZWjEXTu5HOwMDKUc74XIkS3XbxH4AcgSuo4sH2RRXDelsN
 87Gy60sHe5lqeGw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Move IPQ8074 PCIe devices from qcom,pcie.yaml binding to a dedicated
file to make reviewing and maintenance easier.

New schema is equivalent to the old one with few changes:
 - Adding a required compatible, which is actually redundant.
 - Drop the really obvious comments next to clock/reg/reset-names items.
 - Expecting eight MSI interrupts and one global, instead of only one,
   which was incomplete hardware description.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie-ipq8074.yaml | 165 +++++++++++++++++++++
 .../devicetree/bindings/pci/qcom,pcie.yaml         |  35 -----
 2 files changed, 165 insertions(+), 35 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ipq8074.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq8074.yaml
new file mode 100644
index 000000000000..da975f943a7b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq8074.yaml
@@ -0,0 +1,165 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/qcom,pcie-ipq8074.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ8074 PCI Express Root Complex
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Manivannan Sadhasivam <mani@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,pcie-ipq8074
+
+  reg:
+    maxItems: 4
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: elbi
+      - const: parf
+      - const: config
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: iface # PCIe to SysNOC BIU clock
+      - const: axi_m # AXI Master clock
+      - const: axi_s # AXI Slave clock
+      - const: ahb
+      - const: aux
+
+  interrupts:
+    maxItems: 9
+
+  interrupt-names:
+    items:
+      - const: msi0
+      - const: msi1
+      - const: msi2
+      - const: msi3
+      - const: msi4
+      - const: msi5
+      - const: msi6
+      - const: msi7
+      - const: global
+
+  resets:
+    maxItems: 7
+
+  reset-names:
+    items:
+      - const: pipe
+      - const: sleep
+      - const: sticky # Core sticky reset
+      - const: axi_m # AXI master reset
+      - const: axi_s # AXI slave reset
+      - const: ahb
+      - const: axi_m_sticky # AXI master sticky reset
+
+required:
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
+    #include <dt-bindings/clock/qcom,gcc-ipq8074.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pcie@10000000 {
+        compatible = "qcom,pcie-ipq8074";
+        reg = <0x10000000 0xf1d>,
+              <0x10000f20 0xa8>,
+              <0x00088000 0x2000>,
+              <0x10100000 0x1000>;
+        reg-names = "dbi", "elbi", "parf", "config";
+        ranges = <0x81000000 0x0 0x00000000 0x10200000 0x0 0x10000>,   /* I/O */
+                 <0x82000000 0x0 0x10220000 0x10220000 0x0 0xfde0000>; /* MEM */
+
+        device_type = "pci";
+        linux,pci-domain = <1>;
+        bus-range = <0x00 0xff>;
+        num-lanes = <1>;
+        max-link-speed = <2>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        clocks = <&gcc GCC_SYS_NOC_PCIE1_AXI_CLK>,
+                 <&gcc GCC_PCIE1_AXI_M_CLK>,
+                 <&gcc GCC_PCIE1_AXI_S_CLK>,
+                 <&gcc GCC_PCIE1_AHB_CLK>,
+                 <&gcc GCC_PCIE1_AUX_CLK>;
+        clock-names = "iface",
+                      "axi_m",
+                      "axi_s",
+                      "ahb",
+                      "aux";
+
+        interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "msi0",
+                          "msi1",
+                          "msi2",
+                          "msi3",
+                          "msi4",
+                          "msi5",
+                          "msi6",
+                          "msi7",
+                          "global";
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0 0 0 0x7>;
+        interrupt-map = <0 0 0 1 &intc 0 GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+                        <0 0 0 2 &intc 0 GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+                        <0 0 0 3 &intc 0 GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+                        <0 0 0 4 &intc 0 GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+
+        phys = <&pcie_qmp1>;
+        phy-names = "pciephy";
+
+        resets = <&gcc GCC_PCIE1_PIPE_ARES>,
+                 <&gcc GCC_PCIE1_SLEEP_ARES>,
+                 <&gcc GCC_PCIE1_CORE_STICKY_ARES>,
+                 <&gcc GCC_PCIE1_AXI_MASTER_ARES>,
+                 <&gcc GCC_PCIE1_AXI_SLAVE_ARES>,
+                 <&gcc GCC_PCIE1_AHB_ARES>,
+                 <&gcc GCC_PCIE1_AXI_MASTER_STICKY_ARES>;
+        reset-names = "pipe",
+                      "sleep",
+                      "sticky",
+                      "axi_m",
+                      "axi_s",
+                      "ahb",
+                      "axi_m_sticky";
+
+        perst-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
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
index 118b88a81396..992a7654626c 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -23,7 +23,6 @@ properties:
           - qcom,pcie-ipq4019
           - qcom,pcie-ipq8064
           - qcom,pcie-ipq8064-v2
-          - qcom,pcie-ipq8074
           - qcom,pcie-ipq9574
           - qcom,pcie-msm8996
       - items:
@@ -144,7 +143,6 @@ allOf:
               - qcom,pcie-ipq4019
               - qcom,pcie-ipq8064
               - qcom,pcie-ipq8064v2
-              - qcom,pcie-ipq8074
     then:
       properties:
         reg:
@@ -315,37 +313,6 @@ allOf:
         resets: false
         reset-names: false
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,pcie-ipq8074
-    then:
-      properties:
-        clocks:
-          minItems: 5
-          maxItems: 5
-        clock-names:
-          items:
-            - const: iface # PCIe to SysNOC BIU clock
-            - const: axi_m # AXI Master clock
-            - const: axi_s # AXI Slave clock
-            - const: ahb # AHB clock
-            - const: aux # Auxiliary clock
-        resets:
-          minItems: 7
-          maxItems: 7
-        reset-names:
-          items:
-            - const: pipe # PIPE reset
-            - const: sleep # Sleep reset
-            - const: sticky # Core Sticky reset
-            - const: axi_m # AXI Master reset
-            - const: axi_s # AXI Slave reset
-            - const: ahb # AHB Reset
-            - const: axi_m_sticky # AXI Master Sticky reset
-
   - if:
       properties:
         compatible:
@@ -405,7 +372,6 @@ allOf:
                 - qcom,pcie-ipq4019
                 - qcom,pcie-ipq8064
                 - qcom,pcie-ipq8064v2
-                - qcom,pcie-ipq8074
                 - qcom,pcie-ipq9574
     then:
       required:
@@ -428,7 +394,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,pcie-ipq8074
               - qcom,pcie-msm8996
               - qcom,pcie-msm8998
     then:

-- 
2.48.1


