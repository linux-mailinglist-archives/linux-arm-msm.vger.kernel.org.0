Return-Path: <linux-arm-msm+bounces-63344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6E3AF0EE0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 11:06:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECE404E5687
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 09:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325E9246791;
	Wed,  2 Jul 2025 09:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ayNU7RyY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A54245023;
	Wed,  2 Jul 2025 09:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447145; cv=none; b=Xy8vfh19c4FptwOCH12WhZlapQ+QMeORbOui7iZKmwe6rTl0YkB6jP+eLUBySnAseE19aLVvD6b4F1Rh50odSN5aAWbDjhCsg2FI8z6NQUczc6h1eJgSKxhAbE1RNp0RK7orwihvwygXbeQHlgXvvIiAKJpuqjlKhMayHRCvhSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447145; c=relaxed/simple;
	bh=SEDjeXsypHPD3S7nIax68cMzXvTzL9x832nKp72RTGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sPSjfW3z9f9uPaILPRsvOuL5Wx4UHzlVcAPZl1K2hsSs+icDtjOmCzBzkKYDr0KJdX+Hgt19cQYqm0wHGppmWObOsuoTHiNr3Ba4cCZI8Tb2diHhGz7GDOOzJWO46V8CRqleLCXR7jSuwiHCVpquvFpE795AaEaHo71LaiUbh1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ayNU7RyY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5627jMWw025180;
	Wed, 2 Jul 2025 09:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Sbr4HgwGlazjzvidksYkaxbGr7xRxzcwzdXSwZk41Y=; b=ayNU7RyY1QC08hBF
	7jIxP1YLyBbXQRUzgJIfxucTtKuXTUyVnq0ijS9bPcaeJ2NzkQhamt6fe+dc7VlB
	4TzcXg7GhCxv+nuAQEmW4Wbdr724QInsA1xhvGYI8XfKqykbc/xv+XOfikeWY4BX
	+E/nW3YU5MkotVjkbGAEIPxRyY3NMePm8ajXy8yI5Hk3qqp+B4+yCQ0aiMAnSn7s
	tJzDUvgage3WBnydKPxMMCqBOXv+FZk2QvYO9PrXJCDPBQyphLuk0u33qq0I0emA
	l0Aw6uAydziXCGPtoLYa7SoKhzKFojNQPyUm+q1qhp5jUi1P5WiJ5pkPn+d1KzHe
	bcQx4w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64s50j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 09:05:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56295EFF005994
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 09:05:14 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 2 Jul 2025 02:05:08 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 2 Jul 2025 14:34:23 +0530
Subject: [PATCH v11 03/10] clk: qcom: camcc-qcs615: Add QCS615 camera clock
 controller driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250702-qcs615-mm-v10-clock-controllers-v11-3-9c216e1615ab@quicinc.com>
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
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6864f65b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=75a0eyr4C_q1bDnl5JEA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA3MyBTYWx0ZWRfX47y4MMDX8nT0
 Y2rPvI1J317XYSPKzAEP9dVkXRrH09rwxbHWnhYRgPOtBhtJchAVTHog28a6DuVaWVR8VthH/lX
 v68uCXrTo5upSUYvBoApuGZsHFGqVRzwfxHdUAXVN4W0LSWi70HYvuSKhaSYLrmKR7qKAfYXKAq
 66VnOiLyBUiqEws1PToWful5V/nrqITHLxbbGVXhKiVnbnRdl49cHFtEKEiUFShRtAStgqOQo7u
 8BdM3JjAverk37v2e1nYgwNQKsoNVSmhQLqhKAnw6g+u+H17GpVtt1mEygi1+mbUN0NeC9Kp5nk
 h2m2+M/ScZbuNlU3XS+5m8uyVLkY9WsuKqOqMxwGvUdkJIjKpHcS4gmoHZwfS588bpFrIy9UviN
 eSMZ7p6oqThMkv0AeKXGXZOzsnLJFQ/a0k5NYq/thoYvVw22rUV7GV2O1Vwi5/t/dnraFodq
X-Proofpoint-GUID: H5vk3v4NfZXqHAyx3ysGWDKlkvIiPiZg
X-Proofpoint-ORIG-GUID: H5vk3v4NfZXqHAyx3ysGWDKlkvIiPiZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020073

Add support for the camera clock controller for camera clients to
be able to request for camcc clocks on QCS615 platform.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/Kconfig        |   10 +
 drivers/clk/qcom/Makefile       |    1 +
 drivers/clk/qcom/camcc-qcs615.c | 1597 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 1608 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 36d6e6e1e7f0162d53f02f39125f4593517e0dba..f4c9fb2b4fb027261bc4eac2eeb3e84dc6aae877 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -493,6 +493,16 @@ config QCM_DISPCC_2290
 	  Say Y if you want to support display devices and functionality such as
 	  splash screen.
 
+config QCS_CAMCC_615
+	tristate "QCS615 Camera Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select QCS_GCC_615
+	help
+	  Support for the camera clock controller on Qualcomm Technologies, Inc
+	  QCS615 devices.
+	  Say Y if you want to support camera devices and functionality such as
+	  capturing pictures.
+
 config QCS_GCC_404
 	tristate "QCS404 Global Clock Controller"
 	help
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index ab59434338bb6d6f49b0af94ff0f85cb386a16db..c5f97e0dccd2b72b1bed9ea8e93f0cdee301912a 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -73,6 +73,7 @@ obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
 obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
 obj-$(CONFIG_QCM_GCC_2290) += gcc-qcm2290.o
 obj-$(CONFIG_QCM_DISPCC_2290) += dispcc-qcm2290.o
+obj-$(CONFIG_QCS_CAMCC_615) += camcc-qcs615.o
 obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
 obj-$(CONFIG_QCS_GCC_615) += gcc-qcs615.o
 obj-$(CONFIG_QCS_GCC_8300) += gcc-qcs8300.o
diff --git a/drivers/clk/qcom/camcc-qcs615.c b/drivers/clk/qcom/camcc-qcs615.c
new file mode 100644
index 0000000000000000000000000000000000000000..c063a3bfacd006af0fcbdbd9afbaa22ab83bcf8e
--- /dev/null
+++ b/drivers/clk/qcom/camcc-qcs615.c
@@ -0,0 +1,1597 @@
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
+#include <dt-bindings/clock/qcom,qcs615-camcc.h>
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
+};
+
+enum {
+	P_BI_TCXO,
+	P_CAM_CC_PLL0_OUT_AUX,
+	P_CAM_CC_PLL1_OUT_AUX,
+	P_CAM_CC_PLL2_OUT_AUX2,
+	P_CAM_CC_PLL2_OUT_EARLY,
+	P_CAM_CC_PLL3_OUT_MAIN,
+};
+
+static const struct pll_vco brammo_vco[] = {
+	{ 500000000, 1250000000, 0 },
+};
+
+static const struct pll_vco spark_vco[] = {
+	{ 1000000000, 2100000000, 0 },
+	{ 750000000, 1500000000, 1 },
+	{ 500000000, 1000000000, 2 },
+	{ 300000000, 500000000, 3 },
+	{ 550000000, 1100000000, 4 },
+};
+
+/* 600MHz configuration VCO - 2 */
+static const struct alpha_pll_config cam_cc_pll0_config = {
+	.l = 0x1f,
+	.alpha_hi = 0x40,
+	.alpha_en_mask = BIT(24),
+	.vco_val = BIT(21),
+	.vco_mask = GENMASK(21, 20),
+	.aux_output_mask = BIT(1),
+	.config_ctl_val = 0x4001055b,
+	.test_ctl_hi_val = 0x1,
+	.test_ctl_hi_mask = 0x1,
+};
+
+static struct clk_alpha_pll cam_cc_pll0 = {
+	.offset = 0x0,
+	.config = &cam_cc_pll0_config,
+	.vco_table = spark_vco,
+	.num_vco = ARRAY_SIZE(spark_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+/* 808MHz configuration VCO - 2 */
+static struct alpha_pll_config cam_cc_pll1_config = {
+	.l = 0x2a,
+	.alpha_hi = 0x15,
+	.alpha = 0x55555555,
+	.alpha_en_mask = BIT(24),
+	.vco_val = BIT(21),
+	.vco_mask = GENMASK(21, 20),
+	.aux_output_mask = BIT(1),
+	.config_ctl_val = 0x4001055b,
+	.test_ctl_hi_val = 0x1,
+	.test_ctl_hi_mask = 0x1,
+};
+
+static struct clk_alpha_pll cam_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &cam_cc_pll1_config,
+	.vco_table = spark_vco,
+	.num_vco = ARRAY_SIZE(spark_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+/* 960MHz configuration VCO - 0 */
+static struct alpha_pll_config cam_cc_pll2_config = {
+	.l = 0x32,
+	.vco_val = 0x0,
+	.vco_mask = GENMASK(21, 20),
+	.early_output_mask = BIT(3),
+	.aux2_output_mask = BIT(2),
+	.post_div_val = 0x1 << 8,
+	.post_div_mask = 0x3 << 8,
+	.config_ctl_val = 0x04289,
+	.test_ctl_val = 0x08000000,
+	.test_ctl_mask = 0x08000000,
+};
+
+static struct clk_alpha_pll cam_cc_pll2 = {
+	.offset = 0x2000,
+	.config = &cam_cc_pll2_config,
+	.vco_table = brammo_vco,
+	.num_vco = ARRAY_SIZE(brammo_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_BRAMMO],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll2",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll2_out_aux2[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll2_out_aux2 = {
+	.offset = 0x2000,
+	.post_div_shift = 8,
+	.post_div_table = post_div_table_cam_cc_pll2_out_aux2,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll2_out_aux2),
+	.width = 2,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_BRAMMO],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll2_out_aux2",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll2.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ops,
+	},
+};
+
+/* 1080MHz configuration - VCO - 0 */
+static struct alpha_pll_config cam_cc_pll3_config = {
+	.l = 0x38,
+	.alpha_hi = 0x40,
+	.alpha_en_mask = BIT(24),
+	.vco_val = 0x0,
+	.vco_mask = GENMASK(21, 20),
+	.main_output_mask = BIT(0),
+	.config_ctl_val = 0x4001055b,
+	.test_ctl_hi_val = 0x1,
+	.test_ctl_hi_mask = 0x1,
+};
+
+static struct clk_alpha_pll cam_cc_pll3 = {
+	.offset = 0x3000,
+	.config = &cam_cc_pll3_config,
+	.vco_table = spark_vco,
+	.num_vco = ARRAY_SIZE(spark_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll3",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static const struct parent_map cam_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL1_OUT_AUX, 2 },
+	{ P_CAM_CC_PLL0_OUT_AUX, 6 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll1.clkr.hw },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL2_OUT_EARLY, 4 },
+	{ P_CAM_CC_PLL3_OUT_MAIN, 5 },
+	{ P_CAM_CC_PLL0_OUT_AUX, 6 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll2.clkr.hw },
+	{ .hw = &cam_cc_pll3.clkr.hw },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL1_OUT_AUX, 2 },
+	{ P_CAM_CC_PLL2_OUT_EARLY, 4 },
+	{ P_CAM_CC_PLL3_OUT_MAIN, 5 },
+	{ P_CAM_CC_PLL0_OUT_AUX, 6 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll1.clkr.hw },
+	{ .hw = &cam_cc_pll2.clkr.hw },
+	{ .hw = &cam_cc_pll3.clkr.hw },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL2_OUT_AUX2, 1 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll2_out_aux2.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL3_OUT_MAIN, 5 },
+	{ P_CAM_CC_PLL0_OUT_AUX, 6 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_4[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll3.clkr.hw },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL0_OUT_AUX, 6 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_5[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_6[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL1_OUT_AUX, 2 },
+	{ P_CAM_CC_PLL3_OUT_MAIN, 5 },
+	{ P_CAM_CC_PLL0_OUT_AUX, 6 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_6[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll1.clkr.hw },
+	{ .hw = &cam_cc_pll3.clkr.hw },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_cam_cc_bps_clk_src[] = {
+	F(200000000, P_CAM_CC_PLL0_OUT_AUX, 3, 0, 0),
+	F(360000000, P_CAM_CC_PLL3_OUT_MAIN, 3, 0, 0),
+	F(432000000, P_CAM_CC_PLL3_OUT_MAIN, 2.5, 0, 0),
+	F(480000000, P_CAM_CC_PLL2_OUT_EARLY, 2, 0, 0),
+	F(540000000, P_CAM_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	F(600000000, P_CAM_CC_PLL0_OUT_AUX, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_bps_clk_src = {
+	.cmd_rcgr = 0x6010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_bps_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_bps_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_cci_clk_src[] = {
+	F(37500000, P_CAM_CC_PLL0_OUT_AUX, 16, 0, 0),
+	F(50000000, P_CAM_CC_PLL0_OUT_AUX, 12, 0, 0),
+	F(100000000, P_CAM_CC_PLL0_OUT_AUX, 6, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_cci_clk_src = {
+	.cmd_rcgr = 0xb0d8,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_5,
+	.freq_tbl = ftbl_cam_cc_cci_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_cci_clk_src",
+		.parent_data = cam_cc_parent_data_5,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_5),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_cphy_rx_clk_src[] = {
+	F(100000000, P_CAM_CC_PLL0_OUT_AUX, 6, 0, 0),
+	F(200000000, P_CAM_CC_PLL0_OUT_AUX, 3, 0, 0),
+	F(269333333, P_CAM_CC_PLL1_OUT_AUX, 3, 0, 0),
+	F(320000000, P_CAM_CC_PLL2_OUT_EARLY, 3, 0, 0),
+	F(384000000, P_CAM_CC_PLL2_OUT_EARLY, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
+	.cmd_rcgr = 0x9064,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_2,
+	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_cphy_rx_clk_src",
+		.parent_data = cam_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_csi0phytimer_clk_src[] = {
+	F(100000000, P_CAM_CC_PLL0_OUT_AUX, 6, 0, 0),
+	F(200000000, P_CAM_CC_PLL0_OUT_AUX, 3, 0, 0),
+	F(269333333, P_CAM_CC_PLL1_OUT_AUX, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_csi0phytimer_clk_src = {
+	.cmd_rcgr = 0x5004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csi0phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
+	.cmd_rcgr = 0x5028,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csi1phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_csi2phytimer_clk_src = {
+	.cmd_rcgr = 0x504c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csi2phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_fast_ahb_clk_src[] = {
+	F(100000000, P_CAM_CC_PLL0_OUT_AUX, 6, 0, 0),
+	F(200000000, P_CAM_CC_PLL0_OUT_AUX, 3, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(404000000, P_CAM_CC_PLL1_OUT_AUX, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_fast_ahb_clk_src = {
+	.cmd_rcgr = 0x603c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_fast_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_fast_ahb_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_icp_clk_src[] = {
+	F(240000000, P_CAM_CC_PLL0_OUT_AUX, 2.5, 0, 0),
+	F(360000000, P_CAM_CC_PLL3_OUT_MAIN, 3, 0, 0),
+	F(432000000, P_CAM_CC_PLL3_OUT_MAIN, 2.5, 0, 0),
+	F(480000000, P_CAM_CC_PLL2_OUT_EARLY, 2, 0, 0),
+	F(540000000, P_CAM_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	F(600000000, P_CAM_CC_PLL0_OUT_AUX, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_icp_clk_src = {
+	.cmd_rcgr = 0xb088,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_icp_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_icp_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_ife_0_clk_src[] = {
+	F(240000000, P_CAM_CC_PLL0_OUT_AUX, 2.5, 0, 0),
+	F(360000000, P_CAM_CC_PLL3_OUT_MAIN, 3, 0, 0),
+	F(432000000, P_CAM_CC_PLL3_OUT_MAIN, 2.5, 0, 0),
+	F(540000000, P_CAM_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	F(600000000, P_CAM_CC_PLL0_OUT_AUX, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_ife_0_clk_src = {
+	.cmd_rcgr = 0x9010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_4,
+	.freq_tbl = ftbl_cam_cc_ife_0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ife_0_clk_src",
+		.parent_data = cam_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_ife_0_csid_clk_src[] = {
+	F(100000000, P_CAM_CC_PLL0_OUT_AUX, 6, 0, 0),
+	F(200000000, P_CAM_CC_PLL0_OUT_AUX, 3, 0, 0),
+	F(320000000, P_CAM_CC_PLL2_OUT_EARLY, 3, 0, 0),
+	F(404000000, P_CAM_CC_PLL1_OUT_AUX, 2, 0, 0),
+	F(480000000, P_CAM_CC_PLL2_OUT_EARLY, 2, 0, 0),
+	F(540000000, P_CAM_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_ife_0_csid_clk_src = {
+	.cmd_rcgr = 0x903c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_2,
+	.freq_tbl = ftbl_cam_cc_ife_0_csid_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ife_0_csid_clk_src",
+		.parent_data = cam_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_ife_1_clk_src = {
+	.cmd_rcgr = 0xa010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_4,
+	.freq_tbl = ftbl_cam_cc_ife_0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ife_1_clk_src",
+		.parent_data = cam_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_ife_1_csid_clk_src = {
+	.cmd_rcgr = 0xa034,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_2,
+	.freq_tbl = ftbl_cam_cc_ife_0_csid_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ife_1_csid_clk_src",
+		.parent_data = cam_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
+	.cmd_rcgr = 0xb004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_4,
+	.freq_tbl = ftbl_cam_cc_ife_0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ife_lite_clk_src",
+		.parent_data = cam_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
+	.cmd_rcgr = 0xb024,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_2,
+	.freq_tbl = ftbl_cam_cc_ife_0_csid_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ife_lite_csid_clk_src",
+		.parent_data = cam_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_ipe_0_clk_src = {
+	.cmd_rcgr = 0x7010,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_icp_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ipe_0_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_jpeg_clk_src[] = {
+	F(66666667, P_CAM_CC_PLL0_OUT_AUX, 9, 0, 0),
+	F(133333333, P_CAM_CC_PLL0_OUT_AUX, 4.5, 0, 0),
+	F(216000000, P_CAM_CC_PLL3_OUT_MAIN, 5, 0, 0),
+	F(320000000, P_CAM_CC_PLL2_OUT_EARLY, 3, 0, 0),
+	F(480000000, P_CAM_CC_PLL2_OUT_EARLY, 2, 0, 0),
+	F(600000000, P_CAM_CC_PLL0_OUT_AUX, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_jpeg_clk_src = {
+	.cmd_rcgr = 0xb04c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_jpeg_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_jpeg_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_lrme_clk_src[] = {
+	F(200000000, P_CAM_CC_PLL0_OUT_AUX, 3, 0, 0),
+	F(216000000, P_CAM_CC_PLL3_OUT_MAIN, 5, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(404000000, P_CAM_CC_PLL1_OUT_AUX, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_lrme_clk_src = {
+	.cmd_rcgr = 0xb0f8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_6,
+	.freq_tbl = ftbl_cam_cc_lrme_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_lrme_clk_src",
+		.parent_data = cam_cc_parent_data_6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_6),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_mclk0_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24000000, P_CAM_CC_PLL2_OUT_AUX2, 10, 1, 2),
+	F(34285714, P_CAM_CC_PLL2_OUT_AUX2, 14, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_mclk0_clk_src = {
+	.cmd_rcgr = 0x4004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_3,
+	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_mclk0_clk_src",
+		.parent_data = cam_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_mclk1_clk_src = {
+	.cmd_rcgr = 0x4024,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_3,
+	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_mclk1_clk_src",
+		.parent_data = cam_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_mclk2_clk_src = {
+	.cmd_rcgr = 0x4044,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_3,
+	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_mclk2_clk_src",
+		.parent_data = cam_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_mclk3_clk_src = {
+	.cmd_rcgr = 0x4064,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_3,
+	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_mclk3_clk_src",
+		.parent_data = cam_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_slow_ahb_clk_src[] = {
+	F(80000000, P_CAM_CC_PLL0_OUT_AUX, 7.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
+	.cmd_rcgr = 0x6058,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_slow_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_slow_ahb_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_branch cam_cc_bps_ahb_clk = {
+	.halt_reg = 0x6070,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_bps_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_bps_areg_clk = {
+	.halt_reg = 0x6054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6054,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_bps_areg_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_bps_axi_clk = {
+	.halt_reg = 0x6038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_bps_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_bps_clk = {
+	.halt_reg = 0x6028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_bps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_bps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_axi_clk = {
+	.halt_reg = 0xb124,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb124,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cci_clk = {
+	.halt_reg = 0xb0f0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb0f0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cci_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cci_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_core_ahb_clk = {
+	.halt_reg = 0xb144,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xb144,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_core_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cpas_ahb_clk = {
+	.halt_reg = 0xb11c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb11c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cpas_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi0phytimer_clk = {
+	.halt_reg = 0x501c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x501c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi0phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi0phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi1phytimer_clk = {
+	.halt_reg = 0x5040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi1phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi1phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi2phytimer_clk = {
+	.halt_reg = 0x5064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi2phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi2phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy0_clk = {
+	.halt_reg = 0x5020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy1_clk = {
+	.halt_reg = 0x5044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy2_clk = {
+	.halt_reg = 0x5068,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_icp_clk = {
+	.halt_reg = 0xb0a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb0a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_icp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_icp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_0_axi_clk = {
+	.halt_reg = 0x9080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9080,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_0_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_0_clk = {
+	.halt_reg = 0x9028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_0_cphy_rx_clk = {
+	.halt_reg = 0x907c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x907c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_0_cphy_rx_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_0_csid_clk = {
+	.halt_reg = 0x9054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9054,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_0_csid_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_0_csid_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_0_dsp_clk = {
+	.halt_reg = 0x9038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_0_dsp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_1_axi_clk = {
+	.halt_reg = 0xa058,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa058,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_1_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_1_clk = {
+	.halt_reg = 0xa028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_1_cphy_rx_clk = {
+	.halt_reg = 0xa054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa054,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_1_cphy_rx_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_1_csid_clk = {
+	.halt_reg = 0xa04c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa04c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_1_csid_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_1_csid_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_1_dsp_clk = {
+	.halt_reg = 0xa030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_1_dsp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_clk = {
+	.halt_reg = 0xb01c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_lite_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_lite_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_cphy_rx_clk = {
+	.halt_reg = 0xb044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_lite_cphy_rx_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_csid_clk = {
+	.halt_reg = 0xb03c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb03c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_lite_csid_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_lite_csid_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_0_ahb_clk = {
+	.halt_reg = 0x7040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x7040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_0_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_0_areg_clk = {
+	.halt_reg = 0x703c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x703c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_0_areg_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_0_axi_clk = {
+	.halt_reg = 0x7038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x7038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_0_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_0_clk = {
+	.halt_reg = 0x7028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x7028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ipe_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_jpeg_clk = {
+	.halt_reg = 0xb064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_jpeg_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_jpeg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_lrme_clk = {
+	.halt_reg = 0xb110,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb110,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_lrme_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_lrme_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_mclk0_clk = {
+	.halt_reg = 0x401c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x401c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_mclk0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_mclk1_clk = {
+	.halt_reg = 0x403c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x403c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_mclk1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_mclk2_clk = {
+	.halt_reg = 0x405c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x405c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_mclk2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_mclk3_clk = {
+	.halt_reg = 0x407c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x407c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_mclk3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_soc_ahb_clk = {
+	.halt_reg = 0xb140,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb140,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_soc_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_sys_tmr_clk = {
+	.halt_reg = 0xb0a8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xb0a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_sys_tmr_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc titan_top_gdsc = {
+	.gdscr = 0xb134,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "titan_top_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR,
+};
+
+static struct gdsc bps_gdsc = {
+	.gdscr = 0x6004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "bps_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
+	.flags = POLL_CFG_GDSCR,
+};
+
+static struct gdsc ife_0_gdsc = {
+	.gdscr = 0x9004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "ife_0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
+	.flags = POLL_CFG_GDSCR,
+};
+
+static struct gdsc ife_1_gdsc = {
+	.gdscr = 0xa004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "ife_1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
+	.flags = POLL_CFG_GDSCR,
+};
+
+static struct gdsc ipe_0_gdsc = {
+	.gdscr = 0x7004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "ipe_0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *cam_cc_qcs615_clocks[] = {
+	[CAM_CC_BPS_AHB_CLK] = &cam_cc_bps_ahb_clk.clkr,
+	[CAM_CC_BPS_AREG_CLK] = &cam_cc_bps_areg_clk.clkr,
+	[CAM_CC_BPS_AXI_CLK] = &cam_cc_bps_axi_clk.clkr,
+	[CAM_CC_BPS_CLK] = &cam_cc_bps_clk.clkr,
+	[CAM_CC_BPS_CLK_SRC] = &cam_cc_bps_clk_src.clkr,
+	[CAM_CC_CAMNOC_AXI_CLK] = &cam_cc_camnoc_axi_clk.clkr,
+	[CAM_CC_CCI_CLK] = &cam_cc_cci_clk.clkr,
+	[CAM_CC_CCI_CLK_SRC] = &cam_cc_cci_clk_src.clkr,
+	[CAM_CC_CORE_AHB_CLK] = &cam_cc_core_ahb_clk.clkr,
+	[CAM_CC_CPAS_AHB_CLK] = &cam_cc_cpas_ahb_clk.clkr,
+	[CAM_CC_CPHY_RX_CLK_SRC] = &cam_cc_cphy_rx_clk_src.clkr,
+	[CAM_CC_CSI0PHYTIMER_CLK] = &cam_cc_csi0phytimer_clk.clkr,
+	[CAM_CC_CSI0PHYTIMER_CLK_SRC] = &cam_cc_csi0phytimer_clk_src.clkr,
+	[CAM_CC_CSI1PHYTIMER_CLK] = &cam_cc_csi1phytimer_clk.clkr,
+	[CAM_CC_CSI1PHYTIMER_CLK_SRC] = &cam_cc_csi1phytimer_clk_src.clkr,
+	[CAM_CC_CSI2PHYTIMER_CLK] = &cam_cc_csi2phytimer_clk.clkr,
+	[CAM_CC_CSI2PHYTIMER_CLK_SRC] = &cam_cc_csi2phytimer_clk_src.clkr,
+	[CAM_CC_CSIPHY0_CLK] = &cam_cc_csiphy0_clk.clkr,
+	[CAM_CC_CSIPHY1_CLK] = &cam_cc_csiphy1_clk.clkr,
+	[CAM_CC_CSIPHY2_CLK] = &cam_cc_csiphy2_clk.clkr,
+	[CAM_CC_FAST_AHB_CLK_SRC] = &cam_cc_fast_ahb_clk_src.clkr,
+	[CAM_CC_ICP_CLK] = &cam_cc_icp_clk.clkr,
+	[CAM_CC_ICP_CLK_SRC] = &cam_cc_icp_clk_src.clkr,
+	[CAM_CC_IFE_0_AXI_CLK] = &cam_cc_ife_0_axi_clk.clkr,
+	[CAM_CC_IFE_0_CLK] = &cam_cc_ife_0_clk.clkr,
+	[CAM_CC_IFE_0_CLK_SRC] = &cam_cc_ife_0_clk_src.clkr,
+	[CAM_CC_IFE_0_CPHY_RX_CLK] = &cam_cc_ife_0_cphy_rx_clk.clkr,
+	[CAM_CC_IFE_0_CSID_CLK] = &cam_cc_ife_0_csid_clk.clkr,
+	[CAM_CC_IFE_0_CSID_CLK_SRC] = &cam_cc_ife_0_csid_clk_src.clkr,
+	[CAM_CC_IFE_0_DSP_CLK] = &cam_cc_ife_0_dsp_clk.clkr,
+	[CAM_CC_IFE_1_AXI_CLK] = &cam_cc_ife_1_axi_clk.clkr,
+	[CAM_CC_IFE_1_CLK] = &cam_cc_ife_1_clk.clkr,
+	[CAM_CC_IFE_1_CLK_SRC] = &cam_cc_ife_1_clk_src.clkr,
+	[CAM_CC_IFE_1_CPHY_RX_CLK] = &cam_cc_ife_1_cphy_rx_clk.clkr,
+	[CAM_CC_IFE_1_CSID_CLK] = &cam_cc_ife_1_csid_clk.clkr,
+	[CAM_CC_IFE_1_CSID_CLK_SRC] = &cam_cc_ife_1_csid_clk_src.clkr,
+	[CAM_CC_IFE_1_DSP_CLK] = &cam_cc_ife_1_dsp_clk.clkr,
+	[CAM_CC_IFE_LITE_CLK] = &cam_cc_ife_lite_clk.clkr,
+	[CAM_CC_IFE_LITE_CLK_SRC] = &cam_cc_ife_lite_clk_src.clkr,
+	[CAM_CC_IFE_LITE_CPHY_RX_CLK] = &cam_cc_ife_lite_cphy_rx_clk.clkr,
+	[CAM_CC_IFE_LITE_CSID_CLK] = &cam_cc_ife_lite_csid_clk.clkr,
+	[CAM_CC_IFE_LITE_CSID_CLK_SRC] = &cam_cc_ife_lite_csid_clk_src.clkr,
+	[CAM_CC_IPE_0_AHB_CLK] = &cam_cc_ipe_0_ahb_clk.clkr,
+	[CAM_CC_IPE_0_AREG_CLK] = &cam_cc_ipe_0_areg_clk.clkr,
+	[CAM_CC_IPE_0_AXI_CLK] = &cam_cc_ipe_0_axi_clk.clkr,
+	[CAM_CC_IPE_0_CLK] = &cam_cc_ipe_0_clk.clkr,
+	[CAM_CC_IPE_0_CLK_SRC] = &cam_cc_ipe_0_clk_src.clkr,
+	[CAM_CC_JPEG_CLK] = &cam_cc_jpeg_clk.clkr,
+	[CAM_CC_JPEG_CLK_SRC] = &cam_cc_jpeg_clk_src.clkr,
+	[CAM_CC_LRME_CLK] = &cam_cc_lrme_clk.clkr,
+	[CAM_CC_LRME_CLK_SRC] = &cam_cc_lrme_clk_src.clkr,
+	[CAM_CC_MCLK0_CLK] = &cam_cc_mclk0_clk.clkr,
+	[CAM_CC_MCLK0_CLK_SRC] = &cam_cc_mclk0_clk_src.clkr,
+	[CAM_CC_MCLK1_CLK] = &cam_cc_mclk1_clk.clkr,
+	[CAM_CC_MCLK1_CLK_SRC] = &cam_cc_mclk1_clk_src.clkr,
+	[CAM_CC_MCLK2_CLK] = &cam_cc_mclk2_clk.clkr,
+	[CAM_CC_MCLK2_CLK_SRC] = &cam_cc_mclk2_clk_src.clkr,
+	[CAM_CC_MCLK3_CLK] = &cam_cc_mclk3_clk.clkr,
+	[CAM_CC_MCLK3_CLK_SRC] = &cam_cc_mclk3_clk_src.clkr,
+	[CAM_CC_PLL0] = &cam_cc_pll0.clkr,
+	[CAM_CC_PLL1] = &cam_cc_pll1.clkr,
+	[CAM_CC_PLL2] = &cam_cc_pll2.clkr,
+	[CAM_CC_PLL2_OUT_AUX2] = &cam_cc_pll2_out_aux2.clkr,
+	[CAM_CC_PLL3] = &cam_cc_pll3.clkr,
+	[CAM_CC_SLOW_AHB_CLK_SRC] = &cam_cc_slow_ahb_clk_src.clkr,
+	[CAM_CC_SOC_AHB_CLK] = &cam_cc_soc_ahb_clk.clkr,
+	[CAM_CC_SYS_TMR_CLK] = &cam_cc_sys_tmr_clk.clkr,
+};
+
+static struct gdsc *cam_cc_qcs615_gdscs[] = {
+	[BPS_GDSC] = &bps_gdsc,
+	[IFE_0_GDSC] = &ife_0_gdsc,
+	[IFE_1_GDSC] = &ife_1_gdsc,
+	[IPE_0_GDSC] = &ipe_0_gdsc,
+	[TITAN_TOP_GDSC] = &titan_top_gdsc,
+};
+
+static const struct qcom_reset_map cam_cc_qcs615_resets[] = {
+	[CAM_CC_BPS_BCR] = { 0x6000 },
+	[CAM_CC_CAMNOC_BCR] = { 0xb120 },
+	[CAM_CC_CCI_BCR] = { 0xb0d4 },
+	[CAM_CC_CPAS_BCR] = { 0xb118 },
+	[CAM_CC_CSI0PHY_BCR] = { 0x5000 },
+	[CAM_CC_CSI1PHY_BCR] = { 0x5024 },
+	[CAM_CC_CSI2PHY_BCR] = { 0x5048 },
+	[CAM_CC_ICP_BCR] = { 0xb074 },
+	[CAM_CC_IFE_0_BCR] = { 0x9000 },
+	[CAM_CC_IFE_1_BCR] = { 0xa000 },
+	[CAM_CC_IFE_LITE_BCR] = { 0xb000 },
+	[CAM_CC_IPE_0_BCR] = { 0x7000 },
+	[CAM_CC_JPEG_BCR] = { 0xb048 },
+	[CAM_CC_LRME_BCR] = { 0xb0f4 },
+	[CAM_CC_MCLK0_BCR] = { 0x4000 },
+	[CAM_CC_MCLK1_BCR] = { 0x4020 },
+	[CAM_CC_MCLK2_BCR] = { 0x4040 },
+	[CAM_CC_MCLK3_BCR] = { 0x4060 },
+	[CAM_CC_TITAN_TOP_BCR] = { 0xb130 },
+};
+
+static struct clk_alpha_pll *cam_cc_qcs615_plls[] = {
+	&cam_cc_pll0,
+	&cam_cc_pll1,
+	&cam_cc_pll2,
+	&cam_cc_pll3,
+};
+
+static const struct regmap_config cam_cc_qcs615_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xd004,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data cam_cc_qcs615_driver_data = {
+	.alpha_plls = cam_cc_qcs615_plls,
+	.num_alpha_plls = ARRAY_SIZE(cam_cc_qcs615_plls),
+};
+
+static const struct qcom_cc_desc cam_cc_qcs615_desc = {
+	.config = &cam_cc_qcs615_regmap_config,
+	.clks = cam_cc_qcs615_clocks,
+	.num_clks = ARRAY_SIZE(cam_cc_qcs615_clocks),
+	.resets = cam_cc_qcs615_resets,
+	.num_resets = ARRAY_SIZE(cam_cc_qcs615_resets),
+	.gdscs = cam_cc_qcs615_gdscs,
+	.num_gdscs = ARRAY_SIZE(cam_cc_qcs615_gdscs),
+	.driver_data = &cam_cc_qcs615_driver_data,
+};
+
+static const struct of_device_id cam_cc_qcs615_match_table[] = {
+	{ .compatible = "qcom,qcs615-camcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cam_cc_qcs615_match_table);
+
+static int cam_cc_qcs615_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &cam_cc_qcs615_desc);
+}
+
+static struct platform_driver cam_cc_qcs615_driver = {
+	.probe = cam_cc_qcs615_probe,
+	.driver = {
+		.name = "camcc-qcs615",
+		.of_match_table = cam_cc_qcs615_match_table,
+	},
+};
+
+module_platform_driver(cam_cc_qcs615_driver);
+
+MODULE_DESCRIPTION("QTI CAMCC QCS615 Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


