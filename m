Return-Path: <linux-arm-msm+bounces-29631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6919F960AD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 14:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 208F1283E29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 12:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28A11BD4F9;
	Tue, 27 Aug 2024 12:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D1abqEHH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2096C1BBBE9;
	Tue, 27 Aug 2024 12:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724762798; cv=none; b=qdWF8zpxeqWDxV6Oc9gmT52R0MaPzbqTl3jFri+PEQ7vbCKczDTlCa9Wu+iKEydHVfGf6PnsUSIgNfSNLNG3TKNMb+SUWT1G/eiadlztslq7fMNfK1wniN+aiAAvTnU14LWpCr6OwlbASyKTVQFv5xptuMbZ0zuJIdJLIVcFRKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724762798; c=relaxed/simple;
	bh=9qEQheOzzx9tEpwiPn5AIgkTV1RRFnm+sjrJNZnPk/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CQAny/VBUhxNlkdRuTCeFOcWhkALSgpXNrJ/XWV1oedec+HZ+/jWuhr+le0wLK2Js95iea71T4wTIIiBCfCnqLcJE+k5WcMKklXNCfoFXZqIywNDhoDkiBcc5hkmuK2KI2U7sGvjaJht8u2ob6swrJInf3QU4vFgl95PtaHCS88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D1abqEHH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R9bu2a027166;
	Tue, 27 Aug 2024 12:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qohnA1Rj0PnszOe5NetdDKvF7CrHrIn45A/f3kXOxA0=; b=D1abqEHHzgLGRw0z
	EbfAy4kH1Z2CuF6rbbhDm4NRHgjSNX/irCcSjemPQNaHFSz7xP3Ssh1QpChDhGoX
	O7itoulzYLhM3wc1xAFqlORA5OSBSH5DZAFEx5xoHOyPeOz+FSk62IhEcRS/iHzV
	Xw/UXI8DoG/aRVEQQ37EamcHTzUE+ALFtYR2n5dfkRtz6d8Div2nCgeK4gBtfAQP
	kk60yoI4hgFseyt2ajmB3P+2kbZskyd95vlcHP8PNRo6aTeZ26Ugsbiix+IXmDI+
	3Xramx5bvQWwEza5eclDpd+GbtwI7m84qQZhvSKN3JAVuXgxdSnJqSQLD1MJPisP
	g7j+0A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419cbc8ggc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 12:46:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47RCkQn0019914
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 12:46:26 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 Aug 2024 05:46:20 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 27 Aug 2024 20:46:00 +0800
Subject: [PATCH v3 2/4] clk: qcom: Add CMN PLL clock controller driver for
 IPQ SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240827-qcom_ipq_cmnpll-v3-2-8e009cece8b2@quicinc.com>
References: <20240827-qcom_ipq_cmnpll-v3-0-8e009cece8b2@quicinc.com>
In-Reply-To: <20240827-qcom_ipq_cmnpll-v3-0-8e009cece8b2@quicinc.com>
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
	<will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <srinivas.kandagatla@linaro.org>,
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724762769; l=9746;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=9qEQheOzzx9tEpwiPn5AIgkTV1RRFnm+sjrJNZnPk/o=;
 b=EVF8EbSYl+/Mwaov3TFIGcUOZHB1Zzuwf3MLfRFCO5HaLTwKRASbDuuLF1kFNNsVI+coSCPfZ
 N4WSqKwf9VVALB/tvMbhkPGZbWPWm4u1HsffM45IXS08AIfwZqr/E+5
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MBu7QAzbveeFXnEFXAu1K4FnHUTyZCxW
X-Proofpoint-GUID: MBu7QAzbveeFXnEFXAu1K4FnHUTyZCxW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_06,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408270094

The CMN PLL clock controller supplies clocks to the hardware
blocks that together make up the Ethernet function on Qualcomm
IPQ SoCs. The driver is initially supported for IPQ9574 SoC.

The CMN PLL clock controller expects a reference input clock
from the on-board Wi-Fi block acting as clock source. The input
reference clock needs to be configured to one of the supported
clock rates.

The controller supplies a number of fixed-rate output clocks.
For the IPQ9574, there is one output clock of 353 MHZ to PPE
(Packet Process Engine) hardware block, three 50 MHZ output
clocks and an additional 25 MHZ output clock supplied to the
connected Ethernet devices.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/clk/qcom/Kconfig           |  10 ++
 drivers/clk/qcom/Makefile          |   1 +
 drivers/clk/qcom/clk-ipq-cmn-pll.c | 241 +++++++++++++++++++++++++++++++++++++
 3 files changed, 252 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index cf6ad908327f..05bec64bf1dd 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -190,6 +190,16 @@ config IPQ_APSS_6018
 	  Say Y if you want to support CPU frequency scaling on
 	  ipq based devices.
 
+config IPQ_CMN_PLL
+	tristate "IPQ CMN PLL Clock Controller"
+	depends on IPQ_GCC_9574
+	help
+	  Support for CMN PLL clock controller on IPQ platform. The
+	  CMN PLL feeds the reference clocks to the Ethernet devices
+	  based on IPQ SoC.
+	  Say Y or M if you want to support CMN PLL clock on the IPQ
+	  based devices.
+
 config IPQ_GCC_4019
 	tristate "IPQ4019 Global Clock Controller"
 	help
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 8a6f0dabd02f..35f656146de7 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_CLK_X1E80100_TCSRCC) += tcsrcc-x1e80100.o
 obj-$(CONFIG_CLK_QCM2290_GPUCC) += gpucc-qcm2290.o
 obj-$(CONFIG_IPQ_APSS_PLL) += apss-ipq-pll.o
 obj-$(CONFIG_IPQ_APSS_6018) += apss-ipq6018.o
+obj-$(CONFIG_IPQ_CMN_PLL) += clk-ipq-cmn-pll.o
 obj-$(CONFIG_IPQ_GCC_4019) += gcc-ipq4019.o
 obj-$(CONFIG_IPQ_GCC_5018) += gcc-ipq5018.o
 obj-$(CONFIG_IPQ_GCC_5332) += gcc-ipq5332.o
diff --git a/drivers/clk/qcom/clk-ipq-cmn-pll.c b/drivers/clk/qcom/clk-ipq-cmn-pll.c
new file mode 100644
index 000000000000..a9775c39b2f3
--- /dev/null
+++ b/drivers/clk/qcom/clk-ipq-cmn-pll.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/*
+ * CMN PLL block expects the reference clock from on-board Wi-Fi block, and
+ * supplies fixed rate clocks as output to the Ethernet hardware blocks.
+ * The Ethernet related blocks include PPE (packet process engine) and the
+ * external connected PHY (or switch) chip receiving clocks from the CMN PLL.
+ *
+ * On the IPQ9574 SoC, There are three clocks with 50 MHZ, one clock with
+ * 25 MHZ which are output from the CMN PLL to Ethernet PHY (or switch),
+ * and one clock with 353 MHZ to PPE.
+ *
+ *               +---------+
+ *               |   GCC   |
+ *               +--+---+--+
+ *           AHB CLK|   |SYS CLK
+ *                  V   V
+ *          +-------+---+------+
+ *          |                  +-------------> eth0-50mhz
+ * REF CLK  |     IPQ9574      |
+ * -------->+                  +-------------> eth1-50mhz
+ *          |  CMN PLL block   |
+ *          |                  +-------------> eth2-50mhz
+ *          |                  |
+ *          +---------+--------+-------------> eth-25mhz
+ *                    |
+ *                    V
+ *                    ppe-353mhz
+ */
+
+#include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define CMN_PLL_REFCLK_SRC_SELECTION		0x28
+#define CMN_PLL_REFCLK_SRC_DIV			GENMASK(9, 8)
+
+#define CMN_PLL_LOCKED				0x64
+#define CMN_PLL_CLKS_LOCKED			BIT(8)
+
+#define CMN_PLL_POWER_ON_AND_RESET		0x780
+#define CMN_ANA_EN_SW_RSTN			BIT(6)
+
+#define CMN_PLL_REFCLK_CONFIG			0x784
+#define CMN_PLL_REFCLK_EXTERNAL			BIT(9)
+#define CMN_PLL_REFCLK_DIV			GENMASK(8, 4)
+#define CMN_PLL_REFCLK_INDEX			GENMASK(3, 0)
+
+#define CMN_PLL_CTRL				0x78c
+#define CMN_PLL_CTRL_LOCK_DETECT_EN		BIT(15)
+
+/**
+ * struct cmn_pll_fixed_output_clk - CMN PLL output clocks information
+ * @id:	Clock specifier to be supplied
+ * @name: Clock name to be registered
+ * @rate: Clock rate
+ */
+struct cmn_pll_fixed_output_clk {
+	unsigned int id;
+	const char *name;
+	const unsigned long rate;
+};
+
+#define CLK_PLL_OUTPUT(_id, _name, _rate) {		\
+	.id = _id,					\
+	.name = _name,					\
+	.rate = _rate,					\
+}
+
+static const struct cmn_pll_fixed_output_clk ipq9574_output_clks[] = {
+	CLK_PLL_OUTPUT(PPE_353MHZ_CLK, "ppe-353mhz", 353000000UL),
+	CLK_PLL_OUTPUT(ETH0_50MHZ_CLK, "eth0-50mhz", 50000000UL),
+	CLK_PLL_OUTPUT(ETH1_50MHZ_CLK, "eth1-50mhz", 50000000UL),
+	CLK_PLL_OUTPUT(ETH2_50MHZ_CLK, "eth2-50mhz", 50000000UL),
+	CLK_PLL_OUTPUT(ETH_25MHZ_CLK, "eth-25mhz", 25000000UL),
+};
+
+static int ipq_cmn_pll_config(struct device *dev, unsigned long parent_rate)
+{
+	void __iomem *base;
+	u32 val;
+
+	base = devm_of_iomap(dev, dev->of_node, 0, NULL);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	val = readl(base + CMN_PLL_REFCLK_CONFIG);
+	val &= ~(CMN_PLL_REFCLK_EXTERNAL | CMN_PLL_REFCLK_INDEX);
+
+	/*
+	 * Configure the reference input clock selection as per the given rate.
+	 * The output clock rates are always of fixed value.
+	 */
+	switch (parent_rate) {
+	case 25000000:
+		val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 3);
+		break;
+	case 31250000:
+		val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 4);
+		break;
+	case 40000000:
+		val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 6);
+		break;
+	case 48000000:
+		val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 7);
+		break;
+	case 50000000:
+		val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 8);
+		break;
+	case 96000000:
+		val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 7);
+		val &= ~CMN_PLL_REFCLK_DIV;
+		val |= FIELD_PREP(CMN_PLL_REFCLK_DIV, 2);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	writel(val, base + CMN_PLL_REFCLK_CONFIG);
+
+	/* Update the source clock rate selection. Only 96 MHZ uses 0. */
+	val = readl(base + CMN_PLL_REFCLK_SRC_SELECTION);
+	val &= ~CMN_PLL_REFCLK_SRC_DIV;
+	if (parent_rate != 96000000)
+		val |= FIELD_PREP(CMN_PLL_REFCLK_SRC_DIV, 1);
+
+	writel(val, base + CMN_PLL_REFCLK_SRC_SELECTION);
+
+	/* Enable PLL locked detect. */
+	val = readl(base + CMN_PLL_CTRL);
+	val |= CMN_PLL_CTRL_LOCK_DETECT_EN;
+	writel(val, base + CMN_PLL_CTRL);
+
+	/*
+	 * Reset the CMN PLL block to ensure the updated configurations
+	 * take effect.
+	 */
+	val = readl(base + CMN_PLL_POWER_ON_AND_RESET);
+	val &= ~CMN_ANA_EN_SW_RSTN;
+	writel(val, base + CMN_PLL_POWER_ON_AND_RESET);
+	usleep_range(1000, 1200);
+
+	val |= CMN_ANA_EN_SW_RSTN;
+	writel(val, base + CMN_PLL_POWER_ON_AND_RESET);
+
+	/* Stability check of CMN PLL output clocks. */
+	return readl_poll_timeout(base + CMN_PLL_LOCKED, val,
+				  (val & CMN_PLL_CLKS_LOCKED),
+				  100, 100000);
+}
+
+static int ipq_cmn_pll_clk_register(struct device *dev, const char *parent)
+{
+	const struct cmn_pll_fixed_output_clk *fixed_clk;
+	struct clk_hw_onecell_data *data;
+	unsigned int num_clks;
+	struct clk_hw *hw;
+	int i;
+
+	num_clks = ARRAY_SIZE(ipq9574_output_clks);
+	fixed_clk = ipq9574_output_clks;
+
+	data = devm_kzalloc(dev, struct_size(data, hws, num_clks), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	for (i = 0; i < num_clks; i++) {
+		hw = devm_clk_hw_register_fixed_rate(dev, fixed_clk[i].name,
+						     parent, 0,
+						     fixed_clk[i].rate);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+
+		data->hws[fixed_clk[i].id] = hw;
+	}
+	data->num = num_clks;
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, data);
+}
+
+static int ipq_cmn_pll_clk_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct clk *clk;
+	int ret;
+
+	/*
+	 * To access the CMN PLL registers, the GCC AHB & SYSY clocks
+	 * for CMN PLL block need to be enabled.
+	 */
+	clk = devm_clk_get_enabled(dev, "ahb");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "Enable AHB clock failed\n");
+
+	clk = devm_clk_get_enabled(dev, "sys");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "Enable SYS clock failed\n");
+
+	clk = devm_clk_get(dev, "ref");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "Get reference clock failed\n");
+
+	/* Configure CMN PLL to apply the reference clock. */
+	ret = ipq_cmn_pll_config(dev, clk_get_rate(clk));
+	if (ret)
+		return dev_err_probe(dev, ret, "Configure CMN PLL failed\n");
+
+	return ipq_cmn_pll_clk_register(dev, __clk_get_name(clk));
+}
+
+static const struct of_device_id ipq_cmn_pll_clk_ids[] = {
+	{ .compatible = "qcom,ipq9574-cmn-pll", },
+	{ }
+};
+
+static struct platform_driver ipq_cmn_pll_clk_driver = {
+	.probe = ipq_cmn_pll_clk_probe,
+	.driver = {
+		.name = "ipq_cmn_pll",
+		.of_match_table = ipq_cmn_pll_clk_ids,
+	},
+};
+
+module_platform_driver(ipq_cmn_pll_clk_driver);
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. IPQ CMN PLL Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


