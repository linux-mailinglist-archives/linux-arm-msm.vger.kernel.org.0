Return-Path: <linux-arm-msm+bounces-63348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DACAF0EF9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 11:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8850F7B2C3F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 09:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B0924BD03;
	Wed,  2 Jul 2025 09:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ekG02h62"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B82D24BBE4;
	Wed,  2 Jul 2025 09:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447156; cv=none; b=i9w3FfmG2qfK5cR9W2IZlVf4+G8+ulgCZOT5lk9pv6jcIx56ToKppKmGYps3WhI9Ti0e07LHf1yVKoqbiMxuoa+KEmA2xuxkjrLx6n2uZMWcuq9VlMVfLhMRN4T5SYkAYepsWit4j+s8xnVM4JGN4irbjIk0OfYWnuytdViq9g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447156; c=relaxed/simple;
	bh=odt3jwN2N8Erq4LVi4OlVfF6Go/OtdLWXDxSwAxExIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VDMMUjQy9LRUy1vNHnwhbL0a4VH2YZ1TJjADdAEooWzke1qtVOh6HoPQAsBs5CRR7DfDUaRNjd9akLbkfaNwIWaBhBfAh3rgc+/BhbuzR+qR3K94WPCxAwHJQIwV0rBtLktcgz918ogkODnLnuzzhywb1Q0IDo83h43gkOFNVeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ekG02h62; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5623foev011767;
	Wed, 2 Jul 2025 09:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6chDmCsIN+ICqjNv2LCx9kREIST9jzR2aKkYh1pMNMM=; b=ekG02h627UeMkrhi
	CNb3aAeLpkybG563zDf/aNnks+5v4GGG88TaCFPQMoN5RseRxpw4LUyTTgt9cRoZ
	FXDOpDyhfCZCahg+Uhi14kGK6ufzMPSbub1JBnQAkoFTXZtIk7b7xj+P8I78uzYf
	W5HrUkKkosPgawoCWvuFhZNNGCRVmwZzGe8u+Bgv1RehvcF4lYnfZ087NybHimnC
	h5ImyugUKIVH/6fkNu9DTwTmL0bigjMSyA+dDIu/ZfCEOpZDLp6Zwh/MgPSY2yg/
	An3JmPyEw86PPLiuGRgcExGaNX4rzbQJ0OCVDpWTqVq4GXNwzPWiw+BWelCYekHi
	5EbcRQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw308wkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 09:05:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56295kql003200
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 09:05:46 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 2 Jul 2025 02:05:40 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 2 Jul 2025 14:34:29 +0530
Subject: [PATCH v11 09/10] clk: qcom: videocc-qcs615: Add QCS615 video
 clock controller driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250702-qcs615-mm-v10-clock-controllers-v11-9-9c216e1615ab@quicinc.com>
References: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
In-Reply-To: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<lumag@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=6864f66b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=qYpWxANyOF6Ti2HRg9EA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Mup8iGh0vLdjNSswidHUf3PgTqL5ShvP
X-Proofpoint-GUID: Mup8iGh0vLdjNSswidHUf3PgTqL5ShvP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA3MyBTYWx0ZWRfX1Til56AGCo+E
 Sq/SWUr99GDvk29chYN9/PtLbi8jvJYj6Vgvz19F8P+YpCoI3m4TG64XQAu9lhobZnQX3QfCIk/
 Tn6OMrCdqF0nvppyQYAZrAIltNDbBcvUrOzMpWi+JWORz8/G0waJvZIgBsqMnbGqRd2Ir+qZARd
 vtCCGkzDY+8CmA0ImPqdRMpuAw7BhMLfsz7g4R77uyIh9xBUpHfhYMuJMmEpW95Fu5VxM23V6MU
 T/alPcgYr7f7UchbXYpjeIvDmUmZT0S9D35ZU0v0Clwr/nV/K815eDmnOE4rsCbz0RYNiH6ZuDy
 1YoqvyqpDuM52bQ96h3XM6znHilDow3ohwJbdURtwlb0K0deVVNP0ZJKfuscLBc3CC8/dscUyG1
 sTxIgeQHWydnTDceUSxh+2xk3fU8E/S5KVnkhHWjwPqPlYTb9MQA+nhhhZxp/UMVZpaNSLt1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020073

Add support for the video clock controller for video clients to
be able to request for the clocks on QCS615 platform.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/Kconfig          |   8 +
 drivers/clk/qcom/Makefile         |   1 +
 drivers/clk/qcom/videocc-qcs615.c | 338 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 347 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 204319dc23b58ca816bafb967ff84eb3c069170a..759b24d2c55066b641b1eaf81157aa024e641e92 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -556,6 +556,14 @@ config QCS_GPUCC_615
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.
 
+config QCS_VIDEOCC_615
+	tristate "QCS615 Video Clock Controller"
+	select QCS_GCC_615
+	help
+	  Support for the video clock controller on QCS615 devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode and decode.
+
 config SC_CAMCC_7180
 	tristate "SC7180 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 35b7f038647a6ed183a4a5ee3ecaefa23525b119..2af0dae787dbacf3a97fd423e73d15bacfed85ba 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -79,6 +79,7 @@ obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
 obj-$(CONFIG_QCS_GCC_615) += gcc-qcs615.o
 obj-$(CONFIG_QCS_GCC_8300) += gcc-qcs8300.o
 obj-$(CONFIG_QCS_GPUCC_615) += gpucc-qcs615.o
+obj-$(CONFIG_QCS_VIDEOCC_615) += videocc-qcs615.o
 obj-$(CONFIG_QCS_Q6SSTOP_404) += q6sstop-qcs404.o
 obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
 obj-$(CONFIG_QDU_ECPRICC_1000) += ecpricc-qdu1000.o
diff --git a/drivers/clk/qcom/videocc-qcs615.c b/drivers/clk/qcom/videocc-qcs615.c
new file mode 100644
index 0000000000000000000000000000000000000000..1b41fa44c17ea05d637f2cd8dd8c5b9b94faeeb1
--- /dev/null
+++ b/drivers/clk/qcom/videocc-qcs615.c
@@ -0,0 +1,338 @@
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
+#include <dt-bindings/clock/qcom,qcs615-videocc.h>
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
+	DT_SLEEP_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_SLEEP_CLK,
+	P_VIDEO_PLL0_OUT_AUX,
+	P_VIDEO_PLL0_OUT_AUX2,
+	P_VIDEO_PLL0_OUT_MAIN,
+};
+
+static const struct pll_vco video_cc_pll0_vco[] = {
+	{ 500000000, 1000000000, 2 },
+};
+
+/* 600MHz configuration VCO - 2 */
+static struct alpha_pll_config video_pll0_config = {
+	.l = 0x1f,
+	.alpha_hi = 0x40,
+	.alpha = 0x00,
+	.alpha_en_mask = BIT(24),
+	.vco_val = BIT(21),
+	.vco_mask = GENMASK(21, 20),
+	.main_output_mask = BIT(0),
+	.config_ctl_val = 0x4001055b,
+	.test_ctl_hi_val = 0x1,
+	.test_ctl_hi_mask = 0x1,
+};
+
+static struct clk_alpha_pll video_pll0 = {
+	.offset = 0x42c,
+	.config = &video_pll0_config,
+	.vco_table = video_cc_pll0_vco,
+	.num_vco = ARRAY_SIZE(video_cc_pll0_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_slew_ops,
+		},
+	},
+};
+
+static const struct parent_map video_cc_parent_map_0[] = {
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0_ao[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map video_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_PLL0_OUT_MAIN, 1 },
+	{ P_VIDEO_PLL0_OUT_AUX, 2 },
+	{ P_VIDEO_PLL0_OUT_AUX2, 3 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_pll0.clkr.hw },
+	{ .hw = &video_pll0.clkr.hw },
+	{ .hw = &video_pll0.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_video_cc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_sleep_clk_src = {
+	.cmd_rcgr = 0xaf8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_sleep_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_sleep_clk_src",
+		.parent_data = video_cc_parent_data_0_ao,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0_ao),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_venus_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(133333333, P_VIDEO_PLL0_OUT_MAIN, 4.5, 0, 0),
+	F(240000000, P_VIDEO_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(300000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
+	F(380000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
+	F(410000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
+	F(460000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_venus_clk_src = {
+	.cmd_rcgr = 0x7f0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_venus_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_venus_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_branch video_cc_sleep_clk = {
+	.halt_reg = 0xb18,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb18,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_sleep_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_sleep_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_vcodec0_axi_clk = {
+	.halt_reg = 0x8f0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8f0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_vcodec0_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_vcodec0_core_clk = {
+	.halt_reg = 0x890,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x890,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_vcodec0_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_venus_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_venus_ahb_clk = {
+	.halt_reg = 0x9b0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9b0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_venus_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_venus_ctl_axi_clk = {
+	.halt_reg = 0x8d0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8d0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_venus_ctl_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_venus_ctl_core_clk = {
+	.halt_reg = 0x850,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x850,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_venus_ctl_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_venus_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc vcodec0_gdsc = {
+	.gdscr = 0x874,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "vcodec0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
+};
+
+static struct gdsc venus_gdsc = {
+	.gdscr = 0x814,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "venus_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
+};
+
+static struct clk_regmap *video_cc_qcs615_clocks[] = {
+	[VIDEO_CC_SLEEP_CLK] = &video_cc_sleep_clk.clkr,
+	[VIDEO_CC_SLEEP_CLK_SRC] = &video_cc_sleep_clk_src.clkr,
+	[VIDEO_CC_VCODEC0_AXI_CLK] = &video_cc_vcodec0_axi_clk.clkr,
+	[VIDEO_CC_VCODEC0_CORE_CLK] = &video_cc_vcodec0_core_clk.clkr,
+	[VIDEO_CC_VENUS_AHB_CLK] = &video_cc_venus_ahb_clk.clkr,
+	[VIDEO_CC_VENUS_CLK_SRC] = &video_cc_venus_clk_src.clkr,
+	[VIDEO_CC_VENUS_CTL_AXI_CLK] = &video_cc_venus_ctl_axi_clk.clkr,
+	[VIDEO_CC_VENUS_CTL_CORE_CLK] = &video_cc_venus_ctl_core_clk.clkr,
+	[VIDEO_PLL0] = &video_pll0.clkr,
+};
+
+static struct gdsc *video_cc_qcs615_gdscs[] = {
+	[VCODEC0_GDSC] = &vcodec0_gdsc,
+	[VENUS_GDSC] = &venus_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_qcs615_resets[] = {
+	[VIDEO_CC_INTERFACE_BCR] = { 0x8b0 },
+	[VIDEO_CC_VCODEC0_BCR] = { 0x870 },
+	[VIDEO_CC_VENUS_BCR] = { 0x810 },
+};
+
+static struct clk_alpha_pll *video_cc_qcs615_plls[] = {
+	&video_pll0,
+};
+
+static u32 video_cc_qcs615_critical_cbcrs[] = {
+	0xab8, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct regmap_config video_cc_qcs615_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xb94,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data video_cc_qcs615_driver_data = {
+	.alpha_plls = video_cc_qcs615_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_qcs615_plls),
+	.clk_cbcrs = video_cc_qcs615_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_qcs615_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc video_cc_qcs615_desc = {
+	.config = &video_cc_qcs615_regmap_config,
+	.clks = video_cc_qcs615_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_qcs615_clocks),
+	.resets = video_cc_qcs615_resets,
+	.num_resets = ARRAY_SIZE(video_cc_qcs615_resets),
+	.gdscs = video_cc_qcs615_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_qcs615_gdscs),
+	.driver_data = &video_cc_qcs615_driver_data,
+};
+
+static const struct of_device_id video_cc_qcs615_match_table[] = {
+	{ .compatible = "qcom,qcs615-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_qcs615_match_table);
+
+static int video_cc_qcs615_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &video_cc_qcs615_desc);
+}
+
+static struct platform_driver video_cc_qcs615_driver = {
+	.probe = video_cc_qcs615_probe,
+	.driver = {
+		.name = "videocc-qcs615",
+		.of_match_table = video_cc_qcs615_match_table,
+	},
+};
+
+module_platform_driver(video_cc_qcs615_driver);
+
+MODULE_DESCRIPTION("QTI VIDEOCC QCS615 Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


