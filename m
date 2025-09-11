Return-Path: <linux-arm-msm+bounces-73055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6309B527A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 06:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9F091C21874
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 04:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D61247298;
	Thu, 11 Sep 2025 04:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ofz02RjW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E54248867
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 04:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757565205; cv=none; b=tCdkRMYRB3SvxQq6fn2aQR9ASeBJRM6SX9U/kU6afyRcXSOT4y88DKrGYmWLGYmbNBN3oi5w/paqoe7jf0OXDRpwmgK5Exdy0jmi+TEztqT2WKldrNLsgu7rAxhX6u69RnyxFN5AKobXEuzTltwAh2hmCpPpVRhR0fztKYqArAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757565205; c=relaxed/simple;
	bh=xw0q4NcwHHSieNerwzr051tx91leTFsT79dNH6hi6Gk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lcOFgeEuyGuStq9h9Gt6QANU3D9sd/ZAA5OFCjzI6xot/xPblP8fgBWXF/0H1qoMUR5XTtdehvFGU26eUpTEIglRtzo7KGfEp1cFjMMLMURSmedurGnIkIPQTqqviS+W5Be5ifMaP2lT1O6KnLW9WqR1/te1I8XE6WMc3QXWvG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ofz02RjW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IbGv005464
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 04:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ejmKrdCNEld
	h2vZcjwyV0oT0m8cVWo38CkmzCmn2HDo=; b=ofz02RjW3/Zp/XxDwwQwsWRh8A/
	SMmjQ45uby2p2n4TTjO+Ix6NIBQGWRNYFOeKfeSvJ98DM0G5dni/aGoTn6+1yGej
	aWSxJWCcmedhe5arx0mksRCixBTz83mG/FJKX/GmuEZOqq3SqM6+ietIyJlw9Bso
	lm3wVgDL1W/sD9tDv5kcQACEwA1wC0cNSDf/EiuAMhLVWFLMrTWRWgG/0heJEyLW
	WloZsjo64syjDmIWx6s4pLplhbzCjpx8jXZQzsmtSCS8XSj50wE8iIl+tXACfRsI
	z7C7vAOkJZKqFAlhi0+zK2ik21zBeMGYPZICBmB+eiO+25edwnPvDncqDBA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2a9tf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 04:33:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5242b0f450so261427a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 21:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757565201; x=1758170001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejmKrdCNEldh2vZcjwyV0oT0m8cVWo38CkmzCmn2HDo=;
        b=AgRjLRei//+5RLjls/uOOFqosBlG0Dw5JVuxMjZoHJ6kaPGPQUVasSZ0vW4VuD8Hja
         qg7PaLZ4hRfzo5hH29vmZdUxBxqN9hS+fuer3nFDBt9nIV+wBoqLuLmaFy1XEOvQ/CtB
         2WvB9aTVSTKe7UHnZJccu3Cqc8CAv5teBqnIQqVus3SBXEDbMfKMUEWD+oJD9RzG/68d
         IEzdiEER9A12UgZQqvD9Bke2tmgQ4gaPXtR28aVODF1zpQpj6eYm8vXR195sKTZ783nx
         5+/Hv3OEHs+843sODrcr98Q9ZChAYniVbBquLUb2b4O5e+me/3l1XJM1qaqk4Oy2knRy
         W6Og==
X-Forwarded-Encrypted: i=1; AJvYcCXIICpMcQIfLNPrPvKDn14OM/siYwmb1vvgz2feL1LouM60YEIvykXIfVLDp+dbJmBnFquGfA/V703cYHKc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Jd6QlvHQKxXExILM5VT5fsBfvzFQOzqXKnan7TJ+xiB4T1Bk
	a5SnAoQ4fQ6+/XMaQlxjJxYjWL1FTLlZDwukRjilxW73Eb0jSM1Kj5eFeeATXrnFx9CyCB+bmAr
	elbEiZkLVi3NBoEYAl2Y6ZAmnoxN1cfAcIixdfx2FYCUx3prLY/0tU1H4WVLFIraLDVJ3
X-Gm-Gg: ASbGncvCRiWyV4P5PyOLLf35lagFeRb7IlkLGIxXi/89z8ujYw10yFUAQnBeICJcnPf
	P8On/qpkFucNPX5dKhkPrB44CBIHQYvPwh20f+8Ze0+XGFsldxzn0qcPhnpcLKrEYXU3Ig4H1sk
	XaniK72IGMe5AebvoRu32R0wu/2sH7kZU9acXOFZ52qwM38s/fx7CQIF9z8V5gBxRPpnMCIpi0G
	LiyMNfTS73Zyddn0u1GIDRDqm30+jj2oFVQk3XKQFz1LH8p+tUsRDPWlsFOe3nCmlm7J2BoVL6K
	VWAtFgsxej4C2ozNFiGdOEYmL5jbsGXLiJY6q7CVRRzOJ4e51ejy+W62qOMcpmeRTag/CySGGoH
	r
X-Received: by 2002:a17:902:d60f:b0:248:6d1a:4304 with SMTP id d9443c01a7336-251715f313fmr234729845ad.38.1757565201175;
        Wed, 10 Sep 2025 21:33:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ7A0F6WCIjNO2Y/9hW5CAwxfdYIL+kP6hhmDpJXN4sGHF3R8Sfwt9fcXfmuZlD03HByRPUQ==
X-Received: by 2002:a17:902:d60f:b0:248:6d1a:4304 with SMTP id d9443c01a7336-251715f313fmr234729435ad.38.1757565200678;
        Wed, 10 Sep 2025 21:33:20 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3a84a46csm4323975ad.91.2025.09.10.21.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 21:33:20 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, broonie@kernel.org,
        johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v7 2/6] soc: qcom: geni-se: Cleanup register defines and update copyright
Date: Thu, 11 Sep 2025 10:02:52 +0530
Message-Id: <20250911043256.3523057-3-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911043256.3523057-1-viken.dadhaniya@oss.qualcomm.com>
References: <20250911043256.3523057-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c25112 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cWaLTDLleWsxmrQceUoA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: -qwFu1S9jthfwmfPZFrVZhl59Qd0-pmG
X-Proofpoint-GUID: -qwFu1S9jthfwmfPZFrVZhl59Qd0-pmG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX0DA0uiSDYhgl
 wnGKb++L3iW24PjV4+kniViDTkQDcsrNKV44WfN9US7ug+kuosJR6TquWe2xj1RrZGVAmpjxBaz
 2a71psVgp6xMrexMY15cA7bQEp/GYxt6NL/YoCMvXGP1h9Nb/sFeFGjgkjqEEwVw9yXKqpSjk1r
 pSUdsdAHkxJd/TuhXcrkbAVHYkynngcOepssjn9Rb7SHw8eGRfEqkesvCOznNR9kBtjB8nQblnq
 fwMes52IYi5N9HQvQAl4a4DPYlZYiMUvCghedBP8Noc+bPeNW5ITH3qrQ0ohv1H9F0JSMMcXeN3
 BeMRylc6Vc5UYJCVouRBQYrDImL6sR6CC/H/cIgaLai3DvRcO9uhdWDJfT/qPqUTlc87uqqpLwz
 bdtqktR4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

Refactor register macros for consistency and clarity and remove redundant
definitions and update naming for better alignment.
Update copyright to include Qualcomm Technologies, Inc.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
v6 -> v7

- No change.

v6 Link: https://lore.kernel.org/all/20250822072651.510027-3-viken.dadhaniya@oss.qualcomm.com/
---
---
 drivers/soc/qcom/qcom-geni-se.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 3c3b796333a6..e8ab2833815e 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1,5 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
-// Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
+/*
+ *  Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
+ *  Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
 
 /* Disable MMIO tracing to prevent excessive logging of unwanted MMIO traces */
 #define __DISABLE_TRACE_MMIO__
@@ -110,22 +113,20 @@ struct geni_se_desc {
 static const char * const icc_path_names[] = {"qup-core", "qup-config",
 						"qup-memory"};
 
-#define QUP_HW_VER_REG			0x4
+/* Common QUPV3 registers */
+#define QUPV3_HW_VER_REG		0x4
 
 /* Common SE registers */
-#define GENI_INIT_CFG_REVISION		0x0
-#define GENI_S_INIT_CFG_REVISION	0x4
-#define GENI_OUTPUT_CTRL		0x24
-#define GENI_CGC_CTRL			0x28
-#define GENI_CLK_CTRL_RO		0x60
-#define GENI_FW_S_REVISION_RO		0x6c
+#define SE_GENI_INIT_CFG_REVISION	0x0
+#define SE_GENI_S_INIT_CFG_REVISION	0x4
+#define SE_GENI_CGC_CTRL		0x28
+#define SE_GENI_CLK_CTRL_RO		0x60
+#define SE_GENI_FW_S_REVISION_RO	0x6c
 #define SE_GENI_BYTE_GRAN		0x254
 #define SE_GENI_TX_PACKING_CFG0		0x260
 #define SE_GENI_TX_PACKING_CFG1		0x264
 #define SE_GENI_RX_PACKING_CFG0		0x284
 #define SE_GENI_RX_PACKING_CFG1		0x288
-#define SE_GENI_M_GP_LENGTH		0x910
-#define SE_GENI_S_GP_LENGTH		0x914
 #define SE_DMA_TX_PTR_L			0xc30
 #define SE_DMA_TX_PTR_H			0xc34
 #define SE_DMA_TX_ATTR			0xc38
@@ -142,7 +143,6 @@ static const char * const icc_path_names[] = {"qup-core", "qup-config",
 #define SE_DMA_RX_IRQ_EN		0xd48
 #define SE_DMA_RX_IRQ_EN_SET		0xd4c
 #define SE_DMA_RX_IRQ_EN_CLR		0xd50
-#define SE_DMA_RX_LEN_IN		0xd54
 #define SE_DMA_RX_MAX_BURST		0xd5c
 #define SE_DMA_RX_FLUSH			0xd60
 #define SE_GSI_EVENT_EN			0xe18
@@ -179,7 +179,7 @@ static const char * const icc_path_names[] = {"qup-core", "qup-config",
 /* SE_DMA_GENERAL_CFG */
 #define DMA_RX_CLK_CGC_ON		BIT(0)
 #define DMA_TX_CLK_CGC_ON		BIT(1)
-#define DMA_AHB_SLV_CFG_ON		BIT(2)
+#define DMA_AHB_SLV_CLK_CGC_ON		BIT(2)
 #define AHB_SEC_SLV_CLK_CGC_ON		BIT(3)
 #define DUMMY_RX_NON_BUFFERABLE		BIT(4)
 #define RX_DMA_ZERO_PADDING_EN		BIT(5)
@@ -196,7 +196,7 @@ u32 geni_se_get_qup_hw_version(struct geni_se *se)
 {
 	struct geni_wrapper *wrapper = se->wrapper;
 
-	return readl_relaxed(wrapper->base + QUP_HW_VER_REG);
+	return readl_relaxed(wrapper->base + QUPV3_HW_VER_REG);
 }
 EXPORT_SYMBOL_GPL(geni_se_get_qup_hw_version);
 
@@ -220,12 +220,12 @@ static void geni_se_io_init(void __iomem *base)
 {
 	u32 val;
 
-	val = readl_relaxed(base + GENI_CGC_CTRL);
+	val = readl_relaxed(base + SE_GENI_CGC_CTRL);
 	val |= DEFAULT_CGC_EN;
-	writel_relaxed(val, base + GENI_CGC_CTRL);
+	writel_relaxed(val, base + SE_GENI_CGC_CTRL);
 
 	val = readl_relaxed(base + SE_DMA_GENERAL_CFG);
-	val |= AHB_SEC_SLV_CLK_CGC_ON | DMA_AHB_SLV_CFG_ON;
+	val |= AHB_SEC_SLV_CLK_CGC_ON | DMA_AHB_SLV_CLK_CGC_ON;
 	val |= DMA_TX_CLK_CGC_ON | DMA_RX_CLK_CGC_ON;
 	writel_relaxed(val, base + SE_DMA_GENERAL_CFG);
 
-- 
2.34.1


