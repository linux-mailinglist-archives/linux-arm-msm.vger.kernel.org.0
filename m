Return-Path: <linux-arm-msm+bounces-51080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE39FA5D3A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 01:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2AD2164ED2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 00:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80ED420ED;
	Wed, 12 Mar 2025 00:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DsNVwnvV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323B04C9D
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 00:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741738309; cv=none; b=gZb0PwZonwNN+LSPQoo8a6OTruj6dgAPdzRACms8GJMGcENQBIDxu5KaGEyRh6bsub2Et48KbSzOWBLbjbIfHxSKzFW2gbha5fm+/Bf8oStIltRVLEQeBvSuap55qbiaUQx6CwtUrJwRB8M/m7KxN9xXFp01tqoYB7BLBrx+gWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741738309; c=relaxed/simple;
	bh=ae5oExVPCwTa7HMijRHoUgPuvovKshcsblUiJkwGcB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kh8ncXJCU8FPLr9eG9tbTJYLHCQL7ItwzGjzw53gjJEhMmdcA4JXGJFVcxSpyrvHDpP+06nEHDWdlz1BtmXwlh+Q3aPfg7eTNinz4I/wAro6kMedmv/X/qt/AMcxc8CNV9rsUF5b22zPOlxnPpWjbMf7avKzOlmwYD2qrBRa2tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DsNVwnvV; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5494fe13a6eso888432e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 17:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741738305; x=1742343105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxAaCDtCfs7j3JvPjpAZeHOf5iTFlveHcIHRwVmWyo4=;
        b=DsNVwnvVRmHQ8yzTb+vBU8SUP4P97NHfH/FwQ1MzFvhMf1rED+9fB+pvpWoOy6Hc93
         M3OMgT8ah6lMNi8bz1O1FOOglR4uKmBA4p7Tb0qvb+kjYSOeKS3l8PQlIBtawwxHNrHv
         TmA+8GXE2KKdY7CAQxeg2eZaeuwNcGqQDLe+7yj6akx22aB5Ew9y504gxIONrjQ7NSj0
         ggvHo025DmcLvDx1acL+tS48wqMTcKg2We5t/kbawDWG4+JEq/wuMmSjsYlzm0e7VeqO
         l3K0stMmjLASxVQVuoTBAk+Xai7RvSZvu4CHbP6grRFE5a4XnbpsTt/913JjmX7Rm9JE
         VbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741738305; x=1742343105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxAaCDtCfs7j3JvPjpAZeHOf5iTFlveHcIHRwVmWyo4=;
        b=Z6eGjZxXV9fIls4DjUCqouP4uI+CKnZO65LQd7QxTkAxkGbYjV4ip/SofmAX5a6I/3
         qNquIoOB8FJjCO9X6/XrldPTbGxzuYtpaY339Tg5u4IKonmAJMry/2xw7xR5/CRvFYxj
         COIOF4SZhac5fYwLSEBuAVssmH63JtAz0bo6ETiQdwfVIavxN4zfxo55APpKKMD4yHqN
         Ddo2sgB8Z6KMMbRF4YYXpIRimtZUITpJFx7QVP2WAz1rJPUdRxf9KLROl609KRQtb+Mb
         IYWRcxkbdbUmuiX3NLX0MybMUiJ5xd9azxflc2Vf+OLe6GKfyAnw1htpoFbdvBpb3qD0
         GY0A==
X-Forwarded-Encrypted: i=1; AJvYcCW6o8vqGyPZbTRSjXFxp802NEfRXXqeI5TXkP6WwzD/FJrb2lQsyCn5+e9+i3Odg7jgr7qOuSWkhYqSrJPe@vger.kernel.org
X-Gm-Message-State: AOJu0YxCi6TEHIe+M8Kt6Dpn7hp/QmjMuzgQuIawW45iukcIiXEJW8Ya
	/U7kWBCUeJCmynhgcbhUuqW/Bvf/QeezC0Q6eUo4QgkTIN9xI8jDMRFdWFeaeBQ=
X-Gm-Gg: ASbGncvE52RNAckz1q/N0LIch9hmib6B7oV8n94BIVj9bkr9ynlg/6J/sVcigGacOsy
	cSarrzSCWUaPhYXz5hk/xlZ0N5JN6ir0GC9JxB3fyeEx0bfPCDOeB1Qji156Im6CEhvkcWT+Pq4
	jgWnTNnVq27xaCEm9I/gLjUnLhWNFp36keOeteq8s2U6H8oFbe+unvf+NBzrle1XJTOjFOnimal
	3W0BznEr1qouOIt5oPIPUJIJa/tqygtm/QO3NTtiaw7ydRtLjzdghbvFGK8RlHhAh/LkkI5GdE6
	jiVs0dJbXdWX2n4p6D2/8wSN7fWUyXGyl722w+ANOhMKwpR9ql9wWknCGCDF0T/F9JLhOJ/JFA5
	q4o7vgw8mYDdzwnfGPEeKaRKZYIXTH4DyFQ==
X-Google-Smtp-Source: AGHT+IGnia0EH9NAPzXUgKcfR/Ghs3dObCPNidqSwsvmWgOPlImM7TvcWBz+XGCZ8384jRC7OFueWA==
X-Received: by 2002:a05:651c:150b:b0:308:ec50:e828 with SMTP id 38308e7fff4ca-30c2054872emr8056831fa.0.1741738305184;
        Tue, 11 Mar 2025 17:11:45 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bfe741fadsm15984251fa.10.2025.03.11.17.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 17:11:43 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: media: Describe Qualcomm SM8650 CAMSS IP
Date: Wed, 12 Mar 2025 02:11:30 +0200
Message-ID: <20250312001132.1832655-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250312001132.1832655-1-vladimir.zapolskiy@linaro.org>
References: <20250312001132.1832655-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for Qualcomm SM8650 camera subsystem.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../bindings/media/qcom,sm8650-camss.yaml     | 389 ++++++++++++++++++
 1 file changed, 389 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
new file mode 100644
index 000000000000..c405d4e1f81d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
@@ -0,0 +1,389 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm8650-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8650 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,sm8650-camss
+
+  reg:
+    maxItems: 17
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csid_wrapper
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: csiphy5
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 36
+
+  clock-names:
+    items:
+      - const: camnoc_axi_nrt
+      - const: camnoc_axi_rt
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_vfe0
+      - const: cpas_vfe1
+      - const: cpas_vfe2
+      - const: cpas_vfe_lite
+      - const: csid
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: csiphy3
+      - const: csiphy3_timer
+      - const: csiphy4
+      - const: csiphy4_timer
+      - const: csiphy5
+      - const: csiphy5_timer
+      - const: csiphy_rx
+      - const: gcc_ahb_clk
+      - const: gcc_axi_hf
+      - const: gcc_axi_sf
+      - const: qdss_debug_xo
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe2
+      - const: vfe2_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+
+  interrupts:
+    maxItems: 16
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: csiphy5
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  iommus:
+    maxItems: 3
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_0_mnoc
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: ife2
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    properties:
+      "^port@[0-5]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+
+        description:
+          Input port for receiving CSI data from a CSIPHY.
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
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+  vdda-csi01-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to CSIPHY0 and CSIPHY1 IP blocks.
+
+  vdda-csi24-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to CSIPHY2 and CSIPHY4 IP blocks.
+
+  vdda-csi35-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to CSIPHY3 and CSIPHY5 IP blocks.
+
+  vdda-csi01-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY0 and CSIPHY1 IP blocks.
+
+  vdda-csi24-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY2 and CSIPHY4 IP blocks.
+
+  vdda-csi35-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY3 and CSIPHY5 IP blocks.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interconnects
+  - interconnect-names
+  - interrupts
+  - interrupt-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm8650-camcc.h>
+    #include <dt-bindings/clock/qcom,sm8650-gcc.h>
+    #include <dt-bindings/interconnect/qcom,sm8650-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@acb8000 {
+            compatible = "qcom,sm8650-camss";
+            reg = <0 0x0acb8000 0 0x1000>,
+                  <0 0x0acba000 0 0x1000>,
+                  <0 0x0acbc000 0 0x1000>,
+                  <0 0x0accb000 0 0x1000>,
+                  <0 0x0acd0000 0 0x1000>,
+                  <0 0x0acb6000 0 0x1000>,
+                  <0 0x0ace4000 0 0x2000>,
+                  <0 0x0ace6000 0 0x2000>,
+                  <0 0x0ace8000 0 0x2000>,
+                  <0 0x0acea000 0 0x2000>,
+                  <0 0x0acec000 0 0x2000>,
+                  <0 0x0acee000 0 0x2000>,
+                  <0 0x0ac62000 0 0xf000>,
+                  <0 0x0ac71000 0 0xf000>,
+                  <0 0x0ac80000 0 0xf000>,
+                  <0 0x0accc000 0 0x2000>,
+                  <0 0x0acd1000 0 0x2000>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csid_wrapper",
+                        "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "csiphy3",
+                        "csiphy4",
+                        "csiphy5",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite0",
+                        "vfe_lite1";
+            clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+                     <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_2_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSIPHY0_CLK>,
+                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY1_CLK>,
+                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY2_CLK>,
+                     <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY3_CLK>,
+                     <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY4_CLK>,
+                     <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY5_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&gcc GCC_CAMERA_AHB_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_1_CLK>,
+                     <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_2_CLK>,
+                     <&camcc CAM_CC_IFE_2_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+            clock-names = "camnoc_axi_nrt",
+                          "camnoc_axi_rt",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_vfe0",
+                          "cpas_vfe1",
+                          "cpas_vfe2",
+                          "cpas_vfe_lite",
+                          "csid",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "csiphy3",
+                          "csiphy3_timer",
+                          "csiphy4",
+                          "csiphy4_timer",
+                          "csiphy5",
+                          "csiphy5_timer",
+                          "csiphy_rx",
+                          "gcc_ahb_clk",
+                          "gcc_axi_hf",
+                          "gcc_axi_sf",
+                          "qdss_debug_xo",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe2",
+                          "vfe2_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid";
+            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 602 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 688 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "csiphy3",
+                              "csiphy4",
+                              "csiphy5",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite0",
+                              "vfe_lite1";
+            interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,
+                            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>;
+            interconnect-names = "ahb",
+                                 "hf_0_mnoc";
+            iommus = <&apps_smmu 0x800 0x20>,
+                     <&apps_smmu 0x18a0 0x40>,
+                     <&apps_smmu 0x1860 0x00>;
+            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+                            <&camcc CAM_CC_IFE_1_GDSC>,
+                            <&camcc CAM_CC_IFE_2_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+            power-domain-names = "ife0", "ife1", "ife2", "top";
+
+            vdda-csi01-0p9-supply = <&vreg_0p9>;
+            vdda-csi01-1p2-supply = <&vreg_1p2>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@1 {
+                    reg = <1>;
+
+                    csiphy1_ep: endpoint {
+                        clock-lanes = <4>;
+                        data-lanes = <0 1>;
+                        remote-endpoint = <&camera_sensor>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.45.2


