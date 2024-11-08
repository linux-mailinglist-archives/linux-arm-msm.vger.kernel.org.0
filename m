Return-Path: <linux-arm-msm+bounces-37322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8D69C1546
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 05:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E11D1C2250E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 04:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1F31D433B;
	Fri,  8 Nov 2024 04:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kcyGsGHh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2F51D2F54;
	Fri,  8 Nov 2024 04:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731039068; cv=none; b=h0Fbu/EtJmkOUVPlMWRHT4c8hbU0WKkGoUn5k4Fjfp1ik0xrgPsfh64745BjGQh8W4SD3VLIicLN/1+PfHCmSV7+k2hPPVmqf+be9+K5/b8lJUcRV63hcJHlTydAzzkUJLhm1CL8uMv/XKH5zmwr9dpyireFbvXMcnOmPQ2Mplw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731039068; c=relaxed/simple;
	bh=UEZ8pH2MS6lI7Djypxf+nSk5FkihpWgIdJMVKFzVyqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cJwrvGtZWAsY6B2lEpvfBXV8d1FjJCAp/Tg1KXRnvxH0FhSrTJglwgFrJkj8PUXemCo1f760VUyPGgkIKoSCamvg2gsYNXCqfexgOKFEs+XwOB6TquVBGOK4TU6mwOLES/BBfy739vXjT9BDcTRGp5TwglC8M83cegz0NHazkBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kcyGsGHh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7MbeER012723;
	Fri, 8 Nov 2024 04:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GXaeZ+2gGc6rd1MxAD8dPEM/FnxdNIrrZ1C0vfEJGRo=; b=kcyGsGHhjKujfHN9
	ZcmRE9Ut2xw5UJQG3pcC8uFzoBZsQZkSyMfR0MU7rRHvuUNvD2xFesfdb6BeonY3
	ztgIZH7vsH5yKfH+swtIbjUWPCu/T9AEohhoD9OGA+2m24YZr6XrC2XFoZaz1mMP
	1uqYimQK5saGPhWjB/ETQpCoyoumfqU9QdLn/ChSRZPptL9B/uS7+cBYMt3P+MAi
	vlxpVQ7Y0a1cXjUEIHtNc255XIkLdrC1UmYwpPg6MCh8Eu5egHoJg70Zg1vFghwS
	xH/zQyT9152MX7j8Y0j4mnL96jVXeAU/HQa7ZGoE1o9/p+fYJ+NNtf8t1Xd9pA5X
	RGmgZA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42s6gm0kv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 04:10:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A84AYXB027978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Nov 2024 04:10:34 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 7 Nov 2024 20:10:29 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 8 Nov 2024 09:39:27 +0530
Subject: [PATCH v3 10/11] clk: qcom: videocc-qcs615: Add QCS615 video clock
 controller driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241108-qcs615-mm-clockcontroller-v3-10-7d3b2d235fdf@quicinc.com>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
In-Reply-To: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abhishek Sahu
	<absahu@codeaurora.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CproJ-C1loG3Z5Tby-CtEt5TGRrxEv45
X-Proofpoint-GUID: CproJ-C1loG3Z5Tby-CtEt5TGRrxEv45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411080034

Add support for the video clock controller for video clients to
be able to request for the clocks on QCS615 platform.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/Kconfig          |   8 +
 drivers/clk/qcom/Makefile         |   1 +
 drivers/clk/qcom/videocc-qcs615.c | 332 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 341 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index ed610310699696f92b4a5938635e7b2ab757358c..7ef2037b3b0dd01fec0c6be8b6030ebaab182117 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -494,6 +494,14 @@ config QCS_GPUCC_615
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
index a45b6fa28c1d04fd42dcde6e6f22378baa7c8e60..b024e75e49435a3d2f449bbdb9c2cef8e7958eca 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -73,6 +73,7 @@ obj-$(CONFIG_QCS_DISPCC_615) += dispcc-qcs615.o
 obj-$(CONFIG_QCS_CAMCC_615) += camcc-qcs615.o
 obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
 obj-$(CONFIG_QCS_GPUCC_615) += gpucc-qcs615.o
+obj-$(CONFIG_QCS_VIDEOCC_615) += videocc-qcs615.o
 obj-$(CONFIG_QCS_Q6SSTOP_404) += q6sstop-qcs404.o
 obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
 obj-$(CONFIG_QDU_ECPRICC_1000) += ecpricc-qdu1000.o
diff --git a/drivers/clk/qcom/videocc-qcs615.c b/drivers/clk/qcom/videocc-qcs615.c
new file mode 100644
index 0000000000000000000000000000000000000000..14704185d9fa2548ade7dd60f4f9f5d378bb0938
--- /dev/null
+++ b/drivers/clk/qcom/videocc-qcs615.c
@@ -0,0 +1,332 @@
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
+static const struct regmap_config video_cc_qcs615_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xb94,
+	.fast_io = true,
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
+	struct regmap *regmap;
+
+	regmap = qcom_cc_map(pdev, &video_cc_qcs615_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	clk_alpha_pll_configure(&video_pll0, regmap, &video_pll0_config);
+
+	/* Keep some clocks always enabled */
+	qcom_branch_set_clk_en(regmap, 0xab8); /* VIDEO_CC_XO_CLK */
+
+	return qcom_cc_really_probe(&pdev->dev, &video_cc_qcs615_desc, regmap);
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
2.45.2


