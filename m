Return-Path: <linux-arm-msm+bounces-65289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19819B07993
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0CFE58287B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343512F5C27;
	Wed, 16 Jul 2025 15:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M1Td6hf9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617FF2F548D
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752679256; cv=none; b=s1xGkx8JS2ecKF91zNYiZuVPWs6JE97hdC5UIp/+8WfUKxqWTp0ltqguc2OjRfqCRlmv8zbHziRZEu29UyWgmLVfL/HRMPWGccmcGvrnsfps/prKil89uxKzSuV3WJ+ZrMWZgmMxlaqWS7tLDrM5j/edA2Mk52YuJ+A+iiAFK9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752679256; c=relaxed/simple;
	bh=qgyUTdRP4L7N0aCnyIikX36DKcHjqEklGYHdVhsJkUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JOjtsjo19cApz8tvvGVo/eD+T8JEmD1E0ety96Bi04E47w9eiTWzqSNom7owMoB/9eLdWhFtMt2JX3lRGH0BCICnA07XYmyG+Xr8WrCVQnok4y6M0JDFS1ChebeW3b6sv8wjiaHed7u2Eo022BiUw1yw+Ch+YD7gGraV+yYjFjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M1Td6hf9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GD1WdI031464
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AXcj5nNFZ31
	j3Wi2nrpHhAyIaxTijc7s4rp9nA20KUc=; b=M1Td6hf9u04/fwVnn3DoTp73rQZ
	ayoe+vK4XEHiDv84I0Hz5HjbWqsRlXW8Tf+fxsAL7Ln6knkdcsdu55vYqBl1+quf
	qaX3VW+Gc/Wir0LyrWbFuCQtjYlAYGvdRohnWfMdhFcdA3H9FvUTtOpZga4xNjbY
	MZw8UHaNTAD4z/Sm9C/q4bpG7lRwWXnm/j3Dg2et/5b5Z4Mqlx6lRO8nSDZSE7ye
	5NZ9P2eWjKCP+fxC2CNDn4zapR6Fi6p+soTNE1YfKKPAsPNUZMstCPXdDAPAA1sS
	QihVnDtk46ESNreKTa+FUbkXPPmObKI+/3x+fYtTuBCffDL9GwmYR2OdfRA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7h8cg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:20:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235089528a0so9307475ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679251; x=1753284051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXcj5nNFZ31j3Wi2nrpHhAyIaxTijc7s4rp9nA20KUc=;
        b=U0z05mn41xVaD+KcTjjQ1e4iiuHoo2MXvgiJb8ErtFP7OCiT7UR1uzzx7zYMMNlz+o
         3uJOMUoEAT4TmqcM5Z4m5nDgT5bqQW0XyjA9AHFweLHWtBQygqejAldjgVkLPx3sxOHD
         AbJgy/fFEV1v07Atml7v/vIpjtFE/kURZzZIEtd4bQ2grFKTAlqsqho4mKumRVzYTLA1
         AmiY+yZxu7eXs/iQWJ0bvvvP6KJsacqYCsK0loUkSiGfzAe8b9VYBFVGd4iNQ3IXDcxX
         ptZ5T2cT2Ru7t7OD4TYMRnPQRKkwxY7xZk5+Jj7qJnz7SYy/eHgU3AQye4zI1cbMYt1g
         +9bg==
X-Forwarded-Encrypted: i=1; AJvYcCVVQl8G6ZRtnp6FWPVSCo8AaGEWtAeVKvChMShfllmdb6WmzA5U+pMtwObfSHgOEj1JXZqqnTY7Eb3uBUuZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy38T88OCHy/UjWRCvPJWJaWkwdTei1vFvfXLDXpdayVInzbRTT
	VFI6KhFh553RFJNigU6KgvfHgGo5SKLqtEaLRIs4kkIYhCATbYLCcYJdS5PprBTCE2DXBFJ7Kxd
	yOenuUQ0Zl7fxJxkfph1D6Q/3L0IE8q62YYoKDlgl5FuzWWQCXhCiT9UYvfsFCi5+BuG5
X-Gm-Gg: ASbGnctP4Vb//Fjv55ODJv38IA8E7WhEddjZIATimO3a9rZjh8cIg/0LWkwIxZnv969
	zqoT55rVdLaqZqUa1kE2PLZRhOWZ/ivzxi5aiqWOxE7kEgkujt2C9aiKnoxOzY4j0R7e5S3k/3j
	DMgmlpka9+Fo2q0zj+FFhm/tNgsAjLFkW+liAg7kE/xNZ5KrKzJTDv1ly+nwcrLYtPvizfmM1vH
	YmqtR2l0zfTw5sfAq/XloSmGHeqHYLebQyQQkLL20gV5Zc4lzuiwgXyk3Bsxio48Cu/q1dV60oj
	1Xt1TBT8lDqNGf9KgPAsW97GPjmBHCWIz414o4KaoqX6UNBeJa0nqUqNpbQai18ubfxGx0XYdvX
	5cLR8XhkjuwAYHzI0+QiE+6/sDd/GdMVqKQ8cffDNADfWf+u3nisWmrcX9IS+
X-Received: by 2002:a17:902:d4ce:b0:234:24a8:bee9 with SMTP id d9443c01a7336-23e1a42627fmr107674215ad.4.1752679250616;
        Wed, 16 Jul 2025 08:20:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrmci0l9AI5JnAxzDgH/kLS6XMN9fSrLytwtUjN7n/q1Z0rfXEtZX/croz8g38W3xSgGEX6A==
X-Received: by 2002:a17:902:d4ce:b0:234:24a8:bee9 with SMTP id d9443c01a7336-23e1a42627fmr107673575ad.4.1752679249957;
        Wed, 16 Jul 2025 08:20:49 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6bd8f8sm13912054a12.38.2025.07.16.08.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:20:49 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_rjendra@quicinc.com, taniya.das@oss.qualcomm.com
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] dt-bindings: clock: qcom: document the Glymur Global Clock Controller
Date: Wed, 16 Jul 2025 20:50:16 +0530
Message-Id: <20250716152017.4070029-7-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzOCBTYWx0ZWRfX4DGK6ofigf90
 poSTj3IUfkVjDPwrFVd0vdsChOSOhXh4VHOA7WS3ozOI4wrxePVeYQl/MmI+WlSAbUcyNVST9cg
 H02rVFOUR6N/6Ynvx6Pk2OmgUqSsMl65D/jO3RxARxkpxubJ1niwFOzxdO0/OpmlATYc3RZUIlC
 F+LO4Qs8au42WvqFskm63bCmUZlcXaDM0TSj1pst4UbHApdJjj7dERKAOzQmOSpohwBD0RNfJBR
 iaIazPcW4u4ko+sEOXER9u4wd4mJxbcACm+iDFy3hLi7BXXCaKYYdJndqfirmwDFH1ap+BTiLHf
 UAOAdakFc8HmdqoKsUc8ATku4IcI/hggFvM4QMIYBQB+yyiBHwyw25MI4TRk4LQ//sDzEB6Ey6Y
 2hjI8F0WLJf1njD0A3EER4S905CREKQ4JhNqOcKHuFVuy/RlX1fsvIy/DElRe4CrmN+Ywr5w
X-Proofpoint-GUID: rcKQrBNdmxutsTQ79FH_J-c-GYR71mtv
X-Proofpoint-ORIG-GUID: rcKQrBNdmxutsTQ79FH_J-c-GYR71mtv
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=6877c354 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=O8JL1BJpoaEYJYFQDtEA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160138

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add device tree bindings for the Glymur Global Clock Controller to provide
a standardized way of describing the clock controller's properties and
behavior.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 .../bindings/clock/qcom,glymur-gcc.yaml       | 122 ++++
 include/dt-bindings/clock/qcom,glymur-gcc.h   | 578 ++++++++++++++++++
 2 files changed, 700 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,glymur-gcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
new file mode 100644
index 000000000000..bd9530fc578d
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
index 000000000000..10c12b8c51c3
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


