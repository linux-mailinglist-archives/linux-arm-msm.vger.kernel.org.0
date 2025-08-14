Return-Path: <linux-arm-msm+bounces-69270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8756B26A6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 17:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57D60AA3FDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 14:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87BCF21A928;
	Thu, 14 Aug 2025 14:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VcJ6D6th"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16C2204C0C
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 14:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755183290; cv=none; b=G5jTmkEUatM8QvrhYjSjcgtJTmOdtEcZjlMe+iu4v2AnqDxjT4mjzyoK9Dji7oh3Ky91rYoPppqlcpHwTN8Fg6qBQV47LeQxTkatoiIe2mpVI8UrGGm4shz365IAn4olFMepfEb9QgSXJsUCJkMRD/PMsGuJV9Hen8pWKYrGMm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755183290; c=relaxed/simple;
	bh=D3A7hqswucUc7mhtsx9qjM1sydE2cB9pgCD4XBEGeu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AeFe84EKC0UpU70Pgh2g0TEzOsFbNjwYEhOUJwWXR4TIl61uJkQi+bz2I7/UCEBnUTda7lmG+QoGAhILG3/4GmjlLeG4DMeoT8dWxByTCwnPnQYGMwkC1RyymXk1sTuXM7RHcxzT/whYvCPBOWgZkUYPiM9B1ZulLqnKiUnpAI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VcJ6D6th; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E8X19E013413
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 14:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XV9WxrCZyOYQYt6ZcrPjQiYSGO1ruoFflcbwuNdvXCo=; b=VcJ6D6thIFaovqoo
	Z1DIQxZ8D3MC9pSAa1Lc2yjp/tsuQHseOPK53ZIloQLK6ncd+Lw6Tp2SQE2HqSRO
	wWV892PZ9ynCvKMn8HHaOmH8WCissHieYuuzm2aGG8lhqS5OISknE3PGkLbEubSK
	dNnGOcV6IAXnyBN+Eu9IuvuiA54e/1u2CeBueSZR574jjwJbMtu2bZOqUZwoXqhZ
	Hb6mfyE2YzCHEkmX4kBolWIo4VvpqfI4TH+Uh/JJX9N77vQD4aGI1DfLFVlhgfoc
	mBKB2ctVJme9asVhyaGLuyJPOlTylH2JaVe5EXMOJa/XWDxyYtddFA7+U5jSvGLs
	ZpPMGA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxe8vc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 14:54:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4716fc56a9so1214494a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755183284; x=1755788084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XV9WxrCZyOYQYt6ZcrPjQiYSGO1ruoFflcbwuNdvXCo=;
        b=W7SU5Bo8jp/4JLFarqqWX5UKUNtxGaY8P+2LuXCcCDgyjbpW4a/nJKGoM9parYKtEA
         zv2y/Tx7pbzqS8O1m4WsFo+tB4JZU6Lk3Psevbp5Q8kmszswqU5D/kGYavgSXTvPzxz9
         WdqcZ4yofKZMvFZTKH1QOUZgkwxU+A40mqfgja5CHs5Bsc7wH5Fcl1rJGLllkssCdLY6
         QkN5C6pZfI1O8eYVs3kQ7S/RbCnc1udSMhZfj+HY2K055QntFtwerMHe0q9VafyljHHh
         Mdub/hICWSUrjK5YF+zmf2gmH/QO636X8pGlMtRNziFYo8dnjvjb/AXKXH1NPulbMSRp
         Df/g==
X-Forwarded-Encrypted: i=1; AJvYcCXhP6/0hmQJj8q7veXdVJfHyl8NLQ5P5A4TJTpo8Z201IN8OAdjGz6MOzDo/su280gu2WlvH3XfQKy4CFOZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyFy6qawrbNyBvgdHJl387sIOAqhHSMSEQS/rX7MpWfYV6HRdYo
	2zsiiR9j0XuGyhO0dq7w9ASFxNMorNzncuRGtVgxc75yvxwLr3mA/BrtDy/rTgkmcHhDq/iJ35n
	CLIiEkUUqT+udN71xewGGVycsrTOgl1TdcX33k7y7Jk+Trjt2nMXFtEV0BxkNxClfIIRgx7Cmb5
	bL
X-Gm-Gg: ASbGncv9AIh1YIWQtm2mMcCbSMnfdxgky0PxNYQC2OuAo6kTRSkwHnwacmR+spI2cUl
	hCq8w24O08/fMqpMixvMLD1A4USLhOBnQ9AxLxBiPtaVuCA1jiah5K7MHD8rL36GHm+IFw5PoZJ
	O6we+Dl9UgL9wNjFO+Y3THu3/vT+mzB5Wk6aWoqZ20nCFY7Nux2D1RIKiSi0swoZzJ/UQmAqauq
	ggrWOweXpCoqnfK+ke0Yhel2v5cbbk71l59zjmZcXtwpMEHQ/ZmvQi/gHzHL1jsp1AAyhsnflYO
	gLB8JjfMnwezA1uvr0qhiGq7PqR3aO8jeEs2yA33u2W27W5EianZ5H9oaz5V4Sc=
X-Received: by 2002:a05:6a20:3a90:b0:240:cd6:a91e with SMTP id adf61e73a8af0-240bd03852dmr4067973637.20.1755183282803;
        Thu, 14 Aug 2025 07:54:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0iMYMoTllj+CL+S1xwyfEUHobNivxyO19y8utqoiQgSr1bo/ruM3i+IYF0w6YaJZEqu+2TQ==
X-Received: by 2002:a05:6a20:3a90:b0:240:cd6:a91e with SMTP id adf61e73a8af0-240bd03852dmr4067924637.20.1755183281966;
        Thu, 14 Aug 2025 07:54:41 -0700 (PDT)
Received: from [169.254.0.3] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76be718b2d6sm30715274b3a.56.2025.08.14.07.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 07:54:41 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 14:54:21 +0000
Subject: [PATCH v2 3/3] interconnect: qcom: add glymur interconnect
 provider driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-glymur-icc-v2-3-596cca6b6015@oss.qualcomm.com>
References: <20250814-glymur-icc-v2-0-596cca6b6015@oss.qualcomm.com>
In-Reply-To: <20250814-glymur-icc-v2-0-596cca6b6015@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Mike Tipton <mike.tipton@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfXw1daqHOzNFm4
 g/pdYPIOcFzwW3+DkIoZqs2+TgcBjti2SSXc/4klxxGrBVXB75FuVFPi1cqe0+sZroZ6Gz+ft1R
 7kDBVSLOXT+7nDwsxXhw43UW4pj5OmZEJv0MJHUcgmWeosoI1nDv0t+kE1hggCZsME58IygvLvj
 5AM0PxjCQG+CEejxFsHUvFQDHpGWWLPJJvA74qxXR2hgeh2MMc5pB2pxsyl2QoIJ1CbnDZux5n4
 +gOnlZCqzI9S3Nbjh1xvOKJjNxHIHVsEUzOEyrX6HheHh7Rh5qWEUoTFnBpmTtneY/Znl2iB+pU
 uihyHuGGnR9b1+mUNDWnnTTAHLyJDL4xdFpxcEOajGDA7a4RMQrHp3fFXIRNJaLO0e858GBHY6/
 D8ehTVk5
X-Proofpoint-GUID: w16NeI9DEQSQ896P7HwzfpCX51sdJilV
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689df8b5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=7Y5ZrCSegFD1MsWmRDAA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: w16NeI9DEQSQ896P7HwzfpCX51sdJilV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

Add driver for the Qualcomm interconnect buses found in glymur
based platforms. The topology consists of several NoCs that are
controlled by a remote processor that collects the aggregated
bandwidth for each master-slave pairs.

Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 drivers/interconnect/qcom/Kconfig  |    9 +
 drivers/interconnect/qcom/Makefile |    2 +
 drivers/interconnect/qcom/glymur.c | 2543 ++++++++++++++++++++++++++++++++++++
 3 files changed, 2554 insertions(+)

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index 31dc4781abefb50a8b6ca1d8a6efed369c47e1a6..5b4bb9f1382b2fd3c14b6f1ea35c43ac9fddd803 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -8,6 +8,15 @@ config INTERCONNECT_QCOM
 config INTERCONNECT_QCOM_BCM_VOTER
 	tristate
 
+config INTERCONNECT_QCOM_GLYMUR
+       tristate "Qualcomm GLYMUR interconnect driver"
+       depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+       select INTERCONNECT_QCOM_RPMH
+       select INTERCONNECT_QCOM_BCM_VOTER
+       help
+         This is a driver for the Qualcomm Network-on-Chip on glymur-based
+         platforms.
+
 config INTERCONNECT_QCOM_MSM8909
 	tristate "Qualcomm MSM8909 interconnect driver"
 	depends on INTERCONNECT_QCOM
diff --git a/drivers/interconnect/qcom/Makefile b/drivers/interconnect/qcom/Makefile
index f16ac242eba5509a8649bb4670dd0848320e5be9..cf8cba73ee3e61839180d0c0a7c127dce848bdf2 100644
--- a/drivers/interconnect/qcom/Makefile
+++ b/drivers/interconnect/qcom/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_INTERCONNECT_QCOM) += interconnect_qcom.o
 
 interconnect_qcom-y			:= icc-common.o
 icc-bcm-voter-objs			:= bcm-voter.o
+qnoc-glymur-objs			:= glymur.o
 qnoc-milos-objs				:= milos.o
 qnoc-msm8909-objs			:= msm8909.o
 qnoc-msm8916-objs			:= msm8916.o
@@ -46,6 +47,7 @@ qnoc-x1e80100-objs			:= x1e80100.o
 icc-smd-rpm-objs			:= smd-rpm.o icc-rpm.o icc-rpm-clocks.o
 
 obj-$(CONFIG_INTERCONNECT_QCOM_BCM_VOTER) += icc-bcm-voter.o
+obj-$(CONFIG_INTERCONNECT_QCOM_GLYMUR) += qnoc-glymur.o
 obj-$(CONFIG_INTERCONNECT_QCOM_MILOS) += qnoc-milos.o
 obj-$(CONFIG_INTERCONNECT_QCOM_MSM8909) += qnoc-msm8909.o
 obj-$(CONFIG_INTERCONNECT_QCOM_MSM8916) += qnoc-msm8916.o
diff --git a/drivers/interconnect/qcom/glymur.c b/drivers/interconnect/qcom/glymur.c
new file mode 100644
index 0000000000000000000000000000000000000000..cf20b5752dbbf4a5e7a79926910993445d7cbb4f
--- /dev/null
+++ b/drivers/interconnect/qcom/glymur.c
@@ -0,0 +1,2543 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/interconnect.h>
+#include <linux/interconnect-provider.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
+
+#include "bcm-voter.h"
+#include "icc-rpmh.h"
+
+static struct qcom_icc_node qup0_core_slave = {
+	.name = "qup0_core_slave",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qup1_core_slave = {
+	.name = "qup1_core_slave",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qup2_core_slave = {
+	.name = "qup2_core_slave",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_ahb2phy0 = {
+	.name = "qhs_ahb2phy0",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_ahb2phy1 = {
+	.name = "qhs_ahb2phy1",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_ahb2phy2 = {
+	.name = "qhs_ahb2phy2",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_ahb2phy3 = {
+	.name = "qhs_ahb2phy3",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_av1_enc_cfg = {
+	.name = "qhs_av1_enc_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_camera_cfg = {
+	.name = "qhs_camera_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_clk_ctl = {
+	.name = "qhs_clk_ctl",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_crypto0_cfg = {
+	.name = "qhs_crypto0_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_display_cfg = {
+	.name = "qhs_display_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_gpuss_cfg = {
+	.name = "qhs_gpuss_cfg",
+	.channels = 1,
+	.buswidth = 8,
+};
+
+static struct qcom_icc_node qhs_imem_cfg = {
+	.name = "qhs_imem_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_pcie0_cfg = {
+	.name = "qhs_pcie0_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_pcie1_cfg = {
+	.name = "qhs_pcie1_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_pcie2_cfg = {
+	.name = "qhs_pcie2_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_pcie3a_cfg = {
+	.name = "qhs_pcie3a_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_pcie3b_cfg = {
+	.name = "qhs_pcie3b_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_pcie4_cfg = {
+	.name = "qhs_pcie4_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_pcie5_cfg = {
+	.name = "qhs_pcie5_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_pcie6_cfg = {
+	.name = "qhs_pcie6_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_pcie_rscc = {
+	.name = "qhs_pcie_rscc",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_pdm = {
+	.name = "qhs_pdm",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_prng = {
+	.name = "qhs_prng",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_qdss_cfg = {
+	.name = "qhs_qdss_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_qspi = {
+	.name = "qhs_qspi",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_qup0 = {
+	.name = "qhs_qup0",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_qup1 = {
+	.name = "qhs_qup1",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_qup2 = {
+	.name = "qhs_qup2",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_sdc2 = {
+	.name = "qhs_sdc2",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_sdc4 = {
+	.name = "qhs_sdc4",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_smmuv3_cfg = {
+	.name = "qhs_smmuv3_cfg",
+	.channels = 1,
+	.buswidth = 8,
+};
+
+static struct qcom_icc_node qhs_tcsr = {
+	.name = "qhs_tcsr",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_tlmm = {
+	.name = "qhs_tlmm",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_ufs_mem_cfg = {
+	.name = "qhs_ufs_mem_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_usb2_0_cfg = {
+	.name = "qhs_usb2_0_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_usb3_0_cfg = {
+	.name = "qhs_usb3_0_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_usb3_1_cfg = {
+	.name = "qhs_usb3_1_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_usb3_2_cfg = {
+	.name = "qhs_usb3_2_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_usb3_mp_cfg = {
+	.name = "qhs_usb3_mp_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_usb4_0_cfg = {
+	.name = "qhs_usb4_0_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_usb4_1_cfg = {
+	.name = "qhs_usb4_1_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_usb4_2_cfg = {
+	.name = "qhs_usb4_2_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_venus_cfg = {
+	.name = "qhs_venus_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qss_lpass_qtb_cfg = {
+	.name = "qss_lpass_qtb_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qss_nsp_qtb_cfg = {
+	.name = "qss_nsp_qtb_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node xs_qdss_stm = {
+	.name = "xs_qdss_stm",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node xs_sys_tcu_cfg = {
+	.name = "xs_sys_tcu_cfg",
+	.channels = 1,
+	.buswidth = 8,
+};
+
+static struct qcom_icc_node qhs_aoss = {
+	.name = "qhs_aoss",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_ipc_router = {
+	.name = "qhs_ipc_router",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_soccp = {
+	.name = "qhs_soccp",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_tme_cfg = {
+	.name = "qhs_tme_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qns_apss = {
+	.name = "qns_apss",
+	.channels = 1,
+	.buswidth = 8,
+};
+
+static struct qcom_icc_node qxs_boot_imem = {
+	.name = "qxs_boot_imem",
+	.channels = 1,
+	.buswidth = 16,
+};
+
+static struct qcom_icc_node qxs_imem = {
+	.name = "qxs_imem",
+	.channels = 1,
+	.buswidth = 8,
+};
+
+static struct qcom_icc_node ebi = {
+	.name = "ebi",
+	.channels = 12,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node srvc_mnoc = {
+	.name = "srvc_mnoc",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node srvc_nsinoc = {
+	.name = "srvc_nsinoc",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node srvc_pcie_east_aggre_noc = {
+	.name = "srvc_pcie_east_aggre_noc",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_hscnoc_pcie_east_ms_mpu_cfg = {
+	.name = "qhs_hscnoc_pcie_east_ms_mpu_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node srvc_pcie_east = {
+	.name = "srvc_pcie_east",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node xs_pcie_0 = {
+	.name = "xs_pcie_0",
+	.channels = 1,
+	.buswidth = 16,
+};
+
+static struct qcom_icc_node xs_pcie_1 = {
+	.name = "xs_pcie_1",
+	.channels = 1,
+	.buswidth = 32,
+};
+
+static struct qcom_icc_node xs_pcie_5 = {
+	.name = "xs_pcie_5",
+	.channels = 1,
+	.buswidth = 32,
+};
+
+static struct qcom_icc_node srvc_pcie_west_aggre_noc = {
+	.name = "srvc_pcie_west_aggre_noc",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node qhs_hscnoc_pcie_west_ms_mpu_cfg = {
+	.name = "qhs_hscnoc_pcie_west_ms_mpu_cfg",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node srvc_pcie_west = {
+	.name = "srvc_pcie_west",
+	.channels = 1,
+	.buswidth = 4,
+};
+
+static struct qcom_icc_node xs_pcie_2 = {
+	.name = "xs_pcie_2",
+	.channels = 1,
+	.buswidth = 16,
+};
+
+static struct qcom_icc_node xs_pcie_3a = {
+	.name = "xs_pcie_3a",
+	.channels = 1,
+	.buswidth = 64,
+};
+
+static struct qcom_icc_node xs_pcie_3b = {
+	.name = "xs_pcie_3b",
+	.channels = 1,
+	.buswidth = 32,
+};
+
+static struct qcom_icc_node xs_pcie_4 = {
+	.name = "xs_pcie_4",
+	.channels = 1,
+	.buswidth = 16,
+};
+
+static struct qcom_icc_node xs_pcie_6 = {
+	.name = "xs_pcie_6",
+	.channels = 1,
+	.buswidth = 16,
+};
+
+static struct qcom_icc_node qup0_core_master = {
+	.name = "qup0_core_master",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qup0_core_slave },
+};
+
+static struct qcom_icc_node qup1_core_master = {
+	.name = "qup1_core_master",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qup1_core_slave },
+};
+
+static struct qcom_icc_node qup2_core_master = {
+	.name = "qup2_core_master",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qup2_core_slave },
+};
+
+static struct qcom_icc_node llcc_mc = {
+	.name = "llcc_mc",
+	.channels = 12,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &ebi },
+};
+
+static struct qcom_icc_node qsm_mnoc_cfg = {
+	.name = "qsm_mnoc_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &srvc_mnoc },
+};
+
+static struct qcom_icc_node qsm_pcie_east_anoc_cfg = {
+	.name = "qsm_pcie_east_anoc_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &srvc_pcie_east_aggre_noc },
+};
+
+static struct qcom_icc_node qnm_hscnoc_pcie_east = {
+	.name = "qnm_hscnoc_pcie_east",
+	.channels = 1,
+	.buswidth = 32,
+	.num_links = 3,
+	.link_nodes = (struct qcom_icc_node *[]) { &xs_pcie_0, &xs_pcie_1,
+		      &xs_pcie_5 },
+};
+
+static struct qcom_icc_node qsm_cnoc_pcie_east_slave_cfg = {
+	.name = "qsm_cnoc_pcie_east_slave_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 2,
+	.link_nodes = (struct qcom_icc_node *[]) { &qhs_hscnoc_pcie_east_ms_mpu_cfg,
+		      &srvc_pcie_east },
+};
+
+static struct qcom_icc_node qsm_pcie_west_anoc_cfg = {
+	.name = "qsm_pcie_west_anoc_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &srvc_pcie_west_aggre_noc },
+};
+
+static struct qcom_icc_node qnm_hscnoc_pcie_west = {
+	.name = "qnm_hscnoc_pcie_west",
+	.channels = 1,
+	.buswidth = 32,
+	.num_links = 5,
+	.link_nodes = (struct qcom_icc_node *[]) { &xs_pcie_2, &xs_pcie_3a,
+		      &xs_pcie_3b, &xs_pcie_4,
+		      &xs_pcie_6 },
+};
+
+static struct qcom_icc_node qsm_cnoc_pcie_west_slave_cfg = {
+	.name = "qsm_cnoc_pcie_west_slave_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 2,
+	.link_nodes = (struct qcom_icc_node *[]) { &qhs_hscnoc_pcie_west_ms_mpu_cfg,
+		      &srvc_pcie_west },
+};
+
+static struct qcom_icc_node qss_cnoc_pcie_slave_east_cfg = {
+	.name = "qss_cnoc_pcie_slave_east_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qsm_cnoc_pcie_east_slave_cfg },
+};
+
+static struct qcom_icc_node qss_cnoc_pcie_slave_west_cfg = {
+	.name = "qss_cnoc_pcie_slave_west_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qsm_cnoc_pcie_west_slave_cfg },
+};
+
+static struct qcom_icc_node qss_mnoc_cfg = {
+	.name = "qss_mnoc_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qsm_mnoc_cfg },
+};
+
+static struct qcom_icc_node qss_pcie_east_anoc_cfg = {
+	.name = "qss_pcie_east_anoc_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qsm_pcie_east_anoc_cfg },
+};
+
+static struct qcom_icc_node qss_pcie_west_anoc_cfg = {
+	.name = "qss_pcie_west_anoc_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qsm_pcie_west_anoc_cfg },
+};
+
+static struct qcom_icc_node qns_llcc = {
+	.name = "qns_llcc",
+	.channels = 12,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &llcc_mc },
+};
+
+static struct qcom_icc_node qns_pcie_east = {
+	.name = "qns_pcie_east",
+	.channels = 1,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qnm_hscnoc_pcie_east },
+};
+
+static struct qcom_icc_node qns_pcie_west = {
+	.name = "qns_pcie_west",
+	.channels = 1,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qnm_hscnoc_pcie_west },
+};
+
+static struct qcom_icc_node qsm_cfg = {
+	.name = "qsm_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 51,
+	.link_nodes = (struct qcom_icc_node *[]) { &qhs_ahb2phy0, &qhs_ahb2phy1,
+		      &qhs_ahb2phy2, &qhs_ahb2phy3,
+		      &qhs_av1_enc_cfg, &qhs_camera_cfg,
+		      &qhs_clk_ctl, &qhs_crypto0_cfg,
+		      &qhs_display_cfg, &qhs_gpuss_cfg,
+		      &qhs_imem_cfg, &qhs_pcie0_cfg,
+		      &qhs_pcie1_cfg, &qhs_pcie2_cfg,
+		      &qhs_pcie3a_cfg, &qhs_pcie3b_cfg,
+		      &qhs_pcie4_cfg, &qhs_pcie5_cfg,
+		      &qhs_pcie6_cfg, &qhs_pcie_rscc,
+		      &qhs_pdm, &qhs_prng,
+		      &qhs_qdss_cfg, &qhs_qspi,
+		      &qhs_qup0, &qhs_qup1,
+		      &qhs_qup2, &qhs_sdc2,
+		      &qhs_sdc4, &qhs_smmuv3_cfg,
+		      &qhs_tcsr, &qhs_tlmm,
+		      &qhs_ufs_mem_cfg, &qhs_usb2_0_cfg,
+		      &qhs_usb3_0_cfg, &qhs_usb3_1_cfg,
+		      &qhs_usb3_2_cfg, &qhs_usb3_mp_cfg,
+		      &qhs_usb4_0_cfg, &qhs_usb4_1_cfg,
+		      &qhs_usb4_2_cfg, &qhs_venus_cfg,
+		      &qss_cnoc_pcie_slave_east_cfg, &qss_cnoc_pcie_slave_west_cfg,
+		      &qss_lpass_qtb_cfg, &qss_mnoc_cfg,
+		      &qss_nsp_qtb_cfg, &qss_pcie_east_anoc_cfg,
+		      &qss_pcie_west_anoc_cfg, &xs_qdss_stm,
+		      &xs_sys_tcu_cfg },
+};
+
+static struct qcom_icc_node xm_gic = {
+	.name = "xm_gic",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x33000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_llcc },
+};
+
+static struct qcom_icc_node qss_cfg = {
+	.name = "qss_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qsm_cfg },
+};
+
+static struct qcom_icc_node qnm_hscnoc_cnoc = {
+	.name = "qnm_hscnoc_cnoc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 8,
+	.link_nodes = (struct qcom_icc_node *[]) { &qhs_aoss, &qhs_ipc_router,
+		      &qhs_soccp, &qhs_tme_cfg,
+		      &qns_apss, &qss_cfg,
+		      &qxs_boot_imem, &qxs_imem },
+};
+
+static struct qcom_icc_node qns_hscnoc_cnoc = {
+	.name = "qns_hscnoc_cnoc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qnm_hscnoc_cnoc },
+};
+
+static struct qcom_icc_node alm_gpu_tcu = {
+	.name = "alm_gpu_tcu",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x933000 },
+		.prio = 1,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 2,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_hscnoc_cnoc, &qns_llcc },
+};
+
+static struct qcom_icc_node alm_pcie_qtc = {
+	.name = "alm_pcie_qtc",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x51f000 },
+		.prio = 3,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 2,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_hscnoc_cnoc, &qns_llcc },
+};
+
+static struct qcom_icc_node alm_sys_tcu = {
+	.name = "alm_sys_tcu",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x51f080 },
+		.prio = 6,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 2,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_hscnoc_cnoc, &qns_llcc },
+};
+
+static struct qcom_icc_node chm_apps = {
+	.name = "chm_apps",
+	.channels = 6,
+	.buswidth = 32,
+	.num_links = 4,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_hscnoc_cnoc, &qns_llcc,
+		      &qns_pcie_east, &qns_pcie_west },
+};
+
+static struct qcom_icc_node qnm_aggre_noc_east = {
+	.name = "qnm_aggre_noc_east",
+	.channels = 1,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x934000 },
+		.prio = 2,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 4,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_hscnoc_cnoc, &qns_llcc,
+		      &qns_pcie_east, &qns_pcie_west },
+};
+
+static struct qcom_icc_node qnm_gpu = {
+	.name = "qnm_gpu",
+	.channels = 4,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 4,
+		.port_offsets = { 0x935000, 0x936000, 0x937000, 0x938000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 4,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_hscnoc_cnoc, &qns_llcc,
+		      &qns_pcie_east, &qns_pcie_west },
+};
+
+static struct qcom_icc_node qnm_lpass = {
+	.name = "qnm_lpass",
+	.channels = 1,
+	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x939000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 4,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_hscnoc_cnoc, &qns_llcc,
+		      &qns_pcie_east, &qns_pcie_west },
+};
+
+static struct qcom_icc_node qnm_mnoc_hf = {
+	.name = "qnm_mnoc_hf",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x721000, 0x721080 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 4,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_hscnoc_cnoc, &qns_llcc,
+		      &qns_pcie_east, &qns_pcie_west },
+};
+
+static struct qcom_icc_node qnm_mnoc_sf = {
+	.name = "qnm_mnoc_sf",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x721100, 0x721180 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 4,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_hscnoc_cnoc, &qns_llcc,
+		      &qns_pcie_east, &qns_pcie_west },
+};
+
+static struct qcom_icc_node qnm_nsp_noc = {
+	.name = "qnm_nsp_noc",
+	.channels = 4,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 4,
+		.port_offsets = { 0x816000, 0x816080, 0x816100, 0x816180 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 4,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_hscnoc_cnoc, &qns_llcc,
+		      &qns_pcie_east, &qns_pcie_west },
+};
+
+static struct qcom_icc_node qnm_pcie_east = {
+	.name = "qnm_pcie_east",
+	.channels = 1,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x93a000 },
+		.prio = 2,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 2,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_hscnoc_cnoc, &qns_llcc },
+};
+
+static struct qcom_icc_node qnm_pcie_west = {
+	.name = "qnm_pcie_west",
+	.channels = 1,
+	.buswidth = 64,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x721200 },
+		.prio = 2,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 2,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_hscnoc_cnoc, &qns_llcc },
+};
+
+static struct qcom_icc_node qnm_snoc_sf = {
+	.name = "qnm_snoc_sf",
+	.channels = 1,
+	.buswidth = 64,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x51f100 },
+		.prio = 2,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 4,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_hscnoc_cnoc, &qns_llcc,
+		      &qns_pcie_east, &qns_pcie_west },
+};
+
+static struct qcom_icc_node qxm_wlan_q6 = {
+	.name = "qxm_wlan_q6",
+	.channels = 1,
+	.buswidth = 8,
+	.num_links = 4,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_hscnoc_cnoc, &qns_llcc,
+		      &qns_pcie_east, &qns_pcie_west },
+};
+
+static struct qcom_icc_node qns_a4noc_hscnoc = {
+	.name = "qns_a4noc_hscnoc",
+	.channels = 1,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qnm_aggre_noc_east },
+};
+
+static struct qcom_icc_node qns_lpass_ag_noc_gemnoc = {
+	.name = "qns_lpass_ag_noc_gemnoc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qnm_lpass },
+};
+
+static struct qcom_icc_node qns_mem_noc_hf = {
+	.name = "qns_mem_noc_hf",
+	.channels = 2,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qnm_mnoc_hf },
+};
+
+static struct qcom_icc_node qns_mem_noc_sf = {
+	.name = "qns_mem_noc_sf",
+	.channels = 2,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qnm_mnoc_sf },
+};
+
+static struct qcom_icc_node qns_nsp_hscnoc = {
+	.name = "qns_nsp_hscnoc",
+	.channels = 4,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qnm_nsp_noc },
+};
+
+static struct qcom_icc_node qns_pcie_east_mem_noc = {
+	.name = "qns_pcie_east_mem_noc",
+	.channels = 1,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qnm_pcie_east },
+};
+
+static struct qcom_icc_node qns_pcie_west_mem_noc = {
+	.name = "qns_pcie_west_mem_noc",
+	.channels = 1,
+	.buswidth = 64,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qnm_pcie_west },
+};
+
+static struct qcom_icc_node qns_gemnoc_sf = {
+	.name = "qns_gemnoc_sf",
+	.channels = 1,
+	.buswidth = 64,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qnm_snoc_sf },
+};
+
+static struct qcom_icc_node xm_usb3_0 = {
+	.name = "xm_usb3_0",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xa000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_a4noc_hscnoc },
+};
+
+static struct qcom_icc_node xm_usb3_1 = {
+	.name = "xm_usb3_1",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xb000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_a4noc_hscnoc },
+};
+
+static struct qcom_icc_node xm_usb4_0 = {
+	.name = "xm_usb4_0",
+	.channels = 1,
+	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xc000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_a4noc_hscnoc },
+};
+
+static struct qcom_icc_node xm_usb4_1 = {
+	.name = "xm_usb4_1",
+	.channels = 1,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xd000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_a4noc_hscnoc },
+};
+
+static struct qcom_icc_node qnm_lpiaon_noc = {
+	.name = "qnm_lpiaon_noc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_lpass_ag_noc_gemnoc },
+};
+
+static struct qcom_icc_node qnm_av1_enc = {
+	.name = "qnm_av1_enc",
+	.channels = 1,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x30000 },
+		.prio = 4,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_camnoc_hf = {
+	.name = "qnm_camnoc_hf",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x29000, 0x2a000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_mem_noc_hf },
+};
+
+static struct qcom_icc_node qnm_camnoc_icp = {
+	.name = "qnm_camnoc_icp",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x2b000 },
+		.prio = 4,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_camnoc_sf = {
+	.name = "qnm_camnoc_sf",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x2c000, 0x2d000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_eva = {
+	.name = "qnm_eva",
+	.channels = 1,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x34000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_mdp = {
+	.name = "qnm_mdp",
+	.channels = 2,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x2e000, 0x2f000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_mem_noc_hf },
+};
+
+static struct qcom_icc_node qnm_vapss_hcp = {
+	.name = "qnm_vapss_hcp",
+	.channels = 1,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_video = {
+	.name = "qnm_video",
+	.channels = 4,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 4,
+		.port_offsets = { 0x31000, 0x32000, 0x37000, 0x38000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_video_cv_cpu = {
+	.name = "qnm_video_cv_cpu",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x33000 },
+		.prio = 4,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_video_v_cpu = {
+	.name = "qnm_video_v_cpu",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x35000 },
+		.prio = 4,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_node qnm_nsp = {
+	.name = "qnm_nsp",
+	.channels = 4,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_nsp_hscnoc },
+};
+
+static struct qcom_icc_node xm_pcie_0 = {
+	.name = "xm_pcie_0",
+	.channels = 1,
+	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xb000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_pcie_east_mem_noc },
+};
+
+static struct qcom_icc_node xm_pcie_1 = {
+	.name = "xm_pcie_1",
+	.channels = 1,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xc000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_pcie_east_mem_noc },
+};
+
+static struct qcom_icc_node xm_pcie_5 = {
+	.name = "xm_pcie_5",
+	.channels = 1,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xd000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_pcie_east_mem_noc },
+};
+
+static struct qcom_icc_node xm_pcie_2 = {
+	.name = "xm_pcie_2",
+	.channels = 1,
+	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xd000 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_pcie_west_mem_noc },
+};
+
+static struct qcom_icc_node xm_pcie_3a = {
+	.name = "xm_pcie_3a",
+	.channels = 1,
+	.buswidth = 64,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xd200 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_pcie_west_mem_noc },
+};
+
+static struct qcom_icc_node xm_pcie_3b = {
+	.name = "xm_pcie_3b",
+	.channels = 1,
+	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xd400 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_pcie_west_mem_noc },
+};
+
+static struct qcom_icc_node xm_pcie_4 = {
+	.name = "xm_pcie_4",
+	.channels = 1,
+	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xd600 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_pcie_west_mem_noc },
+};
+
+static struct qcom_icc_node xm_pcie_6 = {
+	.name = "xm_pcie_6",
+	.channels = 1,
+	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xd800 },
+		.prio = 2,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 0,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_pcie_west_mem_noc },
+};
+
+static struct qcom_icc_node qnm_aggre1_noc = {
+	.name = "qnm_aggre1_noc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_gemnoc_sf },
+};
+
+static struct qcom_icc_node qnm_aggre2_noc = {
+	.name = "qnm_aggre2_noc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_gemnoc_sf },
+};
+
+static struct qcom_icc_node qnm_aggre3_noc = {
+	.name = "qnm_aggre3_noc",
+	.channels = 1,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_gemnoc_sf },
+};
+
+static struct qcom_icc_node qnm_nsi_noc = {
+	.name = "qnm_nsi_noc",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x1c000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_gemnoc_sf },
+};
+
+static struct qcom_icc_node qnm_oobmss = {
+	.name = "qnm_oobmss",
+	.channels = 1,
+	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x1b000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_gemnoc_sf },
+};
+
+static struct qcom_icc_node qns_a1noc_snoc = {
+	.name = "qns_a1noc_snoc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qnm_aggre1_noc },
+};
+
+static struct qcom_icc_node qns_a2noc_snoc = {
+	.name = "qns_a2noc_snoc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qnm_aggre2_noc },
+};
+
+static struct qcom_icc_node qns_a3noc_snoc = {
+	.name = "qns_a3noc_snoc",
+	.channels = 1,
+	.buswidth = 32,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qnm_aggre3_noc },
+};
+
+static struct qcom_icc_node qns_lpass_aggnoc = {
+	.name = "qns_lpass_aggnoc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qnm_lpiaon_noc },
+};
+
+static struct qcom_icc_node qns_system_noc = {
+	.name = "qns_system_noc",
+	.channels = 1,
+	.buswidth = 8,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qnm_nsi_noc },
+};
+
+static struct qcom_icc_node qns_oobmss_snoc = {
+	.name = "qns_oobmss_snoc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qnm_oobmss },
+};
+
+static struct qcom_icc_node qxm_crypto = {
+	.name = "qxm_crypto",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xb000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node qxm_soccp = {
+	.name = "qxm_soccp",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xe000 },
+		.prio = 0,
+		.urg_fwd = 1,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node xm_qdss_etr_0 = {
+	.name = "xm_qdss_etr_0",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xc000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node xm_qdss_etr_1 = {
+	.name = "xm_qdss_etr_1",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xd000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_a1noc_snoc },
+};
+
+static struct qcom_icc_node xm_ufs_mem = {
+	.name = "xm_ufs_mem",
+	.channels = 1,
+	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xa000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_a2noc_snoc },
+};
+
+static struct qcom_icc_node xm_usb3_2 = {
+	.name = "xm_usb3_2",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x8000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_a2noc_snoc },
+};
+
+static struct qcom_icc_node xm_usb4_2 = {
+	.name = "xm_usb4_2",
+	.channels = 1,
+	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x9000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_a2noc_snoc },
+};
+
+static struct qcom_icc_node qhm_qspi = {
+	.name = "qhm_qspi",
+	.channels = 1,
+	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x10000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_a3noc_snoc },
+};
+
+static struct qcom_icc_node qhm_qup0 = {
+	.name = "qhm_qup0",
+	.channels = 1,
+	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x11000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_a3noc_snoc },
+};
+
+static struct qcom_icc_node qhm_qup1 = {
+	.name = "qhm_qup1",
+	.channels = 1,
+	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x12000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_a3noc_snoc },
+};
+
+static struct qcom_icc_node qhm_qup2 = {
+	.name = "qhm_qup2",
+	.channels = 1,
+	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x13000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_a3noc_snoc },
+};
+
+static struct qcom_icc_node qxm_sp = {
+	.name = "qxm_sp",
+	.channels = 1,
+	.buswidth = 8,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_a3noc_snoc },
+};
+
+static struct qcom_icc_node xm_sdc2 = {
+	.name = "xm_sdc2",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x18000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_a3noc_snoc },
+};
+
+static struct qcom_icc_node xm_sdc4 = {
+	.name = "xm_sdc4",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x14000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_a3noc_snoc },
+};
+
+static struct qcom_icc_node xm_usb2_0 = {
+	.name = "xm_usb2_0",
+	.channels = 1,
+	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x15000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_a3noc_snoc },
+};
+
+static struct qcom_icc_node xm_usb3_mp = {
+	.name = "xm_usb3_mp",
+	.channels = 1,
+	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x16000 },
+		.prio = 0,
+		.urg_fwd = 0,
+		.prio_fwd_disable = 1,
+	},
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_a3noc_snoc },
+};
+
+static struct qcom_icc_node qnm_lpass_lpinoc = {
+	.name = "qnm_lpass_lpinoc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_lpass_aggnoc },
+};
+
+static struct qcom_icc_node xm_cpucp = {
+	.name = "xm_cpucp",
+	.channels = 1,
+	.buswidth = 8,
+	.num_links = 2,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_system_noc, &srvc_nsinoc },
+};
+
+static struct qcom_icc_node xm_mem_sp = {
+	.name = "xm_mem_sp",
+	.channels = 1,
+	.buswidth = 8,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_oobmss_snoc },
+};
+
+static struct qcom_icc_node qns_lpi_aon_noc = {
+	.name = "qns_lpi_aon_noc",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qnm_lpass_lpinoc },
+};
+
+static struct qcom_icc_node qnm_lpinoc_dsp_qns4m = {
+	.name = "qnm_lpinoc_dsp_qns4m",
+	.channels = 1,
+	.buswidth = 16,
+	.num_links = 1,
+	.link_nodes = (struct qcom_icc_node *[]) { &qns_lpi_aon_noc },
+};
+
+static struct qcom_icc_bcm bcm_acv = {
+	.name = "ACV",
+	.enable_mask = BIT(3),
+	.num_nodes = 1,
+	.nodes = { &ebi },
+};
+
+static struct qcom_icc_bcm bcm_ce0 = {
+	.name = "CE0",
+	.num_nodes = 1,
+	.nodes = { &qxm_crypto },
+};
+
+static struct qcom_icc_bcm bcm_cn0 = {
+	.name = "CN0",
+	.keepalive = true,
+	.enable_mask = BIT(0),
+	.num_nodes = 60,
+	.nodes = { &qsm_cfg, &qhs_ahb2phy0,
+		   &qhs_ahb2phy1, &qhs_ahb2phy2,
+		   &qhs_ahb2phy3, &qhs_av1_enc_cfg,
+		   &qhs_camera_cfg, &qhs_clk_ctl,
+		   &qhs_crypto0_cfg, &qhs_gpuss_cfg,
+		   &qhs_imem_cfg, &qhs_pcie0_cfg,
+		   &qhs_pcie1_cfg, &qhs_pcie2_cfg,
+		   &qhs_pcie3a_cfg, &qhs_pcie3b_cfg,
+		   &qhs_pcie4_cfg, &qhs_pcie5_cfg,
+		   &qhs_pcie6_cfg, &qhs_pcie_rscc,
+		   &qhs_pdm, &qhs_prng,
+		   &qhs_qdss_cfg, &qhs_qspi,
+		   &qhs_qup0, &qhs_qup1,
+		   &qhs_qup2, &qhs_sdc2,
+		   &qhs_sdc4, &qhs_smmuv3_cfg,
+		   &qhs_tcsr, &qhs_tlmm,
+		   &qhs_ufs_mem_cfg, &qhs_usb2_0_cfg,
+		   &qhs_usb3_0_cfg, &qhs_usb3_1_cfg,
+		   &qhs_usb3_2_cfg, &qhs_usb3_mp_cfg,
+		   &qhs_usb4_0_cfg, &qhs_usb4_1_cfg,
+		   &qhs_usb4_2_cfg, &qhs_venus_cfg,
+		   &qss_cnoc_pcie_slave_east_cfg, &qss_cnoc_pcie_slave_west_cfg,
+		   &qss_lpass_qtb_cfg, &qss_mnoc_cfg,
+		   &qss_nsp_qtb_cfg, &qss_pcie_east_anoc_cfg,
+		   &qss_pcie_west_anoc_cfg, &xs_qdss_stm,
+		   &xs_sys_tcu_cfg, &qnm_hscnoc_cnoc,
+		   &qhs_aoss, &qhs_ipc_router,
+		   &qhs_soccp, &qhs_tme_cfg,
+		   &qns_apss, &qss_cfg,
+		   &qxs_boot_imem, &qxs_imem },
+};
+
+static struct qcom_icc_bcm bcm_cn1 = {
+	.name = "CN1",
+	.num_nodes = 1,
+	.nodes = { &qhs_display_cfg },
+};
+
+static struct qcom_icc_bcm bcm_co0 = {
+	.name = "CO0",
+	.enable_mask = BIT(0),
+	.num_nodes = 2,
+	.nodes = { &qnm_nsp, &qns_nsp_hscnoc },
+};
+
+static struct qcom_icc_bcm bcm_lp0 = {
+	.name = "LP0",
+	.num_nodes = 2,
+	.nodes = { &qnm_lpass_lpinoc, &qns_lpass_aggnoc },
+};
+
+static struct qcom_icc_bcm bcm_mc0 = {
+	.name = "MC0",
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &ebi },
+};
+
+static struct qcom_icc_bcm bcm_mm0 = {
+	.name = "MM0",
+	.num_nodes = 1,
+	.nodes = { &qns_mem_noc_hf },
+};
+
+static struct qcom_icc_bcm bcm_mm1 = {
+	.name = "MM1",
+	.enable_mask = BIT(0),
+	.num_nodes = 11,
+	.nodes = { &qnm_av1_enc, &qnm_camnoc_hf,
+		   &qnm_camnoc_icp, &qnm_camnoc_sf,
+		   &qnm_eva, &qnm_mdp,
+		   &qnm_vapss_hcp, &qnm_video,
+		   &qnm_video_cv_cpu, &qnm_video_v_cpu,
+		   &qns_mem_noc_sf },
+};
+
+static struct qcom_icc_bcm bcm_qup0 = {
+	.name = "QUP0",
+	.vote_scale = 1,
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qup0_core_slave },
+};
+
+static struct qcom_icc_bcm bcm_qup1 = {
+	.name = "QUP1",
+	.vote_scale = 1,
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qup1_core_slave },
+};
+
+static struct qcom_icc_bcm bcm_qup2 = {
+	.name = "QUP2",
+	.vote_scale = 1,
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qup2_core_slave },
+};
+
+static struct qcom_icc_bcm bcm_sh0 = {
+	.name = "SH0",
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qns_llcc },
+};
+
+static struct qcom_icc_bcm bcm_sh1 = {
+	.name = "SH1",
+	.enable_mask = BIT(0),
+	.num_nodes = 18,
+	.nodes = { &alm_gpu_tcu, &alm_pcie_qtc,
+		   &alm_sys_tcu, &chm_apps,
+		   &qnm_aggre_noc_east, &qnm_gpu,
+		   &qnm_lpass, &qnm_mnoc_hf,
+		   &qnm_mnoc_sf, &qnm_nsp_noc,
+		   &qnm_pcie_east, &qnm_pcie_west,
+		   &qnm_snoc_sf, &qxm_wlan_q6,
+		   &xm_gic, &qns_hscnoc_cnoc,
+		   &qns_pcie_east, &qns_pcie_west },
+};
+
+static struct qcom_icc_bcm bcm_sn0 = {
+	.name = "SN0",
+	.keepalive = true,
+	.num_nodes = 1,
+	.nodes = { &qns_gemnoc_sf },
+};
+
+static struct qcom_icc_bcm bcm_sn1 = {
+	.name = "SN1",
+	.enable_mask = BIT(0),
+	.num_nodes = 1,
+	.nodes = { &qnm_oobmss },
+};
+
+static struct qcom_icc_bcm bcm_sn2 = {
+	.name = "SN2",
+	.num_nodes = 1,
+	.nodes = { &qnm_aggre1_noc },
+};
+
+static struct qcom_icc_bcm bcm_sn3 = {
+	.name = "SN3",
+	.num_nodes = 1,
+	.nodes = { &qnm_aggre2_noc },
+};
+
+static struct qcom_icc_bcm bcm_sn4 = {
+	.name = "SN4",
+	.num_nodes = 1,
+	.nodes = { &qnm_aggre3_noc },
+};
+
+static struct qcom_icc_bcm bcm_sn5 = {
+	.name = "SN5",
+	.num_nodes = 1,
+	.nodes = { &qns_a4noc_hscnoc },
+};
+
+static struct qcom_icc_bcm bcm_sn6 = {
+	.name = "SN6",
+	.num_nodes = 4,
+	.nodes = { &qns_pcie_east_mem_noc, &qnm_hscnoc_pcie_east,
+		   &qns_pcie_west_mem_noc, &qnm_hscnoc_pcie_west },
+};
+
+static struct qcom_icc_bcm * const aggre1_noc_bcms[] = {
+	&bcm_ce0,
+};
+
+static struct qcom_icc_node * const aggre1_noc_nodes[] = {
+	[MASTER_CRYPTO] = &qxm_crypto,
+	[MASTER_SOCCP_PROC] = &qxm_soccp,
+	[MASTER_QDSS_ETR] = &xm_qdss_etr_0,
+	[MASTER_QDSS_ETR_1] = &xm_qdss_etr_1,
+	[SLAVE_A1NOC_SNOC] = &qns_a1noc_snoc,
+};
+
+static const struct regmap_config glymur_aggre1_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x14400,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc glymur_aggre1_noc = {
+	.config = &glymur_aggre1_noc_regmap_config,
+	.nodes = aggre1_noc_nodes,
+	.num_nodes = ARRAY_SIZE(aggre1_noc_nodes),
+	.bcms = aggre1_noc_bcms,
+	.num_bcms = ARRAY_SIZE(aggre1_noc_bcms),
+	.alloc_dyn_id = true,
+};
+
+static struct qcom_icc_node * const aggre2_noc_nodes[] = {
+	[MASTER_UFS_MEM] = &xm_ufs_mem,
+	[MASTER_USB3_2] = &xm_usb3_2,
+	[MASTER_USB4_2] = &xm_usb4_2,
+	[SLAVE_A2NOC_SNOC] = &qns_a2noc_snoc,
+};
+
+static const struct regmap_config glymur_aggre2_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x14400,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc glymur_aggre2_noc = {
+	.config = &glymur_aggre2_noc_regmap_config,
+	.nodes = aggre2_noc_nodes,
+	.num_nodes = ARRAY_SIZE(aggre2_noc_nodes),
+	.alloc_dyn_id = true,
+	.qos_requires_clocks = true,
+};
+
+static struct qcom_icc_node * const aggre3_noc_nodes[] = {
+	[MASTER_QSPI_0] = &qhm_qspi,
+	[MASTER_QUP_0] = &qhm_qup0,
+	[MASTER_QUP_1] = &qhm_qup1,
+	[MASTER_QUP_2] = &qhm_qup2,
+	[MASTER_SP] = &qxm_sp,
+	[MASTER_SDCC_2] = &xm_sdc2,
+	[MASTER_SDCC_4] = &xm_sdc4,
+	[MASTER_USB2] = &xm_usb2_0,
+	[MASTER_USB3_MP] = &xm_usb3_mp,
+	[SLAVE_A3NOC_SNOC] = &qns_a3noc_snoc,
+};
+
+static const struct regmap_config glymur_aggre3_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1d400,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc glymur_aggre3_noc = {
+	.config = &glymur_aggre3_noc_regmap_config,
+	.nodes = aggre3_noc_nodes,
+	.num_nodes = ARRAY_SIZE(aggre3_noc_nodes),
+	.alloc_dyn_id = true,
+};
+
+static struct qcom_icc_bcm * const aggre4_noc_bcms[] = {
+	&bcm_sn5,
+};
+
+static struct qcom_icc_node * const aggre4_noc_nodes[] = {
+	[MASTER_USB3_0] = &xm_usb3_0,
+	[MASTER_USB3_1] = &xm_usb3_1,
+	[MASTER_USB4_0] = &xm_usb4_0,
+	[MASTER_USB4_1] = &xm_usb4_1,
+	[SLAVE_A4NOC_HSCNOC] = &qns_a4noc_hscnoc,
+};
+
+static const struct regmap_config glymur_aggre4_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x14400,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc glymur_aggre4_noc = {
+	.config = &glymur_aggre4_noc_regmap_config,
+	.nodes = aggre4_noc_nodes,
+	.num_nodes = ARRAY_SIZE(aggre4_noc_nodes),
+	.bcms = aggre4_noc_bcms,
+	.num_bcms = ARRAY_SIZE(aggre4_noc_bcms),
+	.alloc_dyn_id = true,
+	.qos_requires_clocks = true,
+};
+
+static struct qcom_icc_bcm * const clk_virt_bcms[] = {
+	&bcm_qup0,
+	&bcm_qup1,
+	&bcm_qup2,
+};
+
+static struct qcom_icc_node * const clk_virt_nodes[] = {
+	[MASTER_QUP_CORE_0] = &qup0_core_master,
+	[MASTER_QUP_CORE_1] = &qup1_core_master,
+	[MASTER_QUP_CORE_2] = &qup2_core_master,
+	[SLAVE_QUP_CORE_0] = &qup0_core_slave,
+	[SLAVE_QUP_CORE_1] = &qup1_core_slave,
+	[SLAVE_QUP_CORE_2] = &qup2_core_slave,
+};
+
+static const struct qcom_icc_desc glymur_clk_virt = {
+	.nodes = clk_virt_nodes,
+	.num_nodes = ARRAY_SIZE(clk_virt_nodes),
+	.bcms = clk_virt_bcms,
+	.num_bcms = ARRAY_SIZE(clk_virt_bcms),
+	.alloc_dyn_id = true,
+};
+
+static struct qcom_icc_bcm * const cnoc_cfg_bcms[] = {
+	&bcm_cn0,
+	&bcm_cn1,
+};
+
+static struct qcom_icc_node * const cnoc_cfg_nodes[] = {
+	[MASTER_CNOC_CFG] = &qsm_cfg,
+	[SLAVE_AHB2PHY_SOUTH] = &qhs_ahb2phy0,
+	[SLAVE_AHB2PHY_NORTH] = &qhs_ahb2phy1,
+	[SLAVE_AHB2PHY_2] = &qhs_ahb2phy2,
+	[SLAVE_AHB2PHY_3] = &qhs_ahb2phy3,
+	[SLAVE_AV1_ENC_CFG] = &qhs_av1_enc_cfg,
+	[SLAVE_CAMERA_CFG] = &qhs_camera_cfg,
+	[SLAVE_CLK_CTL] = &qhs_clk_ctl,
+	[SLAVE_CRYPTO_0_CFG] = &qhs_crypto0_cfg,
+	[SLAVE_DISPLAY_CFG] = &qhs_display_cfg,
+	[SLAVE_GFX3D_CFG] = &qhs_gpuss_cfg,
+	[SLAVE_IMEM_CFG] = &qhs_imem_cfg,
+	[SLAVE_PCIE_0_CFG] = &qhs_pcie0_cfg,
+	[SLAVE_PCIE_1_CFG] = &qhs_pcie1_cfg,
+	[SLAVE_PCIE_2_CFG] = &qhs_pcie2_cfg,
+	[SLAVE_PCIE_3A_CFG] = &qhs_pcie3a_cfg,
+	[SLAVE_PCIE_3B_CFG] = &qhs_pcie3b_cfg,
+	[SLAVE_PCIE_4_CFG] = &qhs_pcie4_cfg,
+	[SLAVE_PCIE_5_CFG] = &qhs_pcie5_cfg,
+	[SLAVE_PCIE_6_CFG] = &qhs_pcie6_cfg,
+	[SLAVE_PCIE_RSCC] = &qhs_pcie_rscc,
+	[SLAVE_PDM] = &qhs_pdm,
+	[SLAVE_PRNG] = &qhs_prng,
+	[SLAVE_QDSS_CFG] = &qhs_qdss_cfg,
+	[SLAVE_QSPI_0] = &qhs_qspi,
+	[SLAVE_QUP_0] = &qhs_qup0,
+	[SLAVE_QUP_1] = &qhs_qup1,
+	[SLAVE_QUP_2] = &qhs_qup2,
+	[SLAVE_SDCC_2] = &qhs_sdc2,
+	[SLAVE_SDCC_4] = &qhs_sdc4,
+	[SLAVE_SMMUV3_CFG] = &qhs_smmuv3_cfg,
+	[SLAVE_TCSR] = &qhs_tcsr,
+	[SLAVE_TLMM] = &qhs_tlmm,
+	[SLAVE_UFS_MEM_CFG] = &qhs_ufs_mem_cfg,
+	[SLAVE_USB2] = &qhs_usb2_0_cfg,
+	[SLAVE_USB3_0] = &qhs_usb3_0_cfg,
+	[SLAVE_USB3_1] = &qhs_usb3_1_cfg,
+	[SLAVE_USB3_2] = &qhs_usb3_2_cfg,
+	[SLAVE_USB3_MP] = &qhs_usb3_mp_cfg,
+	[SLAVE_USB4_0] = &qhs_usb4_0_cfg,
+	[SLAVE_USB4_1] = &qhs_usb4_1_cfg,
+	[SLAVE_USB4_2] = &qhs_usb4_2_cfg,
+	[SLAVE_VENUS_CFG] = &qhs_venus_cfg,
+	[SLAVE_CNOC_PCIE_SLAVE_EAST_CFG] = &qss_cnoc_pcie_slave_east_cfg,
+	[SLAVE_CNOC_PCIE_SLAVE_WEST_CFG] = &qss_cnoc_pcie_slave_west_cfg,
+	[SLAVE_LPASS_QTB_CFG] = &qss_lpass_qtb_cfg,
+	[SLAVE_CNOC_MNOC_CFG] = &qss_mnoc_cfg,
+	[SLAVE_NSP_QTB_CFG] = &qss_nsp_qtb_cfg,
+	[SLAVE_PCIE_EAST_ANOC_CFG] = &qss_pcie_east_anoc_cfg,
+	[SLAVE_PCIE_WEST_ANOC_CFG] = &qss_pcie_west_anoc_cfg,
+	[SLAVE_QDSS_STM] = &xs_qdss_stm,
+	[SLAVE_TCU] = &xs_sys_tcu_cfg,
+};
+
+static const struct regmap_config glymur_cnoc_cfg_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x6600,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc glymur_cnoc_cfg = {
+	.config = &glymur_cnoc_cfg_regmap_config,
+	.nodes = cnoc_cfg_nodes,
+	.num_nodes = ARRAY_SIZE(cnoc_cfg_nodes),
+	.bcms = cnoc_cfg_bcms,
+	.num_bcms = ARRAY_SIZE(cnoc_cfg_bcms),
+	.alloc_dyn_id = true,
+};
+
+static struct qcom_icc_bcm * const cnoc_main_bcms[] = {
+	&bcm_cn0,
+};
+
+static struct qcom_icc_node * const cnoc_main_nodes[] = {
+	[MASTER_HSCNOC_CNOC] = &qnm_hscnoc_cnoc,
+	[SLAVE_AOSS] = &qhs_aoss,
+	[SLAVE_IPC_ROUTER_CFG] = &qhs_ipc_router,
+	[SLAVE_SOCCP] = &qhs_soccp,
+	[SLAVE_TME_CFG] = &qhs_tme_cfg,
+	[SLAVE_APPSS] = &qns_apss,
+	[SLAVE_CNOC_CFG] = &qss_cfg,
+	[SLAVE_BOOT_IMEM] = &qxs_boot_imem,
+	[SLAVE_IMEM] = &qxs_imem,
+};
+
+static const struct regmap_config glymur_cnoc_main_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x17080,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc glymur_cnoc_main = {
+	.config = &glymur_cnoc_main_regmap_config,
+	.nodes = cnoc_main_nodes,
+	.num_nodes = ARRAY_SIZE(cnoc_main_nodes),
+	.bcms = cnoc_main_bcms,
+	.num_bcms = ARRAY_SIZE(cnoc_main_bcms),
+	.alloc_dyn_id = true,
+};
+
+static struct qcom_icc_bcm * const hscnoc_bcms[] = {
+	&bcm_sh0,
+	&bcm_sh1,
+};
+
+static struct qcom_icc_node * const hscnoc_nodes[] = {
+	[MASTER_GPU_TCU] = &alm_gpu_tcu,
+	[MASTER_PCIE_TCU] = &alm_pcie_qtc,
+	[MASTER_SYS_TCU] = &alm_sys_tcu,
+	[MASTER_APPSS_PROC] = &chm_apps,
+	[MASTER_AGGRE_NOC_EAST] = &qnm_aggre_noc_east,
+	[MASTER_GFX3D] = &qnm_gpu,
+	[MASTER_LPASS_GEM_NOC] = &qnm_lpass,
+	[MASTER_MNOC_HF_MEM_NOC] = &qnm_mnoc_hf,
+	[MASTER_MNOC_SF_MEM_NOC] = &qnm_mnoc_sf,
+	[MASTER_COMPUTE_NOC] = &qnm_nsp_noc,
+	[MASTER_PCIE_EAST] = &qnm_pcie_east,
+	[MASTER_PCIE_WEST] = &qnm_pcie_west,
+	[MASTER_SNOC_SF_MEM_NOC] = &qnm_snoc_sf,
+	[MASTER_WLAN_Q6] = &qxm_wlan_q6,
+	[MASTER_GIC] = &xm_gic,
+	[SLAVE_HSCNOC_CNOC] = &qns_hscnoc_cnoc,
+	[SLAVE_LLCC] = &qns_llcc,
+	[SLAVE_PCIE_EAST] = &qns_pcie_east,
+	[SLAVE_PCIE_WEST] = &qns_pcie_west,
+};
+
+static const struct regmap_config glymur_hscnoc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x93a080,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc glymur_hscnoc = {
+	.config = &glymur_hscnoc_regmap_config,
+	.nodes = hscnoc_nodes,
+	.num_nodes = ARRAY_SIZE(hscnoc_nodes),
+	.bcms = hscnoc_bcms,
+	.num_bcms = ARRAY_SIZE(hscnoc_bcms),
+	.alloc_dyn_id = true,
+};
+
+static struct qcom_icc_node * const lpass_ag_noc_nodes[] = {
+	[MASTER_LPIAON_NOC] = &qnm_lpiaon_noc,
+	[SLAVE_LPASS_GEM_NOC] = &qns_lpass_ag_noc_gemnoc,
+};
+
+static const struct regmap_config glymur_lpass_ag_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xe080,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc glymur_lpass_ag_noc = {
+	.config = &glymur_lpass_ag_noc_regmap_config,
+	.nodes = lpass_ag_noc_nodes,
+	.num_nodes = ARRAY_SIZE(lpass_ag_noc_nodes),
+	.alloc_dyn_id = true,
+};
+
+static struct qcom_icc_bcm * const lpass_lpiaon_noc_bcms[] = {
+	&bcm_lp0,
+};
+
+static struct qcom_icc_node * const lpass_lpiaon_noc_nodes[] = {
+	[MASTER_LPASS_LPINOC] = &qnm_lpass_lpinoc,
+	[SLAVE_LPIAON_NOC_LPASS_AG_NOC] = &qns_lpass_aggnoc,
+};
+
+static const struct regmap_config glymur_lpass_lpiaon_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x19080,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc glymur_lpass_lpiaon_noc = {
+	.config = &glymur_lpass_lpiaon_noc_regmap_config,
+	.nodes = lpass_lpiaon_noc_nodes,
+	.num_nodes = ARRAY_SIZE(lpass_lpiaon_noc_nodes),
+	.bcms = lpass_lpiaon_noc_bcms,
+	.num_bcms = ARRAY_SIZE(lpass_lpiaon_noc_bcms),
+	.alloc_dyn_id = true,
+};
+
+static struct qcom_icc_node * const lpass_lpicx_noc_nodes[] = {
+	[MASTER_LPASS_PROC] = &qnm_lpinoc_dsp_qns4m,
+	[SLAVE_LPICX_NOC_LPIAON_NOC] = &qns_lpi_aon_noc,
+};
+
+static const struct regmap_config glymur_lpass_lpicx_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x44080,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc glymur_lpass_lpicx_noc = {
+	.config = &glymur_lpass_lpicx_noc_regmap_config,
+	.nodes = lpass_lpicx_noc_nodes,
+	.num_nodes = ARRAY_SIZE(lpass_lpicx_noc_nodes),
+	.alloc_dyn_id = true,
+};
+
+static struct qcom_icc_bcm * const mc_virt_bcms[] = {
+	&bcm_acv,
+	&bcm_mc0,
+};
+
+static struct qcom_icc_node * const mc_virt_nodes[] = {
+	[MASTER_LLCC] = &llcc_mc,
+	[SLAVE_EBI1] = &ebi,
+};
+
+static const struct qcom_icc_desc glymur_mc_virt = {
+	.nodes = mc_virt_nodes,
+	.num_nodes = ARRAY_SIZE(mc_virt_nodes),
+	.bcms = mc_virt_bcms,
+	.num_bcms = ARRAY_SIZE(mc_virt_bcms),
+	.alloc_dyn_id = true,
+};
+
+static struct qcom_icc_bcm * const mmss_noc_bcms[] = {
+	&bcm_mm0,
+	&bcm_mm1,
+};
+
+static struct qcom_icc_node * const mmss_noc_nodes[] = {
+	[MASTER_AV1_ENC] = &qnm_av1_enc,
+	[MASTER_CAMNOC_HF] = &qnm_camnoc_hf,
+	[MASTER_CAMNOC_ICP] = &qnm_camnoc_icp,
+	[MASTER_CAMNOC_SF] = &qnm_camnoc_sf,
+	[MASTER_EVA] = &qnm_eva,
+	[MASTER_MDP] = &qnm_mdp,
+	[MASTER_CDSP_HCP] = &qnm_vapss_hcp,
+	[MASTER_VIDEO] = &qnm_video,
+	[MASTER_VIDEO_CV_PROC] = &qnm_video_cv_cpu,
+	[MASTER_VIDEO_V_PROC] = &qnm_video_v_cpu,
+	[MASTER_CNOC_MNOC_CFG] = &qsm_mnoc_cfg,
+	[SLAVE_MNOC_HF_MEM_NOC] = &qns_mem_noc_hf,
+	[SLAVE_MNOC_SF_MEM_NOC] = &qns_mem_noc_sf,
+	[SLAVE_SERVICE_MNOC] = &srvc_mnoc,
+};
+
+static const struct regmap_config glymur_mmss_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x5b800,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc glymur_mmss_noc = {
+	.config = &glymur_mmss_noc_regmap_config,
+	.nodes = mmss_noc_nodes,
+	.num_nodes = ARRAY_SIZE(mmss_noc_nodes),
+	.bcms = mmss_noc_bcms,
+	.num_bcms = ARRAY_SIZE(mmss_noc_bcms),
+	.alloc_dyn_id = true,
+};
+
+static struct qcom_icc_node * const nsinoc_nodes[] = {
+	[MASTER_CPUCP] = &xm_cpucp,
+	[SLAVE_NSINOC_SYSTEM_NOC] = &qns_system_noc,
+	[SLAVE_SERVICE_NSINOC] = &srvc_nsinoc,
+};
+
+static const struct regmap_config glymur_nsinoc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x14080,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc glymur_nsinoc = {
+	.config = &glymur_nsinoc_regmap_config,
+	.nodes = nsinoc_nodes,
+	.num_nodes = ARRAY_SIZE(nsinoc_nodes),
+	.alloc_dyn_id = true,
+};
+
+static struct qcom_icc_bcm * const nsp_noc_bcms[] = {
+	&bcm_co0,
+};
+
+static struct qcom_icc_node * const nsp_noc_nodes[] = {
+	[MASTER_CDSP_PROC] = &qnm_nsp,
+	[SLAVE_NSP0_HSC_NOC] = &qns_nsp_hscnoc,
+};
+
+static const struct regmap_config glymur_nsp_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x21280,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc glymur_nsp_noc = {
+	.config = &glymur_nsp_noc_regmap_config,
+	.nodes = nsp_noc_nodes,
+	.num_nodes = ARRAY_SIZE(nsp_noc_nodes),
+	.bcms = nsp_noc_bcms,
+	.num_bcms = ARRAY_SIZE(nsp_noc_bcms),
+	.alloc_dyn_id = true,
+};
+
+static struct qcom_icc_node * const oobm_ss_noc_nodes[] = {
+	[MASTER_OOBMSS_SP_PROC] = &xm_mem_sp,
+	[SLAVE_OOBMSS_SNOC] = &qns_oobmss_snoc,
+};
+
+static const struct regmap_config glymur_oobm_ss_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1e080,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc glymur_oobm_ss_noc = {
+	.config = &glymur_oobm_ss_noc_regmap_config,
+	.nodes = oobm_ss_noc_nodes,
+	.num_nodes = ARRAY_SIZE(oobm_ss_noc_nodes),
+	.alloc_dyn_id = true,
+};
+
+static struct qcom_icc_bcm * const pcie_east_anoc_bcms[] = {
+	&bcm_sn6,
+};
+
+static struct qcom_icc_node * const pcie_east_anoc_nodes[] = {
+	[MASTER_PCIE_EAST_ANOC_CFG] = &qsm_pcie_east_anoc_cfg,
+	[MASTER_PCIE_0] = &xm_pcie_0,
+	[MASTER_PCIE_1] = &xm_pcie_1,
+	[MASTER_PCIE_5] = &xm_pcie_5,
+	[SLAVE_PCIE_EAST_MEM_NOC] = &qns_pcie_east_mem_noc,
+	[SLAVE_SERVICE_PCIE_EAST_AGGRE_NOC] = &srvc_pcie_east_aggre_noc,
+};
+
+static const struct regmap_config glymur_pcie_east_anoc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xf300,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc glymur_pcie_east_anoc = {
+	.config = &glymur_pcie_east_anoc_regmap_config,
+	.nodes = pcie_east_anoc_nodes,
+	.num_nodes = ARRAY_SIZE(pcie_east_anoc_nodes),
+	.bcms = pcie_east_anoc_bcms,
+	.num_bcms = ARRAY_SIZE(pcie_east_anoc_bcms),
+	.alloc_dyn_id = true,
+	.qos_requires_clocks = true,
+};
+
+static struct qcom_icc_bcm * const pcie_east_slv_noc_bcms[] = {
+	&bcm_sn6,
+};
+
+static struct qcom_icc_node * const pcie_east_slv_noc_nodes[] = {
+	[MASTER_HSCNOC_PCIE_EAST] = &qnm_hscnoc_pcie_east,
+	[MASTER_CNOC_PCIE_EAST_SLAVE_CFG] = &qsm_cnoc_pcie_east_slave_cfg,
+	[SLAVE_HSCNOC_PCIE_EAST_MS_MPU_CFG] = &qhs_hscnoc_pcie_east_ms_mpu_cfg,
+	[SLAVE_SERVICE_PCIE_EAST] = &srvc_pcie_east,
+	[SLAVE_PCIE_0] = &xs_pcie_0,
+	[SLAVE_PCIE_1] = &xs_pcie_1,
+	[SLAVE_PCIE_5] = &xs_pcie_5,
+};
+
+static const struct regmap_config glymur_pcie_east_slv_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xe080,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc glymur_pcie_east_slv_noc = {
+	.config = &glymur_pcie_east_slv_noc_regmap_config,
+	.nodes = pcie_east_slv_noc_nodes,
+	.num_nodes = ARRAY_SIZE(pcie_east_slv_noc_nodes),
+	.bcms = pcie_east_slv_noc_bcms,
+	.num_bcms = ARRAY_SIZE(pcie_east_slv_noc_bcms),
+	.alloc_dyn_id = true,
+};
+
+static struct qcom_icc_bcm * const pcie_west_anoc_bcms[] = {
+	&bcm_sn6,
+};
+
+static struct qcom_icc_node * const pcie_west_anoc_nodes[] = {
+	[MASTER_PCIE_WEST_ANOC_CFG] = &qsm_pcie_west_anoc_cfg,
+	[MASTER_PCIE_2] = &xm_pcie_2,
+	[MASTER_PCIE_3A] = &xm_pcie_3a,
+	[MASTER_PCIE_3B] = &xm_pcie_3b,
+	[MASTER_PCIE_4] = &xm_pcie_4,
+	[MASTER_PCIE_6] = &xm_pcie_6,
+	[SLAVE_PCIE_WEST_MEM_NOC] = &qns_pcie_west_mem_noc,
+	[SLAVE_SERVICE_PCIE_WEST_AGGRE_NOC] = &srvc_pcie_west_aggre_noc,
+};
+
+static const struct regmap_config glymur_pcie_west_anoc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xf580,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc glymur_pcie_west_anoc = {
+	.config = &glymur_pcie_west_anoc_regmap_config,
+	.nodes = pcie_west_anoc_nodes,
+	.num_nodes = ARRAY_SIZE(pcie_west_anoc_nodes),
+	.bcms = pcie_west_anoc_bcms,
+	.num_bcms = ARRAY_SIZE(pcie_west_anoc_bcms),
+	.alloc_dyn_id = true,
+	.qos_requires_clocks = true,
+};
+
+static struct qcom_icc_bcm * const pcie_west_slv_noc_bcms[] = {
+	&bcm_sn6,
+};
+
+static struct qcom_icc_node * const pcie_west_slv_noc_nodes[] = {
+	[MASTER_HSCNOC_PCIE_WEST] = &qnm_hscnoc_pcie_west,
+	[MASTER_CNOC_PCIE_WEST_SLAVE_CFG] = &qsm_cnoc_pcie_west_slave_cfg,
+	[SLAVE_HSCNOC_PCIE_WEST_MS_MPU_CFG] = &qhs_hscnoc_pcie_west_ms_mpu_cfg,
+	[SLAVE_SERVICE_PCIE_WEST] = &srvc_pcie_west,
+	[SLAVE_PCIE_2] = &xs_pcie_2,
+	[SLAVE_PCIE_3A] = &xs_pcie_3a,
+	[SLAVE_PCIE_3B] = &xs_pcie_3b,
+	[SLAVE_PCIE_4] = &xs_pcie_4,
+	[SLAVE_PCIE_6] = &xs_pcie_6,
+};
+
+static const struct regmap_config glymur_pcie_west_slv_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xf180,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc glymur_pcie_west_slv_noc = {
+	.config = &glymur_pcie_west_slv_noc_regmap_config,
+	.nodes = pcie_west_slv_noc_nodes,
+	.num_nodes = ARRAY_SIZE(pcie_west_slv_noc_nodes),
+	.bcms = pcie_west_slv_noc_bcms,
+	.num_bcms = ARRAY_SIZE(pcie_west_slv_noc_bcms),
+	.alloc_dyn_id = true,
+};
+
+static struct qcom_icc_bcm * const system_noc_bcms[] = {
+	&bcm_sn0,
+	&bcm_sn1,
+	&bcm_sn2,
+	&bcm_sn3,
+	&bcm_sn4,
+};
+
+static struct qcom_icc_node * const system_noc_nodes[] = {
+	[MASTER_A1NOC_SNOC] = &qnm_aggre1_noc,
+	[MASTER_A2NOC_SNOC] = &qnm_aggre2_noc,
+	[MASTER_A3NOC_SNOC] = &qnm_aggre3_noc,
+	[MASTER_NSINOC_SNOC] = &qnm_nsi_noc,
+	[MASTER_OOBMSS] = &qnm_oobmss,
+	[SLAVE_SNOC_GEM_NOC_SF] = &qns_gemnoc_sf,
+};
+
+static const struct regmap_config glymur_system_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1c080,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc glymur_system_noc = {
+	.config = &glymur_system_noc_regmap_config,
+	.nodes = system_noc_nodes,
+	.num_nodes = ARRAY_SIZE(system_noc_nodes),
+	.bcms = system_noc_bcms,
+	.num_bcms = ARRAY_SIZE(system_noc_bcms),
+	.alloc_dyn_id = true,
+};
+
+static const struct of_device_id qnoc_of_match[] = {
+	{ .compatible = "qcom,glymur-aggre1-noc", .data = &glymur_aggre1_noc},
+	{ .compatible = "qcom,glymur-aggre2-noc", .data = &glymur_aggre2_noc},
+	{ .compatible = "qcom,glymur-aggre3-noc", .data = &glymur_aggre3_noc},
+	{ .compatible = "qcom,glymur-aggre4-noc", .data = &glymur_aggre4_noc},
+	{ .compatible = "qcom,glymur-clk-virt", .data = &glymur_clk_virt},
+	{ .compatible = "qcom,glymur-cnoc-cfg", .data = &glymur_cnoc_cfg},
+	{ .compatible = "qcom,glymur-cnoc-main", .data = &glymur_cnoc_main},
+	{ .compatible = "qcom,glymur-hscnoc", .data = &glymur_hscnoc},
+	{ .compatible = "qcom,glymur-lpass-ag-noc", .data = &glymur_lpass_ag_noc},
+	{ .compatible = "qcom,glymur-lpass-lpiaon-noc", .data = &glymur_lpass_lpiaon_noc},
+	{ .compatible = "qcom,glymur-lpass-lpicx-noc", .data = &glymur_lpass_lpicx_noc},
+	{ .compatible = "qcom,glymur-mc-virt", .data = &glymur_mc_virt},
+	{ .compatible = "qcom,glymur-mmss-noc", .data = &glymur_mmss_noc},
+	{ .compatible = "qcom,glymur-nsinoc", .data = &glymur_nsinoc},
+	{ .compatible = "qcom,glymur-nsp-noc", .data = &glymur_nsp_noc},
+	{ .compatible = "qcom,glymur-oobm-ss-noc", .data = &glymur_oobm_ss_noc},
+	{ .compatible = "qcom,glymur-pcie-east-anoc", .data = &glymur_pcie_east_anoc},
+	{ .compatible = "qcom,glymur-pcie-east-slv-noc", .data = &glymur_pcie_east_slv_noc},
+	{ .compatible = "qcom,glymur-pcie-west-anoc", .data = &glymur_pcie_west_anoc},
+	{ .compatible = "qcom,glymur-pcie-west-slv-noc", .data = &glymur_pcie_west_slv_noc},
+	{ .compatible = "qcom,glymur-system-noc", .data = &glymur_system_noc},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qnoc_of_match);
+
+static struct platform_driver qnoc_driver = {
+	.probe = qcom_icc_rpmh_probe,
+	.remove = qcom_icc_rpmh_remove,
+	.driver = {
+		.name = "qnoc-glymur",
+		.of_match_table = qnoc_of_match,
+		.sync_state = icc_sync_state,
+	},
+};
+
+static int __init qnoc_driver_init(void)
+{
+	return platform_driver_register(&qnoc_driver);
+}
+core_initcall(qnoc_driver_init);
+
+static void __exit qnoc_driver_exit(void)
+{
+	platform_driver_unregister(&qnoc_driver);
+}
+module_exit(qnoc_driver_exit);
+
+MODULE_DESCRIPTION("GLYMUR NoC driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0


