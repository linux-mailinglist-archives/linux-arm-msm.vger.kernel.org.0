Return-Path: <linux-arm-msm+bounces-40832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A7E9E7796
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 18:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EF9E280E40
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 17:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7162D13D251;
	Fri,  6 Dec 2024 17:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QwpTUZIZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE4D20459C;
	Fri,  6 Dec 2024 17:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733506690; cv=none; b=me89jWQy2hRWOPkRw452/0Vbu/7RPPcXJcr+p6oTDJ4E6sWEnClwL8W2csQThCavI3Lx5r6wsvncFasSWu0T3K4b6FY3JiLM0ovpNc5na25CsvI35aDmGsDgdr1xjApZY+Nxl6fO+C9/tsJjEfm2bZ6LljCOnj+U3vq3djIP1Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733506690; c=relaxed/simple;
	bh=ic7rWKbNTHzA4oHa6F3NhTn/mEiYtthGcblkA8V2Rb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jI7OkVt39yutXVgEM/gRTqFBmD9FEb7fsaJJpWLBXNVs68qA6+8IpR7R3bUMFjDAFti0VwyU0A7qRcfnck5AXK338n6FzOp2A/r/ggXxwDvDpiur0TjNUKqyEWI0g9Cdbedd+CDHQdLIPRTCuh2X74cMRdeiRQ03eH7plVhhdPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QwpTUZIZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B67UJB5006904;
	Fri, 6 Dec 2024 17:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M/RWHrlh42Lfp0ynYMle8B1sXRCMZwBKSvai8NiH3Eo=; b=QwpTUZIZU9zc+jgw
	5+9LhZV2CH6OfXI+YRYnbOgcww3mdJdQFmNQkJhSeQx1xrA+2TW9O5/o6G5HSneD
	CV4oPu0SEvHUaWWsxdEaCevzCT4FrCU0zLyQOVAbOhkE+NrH0xxPhVcAMWPAKPU9
	6MUrk9NR78to3mTitrqI1FYvSMFTFqQSQh0bi2wMrlVF5vrC0fCwYQdtZ3UbEmr4
	oYw6GxLbHAW2Wdu4MwAfCGdUYBfZlXiZ9oIPzHOYl1HfbuMFO52Ddr/wTgf+2ZNd
	aDxnb4CwOzhjpyvgsyyjLGCfLR4e+0IGLHIKBXj5SiXXLgJl6/edSDZmpTD3S3do
	wLz5kA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ben8bty9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 17:38:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6Hc3bI021980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 17:38:03 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Dec 2024 09:37:59 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 6 Dec 2024 23:07:13 +0530
Subject: [PATCH 3/3] clk: qcom: videocc-sm8750: Add video clock controller
 driver for SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241206-sm8750_videocc-v1-3-5da6e7eea2bd@quicinc.com>
References: <20241206-sm8750_videocc-v1-0-5da6e7eea2bd@quicinc.com>
In-Reply-To: <20241206-sm8750_videocc-v1-0-5da6e7eea2bd@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mJbgPBb3x3ZNb8WNrvCl-Br5A2d3ou_f
X-Proofpoint-GUID: mJbgPBb3x3ZNb8WNrvCl-Br5A2d3ou_f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060132

Add support for the video clock controller for video clients to be able
to request for videocc clocks on SM8750 platform.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/Kconfig          |  11 +
 drivers/clk/qcom/Makefile         |   1 +
 drivers/clk/qcom/videocc-sm8750.c | 472 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 484 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index ef89d686cbc4e0032a288da7021c32ca53405d44..297e09731a8215d5421242eaf33ae02ca162cf77 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1308,6 +1308,17 @@ config SM_VIDEOCC_8550
 	  Say Y if you want to support video devices and functionality such as
 	  video encode/decode.
 
+config SM_VIDEOCC_8750
+	tristate "SM8750 Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select SM_GCC_8750
+	select QCOM_GDSC
+	help
+	  Support for the video clock controller on Qualcomm Technologies, Inc.
+	  SM8750 devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode/decode.
+
 config SPMI_PMIC_CLKDIV
 	tristate "SPMI PMIC clkdiv Support"
 	depends on SPMI || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index b09dbdc210eb1cec264dd4bcd9b13554bd081c52..47b8b3018afda3b8b509a192ca910d8abb32ae99 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -162,6 +162,7 @@ obj-$(CONFIG_SM_VIDEOCC_8250) += videocc-sm8250.o
 obj-$(CONFIG_SM_VIDEOCC_8350) += videocc-sm8350.o
 obj-$(CONFIG_SM_VIDEOCC_8450) += videocc-sm8450.o
 obj-$(CONFIG_SM_VIDEOCC_8550) += videocc-sm8550.o
+obj-$(CONFIG_SM_VIDEOCC_8750) += videocc-sm8750.o
 obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
 obj-$(CONFIG_KPSS_XCC) += kpss-xcc.o
 obj-$(CONFIG_QCOM_HFPLL) += hfpll.o
diff --git a/drivers/clk/qcom/videocc-sm8750.c b/drivers/clk/qcom/videocc-sm8750.c
new file mode 100644
index 0000000000000000000000000000000000000000..d88df28d1fff70a09fe05111349a67f584faa35a
--- /dev/null
+++ b/drivers/clk/qcom/videocc-sm8750.c
@@ -0,0 +1,472 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,sm8750-videocc.h>
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
+	DT_BI_TCXO_AO,
+	DT_SLEEP_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_SLEEP_CLK,
+	P_VIDEO_CC_PLL0_OUT_MAIN,
+};
+
+static const struct pll_vco taycan_elu_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+static const struct alpha_pll_config video_cc_pll0_config = {
+	.l = 0x25,
+	.alpha = 0x8000,
+	.config_ctl_val = 0x19660387,
+	.config_ctl_hi_val = 0x098060a0,
+	.config_ctl_hi1_val = 0xb416cb20,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll video_cc_pll0 = {
+	.offset = 0x0,
+	.vco_table = taycan_elu_vco,
+	.num_vco = ARRAY_SIZE(taycan_elu_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_ELU],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_elu_ops,
+		},
+	},
+};
+
+static const struct parent_map video_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0_ao[] = {
+	{ .index = DT_BI_TCXO_AO },
+};
+
+static const struct parent_map video_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_2[] = {
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_2_ao[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct freq_tbl ftbl_video_cc_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_ahb_clk_src = {
+	.cmd_rcgr = 0x8018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_ahb_clk_src",
+		.parent_data = video_cc_parent_data_0_ao,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0_ao),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
+	F(720000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1014000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1260000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1332000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1600000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1710000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1890000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0_clk_src = {
+	.cmd_rcgr = 0x8000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_mvs0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_sleep_clk_src = {
+	.cmd_rcgr = 0x80e0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_2,
+	.freq_tbl = ftbl_video_cc_sleep_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_sleep_clk_src",
+		.parent_data = video_cc_parent_data_2_ao,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_2_ao),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 video_cc_xo_clk_src = {
+	.cmd_rcgr = 0x80bc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_xo_clk_src",
+		.parent_data = video_cc_parent_data_0_ao,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0_ao),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0_div_clk_src = {
+	.reg = 0x809c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0c_div2_div_clk_src = {
+	.reg = 0x8060,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0c_div2_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0x807c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x807c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x807c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_mem_branch video_cc_mvs0_freerun_clk = {
+	.mem_enable_reg = 0x8090,
+	.mem_ack_reg =  0x8090,
+	.mem_enable_mask = BIT(3),
+	.mem_enable_ack_mask = 0xc00,
+	.mem_enable_invert = true,
+	.branch = {
+		.halt_reg = 0x808c,
+		.halt_check = BRANCH_HALT,
+		.clkr = {
+			.enable_reg = 0x808c,
+			.enable_mask = BIT(0),
+			.hw.init = &(const struct clk_init_data) {
+				.name = "video_cc_mvs0_freerun_clk",
+				.parent_hws = (const struct clk_hw*[]) {
+					&video_cc_mvs0_div_clk_src.clkr.hw,
+				},
+				.num_parents = 1,
+				.flags = CLK_SET_RATE_PARENT,
+				.ops = &clk_branch2_mem_ops,
+			},
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_shift_clk = {
+	.halt_reg = 0x80d8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_clk = {
+	.halt_reg = 0x804c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x804c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_freerun_clk = {
+	.halt_reg = 0x805c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x805c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_shift_clk = {
+	.halt_reg = 0x80dc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80dc,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80dc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc video_cc_mvs0c_gdsc = {
+	.gdscr = 0x8034,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0_gdsc = {
+	.gdscr = 0x8068,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs0c_gdsc.pd,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL_TRIGGER,
+};
+
+static struct clk_regmap *video_cc_sm8750_clocks[] = {
+	[VIDEO_CC_AHB_CLK_SRC] = &video_cc_ahb_clk_src.clkr,
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_DIV_CLK_SRC] = &video_cc_mvs0_div_clk_src.clkr,
+	[VIDEO_CC_MVS0_FREERUN_CLK] = &video_cc_mvs0_freerun_clk.branch.clkr,
+	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC] = &video_cc_mvs0c_div2_div_clk_src.clkr,
+	[VIDEO_CC_MVS0C_FREERUN_CLK] = &video_cc_mvs0c_freerun_clk.clkr,
+	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
+	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
+	[VIDEO_CC_SLEEP_CLK_SRC] = &video_cc_sleep_clk_src.clkr,
+	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *video_cc_sm8750_gdscs[] = {
+	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
+	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_sm8750_resets[] = {
+	[VIDEO_CC_INTERFACE_BCR] = { 0x80a0 },
+	[VIDEO_CC_MVS0_BCR] = { 0x8064 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x804c, 2 },
+	[VIDEO_CC_MVS0C_BCR] = { 0x8030 },
+	[VIDEO_CC_MVS0_FREERUN_CLK_ARES] = { 0x808c, 2 },
+	[VIDEO_CC_MVS0C_FREERUN_CLK_ARES] = { 0x805c, 2 },
+	[VIDEO_CC_XO_CLK_ARES] = { 0x80d4, 2 },
+};
+
+static const struct regmap_config video_cc_sm8750_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9f4c,
+	.fast_io = true,
+};
+
+static struct qcom_cc_desc video_cc_sm8750_desc = {
+	.config = &video_cc_sm8750_regmap_config,
+	.clks = video_cc_sm8750_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_sm8750_clocks),
+	.resets = video_cc_sm8750_resets,
+	.num_resets = ARRAY_SIZE(video_cc_sm8750_resets),
+	.gdscs = video_cc_sm8750_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_sm8750_gdscs),
+};
+
+static const struct of_device_id video_cc_sm8750_match_table[] = {
+	{ .compatible = "qcom,sm8750-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_sm8750_match_table);
+
+static int video_cc_sm8750_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	int ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
+	regmap = qcom_cc_map(pdev, &video_cc_sm8750_desc);
+	if (IS_ERR(regmap)) {
+		pm_runtime_put(&pdev->dev);
+		return PTR_ERR(regmap);
+	}
+
+	clk_taycan_elu_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
+
+	/* Update DLY_ACCU_RED_SHIFTER_DONE to 0xF for mvs0, mvs0c */
+	regmap_update_bits(regmap, 0x8074, 0x1e00000, 0x1e00000);
+	regmap_update_bits(regmap, 0x8040, 0x1e00000, 0x1e00000);
+
+	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));
+
+	/*
+	 * Keep clocks always enabled:
+	 *	video_cc_ahb_clk
+	 *	video_cc_sleep_clk
+	 *	video_cc_xo_clk
+	 */
+	regmap_update_bits(regmap, 0x80a4, BIT(0), BIT(0));
+	regmap_update_bits(regmap, 0x80f8, BIT(0), BIT(0));
+	regmap_update_bits(regmap, 0x80d4, BIT(0), BIT(0));
+
+	ret = qcom_cc_really_probe(&pdev->dev, &video_cc_sm8750_desc, regmap);
+
+	pm_runtime_put(&pdev->dev);
+
+	return ret;
+}
+
+static struct platform_driver video_cc_sm8750_driver = {
+	.probe = video_cc_sm8750_probe,
+	.driver = {
+		.name = "video_cc-sm8750",
+		.of_match_table = video_cc_sm8750_match_table,
+	},
+};
+
+static int __init video_cc_sm8750_init(void)
+{
+	return platform_driver_register(&video_cc_sm8750_driver);
+}
+subsys_initcall(video_cc_sm8750_init);
+
+static void __exit video_cc_sm8750_exit(void)
+{
+	platform_driver_unregister(&video_cc_sm8750_driver);
+}
+module_exit(video_cc_sm8750_exit);
+
+MODULE_DESCRIPTION("QTI VIDEO_CC SM8750 Driver");
+MODULE_LICENSE("GPL");

-- 
2.45.2


