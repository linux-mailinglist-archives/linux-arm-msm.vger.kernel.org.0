Return-Path: <linux-arm-msm+bounces-55071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1F3A98084
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 315CD178F56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 07:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D1A267AFC;
	Wed, 23 Apr 2025 07:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+0xq9a2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685BB267728
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 07:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392856; cv=none; b=NKFFMP3NsEawwdAfN9eAv7APCc/QNptnUPAJGzKRRxI/4XedF8/SjJFsQVQiX8qZVUYy0AJxphSe20MSx2V7N0sZaTRuzycpBguAe1CGi1NT5M0t6dMONnh1shnIIOixhwi+6+VpLiwN+tinwhEMoRykdp64aUdWsgQTdNQUIi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392856; c=relaxed/simple;
	bh=J8hJb6ZfXZfIS27ED/iy0umD/CUmgJhuLhkCD8yWVHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PIU4o8JAV72vtexgOS/oeCP+yZM9UUv7rRZAX5aQC0xKNlWhKKvW7sL1+6Es5yrP6CUNf+gO5joL4Dun3ulmlUkA/hduFSyScnI2A3fTjQ9ie/x4BGHao1QfofLGBww2chEgrtrtG+ZAfvGZZgl6LLUVm+YRcXubQOP3MCTLI8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+0xq9a2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iDpw016872
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 07:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=261qkP0f/h5
	Tj/nGF5EXndFRIC5FkfysWzMW9JJfa+w=; b=l+0xq9a2QcyJGvJ8+mqs2eAfE2S
	IS/3JHGu/MUqQ4tOqSLayfepCfxvtQt0cewsLUpoaDzDl6SAL3P57pow1gySwrGw
	EHWXYl6l3a1S2hU5yX5TlssaftA11OgJkrEtOsJauGboJGhDmj6DBb0jAaE3GRQO
	fr0ud/Te/ow4m/4JsVkDEzQ1lUvWaJ7zoAMMqu+hxVozgFwRMBQ41QQb5MnNS2i4
	R4GMZfR3QX4nvknls3QIY7RLsoDDgxezt7uHZkLrYDconoVHaSoFSSP0fXG4BBTw
	+lhiTKHMAhGvZN6gjM881R8ZKlmc2UUHNRTWFSx6cpBmEvKZiSEAFeiORpw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0180s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 07:20:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c7c30d8986so573541485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 00:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392852; x=1745997652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=261qkP0f/h5Tj/nGF5EXndFRIC5FkfysWzMW9JJfa+w=;
        b=Pq28P0V8gH87lqQ3rxofkiZnVeYo2Uy498dlyXHJObiD3ffGKe8bFUMjYOxIsWhfGO
         LPEIKpdHdemUMo+Zzve+36DLvenKpDwgnHMGY6gJlxFmS4b5DX12HGoZZNS657KYYmve
         PGwYrKbWIhtjkQXc7Klm5wi6qI+Enp1aDY7xpzPZ41a7sJKgVgH177uIr2eOsDKjx0Pz
         pTxz2onLqko0Kw50NfFfzL3IQaXN/ZbWq1EJtvmMIyIXPvVUWlai/Uf14hWIygsvtmTm
         rrKRqnrskOnFCAS7y78Mt70lc3Sj3JcCiQFiOb+C20FWZcul5zbhN09VnMjfjzO5msbX
         rzVA==
X-Gm-Message-State: AOJu0YzAUkQH6hSkMOxdYrrvOjf6hH1Vio62IRUWMX9Hx63uXQGZVj8z
	TKo25c3OyBsngokUb5KJOthpHX8KzoFYCAvc+KnEJWOqIyjw4ZvycOQVuWKxxvYHEOcLMkbyJvB
	Kv3efqreQj7nevkf6lWCOOHvCVfqra/dY4VBfbNY+k6aHQ81SrBCktK2+xylFJHJT
X-Gm-Gg: ASbGnctXoLyR9QDB/+oB2ZcBVn1utYDUjjQd7DSyvDlx7/5JeVf7RzIXdhRBBIeZfjN
	U7BYr2R5PVlvHX0qdp/unQvw/1JvhTwJk2K+PoyOz47Lfey5y70gHIc7ulDorZyM4khq91gZyCp
	t+km8geUZlpR1Yveb03Y4Y0De7t5qLpvhzLD9298XDzDR70PI379kWzMA3eNkvzo/41RClbMdeC
	zK0xc4S0oJMLxXSkx9WzUt+48fz+/tSQUuh1wTxH9JzaRryW1VCrTc1bpyATKeSscqj8HIPuUvR
	LrtS4MuuqsYfv+mBwRXetvjKC4Nb9YO1raghBn5/3asK/6A=
X-Received: by 2002:a05:620a:c50:b0:7c5:6c02:4c25 with SMTP id af79cd13be357-7c927fa15bamr2917973285a.25.1745392852193;
        Wed, 23 Apr 2025 00:20:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvmmfr+bD8CGU5G2X2r+0BNQqX3Z6AoVk8EFNbDRPOEr8yARut4sJccAp21TIBEFC8UL9trQ==
X-Received: by 2002:a05:620a:c50:b0:7c5:6c02:4c25 with SMTP id af79cd13be357-7c927fa15bamr2917971085a.25.1745392851720;
        Wed, 23 Apr 2025 00:20:51 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:10e3:ecaa:2fb2:d23a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec42af6sm757138366b.43.2025.04.23.00.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:20:51 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 2/6] media: qcom: camss: Add CSID 340 support
Date: Wed, 23 Apr 2025 09:20:40 +0200
Message-Id: <20250423072044.234024-3-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0OSBTYWx0ZWRfX7TW/S+bFFd1j ehfjNg7ya2y23GmlVaSnJZ+jjFas6uthM73L7trsbdoGW0vDekZDGQdXxoHRGTjpBBkMbzCEFYQ b6hc8XfGYrUrsgoZzAXgHXfoGo+I2oH8DpCP7A7i6cTKGTZjY6BJ1Dz3hrgZbcYqZSD8B8BOPi8
 wG89AOnjsTx67mprJxk2Fdaq1bJN3PUW06Hc7xMnFVha2K3LuDObfuzLTtLSfW9YW+FEuTJuOwS lvuyh4hPHP/ImVlVyAvdnepxTGNfHjNB1soHYMbrUUnmW7qFBO9cBPV1FE7D2t9HRXhV1R500wJ D4qpsWl4nBm6/KOAGiY0CZ9RN67Omv6kUSIMe6Ln6bg3o7HitsqMsBLJ6j366AFdwpRtGFAKrZw
 A1Lnoh+rK+BoHSzICvV30rGZmutSGI8FN6vKqY4kM0iSMPaMge5Y/eX+JTOfzwxmGXUm3unc
X-Proofpoint-GUID: V5XEu8iDW9BWpCG78gq7cKweU6MsPJyT
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680894d5 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=L3ROWYctCJYvUZd4tikA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: V5XEu8iDW9BWpCG78gq7cKweU6MsPJyT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230049

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


