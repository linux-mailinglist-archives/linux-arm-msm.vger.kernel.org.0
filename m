Return-Path: <linux-arm-msm+bounces-37510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6F49C4AFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 01:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D2A0B26FD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 00:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903501F756E;
	Tue, 12 Nov 2024 00:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z5Iv+qGV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A9F1F668B;
	Tue, 12 Nov 2024 00:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731371308; cv=none; b=TYS3m+ODQ0/GYI44BCMA7W5qeVO/Z6gUshTnfHjV1hQ6RgatvK3JI5BKyMqQ6+hxn1uxgWnvOTMCSNdlwo2/yNuPCTBUZqy95xNFALzkRzxwshYyHSJvz3tReCTLlUSnPPpZNxoC/bcnWAFd03bU55vXPYDek/CkaggiOVmP7ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731371308; c=relaxed/simple;
	bh=1CEOpUPf8Yuju0/bgR8y/7D/Cj2SW59gog/DE70G9oY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nJQTtQuN3Y9WMJCjui84YR2OtqqhnIf13P1z6OJI0NGOcqkg9iKAqm51djLQZxJo5hI+uJXVOqwlmzVRO025jHCHD3ECWm6cRmX4S5SuTAQiM2EWPlCnzbLOXi24j290i9KThykxPIWXLpDsPsemr+zzdjAHqMAXqORyOeniCM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z5Iv+qGV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABBdEcV013563;
	Tue, 12 Nov 2024 00:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nBERN0xz3ndtQRjUzq5O4NZZ0O26GaRW5cyFK7AYP2k=; b=Z5Iv+qGVMPbiGGqU
	zsG6yfSSopSFfp29TU/8qk8Rw8h+6Qig106sweQPY3u1W7ukdFpuKjfAhkm8QD22
	hUD61PbcZIR1wINpkTMGwwfBXRcscjcjqBjIMzL9r25HdayTcsVLRo1PZExp6hWX
	91bxE9uTHiNHprsM/CWNNN6R1ZnL66qyNwRKwPl8SNvX6RLHXXgS9uoaGuiQN6iR
	066m/8o9IvYIEJW1Aymnt8cNlf1/dycomgRdjYuferRTXGawI3iLaoPS+b4199nC
	6E5vNw1pDQvCrY8JaC84WA0w/+oHxhW/k3WygoBbl04vw3dz3sp8+6bh/dcm+MxK
	mWBP+w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42syax5nu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:28:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC0SK4S004033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:28:20 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 11 Nov 2024 16:28:20 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
Subject: [PATCH v2 7/7] clk: qcom: Add TCSR clock driver for SM8750
Date: Mon, 11 Nov 2024 16:28:07 -0800
Message-ID: <20241112002807.2804021-8-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241112002807.2804021-1-quic_molvera@quicinc.com>
References: <20241112002807.2804021-1-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 09o1oYAWWzHsVSSDGd04hcakI-YXSTef
X-Proofpoint-GUID: 09o1oYAWWzHsVSSDGd04hcakI-YXSTef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 mlxlogscore=769
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120002

From: Taniya Das <quic_tdas@quicinc.com>

The TCSR clock controller found on SM8750 provides refclks
for PCIE, USB and UFS. Add clock driver for it.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 drivers/clk/qcom/Kconfig         |   8 ++
 drivers/clk/qcom/Makefile        |   1 +
 drivers/clk/qcom/tcsrcc-sm8750.c | 147 +++++++++++++++++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 drivers/clk/qcom/tcsrcc-sm8750.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 26bfb607235b..2ec9be21ff67 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1255,6 +1255,14 @@ config SM_TCSRCC_8650
 	  Support for the TCSR clock controller on SM8650 devices.
 	  Say Y if you want to use peripheral devices such as SD/UFS.
 
+config SM_TCSRCC_8750
+	tristate "SM8750 TCSR Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
+	help
+	  Support for the TCSR clock controller on SM8750 devices.
+	  Say Y if you want to use peripheral devices such as UFS/USB/PCIe.
+
 config SA_VIDEOCC_8775P
 	tristate "SA8775P Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 1875018d1100..28e45316627a 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -157,6 +157,7 @@ obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
 obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
 obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
 obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
+obj-$(CONFIG_SM_TCSRCC_8750) += tcsrcc-sm8750.o
 obj-$(CONFIG_SM_VIDEOCC_7150) += videocc-sm7150.o
 obj-$(CONFIG_SM_VIDEOCC_8150) += videocc-sm8150.o
 obj-$(CONFIG_SM_VIDEOCC_8250) += videocc-sm8250.o
diff --git a/drivers/clk/qcom/tcsrcc-sm8750.c b/drivers/clk/qcom/tcsrcc-sm8750.c
new file mode 100644
index 000000000000..23417b22e6c9
--- /dev/null
+++ b/drivers/clk/qcom/tcsrcc-sm8750.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,sm8750-tcsr.h>
+
+#include "clk-branch.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+
+enum {
+	DT_BI_TCXO_PAD,
+};
+
+static struct clk_branch tcsr_pcie_0_clkref_en = {
+	.halt_reg = 0x0,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_0_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_ufs_clkref_en = {
+	.halt_reg = 0x1000,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_ufs_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_clkref_en = {
+	.halt_reg = 0x2000,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x2000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb3_clkref_en = {
+	.halt_reg = 0x3000,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x3000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb3_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *tcsr_cc_sm8750_clocks[] = {
+	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
+	[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
+	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
+	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
+};
+
+static const struct regmap_config tcsr_cc_sm8750_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x3000,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc tcsr_cc_sm8750_desc = {
+	.config = &tcsr_cc_sm8750_regmap_config,
+	.clks = tcsr_cc_sm8750_clocks,
+	.num_clks = ARRAY_SIZE(tcsr_cc_sm8750_clocks),
+};
+
+static const struct of_device_id tcsr_cc_sm8750_match_table[] = {
+	{ .compatible = "qcom,sm8750-tcsr" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tcsr_cc_sm8750_match_table);
+
+static int tcsr_cc_sm8750_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+
+	regmap = qcom_cc_map(pdev, &tcsr_cc_sm8750_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return qcom_cc_really_probe(&pdev->dev, &tcsr_cc_sm8750_desc, regmap);
+}
+
+static struct platform_driver tcsr_cc_sm8750_driver = {
+	.probe = tcsr_cc_sm8750_probe,
+	.driver = {
+		.name = "tcsr_cc-sm8750",
+		.of_match_table = tcsr_cc_sm8750_match_table,
+	},
+};
+
+static int __init tcsr_cc_sm8750_init(void)
+{
+	return platform_driver_register(&tcsr_cc_sm8750_driver);
+}
+subsys_initcall(tcsr_cc_sm8750_init);
+
+static void __exit tcsr_cc_sm8750_exit(void)
+{
+	platform_driver_unregister(&tcsr_cc_sm8750_driver);
+}
+module_exit(tcsr_cc_sm8750_exit);
+
+MODULE_DESCRIPTION("QTI TCSR_CC SM8750 Driver");
+MODULE_LICENSE("GPL");
-- 
2.46.1


