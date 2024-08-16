Return-Path: <linux-arm-msm+bounces-28740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F9B9541C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 08:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E683B235C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 06:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADC984E0D;
	Fri, 16 Aug 2024 06:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VJmp1LE/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282CF85270;
	Fri, 16 Aug 2024 06:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723790016; cv=none; b=JRFKDjyiBUYMLtx0KWcFcok0J98Ttynhakn1LAf+UcTLMhVt3I4MWoCjsSzonDd/BuE38FdIKZf3E8U097M/pHdfiYaIvPgHiw03xqa3q1X6p1IAoxiA1l/gFuB7WRptmxHSDZezU7uza7yNh8QNUNbALL7yxflY/jOVHmo9Zt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723790016; c=relaxed/simple;
	bh=Ck6QsDq8BE9yFPJWS5tPvlKJQsWfuWkWzVTGt5EndWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CKo6WOIei1PjQo3UPJ2uJUjrzVyjc/rqQxtylBjtjWhDbgrK3uMbOED+/VY333dczqm7c0nvB8gh6z+oh2C/JvWfUqUokaIkGYex5v2lx1mMJBXVTjEjFWK+VNwOZKJY5qKCjfpvrSBjwqXqG5kZKPhJDrruUnvXdukhmL7XxPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VJmp1LE/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FKvC5N025458;
	Fri, 16 Aug 2024 06:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qpNm0rC9ioMyBSN6yep8agqTQwzpEvuWRsxni/IUyjs=; b=VJmp1LE/X2H5f3Cc
	ZFtYk9EUmrrCC0NMKirYPWPzrRd3Y9J5EwEM3FYgq/WMklmpdBYVtsesUixrEPuu
	ONj0xLU85PvxKyuN6eaREubE3hO4w4JpctJ9Qhk5FLLlL407k30yb+xQMMak45G9
	+Z2SdBUoNfmLH3Os9qFohJ1oupcxkAPDr9rc6eWMnwGUaXcznIqDgZHTYhi4TlZb
	oVVqs5/WeWZMNw8dX57HaREU1A9KG+wLVzzKGXgIlwu+5fIsFb4B2uOQCiVxjnr3
	SJiTL6cr9WeNNZqiJriBiUqnNotDBcPlVEnlKjS+E1jo2D/t+MInYCo6dzAkMWge
	8trlfA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 411s5pgwm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 06:33:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47G6XRUQ010158
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 06:33:27 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 15 Aug 2024 23:33:23 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 16 Aug 2024 12:01:44 +0530
Subject: [PATCH v4 2/8] clk: qcom: Add support for Video clock controller
 on SA8775P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240816-sa8775p-mm-v3-v1-2-77d53c3c0cef@quicinc.com>
References: <20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com>
In-Reply-To: <20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
        <quic_imrashai@quicinc.com>, <quic_jkona@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Rqj9IPowVRV8m-G-ysh8RRIwx8XmL_yS
X-Proofpoint-ORIG-GUID: Rqj9IPowVRV8m-G-ysh8RRIwx8XmL_yS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_18,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160045

Add support for Video Clock Controller for SA8775P platform.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/Kconfig           |  11 +
 drivers/clk/qcom/Makefile          |   1 +
 drivers/clk/qcom/videocc-sa8775p.c | 576 +++++++++++++++++++++++++++++++++++++
 3 files changed, 588 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 11ae28430dad..7d6983a29772 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1160,6 +1160,17 @@ config SM_TCSRCC_8650
 	  Support for the TCSR clock controller on SM8650 devices.
 	  Say Y if you want to use peripheral devices such as SD/UFS.
 
+config SA_VIDEOCC_8775P
+	tristate "SA8775P Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select SA_GCC_8775P
+	select QCOM_GDSC
+	help
+	  Support for the video clock controller on Qualcomm Technologies, Inc.
+	  SA8775P devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode/decode.
+
 config SM_VIDEOCC_7150
 	tristate "SM7150 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 0de5fce6113a..8b13b385b830 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -82,6 +82,7 @@ obj-$(CONFIG_SC_DISPCC_7280) += dispcc-sc7280.o
 obj-$(CONFIG_SC_DISPCC_8280XP) += dispcc-sc8280xp.o
 obj-$(CONFIG_SA_GCC_8775P) += gcc-sa8775p.o
 obj-$(CONFIG_SA_GPUCC_8775P) += gpucc-sa8775p.o
+obj-$(CONFIG_SA_VIDEOCC_8775P) += videocc-sa8775p.o
 obj-$(CONFIG_SC_GCC_7180) += gcc-sc7180.o
 obj-$(CONFIG_SC_GCC_7280) += gcc-sc7280.o
 obj-$(CONFIG_SC_GCC_8180X) += gcc-sc8180x.o
diff --git a/drivers/clk/qcom/videocc-sa8775p.c b/drivers/clk/qcom/videocc-sa8775p.c
new file mode 100644
index 000000000000..bf5de411fd5d
--- /dev/null
+++ b/drivers/clk/qcom/videocc-sa8775p.c
@@ -0,0 +1,576 @@
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
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,sa8775p-videocc.h>
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
+	DT_IFACE,
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_SLEEP_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_BI_TCXO_AO,
+	P_SLEEP_CLK,
+	P_VIDEO_PLL0_OUT_MAIN,
+	P_VIDEO_PLL1_OUT_MAIN,
+};
+
+static const struct pll_vco lucid_evo_vco[] = {
+	{ 249600000, 2020000000, 0 },
+};
+
+static const struct alpha_pll_config video_pll0_config = {
+	.l = 0x39,
+	.alpha = 0x3000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x32aa299c,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400805,
+};
+
+static struct clk_alpha_pll video_pll0 = {
+	.offset = 0x0,
+	.vco_table = lucid_evo_vco,
+	.num_vco = ARRAY_SIZE(lucid_evo_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct alpha_pll_config video_pll1_config = {
+	.l = 0x39,
+	.alpha = 0x3000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x32aa299c,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400805,
+};
+
+static struct clk_alpha_pll video_pll1 = {
+	.offset = 0x1000,
+	.vco_table = lucid_evo_vco,
+	.num_vco = ARRAY_SIZE(lucid_evo_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct parent_map video_cc_parent_map_0_ao[] = {
+	{ P_BI_TCXO_AO, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0_ao[] = {
+	{ .index = DT_BI_TCXO_AO },
+};
+
+static const struct parent_map video_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_PLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_pll0.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_PLL1_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_pll1.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_3[] = {
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_3[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct freq_tbl ftbl_video_cc_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO_AO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_ahb_clk_src = {
+	.cmd_rcgr = 0x8030,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0_ao,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_ahb_clk_src",
+		.parent_data = video_cc_parent_data_0_ao,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0_ao),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
+	F(1098000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1332000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1599000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1680000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
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
+static const struct freq_tbl ftbl_video_cc_mvs1_clk_src[] = {
+	F(1098000000, P_VIDEO_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1332000000, P_VIDEO_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1600000000, P_VIDEO_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1800000000, P_VIDEO_PLL1_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs1_clk_src = {
+	.cmd_rcgr = 0x8018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_2,
+	.freq_tbl = ftbl_video_cc_mvs1_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs1_clk_src",
+		.parent_data = video_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_2),
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
+	.cmd_rcgr = 0x812c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_3,
+	.freq_tbl = ftbl_video_cc_sleep_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_sleep_clk_src",
+		.parent_data = video_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 video_cc_xo_clk_src = {
+	.cmd_rcgr = 0x8110,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0_ao,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_xo_clk_src",
+		.parent_data = video_cc_parent_data_0_ao,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0_ao),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0_div_clk_src = {
+	.reg = 0x80b8,
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
+	.reg = 0x806c,
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
+static struct clk_regmap_div video_cc_mvs1_div_clk_src = {
+	.reg = 0x80dc,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs1_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs1c_div2_div_clk_src = {
+	.reg = 0x8094,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs1c_div2_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_sm_div_clk_src = {
+	.reg = 0x8108,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_sm_div_clk_src",
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0x80b0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80b0,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80b0,
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
+static struct clk_branch video_cc_mvs0c_clk = {
+	.halt_reg = 0x8064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8064,
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
+static struct clk_branch video_cc_mvs1_clk = {
+	.halt_reg = 0x80d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1c_clk = {
+	.halt_reg = 0x808c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x808c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs1c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_pll_lock_monitor_clk = {
+	.halt_reg = 0x9000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll_lock_monitor_clk",
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
+static struct clk_branch video_cc_sm_obs_clk = {
+	.halt_reg = 0x810c,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x810c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_sm_obs_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_sm_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc video_cc_mvs0c_gdsc = {
+	.gdscr = 0x804c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
+};
+
+static struct gdsc video_cc_mvs0_gdsc = {
+	.gdscr = 0x809c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs0c_gdsc.pd,
+	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR | HW_CTRL_TRIGGER,
+};
+
+static struct gdsc video_cc_mvs1c_gdsc = {
+	.gdscr = 0x8074,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs1c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
+};
+
+static struct gdsc video_cc_mvs1_gdsc = {
+	.gdscr = 0x80c0,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs1c_gdsc.pd,
+	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR | HW_CTRL_TRIGGER,
+};
+
+static struct clk_regmap *video_cc_sa8775p_clocks[] = {
+	[VIDEO_CC_AHB_CLK_SRC] = &video_cc_ahb_clk_src.clkr,
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_DIV_CLK_SRC] = &video_cc_mvs0_div_clk_src.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC] = &video_cc_mvs0c_div2_div_clk_src.clkr,
+	[VIDEO_CC_MVS1_CLK] = &video_cc_mvs1_clk.clkr,
+	[VIDEO_CC_MVS1_CLK_SRC] = &video_cc_mvs1_clk_src.clkr,
+	[VIDEO_CC_MVS1_DIV_CLK_SRC] = &video_cc_mvs1_div_clk_src.clkr,
+	[VIDEO_CC_MVS1C_CLK] = &video_cc_mvs1c_clk.clkr,
+	[VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC] = &video_cc_mvs1c_div2_div_clk_src.clkr,
+	[VIDEO_CC_PLL_LOCK_MONITOR_CLK] = &video_cc_pll_lock_monitor_clk.clkr,
+	[VIDEO_CC_SLEEP_CLK_SRC] = &video_cc_sleep_clk_src.clkr,
+	[VIDEO_CC_SM_DIV_CLK_SRC] = &video_cc_sm_div_clk_src.clkr,
+	[VIDEO_CC_SM_OBS_CLK] = &video_cc_sm_obs_clk.clkr,
+	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
+	[VIDEO_PLL0] = &video_pll0.clkr,
+	[VIDEO_PLL1] = &video_pll1.clkr,
+};
+
+static struct gdsc *video_cc_sa8775p_gdscs[] = {
+	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
+	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
+	[VIDEO_CC_MVS1_GDSC] = &video_cc_mvs1_gdsc,
+	[VIDEO_CC_MVS1C_GDSC] = &video_cc_mvs1c_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_sa8775p_resets[] = {
+	[VIDEO_CC_INTERFACE_BCR] = { 0x80e8 },
+	[VIDEO_CC_MVS0_BCR] = { 0x8098 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x8064, 2 },
+	[VIDEO_CC_MVS0C_BCR] = { 0x8048 },
+	[VIDEO_CC_MVS1_BCR] = { 0x80bc },
+	[VIDEO_CC_MVS1C_CLK_ARES] = { 0x808c, 2 },
+	[VIDEO_CC_MVS1C_BCR] = { 0x8070 },
+};
+
+static const struct regmap_config video_cc_sa8775p_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xb000,
+	.fast_io = true,
+};
+
+static struct qcom_cc_desc video_cc_sa8775p_desc = {
+	.config = &video_cc_sa8775p_regmap_config,
+	.clks = video_cc_sa8775p_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_sa8775p_clocks),
+	.resets = video_cc_sa8775p_resets,
+	.num_resets = ARRAY_SIZE(video_cc_sa8775p_resets),
+	.gdscs = video_cc_sa8775p_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_sa8775p_gdscs),
+};
+
+static const struct of_device_id video_cc_sa8775p_match_table[] = {
+	{ .compatible = "qcom,sa8775p-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_sa8775p_match_table);
+
+static int video_cc_sa8775p_probe(struct platform_device *pdev)
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
+	regmap = qcom_cc_map(pdev, &video_cc_sa8775p_desc);
+	if (IS_ERR(regmap)) {
+		pm_runtime_put(&pdev->dev);
+		return PTR_ERR(regmap);
+	}
+
+	clk_lucid_evo_pll_configure(&video_pll0, regmap, &video_pll0_config);
+	clk_lucid_evo_pll_configure(&video_pll1, regmap, &video_pll1_config);
+
+	/* Keep some clocks always enabled */
+	qcom_branch_set_clk_en(regmap, 0x80ec); /* VIDEO_CC_AHB_CLK */
+	qcom_branch_set_clk_en(regmap, 0x8144); /* VIDEO_CC_SLEEP_CLK */
+	qcom_branch_set_clk_en(regmap, 0x8128); /* VIDEO_CC_XO_CLK */
+
+	ret = qcom_cc_really_probe(&pdev->dev, &video_cc_sa8775p_desc, regmap);
+
+	pm_runtime_put(&pdev->dev);
+
+	return ret;
+}
+
+static struct platform_driver video_cc_sa8775p_driver = {
+	.probe = video_cc_sa8775p_probe,
+	.driver = {
+		.name = "videocc-sa8775p",
+		.of_match_table = video_cc_sa8775p_match_table,
+	},
+};
+
+module_platform_driver(video_cc_sa8775p_driver);
+
+MODULE_DESCRIPTION("QTI VIDEOCC SA8775P Driver");
+MODULE_LICENSE("GPL");

-- 
2.45.2


