Return-Path: <linux-arm-msm+bounces-393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7057E7655
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 02:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04CF72808F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 01:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405B4ED1;
	Fri, 10 Nov 2023 01:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D+MlE57f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C611F627
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 01:04:53 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F00303C02
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 17:04:52 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4079ed65471so10925535e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Nov 2023 17:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699578291; x=1700183091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qK0Mri4kH+Sc380TRw3YrVJQEBy/I1E3gWwQ3RrbihQ=;
        b=D+MlE57foKxNfd9vS9Qm3tGQ9Rb9PUb2PiV+TycMpB5y9H3X3+77/1C3txBMoZiakN
         b2O8c3yxbykZbjHXICvR0oJTrAL+3EvVM8Fz+SQ0ajCVnQQu4J82EH3zP/laPeoSzK1p
         llsjWm+i9DYAWDAI2AtOBl27PK/z/R7DL89f7nxtwzc7w81McDCHLjKbnMRNxS1Pl1v4
         q00irPL5ezcWN0Lft17uCfQ/XY7n/w1dAq3Zw/Aa/69F32fON1sMTWpyo5etpz+I6mZu
         3TwDdIOA0YLurhAf/uwUwJsjZ5p1wEb7Xa1WpsHATudU+8RHygNGg2mpL/Q5s1Y81WHj
         hK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699578291; x=1700183091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qK0Mri4kH+Sc380TRw3YrVJQEBy/I1E3gWwQ3RrbihQ=;
        b=rrFfdE/0jjIVaMyAW0c4lD0l+co/SzaonlBZ9568Sy+UVoU97P+n1G9chEmMdb3wBU
         91CUCM3+0nPKTYOKnLzum410t1EnrrShIxTwG7lXNee0Z+JZ+e84jizFLkV9fwNxoAuV
         DeN4lH83shjpOnnhQKLY5sspnjQhuniC888iXX07xioTGzw2wJmr70OK/iLtf4B/ZqZy
         dsLtA3JbkFHwN4bZ7Sb4279USGmjC+a5i+OgWZRBwgknxk64qpizEHhv3N0hQqUHzmIZ
         lG3TmM9YIE4jVmvdViuEIf6CN1lv7SBuuPm1Dikw91hfoDXVuRq+FQGbN0oRW14DOtgA
         BvHA==
X-Gm-Message-State: AOJu0YxOuBzsX+uHCH4VbuyCDPWZBnRYnHx+rtbmdOqfiOUpA7oMRyZu
	XB8T7Vuv9wXG4LG+WHc3pYZXPA==
X-Google-Smtp-Source: AGHT+IHI/xt7etjdEIbzJp+X4efL7BVdjKrWmEraDh2nBcUnj10J3bOrGYet8fAIjM3M+F8X9ST5rw==
X-Received: by 2002:a05:600c:5102:b0:408:57bb:ef96 with SMTP id o2-20020a05600c510200b0040857bbef96mr5438757wms.30.1699578291285;
        Thu, 09 Nov 2023 17:04:51 -0800 (PST)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id d1-20020a056000114100b00326f0ca3566sm820562wrx.50.2023.11.09.17.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 17:04:50 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 10 Nov 2023 01:04:46 +0000
Subject: [PATCH v5 1/6] media: dt-bindings: media: camss: Add
 qcom,sc8280xp-camss binding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231110-b4-camss-sc8280xp-v5-1-7f4947cc59c8@linaro.org>
References: <20231110-b4-camss-sc8280xp-v5-0-7f4947cc59c8@linaro.org>
In-Reply-To: <20231110-b4-camss-sc8280xp-v5-0-7f4947cc59c8@linaro.org>
To: hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org, 
 matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3

Add bindings for qcom,sc8280xp-camss in order to support the camera
subsystem for sc8280xp as found in the Lenovo x13s Laptop.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/qcom,sc8280xp-camss.yaml        | 512 +++++++++++++++++++++
 1 file changed, 512 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
new file mode 100644
index 0000000000000..c0bc31709873c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
@@ -0,0 +1,512 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sc8280xp-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SC8280XP Camera Subsystem (CAMSS)
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,sc8280xp-camss
+
+  clocks:
+    maxItems: 40
+
+  clock-names:
+    items:
+      - const: camnoc_axi
+      - const: cpas_ahb
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: csiphy3
+      - const: csiphy3_timer
+      - const: vfe0_axi
+      - const: vfe0
+      - const: vfe0_cphy_rx
+      - const: vfe0_csid
+      - const: vfe1_axi
+      - const: vfe1
+      - const: vfe1_cphy_rx
+      - const: vfe1_csid
+      - const: vfe2_axi
+      - const: vfe2
+      - const: vfe2_cphy_rx
+      - const: vfe2_csid
+      - const: vfe3_axi
+      - const: vfe3
+      - const: vfe3_cphy_rx
+      - const: vfe3_csid
+      - const: vfe_lite0
+      - const: vfe_lite0_cphy_rx
+      - const: vfe_lite0_csid
+      - const: vfe_lite1
+      - const: vfe_lite1_cphy_rx
+      - const: vfe_lite1_csid
+      - const: vfe_lite2
+      - const: vfe_lite2_cphy_rx
+      - const: vfe_lite2_csid
+      - const: vfe_lite3
+      - const: vfe_lite3_cphy_rx
+      - const: vfe_lite3_csid
+      - const: gcc_axi_hf
+      - const: gcc_axi_sf
+
+  interrupts:
+    maxItems: 20
+
+  interrupt-names:
+    items:
+      - const: csid1_lite
+      - const: vfe_lite1
+      - const: csiphy3
+      - const: csid0
+      - const: vfe0
+      - const: csid1
+      - const: vfe1
+      - const: csid0_lite
+      - const: vfe_lite0
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csid2
+      - const: vfe2
+      - const: csid3_lite
+      - const: csid2_lite
+      - const: vfe_lite3
+      - const: vfe_lite2
+      - const: csid3
+      - const: vfe3
+
+  iommus:
+    maxItems: 16
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: cam_ahb
+      - const: cam_hf_mnoc
+      - const: cam_sf_mnoc
+      - const: cam_sf_icp_mnoc
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE3 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: ife2
+      - const: ife3
+      - const: top
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
+          Input port for receiving CSI data from CSIPHY0.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data from CSIPHY1.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data from CSIPHY2.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@3:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data from CSIPHY3.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+  reg:
+    maxItems: 20
+
+  reg-names:
+    items:
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy0
+      - const: csiphy1
+      - const: vfe0
+      - const: csid0
+      - const: vfe1
+      - const: csid1
+      - const: vfe2
+      - const: csid2
+      - const: vfe_lite0
+      - const: csid0_lite
+      - const: vfe_lite1
+      - const: csid1_lite
+      - const: vfe_lite2
+      - const: csid2_lite
+      - const: vfe_lite3
+      - const: csid3_lite
+      - const: vfe3
+      - const: csid3
+
+  vdda-phy-supply:
+    description:
+      Phandle to a regulator supply to PHY core block.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.8V regulator supply to PHY refclk pll block.
+
+required:
+  - clock-names
+  - clocks
+  - compatible
+  - interconnects
+  - interconnect-names
+  - interrupts
+  - interrupt-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - reg
+  - reg-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
+    #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
+    #include <dt-bindings/interconnect/qcom,sc8280xp.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss: camss@ac5a000 {
+            compatible = "qcom,sc8280xp-camss";
+
+            reg = <0 0x0ac5a000 0 0x2000>,
+                  <0 0x0ac5c000 0 0x2000>,
+                  <0 0x0ac65000 0 0x2000>,
+                  <0 0x0ac67000 0 0x2000>,
+                  <0 0x0acaf000 0 0x4000>,
+                  <0 0x0acb3000 0 0x1000>,
+                  <0 0x0acb6000 0 0x4000>,
+                  <0 0x0acba000 0 0x1000>,
+                  <0 0x0acbd000 0 0x4000>,
+                  <0 0x0acc1000 0 0x1000>,
+                  <0 0x0acc4000 0 0x4000>,
+                  <0 0x0acc8000 0 0x1000>,
+                  <0 0x0accb000 0 0x4000>,
+                  <0 0x0accf000 0 0x1000>,
+                  <0 0x0acd2000 0 0x4000>,
+                  <0 0x0acd6000 0 0x1000>,
+                  <0 0x0acd9000 0 0x4000>,
+                  <0 0x0acdd000 0 0x1000>,
+                  <0 0x0ace0000 0 0x4000>,
+                  <0 0x0ace4000 0 0x1000>;
+
+            reg-names = "csiphy2",
+                        "csiphy3",
+                        "csiphy0",
+                        "csiphy1",
+                        "vfe0",
+                        "csid0",
+                        "vfe1",
+                        "csid1",
+                        "vfe2",
+                        "csid2",
+                        "vfe_lite0",
+                        "csid0_lite",
+                        "vfe_lite1",
+                        "csid1_lite",
+                        "vfe_lite2",
+                        "csid2_lite",
+                        "vfe_lite3",
+                        "csid3_lite",
+                        "vfe3",
+                        "csid3";
+
+            vdda-phy-supply = <&vreg_l6d>;
+            vdda-pll-supply = <&vreg_l4d>;
+
+            interrupts = <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 758 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 759 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 760 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 762 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
+
+            interrupt-names = "csid1_lite",
+                              "vfe_lite1",
+                              "csiphy3",
+                              "csid0",
+                              "vfe0",
+                              "csid1",
+                              "vfe1",
+                              "csid0_lite",
+                              "vfe_lite0",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "csid2",
+                              "vfe2",
+                              "csid3_lite",
+                              "csid2_lite",
+                              "vfe_lite3",
+                              "vfe_lite2",
+                              "csid3",
+                              "vfe3";
+
+            power-domains = <&camcc IFE_0_GDSC>,
+                            <&camcc IFE_1_GDSC>,
+                            <&camcc IFE_2_GDSC>,
+                            <&camcc IFE_3_GDSC>,
+                            <&camcc TITAN_TOP_GDSC>;
+
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "ife2",
+                                 "ife3",
+                                 "top";
+
+            clocks = <&camcc CAMCC_CAMNOC_AXI_CLK>,
+                     <&camcc CAMCC_CPAS_AHB_CLK>,
+                     <&camcc CAMCC_CSIPHY0_CLK>,
+                     <&camcc CAMCC_CSI0PHYTIMER_CLK>,
+                     <&camcc CAMCC_CSIPHY1_CLK>,
+                     <&camcc CAMCC_CSI1PHYTIMER_CLK>,
+                     <&camcc CAMCC_CSIPHY2_CLK>,
+                     <&camcc CAMCC_CSI2PHYTIMER_CLK>,
+                     <&camcc CAMCC_CSIPHY3_CLK>,
+                     <&camcc CAMCC_CSI3PHYTIMER_CLK>,
+                     <&camcc CAMCC_IFE_0_AXI_CLK>,
+                     <&camcc CAMCC_IFE_0_CLK>,
+                     <&camcc CAMCC_IFE_0_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_0_CSID_CLK>,
+                     <&camcc CAMCC_IFE_1_AXI_CLK>,
+                     <&camcc CAMCC_IFE_1_CLK>,
+                     <&camcc CAMCC_IFE_1_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_1_CSID_CLK>,
+                     <&camcc CAMCC_IFE_2_AXI_CLK>,
+                     <&camcc CAMCC_IFE_2_CLK>,
+                     <&camcc CAMCC_IFE_2_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_2_CSID_CLK>,
+                     <&camcc CAMCC_IFE_3_AXI_CLK>,
+                     <&camcc CAMCC_IFE_3_CLK>,
+                     <&camcc CAMCC_IFE_3_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_3_CSID_CLK>,
+                     <&camcc CAMCC_IFE_LITE_0_CLK>,
+                     <&camcc CAMCC_IFE_LITE_0_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_LITE_0_CSID_CLK>,
+                     <&camcc CAMCC_IFE_LITE_1_CLK>,
+                     <&camcc CAMCC_IFE_LITE_1_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_LITE_1_CSID_CLK>,
+                     <&camcc CAMCC_IFE_LITE_2_CLK>,
+                     <&camcc CAMCC_IFE_LITE_2_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_LITE_2_CSID_CLK>,
+                     <&camcc CAMCC_IFE_LITE_3_CLK>,
+                     <&camcc CAMCC_IFE_LITE_3_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_LITE_3_CSID_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>;
+
+            clock-names = "camnoc_axi",
+                          "cpas_ahb",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "csiphy3",
+                          "csiphy3_timer",
+                          "vfe0_axi",
+                          "vfe0",
+                          "vfe0_cphy_rx",
+                          "vfe0_csid",
+                          "vfe1_axi",
+                          "vfe1",
+                          "vfe1_cphy_rx",
+                          "vfe1_csid",
+                          "vfe2_axi",
+                          "vfe2",
+                          "vfe2_cphy_rx",
+                          "vfe2_csid",
+                          "vfe3_axi",
+                          "vfe3",
+                          "vfe3_cphy_rx",
+                          "vfe3_csid",
+                          "vfe_lite0",
+                          "vfe_lite0_cphy_rx",
+                          "vfe_lite0_csid",
+                          "vfe_lite1",
+                          "vfe_lite1_cphy_rx",
+                          "vfe_lite1_csid",
+                          "vfe_lite2",
+                          "vfe_lite2_cphy_rx",
+                          "vfe_lite2_csid",
+                          "vfe_lite3",
+                          "vfe_lite3_cphy_rx",
+                          "vfe_lite3_csid",
+                          "gcc_axi_hf",
+                          "gcc_axi_sf";
+
+
+            iommus = <&apps_smmu 0x2000 0x4e0>,
+                     <&apps_smmu 0x2020 0x4e0>,
+                     <&apps_smmu 0x2040 0x4e0>,
+                     <&apps_smmu 0x2060 0x4e0>,
+                     <&apps_smmu 0x2080 0x4e0>,
+                     <&apps_smmu 0x20e0 0x4e0>,
+                     <&apps_smmu 0x20c0 0x4e0>,
+                     <&apps_smmu 0x20a0 0x4e0>,
+                     <&apps_smmu 0x2400 0x4e0>,
+                     <&apps_smmu 0x2420 0x4e0>,
+                     <&apps_smmu 0x2440 0x4e0>,
+                     <&apps_smmu 0x2460 0x4e0>,
+                     <&apps_smmu 0x2480 0x4e0>,
+                     <&apps_smmu 0x24e0 0x4e0>,
+                     <&apps_smmu 0x24c0 0x4e0>,
+                     <&apps_smmu 0x24a0 0x4e0>;
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,
+                            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>,
+                            <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI1 0>,
+                            <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI1 0>;
+            interconnect-names = "cam_ahb",
+                                 "cam_hf_mnoc",
+                                 "cam_sf_mnoc",
+                                 "cam_sf_icp_mnoc";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    csiphy_ep0: endpoint@0 {
+                        reg = <0>;
+                        clock-lanes = <7>;
+                        data-lanes = <0 1>;
+                        remote-endpoint = <&sensor_ep>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.42.0


