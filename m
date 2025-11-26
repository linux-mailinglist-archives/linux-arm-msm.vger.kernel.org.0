Return-Path: <linux-arm-msm+bounces-83439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFBDC89259
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 10:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 492C33ACA05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128F22FFDDC;
	Wed, 26 Nov 2025 09:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4lWZxwD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jjigxodf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581182FFDF7
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764151061; cv=none; b=oRNi3W+8BDqCwfKYxiftdpUvNLYM5P76BtuBRLYoPOQPvJwxnUWXXlw2EkEMtoYHIVq9OS9j/EY4fZqYX0estMXilo4qmgd7Yh2h7T8T2akCwwKv/JWV8rBvSh4RMV5Itk/yAUtzPbaZg0XpcdZuJvzB2cwqm8uWFlEQSQ0t0Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764151061; c=relaxed/simple;
	bh=c6q+GvyxIdiJ16xSX01MLRRVomRvfDD/Y62kRB+oPrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mSIDZI4HIMr43Gf+gPHKMowqTxcyVPWpg6UAyGxqs52hQmuIMYDdhkE4VBXQ7SbSla8kYE3DfmqHaOtgO/FrqYAW7kysnOmgVXn8bsS8uoIKdzpKcejFzi4Yg8kbFmwQU19bhR3GbWmlU3NR5k48gjj+P3eUIm+Ug1i4LPYOTEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4lWZxwD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jjigxodf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ7gPcV1235231
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tIrlnvanRKm6ieeZu9WMEs25+41JIApwxKzDu2PV7yw=; b=g4lWZxwDs17EfunF
	kKbCPIxJhbCQZ8U01mWqL3tTLVANY1MVSZ8vkQHapRK5zJvZo/4ltk0B/a/Dyw7b
	EzzaInbQOGqnujWrtKY4FzCPFo7g8LPUURL3iCshqiD9GmABuSLH4o/xQ/GpOKnm
	q49TfSSsmcCy12RUPibmC5rnvlLEyMGdio9bePgEiiGyA5ilURzh1Kd8sImeD0gU
	DeIzMYhfe3CR6TM9OZXVEwMqNnvCBXewZ7wNI4DTKEhu6o/4lsLWs/bWJohN6OsS
	rc0NS3Aa1wlPtuQsQP576RmTBb+oUj1GXvz+l8n9J3i9q4fKWfnOpxo8/x4wRwOI
	fpZkNg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anwd40e9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:57:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso7161141a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764151058; x=1764755858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIrlnvanRKm6ieeZu9WMEs25+41JIApwxKzDu2PV7yw=;
        b=jjigxodf3YTIHtEB9Oqb6cvJslH9Lofuck9IBMCe7kV83qI05mcgiAjXdYS+HiBqcQ
         k1Q2JRi31geq7vxgfEPh4ZetRL2FZIoKLDkP0Xx0FT7qjaZUKGRW+ZZWjGzja6HIbBt7
         7rodsk9lYhTyN4TLktehxV/DosUA45Bzy7nCoGtk7BFc16DRMN8a/DaECd4asX1vtR4g
         3c4vX//iTc1recj7elf3JXrQTds1uaM8PrZL25+q133jtk0g/BrS5w/GcpxHr49eUKq1
         xDP1UxmChYRrPPYOzS8Nbz4bplLVorkrZAnHaMGaXKsWY+4My3fkFFn0lbobBPRD4zAl
         4kOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764151058; x=1764755858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tIrlnvanRKm6ieeZu9WMEs25+41JIApwxKzDu2PV7yw=;
        b=S4PQ8N1Z2MQ5fuE3JP1hiv+Yi4ARbpxjRAcsCDnjnxWUxMuPoIlZ+EeAL+jSQGdHU6
         J7jLYefPWxi/kGX4rm53KKF8NCK3cws2hZR4u+imkjOkOv6+sZpQe/4BaDCYZ7LdbL9S
         uWyxEy951k8mF2yUcP3UDeIbvDrbH4MWifSJWxLkumeP6rRBgsc9oIvddjLrBnPUeIpa
         r00BF2avNBeDG5AOzp+UNKa9AwUdAkbV9DXoqNdVtava2Vgc5n8uA6fAq6sGDGCtQ57V
         69CFlNquTuouiZG7ZA6jxW+xk2XHeCzlIn693q1B23tQFdBOKmDRp0eG/1pb58evoexx
         H8Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWhvEFSXQ5INxh0MY/EtaPOgzSgPJ+juTo/OwnkrQIydBa6KmJXJRPiCJhSV9eK8j4bHJu2c6dkRImFJ7Tz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5aOMuSQphMncu2GQ2C3UX2iD1TPeHUKe8AEafIdV3FgvAQEB1
	OCdOLNupzr1o4X6E+YkeHTbWiDC2yZyLD99Pj7RqnaLqxNE729TrZpRftBh/eptKgZaG0LagrmN
	dE3Hb0xR1HUJx+mGXkCz3Rt9UQP4BZcBDpV7ymVVU48chrjpu8xfz24LwQApZUr3aCypx
X-Gm-Gg: ASbGnct2d8NV6ilKfpW2N6iYmSZJV0Gd3/A5u/tamr5vUVqiXgV+MIUalGpS9lVZqkc
	j1GP25ZhpqX9owWOvHJ/1Vgl7FkEcBFL+jQ6+kN2LPtask7wyxlTZ4hk3dlxm16jl8g/NelivqA
	3b/ygWuYzsYeoIyi3ZdWSGA4UHrWvduO12khBLOs1WNfie4DRSKyStK+l96TKbSzS6JRVabici+
	CLQyBoOJ6dHvYmoCWnROb5h9j60tuHqH26lOK5mR5BFM/S8vvxKlJysV9vJUD6nUAfWA+qTOKjv
	PO/bIqgMLozBnPZ/z3j/eXdBHM5XyFH69V8AN/+qU3FG1YB4UtH+xlRYKvGS3Ms60rvbJ9FFTP8
	cq0V+cuRORtO4c92Jm1/RPpuAWmdRBZWJ2Q==
X-Received: by 2002:a17:90b:1f82:b0:340:6f07:fefa with SMTP id 98e67ed59e1d1-3475ed51781mr5756361a91.20.1764151057851;
        Wed, 26 Nov 2025 01:57:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4i0qrP6+fKI68qgymIJ0bISl918XB+yqDcUVq7Tetbqbls5kAdyETp1/eih5sYWSvGSZGFA==
X-Received: by 2002:a17:90b:1f82:b0:340:6f07:fefa with SMTP id 98e67ed59e1d1-3475ed51781mr5756331a91.20.1764151057373;
        Wed, 26 Nov 2025 01:57:37 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a43ac07sm2042843a91.0.2025.11.26.01.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 01:57:36 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 15:27:17 +0530
Subject: [PATCH v4 3/4] clk: qcom: Add TCSR clock driver for Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-gcc_kaanapali-v3-v4-3-0fe73d6898e9@oss.qualcomm.com>
References: <20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com>
In-Reply-To: <20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: qg37ICD_8ruR31PX_tphEQR01wbQ3AR4
X-Authority-Analysis: v=2.4 cv=feqgCkQF c=1 sm=1 tr=0 ts=6926cf12 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=hY4tN0yg6o136M3hR0AA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qg37ICD_8ruR31PX_tphEQR01wbQ3AR4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA4MSBTYWx0ZWRfX1iCgst01vnvO
 SucCisyv5mlgq+mlH/Zjf77/47VWg+WtPbeCyej7nSMJLKs0/3DMURh1PSklteyUnsI7UD4f0V4
 ZOdJprApIg/PeOsFIwSE+DqXngpLGiblLRarGKo408wy+YI2aj2J7pFVTbBsag0HyGI6beSLt5f
 Uapf4y+g+BpQHQc8aSwftsQcjpthInE+GNcYkBIGTtBiCCxp1mCGq513DtTae+Yn/rE/jc72nj/
 K4A7aZ5S3PEpm9vvsL63Iwnj/FzLtiNVgVzy6I3vXdC3m/Am6VjEyWu3LBC0pVDcJ7XXa9eVw5H
 8qJuXyP4owVK4hlpja8bkccZJpAnUFj3LZl9gK1vN0KyLL01jZftItAgQlg8nIIFa+xUVZA2F6Y
 8jny+Bp+p0NxQpMnRmQ/zpuGZSs6Uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260081

Add the TCSR clock controller that provides the refclks on Kaanapali
platform for PCIe, USB and UFS subsystems.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig            |   8 ++
 drivers/clk/qcom/Makefile           |   1 +
 drivers/clk/qcom/tcsrcc-kaanapali.c | 141 ++++++++++++++++++++++++++++++++++++
 3 files changed, 150 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index a284ba040b78ba2f7b7c7ead14023c0ec637f841..efaf32bb517e47be3da59410eca5332abe5bc25c 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -46,6 +46,14 @@ config CLK_GLYMUR_TCSRCC
 	  Support for the TCSR clock controller on GLYMUR devices.
 	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
 
+config CLK_KAANAPALI_TCSRCC
+	tristate "Kaanapali TCSR Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
+	help
+	  Support for the TCSR clock controller on Kaanapali devices.
+	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS.
+
 config CLK_X1E80100_CAMCC
 	tristate "X1E80100 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 0ac8a9055a43230d848c6a0c1ac118c03c3e18d2..6e45410d572bdb9f088a32095fe78a81ba176c09 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
+obj-$(CONFIG_CLK_KAANAPALI_TCSRCC) += tcsrcc-kaanapali.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
diff --git a/drivers/clk/qcom/tcsrcc-kaanapali.c b/drivers/clk/qcom/tcsrcc-kaanapali.c
new file mode 100644
index 0000000000000000000000000000000000000000..4da77367c9e035e036f63440dcf66a4e3a03ea84
--- /dev/null
+++ b/drivers/clk/qcom/tcsrcc-kaanapali.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
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
+	.halt_reg = 0x15044,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x15044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_0_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb3_clkref_en = {
+	.halt_reg = 0x1504c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1504c,
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
+static struct clk_branch tcsr_ufs_clkref_en = {
+	.halt_reg = 0x15054,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x15054,
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
+	.halt_reg = 0x1505c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1505c,
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
+static struct clk_regmap *tcsr_cc_kaanapali_clocks[] = {
+	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
+	[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
+	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
+	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
+};
+
+static const struct regmap_config tcsr_cc_kaanapali_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x3d000,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc tcsr_cc_kaanapali_desc = {
+	.config = &tcsr_cc_kaanapali_regmap_config,
+	.clks = tcsr_cc_kaanapali_clocks,
+	.num_clks = ARRAY_SIZE(tcsr_cc_kaanapali_clocks),
+};
+
+static const struct of_device_id tcsr_cc_kaanapali_match_table[] = {
+	{ .compatible = "qcom,kaanapali-tcsr" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tcsr_cc_kaanapali_match_table);
+
+static int tcsr_cc_kaanapali_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &tcsr_cc_kaanapali_desc);
+}
+
+static struct platform_driver tcsr_cc_kaanapali_driver = {
+	.probe = tcsr_cc_kaanapali_probe,
+	.driver = {
+		.name = "tcsr_cc-kaanapali",
+		.of_match_table = tcsr_cc_kaanapali_match_table,
+	},
+};
+
+static int __init tcsr_cc_kaanapali_init(void)
+{
+	return platform_driver_register(&tcsr_cc_kaanapali_driver);
+}
+subsys_initcall(tcsr_cc_kaanapali_init);
+
+static void __exit tcsr_cc_kaanapali_exit(void)
+{
+	platform_driver_unregister(&tcsr_cc_kaanapali_driver);
+}
+module_exit(tcsr_cc_kaanapali_exit);
+
+MODULE_DESCRIPTION("QTI TCSR_CC Kaanapali Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


