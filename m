Return-Path: <linux-arm-msm+bounces-79794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EB004C2331D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 04:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 17F124E5798
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 03:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4030280325;
	Fri, 31 Oct 2025 03:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/FrfJvi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RTqxINYj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269E827FB1E
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 03:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761881958; cv=none; b=VrBPaYDROjQvVSSeuBqppWVMDDY3SuGbh3AEcJemLZIjs5bTCPKxV09Z3UWB8Yck6JVIwCMx03Ao+2zltq3yLjAUZCV2ntlhEZAL5DaKw2XapUfVe4Udob6iXURtVZVQFLChQMaPov4KNPeta/MqSuqWDD/IrFoL/qAKyeME0AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761881958; c=relaxed/simple;
	bh=UaJvC0Cdnv6Ul4oEtzmwesuhg6/Xi+90h/+J+0qctAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pcGU0wupa2nmF8bDp5KzfSxINMlBRJ+lC1JgoJuq8Fu5+cprJMXB2xe2wZ/yxAcgQUz9RmS9Yusm7VbH7pHvAIoBJUzccI7/gBUVDqEViw4XeCTiA5TgjAraPoxKfh0Pdjj85l/s98I2+yx5MBYK3JTRxNgNgORJEWAEH8He9iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X/FrfJvi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RTqxINYj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V3IZFO102826
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 03:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MK5bavPcUikJqKQn5EabOTncCh4hdT28ZJn6/6EdH3A=; b=X/FrfJviupSVDDZv
	COtSpwW0feH41ZWMSVJ5fRUxg/ivDyMATHH1KFmzeS6te/IoAaBN9WEloGjj3wRu
	gSpcVMj/16QzcQEhaGNHbvJCVqBjScdG7/zFvak5M4lrVCtFcEjaLZY+zcKK626P
	71jVVyXOGLG0Hk84u6g9war4QLj73zPm2YwAcdSZI7lvVwJzCfxeedQORgoLRQVG
	9EPc80OLiomhPUrSBwG7KzxfD78+Cio5kC96y7bWzgNeJ53zR+x+6DCvzdkD/HYd
	SsZEV+cInqKVXDrB/U43CI/2fI1iL2QqRO7djdPYjIYmCyFk/F8bXy3/rulOQkTw
	DH+x+g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ahdhs3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 03:39:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b5533921eb2so1240352a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 20:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761881955; x=1762486755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MK5bavPcUikJqKQn5EabOTncCh4hdT28ZJn6/6EdH3A=;
        b=RTqxINYjQt9ViC6F6duIyJlNJxkybIjpVXoiWhBgGzvP6pvNlzjX2EX6qF2et6qnl/
         CAr/6cWUoifrdAbx30O/OantahFIMf9BbDjwAn0D27iVufCAtz1iScXy2sL7BTjdOaxE
         dhKs6rN01GzAeX3utI8hIuWumN5o5gLuXpNupTp/zZ5+TelvFh0lbvwzeBDgQYMTpHJs
         6eCTAuFI/JzbBXMyENpdwS+6I5S4BjWm4+yl+h4RefPk/9nt1tGUgRhW13U4mW7pLM9g
         PPeyoygZrdg8ef9SuxOq892K52VxD0Un6tUwPRnKXK+qrk/w4sw3MnIYNkouhbQWgl8l
         VlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761881955; x=1762486755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MK5bavPcUikJqKQn5EabOTncCh4hdT28ZJn6/6EdH3A=;
        b=EbaHMO+dqzd1yEqylV9IAZQwdY9RTzPuhYHuttMIAFQv2XtuqDnPBCesA0+aIYOwdG
         B3y8AjzdedQRMwvuSTLAoIR41Ae5kzGIniVzhrBj6M1cskzVTtQbhnGIvYKOySc4prk2
         0eBlwJATTiU6Xy/Cax9n1mDkx83gfWYHG6YSD0ZotdPtA5MTrrEk2QoGMPIMIct/yQu1
         xM8fF55INnLwCPG1sJCRYQ0M/X1jbDo42ecG8HKEBigNpKwzdNiXycZoF54pvYPckArj
         c7RtTggjKKl3EupcCfHi6jlF+WTt4ImSPXC+RpmfU3k3DDX353u7Jc+kPAYEUsMJ87is
         pCSQ==
X-Gm-Message-State: AOJu0YyuZ17ZbbUGhrlUO/J6m6VZj5Ern1J+M5m7G2D/xJTfHp6VuX8w
	K1gkakpfUek1yF9/5KTFeiw4b4sD1Ihx95pawk+Yddv4xqUo6/YEwTTUA7N3S/N2PaXd69lI1To
	6stYoqXoZsZL0PBBUs/g/bfUC7P9DRZjYpMCtXDXF/1foB4OT3ps2s7H/3NeHcbzL/E4s
X-Gm-Gg: ASbGnctkvxsBwqx4WZizBOgjFJQG69OFzId+4KiS2L4iQecVoIQkcb7JxuwFISIbmG6
	D/dBb7Z5+WBqvgDpfjUcRIbRylmIEbdM3hB+cGrbhxbzferdxF2p0GHFDVuTlLddHjHgOoJm5yT
	+QPCbVyFYBYHyj3udDwOMVLYfd5Gjnbmz8Kga8NVLXOdAaR446juPVvAfQ/B1MKDS7qXxwZqmhd
	aMLOCbbV1bzbA33HB5ipqScbY+CfQMz/Ub4aT+uy8KgP1k6Y6T6xq/y70UODZf3aEQdznneAabB
	127XtWh4jXfpICJNgTI6f1THxP0xmJQ2XIpqR3PPjQqhoZ1+TodkdRtjyzBPne0WieTHD38Xcqh
	6vYb9GyTpqyGEwENIkApr+A==
X-Received: by 2002:a17:902:d4ce:b0:25c:ae94:f49e with SMTP id d9443c01a7336-2951a4d8d11mr27171795ad.37.1761881955412;
        Thu, 30 Oct 2025 20:39:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmoum8YJCPS/rbK78V/eP20WOf35MeiGVZYZ+Tbg/j0bOCOtJgarbChKCCLFjGoQyRAeWIiw==
X-Received: by 2002:a17:902:d4ce:b0:25c:ae94:f49e with SMTP id d9443c01a7336-2951a4d8d11mr27171475ad.37.1761881954836;
        Thu, 30 Oct 2025 20:39:14 -0700 (PDT)
Received: from [169.254.0.7] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407f0845d1sm646419a91.4.2025.10.30.20.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 20:39:14 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 03:38:47 +0000
Subject: [PATCH v4 1/2] dt-bindings: interconnect: document the RPMh
 Network-On-Chip interconnect in Kaanapali SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-knp-interconnect-v4-1-568bba2cb3e5@oss.qualcomm.com>
References: <20251031-knp-interconnect-v4-0-568bba2cb3e5@oss.qualcomm.com>
In-Reply-To: <20251031-knp-interconnect-v4-0-568bba2cb3e5@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAzMCBTYWx0ZWRfX3u3CldzE3cgz
 WVLu3C0fLIF0CxZoFCG4y47Q1tOE0fy/x/CO9KYsoUpGwnhxDa1IVFvRSCyPt06ihzsaiPuvtVu
 xMn1iW/AGu/tGHPBHYXRtWbsjCJatRhaEPDCARTlxUwduQEO/n1E/X5ArXWfwO6nRb0q/83eul+
 d2N10YxbcOXKqyYJIS5Rpnc+vW6CVLMpaUuG45+7ZOAMcd7R3XH+7Y9gcJOEk/kXO4ePU1TqKgm
 7p62OTMhGlUj9zsjtLhpZ1+eRyT+hUWS0pyJ751R5oczBNAKmHzvriNAwgiXfri2z9rUAlmauuS
 QpUFagvalzX9ZVj7hoMcmlhCitRziMEtcnCv3BnuwXXRkA46vnMVv1GbqtjbbAoVSAFPnM//7KC
 B1c1/g3lMPBoFGy9Bqh2wDQ9muRmWQ==
X-Proofpoint-GUID: FknmNMWr3BGnqvVQc4Z3OOi27uR9ASWx
X-Authority-Analysis: v=2.4 cv=TsnrRTXh c=1 sm=1 tr=0 ts=69042f64 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=0nnlnVUgiuWpLmFhrigA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: FknmNMWr3BGnqvVQc4Z3OOi27uR9ASWx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310030

Document the RPMh Network-On-Chip Interconnect of the Kaanapali platform.

Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,kaanapali-rpmh.yaml | 124 +++++++++++++++++
 .../dt-bindings/interconnect/qcom,kaanapali-rpmh.h | 149 +++++++++++++++++++++
 2 files changed, 273 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,kaanapali-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,kaanapali-rpmh.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9731e7df7eb3d8e1e291a57cbc5941bb8dce1fac
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,kaanapali-rpmh.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,kaanapali-rpmh.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm RPMh Network-On-Chip Interconnect on KAANAPALI
+
+maintainers:
+  - Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
+
+description: |
+  RPMh interconnect providers support system bandwidth requirements through
+  RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
+  able to communicate with the BCM through the Resource State Coordinator (RSC)
+  associated with each execution environment. Provider nodes must point to at
+  least one RPMh device child node pertaining to their RSC and each provider
+  can map to multiple RPMh resources.
+
+  See also: include/dt-bindings/interconnect/qcom,kaanapali-rpmh.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,kaanapali-aggre-noc
+      - qcom,kaanapali-clk-virt
+      - qcom,kaanapali-cnoc-main
+      - qcom,kaanapali-cnoc-cfg
+      - qcom,kaanapali-gem-noc
+      - qcom,kaanapali-lpass-ag-noc
+      - qcom,kaanapali-lpass-lpiaon-noc
+      - qcom,kaanapali-lpass-lpicx-noc
+      - qcom,kaanapali-mc-virt
+      - qcom,kaanapali-mmss-noc
+      - qcom,kaanapali-nsp-noc
+      - qcom,kaanapali-pcie-anoc
+      - qcom,kaanapali-system-noc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 3
+
+required:
+  - compatible
+
+allOf:
+  - $ref: qcom,rpmh-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,kaanapali-clk-virt
+              - qcom,kaanapali-mc-virt
+    then:
+      properties:
+        reg: false
+    else:
+      required:
+        - reg
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,kaanapali-pcie-anoc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre-NOC PCIe AXI clock
+            - description: cfg-NOC PCIe a-NOC AHB clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,kaanapali-aggre-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre UFS PHY AXI clock
+            - description: aggre USB3 PRIM AXI clock
+            - description: RPMH CC IPA clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,kaanapali-aggre-noc
+              - qcom,kaanapali-pcie-anoc
+    then:
+      required:
+        - clocks
+    else:
+      properties:
+        clocks: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    clk_virt: interconnect-0 {
+      compatible = "qcom,kaanapali-clk-virt";
+      #interconnect-cells = <2>;
+      qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+
+    aggre_noc: interconnect@16e0000 {
+      compatible = "qcom,kaanapali-aggre-noc";
+      reg = <0x016e0000 0x42400>;
+      #interconnect-cells = <2>;
+      clocks = <&gcc_aggre_ufs_phy_axi_clk>,
+               <&gcc_aggre_usb3_prim_axi_clk>,
+               <&rpmhcc_ipa_clk>;
+      qcom,bcm-voters = <&apps_bcm_voter>;
+    };
diff --git a/include/dt-bindings/interconnect/qcom,kaanapali-rpmh.h b/include/dt-bindings/interconnect/qcom,kaanapali-rpmh.h
new file mode 100644
index 0000000000000000000000000000000000000000..dde3f9abd67764421f54f8d222979727905a0a73
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,kaanapali-rpmh.h
@@ -0,0 +1,149 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_KAANAPALI_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_KAANAPALI_H
+
+#define MASTER_QSPI_0				0
+#define MASTER_CRYPTO				1
+#define MASTER_QUP_1				2
+#define MASTER_SDCC_4				3
+#define MASTER_UFS_MEM				4
+#define MASTER_USB3				5
+#define MASTER_QUP_2				6
+#define MASTER_QUP_3				7
+#define MASTER_QUP_4				8
+#define MASTER_IPA				9
+#define MASTER_SOCCP_PROC			10
+#define MASTER_SP				11
+#define MASTER_QDSS_ETR				12
+#define MASTER_QDSS_ETR_1			13
+#define MASTER_SDCC_2				14
+#define SLAVE_A1NOC_SNOC			15
+#define SLAVE_A2NOC_SNOC			16
+
+#define MASTER_QUP_CORE_0			0
+#define MASTER_QUP_CORE_1			1
+#define MASTER_QUP_CORE_2			2
+#define MASTER_QUP_CORE_3			3
+#define MASTER_QUP_CORE_4			4
+#define SLAVE_QUP_CORE_0			5
+#define SLAVE_QUP_CORE_1			6
+#define SLAVE_QUP_CORE_2			7
+#define SLAVE_QUP_CORE_3			8
+#define SLAVE_QUP_CORE_4			9
+
+#define MASTER_CNOC_CFG				0
+#define SLAVE_AHB2PHY_SOUTH			1
+#define SLAVE_AHB2PHY_NORTH			2
+#define SLAVE_CAMERA_CFG			3
+#define SLAVE_CLK_CTL				4
+#define SLAVE_CRYPTO_0_CFG			5
+#define SLAVE_DISPLAY_CFG			6
+#define SLAVE_EVA_CFG				7
+#define SLAVE_GFX3D_CFG				8
+#define SLAVE_I2C				9
+#define SLAVE_I3C_IBI0_CFG			10
+#define SLAVE_I3C_IBI1_CFG			11
+#define SLAVE_IMEM_CFG				12
+#define SLAVE_IPC_ROUTER_CFG			13
+#define SLAVE_CNOC_MSS				14
+#define SLAVE_PCIE_CFG				15
+#define SLAVE_PRNG				16
+#define SLAVE_QDSS_CFG				17
+#define SLAVE_QSPI_0				18
+#define SLAVE_QUP_1				19
+#define SLAVE_QUP_2				20
+#define SLAVE_QUP_3				21
+#define SLAVE_QUP_4				22
+#define SLAVE_SDCC_2				23
+#define SLAVE_SDCC_4				24
+#define SLAVE_SPSS_CFG				25
+#define SLAVE_TCSR				26
+#define SLAVE_TLMM				27
+#define SLAVE_UFS_MEM_CFG			28
+#define SLAVE_USB3				29
+#define SLAVE_VENUS_CFG				30
+#define SLAVE_VSENSE_CTRL_CFG			31
+#define SLAVE_CNOC_MNOC_CFG			32
+#define SLAVE_PCIE_ANOC_CFG			33
+#define SLAVE_QDSS_STM				34
+#define SLAVE_TCU				35
+
+#define MASTER_GEM_NOC_CNOC			0
+#define MASTER_GEM_NOC_PCIE_SNOC		1
+#define SLAVE_AOSS				2
+#define SLAVE_IPA_CFG				3
+#define SLAVE_IPC_ROUTER_FENCE			4
+#define SLAVE_SOCCP				5
+#define SLAVE_TME_CFG				6
+#define SLAVE_APPSS				7
+#define SLAVE_CNOC_CFG				8
+#define SLAVE_DDRSS_CFG				9
+#define SLAVE_BOOT_IMEM				10
+#define SLAVE_IMEM				11
+#define SLAVE_PCIE_0				12
+
+#define MASTER_GPU_TCU				0
+#define MASTER_SYS_TCU				1
+#define MASTER_APPSS_PROC			2
+#define MASTER_GFX3D				3
+#define MASTER_LPASS_GEM_NOC			4
+#define MASTER_MSS_PROC				5
+#define MASTER_MNOC_HF_MEM_NOC			6
+#define MASTER_MNOC_SF_MEM_NOC			7
+#define MASTER_COMPUTE_NOC			8
+#define MASTER_ANOC_PCIE_GEM_NOC		9
+#define MASTER_QPACE				10
+#define MASTER_SNOC_SF_MEM_NOC			11
+#define MASTER_WLAN_Q6				12
+#define MASTER_GIC				13
+#define SLAVE_GEM_NOC_CNOC			14
+#define SLAVE_LLCC				15
+#define SLAVE_MEM_NOC_PCIE_SNOC			16
+
+#define MASTER_LPIAON_NOC			0
+#define SLAVE_LPASS_GEM_NOC			1
+
+#define MASTER_LPASS_LPINOC			0
+#define SLAVE_LPIAON_NOC_LPASS_AG_NOC		1
+
+#define MASTER_LPASS_PROC			0
+#define SLAVE_LPICX_NOC_LPIAON_NOC		1
+
+#define MASTER_LLCC				0
+#define SLAVE_EBI1				1
+
+#define MASTER_CAMNOC_HF			0
+#define MASTER_CAMNOC_NRT_ICP_SF		1
+#define MASTER_CAMNOC_RT_CDM_SF			2
+#define MASTER_CAMNOC_SF			3
+#define MASTER_MDP				4
+#define MASTER_MDSS_DCP				5
+#define MASTER_CDSP_HCP				6
+#define MASTER_VIDEO_CV_PROC			7
+#define MASTER_VIDEO_EVA			8
+#define MASTER_VIDEO_MVP			9
+#define MASTER_VIDEO_V_PROC			10
+#define MASTER_CNOC_MNOC_CFG			11
+#define SLAVE_MNOC_HF_MEM_NOC			12
+#define SLAVE_MNOC_SF_MEM_NOC			13
+#define SLAVE_SERVICE_MNOC			14
+
+#define MASTER_CDSP_PROC			0
+#define SLAVE_CDSP_MEM_NOC			1
+
+#define MASTER_PCIE_ANOC_CFG			0
+#define MASTER_PCIE_0				1
+#define SLAVE_ANOC_PCIE_GEM_NOC			2
+#define SLAVE_SERVICE_PCIE_ANOC			3
+
+#define MASTER_A1NOC_SNOC			0
+#define MASTER_A2NOC_SNOC			1
+#define MASTER_APSS_NOC				2
+#define MASTER_CNOC_SNOC			3
+#define SLAVE_SNOC_GEM_NOC_SF			4
+
+#endif

-- 
2.43.0


