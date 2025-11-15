Return-Path: <linux-arm-msm+bounces-81948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96078C60760
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 15:38:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DDE73B1EBF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 14:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DAA29D26B;
	Sat, 15 Nov 2025 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="mcEu31bH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A683927B335
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 14:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763217521; cv=none; b=ghO+PwsiETjzapmY4w3Vh1JbeGqxKePcs101lIhU8sCt39vN/+VkWjfX3Ac4AzZ3DaXMbEtCo6lcY4NgQoicRncJHKmk19fLDqPvq5yGG1xCQS+iKDl9G9hiqZTYoN/6sfQip8fouS2l8re3KeV+rPXJDi5tqOBm88L6+OjqCR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763217521; c=relaxed/simple;
	bh=E6eFL6VMRH0K6wrB3y9/qsXc782qggWzuDDF2ywkP7w=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=nX6/DQYii6tuMSjUS0sMMMKIymvm+17V/qlsXUnGk+tFeaQADmy1U1VlxfdxdOFXR0SrbQONqPrirhFwsLo0PJIEC5IZ/++K7VVI2V/TAVBS3yVfSntwqN82tuux5FzO79qWk/EJfpS+a6sXViCJE6C4VW9EbJozYUMEe4bGixg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=mcEu31bH; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1763217509; x=1763476709;
	bh=FQ+srCSwMGdFO23X5XnNu9U77nvkILWWQV3TL6aZ3Tk=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mcEu31bHps4KlGpKFfay+I/Zkh4fv5V+QYW7mUyFT3lrzimsVuvWWKgouu4UyWRZL
	 f1rbvH0r+8ET0xt7RMqeInjVEotTzuligbY08ZQwsMh1aiAMqFclIqZiljd9Ae4x38
	 mOkIY2M3ZV4OmZ6gMZb4PBjQHK5dA7M/1cwuqWUu13nICqWJDApbl6iC7WiYkvOMnQ
	 i4xL40taHKnifEgIlYFn4SASmRhnL3sgwnG3ZPh7dwx4QnzHsYsenNVWQBCjDWRnfO
	 FhVwF73SMUZKBsM5lY+m8d/36hjb4L/S1CkXcTjNf51A+XO7mlW3BvagJsu3Td+c0p
	 YGrFcKdXztWbA==
Date: Sat, 15 Nov 2025 14:38:27 +0000
To: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
From: philmb3487 <philmb3487@proton.me>
Subject: [PATCH] Add support for General Clock Controller for SM8635
Message-ID: <Uczku8TWm_yEdSMe9v2PZC6eDhmbXxr6yhqW6poltQ_xP52gQ5ZYRsiXGlkYxfVQGQjVhr0Bl86ncNVVx8aPe0JtRtK1uYZeN3LNXH-xE7o=@proton.me>
Feedback-ID: 109714282:user:proton
X-Pm-Message-ID: be1e706e2016879fbe774334b7ddabb64fc8b4c8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From f18386e7b70afaaf557fff147d24dac4c613980d Mon Sep 17 00:00:00 2001
From: Philippe Michaud-Boudreault <philmb3487@proton.me>
Date: Sat, 11 Oct 2025 18:40:14 -0400
Subject: [PATCH] dt-bindings: clock: qcom: document the SM8635 General Cloc=
k
 Controller

Add bindings documentation for the SM8635 General Clock Controller.
---
 .../bindings/clock/qcom,sm8635-gcc.yaml       |  62 ++++++
 include/dt-bindings/clock/qcom,sm8635-gcc.h   | 198 ++++++++++++++++++
 2 files changed, 260 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8635-gcc=
.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm8635-gcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8635-gcc.yaml b=
/Documentation/devicetree/bindings/clock/qcom,sm8635-gcc.yaml
new file mode 100644
index 0000000000000..2e4fc56990ff8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8635-gcc.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm8635-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on SM8635
+
+maintainers:
+  - Philippe Michaud-Boudreault <philmb3487@proton.me>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and pow=
er
+  domains on SM8635
+
+  See also: include/dt-bindings/clock/qcom,sm8635-gcc.h
+
+properties:
+  compatible:
+    const: qcom,sm8635-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board Always On XO source
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
+      compatible =3D "qcom,sm8635-gcc";
+      reg =3D <0x00100000 0x001f4200>;
+      clocks =3D <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&sleep_clk>,
+               <&pcie0_phy>,
+               <&ufs_mem_phy 0>,
+               <&ufs_mem_phy 1>,
+               <&ufs_mem_phy 2>,
+               <&usb_1_qmpphy>;
+      #clock-cells =3D <1>;
+      #reset-cells =3D <1>;
+      #power-domain-cells =3D <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,sm8635-gcc.h b/include/dt-bindi=
ngs/clock/qcom,sm8635-gcc.h
new file mode 100644
index 0000000000000..f76d5fce6153a
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8635-gcc.h
@@ -0,0 +1,198 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserve=
d.
+ * Copyright (c) 2023, Linaro Limited
+ * Copyright (c) 2025, Philippe Michaud-Boudreault <philmb3487@proton.me>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SM8635_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SM8635_H
+
+/* GCC clocks */
+#define GCC_GPLL0                                               0
+#define GCC_GPLL0_OUT_EVEN                                      1
+#define GCC_GPLL1                                               2
+#define GCC_GPLL4                                               3
+#define GCC_GPLL7                                               4
+#define GCC_GPLL9                                               5
+#define GCC_AGGRE_NOC_PCIE_AXI_CLK                              6
+#define GCC_AGGRE_UFS_PHY_AXI_CLK                               7
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK                             8
+#define GCC_BOOT_ROM_AHB_CLK                                    9
+#define GCC_CAMERA_AHB_CLK                                      10
+#define GCC_CAMERA_HF_AXI_CLK                                   11
+#define GCC_CAMERA_HF_XO_CLK                                    12
+#define GCC_CAMERA_SF_AXI_CLK                                   13
+#define GCC_CAMERA_SF_XO_CLK                                    14
+#define GCC_CFG_NOC_PCIE_ANOC_AHB_CLK                           15
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK                           16
+#define GCC_CNOC_PCIE_SF_AXI_CLK                                17
+#define GCC_DDRSS_GPU_AXI_CLK                                   18
+#define GCC_DDRSS_PCIE_SF_QTB_CLK                               19
+#define GCC_DISP_AHB_CLK                                        20
+#define GCC_DISP_HF_AXI_CLK                                     21
+#define GCC_DISP_XO_CLK                                         22
+#define GCC_GP1_CLK                                             23
+#define GCC_GP1_CLK_SRC                                         24
+#define GCC_GP2_CLK                                             25
+#define GCC_GP2_CLK_SRC                                         26
+#define GCC_GP3_CLK                                             27
+#define GCC_GP3_CLK_SRC                                         28
+#define GCC_GPU_CFG_AHB_CLK                                     29
+#define GCC_GPU_GPLL0_CLK_SRC                                   30
+#define GCC_GPU_GPLL0_DIV_CLK_SRC                               31
+#define GCC_GPU_MEMNOC_GFX_CLK                                  32
+#define GCC_GPU_SNOC_DVM_GFX_CLK                                33
+#define GCC_PCIE_0_AUX_CLK                                      34
+#define GCC_PCIE_0_AUX_CLK_SRC                                  35
+#define GCC_PCIE_0_CFG_AHB_CLK                                  36
+#define GCC_PCIE_0_MSTR_AXI_CLK                                 37
+#define GCC_PCIE_0_PHY_RCHNG_CLK                                38
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC                            39
+#define GCC_PCIE_0_PIPE_CLK                                     40
+#define GCC_PCIE_0_PIPE_CLK_SRC                                 41
+#define GCC_PCIE_0_PIPE_DIV2_CLK                                42
+#define GCC_PCIE_0_PIPE_DIV2_CLK_SRC                            43
+#define GCC_PCIE_0_SLV_AXI_CLK                                  44
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK                              45
+#define GCC_PCIE_RSCC_CFG_AHB_CLK                               46
+#define GCC_PCIE_RSCC_XO_CLK                                    47
+#define GCC_PDM2_CLK                                            48
+#define GCC_PDM2_CLK_SRC                                        49
+#define GCC_PDM_AHB_CLK                                         50
+#define GCC_PDM_XO4_CLK                                         51
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK                             52
+#define GCC_QMIP_CAMERA_RT_AHB_CLK                              53
+#define GCC_QMIP_DISP_AHB_CLK                                   54
+#define GCC_QMIP_GPU_AHB_CLK                                    55
+#define GCC_QMIP_PCIE_AHB_CLK                                   56
+#define GCC_QMIP_VIDEO_CV_CPU_AHB_CLK                           57
+#define GCC_QMIP_VIDEO_CVP_AHB_CLK                              58
+#define GCC_QMIP_VIDEO_V_CPU_AHB_CLK                            59
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK                           60
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK                             61
+#define GCC_QUPV3_WRAP0_CORE_CLK                                62
+#define GCC_QUPV3_WRAP0_QSPI_REF_CLK                            63
+#define GCC_QUPV3_WRAP0_QSPI_REF_CLK_SRC                        64
+#define GCC_QUPV3_WRAP0_S0_CLK                                  65
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC                              66
+#define GCC_QUPV3_WRAP0_S1_CLK                                  67
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC                              68
+#define GCC_QUPV3_WRAP0_S2_CLK                                  69
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC                              70
+#define GCC_QUPV3_WRAP0_S3_CLK                                  71
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC                              72
+#define GCC_QUPV3_WRAP0_S4_CLK                                  73
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC                              74
+#define GCC_QUPV3_WRAP0_S5_CLK                                  75
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC                              76
+#define GCC_QUPV3_WRAP0_S6_CLK                                  77
+#define GCC_QUPV3_WRAP0_S6_CLK_SRC                              78
+#define GCC_QUPV3_WRAP0_S7_CLK                                  79
+#define GCC_QUPV3_WRAP0_S7_CLK_SRC                              80
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK                             81
+#define GCC_QUPV3_WRAP1_CORE_CLK                                82
+#define GCC_QUPV3_WRAP1_IBI_CTRL_0_CLK_SRC                      83
+#define GCC_QUPV3_WRAP1_IBI_CTRL_2_CLK                          84
+#define GCC_QUPV3_WRAP1_IBI_CTRL_3_CLK                          85
+#define GCC_QUPV3_WRAP1_S0_CLK                                  86
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC                              87
+#define GCC_QUPV3_WRAP1_S1_CLK                                  88
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC                              89
+#define GCC_QUPV3_WRAP1_S2_CLK                                  90
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC                              91
+#define GCC_QUPV3_WRAP1_S3_CLK                                  92
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC                              93
+#define GCC_QUPV3_WRAP1_S4_CLK                                  94
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC                              95
+#define GCC_QUPV3_WRAP1_S5_CLK                                  96
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC                              97
+#define GCC_QUPV3_WRAP1_S6_CLK                                  98
+#define GCC_QUPV3_WRAP1_S6_CLK_SRC                              99
+#define GCC_QUPV3_WRAP1_S7_CLK                                  100
+#define GCC_QUPV3_WRAP1_S7_CLK_SRC                              101
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK                              102
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK                              103
+#define GCC_QUPV3_WRAP_1_IBI_2_AHB_CLK                          104
+#define GCC_QUPV3_WRAP_1_IBI_3_AHB_CLK                          105
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK                              106
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK                              107
+#define GCC_SDCC2_AHB_CLK                                       108
+#define GCC_SDCC2_APPS_CLK                                      109
+#define GCC_SDCC2_APPS_CLK_SRC                                  110
+#define GCC_UFS_PHY_AHB_CLK                                     111
+#define GCC_UFS_PHY_AXI_CLK                                     112
+#define GCC_UFS_PHY_AXI_CLK_SRC                                 113
+#define GCC_UFS_PHY_ICE_CORE_CLK                                114
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC                            115
+#define GCC_UFS_PHY_PHY_AUX_CLK                                 116
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC                             117
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK                             118
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC                         119
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK                             120
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC                         121
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK                             122
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC                         123
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK                             124
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC                         125
+#define GCC_USB30_PRIM_MASTER_CLK                               126
+#define GCC_USB30_PRIM_MASTER_CLK_SRC                           127
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK                            128
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC                        129
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC                130
+#define GCC_USB30_PRIM_SLEEP_CLK                                131
+#define GCC_USB3_PRIM_PHY_AUX_CLK                               132
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC                           133
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK                           134
+#define GCC_USB3_PRIM_PHY_PIPE_CLK                              135
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC                          136
+#define GCC_VIDEO_AHB_CLK                                       137
+#define GCC_VIDEO_AXI0_CLK                                      138
+#define GCC_VIDEO_AXI1_CLK                                      139
+#define GCC_VIDEO_XO_CLK                                        140
+#define GCC_AGGRE_UFS_PHY_AXI_HW_CTL_CLK                        141
+#define GCC_UFS_PHY_AXI_HW_CTL_CLK                              142
+#define GCC_UFS_PHY_ICE_CORE_HW_CTL_CLK                         143
+#define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK                          144
+#define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK                      145
+
+/* GCC resets */
+#define GCC_CAMERA_BCR                                          0
+#define GCC_DISPLAY_BCR                                         1
+#define GCC_GPU_BCR                                             2
+#define GCC_PCIE_0_BCR                                          3
+#define GCC_PCIE_0_LINK_DOWN_BCR                                4
+#define GCC_PCIE_0_NOCSR_COM_PHY_BCR                            5
+#define GCC_PCIE_0_PHY_BCR                                      6
+#define GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR                        7
+#define GCC_PCIE_PHY_BCR                                        8
+#define GCC_PCIE_PHY_CFG_AHB_BCR                                9
+#define GCC_PCIE_PHY_COM_BCR                                    10
+#define GCC_PCIE_RSCC_BCR                                       11
+#define GCC_PDM_BCR                                             12
+#define GCC_QUPV3_WRAPPER_0_BCR                                 13
+#define GCC_QUPV3_WRAPPER_1_BCR                                 14
+#define GCC_QUSB2PHY_PRIM_BCR                                   15
+#define GCC_QUSB2PHY_SEC_BCR                                    16
+#define GCC_SDCC2_BCR                                           17
+#define GCC_UFS_PHY_BCR                                         18
+#define GCC_USB30_PRIM_BCR                                      19
+#define GCC_USB3_DP_PHY_PRIM_BCR                                20
+#define GCC_USB3_DP_PHY_SEC_BCR                                 21
+#define GCC_USB3_PHY_PRIM_BCR                                   22
+#define GCC_USB3_PHY_SEC_BCR                                    23
+#define GCC_USB3PHY_PHY_PRIM_BCR                                24
+#define GCC_USB3PHY_PHY_SEC_BCR                                 25
+#define GCC_VIDEO_AXI0_CLK_ARES                                 26
+#define GCC_VIDEO_AXI1_CLK_ARES                                 27
+#define GCC_VIDEO_BCR                                           28
+
+/* GCC power domains */
+#define PCIE_0_GDSC=09=09=09=09=09=090
+#define PCIE_0_PHY_GDSC=09=09=09=09=09=091
+#define UFS_PHY_GDSC=09=09=09=09=09=092
+#define UFS_MEM_PHY_GDSC=09=09=09=09=093
+#define USB30_PRIM_GDSC=09=09=09=09=09=094
+#define USB3_PHY_GDSC=09=09=09=09=09=095
+
+#endif
--=20
GitLab



