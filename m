Return-Path: <linux-arm-msm+bounces-82899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A29C7B25C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 18:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 804FE3A3C2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 17:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558523446CA;
	Fri, 21 Nov 2025 17:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PmkCP4QW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BlAy+TuF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C862FF656
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 17:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763747810; cv=none; b=jMrVE/wsEvnrHgRKtBc8/x3S96Pk7RxaDHokbq0ZZagr7WdBJmlN14bSuOO3b1iMECRVdJ8dLu9Z2bJ267str3Iglp4tlMMk8uYPwM6sxhu5vMUH7OcxqslgtwYePiO1AjqlvYicxcwAxKkl2/7l6xIGsvxvm5u5zg/Z+5YAeWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763747810; c=relaxed/simple;
	bh=YL2uVLUnrx/XNmW+ag5zQ2S2yrydcIJys0KbZZEEAKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ugksfoCbMF3zbvg5l7b0tfxbvwu1vF6k2kQdypKa4/v7g86ekwymhd3lA8G00iO6mW5DNijN7DuhPgcHS0PlnWaBUh7frbMMf+ExpeETsk1cgwdrVPJgBrP/I8jlSMEph6ppzhM+fVr2HZur4iRO51BdvugC0FQlpGuSTaXuDLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PmkCP4QW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BlAy+TuF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALC60uM2759593
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 17:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KGhryrcnb/27GJBj3vmuX8SUtcqUYKOKpzof9fiQq3s=; b=PmkCP4QWYNuB4Wp1
	uDWUStKCsuIU8O7NW1iPsdNE7AsXcAuvwxUrrpSTciUHvDsqKfqL6FPZS8Xawnl2
	kb+AuvUaIfx2/iptOtjJd/+KomtfIWPSKYcjNKROoa508zVo01mMYYtrpPjwZt5q
	aZeA9Xqd5rTsectpXypNODyHTcktpudPdq7oi5DKfqRh3PMo6zL0lQkCvETeYMb/
	ZuxURfFeOelnjLXaQ1VGIPLMzr8RBEQL0NTV/5jRkJC1g3kcMk1BkfO28l3GjmJI
	ehYGd7eoLyL+MIED3MAjxWf7nShtAs/DTnNSgSARKg/la1xDo1a220vlAU7V0hN3
	bRBMrg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhy62efh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 17:56:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b952a966d7so4813396b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763747807; x=1764352607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KGhryrcnb/27GJBj3vmuX8SUtcqUYKOKpzof9fiQq3s=;
        b=BlAy+TuFTYBuC8Cb3Dy4CM7nQX73C/WvL3msyD1jHCGnuTgC4cFZ9lrJR5gE2f9vR/
         9tY2XhcQ8+MjYYThDcAseXrCToDTTFdijOjWq+umkaSk5wLRDAibtuGlNLyVqQ85O8NH
         hhsk0hxEvUEoODqbbws5SuOxFMl4tX79H4Ewt2Jx5GAD7Lgjz77E4kc4VC2UbCCp54CW
         bnCn4dCTEc5/EL6PGBhi7hpMAOtnq/M7dBvISywkQt+ZOjwyQGrHO8QeE7KJ4M+eK4xs
         Rx2/MCdPEB+bFc0cQelZ8FfcnhCcUnuFUZ0ncSeI7oDtM8pVVFNgo7FZ1PKP8guQzl75
         Vk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763747807; x=1764352607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KGhryrcnb/27GJBj3vmuX8SUtcqUYKOKpzof9fiQq3s=;
        b=ixW+joMIP9shEg6X2QZudMGAv7nwAvZ1XMQLbsuBmRHmJ73+JBntHypYp4qyvsajHm
         cDRUxrZgc77v1JSorK1LWa9aVe9ofuLZTTubNzftN478gRrRynE809eJ4DTZhChrnUpk
         ktiYRUzC1vLKtIlVNFbljYnj7rqZ/gMw6HkRMU8yedxmvD5gP3B2Ygfh7s6KEq+ogKBQ
         EfDhW+iPKF0zUBjIRXfds/4jlQzcjiQydh0ctN64we2mdvySwXjT+4mdZI4lD5C8+dfe
         Du27U4Oy+8gBLFgD1TqEsX8TYDUXQnIM/Y0kiVxyZVFWDjw8jti4n7xchj0VfV6TTDwv
         m8ow==
X-Forwarded-Encrypted: i=1; AJvYcCUfXQfa5Cs4GvB2RENd26hPzfzs4is1BPXOzJ3AJdq36Rko7y7kEh482KXHj5D24a2qAWjWqM0T8SJ/+WsJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwKfxSXxMUeIIJlrREp3jtU8CpSNeW55tJriMV2l/Yk355Whk8G
	IFYInl+S7bYaj/YJP3NuqOrFR3fPo0AwTs8l2jns6prr+iuHdxVDaqEQGclH4PQOPC7lxd+vKC/
	2aJ5ACL6M6r0yk5D9czv37kl5QBU3bStC5mBBrTIEhlksnv8msbyGCGZZdEfY7ETunPi7
X-Gm-Gg: ASbGncttEiqOsoOpq/zB1hYnUo3IPX6mfgfefOWZgRrd3dABgGNmUNBtMBzaa0BeQJo
	CxoN+3qkR0NpjBlGm2kxG+4m1YrHlDgiViLkxnZYbD8MhZB8WNSArONqme31ZCiZVB1OM4vU5iv
	+//yFDAqVy2ZriaqPw89bwOXZb0xcOVwC5ePlVQpK8iN6vA+SHVjcnmoONA21lARd2k6JgLWI8A
	hW2AhmZzdslRt46Q+jC1xZJZTxL5oeMI+23OP9uUj8bkbWxzO4IiBtfieH5WBMBKuylskvuZCDo
	GwCxb3qqI7THxFKM+/ZK5kTzayqAHBz5TcYq6kU4ox7n88XZpRyj7NwFq86BTyo0QZ68lZD2GjG
	efj3qxd4qA0onjiOX4mpZrpVz3NI9AwqstQ==
X-Received: by 2002:a05:6a00:13a4:b0:7ab:fc99:d856 with SMTP id d2e1a72fcca58-7c58db2cccdmr3616036b3a.18.1763747806503;
        Fri, 21 Nov 2025 09:56:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFQGhm0brpljD+qoKFM/X7Al99AltwubaWNS4jIOoZi8WedofVGzd2/6Ep4L4vnWkGkttebQ==
X-Received: by 2002:a05:6a00:13a4:b0:7ab:fc99:d856 with SMTP id d2e1a72fcca58-7c58db2cccdmr3615997b3a.18.1763747806019;
        Fri, 21 Nov 2025 09:56:46 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed471060sm6727883b3a.15.2025.11.21.09.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 09:56:45 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 23:26:28 +0530
Subject: [PATCH v3 2/3] clk: qcom: Add TCSR clock driver for Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-gcc_kaanapali-v3-v3-2-89a594985a46@oss.qualcomm.com>
References: <20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com>
In-Reply-To: <20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Lb0xKzfi c=1 sm=1 tr=0 ts=6920a7df cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hY4tN0yg6o136M3hR0AA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Fw-naq2U6Jc1lvrrMuJovRbTk0b7UHNn
X-Proofpoint-GUID: Fw-naq2U6Jc1lvrrMuJovRbTk0b7UHNn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEzNCBTYWx0ZWRfX8PruED90QSgf
 zivcqQAy83CD/xvNQYpVoRZqDWBZTxP1ZmnAc226Wiupd9qqwhDy374HVslsKPtcgoRKgbyqr9v
 AV8VLW/v7NmA0i3WysOQSU4MCVY5qwvJRxkEkzZ51XO4uug0POkuXU54YzTgCUnWKUPeOf+P2a4
 IzllFM6YsaJmMpOH/PLlX/5xALD49z8xC5/cbAECSQg7iXMssnmuCeh0YQDiM5JCPQ/AXUWqkOt
 I2zEpnkIjjLgpyd3BOrLPufShW/4txTNp3So0h2oeCDHbOZfbfBcVTVtncGpX+bx0i6vJvAY+uR
 KUq/NZHxcyk23Y4MTg3DFuhnYIYSfeNCdlvtgtH0+9+9xmMiuOYosvHroft0ZJniKBPMYamnypm
 hyPF17oQjZy1FhoNHcls4FtGjymbng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210134

Add the TCSR clock controller that provides the refclks on Kaanapali
platform for PCIe, USB and UFS subsystems.

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
index 0000000000000000000000000000000000000000..a03b80884b9c06dd8a72ea1086429cef95698d56
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
+	.max_register = 0x2f000,
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


