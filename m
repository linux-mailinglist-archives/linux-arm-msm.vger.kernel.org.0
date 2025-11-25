Return-Path: <linux-arm-msm+bounces-83170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 89893C838ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 07:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 838354E7F56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 06:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC832D3EDF;
	Tue, 25 Nov 2025 06:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DdcUgQCc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Km7lpceK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6142DF709
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764053347; cv=none; b=TvuqQz1PpOZHTjB70NAI1C0RV3yCfE6V+019BkAXAKbzUZ3llIuZo3/JUPFp79AYOqg4sUXxVNmAmff3u1FC93HgHDPb2h/4KeJqrBrRtfYNLgtZSXeXFKtomFTtciTRAXEuBPPqyg6u+uHW9wYTMjqCDXgFnJd9Pb/QgyIhG6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764053347; c=relaxed/simple;
	bh=C/SRBt/7dSGnmJr1VczwjK56l7+Ma6+LmugqmP8ce6Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qTpkflTvXUX5fpWy6ACeepE+nsOtm3C25+KUl2vzWmAzA20henzeqILSs9Yya4KSyfhzb6fmntsLHPfBedSnuRqk6OWyvDIaDGf1vICi72EJhggH8Ldnsv92hUh1wwAq4TDywl+2Z8gFEQ5B5qb+gU52adjhB9YICe260biGa3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DdcUgQCc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Km7lpceK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP4wBmj1672148
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ejOLCXs2H6V
	eH6zAgJDf6kqCLHfca0LQJWts7i4UWpM=; b=DdcUgQCcQkqhWxddtSUrQAFauQz
	HagkaneA6DB3ZSj/laGX2rbSj+i/XPn36v48RGK7hOZnEtqwNJpYd4s8fIpEhN+h
	G2358jOI5j/lxEGPiCA9PPp9Cj90YHwrNeOVL26oOEcMQbkrQqGctsblHthNw5x2
	PH8jZoJVNiSkqzckDiQmpkEbZs/DQy4lZj1O0/w76IiXQ/Y1jMqaxM+bBCHZ17SD
	KONIi4wQYMNMI60P1ghH7hQVGL/nkq0QifxSCNbuoxO/XATLZfZGWW/PJmAg+BBv
	6bxj1LKPLFpQJ6/OfxQ4wUKykVWi9qPhPACegszgblL5IpKKbHQEIKquMuQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an5w809pt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:49:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8a1c15daa69so338873085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 22:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764053343; x=1764658143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejOLCXs2H6VeH6zAgJDf6kqCLHfca0LQJWts7i4UWpM=;
        b=Km7lpceKUfJiEsbP1G5Z9YWL/MWoWCyQr+2DFP++sY8N+o8ds/HTXPeooZJY0OsVIV
         7GEusuzOrUAYFK9hD510YCLUEH+d6mF1IAXqQGVVjrOnpj1oZshM9Kc7FmQxxg7v7IVl
         YP53oL5KbGNZXBdF9k3Oi0GPYE7avMmUrOqiRmeO88Mn4DTw+16CJjnrrYuRtj71+2F0
         QLAUsvP2m4Rjo6a9bwe5d9ieC9iftNN14csdYuvZZuxkYENfR+G+8w3J1Xibo/Rk+lZv
         lj+63Ri8Mqt6qcQI7Y5wZxj1pDEyuSOyqdrUSSpQgOFja139uy2Z8mR8BLeaQOJiFRVV
         1IQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764053343; x=1764658143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ejOLCXs2H6VeH6zAgJDf6kqCLHfca0LQJWts7i4UWpM=;
        b=EQVcuBHGEDwSab0FUJVi/L6RpK9ovdtTxr2/tjaxp2zN7RSTSazIdkSnl3uuPWuFLt
         dmR8ScfLQccWDA2VN5ccexb1SA1GZ6wSO+Bh9lMLup/SxjLas5rQ+gLITvIGRr7h4RDd
         UqjDpxwNJrGFfFxtvvaQrwTPHwHLtFsPraESzTtLsVMfT3ysRADIumdh/0HCh98K9eOD
         1V9nKX5hgp3iY/RI3SCpjMsC89ihyVtaEz7rldE2opvOTk8LHAeAasRRXt/cFQOVJxrw
         lSZ+GRB4aPxU0shmB7irO5uKLrD6v3euf3A4N+mY2XR10UIAdiDf71QVfw5omagkzIlV
         L6Qg==
X-Gm-Message-State: AOJu0YxZ2WZZL170dl6ZmYUeAi/TA+JiX+ESVaRsr3xvwtywYCa4H8G/
	gbKz5faftat8UXHbdelg54mFdehSKfjV8yrpXilTR//PviQh/3O7YDg/IoNUnXbMvEb4cdj0Jot
	ArFwSy4rtuwUOmMGsLX9WQkCp2Cz0UM5AXjx4yYHXaOdXKwEKg9M4pOu1udhFXydj3D1V
X-Gm-Gg: ASbGnctHAraN3csMWx9uIuQTtEk+PhSndvaKF8nkguvX7TR0z72VR6zbPjFoW2oag3u
	CYLU+vK1kIzIO64laecmLHxXy65DFtZiKL3ZHurro9Qmn9ArThrv5iDRX9u+KrRQwZC7kZZTskB
	pgwP/WDZQ5aHxEbK6zKx/QPc1dYkcwHxmakzqFmbR/6sgtpXikpTuYb1cZm6RDjuIFJ74UwoxnA
	znYrC9zfUexYgArjEqv7LbQWgVIIAlVwf+n3OU+yjR0n3OZPClz0Qgcrud3LO+oSi/QUjpgTbmm
	AHdh+Bp4fV438WKqWEfue9J4u9Gk9qlelbzwVWCC9ee3xrZYdWQAcc0jT7awEgWfX7B9bFux91V
	lQ13Qw4ucre1koFMQSi80a1GN1ypsKuuogGjV8+AOQxoY2wof62VcTz4J4SDr5HptER19dQ0=
X-Received: by 2002:a05:620a:1a05:b0:8b2:6ac7:aa61 with SMTP id af79cd13be357-8b4ebdbea66mr234712385a.73.1764053343270;
        Mon, 24 Nov 2025 22:49:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsdVVKLmwe2oMj05Y0aUe3dTPaFXm1YvlM5u/vQ9L9kjd09oWDF4kilPdJIBPHoiUnUPpmeg==
X-Received: by 2002:a05:620a:1a05:b0:8b2:6ac7:aa61 with SMTP id af79cd13be357-8b4ebdbea66mr234708685a.73.1764053342797;
        Mon, 24 Nov 2025 22:49:02 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 22:49:02 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        yuanjie.yang@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v2 04/10] dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali
Date: Tue, 25 Nov 2025 14:47:52 +0800
Message-Id: <20251125064758.7207-5-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfX1KsgFvkKvF0B
 UMo7T6ATyVst602AJqQCTXZaJuNFjrjNF4pCKH+356CNP8crRm6XGri5VmFd7K9z/gYK+qGxItQ
 OBNbhswJ/FatWCseftGiz0o0foblehqq9Xz2Uk//SHEkbiUFN9reuQiu9Fx/mzPh4cpLPmKxGnD
 KnnBojviRxo46kXb64KvohRfgzEGRANQabp0siszIH9XfOE6vtaDICQ4Di4kkfCfIh9dyp+2jP3
 dUb6mGp2kx0lw9l5mqS/POVEO4ia+dLGkdjYHuNXEoh1oHGL2HO+BLuMjTDAllXaH44Oz7Kb8FS
 X/cxBUEPSLbn3DbFUzteCRxnkXJN2qta91EYv4sCtksq+oOL1nP+yDrXYQYILQeNg4i0X84e4wy
 fvjcai1YnIcFJHSD5EEb0J4WE+WKHw==
X-Authority-Analysis: v=2.4 cv=RvTI7SmK c=1 sm=1 tr=0 ts=69255160 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=ttgK4pBlxCW4zpXUERAA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: n-c9oZrB-Jgms7ufxV8Y8AI77ofP5y56
X-Proofpoint-GUID: n-c9oZrB-Jgms7ufxV8Y8AI77ofP5y56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Kaanapali introduces DPU 13.0.0 and DSI 2.10. Compared to SM8750,
Kaanapali has significant register changes, making it incompatible
with SM8750. So add MDSS/MDP display subsystem for Qualcomm Kaanapali.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../display/msm/qcom,kaanapali-mdss.yaml      | 297 ++++++++++++++++++
 1 file changed, 297 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
new file mode 100644
index 000000000000..92293e2b4d94
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
@@ -0,0 +1,297 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,kaanapali-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali Display MDSS
+
+maintainers:
+  - Yongxing Mou <yongxing.mou@oss.qualcomm.com>
+  - Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
+
+description:
+  Kaanapali MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks
+  like DPU display controller, DSI and DP interfaces etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,kaanapali-mdss
+
+  clocks:
+    items:
+      - description: Display AHB
+      - description: Display hf AXI
+      - description: Display core
+      - description: Display AHB SWI
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,kaanapali-dpu
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,kaanapali-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,kaanapali-dsi-phy-3nm
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy-qcom-qmp.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-subsystem@9800000 {
+        compatible = "qcom,kaanapali-mdss";
+        reg = <0x09800000 0x1000>;
+        reg-names = "mdss";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&disp_cc_mdss_ahb_clk>,
+                 <&gcc_disp_hf_axi_clk>,
+                 <&disp_cc_mdss_mdp_clk>,
+                 <&disp_cc_mdss_ahb_swi_clk>;
+        resets = <&disp_cc_mdss_core_bcr>;
+
+        power-domains = <&mdss_gdsc>;
+
+        iommus = <&apps_smmu 0x800 0x2>;
+
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        display-controller@9801000 {
+            compatible = "qcom,kaanapali-dpu";
+            reg = <0x09801000 0x1c8000>,
+                  <0x09b16000 0x3000>;
+            reg-names = "mdp",
+                        "vbif";
+
+            interrupts-extended = <&mdss 0>;
+
+            clocks = <&gcc_disp_hf_axi_clk>,
+                     <&disp_cc_mdss_ahb_clk>,
+                     <&disp_cc_mdss_mdp_lut_clk>,
+                     <&disp_cc_mdss_mdp_clk>,
+                     <&disp_cc_mdss_vsync_clk>;
+            clock-names = "nrt_bus",
+                          "iface",
+                          "lut",
+                          "core",
+                          "vsync";
+
+            assigned-clocks = <&disp_cc_mdss_vsync_clk>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdp_opp_table>;
+
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&mdss_dsi0_in>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    dpu_intf2_out: endpoint {
+                        remote-endpoint = <&mdss_dsi1_in>;
+                    };
+                };
+            };
+
+            mdp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-156000000 {
+                    opp-hz = /bits/ 64 <156000000>;
+                    required-opps = <&rpmhpd_opp_low_svs_d1>;
+                };
+
+                opp-207000000 {
+                    opp-hz = /bits/ 64 <207000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-337000000 {
+                    opp-hz = /bits/ 64 <337000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-417000000 {
+                    opp-hz = /bits/ 64 <417000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-532000000 {
+                    opp-hz = /bits/ 64 <532000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+
+                opp-600000000 {
+                    opp-hz = /bits/ 64 <600000000>;
+                    required-opps = <&rpmhpd_opp_nom_l1>;
+                };
+
+                opp-650000000 {
+                    opp-hz = /bits/ 64 <650000000>;
+                    required-opps = <&rpmhpd_opp_turbo>;
+                };
+            };
+        };
+
+        dsi@9ac0000 {
+            compatible = "qcom,kaanapali-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+            reg = <0x09ac0000 0x1000>;
+            reg-names = "dsi_ctrl";
+
+            interrupts-extended = <&mdss 4>;
+
+            clocks = <&disp_cc_mdss_byte0_clk>,
+                     <&disp_cc_mdss_byte0_intf_clk>,
+                     <&disp_cc_mdss_pclk0_clk>,
+                     <&disp_cc_mdss_esc0_clk>,
+                     <&disp_cc_mdss_ahb_clk>,
+                     <&gcc_disp_hf_axi_clk>,
+                     <&mdss_dsi0_phy 1>,
+                     <&mdss_dsi0_phy 0>,
+                     <&disp_cc_esync0_clk>,
+                     <&disp_cc_osc_clk>,
+                     <&disp_cc_mdss_byte0_clk_src>,
+                     <&disp_cc_mdss_pclk0_clk_src>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus",
+                          "dsi_pll_pixel",
+                          "dsi_pll_byte",
+                          "esync",
+                          "osc",
+                          "byte_src",
+                          "pixel_src";
+
+            operating-points-v2 = <&mdss_dsi_opp_table>;
+
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            phys = <&mdss_dsi0_phy>;
+            phy-names = "dsi";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    mdss_dsi0_in: endpoint {
+                        remote-endpoint = <&dpu_intf1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
+                        data-lanes = <0 1 2 3>;
+                    };
+                };
+            };
+
+            mdss_dsi_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-187500000 {
+                    opp-hz = /bits/ 64 <187500000>;
+                    required-opps = <&rpmhpd_opp_low_svs_d1>;
+                };
+
+                opp-250000000 {
+                    opp-hz = /bits/ 64 <250000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-312500000 {
+                    opp-hz = /bits/ 64 <312500000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-358000000 {
+                    opp-hz = /bits/ 64 <358000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+            };
+        };
+
+        mdss_dsi0_phy: phy@9ac1000 {
+            compatible = "qcom,kaanapali-dsi-phy-3nm";
+            reg = <0x0 0x09ac1000 0x0 0x1cc>,
+                  <0x0 0x09ac1200 0x0 0x80>,
+                  <0x0 0x09ac1500 0x0 0x400>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            clocks = <&disp_cc_mdss_ahb_clk>,
+                     <&rpmhcc RPMH_CXO_CLK>;
+            clock-names = "iface",
+                          "ref";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+        };
+    };
-- 
2.34.1


