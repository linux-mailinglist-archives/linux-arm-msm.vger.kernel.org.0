Return-Path: <linux-arm-msm+bounces-36838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ABD9BA2CD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 23:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C35ABB22310
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 22:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D3A1ADFEC;
	Sat,  2 Nov 2024 22:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="TnyKOJdY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E52A1684A2;
	Sat,  2 Nov 2024 22:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730587186; cv=none; b=DQi8wJQJHor7u9czB6d0pjYdlw456znrz4W+Wgjf+GKgzJWagoGfs20sTAlIDgvvvRMgqVmiEmjCThWurk3Ya9an0f9ohWk3UB+NSI/iCpz9tjIN4J5hp7o0shkvftZNGQf9dhHoO/9tq/wxh0UJ1zCngFUW4zChnSCviOGyuJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730587186; c=relaxed/simple;
	bh=U2cKicJDV3+340LonuEhMsuu8dVQd/fhoacIGrUWyAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M4B5OtzaK3lta4p1+QdHdSwVhcMt3mLy022a+8RK3OZJtDQSaS8ZlE9UF3LxWZuH+UexBCQ0BIOQ2TzFZNxdIOlj0Htq47TH7+ah78GLYBDiPLEgvDogmdiNf/iHom+qKfJqaAoEQhiaSJEREhrbw5z7QBOBbGgEHf//mjVfHLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=TnyKOJdY; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.0.162] (254C1E29.nat.pool.telekom.hu [37.76.30.41])
	by mail.mainlining.org (Postfix) with ESMTPSA id 6B043E45BC;
	Sat,  2 Nov 2024 22:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1730587176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=txUUG58DC98ueKOLNNpJmFcYJA6+bDfYM4c8u7YMdGk=;
	b=TnyKOJdYWnI+JdTf0tWYhZuljLQs+YbIeREfsJr2vZsPFNKnohmsKfx8IVfAHhp+jugHJw
	574tI0cYVf8odA+jRzti2iEmNKuRd9T41GIHwVggIYdgcVOCftj1yiSa4Dq9iwCEuP2cRq
	x9otO7diTcD95hMWktFrY1VY1zCnnzhSvPsimWU/Ul4JyHOwAIzyM50/JU7bkVIdsWUjli
	a0RTg00ZZEW/lU70zMZvuxWr4oZDE2zqmNMbp06ipXLCUWC/UQJhnrgjfVk+pMzAOAmUnD
	Y8ldULyJyV2jb8TEFvARWCzgvaOxUQvmzkjr9GmWZFeWCgg8o+vp9cJdGsMtEg==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sat, 02 Nov 2024 23:39:13 +0100
Subject: [PATCH v3 2/3] media: dt-bindings: media: camss: Add
 qcom,msm8953-camss
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241102-camss-msm8953-v3-2-7041c9fa7a58@mainlining.org>
References: <20241102-camss-msm8953-v3-0-7041c9fa7a58@mainlining.org>
In-Reply-To: <20241102-camss-msm8953-v3-0-7041c9fa7a58@mainlining.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Barnabas Czeman <barnabas.czeman@mainlining.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730587174; l=10277;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=U2cKicJDV3+340LonuEhMsuu8dVQd/fhoacIGrUWyAQ=;
 b=0gIF1OPT956/jMaGtmJrN5PnUE6dq//hRkQwXMa+ZVyhvuS2LVKJiBrMQbODQtYWlUzDVHz+4
 mPauEu3pzR3AJLMN7nm9UyerHSDQBfgLv+KUvu+zm3l6Ono4P6tWq0a
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add bindings for qcom,msm8953-camss in order to support the camera
subsystem for MSM8953.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../bindings/media/qcom,msm8953-camss.yaml         | 322 +++++++++++++++++++++
 1 file changed, 322 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8856fba385b1123d748199b46c5009c97700ad9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml
@@ -0,0 +1,322 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,msm8953-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8953 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Barnabas Czeman <barnabas.czeman@mainlining.org>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
+
+properties:
+  compatible:
+    const: qcom,msm8953-camss
+
+  clocks:
+    minItems: 30
+    maxItems: 30
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: csi0
+      - const: csi0_ahb
+      - const: csi0_phy
+      - const: csi0_pix
+      - const: csi0_rdi
+      - const: csi1
+      - const: csi1_ahb
+      - const: csi1_phy
+      - const: csi1_pix
+      - const: csi1_rdi
+      - const: csi2
+      - const: csi2_ahb
+      - const: csi2_phy
+      - const: csi2_pix
+      - const: csi2_rdi
+      - const: csi_vfe0
+      - const: csi_vfe1
+      - const: csiphy0_timer
+      - const: csiphy1_timer
+      - const: csiphy2_timer
+      - const: ispif_ahb
+      - const: micro_ahb
+      - const: top_ahb
+      - const: vfe0
+      - const: vfe0_ahb
+      - const: vfe0_axi
+      - const: vfe1
+      - const: vfe1_ahb
+      - const: vfe1_axi
+
+  interrupts:
+    minItems: 9
+    maxItems: 9
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: ispif
+      - const: vfe0
+      - const: vfe1
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    items:
+      - description: VFE0 GDSC - Video Front End, Global Distributed Switch Controller.
+      - description: VFE1 GDSC - Video Front End, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: vfe0
+      - const: vfe1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                description:
+                  An array of physical data lanes indexes.
+                  Position of an entry determines the logical
+                  lane number, while the value of an entry
+                  indicates physical lane index. Lane swapping
+                  is supported. Physical lane indexes;
+                  0, 2, 3, 4.
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - data-lanes
+
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - data-lanes
+
+  reg:
+    minItems: 13
+    maxItems: 13
+
+  reg-names:
+    items:
+      - const: csi_clk_mux
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csiphy0
+      - const: csiphy0_clk_mux
+      - const: csiphy1
+      - const: csiphy1_clk_mux
+      - const: csiphy2
+      - const: csiphy2_clk_mux
+      - const: ispif
+      - const: vfe0
+      - const: vfe1
+
+  vdda-supply:
+    description:
+      Definition of the regulator used as analog power supply.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - vdda-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-msm8953.h>
+
+    camss: camss@1b00020 {
+        compatible = "qcom,msm8953-camss";
+
+        reg = <0x1b00020 0x10>,
+              <0x1b30000 0x100>,
+              <0x1b30400 0x100>,
+              <0x1b30800 0x100>,
+              <0x1b34000 0x1000>,
+              <0x1b00030 0x4>,
+              <0x1b35000 0x1000>,
+              <0x1b00038 0x4>,
+              <0x1b36000 0x1000>,
+              <0x1b00040 0x4>,
+              <0x1b31000 0x500>,
+              <0x1b10000 0x1000>,
+              <0x1b14000 0x1000>;
+        reg-names = "csi_clk_mux",
+                    "csid0",
+                    "csid1",
+                    "csid2",
+                    "csiphy0",
+                    "csiphy0_clk_mux",
+                    "csiphy1",
+                    "csiphy1_clk_mux",
+                    "csiphy2",
+                    "csiphy2_clk_mux",
+                    "ispif",
+                    "vfe0",
+                    "vfe1";
+
+        clocks = <&gcc GCC_CAMSS_AHB_CLK>,
+                 <&gcc GCC_CAMSS_CSI0_CLK>,
+                 <&gcc GCC_CAMSS_CSI0_AHB_CLK>,
+                 <&gcc GCC_CAMSS_CSI0PHY_CLK>,
+                 <&gcc GCC_CAMSS_CSI0PIX_CLK>,
+                 <&gcc GCC_CAMSS_CSI0RDI_CLK>,
+                 <&gcc GCC_CAMSS_CSI1_CLK>,
+                 <&gcc GCC_CAMSS_CSI1_AHB_CLK>,
+                 <&gcc GCC_CAMSS_CSI1PHY_CLK>,
+                 <&gcc GCC_CAMSS_CSI1PIX_CLK>,
+                 <&gcc GCC_CAMSS_CSI1RDI_CLK>,
+                 <&gcc GCC_CAMSS_CSI2_CLK>,
+                 <&gcc GCC_CAMSS_CSI2_AHB_CLK>,
+                 <&gcc GCC_CAMSS_CSI2PHY_CLK>,
+                 <&gcc GCC_CAMSS_CSI2PIX_CLK>,
+                 <&gcc GCC_CAMSS_CSI2RDI_CLK>,
+                 <&gcc GCC_CAMSS_CSI_VFE0_CLK>,
+                 <&gcc GCC_CAMSS_CSI_VFE1_CLK>,
+                 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+                 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+                 <&gcc GCC_CAMSS_CSI2PHYTIMER_CLK>,
+                 <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
+                 <&gcc GCC_CAMSS_MICRO_AHB_CLK>,
+                 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+                 <&gcc GCC_CAMSS_VFE0_CLK>,
+                 <&gcc GCC_CAMSS_VFE0_AHB_CLK>,
+                 <&gcc GCC_CAMSS_VFE0_AXI_CLK>,
+                 <&gcc GCC_CAMSS_VFE1_CLK>,
+                 <&gcc GCC_CAMSS_VFE1_AHB_CLK>,
+                 <&gcc GCC_CAMSS_VFE1_AXI_CLK>;
+        clock-names = "ahb",
+                      "csi0",
+                      "csi0_ahb",
+                      "csi0_phy",
+                      "csi0_pix",
+                      "csi0_rdi",
+                      "csi1",
+                      "csi1_ahb",
+                      "csi1_phy",
+                      "csi1_pix",
+                      "csi1_rdi",
+                      "csi2",
+                      "csi2_ahb",
+                      "csi2_phy",
+                      "csi2_pix",
+                      "csi2_rdi",
+                      "csi_vfe0",
+                      "csi_vfe1",
+                      "csiphy0_timer",
+                      "csiphy1_timer",
+                      "csiphy2_timer",
+                      "ispif_ahb",
+                      "micro_ahb",
+                      "top_ahb",
+                      "vfe0",
+                      "vfe0_ahb",
+                      "vfe0_axi",
+                      "vfe1",
+                      "vfe1_ahb",
+                      "vfe1_axi";
+
+        interrupts = <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 315 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "csid0",
+                          "csid1",
+                          "csid2",
+                          "csiphy0",
+                          "csiphy1",
+                          "csiphy2",
+                          "ispif",
+                          "vfe0",
+                          "vfe1";
+
+        iommus = <&apps_iommu 0x14>;
+
+        power-domains = <&gcc VFE0_GDSC>,
+                        <&gcc VFE1_GDSC>;
+        power-domain-names = "vfe0", "vfe1";
+
+        vdda-supply = <&reg_2v8>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };

-- 
2.47.0


