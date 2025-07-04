Return-Path: <linux-arm-msm+bounces-63671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5268EAF8BAB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 10:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA77FB439AE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 08:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE08F2FD59B;
	Fri,  4 Jul 2025 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVkdKptF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CDE2FD868
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 08:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616956; cv=none; b=UjqCeUvwRbOfxD0X2K0FaksRTJ3bW/gr/aGORf9Zw264zZ+onAcLTihshNGh0gqvtzquTQmN6+yWPy4dQ3f/+EWXr5p0lFzxnavF8ENKlpFzSilmnby7RyTbP9O89fUHPt1T/5GSPWwB2vRd2FzDlulB9mp7Y4WqZoNSQGoXFfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616956; c=relaxed/simple;
	bh=6+Bv44m2zitJH/KcDYM7n+Rvlzk/pbMTpTxGgTBc9wY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qO3oxEtKFQLGwwI9G7w5HN+l3QnncDZVMU2FaJdxdfEILMw7bh1xWv3MRGnUEjUeEZXnh+HRBjzhgtnqrvTu9R9IULhnZPnnXEMFzwFk0Mz23NFvLVJqmax5GzcJSWQCxtUFN+SFGgo5eXsU4XgUGqL2Wq6hy9JfnPlc4DH6mNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVkdKptF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563NUiwK020843
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 08:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zvi7uAz9veu
	F8Vn0WyT7F+5vGidTX+FCZvsPrUoeiQk=; b=mVkdKptF4GNtWKT3qeb6YHpa/Y/
	IbeGYgOdn50xpIDmR8Iy3eXr7fm4MBXKoeF8xiilObmNUQdSoU/eKH9mpFSWxLso
	jkjp33EP+j7ilzvj1rDglv3bFasHxB8Nbd1ushIzVY4/I+3Y9a9e1+k0ounav5AA
	6OT0SJnH7rpLk1qiNAQ4KcT7ly7S3L9tvLuYNLbLbXchWTKZu8+DdOZVr13lrqOZ
	0vLxP7FuLVxgnUGbx+qzYcDFlDNlu2BIwsKrAiB8YOrzvUkPtmoqpUO2drXUlpRs
	dWHsdWE7TKv4ZtC4eZS4LtFEe2PcNzpJiPl6nfy7b/aHM8TacPR5DDT0TRw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn9r8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 08:15:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3f0958112so99168185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 01:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616952; x=1752221752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvi7uAz9veuF8Vn0WyT7F+5vGidTX+FCZvsPrUoeiQk=;
        b=pNpyybH2ZmIgTk8XqWWWqnkmQ6XHwH03blxdzs2fwTZXuLZ6mpCuT+o8/w6Ab1E7k4
         6+0Pxvz6/cLmEzJweQ4Vqa1ujUxevIs4X/xGVJ3QUfEihK03tIEAXWB+k1HvkQ6QaiYh
         zxsVYHBjHiuebGfC8edEgngObBqB+Mt8qp3NZVjtW6QQG/Zk1IcuCffTECzzNKPQrZsx
         w4l34HAAymt9viJv8TcAEzMfl6OuDL0o2+G5NBCZKKJcfma+AGucOiAWkkQgsPx+AH1S
         IAaDjVcY/v3PwpjzReA5HrKayKZvnC5fIwoIxOkJJvLOugVUAZKM1xkVjKg+VbDpNAs5
         YaqA==
X-Gm-Message-State: AOJu0Yw67J1HWw5wd7zzOEG/ZlCN1Ay4d7f3JZffG0ngWl2Q1AlUq1J+
	06NKjQEam7Od54N877o/BUjB5bWy8xp+SKLN6TVir6dkJ6jvzstkWKJPSOA6v5WlLE6N1gjR11W
	R1PfvLFB1i1qKmCnS3sZtg0kHSyrypAHCH28z4kFZvhnLtN3R6vLzC9rd9p4vuBAXwRTh
X-Gm-Gg: ASbGncsMR9OznB36tvxDSlyj6sOvEc546cv2h/FELP4qu+HZpahuggAtrJmXTCXX4wk
	J3//Ff5aCTqVXE3ffIAfPmh67fdViiBTiBxb0rVA3ckZa6dDuih68mFyWOXPN2l8BpIMFNEIrMb
	ihBAW9pBsdazLq6b8tNkNSEkUePJF1CVGEGOIyEILG7qp8PhXKB56ERDq3fmpXFjSZ6KPpt1tlV
	G6CARMykz3ieV8ZsrZ+xW18+DjZoMgv8+FXiYeiBIULxMLKRIXgjkIO2P8G4SI4ZkVp2AWibHpI
	cE0nbY5aFX/boQ5LA+xEmyJ6CL3eCDdrrS2r4WdequcaqAjxUvAz6yau9w==
X-Received: by 2002:a05:620a:8c0c:b0:7d3:d732:8170 with SMTP id af79cd13be357-7d5ddc4b21fmr147035885a.26.1751616951542;
        Fri, 04 Jul 2025 01:15:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVO+1ZpPwjbt7q3JMXNRaZMMwhir4wgcs6KV2dHlf4t3VWEjF2yiLK+uimNUfNXz87++DaYg==
X-Received: by 2002:a05:620a:8c0c:b0:7d3:d732:8170 with SMTP id af79cd13be357-7d5ddc4b21fmr147033485a.26.1751616951050;
        Fri, 04 Jul 2025 01:15:51 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:e0ed:c3b0:c674:7c4b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9989fcesm47991835e9.16.2025.07.04.01.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 01:15:50 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v5 5/6] media: dt-bindings: Add qcom,qcm2290-camss
Date: Fri,  4 Jul 2025 10:15:36 +0200
Message-Id: <20250704081537.1716613-6-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704081537.1716613-1-loic.poulain@oss.qualcomm.com>
References: <20250704081537.1716613-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2NCBTYWx0ZWRfXx+yrxxlMm2wk
 iRXY+DKQTFZyjoEW/qHpqTb5HCe/zBftB24SWNREcMHrqjhZSoDSY8wSWbXmMpMxgArucxmNIle
 9BX4QfObtuWQGIoLw6xtuzKyG0ESatPykB6U2YQ/WxjstGJc3uahQqmMpO4HXy4uOmY2YYjw3Pk
 2JL852O7ChQcX4b5qFNuAR6DIztTq3WkPotbm+jnzvjMdABYSX1vjeOKxiV41Dqq4Bx2UXLI1Zz
 fDwCsdTEtX3pJxL+1jkGF0rLUin8PgCKDF/xEUib5qn5QzSJdNMbkCNNLB4XBCByA6XyKLzV+yy
 RUqKl9P3Pdht0oM4DMLonmTQXMLyALHYov/V5rlB2j4iRCGnSTBqKq/LREc5cbjuMvPGea9zGKa
 dU3qqVKKxMCG1E41uE3VkoVaOMBuIychLgRO7XIlp91TKYixN4Qfex8T7WKjb0TkIoYHbZp0
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=68678db8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=JlZtY4oE0OGdv2NQSfYA:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: SQff8vNZ065HNvXUygapRupTu5GVvfgQ
X-Proofpoint-GUID: SQff8vNZ065HNvXUygapRupTu5GVvfgQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040064

Add bindings for qcom,qcm2290-camss in order to support the camera
subsystem found in the Qualcomm Robotics RB1 Platform (QRB2210).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss.yaml    | 243 ++++++++++++++++++
 1 file changed, 243 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
new file mode 100644
index 000000000000..2824acd49d89
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -0,0 +1,243 @@
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
+      - const: csitpg0
+      - const: csitpg1
+      - const: top
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
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: csi0
+      - const: csi1
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: top_ahb
+      - const: vfe0
+      - const: vfe0_cphy_rx
+      - const: vfe1
+      - const: vfe1_cphy_rx
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
+      - const: csitpg0
+      - const: csitpg1
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
+  vdd-csiphy-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSI PHYs.
+
+  vdd-csiphy-1p8-supply:
+    description:
+      Phandle to 1.8V regulator supply to CSI PHYs pll block.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-3]+$":
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
+  - vdd-csiphy-1p2-supply
+  - vdd-csiphy-1p8-supply
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
+            reg = <0x0 0x5c6e000 0x0 0x1000>,
+                  <0x0 0x5c75000 0x0 0x1000>,
+                  <0x0 0x5c52000 0x0 0x1000>,
+                  <0x0 0x5c53000 0x0 0x1000>,
+                  <0x0 0x5c66000 0x0 0x400>,
+                  <0x0 0x5c68000 0x0 0x400>,
+                  <0x0 0x5c11000 0x0 0x1000>,
+                  <0x0 0x5c6f000 0x0 0x4000>,
+                  <0x0 0x5c76000 0x0 0x4000>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csiphy0",
+                        "csiphy1",
+                        "csitpg0",
+                        "csitpg1",
+                        "top",
+                        "vfe0",
+                        "vfe1";
+
+            clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+                     <&gcc GCC_CAMSS_AXI_CLK>,
+                     <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+                     <&gcc GCC_CAMSS_RT_AXI_CLK>,
+                     <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+                     <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+                     <&gcc GCC_CAMSS_CPHY_0_CLK>,
+                     <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+                     <&gcc GCC_CAMSS_CPHY_1_CLK>,
+                     <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+                     <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+                     <&gcc GCC_CAMSS_TFE_0_CLK>,
+                     <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+                     <&gcc GCC_CAMSS_TFE_1_CLK>,
+                     <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
+            clock-names = "ahb",
+                          "axi",
+                          "camnoc_nrt_axi",
+                          "camnoc_rt_axi",
+                          "csi0",
+                          "csi1",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "top_ahb",
+                          "vfe0",
+                          "vfe0_cphy_rx",
+                          "vfe1",
+                          "vfe1_cphy_rx";
+
+            interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 309 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 310 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 211 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csiphy0",
+                              "csiphy1",
+                              "csitpg0",
+                              "csitpg1",
+                              "vfe0",
+                              "vfe1";
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
+            vdd-csiphy-1p2-supply = <&pm4125_l5>;
+            vdd-csiphy-1p8-supply = <&pm4125_l13>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+            };
+        };
+    };
-- 
2.34.1


