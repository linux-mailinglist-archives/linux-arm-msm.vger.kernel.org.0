Return-Path: <linux-arm-msm+bounces-54650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 739DDA9208F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 16:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F5DA5A6096
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 14:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540C0253354;
	Thu, 17 Apr 2025 14:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ieznMjOU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F53E253324
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 14:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901913; cv=none; b=Hd1Qt9t1mCOqPLbuW7ddemDOJdD0Ellyz8dBj+VSYeFHVTKRj6IdviYFtlrA3zwkHPPKsC2wJgIy8U5zU+DACrgi3E5/fQH/0gFuJz+emoYVDm1e/GtTSeigBIttp04RXRSC3hSEhW0/xpPnsRITFhVnRYmFZ6IK0ZMYKdzbhds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901913; c=relaxed/simple;
	bh=h2WszHLV5RBLnY9OzouOtqHpT7xeNxaUTENNIBLhvX4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SvOIf4c5jVicM0IBenZNFrG1WWpbiAMVVP0shV8pSEm40j7r2FiEPjgVw2oPLLcWwYBBNHVmsxiYngHnzpbtSQOx/Eqv0lUpXyR+6Y+70n3GIUq61k6rlmxF6YOS0kVtp7nUwYVYwuvQGyrk39dtTBQE0uaF7aHvegIoPW5GMkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ieznMjOU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HCldY9013364
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 14:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zCZTAZsCou4
	fi+cdg23KsgMfKYpjnEdjfGU2P+0GKKA=; b=ieznMjOUQAho0SLn34sa8GNhdgd
	NIp9wSF0qJN54de0K+JONflF1XOfQNG0KYafBS+KkbuML0YMwf2mmL+rXVaoSoVI
	3SQudImlWcHWWlVIlAxoeOcEWKrGAKaTY0Wo7nM4ZZF2zLoC+W45lh4uKpKsd/kN
	5Nf+4KB8p04882eG3fe9eQU5jh2zCbftvHG8KYzbplUC8u8IsbBFEyiLiPbPc8Jm
	GU6ocDqQ5EeDuypq9lBto3Cs18k40Z1rn+tzc2P3HqVC1yT76UeX41fwxXaLalkR
	dhdJtoggcHEuWyOwmsVAJplleI7C4G8hGH6IKD8Knk6ILSADcPwlzeSdZLQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvcm53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 14:58:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8f9057432so15793516d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 07:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901909; x=1745506709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCZTAZsCou4fi+cdg23KsgMfKYpjnEdjfGU2P+0GKKA=;
        b=BDChPBiDCX+3bIW4O7XdFY0H2ItWHBFToFn53BsXQQ702brKaSAHIewLK6bR/qkD2C
         FHhLSG2P8Yu85/wsB7FCJZLNdUq8NxB46MKy+g/QVRUpKE1WWBDzw5gkK5EaEaHGBDhu
         JRL74BeocQX/i6fUDYQJAh4ybTTbdAXoFSvweXfHukMke25ZhvEOtkRd2EZKLfjqxsxv
         uQymOZorSBaluISU7Grc1Zwr839uzN9rJIMiL4pD3qCQveOqFloYR9PSm27De65ph0A+
         pH9wH3wiKU/91SoSEQNi/TUMTbDqgAelxACJKcO7z6n+q67cy4s47vVW3n1n2yBGkbbl
         UAAA==
X-Gm-Message-State: AOJu0Yw4QLGz6+C4DFrRS2HQqvqu8jXOMZTahh/XcnqOvxTQ++wTlD8V
	Cz4NrxIQSwI+sGFcszbvi3K7W2zs1bYqF7vszXeF9He5NKeC5IHeLDmKjQIPUgEcmkC5cMWX7Q2
	F4h6/HjpKyWG1ALr0f+1SyEEANdm80kHIA1sT3lyhXeTBc4NvEz1Rb4OujUjWdmes
X-Gm-Gg: ASbGncvhKkb38+iV64zRQtaJRvXEP5fbemU9Ssg2sv+BdvkMzoMcSKGdlDTUO3HG8kB
	8d18L3Nf6O8SEo8/TpyurFZ0otlxHkmdKUfRuj76ocUBfVCxKCoaqB+ZpJOUbSg1P+4vfNCkkc9
	4UILnX30viQ1IkZDD9QNBRcXSgLkesphzEErsB0efAzfKIvTD9ul5kThlph8cbTfbm4pU0HjdY/
	7QsCE1E1qSGy6JISq0iTm8hTwOUK6GJfC0lyEBY9fNoAEwY/59/9M6W5qsqi0QqjGsg8jKYvjhu
	RYCJb54HVIcHh1iSncPY8gVqZCdA12ayQeWHV+NPxlwlje4=
X-Received: by 2002:a05:6214:19c8:b0:6e8:98a1:3694 with SMTP id 6a1803df08f44-6f2b2f22f33mr92204246d6.8.1744901908816;
        Thu, 17 Apr 2025 07:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDTgIe+u3MQpYlzzQHhCEIzqdzLLxzH2ADzL3qs8lZFc05tIajUO4R0r5nYZn8VhYDDLGwdg==
X-Received: by 2002:a05:6214:19c8:b0:6e8:98a1:3694 with SMTP id 6a1803df08f44-6f2b2f22f33mr92203826d6.8.1744901908466;
        Thu, 17 Apr 2025 07:58:28 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:15e4:d866:eb53:4185])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef48e5csm3966166b.148.2025.04.17.07.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:58:27 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 2/6] media: qcom: camss: Add CSID 340 support
Date: Thu, 17 Apr 2025 16:58:15 +0200
Message-Id: <20250417145819.626733-3-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417145819.626733-1-loic.poulain@oss.qualcomm.com>
References: <20250417145819.626733-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TRasv7KwbWx6pZpp3Q2AGd1-UdC93ylD
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=68011716 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=L3ROWYctCJYvUZd4tikA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: TRasv7KwbWx6pZpp3Q2AGd1-UdC93ylD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170112

Add support for CSID found in QCM2290, it's a simplified gen-2 version.
- There is no Test Pattern Generator (moved outside CSID)
- There is no subsampling (moved to CAMIF module)

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../platform/qcom/camss/camss-csid-340.c      | 190 ++++++++++++++++++
 .../media/platform/qcom/camss/camss-csid.h    |   1 +
 3 files changed, 192 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-340.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 719898f5d32b..3217bf40976d 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -6,6 +6,7 @@ qcom-camss-objs += \
 		camss-csid.o \
 		camss-csid-4-1.o \
 		camss-csid-4-7.o \
+		camss-csid-340.o \
 		camss-csid-680.o \
 		camss-csid-gen2.o \
 		camss-csid-780.o \
diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
new file mode 100644
index 000000000000..92726de48514
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module 340
+ *
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/completion.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+
+#include "camss.h"
+#include "camss-csid.h"
+#include "camss-csid-gen2.h"
+
+#define CSID_RST_STROBES					(0x010)
+#define		CSID_RST_SW_REGS			BIT(0)
+#define		CSID_RST_IRQ				BIT(1)
+#define CSID_RST_IFE_CLK				BIT(2)
+#define		CSID_RST_PHY_CLK			BIT(3)
+#define		CSID_RST_CSID_CLK			BIT(4)
+
+#define CSID_IRQ_STATUS						(0x070)
+#define CSID_IRQ_MASK						(0x074)
+#define		CSID_IRQ_MASK_RST_DONE			BIT(0)
+#define CSID_IRQ_CLEAR						(0x078)
+#define CSID_IRQ_CMD						(0x080)
+#define		CSID_IRQ_CMD_CLEAR			BIT(0)
+
+#define CSID_CSI2_RX_CFG0					(0x100)
+#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES_MASK	GENMASK(1, 0)
+#define		CSI2_RX_CFG0_DLX_INPUT_SEL_MASK		GENMASK(17, 4)
+#define		CSI2_RX_CFG0_PHY_NUM_SEL_MASK		GENMASK(21, 20)
+#define		CSI2_RX_CFG0_PHY_NUM_SEL_BASE_IDX	1
+#define		CSI2_RX_CFG0_PHY_TYPE_SEL		BIT(24)
+
+
+#define CSID_CSI2_RX_CFG1					(0x104)
+#define		CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN	BIT(0)
+#define		CSI2_RX_CFG1_MISR_EN			BIT(6)
+#define		CSI2_RX_CFG1_CGC_MODE			BIT(7)
+
+#define CSID_RDI_CFG0(rdi)					(0x300 + 0x100 * (rdi))
+#define		CSID_RDI_CFG0_BYTE_CNTR_EN		BIT(0)
+#define		CSID_RDI_CFG0_TIMESTAMP_EN		BIT(1)
+#define		CSID_RDI_CFG0_DECODE_FORMAT_MASK	GENMASK(15, 12)
+#define		CSID_RDI_CFG0_DECODE_FORMAT_NOP		CSID_RDI_CFG0_DECODE_FORMAT_MASK
+#define		CSID_RDI_CFG0_DT_MASK			GENMASK(21, 16)
+#define		CSID_RDI_CFG0_VC_MASK			GENMASK(23, 22)
+#define		CSID_RDI_CFG0_DTID_MASK			GENMASK(28, 27)
+#define		CSID_RDI_CFG0_ENABLE			BIT(31)
+
+#define CSID_RDI_CTRL(rdi)					(0x308 + 0x100 * (rdi))
+#define CSID_RDI_CTRL_HALT_AT_FRAME_BOUNDARY		0
+#define CSID_RDI_CTRL_RESUME_AT_FRAME_BOUNDARY		1
+
+static void __csid_configure_rx(struct csid_device *csid,
+				struct csid_phy_config *phy, int vc)
+{
+	u32 val;
+
+	val = FIELD_PREP(CSI2_RX_CFG0_NUM_ACTIVE_LANES_MASK, phy->lane_cnt - 1);
+	val |= FIELD_PREP(CSI2_RX_CFG0_DLX_INPUT_SEL_MASK, phy->lane_assign);
+	val |= FIELD_PREP(CSI2_RX_CFG0_PHY_NUM_SEL_MASK,
+			  phy->csiphy_id + CSI2_RX_CFG0_PHY_NUM_SEL_BASE_IDX);
+	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
+
+	val = CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
+	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
+}
+
+static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
+{
+	writel_relaxed(!!enable, csid->base + CSID_RDI_CTRL(rdi));
+}
+
+static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
+{
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
+	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
+								   csid->res->formats->nformats,
+								   input_format->code);
+	u8 lane_cnt = csid->phy.lane_cnt;
+	u8 dt_id;
+	u32 val;
+
+	if (!lane_cnt)
+		lane_cnt = 4;
+
+	/*
+	 * DT_ID is a two bit bitfield that is concatenated with
+	 * the four least significant bits of the five bit VC
+	 * bitfield to generate an internal CID value.
+	 *
+	 * CSID_RDI_CFG0(vc)
+	 * DT_ID : 28:27
+	 * VC    : 26:22
+	 * DT    : 21:16
+	 *
+	 * CID   : VC 3:0 << 2 | DT_ID 1:0
+	 */
+	dt_id = vc & 0x03;
+
+	val = CSID_RDI_CFG0_DECODE_FORMAT_NOP; /* only for RDI path */
+	val |= FIELD_PREP(CSID_RDI_CFG0_DT_MASK, format->data_type);
+	val |= FIELD_PREP(CSID_RDI_CFG0_VC_MASK, vc);
+	val |= FIELD_PREP(CSID_RDI_CFG0_DTID_MASK, dt_id);
+
+	if (enable)
+		val |= CSID_RDI_CFG0_ENABLE;
+
+	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x vc=%u)\n",
+		csid->id, enable ? "enable" : "disable", format->data_type, vc);
+
+	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
+}
+
+static void csid_configure_stream(struct csid_device *csid, u8 enable)
+{
+	int i;
+
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
+		if (csid->phy.en_vc & BIT(i)) {
+			__csid_configure_rdi_stream(csid, enable, i);
+			__csid_configure_rx(csid, &csid->phy, i);
+			__csid_ctrl_rdi(csid, enable, i);
+		}
+	}
+}
+
+static int csid_reset(struct csid_device *csid)
+{
+	unsigned long time;
+
+	writel_relaxed(CSID_IRQ_MASK_RST_DONE, csid->base + CSID_IRQ_MASK);
+	writel_relaxed(CSID_IRQ_MASK_RST_DONE, csid->base + CSID_IRQ_CLEAR);
+	writel_relaxed(CSID_IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
+
+	reinit_completion(&csid->reset_complete);
+
+	/* Reset with registers preserved */
+	writel(CSID_RST_IRQ | CSID_RST_IFE_CLK | CSID_RST_PHY_CLK | CSID_RST_CSID_CLK,
+	       csid->base + CSID_RST_STROBES);
+
+	time = wait_for_completion_timeout(&csid->reset_complete,
+					   msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
+	if (!time) {
+		dev_err(csid->camss->dev, "CSID%u: reset timeout\n", csid->id);
+		return -EIO;
+	}
+
+	dev_dbg(csid->camss->dev, "CSID%u: reset done\n", csid->id);
+
+	return 0;
+}
+
+static irqreturn_t csid_isr(int irq, void *dev)
+{
+	struct csid_device *csid = dev;
+	u32 val;
+
+	val = readl_relaxed(csid->base + CSID_IRQ_STATUS);
+	writel_relaxed(val, csid->base + CSID_IRQ_CLEAR);
+	writel_relaxed(CSID_IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
+
+	if (val & CSID_IRQ_MASK_RST_DONE)
+		complete(&csid->reset_complete);
+	else
+		dev_warn_ratelimited(csid->camss->dev, "Spurious CSID interrupt\n");
+
+	return IRQ_HANDLED;
+}
+
+static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
+{
+	return -EOPNOTSUPP; /* Not part of CSID */
+}
+
+static void csid_subdev_init(struct csid_device *csid) {}
+
+const struct csid_hw_ops csid_ops_340 = {
+	.configure_testgen_pattern = csid_configure_testgen_pattern,
+	.configure_stream = csid_configure_stream,
+	.hw_version = csid_hw_version,
+	.isr = csid_isr,
+	.reset = csid_reset,
+	.src_pad_code = csid_src_pad_code,
+	.subdev_init = csid_subdev_init,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 9dc826d8c8f6..3399e92658d8 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -213,6 +213,7 @@ extern const struct csid_formats csid_formats_gen2;
 
 extern const struct csid_hw_ops csid_ops_4_1;
 extern const struct csid_hw_ops csid_ops_4_7;
+extern const struct csid_hw_ops csid_ops_340;
 extern const struct csid_hw_ops csid_ops_680;
 extern const struct csid_hw_ops csid_ops_gen2;
 extern const struct csid_hw_ops csid_ops_780;
-- 
2.34.1


