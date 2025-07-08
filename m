Return-Path: <linux-arm-msm+bounces-63994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D4FAFC5BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58E1518840BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 08:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B754B2BE053;
	Tue,  8 Jul 2025 08:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dP40+Zb9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9994298CBE
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 08:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963555; cv=none; b=UZoaWfxZVFqtRtEzasveOCfkClCnCRhLSf3h5T5VzGIA6u2pkUT95m333XkDVvdgaZbHAb2BBk93ifgq8fPRVyi4F8/HxF/9e80UiD1FAOMNF70//ahE1Iic9lc/qA90cJipushd/TVytrvWy4BV6icDGWQvo7el8WyU/lkPmWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963555; c=relaxed/simple;
	bh=J8hJb6ZfXZfIS27ED/iy0umD/CUmgJhuLhkCD8yWVHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jqHH4vuOb076c+qyrQk8BCwqDA0S1zrRP1hRC+prAk4anDbwWB0OYcapvewKHcuzXfWNtaWmUbYbzublOX0/pb13DeLKnUIKxha8ESlP+XdkzZlXIuLLrYwl3a4bIJpDdIGzeSUE3Lz3F7rb6SyXvJ6Zbe/yedSW6LpHCogPRQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dP40+Zb9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5687atd1024236
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 08:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=261qkP0f/h5
	Tj/nGF5EXndFRIC5FkfysWzMW9JJfa+w=; b=dP40+Zb9QaRHkCkuOU4fW1+Lhw/
	GSRFHnR/ZqP52rvNCHoSSa74CUnRgFaWjTNeUAU7VTbXxZGJcJVEkLOLWI9eyaxG
	AnyqetB089Bw1Ngf2aZVijLSYUP7NtioMzUlT4jQdgoB+gtdLBVsnADYJCZrXaTz
	UJRo73oz5IrvWKNyBIXeWKD6EyFATjdAGcEzOaHutYKm99eMOcP1DzgwMXF6LJ5z
	TCcUr8o27zRMvpL+ugWhQMbqcbvwrGJGzDbv+2YGPR8sL8GDkU7eWLIZlgwpv8AH
	UXVJSW0o7b/Y7nmbnJO6Qwy27Ey2sV/NjaUnTUMXSuZPVT2ac7HzUkxBL8g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvefc3yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 08:32:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d40d2308a4so549114685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 01:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963552; x=1752568352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=261qkP0f/h5Tj/nGF5EXndFRIC5FkfysWzMW9JJfa+w=;
        b=kPctAgtw2cMNH3UseeO/TT6VQ9mXc6YkPKBi1LPwcIBwRuCWXhYVuUaVUaUeguNDw/
         t6U2hgkvmTPIY8Pc8ORpSyi268hhhHjvph6Xda5Gx/xPoYcfWVYROoYBexm2wAAgFpua
         IU4wkpao95dqs8eZ8mW5KzA09NQc1JJgbAXDy1MZly0xd3xdh75j0t/N7rD0gnr+W487
         hPn5+yLLrBKPiNvx07JeEpFraWPxnioFHrtbzFwZ0JGihkMjj4W4nfL3bYXwPgkFHSvf
         V07YgFS7kZVkJXV4+Yu1pEdWzLPKB7DRojiugnUs+4+78QgSrsB8Wcb79blj2zH0vajf
         kDfQ==
X-Gm-Message-State: AOJu0YzYUt5oJrPiX/HbRb2FDPIamjs9QXfcB1R4eEcOCN07LrnEuGXD
	Fni6CD+E5+9gvp2b+ocz49wDgNe60XH22M7ktLaClumWLy7nSgftp1zP52GEngfs3ylLt+MJtJQ
	7q7d3CogakmVVXLee64i4Lc6dJUahcT5WJcdjvMvd5gtHasqK/st+96bb1yINg5c8z0Fw
X-Gm-Gg: ASbGnctV/oQJx2SU+6BX43leyDHZMJ+1AyIcSNHqFhZZ+CEYOLEeWr/LLVyyaImrewZ
	YtvcKFTTzyNLq8xrWKbTQVemAECYMRLE5e3srWiKOxJRfG9sgkvs7F4Z3cWFCRvXWMA8gqAJ1lO
	BjzkQ/+/3e03uv49Pw7HrZw5XvOUEMIy5JNfqlA+xSwo2FefDtU6DyW2OBZua2GVL0yn+IHpYeV
	3d99ir54nd/p4kzCZD2Krr9UFVlJNhLoY9HsRA4Y0Gh/yH26A0/0M2lhAVEVTJDz7KlLTbPo6bv
	Gssmtli2BI6gBluq0mCg4XMIIoyP2TsBL6+vAXQPyhhbjx1xLcGd6NjTNg==
X-Received: by 2002:a05:620a:c4a:b0:7d4:29a5:8143 with SMTP id af79cd13be357-7da016a9a3emr357966185a.6.1751963551777;
        Tue, 08 Jul 2025 01:32:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9kcw30kxWvuGYffuDMauZaIExdoL/kbe57FpY0sCUGZ5XoEwq84PtEGPs+fmcz/zH2Z2CwQ==
X-Received: by 2002:a05:620a:c4a:b0:7d4:29a5:8143 with SMTP id af79cd13be357-7da016a9a3emr357962085a.6.1751963551246;
        Tue, 08 Jul 2025 01:32:31 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:953b:906f:73bc:cc41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0959sm12315812f8f.27.2025.07.08.01.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:32:30 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v6 2/6] media: qcom: camss: Add CSID 340 support
Date: Tue,  8 Jul 2025 10:32:18 +0200
Message-Id: <20250708083222.1020-3-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708083222.1020-1-loic.poulain@oss.qualcomm.com>
References: <20250708083222.1020-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA2OCBTYWx0ZWRfXyZtZgLnkItwO
 sV/d2E9tPxqdQs1Vv2OEqsN3cY1RiTmolS4lK+4nTO0gGWOMat6QOQ8kI09UOpdXym9Rr4TDhRt
 Rt0BCzM/LFI51as6WQt9VQAvg9neypaxs4g40IStGH6eDg+bR9dyba4WIN2QdMp/+fMmjz/uGi8
 bWvctE7bI/xYpT59y3+B06Xqrjy/QUMW4SsDFiPGOmgnu3/c1KvLr7dE2g3l8A54bLt9qfWlz63
 ak8Yn5ydk3P+aHDc2ECjJ8mQ4rFgCf86xFb1y+BD4w7BVhGV4sKA2DYlJR7Ct6P+yp48DS2O1BS
 6K6SxUZ+a2hRzvY79MlkMqWMt8L8VJ4vUTr2v7mbRyi1xPOxechYd1ubfABpQQx/5zU+2TrlhIg
 HDEkVbhj1Nf3Hd+0QsqHDbbpr6FxdcDYcJ6KqFMj/n2qSeGmtNPJ0dJXno8XNEG20jky6ZUE
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686cd7a0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=L3ROWYctCJYvUZd4tikA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: KYixmE14W-SxjW93STSn7i8hzAeqhT6O
X-Proofpoint-ORIG-GUID: KYixmE14W-SxjW93STSn7i8hzAeqhT6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080068

Add support for CSID found in QCM2290, it's a simplified gen-2 version.
- There is no Test Pattern Generator (moved outside CSID)
- There is no subsampling (moved to CAMIF module)

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../platform/qcom/camss/camss-csid-340.c      | 189 ++++++++++++++++++
 .../media/platform/qcom/camss/camss-csid.h    |   1 +
 3 files changed, 191 insertions(+)
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
index 000000000000..7a8fbae3009b
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -0,0 +1,189 @@
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


