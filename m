Return-Path: <linux-arm-msm+bounces-66962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55807B147DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 07:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6CBD1891271
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 05:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0502505AF;
	Tue, 29 Jul 2025 05:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k3EEsd7O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFE424DCED
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753767795; cv=none; b=nJ9oV9pz3QLLU+RLs0aR+lXmfqSbdQQeHk5nBgtfoKWem2+mrnvNfszv4QwsBC3HHiLsxX6hEg+BlmIqfp+FYxnsX7K0dyQ0xo6eL4r/G+0hH2PT1PdRpvyJGsmWa19Y++YMSWA6z3BjmL7xBri+sF27zDcyNBQtpV+on3dtmfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753767795; c=relaxed/simple;
	bh=B7yfNhAPTaHmPFdMm4w8rrRa0X+g9YWD+T/2/6tkgjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rrV7VXqFiQr9CYTMtv/i9vJhVbL5tHqmWLdlpTQze/kIj0oL1BDKj83lhNn0k6VjAycofg6UUd1pX01pBgOTFe2RVdoClv80EJeU2yUYtpXhHTeyArt1nIf8HZN2yF9ZD1qj5RCzd4DaaT+56W2aXVglNdeIrCN7BmbHEPgUGj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k3EEsd7O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SLNYkY026526
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UJrwEl/xaovpeUtnFrslCbcgzcQo9F5iF+dVh/Cp8Kg=; b=k3EEsd7Odmslv8jP
	/zYk4XmukCWSSORAAlNC2uZXGFL//brRgxNJwX3HxntISaGnm9OLrULzNvQX+HNh
	cZiTK0Eey8luEvlnx08aKnT2JODmE/BsivEQC5DV/1LE4AUaByUsYpNmDzxWXDd4
	uGKi/bHaqDuFEthTZP4AnD4aEOP4ExhstbkXps5aJ3K3QE/E1D9CuRkedeP/ii0D
	rzo2nwf2aBBloxhmVS/b9zsij/AEQwx/Spe6dwnElYco+wTHr2ncOZ99qad8Khxl
	ZKY3r3O9Mb6FHbg6kwqGdzXaqFkBmkzt+8XwypQdEeyL4s7IsXchugGmysDsUhwD
	kcH1BA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcr73xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:43:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24011c9da24so5274685ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 22:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753767790; x=1754372590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJrwEl/xaovpeUtnFrslCbcgzcQo9F5iF+dVh/Cp8Kg=;
        b=UX48iMEDdiHwrBZ4+DvqvvTWirOpVy12TkgOJgLbvWNoHMRPWiZKsy2TgA8LwDAwC2
         2+kVh8Eo8KWonR1TAux3/EHKg0EJgeFQNCANt3QnwjDEB5jAzhaSXbnLjaDMKwgcsZCs
         8TUAg/rPpVmo5TRJYfw1HmAg3QGkuhcX9QungkuTi6WBlX7A3yZTrHQd//AHrqtV4Ao8
         yPToNwKZ7AIhrFxANrkYI1EKUZIZK+uJN3pFcQIJWHFbut+B7nAeRXzOib+sWYGZjJKi
         RbG9c/CU89ZsjLHH/SOuA5+3Da0Z74msMVFuAD2MbRER2UZb+thvrUrcsc2HVYHHeCp7
         KTyw==
X-Gm-Message-State: AOJu0Yz1KS85xaKubIAccruuP0fZHHs5+/cro5jQkmYYsZbhEJ+u9hRc
	CS6zuCTWLLOsg/jJo0oHGyt3+zvJtJ5WrXrdossbJDC+yzqNuJ+r1MZ8kuhipzbeCIXSw5HcGMd
	YlaRd13X72o0Grdo0n2ALHqcueGr+eglzvoFDam5dQMDI7/ZCjf6M7OCz7KdvQTHRcL8f
X-Gm-Gg: ASbGncvzPN2Eb1VO5XkoYSKu+k1kD5hwQmvA68vjK1j/JUvYahXjNQ4fkvnxOVBoWae
	Ol9TS9uWFFPW8R2YcaEJFT7xLpA5yyL8zDZda5J57QCNFWs8v08oFYIKPq7XCdQBX6O6P3t05Qc
	Y2X8WFy1I0UdwGgKqr6h53szUfBqapjt4M4d/QLvE2PyuK6MLWeNsftYMdb5w/LhIOEEsRwg4zo
	aNOII65Vu5PYPtxPjVLI8xZJUYdMjC9+GfxZjzZe6nT8q1+W63GCMT2ELP8vVrX7iX9UYe8+cUL
	DkIBUEP93MTdRheqsntVY6cjL7l5Zl1DMmI3QAvjzq+zg6t/q7+KvOFfXcVjRiCT
X-Received: by 2002:a17:903:2f0c:b0:215:b1e3:c051 with SMTP id d9443c01a7336-24063d142a2mr25886875ad.11.1753767790047;
        Mon, 28 Jul 2025 22:43:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcmozyuCpHOdJx64pbwa0ZWxekFyR9ySU6lw0m5Cdxn1Cq+5FfCu5OLj6fglGqCPzuGNPLbw==
X-Received: by 2002:a17:903:2f0c:b0:215:b1e3:c051 with SMTP id d9443c01a7336-24063d142a2mr25886595ad.11.1753767789515;
        Mon, 28 Jul 2025 22:43:09 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fe9b67485sm54505235ad.47.2025.07.28.22.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 22:43:09 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 11:12:40 +0530
Subject: [PATCH v3 6/7] dt-bindings: clock: qcom: document the Glymur
 Global Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-6-227cfe5c8ef4@oss.qualcomm.com>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
To: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA0MSBTYWx0ZWRfX9XbeM0GSFzCZ
 BfD1u4NxkC/VWvP0KrTMoorpJ1Iauyp1wJF9m+g/1SAwIo6orqBUC2ZIyvYQvfnmZqj3uNSEXFs
 d6ZsaOvljTV6HThTyloVQIwt57oXoOuLJMVPrFHockwSfXzck2YUN8RiUyC56otfphQ7Qh8Nkk9
 QNdHOs9IfdXY/JcZAeemUmYu02+h2BdiMXP2rqZ9dcNEyqx/fXKWf8Yx5SUuRfVgradKSDwbg0P
 StO14FBTe+sfhhwjnjR9SOc9rtbEG6INrWSWu78uTxH3N4+JFB1OILcUBM0pbIF6x1v3QecubzN
 42j/xv4y1XrNjwncElNqtnLb1FUbJrKT6P9vJO+3XXK2WpPXf2vvc3WS6d/77Wt5SF+WEZdH5kJ
 sDpiNuqTHm6n5NAmaCthp40/DWH7g2U6l1xQKoDCfnoFvimEzg0ouqajVgLKyk6k5Olkj1sP
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=68885f6f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=O8JL1BJpoaEYJYFQDtEA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: -6cbksEy1cGFP18KDFvglUCqn3Qsqcjt
X-Proofpoint-ORIG-GUID: -6cbksEy1cGFP18KDFvglUCqn3Qsqcjt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_01,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290041

Add device tree bindings for global clock controller on Glymur SoCs.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,glymur-gcc.yaml | 122 +++++
 include/dt-bindings/clock/qcom,glymur-gcc.h        | 578 +++++++++++++++++++++
 2 files changed, 700 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bd9530fc578d6c933eecad98e8237fd25a63b34b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,glymur-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on Glymur
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on Glymur.
+
+  See also: include/dt-bindings/clock/qcom,glymur-gcc.h
+
+properties:
+  compatible:
+    const: qcom,glymur-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board XO_A source
+      - description: Sleep clock source
+      - description: USB 0 Phy DP0 GMUX clock source
+      - description: USB 0 Phy DP1 GMUX clock source
+      - description: USB 0 Phy PCIE PIPEGMUX clock source
+      - description: USB 0 Phy PIPEGMUX clock source
+      - description: USB 0 Phy SYS PCIE PIPEGMUX clock source
+      - description: USB 1 Phy DP0 GMUX 2 clock source
+      - description: USB 1 Phy DP1 GMUX 2 clock source
+      - description: USB 1 Phy PCIE PIPEGMUX clock source
+      - description: USB 1 Phy PIPEGMUX clock source
+      - description: USB 1 Phy SYS PCIE PIPEGMUX clock source
+      - description: USB 2 Phy DP0 GMUX 2 clock source
+      - description: USB 2 Phy DP1 GMUX 2 clock source
+      - description: USB 2 Phy PCIE PIPEGMUX clock source
+      - description: USB 2 Phy PIPEGMUX clock source
+      - description: USB 2 Phy SYS PCIE PIPEGMUX clock source
+      - description: PCIe 3a pipe clock
+      - description: PCIe 4b pipe clock
+      - description: PCIe 4 pipe clock
+      - description: PCIe 5 pipe clock
+      - description: PCIe 6 pipe clock
+      - description: PCIe 6b pipe clock
+      - description: QUSB4 0 PHY RX 0 clock source
+      - description: QUSB4 0 PHY RX 1 clock source
+      - description: QUSB4 1 PHY RX 0 clock source
+      - description: QUSB4 1 PHY RX 1 clock source
+      - description: QUSB4 2 PHY RX 0 clock source
+      - description: QUSB4 2 PHY RX 1 clock source
+      - description: UFS PHY RX Symbol 0 clock source
+      - description: UFS PHY RX Symbol 1 clock source
+      - description: UFS PHY TX Symbol 0 clock source
+      - description: USB3 PHY 0 pipe clock source
+      - description: USB3 PHY 1 pipe clock source
+      - description: USB3 PHY 2 pipe clock source
+      - description: USB3 UNI PHY pipe 0 clock source
+      - description: USB3 UNI PHY pipe 1 clock source
+      - description: USB4 PHY 0 pcie pipe clock source
+      - description: USB4 PHY 0 Max pipe clock source
+      - description: USB4 PHY 1 pcie pipe clock source
+      - description: USB4 PHY 1 Max pipe clock source
+      - description: USB4 PHY 2 pcie pipe clock source
+      - description: USB4 PHY 2 Max pipe clock source
+
+required:
+  - compatible
+  - clocks
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@100000 {
+      compatible = "qcom,glymur-gcc";
+      reg = <0x100000 0x1f9000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&sleep_clk>,
+               <&usb_0_phy_dp0_gmux>,
+               <&usb_0_phy_dp1_gmux>,
+               <&usb_0_phy_pcie_pipegmux>,
+               <&usb_0_phy_pipegmux>,
+               <&usb_0_phy_sys_pcie_pipegmux>,
+               <&usb_1_phy_dp0_gmux_2>,
+               <&usb_1_phy_dp1_gmux_2>,
+               <&usb_1_phy_pcie_pipegmux>,
+               <&usb_1_phy_pipegmux>,
+               <&usb_1_phy_sys_pcie_pipegmux>,
+               <&usb_2_phy_dp0_gmux 2>,
+               <&usb_2_phy_dp1_gmux 2>,
+               <&usb_2_phy_pcie_pipegmux>,
+               <&usb_2_phy_pipegmux>,
+               <&usb_2_phy_sys_pcie_pipegmux>,
+               <&pcie_3a_pipe>, <&pcie_4b_pipe>,
+               <&pcie_4_pipe>, <&pcie_5_pipe>,
+               <&pcie_6_pipe>, <&pcie_6b_pipe>,
+               <&qusb4_0_phy_rx_0>, <&qusb4_0_phy_rx_1>,
+               <&qusb4_1_phy_rx_0>, <&qusb4_1_phy_rx_1>,
+               <&qusb4_2_phy_rx_0>, <&qusb4_2_phy_rx_1>,
+               <&ufs_phy_rx_symbol_0>, <&ufs_phy_rx_symbol_1>,
+               <&ufs_phy_tx_symbol_0>,
+               <&usb3_phy_0_pipe>, <&usb3_phy_1_pipe>,
+               <&usb3_phy_2_pipe>,
+               <&usb3_uni_phy_pipe_0>, <&usb3_uni_phy_pipe_1>,
+               <&usb4_phy_0_pcie_pipe>, <&usb4_phy_0_max_pipe>,
+               <&usb4_phy_1_pcie_pipe>, <&usb4_phy_1_max_pipe>,
+               <&usb4_phy_2_pcie_pipe>, <&usb4_phy_2_max_pipe>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,glymur-gcc.h b/include/dt-bindings/clock/qcom,glymur-gcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..10c12b8c51c34c5931c34b4437be03aea098ba53
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-gcc.h
@@ -0,0 +1,578 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_GLYMUR_H
+
+/* GCC clocks */
+#define GCC_GPLL0						0
+#define GCC_GPLL0_OUT_EVEN					1
+#define GCC_GPLL1						2
+#define GCC_GPLL14						3
+#define GCC_GPLL14_OUT_EVEN					4
+#define GCC_GPLL4						5
+#define GCC_GPLL5						6
+#define GCC_GPLL7						7
+#define GCC_GPLL8						8
+#define GCC_GPLL9						9
+#define GCC_AGGRE_NOC_PCIE_3A_WEST_SF_AXI_CLK			10
+#define GCC_AGGRE_NOC_PCIE_3B_WEST_SF_AXI_CLK			11
+#define GCC_AGGRE_NOC_PCIE_4_WEST_SF_AXI_CLK			12
+#define GCC_AGGRE_NOC_PCIE_5_EAST_SF_AXI_CLK			13
+#define GCC_AGGRE_NOC_PCIE_6_WEST_SF_AXI_CLK			14
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				15
+#define GCC_AGGRE_UFS_PHY_AXI_HW_CTL_CLK			16
+#define GCC_AGGRE_USB2_PRIM_AXI_CLK				17
+#define GCC_AGGRE_USB3_MP_AXI_CLK				18
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				19
+#define GCC_AGGRE_USB3_SEC_AXI_CLK				20
+#define GCC_AGGRE_USB3_TERT_AXI_CLK				21
+#define GCC_AGGRE_USB4_0_AXI_CLK				22
+#define GCC_AGGRE_USB4_1_AXI_CLK				23
+#define GCC_AGGRE_USB4_2_AXI_CLK				24
+#define GCC_AV1E_AHB_CLK					25
+#define GCC_AV1E_AXI_CLK					26
+#define GCC_AV1E_XO_CLK						27
+#define GCC_BOOT_ROM_AHB_CLK					28
+#define GCC_CAMERA_AHB_CLK					29
+#define GCC_CAMERA_HF_AXI_CLK					30
+#define GCC_CAMERA_SF_AXI_CLK					31
+#define GCC_CAMERA_XO_CLK					32
+#define GCC_CFG_NOC_PCIE_ANOC_AHB_CLK				33
+#define GCC_CFG_NOC_PCIE_ANOC_SOUTH_AHB_CLK			34
+#define GCC_CFG_NOC_USB2_PRIM_AXI_CLK				35
+#define GCC_CFG_NOC_USB3_MP_AXI_CLK				36
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				37
+#define GCC_CFG_NOC_USB3_SEC_AXI_CLK				38
+#define GCC_CFG_NOC_USB3_TERT_AXI_CLK				39
+#define GCC_CFG_NOC_USB_ANOC_AHB_CLK				40
+#define GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK			41
+#define GCC_DISP_AHB_CLK					42
+#define GCC_DISP_HF_AXI_CLK					43
+#define GCC_EVA_AHB_CLK						44
+#define GCC_EVA_AXI0_CLK					45
+#define GCC_EVA_AXI0C_CLK					46
+#define GCC_EVA_XO_CLK						47
+#define GCC_GP1_CLK						48
+#define GCC_GP1_CLK_SRC						49
+#define GCC_GP2_CLK						50
+#define GCC_GP2_CLK_SRC						51
+#define GCC_GP3_CLK						52
+#define GCC_GP3_CLK_SRC						53
+#define GCC_GPU_CFG_AHB_CLK					54
+#define GCC_GPU_GEMNOC_GFX_CLK					55
+#define GCC_GPU_GPLL0_CLK_SRC					56
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				57
+#define GCC_PCIE_0_AUX_CLK					58
+#define GCC_PCIE_0_AUX_CLK_SRC					59
+#define GCC_PCIE_0_CFG_AHB_CLK					60
+#define GCC_PCIE_0_MSTR_AXI_CLK					61
+#define GCC_PCIE_0_PHY_RCHNG_CLK				62
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC				63
+#define GCC_PCIE_0_PIPE_CLK					64
+#define GCC_PCIE_0_SLV_AXI_CLK					65
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				66
+#define GCC_PCIE_1_AUX_CLK					67
+#define GCC_PCIE_1_AUX_CLK_SRC					68
+#define GCC_PCIE_1_CFG_AHB_CLK					69
+#define GCC_PCIE_1_MSTR_AXI_CLK					70
+#define GCC_PCIE_1_PHY_RCHNG_CLK				71
+#define GCC_PCIE_1_PHY_RCHNG_CLK_SRC				72
+#define GCC_PCIE_1_PIPE_CLK					73
+#define GCC_PCIE_1_SLV_AXI_CLK					74
+#define GCC_PCIE_1_SLV_Q2A_AXI_CLK				75
+#define GCC_PCIE_2_AUX_CLK					76
+#define GCC_PCIE_2_AUX_CLK_SRC					77
+#define GCC_PCIE_2_CFG_AHB_CLK					78
+#define GCC_PCIE_2_MSTR_AXI_CLK					79
+#define GCC_PCIE_2_PHY_RCHNG_CLK				80
+#define GCC_PCIE_2_PHY_RCHNG_CLK_SRC				81
+#define GCC_PCIE_2_PIPE_CLK					82
+#define GCC_PCIE_2_SLV_AXI_CLK					83
+#define GCC_PCIE_2_SLV_Q2A_AXI_CLK				84
+#define GCC_PCIE_3A_AUX_CLK					85
+#define GCC_PCIE_3A_AUX_CLK_SRC					86
+#define GCC_PCIE_3A_CFG_AHB_CLK					87
+#define GCC_PCIE_3A_MSTR_AXI_CLK				88
+#define GCC_PCIE_3A_PHY_RCHNG_CLK				89
+#define GCC_PCIE_3A_PHY_RCHNG_CLK_SRC				90
+#define GCC_PCIE_3A_PIPE_CLK					91
+#define GCC_PCIE_3A_PIPE_CLK_SRC				92
+#define GCC_PCIE_3A_SLV_AXI_CLK					93
+#define GCC_PCIE_3A_SLV_Q2A_AXI_CLK				94
+#define GCC_PCIE_3B_AUX_CLK					95
+#define GCC_PCIE_3B_AUX_CLK_SRC					96
+#define GCC_PCIE_3B_CFG_AHB_CLK					97
+#define GCC_PCIE_3B_MSTR_AXI_CLK				98
+#define GCC_PCIE_3B_PHY_RCHNG_CLK				99
+#define GCC_PCIE_3B_PHY_RCHNG_CLK_SRC				100
+#define GCC_PCIE_3B_PIPE_CLK					101
+#define GCC_PCIE_3B_PIPE_CLK_SRC				102
+#define GCC_PCIE_3B_PIPE_DIV2_CLK				103
+#define GCC_PCIE_3B_PIPE_DIV_CLK_SRC				104
+#define GCC_PCIE_3B_SLV_AXI_CLK					105
+#define GCC_PCIE_3B_SLV_Q2A_AXI_CLK				106
+#define GCC_PCIE_4_AUX_CLK					107
+#define GCC_PCIE_4_AUX_CLK_SRC					108
+#define GCC_PCIE_4_CFG_AHB_CLK					109
+#define GCC_PCIE_4_MSTR_AXI_CLK					110
+#define GCC_PCIE_4_PHY_RCHNG_CLK				111
+#define GCC_PCIE_4_PHY_RCHNG_CLK_SRC				112
+#define GCC_PCIE_4_PIPE_CLK					113
+#define GCC_PCIE_4_PIPE_CLK_SRC					114
+#define GCC_PCIE_4_PIPE_DIV2_CLK				115
+#define GCC_PCIE_4_PIPE_DIV_CLK_SRC				116
+#define GCC_PCIE_4_SLV_AXI_CLK					117
+#define GCC_PCIE_4_SLV_Q2A_AXI_CLK				118
+#define GCC_PCIE_5_AUX_CLK					119
+#define GCC_PCIE_5_AUX_CLK_SRC					120
+#define GCC_PCIE_5_CFG_AHB_CLK					121
+#define GCC_PCIE_5_MSTR_AXI_CLK					122
+#define GCC_PCIE_5_PHY_RCHNG_CLK				123
+#define GCC_PCIE_5_PHY_RCHNG_CLK_SRC				124
+#define GCC_PCIE_5_PIPE_CLK					125
+#define GCC_PCIE_5_PIPE_CLK_SRC					126
+#define GCC_PCIE_5_PIPE_DIV2_CLK				127
+#define GCC_PCIE_5_PIPE_DIV_CLK_SRC				128
+#define GCC_PCIE_5_SLV_AXI_CLK					129
+#define GCC_PCIE_5_SLV_Q2A_AXI_CLK				130
+#define GCC_PCIE_6_AUX_CLK					131
+#define GCC_PCIE_6_AUX_CLK_SRC					132
+#define GCC_PCIE_6_CFG_AHB_CLK					133
+#define GCC_PCIE_6_MSTR_AXI_CLK					134
+#define GCC_PCIE_6_PHY_RCHNG_CLK				135
+#define GCC_PCIE_6_PHY_RCHNG_CLK_SRC				136
+#define GCC_PCIE_6_PIPE_CLK					137
+#define GCC_PCIE_6_PIPE_CLK_SRC					138
+#define GCC_PCIE_6_PIPE_DIV2_CLK				139
+#define GCC_PCIE_6_PIPE_DIV_CLK_SRC				140
+#define GCC_PCIE_6_SLV_AXI_CLK					141
+#define GCC_PCIE_6_SLV_Q2A_AXI_CLK				142
+#define GCC_PCIE_NOC_PWRCTL_CLK					143
+#define GCC_PCIE_NOC_QOSGEN_EXTREF_CLK				144
+#define GCC_PCIE_NOC_SF_CENTER_CLK				145
+#define GCC_PCIE_NOC_SLAVE_SF_EAST_CLK				146
+#define GCC_PCIE_NOC_SLAVE_SF_WEST_CLK				147
+#define GCC_PCIE_NOC_TSCTR_CLK					148
+#define GCC_PCIE_PHY_3A_AUX_CLK					149
+#define GCC_PCIE_PHY_3A_AUX_CLK_SRC				150
+#define GCC_PCIE_PHY_3B_AUX_CLK					151
+#define GCC_PCIE_PHY_3B_AUX_CLK_SRC				152
+#define GCC_PCIE_PHY_4_AUX_CLK					153
+#define GCC_PCIE_PHY_4_AUX_CLK_SRC				154
+#define GCC_PCIE_PHY_5_AUX_CLK					155
+#define GCC_PCIE_PHY_5_AUX_CLK_SRC				156
+#define GCC_PCIE_PHY_6_AUX_CLK					157
+#define GCC_PCIE_PHY_6_AUX_CLK_SRC				158
+#define GCC_PCIE_RSCC_CFG_AHB_CLK				159
+#define GCC_PCIE_RSCC_XO_CLK					160
+#define GCC_PDM2_CLK						161
+#define GCC_PDM2_CLK_SRC					162
+#define GCC_PDM_AHB_CLK						163
+#define GCC_PDM_XO4_CLK						164
+#define GCC_QMIP_AV1E_AHB_CLK					165
+#define GCC_QMIP_CAMERA_CMD_AHB_CLK				166
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				167
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				168
+#define GCC_QMIP_GPU_AHB_CLK					169
+#define GCC_QMIP_PCIE_3A_AHB_CLK				170
+#define GCC_QMIP_PCIE_3B_AHB_CLK				171
+#define GCC_QMIP_PCIE_4_AHB_CLK					172
+#define GCC_QMIP_PCIE_5_AHB_CLK					173
+#define GCC_QMIP_PCIE_6_AHB_CLK					174
+#define GCC_QMIP_VIDEO_CV_CPU_AHB_CLK				175
+#define GCC_QMIP_VIDEO_CVP_AHB_CLK				176
+#define GCC_QMIP_VIDEO_V_CPU_AHB_CLK				177
+#define GCC_QMIP_VIDEO_VCODEC1_AHB_CLK				178
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				179
+#define GCC_QUPV3_OOB_CORE_2X_CLK				180
+#define GCC_QUPV3_OOB_CORE_CLK					181
+#define GCC_QUPV3_OOB_M_AHB_CLK					182
+#define GCC_QUPV3_OOB_QSPI_S0_CLK				183
+#define GCC_QUPV3_OOB_QSPI_S0_CLK_SRC				184
+#define GCC_QUPV3_OOB_QSPI_S1_CLK				185
+#define GCC_QUPV3_OOB_QSPI_S1_CLK_SRC				186
+#define GCC_QUPV3_OOB_S0_CLK					187
+#define GCC_QUPV3_OOB_S0_CLK_SRC				188
+#define GCC_QUPV3_OOB_S1_CLK					189
+#define GCC_QUPV3_OOB_S1_CLK_SRC				190
+#define GCC_QUPV3_OOB_S_AHB_CLK					191
+#define GCC_QUPV3_OOB_TCXO_CLK					192
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				193
+#define GCC_QUPV3_WRAP0_CORE_CLK				194
+#define GCC_QUPV3_WRAP0_QSPI_S2_CLK				195
+#define GCC_QUPV3_WRAP0_QSPI_S2_CLK_SRC				196
+#define GCC_QUPV3_WRAP0_QSPI_S3_CLK				197
+#define GCC_QUPV3_WRAP0_QSPI_S3_CLK_SRC				198
+#define GCC_QUPV3_WRAP0_QSPI_S6_CLK				199
+#define GCC_QUPV3_WRAP0_QSPI_S6_CLK_SRC				200
+#define GCC_QUPV3_WRAP0_S0_CLK					201
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				202
+#define GCC_QUPV3_WRAP0_S1_CLK					203
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				204
+#define GCC_QUPV3_WRAP0_S2_CLK					205
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				206
+#define GCC_QUPV3_WRAP0_S3_CLK					207
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				208
+#define GCC_QUPV3_WRAP0_S4_CLK					209
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				210
+#define GCC_QUPV3_WRAP0_S5_CLK					211
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC				212
+#define GCC_QUPV3_WRAP0_S6_CLK					213
+#define GCC_QUPV3_WRAP0_S6_CLK_SRC				214
+#define GCC_QUPV3_WRAP0_S7_CLK					215
+#define GCC_QUPV3_WRAP0_S7_CLK_SRC				216
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				217
+#define GCC_QUPV3_WRAP1_CORE_CLK				218
+#define GCC_QUPV3_WRAP1_QSPI_S2_CLK				219
+#define GCC_QUPV3_WRAP1_QSPI_S2_CLK_SRC				220
+#define GCC_QUPV3_WRAP1_QSPI_S3_CLK				221
+#define GCC_QUPV3_WRAP1_QSPI_S3_CLK_SRC				222
+#define GCC_QUPV3_WRAP1_QSPI_S6_CLK				223
+#define GCC_QUPV3_WRAP1_QSPI_S6_CLK_SRC				224
+#define GCC_QUPV3_WRAP1_S0_CLK					225
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				226
+#define GCC_QUPV3_WRAP1_S1_CLK					227
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				228
+#define GCC_QUPV3_WRAP1_S2_CLK					229
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				230
+#define GCC_QUPV3_WRAP1_S3_CLK					231
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				232
+#define GCC_QUPV3_WRAP1_S4_CLK					233
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				234
+#define GCC_QUPV3_WRAP1_S5_CLK					235
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				236
+#define GCC_QUPV3_WRAP1_S6_CLK					237
+#define GCC_QUPV3_WRAP1_S6_CLK_SRC				238
+#define GCC_QUPV3_WRAP1_S7_CLK					239
+#define GCC_QUPV3_WRAP1_S7_CLK_SRC				240
+#define GCC_QUPV3_WRAP2_CORE_2X_CLK				241
+#define GCC_QUPV3_WRAP2_CORE_CLK				242
+#define GCC_QUPV3_WRAP2_QSPI_S2_CLK				243
+#define GCC_QUPV3_WRAP2_QSPI_S2_CLK_SRC				244
+#define GCC_QUPV3_WRAP2_QSPI_S3_CLK				245
+#define GCC_QUPV3_WRAP2_QSPI_S3_CLK_SRC				246
+#define GCC_QUPV3_WRAP2_QSPI_S6_CLK				247
+#define GCC_QUPV3_WRAP2_QSPI_S6_CLK_SRC				248
+#define GCC_QUPV3_WRAP2_S0_CLK					249
+#define GCC_QUPV3_WRAP2_S0_CLK_SRC				250
+#define GCC_QUPV3_WRAP2_S1_CLK					251
+#define GCC_QUPV3_WRAP2_S1_CLK_SRC				252
+#define GCC_QUPV3_WRAP2_S2_CLK					253
+#define GCC_QUPV3_WRAP2_S2_CLK_SRC				254
+#define GCC_QUPV3_WRAP2_S3_CLK					255
+#define GCC_QUPV3_WRAP2_S3_CLK_SRC				256
+#define GCC_QUPV3_WRAP2_S4_CLK					257
+#define GCC_QUPV3_WRAP2_S4_CLK_SRC				258
+#define GCC_QUPV3_WRAP2_S5_CLK					259
+#define GCC_QUPV3_WRAP2_S5_CLK_SRC				260
+#define GCC_QUPV3_WRAP2_S6_CLK					261
+#define GCC_QUPV3_WRAP2_S6_CLK_SRC				262
+#define GCC_QUPV3_WRAP2_S7_CLK					263
+#define GCC_QUPV3_WRAP2_S7_CLK_SRC				264
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				265
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				266
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				267
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				268
+#define GCC_QUPV3_WRAP_2_M_AHB_CLK				269
+#define GCC_QUPV3_WRAP_2_S_AHB_CLK				270
+#define GCC_SDCC2_AHB_CLK					271
+#define GCC_SDCC2_APPS_CLK					272
+#define GCC_SDCC2_APPS_CLK_SRC					273
+#define GCC_SDCC4_AHB_CLK					274
+#define GCC_SDCC4_APPS_CLK					275
+#define GCC_SDCC4_APPS_CLK_SRC					276
+#define GCC_UFS_PHY_AHB_CLK					277
+#define GCC_UFS_PHY_AXI_CLK					278
+#define GCC_UFS_PHY_AXI_CLK_SRC					279
+#define GCC_UFS_PHY_AXI_HW_CTL_CLK				280
+#define GCC_UFS_PHY_ICE_CORE_CLK				281
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				282
+#define GCC_UFS_PHY_ICE_CORE_HW_CTL_CLK				283
+#define GCC_UFS_PHY_PHY_AUX_CLK					284
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				285
+#define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK				286
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				287
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC				288
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				289
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC				290
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				291
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC				292
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				293
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				294
+#define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK			295
+#define GCC_USB20_MASTER_CLK					296
+#define GCC_USB20_MASTER_CLK_SRC				297
+#define GCC_USB20_MOCK_UTMI_CLK					298
+#define GCC_USB20_MOCK_UTMI_CLK_SRC				299
+#define GCC_USB20_MOCK_UTMI_POSTDIV_CLK_SRC			300
+#define GCC_USB20_SLEEP_CLK					301
+#define GCC_USB30_MP_MASTER_CLK					302
+#define GCC_USB30_MP_MASTER_CLK_SRC				303
+#define GCC_USB30_MP_MOCK_UTMI_CLK				304
+#define GCC_USB30_MP_MOCK_UTMI_CLK_SRC				305
+#define GCC_USB30_MP_MOCK_UTMI_POSTDIV_CLK_SRC			306
+#define GCC_USB30_MP_SLEEP_CLK					307
+#define GCC_USB30_PRIM_MASTER_CLK				308
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				309
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				310
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			311
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		312
+#define GCC_USB30_PRIM_SLEEP_CLK				313
+#define GCC_USB30_SEC_MASTER_CLK				314
+#define GCC_USB30_SEC_MASTER_CLK_SRC				315
+#define GCC_USB30_SEC_MOCK_UTMI_CLK				316
+#define GCC_USB30_SEC_MOCK_UTMI_CLK_SRC				317
+#define GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC			318
+#define GCC_USB30_SEC_SLEEP_CLK					319
+#define GCC_USB30_TERT_MASTER_CLK				320
+#define GCC_USB30_TERT_MASTER_CLK_SRC				321
+#define GCC_USB30_TERT_MOCK_UTMI_CLK				322
+#define GCC_USB30_TERT_MOCK_UTMI_CLK_SRC			323
+#define GCC_USB30_TERT_MOCK_UTMI_POSTDIV_CLK_SRC		324
+#define GCC_USB30_TERT_SLEEP_CLK				325
+#define GCC_USB34_PRIM_PHY_PIPE_CLK_SRC				326
+#define GCC_USB34_SEC_PHY_PIPE_CLK_SRC				327
+#define GCC_USB34_TERT_PHY_PIPE_CLK_SRC				328
+#define GCC_USB3_MP_PHY_AUX_CLK					329
+#define GCC_USB3_MP_PHY_AUX_CLK_SRC				330
+#define GCC_USB3_MP_PHY_COM_AUX_CLK				331
+#define GCC_USB3_MP_PHY_PIPE_0_CLK				332
+#define GCC_USB3_MP_PHY_PIPE_0_CLK_SRC				333
+#define GCC_USB3_MP_PHY_PIPE_1_CLK				334
+#define GCC_USB3_MP_PHY_PIPE_1_CLK_SRC				335
+#define GCC_USB3_PRIM_PHY_AUX_CLK				336
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				337
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				338
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				339
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				340
+#define GCC_USB3_SEC_PHY_AUX_CLK				341
+#define GCC_USB3_SEC_PHY_AUX_CLK_SRC				342
+#define GCC_USB3_SEC_PHY_COM_AUX_CLK				343
+#define GCC_USB3_SEC_PHY_PIPE_CLK				344
+#define GCC_USB3_SEC_PHY_PIPE_CLK_SRC				345
+#define GCC_USB3_TERT_PHY_AUX_CLK				346
+#define GCC_USB3_TERT_PHY_AUX_CLK_SRC				347
+#define GCC_USB3_TERT_PHY_COM_AUX_CLK				348
+#define GCC_USB3_TERT_PHY_PIPE_CLK				349
+#define GCC_USB3_TERT_PHY_PIPE_CLK_SRC				350
+#define GCC_USB4_0_CFG_AHB_CLK					351
+#define GCC_USB4_0_DP0_CLK					352
+#define GCC_USB4_0_DP1_CLK					353
+#define GCC_USB4_0_MASTER_CLK					354
+#define GCC_USB4_0_MASTER_CLK_SRC				355
+#define GCC_USB4_0_PHY_DP0_CLK_SRC				356
+#define GCC_USB4_0_PHY_DP0_GMUX_CLK_SRC				357
+#define GCC_USB4_0_PHY_DP1_CLK_SRC				358
+#define GCC_USB4_0_PHY_DP1_GMUX_CLK_SRC				359
+#define GCC_USB4_0_PHY_P2RR2P_PIPE_CLK				360
+#define GCC_USB4_0_PHY_P2RR2P_PIPE_CLK_SRC			361
+#define GCC_USB4_0_PHY_PCIE_PIPE_CLK				362
+#define GCC_USB4_0_PHY_PCIE_PIPE_CLK_SRC			363
+#define GCC_USB4_0_PHY_PCIE_PIPE_MUX_CLK_SRC			364
+#define GCC_USB4_0_PHY_PCIE_PIPEGMUX_CLK_SRC			365
+#define GCC_USB4_0_PHY_PIPEGMUX_CLK_SRC				366
+#define GCC_USB4_0_PHY_RX0_CLK					367
+#define GCC_USB4_0_PHY_RX0_CLK_SRC				368
+#define GCC_USB4_0_PHY_RX1_CLK					369
+#define GCC_USB4_0_PHY_RX1_CLK_SRC				370
+#define GCC_USB4_0_PHY_SYS_CLK_SRC				371
+#define GCC_USB4_0_PHY_SYS_PIPEGMUX_CLK_SRC			372
+#define GCC_USB4_0_PHY_USB_PIPE_CLK				373
+#define GCC_USB4_0_SB_IF_CLK					374
+#define GCC_USB4_0_SB_IF_CLK_SRC				375
+#define GCC_USB4_0_SYS_CLK					376
+#define GCC_USB4_0_TMU_CLK					377
+#define GCC_USB4_0_TMU_CLK_SRC					378
+#define GCC_USB4_0_UC_HRR_CLK					379
+#define GCC_USB4_1_CFG_AHB_CLK					380
+#define GCC_USB4_1_DP0_CLK					381
+#define GCC_USB4_1_DP1_CLK					382
+#define GCC_USB4_1_MASTER_CLK					383
+#define GCC_USB4_1_MASTER_CLK_SRC				384
+#define GCC_USB4_1_PHY_DP0_CLK_SRC				385
+#define GCC_USB4_1_PHY_DP0_GMUX_2_CLK_SRC			386
+#define GCC_USB4_1_PHY_DP1_CLK_SRC				387
+#define GCC_USB4_1_PHY_DP1_GMUX_2_CLK_SRC			388
+#define GCC_USB4_1_PHY_P2RR2P_PIPE_CLK				389
+#define GCC_USB4_1_PHY_P2RR2P_PIPE_CLK_SRC			390
+#define GCC_USB4_1_PHY_PCIE_PIPE_CLK				391
+#define GCC_USB4_1_PHY_PCIE_PIPE_CLK_SRC			392
+#define GCC_USB4_1_PHY_PCIE_PIPE_MUX_CLK_SRC			393
+#define GCC_USB4_1_PHY_PCIE_PIPEGMUX_CLK_SRC			394
+#define GCC_USB4_1_PHY_PIPEGMUX_CLK_SRC				395
+#define GCC_USB4_1_PHY_PLL_PIPE_CLK_SRC				396
+#define GCC_USB4_1_PHY_RX0_CLK					397
+#define GCC_USB4_1_PHY_RX0_CLK_SRC				398
+#define GCC_USB4_1_PHY_RX1_CLK					399
+#define GCC_USB4_1_PHY_RX1_CLK_SRC				400
+#define GCC_USB4_1_PHY_SYS_CLK_SRC				401
+#define GCC_USB4_1_PHY_SYS_PIPEGMUX_CLK_SRC			402
+#define GCC_USB4_1_PHY_USB_PIPE_CLK				403
+#define GCC_USB4_1_SB_IF_CLK					404
+#define GCC_USB4_1_SB_IF_CLK_SRC				405
+#define GCC_USB4_1_SYS_CLK					406
+#define GCC_USB4_1_TMU_CLK					407
+#define GCC_USB4_1_TMU_CLK_SRC					408
+#define GCC_USB4_1_UC_HRR_CLK					409
+#define GCC_USB4_2_CFG_AHB_CLK					410
+#define GCC_USB4_2_DP0_CLK					411
+#define GCC_USB4_2_DP1_CLK					412
+#define GCC_USB4_2_MASTER_CLK					413
+#define GCC_USB4_2_MASTER_CLK_SRC				414
+#define GCC_USB4_2_PHY_DP0_CLK_SRC				415
+#define GCC_USB4_2_PHY_DP0_GMUX_CLK_SRC				416
+#define GCC_USB4_2_PHY_DP1_CLK_SRC				417
+#define GCC_USB4_2_PHY_DP1_GMUX_CLK_SRC				418
+#define GCC_USB4_2_PHY_P2RR2P_PIPE_CLK				419
+#define GCC_USB4_2_PHY_P2RR2P_PIPE_CLK_SRC			420
+#define GCC_USB4_2_PHY_PCIE_PIPE_CLK				421
+#define GCC_USB4_2_PHY_PCIE_PIPE_CLK_SRC			422
+#define GCC_USB4_2_PHY_PCIE_PIPE_MUX_CLK_SRC			423
+#define GCC_USB4_2_PHY_PCIE_PIPEGMUX_CLK_SRC			424
+#define GCC_USB4_2_PHY_PIPEGMUX_CLK_SRC				425
+#define GCC_USB4_2_PHY_RX0_CLK					426
+#define GCC_USB4_2_PHY_RX0_CLK_SRC				427
+#define GCC_USB4_2_PHY_RX1_CLK					428
+#define GCC_USB4_2_PHY_RX1_CLK_SRC				429
+#define GCC_USB4_2_PHY_SYS_CLK_SRC				430
+#define GCC_USB4_2_PHY_SYS_PIPEGMUX_CLK_SRC			431
+#define GCC_USB4_2_PHY_USB_PIPE_CLK				432
+#define GCC_USB4_2_SB_IF_CLK					433
+#define GCC_USB4_2_SB_IF_CLK_SRC				434
+#define GCC_USB4_2_SYS_CLK					435
+#define GCC_USB4_2_TMU_CLK					436
+#define GCC_USB4_2_TMU_CLK_SRC					437
+#define GCC_USB4_2_UC_HRR_CLK					438
+#define GCC_VIDEO_AHB_CLK					439
+#define GCC_VIDEO_AXI0_CLK					440
+#define GCC_VIDEO_AXI0C_CLK					441
+#define GCC_VIDEO_AXI1_CLK					442
+#define GCC_VIDEO_XO_CLK					443
+
+/* GCC power domains */
+#define GCC_PCIE_0_TUNNEL_GDSC					0
+#define GCC_PCIE_1_TUNNEL_GDSC					1
+#define GCC_PCIE_2_TUNNEL_GDSC					2
+#define GCC_PCIE_3A_GDSC					3
+#define GCC_PCIE_3A_PHY_GDSC					4
+#define GCC_PCIE_3B_GDSC					5
+#define GCC_PCIE_3B_PHY_GDSC					6
+#define GCC_PCIE_4_GDSC						7
+#define GCC_PCIE_4_PHY_GDSC					8
+#define GCC_PCIE_5_GDSC						9
+#define GCC_PCIE_5_PHY_GDSC					10
+#define GCC_PCIE_6_GDSC						11
+#define GCC_PCIE_6_PHY_GDSC					12
+#define GCC_UFS_PHY_GDSC					13
+#define GCC_USB20_PRIM_GDSC					14
+#define GCC_USB30_MP_GDSC					15
+#define GCC_USB30_PRIM_GDSC					16
+#define GCC_USB30_SEC_GDSC					17
+#define GCC_USB30_TERT_GDSC					18
+#define GCC_USB3_MP_SS0_PHY_GDSC				19
+#define GCC_USB3_MP_SS1_PHY_GDSC				20
+#define GCC_USB4_0_GDSC						21
+#define GCC_USB4_1_GDSC						22
+#define GCC_USB4_2_GDSC						23
+#define GCC_USB_0_PHY_GDSC					24
+#define GCC_USB_1_PHY_GDSC					25
+#define GCC_USB_2_PHY_GDSC					26
+
+/* GCC resets */
+#define GCC_AV1E_BCR						0
+#define GCC_CAMERA_BCR						1
+#define GCC_DISPLAY_BCR						2
+#define GCC_EVA_BCR						3
+#define GCC_GPU_BCR						4
+#define GCC_PCIE_0_LINK_DOWN_BCR				5
+#define GCC_PCIE_0_NOCSR_COM_PHY_BCR				6
+#define GCC_PCIE_0_PHY_BCR					7
+#define GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR			8
+#define GCC_PCIE_0_TUNNEL_BCR					9
+#define GCC_PCIE_1_LINK_DOWN_BCR				10
+#define GCC_PCIE_1_NOCSR_COM_PHY_BCR				11
+#define GCC_PCIE_1_PHY_BCR					12
+#define GCC_PCIE_1_PHY_NOCSR_COM_PHY_BCR			13
+#define GCC_PCIE_1_TUNNEL_BCR					14
+#define GCC_PCIE_2_LINK_DOWN_BCR				15
+#define GCC_PCIE_2_NOCSR_COM_PHY_BCR				16
+#define GCC_PCIE_2_PHY_BCR					17
+#define GCC_PCIE_2_PHY_NOCSR_COM_PHY_BCR			18
+#define GCC_PCIE_2_TUNNEL_BCR					19
+#define GCC_PCIE_3A_BCR						20
+#define GCC_PCIE_3A_LINK_DOWN_BCR				21
+#define GCC_PCIE_3A_NOCSR_COM_PHY_BCR				22
+#define GCC_PCIE_3A_PHY_BCR					23
+#define GCC_PCIE_3A_PHY_NOCSR_COM_PHY_BCR			24
+#define GCC_PCIE_3B_BCR						25
+#define GCC_PCIE_3B_LINK_DOWN_BCR				26
+#define GCC_PCIE_3B_NOCSR_COM_PHY_BCR				27
+#define GCC_PCIE_3B_PHY_BCR					28
+#define GCC_PCIE_3B_PHY_NOCSR_COM_PHY_BCR			29
+#define GCC_PCIE_4_BCR						30
+#define GCC_PCIE_4_LINK_DOWN_BCR				31
+#define GCC_PCIE_4_NOCSR_COM_PHY_BCR				32
+#define GCC_PCIE_4_PHY_BCR					33
+#define GCC_PCIE_4_PHY_NOCSR_COM_PHY_BCR			34
+#define GCC_PCIE_5_BCR						35
+#define GCC_PCIE_5_LINK_DOWN_BCR				36
+#define GCC_PCIE_5_NOCSR_COM_PHY_BCR				37
+#define GCC_PCIE_5_PHY_BCR					38
+#define GCC_PCIE_5_PHY_NOCSR_COM_PHY_BCR			39
+#define GCC_PCIE_6_BCR						40
+#define GCC_PCIE_6_LINK_DOWN_BCR				41
+#define GCC_PCIE_6_NOCSR_COM_PHY_BCR				42
+#define GCC_PCIE_6_PHY_BCR					43
+#define GCC_PCIE_6_PHY_NOCSR_COM_PHY_BCR			44
+#define GCC_PCIE_NOC_BCR					45
+#define GCC_PCIE_PHY_BCR					46
+#define GCC_PCIE_PHY_CFG_AHB_BCR				47
+#define GCC_PCIE_PHY_COM_BCR					48
+#define GCC_PCIE_RSCC_BCR					49
+#define GCC_PDM_BCR						50
+#define GCC_QUPV3_WRAPPER_0_BCR					51
+#define GCC_QUPV3_WRAPPER_1_BCR					52
+#define GCC_QUPV3_WRAPPER_2_BCR					53
+#define GCC_QUPV3_WRAPPER_OOB_BCR				54
+#define GCC_QUSB2PHY_HS0_MP_BCR					55
+#define GCC_QUSB2PHY_HS1_MP_BCR					56
+#define GCC_QUSB2PHY_PRIM_BCR					57
+#define GCC_QUSB2PHY_SEC_BCR					58
+#define GCC_QUSB2PHY_TERT_BCR					59
+#define GCC_QUSB2PHY_USB20_HS_BCR				60
+#define GCC_SDCC2_BCR						61
+#define GCC_SDCC4_BCR						62
+#define GCC_TCSR_PCIE_BCR					63
+#define GCC_UFS_PHY_BCR						64
+#define GCC_USB20_PRIM_BCR					65
+#define GCC_USB30_MP_BCR					66
+#define GCC_USB30_PRIM_BCR					67
+#define GCC_USB30_SEC_BCR					68
+#define GCC_USB30_TERT_BCR					69
+#define GCC_USB3_MP_SS0_PHY_BCR					70
+#define GCC_USB3_MP_SS1_PHY_BCR					71
+#define GCC_USB3_PHY_PRIM_BCR					72
+#define GCC_USB3_PHY_SEC_BCR					73
+#define GCC_USB3_PHY_TERT_BCR					74
+#define GCC_USB3_UNIPHY_MP0_BCR					75
+#define GCC_USB3_UNIPHY_MP1_BCR					76
+#define GCC_USB3PHY_PHY_PRIM_BCR				77
+#define GCC_USB3PHY_PHY_SEC_BCR					78
+#define GCC_USB3PHY_PHY_TERT_BCR				79
+#define GCC_USB3UNIPHY_PHY_MP0_BCR				80
+#define GCC_USB3UNIPHY_PHY_MP1_BCR				81
+#define GCC_USB4_0_BCR						82
+#define GCC_USB4_0_DP0_PHY_PRIM_BCR				83
+#define GCC_USB4_1_BCR						84
+#define GCC_USB4_2_BCR						85
+#define GCC_USB_0_PHY_BCR					86
+#define GCC_USB_1_PHY_BCR					87
+#define GCC_USB_2_PHY_BCR					88
+#define GCC_VIDEO_AXI0_CLK_ARES					89
+#define GCC_VIDEO_AXI1_CLK_ARES					90
+#define GCC_VIDEO_BCR						91
+
+#endif

-- 
2.34.1


