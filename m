Return-Path: <linux-arm-msm+bounces-62426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACD5AE7FF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 12:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BFF44A2019
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 10:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEB22D320B;
	Wed, 25 Jun 2025 10:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lm8v/8rd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5576F29E0F7;
	Wed, 25 Jun 2025 10:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848317; cv=none; b=ELfuPvDEDniCj+GRMX1VTK7Hl97lUkWJQjlC0fAvboFhKf12zXrG6V3O8OQ+eSvuS/tm6ZkjWz8fy5pi5rhiWqSxC1Y4WiJRQsp1OzVl62Z6iQen8FPMcaTohVK4v1F4OgmTMxXQHJiyTEoDFyhzorvzMfQSxSY/CChhbKewLhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848317; c=relaxed/simple;
	bh=d2eTQW1GTvS+DyXtJcQxd+zpCAmrADKlQnloDmSpwyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gQNn/OOR08a/JKUcLxDntUJYOHMAJjfohNK71i622Wm5wt5Q4ti3llfcHCsS4vg+1anUyMtsH629VLX/RuDCevO62I8paTzCBUTU7yAKe3PJ+M+zMsNkLy0bj5uVyKMg05nwhZ76NSkIgxLdFLkZD5EoSx+amSRSvTPsS5Vvxto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lm8v/8rd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P39q2l026338;
	Wed, 25 Jun 2025 10:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5D0py4pk0pvUEWhdcEEnPA7/C+nDfAWxph6yfZzC43M=; b=lm8v/8rdP3zNGdzo
	aFRfkZswK6Ptu/w1yqPzcvQmxiu83OMr/yMger4PhRxiT4VeNAvAzNcp+wsz/bZz
	wCvYV8iMtoGv6ucDi+Av2sBc3n3R8I3x6s7lI0HnCHtcdwKL8xPUUBdlyKlZXscZ
	7eSNcQXuqt3Q2zqFQM6aq4mjoN2GARqeVi6QiOgV8XlhTUuzuSzC7KNtDjQLnnAz
	3FewjcPam3lbSkm2jEJWWeVipnIQtLGEuOkWg16HPE6QpQSjSPipaOD0WugV8ekl
	nHSDGpQ4OsyXA/omf0WmR1mwReB8Zjzqz+X6RXPq3jvkPulUKDA4Ik7M7PF+PrRg
	hIBUkg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcms6wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:45:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PAj4Wj000497
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:45:04 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Jun 2025 03:44:59 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 25 Jun 2025 16:13:32 +0530
Subject: [PATCH v10 07/10] clk: qcom: gpucc-qcs615: Add QCS615 graphics
 clock controller driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-qcs615-mm-v10-clock-controllers-v10-7-ec48255f90d8@quicinc.com>
References: <20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com>
In-Reply-To: <20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<lumag@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Jx-K_6Ar7ywW7f2pDADUDJnZgOnW6PHO
X-Proofpoint-ORIG-GUID: Jx-K_6Ar7ywW7f2pDADUDJnZgOnW6PHO
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685bd331 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=u3EN7mWu_WcxQUZuT-IA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4MCBTYWx0ZWRfX+zkr1gcTaumg
 24RKtZuobp+amXwzV3VjchzzTwKluGOppwCyaLT+bBZ+nB4Qnoq0kvIBBhTYfkbNxEkoznfaXfY
 672vNi88AsWZtlGtxhL9hk0P7C3qktX5DAzNeVrHelF/lCBQ6got7KWey18oX9Qa+a73NnRedji
 GaO9TreRN7CnNx/Y7TWPptOPpBdAbl17GH+mp+s5oZ8HSEVMu96Ta+M7B5NOu5N7R6tqK8Nf7Mp
 QL2W56x/I57/n4Ofwo0C6q+Zn0PMlsIm13DxwhDbHzsM97JDBA5k6muoVzdqFCRufVKV2N455ja
 nXRiRA/XUXdrQ8aQcAJWvorWfsFbn2L3J4Hh949m3z9MdsjYUku7CgjHkqbttRGh2WRV1j5DDpZ
 L8CvSVy4TytIi5PzqBQ3CoDXG/QMFPaEJcwS7+jrQ40VwVLD5J8A0Va/lRr/A1FW5PG74+Gu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250080

Add support for the graphics clock controller for graphics clients to
be able to request for the clocks on QCS615 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/Kconfig        |   8 +
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/gpucc-qcs615.c | 531 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 540 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 19f105a1e33a705ddc11fd6fe226a4a2a5cea9a2..204319dc23b58ca816bafb967ff84eb3c069170a 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -548,6 +548,14 @@ config QCS_GCC_615
 	  Say Y if you want to use multimedia devices or peripheral
 	  devices such as UART, SPI, I2C, USB, SD/eMMC, PCIe etc.
 
+config QCS_GPUCC_615
+	tristate "QCS615 Graphics clock controller"
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
index 4783f217543cb09ea25e9a537f5128b0fa89dec2..35b7f038647a6ed183a4a5ee3ecaefa23525b119 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -78,6 +78,7 @@ obj-$(CONFIG_QCS_CAMCC_615) += camcc-qcs615.o
 obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
 obj-$(CONFIG_QCS_GCC_615) += gcc-qcs615.o
 obj-$(CONFIG_QCS_GCC_8300) += gcc-qcs8300.o
+obj-$(CONFIG_QCS_GPUCC_615) += gpucc-qcs615.o
 obj-$(CONFIG_QCS_Q6SSTOP_404) += q6sstop-qcs404.o
 obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
 obj-$(CONFIG_QDU_ECPRICC_1000) += ecpricc-qdu1000.o
diff --git a/drivers/clk/qcom/gpucc-qcs615.c b/drivers/clk/qcom/gpucc-qcs615.c
new file mode 100644
index 0000000000000000000000000000000000000000..3d126622dd40722cb579c46311ac499bae4140aa
--- /dev/null
+++ b/drivers/clk/qcom/gpucc-qcs615.c
@@ -0,0 +1,531 @@
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
+	.config = &gpu_cc_pll0_config,
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
+	.config = &gpu_cc_pll1_config,
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
+struct clk_hw *gpu_cc_qcs615_hws[] = {
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
+static struct clk_alpha_pll *gpu_cc_qcs615_plls[] = {
+	&gpu_cc_pll0,
+	&gpu_cc_pll1,
+};
+
+static u32 gpu_cc_qcs615_critical_cbcrs[] = {
+	0x1078, /* GPU_CC_AHB_CLK */
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
+static void clk_qcs615_regs_crc_configure(struct device *dev, struct regmap *regmap)
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
+static struct qcom_cc_driver_data gpu_cc_qcs615_driver_data = {
+	.alpha_plls = gpu_cc_qcs615_plls,
+	.num_alpha_plls = ARRAY_SIZE(gpu_cc_qcs615_plls),
+	.clk_cbcrs = gpu_cc_qcs615_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_qcs615_critical_cbcrs),
+	.clk_regs_configure = clk_qcs615_regs_crc_configure,
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
+	.driver_data = &gpu_cc_qcs615_driver_data,
+};
+
+static const struct of_device_id gpu_cc_qcs615_match_table[] = {
+	{ .compatible = "qcom,qcs615-gpucc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpu_cc_qcs615_match_table);
+
+static int gpu_cc_qcs615_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gpu_cc_qcs615_desc);
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
2.34.1


