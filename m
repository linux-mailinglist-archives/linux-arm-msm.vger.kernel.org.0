Return-Path: <linux-arm-msm+bounces-78670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4DBC04568
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 06:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BBCA84EDC23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 04:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACB1299ABF;
	Fri, 24 Oct 2025 04:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WOlGZtBu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26DA288522
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 04:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761279894; cv=none; b=f6H5XHqKDxtrOOT01LRs/HZoAEK7vC2XBo4QRaIltqm3XXfDctwAQwjN7GOkFvC4FiX0ij9PIbbxLHZKG5OgkRWdhGzruKYLj3Hkt1/0kD/7wpMehAmpRMkkE77QwZFgWKZ5XKiuKQTtJnVGfZ0+9EylcAyUZ1oCnpqpGu1Th7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761279894; c=relaxed/simple;
	bh=doF1pknaF58DkGosXyuBirSL0CBRLUuwkcBHSyJxR9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZVBx8rc71EYnFuOfR+kzbjMj9lxHwsdjH0Vtq2JZX0H2EbpheDCdn8YP34uI3mRypCcu0k8Zq9ByNqHK+9qaoHRfshNC99tbb4LpGZ6RE4jpGWigyPnhycdejfws0DMdbhwHTQJFVbkpP0xRqtfU1M1wkiZmTeaqj8nTg11rtno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WOlGZtBu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FGTT015798
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 04:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uubp6kE3mraJFiE/CLWQKxRoopMwINjSLhIwpAl2BPI=; b=WOlGZtBuLpwjuUeW
	uZtahvxpcAiTUYJz98TNx/01AbbGdoS6A+yqYQW1h/APQtBwwQLp8Zqflyq7z84Q
	JtSOyMrNWxOHZsIkC46LGwXu5BHWOsGHq82DXRJUHsOz8DPcZOGmFaA9ETrEvihn
	Ij4H9qBe7Z0mNoIz5EpkGbORRec4zeh5CD/3iHVCiqPm2yZaN1wwMz6RAso/bz8V
	AJB+7SCmaoAVw/jRQq3kW585irx78cGGFxLSH/ieTUn7T0hfA2K0r0SJXkI2f1Vs
	D02enUyEBxphsqATUQQmw9NUZdpxmwminP1e6yWw+xg17LFePUKeq4QCdeFua/yD
	w4iGPg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsgbxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 04:24:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2697410e7f9so37593045ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 21:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761279891; x=1761884691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uubp6kE3mraJFiE/CLWQKxRoopMwINjSLhIwpAl2BPI=;
        b=ixDScEDGkkcK875dLdkoMbJaVcsaCpONuBnFPtu+VaFVCIZzw+/cj2B7HIkLnepHqq
         HNBmysqDydBVy6PAX9Mb757w4VaMR6/g3lyNMC4fkNfBBcUGtuuR5NULs0MIfpfjQnik
         ow7Qv7yJdIqd1PJDGGRb4mc8zPdoMfNPXcAvgm28zQdUpvqZvt2GOV4GHdg5Hb5fjXBF
         FehTO5PrtSw6IKLsyBgRaddZTrMqSInYK4o7D4EENjSbvNUTKFIzwTeA85IGMYjiSvF8
         FQ4sW/Jzgmqv46FRXS0P7pjxxaxG1ZxB/6RYz3olBcmmsQv5jmSko5LyRIzZ9FljmVgZ
         hEug==
X-Gm-Message-State: AOJu0YzUcsGq1ZiQodJ/kMW6wJse1Y6kDDJil84GT9HHq5ggIMf1WOPw
	Hh+V+U/dLeylvI+4X9vNX5CYqHaypdSqdJQHjmm1/oO5OvH28vppdJfFN4MX8pmThfyAJ/M2cer
	k6euv+2uAXmnmddzfGNMaXCd+PV+A6Pcxvg5PousG4uRIgTokFd4VNBqXSnfCz5RaSlPNGXKUmA
	ci
X-Gm-Gg: ASbGncuV0uPb9w2CMHgia2wc+HNAWzRrah2fmxH5YQS9Lg55e/YXhEMH2Q7BxZ2kk41
	Zz8ATf2HW1irpAKwKX7t0QOVUxltM5u/P7UHJq4juMR7Unp4TPWizqhe8B4Ez9EVyRB7VFbWeZM
	g2t0J7DaT/QiVr0NmVOtzThUCAvvXo32I9wwaX58+6+jBOiR/SRCDHepqYX6dJmr65tH6Crb4Mv
	RVS52JJXjd1iDjcHpNn537FZbU/eJnfKfMeWj+iNoP9oxolsjuW27fheJdHyXX50t8gClzlq3sa
	ByVUS1CGkUBAHhnWLkJfGcv8Dzw4OqVQtiN0XRoeL/8KzU+AqmLY2sL6cH3qstaEQgiBES1YTUg
	AchLcvKXTpXw4KT5H6p7SryM=
X-Received: by 2002:a17:903:1a4c:b0:27e:ed58:25e5 with SMTP id d9443c01a7336-290c9ce5b85mr292023325ad.24.1761279890576;
        Thu, 23 Oct 2025 21:24:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZrh1YulTzTyKI1JBcfiP7gRxQChg9CKh4pL6a1efF81yzsVlQjeNFIi0VHflzodSSI7qpNQ==
X-Received: by 2002:a17:903:1a4c:b0:27e:ed58:25e5 with SMTP id d9443c01a7336-290c9ce5b85mr292023145ad.24.1761279890007;
        Thu, 23 Oct 2025 21:24:50 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dfd0576sm40259805ad.67.2025.10.23.21.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 21:24:49 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 09:54:25 +0530
Subject: [PATCH v3 4/4] clk: qcom: videocc-sm8750: Add video clock
 controller driver for SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-sm8750-videocc-v2-v3-4-6286bbda3c8e@oss.qualcomm.com>
References: <20251024-sm8750-videocc-v2-v3-0-6286bbda3c8e@oss.qualcomm.com>
In-Reply-To: <20251024-sm8750-videocc-v2-v3-0-6286bbda3c8e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX5c7nTQWSx18Y
 1n3gDjJJ54CSrZdiInj9InamHxiprB+imkC5+jKukV4COjvAdSj+e0GCpKRvsSmByEcxxQu0ObR
 vIodxASfuaqu+bdb4zFb+yZZsqaK4ekAojAlWDQpWZo5EUUOSOobU/rm/i3aWmvVB+Rn+OmiObm
 fT4wbJkneDZ9Xx7KUgiArHXfqGGmTalC2sgVDM8mW0tzaVdUqxr11HGpq4V4EChMAM4TiL2uxHy
 HqVXQr/KP7Hccf3yC/3CweG4Q62lGYAyWf92V3ZcbwuoASMuVjJ9dGur+fWNlXxMJwP08oLrVN+
 Pqkrr/P8V/cWkXyxnrkBJET27+Os07NW/ibcFGTv4AdiAbIsQpg/0URznX8TLaxEWmAFnz7tbV2
 tk2jghfxSt5f5h32ozBX7gf/HqCgfQ==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68faff93 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2N9sESmJbKjiMZoAsBIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: aiTPknFwVKIgaP48E2AUCr-VajHPcoBc
X-Proofpoint-ORIG-GUID: aiTPknFwVKIgaP48E2AUCr-VajHPcoBc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

Add support for the video clock controller for video clients to be able
to request for videocc clocks on SM8750 platform.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig          |  11 +
 drivers/clk/qcom/Makefile         |   1 +
 drivers/clk/qcom/videocc-sm8750.c | 463 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 475 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index aeb6197d7c902098459c9b2cba75072bd519b0f3..2c5a0c86e01f0bf2518e5b78a9f50835fac3d019 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1489,6 +1489,17 @@ config SM_VIDEOCC_8550
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
index 98de55eb64026a12d89587db295f8a6ac59ee2f7..fccb7eb5135dc4df3ccadf711f2c7b9ce0459a83 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -181,6 +181,7 @@ obj-$(CONFIG_SM_VIDEOCC_8250) += videocc-sm8250.o
 obj-$(CONFIG_SM_VIDEOCC_8350) += videocc-sm8350.o
 obj-$(CONFIG_SM_VIDEOCC_8450) += videocc-sm8450.o
 obj-$(CONFIG_SM_VIDEOCC_8550) += videocc-sm8550.o
+obj-$(CONFIG_SM_VIDEOCC_8750) += videocc-sm8750.o
 obj-$(CONFIG_SM_VIDEOCC_MILOS) += videocc-milos.o
 obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
 obj-$(CONFIG_KPSS_XCC) += kpss-xcc.o
diff --git a/drivers/clk/qcom/videocc-sm8750.c b/drivers/clk/qcom/videocc-sm8750.c
new file mode 100644
index 0000000000000000000000000000000000000000..a402c9d7082767ddf3b5496671201abbb086971b
--- /dev/null
+++ b/drivers/clk/qcom/videocc-sm8750.c
@@ -0,0 +1,463 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
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
+	.config = &video_cc_pll0_config,
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
+static struct clk_alpha_pll *video_cc_sm8750_plls[] = {
+	&video_cc_pll0,
+};
+
+static u32 video_cc_sm8750_critical_cbcrs[] = {
+	0x80a4, /* VIDEO_CC_AHB_CLK */
+	0x80f8, /* VIDEO_CC_SLEEP_CLK */
+	0x80d4, /* VIDEO_CC_XO_CLK */
+};
+
+static void clk_sm8750_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Update DLY_ACCU_RED_SHIFTER_DONE to 0xF for mvs0, mvs0c */
+	regmap_update_bits(regmap, 0x8074, GENMASK(25, 21), GENMASK(25, 21));
+	regmap_update_bits(regmap, 0x8040, GENMASK(25, 21), GENMASK(25, 21));
+
+	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));
+}
+
+static struct qcom_cc_driver_data video_cc_sm8750_driver_data = {
+	.alpha_plls = video_cc_sm8750_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_sm8750_plls),
+	.clk_cbcrs = video_cc_sm8750_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_sm8750_critical_cbcrs),
+	.clk_regs_configure = clk_sm8750_regs_configure,
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
+	.use_rpm = true,
+	.driver_data = &video_cc_sm8750_driver_data,
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
+	return qcom_cc_probe(pdev, &video_cc_sm8750_desc);
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
2.34.1


