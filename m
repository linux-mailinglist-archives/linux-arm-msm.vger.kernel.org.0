Return-Path: <linux-arm-msm+bounces-51239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D12CAA5EC2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 08:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8B883BB225
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 07:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DBD1FF1B5;
	Thu, 13 Mar 2025 07:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BwEhoNAR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DC01FDE14;
	Thu, 13 Mar 2025 07:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741849244; cv=none; b=H6Q9GFqsDfy0CnmQVUTVZHAcNdF7i7RJYM+avUE43xO15TvEm4wUybTxtC7Qukhh3Y/GgICi94EyxDDHgjbUiC30G87BDgYU+2EjU/yHV9iPJjK8SKxXRws+1qAM72PCeT3Dm7jvbrkvw5Jxu9Ksmk/wABLH1cVuJOQ4lzN/tw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741849244; c=relaxed/simple;
	bh=2mDHeuNwex+K7rwuzCmqE3osEFumjZpfUqAEOgIgaZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Hrrnua5pfL/gHV+g4uCbh/owcdYRmUsK/1KG4BswpI2F5+b0vEmZqxypaKxNK5/t4Mu6s7Oz6fbZ4WbWzrJckogWtu3MSrSeoyavkKTDctAWLctT1lW8lsuQnylBL2v1VtiuN/cIKkaBAITwJmRcJ9Gv/rnJGI50kSweixMOV94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BwEhoNAR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CLjPbG012791;
	Thu, 13 Mar 2025 07:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0KwZApOGDtxFPnx8Sc7/sE0qXF3RbwTrcXG+n97wtHA=; b=BwEhoNARgbVewLKa
	O4JUqc5Ed61gE+HTzvAblpPpWdj6HvfMSvPr0ff73Ddn8tjEzffIthimHThsFkXG
	hiD4sonDZReHfNj/Vxbgo37iIG7+CfVcePbnr1PNtFP4zQdKzUdoU2WrYzdvjyaW
	+1AOLneZ85a+wJ9W2aBCthTRcMLkcMRDE1iVVyrlQya8OMkXQ19YobFMEX+hpWvX
	xPL9EiB0Lb4bxic+ourbp6XXU4livTCSqVK653ikhrgKLk/SavtU8V4CmZ0laSpT
	cCHLKuQp4XMsjAcnR0Xi9JQc1wB+20y3pfJ+JtbEViso+HVJErfUgQEuAag/nZnB
	Cxdy9Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nmxng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 07:00:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D70TRg011586
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 07:00:29 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Mar 2025 00:00:24 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Thu, 13 Mar 2025 12:29:44 +0530
Subject: [PATCH v6 07/10] clk: qcom: gpucc-qcs615: Add QCS615 graphics
 clock controller driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250313-qcs615-v5-mm-cc-v6-7-ebf4b9a5e916@quicinc.com>
References: <20250313-qcs615-v5-mm-cc-v6-0-ebf4b9a5e916@quicinc.com>
In-Reply-To: <20250313-qcs615-v5-mm-cc-v6-0-ebf4b9a5e916@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=M6hNKzws c=1 sm=1 tr=0 ts=67d2828e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=GZaa1IzHA2Sq2DbDnwgA:9
 a=QEXdDO2ut3YA:10 a=RVmHIydaz68A:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: njEC_KTxfYHCPMQR-T15ggUZKF8Z5Ir9
X-Proofpoint-GUID: njEC_KTxfYHCPMQR-T15ggUZKF8Z5Ir9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_03,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130054

Add support for the graphics clock controller for graphics clients to
be able to request for the clocks on QCS615 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/Kconfig        |   9 +
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/gpucc-qcs615.c | 525 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 535 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index f6cd8c1cfe5179f5bcd4df6506581336ea22717b..4b74f44ebdbf2f1cec83d311e004ce18091350c8 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -542,6 +542,15 @@ config QCS_GCC_615
 	  Say Y if you want to use multimedia devices or peripheral
 	  devices such as UART, SPI, I2C, USB, SD/eMMC, PCIe etc.
 
+config QCS_GPUCC_615
+	tristate "QCS615 Graphics clock controller"
+	depends on ARM64 || COMPILE_TEST
+	select QCS_GCC_615
+	help
+	  Support for the graphics clock controller on QCS615 devices.
+	  Say Y if you want to support graphics controller devices and
+	  functionality such as 3D graphics.
+
 config SC_CAMCC_7180
 	tristate "SC7180 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 5ddf1655cb83a6f27c57a234c175db2e659b9683..f9497e00d4fef8af05865a235fbb833fe6735528 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -77,6 +77,7 @@ obj-$(CONFIG_QCS_CAMCC_615) += camcc-qcs615.o
 obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
 obj-$(CONFIG_QCS_GCC_615) += gcc-qcs615.o
 obj-$(CONFIG_QCS_GCC_8300) += gcc-qcs8300.o
+obj-$(CONFIG_QCS_GPUCC_615) += gpucc-qcs615.o
 obj-$(CONFIG_QCS_Q6SSTOP_404) += q6sstop-qcs404.o
 obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
 obj-$(CONFIG_QDU_ECPRICC_1000) += ecpricc-qdu1000.o
diff --git a/drivers/clk/qcom/gpucc-qcs615.c b/drivers/clk/qcom/gpucc-qcs615.c
new file mode 100644
index 0000000000000000000000000000000000000000..a984180fcad3694bc9983582a5246b16ea702dc9
--- /dev/null
+++ b/drivers/clk/qcom/gpucc-qcs615.c
@@ -0,0 +1,525 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,qcs615-gpucc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_GPLL0_OUT_MAIN,
+	DT_GPLL0_OUT_MAIN_DIV,
+};
+
+enum {
+	P_BI_TCXO,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL0_OUT_MAIN_DIV,
+	P_GPU_CC_PLL0_2X_CLK,
+	P_CRC_DIV_PLL0_OUT_AUX2,
+	P_GPU_CC_PLL0_OUT_MAIN,
+	P_GPU_CC_PLL1_OUT_AUX,
+	P_CRC_DIV_PLL1_OUT_AUX2,
+	P_GPU_CC_PLL1_OUT_MAIN,
+};
+
+static const struct pll_vco gpu_cc_pll0_vco[] = {
+	{ 1000000000, 2100000000, 0 },
+};
+
+static struct pll_vco gpu_cc_pll1_vco[] = {
+	{ 500000000,  1000000000, 2 },
+};
+
+/* 1020MHz configuration VCO - 0 */
+static struct alpha_pll_config gpu_cc_pll0_config = {
+	.l = 0x35,
+	.config_ctl_val = 0x4001055b,
+	.test_ctl_hi_val = 0x1,
+	.test_ctl_hi_mask = 0x1,
+	.alpha_hi = 0x20,
+	.alpha = 0x00,
+	.alpha_en_mask = BIT(24),
+	.vco_val = 0x0,
+	.vco_mask = GENMASK(21, 20),
+	.aux2_output_mask = BIT(2),
+};
+
+static struct clk_alpha_pll gpu_cc_pll0 = {
+	.offset = 0x0,
+	.vco_table = gpu_cc_pll0_vco,
+	.num_vco = ARRAY_SIZE(gpu_cc_pll0_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_slew_ops,
+		},
+	},
+};
+
+/* 930MHz configuration VCO - 2 */
+static struct alpha_pll_config gpu_cc_pll1_config = {
+	.l = 0x30,
+	.config_ctl_val = 0x4001055b,
+	.test_ctl_hi_val = 0x1,
+	.test_ctl_hi_mask = 0x1,
+	.alpha_hi = 0x70,
+	.alpha = 0x00,
+	.alpha_en_mask = BIT(24),
+	.vco_val = BIT(21),
+	.vco_mask = GENMASK(21, 20),
+	.aux2_output_mask = BIT(2),
+};
+
+static struct clk_alpha_pll gpu_cc_pll1 = {
+	.offset = 0x100,
+	.vco_table = gpu_cc_pll1_vco,
+	.num_vco = ARRAY_SIZE(gpu_cc_pll1_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_slew_ops,
+		},
+	}
+};
+
+/* Clock Ramp Controller */
+static struct clk_fixed_factor crc_div_pll0 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "crc_div_pll0",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gpu_cc_pll0.clkr.hw,
+			},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+/* Clock Ramp Controller */
+static struct clk_fixed_factor crc_div_pll1 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "crc_div_pll1",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &gpu_cc_pll1.clkr.hw,
+			},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static const struct parent_map gpu_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL0_OUT_MAIN, 1 },
+	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .hw = &gpu_cc_pll1.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct parent_map gpu_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL0_2X_CLK, 1 },
+	{ P_CRC_DIV_PLL0_OUT_AUX2, 2 },
+	{ P_GPU_CC_PLL1_OUT_AUX, 3 },
+	{ P_CRC_DIV_PLL1_OUT_AUX2, 4 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .hw = &crc_div_pll0.hw },
+	{ .hw = &gpu_cc_pll1.clkr.hw },
+	{ .hw = &crc_div_pll1.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+};
+
+static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_gmu_clk_src = {
+	.cmd_rcgr = 0x1120,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_0,
+	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_gmu_clk_src",
+		.parent_data = gpu_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src[] = {
+	F(290000000, P_CRC_DIV_PLL1_OUT_AUX2, 1, 0, 0),
+	F(350000000, P_CRC_DIV_PLL1_OUT_AUX2, 1, 0, 0),
+	F(435000000, P_CRC_DIV_PLL1_OUT_AUX2, 1, 0, 0),
+	F(500000000, P_CRC_DIV_PLL0_OUT_AUX2, 1, 0, 0),
+	F(550000000, P_CRC_DIV_PLL0_OUT_AUX2, 1, 0, 0),
+	F(650000000, P_CRC_DIV_PLL0_OUT_AUX2, 1, 0, 0),
+	F(700000000, P_CRC_DIV_PLL0_OUT_AUX2, 1, 0, 0),
+	F(745000000, P_CRC_DIV_PLL0_OUT_AUX2, 1, 0, 0),
+	F(845000000, P_CRC_DIV_PLL0_OUT_AUX2, 1, 0, 0),
+	F(895000000, P_CRC_DIV_PLL0_OUT_AUX2, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
+	.cmd_rcgr = 0x101c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_1,
+	.freq_tbl = ftbl_gpu_cc_gx_gfx3d_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_gx_gfx3d_clk_src",
+		.parent_data = gpu_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_branch gpu_cc_crc_ahb_clk = {
+	.halt_reg = 0x107c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x107c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_crc_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gfx3d_clk = {
+	.halt_reg = 0x10a4,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_gfx3d_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gx_gfx3d_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gfx3d_slv_clk = {
+	.halt_reg = 0x10a8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_gfx3d_slv_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gx_gfx3d_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gmu_clk = {
+	.halt_reg = 0x1098,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1098,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_gmu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_snoc_dvm_clk = {
+	.halt_reg = 0x108c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x108c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_snoc_dvm_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cxo_aon_clk = {
+	.halt_reg = 0x1004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x1004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_cxo_aon_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cxo_clk = {
+	.halt_reg = 0x109c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x109c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cxo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_gfx3d_clk = {
+	.halt_reg = 0x1054,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x1054,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_gfx3d_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gx_gfx3d_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_gmu_clk = {
+	.halt_reg = 0x1064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_gmu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
+	.halt_reg = 0x5000,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x5000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hlos1_vote_gpu_smmu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_sleep_clk = {
+	.halt_reg = 0x1090,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x1090,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_hw *gpu_cc_qcs615_hws[] = {
+	[CRC_DIV_PLL0] = &crc_div_pll0.hw,
+	[CRC_DIV_PLL1] = &crc_div_pll1.hw,
+};
+
+static struct gdsc cx_gdsc = {
+	.gdscr = 0x106c,
+	.gds_hw_ctrl = 0x1540,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x8,
+	.pd = {
+		.name = "cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
+};
+
+static struct gdsc gx_gdsc = {
+	.gdscr = 0x100c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
+	.pd = {
+		.name = "gx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
+};
+
+static struct clk_regmap *gpu_cc_qcs615_clocks[] = {
+	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
+	[GPU_CC_CX_GFX3D_CLK] = &gpu_cc_cx_gfx3d_clk.clkr,
+	[GPU_CC_CX_GFX3D_SLV_CLK] = &gpu_cc_cx_gfx3d_slv_clk.clkr,
+	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
+	[GPU_CC_CX_SNOC_DVM_CLK] = &gpu_cc_cx_snoc_dvm_clk.clkr,
+	[GPU_CC_CXO_AON_CLK] = &gpu_cc_cxo_aon_clk.clkr,
+	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
+	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
+	[GPU_CC_GX_GFX3D_CLK] = &gpu_cc_gx_gfx3d_clk.clkr,
+	[GPU_CC_GX_GFX3D_CLK_SRC] = &gpu_cc_gx_gfx3d_clk_src.clkr,
+	[GPU_CC_GX_GMU_CLK] = &gpu_cc_gx_gmu_clk.clkr,
+	[GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK] = &gpu_cc_hlos1_vote_gpu_smmu_clk.clkr,
+	[GPU_CC_PLL0] = &gpu_cc_pll0.clkr,
+	[GPU_CC_PLL1] = &gpu_cc_pll1.clkr,
+	[GPU_CC_SLEEP_CLK] = &gpu_cc_sleep_clk.clkr,
+};
+
+static struct gdsc *gpu_cc_qcs615_gdscs[] = {
+	[CX_GDSC] = &cx_gdsc,
+	[GX_GDSC] = &gx_gdsc,
+};
+
+static const struct qcom_reset_map gpu_cc_qcs615_resets[] = {
+	[GPU_CC_CX_BCR] = { 0x1068 },
+	[GPU_CC_GFX3D_AON_BCR] = { 0x10a0 },
+	[GPU_CC_GMU_BCR] = { 0x111c },
+	[GPU_CC_GX_BCR] = { 0x1008 },
+	[GPU_CC_XO_BCR] = { 0x1000 },
+};
+
+static const struct regmap_config gpu_cc_qcs615_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x7008,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc gpu_cc_qcs615_desc = {
+	.config = &gpu_cc_qcs615_regmap_config,
+	.clks = gpu_cc_qcs615_clocks,
+	.num_clks = ARRAY_SIZE(gpu_cc_qcs615_clocks),
+	.clk_hws = gpu_cc_qcs615_hws,
+	.num_clk_hws = ARRAY_SIZE(gpu_cc_qcs615_hws),
+	.resets = gpu_cc_qcs615_resets,
+	.num_resets = ARRAY_SIZE(gpu_cc_qcs615_resets),
+	.gdscs = gpu_cc_qcs615_gdscs,
+	.num_gdscs = ARRAY_SIZE(gpu_cc_qcs615_gdscs),
+};
+
+static const struct of_device_id gpu_cc_qcs615_match_table[] = {
+	{ .compatible = "qcom,qcs615-gpucc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpu_cc_qcs615_match_table);
+
+static void configure_crc(struct regmap *regmap)
+{
+	/* Recommended WAKEUP/SLEEP settings for the gpu_cc_cx_gmu_clk */
+	regmap_update_bits(regmap, gpu_cc_cx_gmu_clk.clkr.enable_reg, 0xff0, 0xff0);
+
+	/*
+	 * After POR, Clock Ramp Controller(CRC) will be in bypass mode.
+	 * Software needs to do the following operation to enable the CRC
+	 * for GFX3D clock and divide the input clock by div by 2.
+	 */
+	regmap_update_bits(regmap, 0x1028, 0x00015011, 0x00015011);
+	regmap_update_bits(regmap, 0x1024, 0x00800000, 0x00800000);
+}
+
+static int gpu_cc_qcs615_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+
+	regmap = qcom_cc_map(pdev, &gpu_cc_qcs615_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	clk_alpha_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
+	clk_alpha_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
+
+	/* Keep some clocks always enabled */
+	qcom_branch_set_clk_en(regmap, 0x1078); /* GPU_CC_AHB_CLK */
+
+	configure_crc(regmap);
+
+	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_qcs615_desc, regmap);
+}
+
+static struct platform_driver gpu_cc_qcs615_driver = {
+	.probe = gpu_cc_qcs615_probe,
+	.driver = {
+		.name = "gpucc-qcs615",
+		.of_match_table = gpu_cc_qcs615_match_table,
+	},
+};
+
+module_platform_driver(gpu_cc_qcs615_driver);
+
+MODULE_DESCRIPTION("QTI GPUCC QCS615 Driver");
+MODULE_LICENSE("GPL");

-- 
2.48.1


