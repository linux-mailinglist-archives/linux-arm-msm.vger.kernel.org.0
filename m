Return-Path: <linux-arm-msm+bounces-63997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E1DAFC5C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D082C1884BF5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 08:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316772BEC59;
	Tue,  8 Jul 2025 08:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NsDS93f/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BFC2BD5B6
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963561; cv=none; b=ayItSeUhnPnXZDwaJikuQLClU+tmV//wdWSTbKlx2zDOg0wPhKaYjJgLr1ZE+fxvi+GKR6lXtmfzU9vC8E4E/KHhY80ZT5c59NxsV7ABUu5NifgLfy+4j+qM5hmL6C3q9tG5vG6Vn/bUB3lyR+/nLUICIoJX7MKz7ZBfvmizjzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963561; c=relaxed/simple;
	bh=1wWdWQSOjPNK+SuoIAGtLW2+wfxJL2jM0FeagMEcwvs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k6tjh/D3fFh/gDWvCLL4k3WXsxifg22AtAOZn2WKjjvJZ/IfAljFwlWhhT4cxjj0vr57jYD9MmdpKWkGuaKmoi3yOMeh1fOmKBc38NkuZgCS22RA3gFhYwmCdqiwE/YrIiIXq166+4IvJMxQdDkycNT65QPhdHLFU9F949Kj9VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NsDS93f/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56831nT7013839
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 08:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sTBHHEVxdFn
	xaQanGips7Ut9Ra8pP1LsaHToR9Dj4Jw=; b=NsDS93f/LsNQ/k7knJSP2ViEptX
	syTjf4zsmpVpxQTVoUSbIXFhPq5cYeFL+HUw8kjLQm9iXd+kmreiOVsw2khgwQzG
	EeSXMgIM23DkGd+2cKDbIkSlHcEEgZo8hdYPsNX5yhmxMV7hfLBeV9ek1dM9EJNn
	y69UuyYwJka9CWhsaIuJu3a/YK1drG91xfPsD/e2/UkoFP8FbcvsAEDt1f+pUpLi
	jej12u78UluEEjVdDhirTBgpsDRjdK25HLmEg1TgC8OnWYZoR/UB+UztnGHLtrmy
	xHEEu2jLefjkjuG0nHCEbW5LHnifzT8BGPtT4OOMJCFQUF5hjdr9DLHhd0A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0sc44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 08:32:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3cbf784acso1143909185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 01:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963557; x=1752568357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sTBHHEVxdFnxaQanGips7Ut9Ra8pP1LsaHToR9Dj4Jw=;
        b=hloLyULLE7jkB0Qtsd2V0Ht7K/eVlw3f26I7sxrTxGQLU9S1O2MeC/yvdb/xqwT9qX
         P/GKZckvTYxW5aiGrYjagNbmKdv2HA7K8ULz5jwa2TulNvmz/c+HLHmmDVLokg/XjPRD
         vhtnm3or4pix9gCxNqRFjCspsgaoEKpLHQGlRDhLAtlM1l4oYZpJb6YkbyNM0k1ydh1Z
         Oh3hlr/jHyOfgbfWmK0V1uXtAQcYA4F+T9FtzAxbULmkhsW+sFfgRojPX2v8vn50HAh7
         m1cXEDBubrFExu1Y3LCas9WYju0YDnLGiadI+wAKJPnL/ObO/1DvND+we1nakvLBSpfL
         lJGg==
X-Gm-Message-State: AOJu0YwwX31ofiEx3pX3ln0YvACo22AGPlXAzzoBSRrfH0yAlAxncua1
	c1M4RhRtAJuQyLS4QRH938ckwxrpBMu5Wf74xKp9O5INglEFzwjTxA18y9+raj41nFEIAWn7g65
	BS/24I6j2287NLdehARgaWWxWYYjDNQ99nNLkxbpnGMMiohY5Kb1KRSQ04oh75cDBgoDR
X-Gm-Gg: ASbGncuGca/an3UkIqpnvmN8fixjO8qGzWXu1uf1+dsIM+hS369zFWpSTnep+C9unp6
	XP8fHaVJZ+QmssnA69OXWO5lSD0gndnVygNBuBTx5sJWWEIt1dCPwYFv5lsrwvuM4n3BGCYvECL
	nZKGbNoRgjFLEFrc/iNREpYka1cmOLAqq759+wHhptlucXLcRDs0PClvjGfH19ncr6yMIH0REdg
	2N2S3zpzAU6ZUQQdvPuk75h822c8JEwj7O+moB2PCNixUwDaB8e4uOsPLjuxakQ+ZhXqzglTeuc
	Goo6QBfyCtd8vOYyM5271A6pQfejgGpB/jE7zlXHd6cKig/OOLjWb9JF3Q==
X-Received: by 2002:a05:620a:171e:b0:7d7:22:25b4 with SMTP id af79cd13be357-7d9e9f8a12emr403963085a.13.1751963556755;
        Tue, 08 Jul 2025 01:32:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4BQRN+GHJOZlMhyHf6Tf7ESLERrIXNRbLj2NBVYDR4tXCHJjnSW/j+xPgNY8cMvxBThnMzA==
X-Received: by 2002:a05:620a:171e:b0:7d7:22:25b4 with SMTP id af79cd13be357-7d9e9f8a12emr403958985a.13.1751963556272;
        Tue, 08 Jul 2025 01:32:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:953b:906f:73bc:cc41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0959sm12315812f8f.27.2025.07.08.01.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:32:35 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 5/6] media: dt-bindings: Add qcom,qcm2290-camss
Date: Tue,  8 Jul 2025 10:32:21 +0200
Message-Id: <20250708083222.1020-6-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708083222.1020-1-loic.poulain@oss.qualcomm.com>
References: <20250708083222.1020-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686cd7a6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=JlZtY4oE0OGdv2NQSfYA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA2OCBTYWx0ZWRfX5ni5tj80x4b3
 AtQ9hdcrFelP/1tWQWvyrSBwsvKnZk+Ez9dUopS7eSnOfUBcs9MsIgD2tfDWSMqy1w/+DR/+cJq
 zgOBcRO6yjjgXw3ithYbCc4I+3vlERTNsvvAvt9QYbxF7e9jIzxOKTj9h/TbtAW2wA2r3h86sp0
 WV3Y1+tQwfoiKfvm+I88a32eu20fRCczmGgbuKXxn9ss84t5nrCXrdwLmzp6HaL3KUmPZFsieNw
 6WBo0UHjNf+k6wQPxSV+/5+5U3cmdo1sb6Vdoy+sqZ3DNyCDROu/Ew65RWPUAcwTtKhbqQf82ca
 cm8f5rodkTsiZFD6PZrndMXHULC3UQfkWT5+W+0sHQQ7God/F1YWn/5brAcnqm+zgTh8UweG7fC
 9sNSISAv72aXYYc+1hX7NMG/sKiOS81e3ZWEUB9oC+mUmUGpansrJMH2ovBb7Xi+dsNmX1VP
X-Proofpoint-GUID: k2b-FVdweIWj4lBXvY1WXXiSroEAlGCc
X-Proofpoint-ORIG-GUID: k2b-FVdweIWj4lBXvY1WXXiSroEAlGCc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080068

Add bindings for qcom,qcm2290-camss in order to support the camera
subsystem found in the Qualcomm Robotics RB1 Platform (QRB2210).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/qcom,qcm2290-camss.yaml    | 243 ++++++++++++++++++
 1 file changed, 243 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
new file mode 100644
index 000000000000..391d0f6f67ef
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
+      - const: top
+      - const: csid0
+      - const: csid1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csitpg0
+      - const: csitpg1
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
+            reg = <0x0 0x5c11000 0x0 0x1000>,
+                  <0x0 0x5c6e000 0x0 0x1000>,
+                  <0x0 0x5c75000 0x0 0x1000>,
+                  <0x0 0x5c52000 0x0 0x1000>,
+                  <0x0 0x5c53000 0x0 0x1000>,
+                  <0x0 0x5c66000 0x0 0x400>,
+                  <0x0 0x5c68000 0x0 0x400>,
+                  <0x0 0x5c6f000 0x0 0x4000>,
+                  <0x0 0x5c76000 0x0 0x4000>;
+            reg-names = "top",
+                        "csid0",
+                        "csid1",
+                        "csiphy0",
+                        "csiphy1",
+                        "csitpg0",
+                        "csitpg1",
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


