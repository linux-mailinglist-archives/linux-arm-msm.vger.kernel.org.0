Return-Path: <linux-arm-msm+bounces-47092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 993ADA2BCFB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 08:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CD9F168ACF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 07:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D905723498F;
	Fri,  7 Feb 2025 07:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IBFrIZLI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6E61A2C25;
	Fri,  7 Feb 2025 07:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738914932; cv=none; b=QAkjdRDO5FAkjKHsa2dHFd8seDiq8uq2noDIoBtWA30ZfzGeBiZXlfkirDGWmMXDqPMtTfG8NH8wVOSZgGcPH6c7NNphENlQvpXhfdAfdbRt32PepQlD7Ibnk7hOA3ZwSlv4dGqjGbxQ3/k2aG21PMKCLAd72czva/yFAftaOos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738914932; c=relaxed/simple;
	bh=JlyfSKCHt5/PXX1nd90p+aLfTDbpdjw2C+pY44bnqtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CAPY5+NXEyppD3l4n8BGf7ySQLx6bY+KpXkHEND//hP8rHo2HZdt1J+Z1OkYTmjJX3TGws8fYeP0eBlTo93rQKYiVc+o4Qn6yi+sYK89VCicqkh0KbvDWYu8KpAzwVMQhm3bPb2fpDMii3pCG5tW3uBYW0nq1uVo8DoVhnqjaxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IBFrIZLI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5174KZNK007609;
	Fri, 7 Feb 2025 07:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	95JojeoAzPdU80RvZUdsoAiyXeGQ6fg99KwJ+CbQYls=; b=IBFrIZLIecDIR/lv
	DgJZargGQSANMgOXzyl/uW05sLgPdzrLVzc7ikcD4ludIZ8cK64JoIpH26AxOS7j
	nx2QxFRoKTEvqGo9AXrb2EAjGAv3xIpeMeHtf7ILigrIWPfN02zDXEz9Pely6F5T
	NLLNAsqB86qa5O1a+LIEYpA2vM3HINanmNYcVKocB06G8sm8vIbSS+7NMizAo7Qi
	R1KPJSW5Ltzxa5D/N7AYQGwQb5Mp8HxlGOyJc+yFkkPmE82V/RXN+ILC2xcbtgnD
	IDL9ckkHJwwINsT6qrMA0ij4mVdn1+jY8Jh1oDQdVEM19e5a/qLYldw8/PFFEwbz
	mdymvg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nb2m8ftt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 07:55:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5177tD7X007995
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 07:55:13 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 23:55:07 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 7 Feb 2025 13:24:42 +0530
Subject: [PATCH v10 02/28] media: iris: add platform driver for iris video
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250207-qcom-video-iris-v10-2-ab66eeffbd20@quicinc.com>
References: <20250207-qcom-video-iris-v10-0-ab66eeffbd20@quicinc.com>
In-Reply-To: <20250207-qcom-video-iris-v10-0-ab66eeffbd20@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>,
        "Stefan
 Schmidt" <stefan.schmidt@linaro.org>,
        Joel Stanley <joel@jms.id.au>, "Johan
 Hovold" <johan@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738914892; l=13400;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=JlyfSKCHt5/PXX1nd90p+aLfTDbpdjw2C+pY44bnqtk=;
 b=m4Q438mtKyseK8gHaAVXDi3moEPKudI+NLlTEnMZ4D3msTv40DC90EIkWqbCJm2+WxFo0Yl4F
 uqAzhu44kV5B1p3VffgCuec2E02DhRF3oSQ8kTNaWHm8Ok8M2pbvwSU
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lxkAFk98jAbY5ouYxAmiRzgWHO6YszlV
X-Proofpoint-ORIG-GUID: lxkAFk98jAbY5ouYxAmiRzgWHO6YszlV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_03,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502070060

In preparation for adding H264 decode functionality, add the probe and
remove functions and platform data to initialize iris resources, which
are clocks, interconnects, power domains, reset clocks, and clock
frequencies used for the iris hardware.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org> # x1e80100 (Dell XPS 13 9345)
Reviewed-by: Stefan Schmidt <stefan.schmidt@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/Kconfig                |   1 +
 drivers/media/platform/qcom/Makefile               |   1 +
 drivers/media/platform/qcom/iris/Kconfig           |   9 +
 drivers/media/platform/qcom/iris/Makefile          |   4 +
 drivers/media/platform/qcom/iris/iris_core.h       |  54 +++++
 .../platform/qcom/iris/iris_platform_common.h      |  35 +++
 .../platform/qcom/iris/iris_platform_sm8550.c      |  37 ++++
 drivers/media/platform/qcom/iris/iris_probe.c      | 237 +++++++++++++++++++++
 8 files changed, 378 insertions(+)

diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
index cc5799b9ea00..4f4d3a68e6e5 100644
--- a/drivers/media/platform/qcom/Kconfig
+++ b/drivers/media/platform/qcom/Kconfig
@@ -3,4 +3,5 @@
 comment "Qualcomm media platform drivers"
 
 source "drivers/media/platform/qcom/camss/Kconfig"
+source "drivers/media/platform/qcom/iris/Kconfig"
 source "drivers/media/platform/qcom/venus/Kconfig"
diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
index 4f055c396e04..ea2221a202c0 100644
--- a/drivers/media/platform/qcom/Makefile
+++ b/drivers/media/platform/qcom/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += camss/
+obj-y += iris/
 obj-y += venus/
diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
new file mode 100644
index 000000000000..34a2f81c5db3
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -0,0 +1,9 @@
+config VIDEO_QCOM_IRIS
+        tristate "Qualcomm iris V4L2 decoder driver"
+        depends on VIDEO_DEV
+        depends on ARCH_QCOM || COMPILE_TEST
+        help
+          This is a V4L2 driver for Qualcomm iris video accelerator
+          hardware. It accelerates decoding operations on various
+          Qualcomm SoCs.
+          To compile this driver as a module choose m here.
diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
new file mode 100644
index 000000000000..7e701361492e
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -0,0 +1,4 @@
+iris-objs += iris_platform_sm8550.o \
+             iris_probe.o \
+
+obj-$(CONFIG_VIDEO_QCOM_IRIS) += iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
new file mode 100644
index 000000000000..27bc2ca71e1b
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_CORE_H__
+#define __IRIS_CORE_H__
+
+#include <linux/types.h>
+#include <media/v4l2-device.h>
+
+#include "iris_platform_common.h"
+
+struct icc_info {
+	const char		*name;
+	u32			bw_min_kbps;
+	u32			bw_max_kbps;
+};
+
+/**
+ * struct iris_core - holds core parameters valid for all instances
+ *
+ * @dev: reference to device structure
+ * @reg_base: IO memory base address
+ * @irq: iris irq
+ * @v4l2_dev: a holder for v4l2 device structure
+ * @vdev_dec: iris video device structure for decoder
+ * @icc_tbl: table of iris interconnects
+ * @icc_count: count of iris interconnects
+ * @pmdomain_tbl: table of iris power domains
+ * @opp_pmdomain_tbl: table of opp power domains
+ * @clock_tbl: table of iris clocks
+ * @clk_count: count of iris clocks
+ * @resets: table of iris reset clocks
+ * @iris_platform_data: a structure for platform data
+ */
+
+struct iris_core {
+	struct device				*dev;
+	void __iomem				*reg_base;
+	int					irq;
+	struct v4l2_device			v4l2_dev;
+	struct video_device			*vdev_dec;
+	struct icc_bulk_data			*icc_tbl;
+	u32					icc_count;
+	struct dev_pm_domain_list		*pmdomain_tbl;
+	struct dev_pm_domain_list		*opp_pmdomain_tbl;
+	struct clk_bulk_data			*clock_tbl;
+	u32					clk_count;
+	struct reset_control_bulk_data		*resets;
+	const struct iris_platform_data		*iris_platform_data;
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
new file mode 100644
index 000000000000..31c53dad8136
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_PLATFORM_COMMON_H__
+#define __IRIS_PLATFORM_COMMON_H__
+
+extern struct iris_platform_data sm8550_data;
+
+enum platform_clk_type {
+	IRIS_AXI_CLK,
+	IRIS_CTRL_CLK,
+	IRIS_HW_CLK,
+};
+
+struct platform_clk_data {
+	enum platform_clk_type clk_type;
+	const char *clk_name;
+};
+
+struct iris_platform_data {
+	const struct icc_info *icc_tbl;
+	unsigned int icc_tbl_size;
+	const char * const *pmdomain_tbl;
+	unsigned int pmdomain_tbl_size;
+	const char * const *opp_pd_tbl;
+	unsigned int opp_pd_tbl_size;
+	const struct platform_clk_data *clk_tbl;
+	unsigned int clk_tbl_size;
+	const char * const *clk_rst_tbl;
+	unsigned int clk_rst_tbl_size;
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
new file mode 100644
index 000000000000..3dd91523d783
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_platform_common.h"
+
+static const struct icc_info sm8550_icc_table[] = {
+	{ "cpu-cfg",    1000, 1000     },
+	{ "video-mem",  1000, 15000000 },
+};
+
+static const char * const sm8550_clk_reset_table[] = { "bus" };
+
+static const char * const sm8550_pmdomain_table[] = { "venus", "vcodec0" };
+
+static const char * const sm8550_opp_pd_table[] = { "mxc", "mmcx" };
+
+static const struct platform_clk_data sm8550_clk_table[] = {
+	{IRIS_AXI_CLK,  "iface"        },
+	{IRIS_CTRL_CLK, "core"         },
+	{IRIS_HW_CLK,   "vcodec0_core" },
+};
+
+struct iris_platform_data sm8550_data = {
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = sm8550_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
+	.pmdomain_tbl = sm8550_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.opp_pd_tbl = sm8550_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
+	.clk_tbl = sm8550_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
new file mode 100644
index 000000000000..911e3bc1b434
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -0,0 +1,237 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/clk.h>
+#include <linux/interconnect.h>
+#include <linux/module.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
+#include <linux/reset.h>
+
+#include "iris_core.h"
+
+static int iris_init_icc(struct iris_core *core)
+{
+	const struct icc_info *icc_tbl;
+	u32 i = 0;
+
+	icc_tbl = core->iris_platform_data->icc_tbl;
+
+	core->icc_count = core->iris_platform_data->icc_tbl_size;
+	core->icc_tbl = devm_kzalloc(core->dev,
+				     sizeof(struct icc_bulk_data) * core->icc_count,
+				     GFP_KERNEL);
+	if (!core->icc_tbl)
+		return -ENOMEM;
+
+	for (i = 0; i < core->icc_count; i++) {
+		core->icc_tbl[i].name = icc_tbl[i].name;
+		core->icc_tbl[i].avg_bw = icc_tbl[i].bw_min_kbps;
+		core->icc_tbl[i].peak_bw = 0;
+	}
+
+	return devm_of_icc_bulk_get(core->dev, core->icc_count, core->icc_tbl);
+}
+
+static int iris_init_power_domains(struct iris_core *core)
+{
+	const struct platform_clk_data *clk_tbl;
+	u32 clk_cnt, i;
+	int ret;
+
+	struct dev_pm_domain_attach_data iris_pd_data = {
+		.pd_names = core->iris_platform_data->pmdomain_tbl,
+		.num_pd_names = core->iris_platform_data->pmdomain_tbl_size,
+		.pd_flags = PD_FLAG_NO_DEV_LINK,
+	};
+
+	struct dev_pm_domain_attach_data iris_opp_pd_data = {
+		.pd_names = core->iris_platform_data->opp_pd_tbl,
+		.num_pd_names = core->iris_platform_data->opp_pd_tbl_size,
+		.pd_flags = PD_FLAG_DEV_LINK_ON,
+	};
+
+	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &core->pmdomain_tbl);
+	if (ret < 0)
+		return ret;
+
+	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
+	if (ret < 0)
+		return ret;
+
+	clk_tbl = core->iris_platform_data->clk_tbl;
+	clk_cnt = core->iris_platform_data->clk_tbl_size;
+
+	for (i = 0; i < clk_cnt; i++) {
+		if (clk_tbl[i].clk_type == IRIS_HW_CLK) {
+			ret = devm_pm_opp_set_clkname(core->dev, clk_tbl[i].clk_name);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return devm_pm_opp_of_add_table(core->dev);
+}
+
+static int iris_init_clocks(struct iris_core *core)
+{
+	int ret;
+
+	ret = devm_clk_bulk_get_all(core->dev, &core->clock_tbl);
+	if (ret < 0)
+		return ret;
+
+	core->clk_count = ret;
+
+	return 0;
+}
+
+static int iris_init_resets(struct iris_core *core)
+{
+	const char * const *rst_tbl;
+	u32 rst_tbl_size;
+	u32 i = 0;
+
+	rst_tbl = core->iris_platform_data->clk_rst_tbl;
+	rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
+
+	core->resets = devm_kzalloc(core->dev,
+				    sizeof(*core->resets) * rst_tbl_size,
+				    GFP_KERNEL);
+	if (!core->resets)
+		return -ENOMEM;
+
+	for (i = 0; i < rst_tbl_size; i++)
+		core->resets[i].id = rst_tbl[i];
+
+	return devm_reset_control_bulk_get_exclusive(core->dev, rst_tbl_size, core->resets);
+}
+
+static int iris_init_resources(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_init_icc(core);
+	if (ret)
+		return ret;
+
+	ret = iris_init_power_domains(core);
+	if (ret)
+		return ret;
+
+	ret = iris_init_clocks(core);
+	if (ret)
+		return ret;
+
+	return iris_init_resets(core);
+}
+
+static int iris_register_video_device(struct iris_core *core)
+{
+	struct video_device *vdev;
+	int ret;
+
+	vdev = video_device_alloc();
+	if (!vdev)
+		return -ENOMEM;
+
+	strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
+	vdev->release = video_device_release;
+	vdev->vfl_dir = VFL_DIR_M2M;
+	vdev->v4l2_dev = &core->v4l2_dev;
+	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret)
+		goto err_vdev_release;
+
+	core->vdev_dec = vdev;
+	video_set_drvdata(vdev, core);
+
+	return 0;
+
+err_vdev_release:
+	video_device_release(vdev);
+
+	return ret;
+}
+
+static void iris_remove(struct platform_device *pdev)
+{
+	struct iris_core *core;
+
+	core = platform_get_drvdata(pdev);
+	if (!core)
+		return;
+
+	video_unregister_device(core->vdev_dec);
+
+	v4l2_device_unregister(&core->v4l2_dev);
+}
+
+static int iris_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct iris_core *core;
+	int ret;
+
+	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
+	if (!core)
+		return -ENOMEM;
+	core->dev = dev;
+
+	core->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(core->reg_base))
+		return PTR_ERR(core->reg_base);
+
+	core->irq = platform_get_irq(pdev, 0);
+	if (core->irq < 0)
+		return core->irq;
+
+	core->iris_platform_data = of_device_get_match_data(core->dev);
+
+	ret = iris_init_resources(core);
+	if (ret)
+		return ret;
+
+	ret = v4l2_device_register(dev, &core->v4l2_dev);
+	if (ret)
+		return ret;
+
+	ret = iris_register_video_device(core);
+	if (ret)
+		goto err_v4l2_unreg;
+
+	platform_set_drvdata(pdev, core);
+
+	return 0;
+
+err_v4l2_unreg:
+	v4l2_device_unregister(&core->v4l2_dev);
+
+	return ret;
+}
+
+static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,sm8550-iris",
+		.data = &sm8550_data,
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, iris_dt_match);
+
+static struct platform_driver qcom_iris_driver = {
+	.probe = iris_probe,
+	.remove = iris_remove,
+	.driver = {
+		.name = "qcom-iris",
+		.of_match_table = iris_dt_match,
+	},
+};
+
+module_platform_driver(qcom_iris_driver);
+MODULE_DESCRIPTION("Qualcomm iris video driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


