Return-Path: <linux-arm-msm+bounces-95999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNDPFuHFrGneuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 01:42:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A658522E2A2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 01:42:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B032F3010513
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 00:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32FD7227BB5;
	Sun,  8 Mar 2026 00:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Oi0tACsU";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="pMLwklRv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AA722423A;
	Sun,  8 Mar 2026 00:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772930494; cv=none; b=h1zuntqTz5Q42+TaP1+psOTRzrbuqoa4JxezvPPIB8BYP7CnrgpzAw7C0nKrpLO/6YkolSwRl6Qp0pIqy2dxwPkJYsXSsQV0ecEHk9jpXCw4Y2hCWQ0WFy9m1qS9ceJeVMaX4vSWZjy83tYZg3b1N/D1HsFKt8Io1b4VTCvA40o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772930494; c=relaxed/simple;
	bh=/1176zuBH4eSXitMI6t5aMBmTihcfCu0KF2285SciFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n9Kx5PM4iVV7aoLeI01XUHrXvfcjJy7kg0bprqn5gAzs1oOwkQh0tkIyvAY/rErrE8wXgwrcP/qqb4HOcIWifi3sXAS9GbthipLbruorrBYctKs4U+fs/BvEJZFddUQsovPDLzG5MTz0HmMXX22/SwFmGAS+FM7ZK07o5XXA7n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Oi0tACsU; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=pMLwklRv; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772930384; bh=mWhhPkVU7BaDp687Onkqqew
	+7mMLH4tQzrA+UmYTBsM=; b=Oi0tACsUaFfypFheYe6FZ1LBFFonuZLHGX9/OHPBQj2ONaDmkt
	HVZ3RM2MYfHJMDpZGR4bU2WcDCNPssyFnqC5f+iUjlnDtSHXIxe3JRG2J+Z+1+khcYuyFcA2AwJ
	lDsapdQGHfeFQ/K4hU7GBl7+tVdVppxMV/Y/BIxBYIlKwmjW3R4PZtZS7Kmxgfk0bChAojU/Fa4
	4Lhr69/RXriuC8h3M3VvcEvx3RVi66Ssm1LnWAF1FDfTtdY5uL32oVXF2xpeZliiD4i0ZDa3KCQ
	V9p7BdNaGyqUyc3nd0szBPEZoAnhiS/dzUNR5MnOLiCXU3LeNTozWQ4sHOAMAZKO1nQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772930384; bh=mWhhPkVU7BaDp687Onkqqew
	+7mMLH4tQzrA+UmYTBsM=; b=pMLwklRvIPJL/BVt8MV8AxES11ueCmnxME5wGstSRHrPxjWfqj
	d5sZePNx0gdc3gCXa7et+xGYuTxEWsk+ZWDw==;
From: Aelin Reidel <aelin@mainlining.org>
Date: Sun, 08 Mar 2026 01:39:27 +0100
Subject: [PATCH 1/4] dt-bindings: clock: qcom: document the Fillmore Global
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-fillmore-clks-v1-1-976d9a6bebe7@mainlining.org>
References: <20260308-fillmore-clks-v1-0-976d9a6bebe7@mainlining.org>
In-Reply-To: <20260308-fillmore-clks-v1-0-976d9a6bebe7@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@mainlining.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Aelin Reidel <aelin@mainlining.org>
X-Mailer: b4 0.14.2
X-Rspamd-Queue-Id: A658522E2A2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95999-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aelin@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-0.973];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:dkim,mainlining.org:email,mainlining.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.1.134.160:email]
X-Rspamd-Action: no action

Add bindings documentation for the Fillmore (e.g. SM7450) Global Clock
Controller.

Signed-off-by: Aelin Reidel <aelin@mainlining.org>
---
 .../bindings/clock/qcom,fillmore-gcc.yaml          |  60 +++++++
 include/dt-bindings/clock/qcom,fillmore-gcc.h      | 195 +++++++++++++++++++++
 2 files changed, 255 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,fillmore-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,fillmore-gcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..0eb12a52968edc7961681f0e965b4d6da0858b9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,fillmore-gcc.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,fillmore-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on Fillmore
+
+maintainers:
+  - Aelin Reidel <aelin@mainlining.org>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on Fillmore.
+
+  See also: include/dt-bindings/clock/qcom,fillmore-gcc.h
+
+properties:
+  compatible:
+    const: qcom,fillmore-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: PCIE 0 Pipe clock source
+      - description: UFS Phy Rx symbol 0 clock source
+      - description: UFS Phy Rx symbol 1 clock source
+      - description: UFS Phy Tx symbol 0 clock source
+      - description: USB3 Phy wrapper pipe clock source
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
+        compatible = "qcom,fillmore-gcc";
+        reg = <0x00100000 0x1f4200>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>,
+                 <&sleep_clk>,
+                 <&pcie0_phy>,
+                 <&ufs_mem_phy 0>,
+                 <&ufs_mem_phy 1>,
+                 <&ufs_mem_phy 2>,
+                 <&usb_1_qmpphy>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,fillmore-gcc.h b/include/dt-bindings/clock/qcom,fillmore-gcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e78a429a93ab5e73f2454812cb904e2a9a14fc3
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,fillmore-gcc.h
@@ -0,0 +1,195 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2025, Aelin Reidel <aelin@mainlining.org>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SM7450_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SM7450_H
+
+/* GCC HW clocks */
+#define PCIE_0_PIPE_CLK						1
+#define UFS_PHY_RX_SYMBOL_0_CLK					2
+#define UFS_PHY_RX_SYMBOL_1_CLK					3
+#define UFS_PHY_TX_SYMBOL_0_CLK					4
+#define USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK			5
+
+/* GCC clocks */
+#define GCC_AGGRE_NOC_PCIE_0_AXI_CLK				6
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				7
+#define GCC_AGGRE_UFS_PHY_AXI_HW_CTL_CLK			8
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				9
+#define GCC_BOOT_ROM_AHB_CLK					10
+#define GCC_CAMERA_AHB_CLK					11
+#define GCC_CAMERA_HF_AXI_CLK					12
+#define GCC_CAMERA_SF_AXI_CLK					13
+#define GCC_CAMERA_XO_CLK					14
+#define GCC_CFG_NOC_PCIE_ANOC_AHB_CLK				15
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				16
+#define GCC_DDRSS_GPU_AXI_CLK					17
+#define GCC_DDRSS_PCIE_SF_TBU_CLK				18
+#define GCC_DISP_AHB_CLK					19
+#define GCC_DISP_HF_AXI_CLK					20
+#define GCC_DISP_SF_AXI_CLK					21
+#define GCC_DISP_XO_CLK						22
+#define GCC_EUSB3_0_CLKREF_EN					23
+#define GCC_GP1_CLK						24
+#define GCC_GP1_CLK_SRC						25
+#define GCC_GP2_CLK						26
+#define GCC_GP2_CLK_SRC						27
+#define GCC_GP3_CLK						28
+#define GCC_GP3_CLK_SRC						29
+#define GCC_GPLL0						30
+#define GCC_GPLL0_OUT_EVEN					31
+#define GCC_GPLL1						32
+#define GCC_GPLL2						33
+#define GCC_GPLL4						34
+#define GCC_GPLL6						35
+#define GCC_GPLL9						36
+#define GCC_GPU_CFG_AHB_CLK					37
+#define GCC_GPU_GPLL0_CLK_SRC					38
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				39
+#define GCC_GPU_MEMNOC_GFX_CLK					40
+#define GCC_GPU_SNOC_DVM_GFX_CLK				41
+#define GCC_PCIE_0_AUX_CLK					42
+#define GCC_PCIE_0_AUX_CLK_SRC					43
+#define GCC_PCIE_0_CFG_AHB_CLK					44
+#define GCC_PCIE_0_CLKREF_EN					45
+#define GCC_PCIE_0_MSTR_AXI_CLK					46
+#define GCC_PCIE_0_PHY_RCHNG_CLK				47
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC				48
+#define GCC_PCIE_0_PIPE_CLK					49
+#define GCC_PCIE_0_PIPE_CLK_SRC					50
+#define GCC_PCIE_0_SLV_AXI_CLK					51
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				52
+#define GCC_PDM2_CLK						53
+#define GCC_PDM2_CLK_SRC					54
+#define GCC_PDM_AHB_CLK						55
+#define GCC_PDM_XO4_CLK						56
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				57
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				58
+#define GCC_QMIP_DISP_AHB_CLK					59
+#define GCC_QMIP_GPU_AHB_CLK					60
+#define GCC_QMIP_PCIE_AHB_CLK					61
+#define GCC_QMIP_VIDEO_CV_CPU_AHB_CLK				62
+#define GCC_QMIP_VIDEO_CVP_AHB_CLK				63
+#define GCC_QMIP_VIDEO_V_CPU_AHB_CLK				64
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				65
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				66
+#define GCC_QUPV3_WRAP0_CORE_CLK				67
+#define GCC_QUPV3_WRAP0_S0_CLK					68
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				69
+#define GCC_QUPV3_WRAP0_S1_CLK					70
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				71
+#define GCC_QUPV3_WRAP0_S2_CLK					72
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				73
+#define GCC_QUPV3_WRAP0_S3_CLK					74
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				75
+#define GCC_QUPV3_WRAP0_S4_CLK					76
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				77
+#define GCC_QUPV3_WRAP0_S5_CLK					78
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC				79
+#define GCC_QUPV3_WRAP0_S6_CLK					80
+#define GCC_QUPV3_WRAP0_S6_CLK_SRC				81
+#define GCC_QUPV3_WRAP0_S7_CLK					82
+#define GCC_QUPV3_WRAP0_S7_CLK_SRC				83
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				84
+#define GCC_QUPV3_WRAP1_CORE_CLK				85
+#define GCC_QUPV3_WRAP1_S0_CLK					86
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				87
+#define GCC_QUPV3_WRAP1_S1_CLK					88
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				89
+#define GCC_QUPV3_WRAP1_S2_CLK					90
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				91
+#define GCC_QUPV3_WRAP1_S3_CLK					92
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				93
+#define GCC_QUPV3_WRAP1_S4_CLK					94
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				95
+#define GCC_QUPV3_WRAP1_S5_CLK					96
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				97
+#define GCC_QUPV3_WRAP1_S6_CLK					98
+#define GCC_QUPV3_WRAP1_S6_CLK_SRC				99
+#define GCC_QUPV3_WRAP1_S7_CLK					100
+#define GCC_QUPV3_WRAP1_S7_CLK_SRC				101
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				102
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				103
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				104
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				105
+#define GCC_SDCC2_AHB_CLK					106
+#define GCC_SDCC2_APPS_CLK					107
+#define GCC_SDCC2_APPS_CLK_SRC					108
+#define GCC_SDCC2_AT_CLK					109
+#define GCC_UFS_0_CLKREF_EN					110
+#define GCC_UFS_PHY_AHB_CLK					111
+#define GCC_UFS_PHY_AXI_CLK					112
+#define GCC_UFS_PHY_AXI_CLK_SRC					113
+#define GCC_UFS_PHY_AXI_HW_CTL_CLK				114
+#define GCC_UFS_PHY_ICE_CORE_CLK				115
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				116
+#define GCC_UFS_PHY_ICE_CORE_HW_CTL_CLK				117
+#define GCC_UFS_PHY_PHY_AUX_CLK					118
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				119
+#define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK				120
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				121
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC				122
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				123
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC				124
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				125
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC				126
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				127
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				128
+#define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK			129
+#define GCC_USB30_PRIM_MASTER_CLK				130
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				131
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				132
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			133
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		134
+#define GCC_USB30_PRIM_SLEEP_CLK				135
+#define GCC_USB3_0_CLKREF_EN					136
+#define GCC_USB3_PRIM_PHY_AUX_CLK				137
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				138
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				139
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				140
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				141
+#define GCC_VIDEO_AHB_CLK					142
+#define GCC_VIDEO_AXI0_CLK					143
+#define GCC_VIDEO_AXI1_CLK					144
+#define GCC_VIDEO_XO_CLK					145
+
+/* GCC power domains */
+#define GCC_PCIE_0_GDSC						0
+#define GCC_UFS_PHY_GDSC					1
+#define GCC_USB30_PRIM_GDSC					2
+
+/* GCC resets */
+#define GCC_CAMERA_BCR						0
+#define GCC_DISPLAY_BCR						1
+#define GCC_GPU_BCR						2
+#define GCC_PCIE_0_BCR						3
+#define GCC_PCIE_0_LINK_DOWN_BCR				4
+#define GCC_PCIE_0_NOCSR_COM_PHY_BCR				5
+#define GCC_PCIE_0_PHY_BCR					6
+#define GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR			7
+#define GCC_PCIE_PHY_BCR					8
+#define GCC_PCIE_PHY_CFG_AHB_BCR				9
+#define GCC_PCIE_PHY_COM_BCR					10
+#define GCC_PDM_BCR						11
+#define GCC_QUPV3_WRAPPER_0_BCR					12
+#define GCC_QUPV3_WRAPPER_1_BCR					13
+#define GCC_QUSB2PHY_PRIM_BCR					14
+#define GCC_QUSB2PHY_SEC_BCR					15
+#define GCC_SDCC2_BCR						16
+#define GCC_UFS_PHY_BCR						17
+#define GCC_USB30_PRIM_BCR					18
+#define GCC_USB3_DP_PHY_PRIM_BCR				19
+#define GCC_USB3_DP_PHY_SEC_BCR					20
+#define GCC_USB3_PHY_PRIM_BCR					21
+#define GCC_USB3_PHY_SEC_BCR					22
+#define GCC_USB3PHY_PHY_PRIM_BCR				23
+#define GCC_USB3PHY_PHY_SEC_BCR					24
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR				25
+#define GCC_VIDEO_AXI0_CLK_ARES					26
+#define GCC_VIDEO_AXI1_CLK_ARES					27
+#define GCC_VIDEO_BCR						28
+
+#endif

-- 
2.53.0


