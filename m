Return-Path: <linux-arm-msm+bounces-54653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED4AA92097
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 16:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73B8F19E7F77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 14:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B47325333A;
	Thu, 17 Apr 2025 14:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bJxSOgkE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706BD253B4D
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 14:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901918; cv=none; b=e/6DHMS1SQQBr4OD9eW70hfAgTM2m4i7zDp0hwhXfEvkQe1LRk8flUj3iNi9aCnTYURI7W1QxG/0qDpReJ5JP1iiitcp4DzEwNUdvNhustOs+BKsTjvPYX+n16kRIZfjwRQUbkyg/5UcUbVKNoH8k6mTguOiXpFXHMS+MqFkXYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901918; c=relaxed/simple;
	bh=Bo+ze+YyQOzphNiTgreRfKGT6ceskLXqm2txeq0K+LQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MmEF/AdtxLq32LSv18DHFAzV7Hf2KQXF0hQL05BhF1FAwqvJ1ZM0wgz4cJZ9PMPuvPZuI9mdrkG1c9gxbZ8CWCeQfhvmz66AvKIE6Tu6n///gz9RkTWCazQnqQq9gN7uMKeTazl4ll9gYVoqYFoc+WZRaoSg/kZYpBVOroM0eyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJxSOgkE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClMaR008128
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 14:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VWpY4+uRax2
	m/mnUMNZfhQl5Ox6GGJGk24ckn4FsZT4=; b=bJxSOgkEOvPJqbeOsER2QmEJElM
	6ToXQk9R6MKmbjUAk5PmOvf4sDX4WlIf257WEn4VJtOOLKd+S346JQ/78yj6FIvb
	7bobKibCgVTCxewoDG17Y4rtJdjmx+drD2JyqKacigIsi7xZN1a/ZY8u+s+Ih6Of
	1YfKa5YTFEn4K7cTgQduw3iecAwXP3R5gQCppJHoE27UDXwzvtJTLk8md+L9+EOD
	PnViN3QtsnohNISw7Htaa8FKIPOhjefg7l9NXtLfHoIRIVQ4Z9qf5s9olVZefrjg
	kkLVeIekSRDHVRQtvdck+UwChby5Zw+lF1RJLY4cswt8EyK8s58NsfFk8Sg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk76tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 14:58:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6ecfbdaaee3so16096256d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 07:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901914; x=1745506714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWpY4+uRax2m/mnUMNZfhQl5Ox6GGJGk24ckn4FsZT4=;
        b=TMaZPIlCPl/wEJQ/ZNP6yjyaThCuDnl3YQ2lNY6eg5aWDUgP0vLz7Ud3EVsc53nPV8
         8NTUZilKkPowWkgGmdBwR/XOFYUrwL4EywcPLTUq/YhXVhbztS3nHTva8zLCQphzL7NH
         OM5x4UDZ/Ksj3x3pjJLQMH7JEIsbBOiqG8kFrej1zWzmP5nJNhnKvzhigQ5f7n8TRN+a
         u56LbyiE7MXtj9QIT+shp7kGXiTTptxuK3csLJA5fNZAuycJbfems01zkTHMhJLdtzwQ
         pS7Axhd8hFcxMpGwE5o3D+XS6nMtcDhT9hzr6+8I57ibKV5SKBgLb6fadN0M/1Jjq3Jh
         6Lfw==
X-Gm-Message-State: AOJu0YwkOr9JCTS2Qcg8BdWng+iODvKSm9SORAUQBTgGYzzqEvEwlK2k
	QEmjN2m0HHhdvFw72xmkUZnXBGw542ZxsKscASDjRhMh9MqWuj2qc4HrO99TknW7OG6lCLCLRJ/
	HL1RKuPli3r4BXQDx9Rnoqq7Dpt2b9B2Tj9T/3r2XbEX5sw6fHKMGP1SsJ3+rE892
X-Gm-Gg: ASbGncvyw5S32u0WnF75LxKNn57fK6sqLgeU7HENguHnx6ByFslJG1BDd7WQLx+dWG8
	hMYdtbvMaY1hb02VlzzS7V0FuNo7yb/cuCJx3hM9bQ8gWYFomoKQhQm0VSlO4T6KhIZOPCNlsB3
	GcTfUes3uOtDrnwoxF4gQxs2qr5Hi84ohBxed0XNW0eIU1m7aJzWh6hAX46pk3qZ5Qy2QztxdwA
	ft4O4o1o1AM/ITZ2z/rffWLYysjvds+WhqwCFRIV3oaTwzKsnkFXNMN3Ocrve80UhJtLqYSv87d
	I3+NUg8KnJ/0aNomoyhfH58QrNDiUnQE4BbbUfB7G236vss=
X-Received: by 2002:a05:6214:410e:b0:6e8:f464:c9a0 with SMTP id 6a1803df08f44-6f2b2f3e58cmr77387156d6.13.1744901914116;
        Thu, 17 Apr 2025 07:58:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDWJWfJEpQ0v3xPPm3V9NntzaNWSytCeDPNAc7NMu2QmrsoAA0HpcUFuciEZHQp62F65YdHQ==
X-Received: by 2002:a05:6214:410e:b0:6e8:f464:c9a0 with SMTP id 6a1803df08f44-6f2b2f3e58cmr77386816d6.13.1744901913687;
        Thu, 17 Apr 2025 07:58:33 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:15e4:d866:eb53:4185])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef48e5csm3966166b.148.2025.04.17.07.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:58:33 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 5/6] media: dt-bindings: media: camss: Add qcom,qcm2290-camss binding
Date: Thu, 17 Apr 2025 16:58:18 +0200
Message-Id: <20250417145819.626733-6-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417145819.626733-1-loic.poulain@oss.qualcomm.com>
References: <20250417145819.626733-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=6801171b cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=2DfPVCEIPBpRJJTYYFsA:9 a=1HOtulTD9v-eNWfpl4qZ:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: yJLyaYWZuAwdOI2nPzwKDYQl9KVmnXbI
X-Proofpoint-ORIG-GUID: yJLyaYWZuAwdOI2nPzwKDYQl9KVmnXbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170112

Add bindings for qcom,qcm2290-camss in order to support the camera
subsystem found in the Qualcomm Robotics RB1 Platform (QRB2210).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss.yaml    | 261 ++++++++++++++++++
 1 file changed, 261 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
new file mode 100644
index 000000000000..1af6ed298c66
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -0,0 +1,261 @@
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
+    maxItems: 9
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csiphy0
+      - const: csiphy1
+      - const: vfe0
+      - const: vfe1
+      - const: tpg0
+      - const: tpg1
+      - const: top
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
+    maxItems: 8
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csiphy0
+      - const: csiphy1
+      - const: vfe0
+      - const: vfe1
+      - const: tpg0
+      - const: tpg1
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
+        camss: camss@5c6e000 {
+            compatible = "qcom,qcm2290-camss";
+
+            reg = <0 0x5c6e000 0 0x1000>,
+                  <0 0x5c75000 0 0x1000>,
+                  <0 0x5c52000 0 0x1000>,
+                  <0 0x5c53000 0 0x1000>,
+                  <0 0x5c6f000 0 0x4000>,
+                  <0 0x5c76000 0 0x4000>,
+                  <0 0x5c66000 0 0x400>,
+                  <0 0x5c68000 0 0x400>,
+                  <0 0x5c11000 0 0x1000>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csiphy0",
+                        "csiphy1",
+                        "vfe0",
+                        "vfe1",
+                        "tpg0",
+                        "tpg1",
+                        "top";
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
+            interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 211 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 309 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 310 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csiphy0",
+                              "csiphy1",
+                              "vfe0",
+                              "vfe1",
+                              "tpg0",
+                              "tpg1";
+
+            interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                             &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+                            <&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+                             &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
+                            <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                             &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc",
+                                 "sf_mnoc";
+
+            iommus = <&apps_smmu 0x400 0x0>,
+                     <&apps_smmu 0x800 0x0>,
+                     <&apps_smmu 0x820 0x0>,
+                     <&apps_smmu 0x840 0x0>;
+
+            power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
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


