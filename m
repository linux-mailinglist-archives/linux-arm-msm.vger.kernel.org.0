Return-Path: <linux-arm-msm+bounces-54500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC28A8B88E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 14:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66E91188546F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 12:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97DBE24C67F;
	Wed, 16 Apr 2025 12:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0nKqE6j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D168E23D297
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 12:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805365; cv=none; b=imgxt4Cwu+bV/dTW3gFG7oARKK8+eB5RapBT7twLyVJ0KMbDc/y9wjX3cQ4Mk4gzQyJNnw3/FB7Fp0K8NUJd8vwN004vBaFTf/zpCu6oWR/ZSJyuulyXwqkpu0UUHd0JlAUtDZYFaUIlThpHCYmTmXwXBT4rf+PIfRb1x/rvrxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805365; c=relaxed/simple;
	bh=p2sisv3FaynmKm9MXmyj2FKEdx47s/LAReVhcDfPSNw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KJQBl9nZouTcMhLyUec+ryuZ6EGMO3XNd6buJ/g8pjnO9dI91pMMQqizZKRgiQLXo8jH5jMEvcYsRxWFD1q50qVydwEgr8vBSlx6s7L9YH5TjigxKePvNyC+ZTzvnm9tTuSow3zKGndIGtXjxhUs5tu7xyXJESzheQyi+1Hgkfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0nKqE6j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mIJG000415
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 12:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oCwCmdS+SDe
	7GEj+Sp5OjyZYetJhaZ9LvSjllX9L3iQ=; b=i0nKqE6jCK69pqRbpvTePAOq+Eq
	Zee5qI3QB4aHxZJXKypvABhFcijJksZVlnvvCHoXXDzu+Y6T9gCJP4pbKnNugWV5
	5N7jDALeE4PW7YXd9XNY4QuHzdviOYfXm1Q94HbJtA1nNs+UvDuyg+rV/9yXpQrV
	G05mnP8JOeIOyMd7airUgVrQIux3b3BVhlVPi6kFwb/f/OlCrffUOkQqDmH8zJEG
	l7VmcLjQOxbT+UXx3Dhe5fDQ+edQwCaqQ7SYTNjORWhziGh0HWM7BeusfD0iaC5G
	j0wNcHs6uR75UE9N4W3jqyhHTyglrbfEZOCaRB9oWP/VL9VGMzm7U6zX2sg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vkhs4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 12:09:23 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-72c40592a9aso2388949a34.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 05:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805362; x=1745410162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCwCmdS+SDe7GEj+Sp5OjyZYetJhaZ9LvSjllX9L3iQ=;
        b=Yqo7iTdHFzq15GZj98dpLVpXwDNvToZssDjVRjX7toclIrpNvY8sNDXvLWM7OrJAq4
         N/isPxU1AtBygNg1dHO9PbDBXTYVcdeN00DexDlKkeYENm/sX3etwuG6Fo9ShO8+bOFj
         sHHRCMRQQrNvca59U7Cn9gr18hOnGC1BV1Z+MTjqHexZoXudaPnHVdrr/HQivy0lxlYd
         OUIQRTM19lFX65q0OdPml+FjkpsyigTIiCHxzXc9RFGF+fM2deXz13hmQctHr7y48Ytu
         0jGYgz9f7Yx2h9fH67/Uq2BKoJqeQ20ateDPNL4iO8Eel7kieb81YlEWUYIR2NibLBed
         QGXg==
X-Gm-Message-State: AOJu0YwXm1mQ7G6qC8vISbEVgV1EYVCGm2gWtJQ4HTBtvk2CiCavwIT+
	LodqQ84Rlgdoa4opdOv26i0N2YGPpjBHggDbuFcMV01wIiHCZL9/6M33ZVYVlUy4jgxJdRdlPcw
	FMuZpOSEaKR+9LNpf2ThaCxi9j0ITTntEwr/p/Au242dNdE4BiMpc2ifVcJI0/2Oo
X-Gm-Gg: ASbGnctDl6cbdg6+H+YBVh4jE6BNVZdlvMPhPaLopsUUDtGK/o3atcoxNUzFdSf2x+l
	Pda8AH2r5cE/ZtFbU9fZRJQDRmE4ods8Hqenuqef+ibzER2ZJyM64hI0tuNqF67OXVnshRAu4La
	BtNzq/0mL+jjD8XEt7szMQEGEsE5oid1R6wVVNdzOjWycjzRz8O8NgURlu2yajDoWeRCUAtZgqv
	K4xKSLn0VcnikdGm/CcobIl2CsJuz6+eS7a7dHtRGHggZmLs4RvBXxSbdqVaO92jGZE2SfnPfPP
	W4/oZ9aptsg2PjEuZWdt2KGhJaiYlgLOuZtSRy6HE1coGRQ=
X-Received: by 2002:a05:6808:3203:b0:3f6:a476:f7e0 with SMTP id 5614622812f47-400b01caaabmr911751b6e.9.1744805361979;
        Wed, 16 Apr 2025 05:09:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFznpFYEgBEZNt9B+00ktVcV1ME9H4Y8YDtK6rz2hRIOktahqd7meqmf6jvFuO+P/HM8WFt4A==
X-Received: by 2002:a05:6808:3203:b0:3f6:a476:f7e0 with SMTP id 5614622812f47-400b01caaabmr911734b6e.9.1744805361635;
        Wed, 16 Apr 2025 05:09:21 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:15e4:d866:eb53:4185])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f068968sm8328669a12.35.2025.04.16.05.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 05:09:21 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 5/6] media: dt-bindings: media: camss: Add qcom,qcm2290-camss binding
Date: Wed, 16 Apr 2025 14:09:07 +0200
Message-Id: <20250416120908.206873-5-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Q-HKYnS_AH_Ai8vzL25m90RJci6JvbVc
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67ff9df3 cx=c_pps a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=JlZtY4oE0OGdv2NQSfYA:9 a=Z1Yy7GAxqfX1iEi80vsk:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: Q-HKYnS_AH_Ai8vzL25m90RJci6JvbVc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160099

Add bindings for qcom,qcm2290-camss in order to support the camera
subsystem found in the Qualcomm Robotics RB1 Platform (QRB2210).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss.yaml    | 246 ++++++++++++++++++
 1 file changed, 246 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
new file mode 100644
index 000000000000..dc53f445a90b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -0,0 +1,246 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCM2290 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-camss
+
+  reg:
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csiphy0
+      - const: csiphy1
+      - const: vfe0
+      - const: vfe1
+
+  clocks:
+    maxItems: 15
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: axi
+      - const: top_ahb
+      - const: csi0
+      - const: csi1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy0_timer
+      - const: csiphy1_timer
+      - const: vfe0
+      - const: vfe1
+      - const: vfe0_cphy_rx
+      - const: vfe1_cphy_rx
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+
+  interrupts:
+    maxItems: 6
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csiphy0
+      - const: csiphy1
+      - const: vfe0
+      - const: vfe1
+
+  interconnects:
+    maxItems: 3
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+      - const: sf_mnoc
+
+  iommus:
+    maxItems: 4
+
+  power-domains:
+    items:
+      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
+
+  vdda-phy-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSI PHYs.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.8V regulator supply to CAMSS refclk pll block.
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
+          Input port for receiving CSI data on CSIPHY 0.
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
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data on CSIPHY 1.
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
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - vdda-phy-supply
+  - vdda-pll-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss: camss@5c52000 {
+            compatible = "qcom,qcm2290-camss";
+
+            reg = <0 0x5c52000 0 0x1000>,
+                  <0 0x5c53000 0 0x1000>,
+                  <0 0x5c6e000 0 0x1000>,
+                  <0 0x5c75000 0 0x1000>,
+                  <0 0x5c6f000 0 0x4000>,
+                  <0 0x5c76000 0 0x4000>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csiphy0",
+                        "csiphy1",
+                        "vfe0",
+                        "vfe1";
+
+            interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 211 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csiphy0",
+                              "csiphy1",
+                              "vfe0",
+                              "vfe1";
+
+            power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+            clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+                     <&gcc GCC_CAMSS_AXI_CLK>,
+                     <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+                     <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+                     <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+                     <&gcc GCC_CAMSS_CPHY_0_CLK>,
+                     <&gcc GCC_CAMSS_CPHY_1_CLK>,
+                     <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+                     <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+                     <&gcc GCC_CAMSS_TFE_0_CLK>,
+                     <&gcc GCC_CAMSS_TFE_1_CLK>,
+                     <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+                     <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>,
+                     <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+                     <&gcc GCC_CAMSS_RT_AXI_CLK>;
+            clock-names = "ahb",
+                          "axi",
+                          "top_ahb",
+                          "csi0",
+                          "csi1",
+                          "csiphy0",
+                          "csiphy1",
+                          "csiphy0_timer",
+                          "csiphy1_timer",
+                          "vfe0",
+                          "vfe1",
+                          "vfe0_cphy_rx",
+                          "vfe1_cphy_rx",
+                          "camnoc_nrt_axi",
+                          "camnoc_rt_axi";
+
+            iommus = <&apps_smmu 0x400 0x0>,
+                     <&apps_smmu 0x800 0x0>,
+                     <&apps_smmu 0x820 0x0>,
+                     <&apps_smmu 0x840 0x0>;
+
+            interconnects = <&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
+                             &config_noc SLAVE_CAMERA_CFG RPM_ALWAYS_TAG>,
+                            <&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+                             &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
+                            <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                             &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc",
+                                 "sf_mnoc";
+
+            vdda-phy-supply = <&pm4125_l5>;
+            vdda-pll-supply = <&pm4125_l13>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+            };
+        };
+    };
-- 
2.34.1


