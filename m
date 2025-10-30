Return-Path: <linux-arm-msm+bounces-79671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD50C1FBA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 12:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 429DA34E30B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318873570B3;
	Thu, 30 Oct 2025 11:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wn8YXeFw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZR/eNgw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59373570B2
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822607; cv=none; b=NzYv1NVwTxZImQOg039aXZkLLxG4c7NKr7qkx1PLcwQSvNBdVvnKFsRJq/sVbHMwHr/V5NMQJsRwZheAvjtF4CmCNXm9LVPw8HV+Tg1DOFBp/bIpKDQ3Bj8N5+375A4chbSPNURiEERpp5gsbvZt4YoLCxZZsJQDfIc80GME4ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822607; c=relaxed/simple;
	bh=IAV1p/i78JaXuL3u/QRB9tBlb7z1goX0q1Bcnr7ue1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k4XB904rWiB+EWZaqhQdQ1dbvo4FDDcUmxNg1X6eTAxDCPOVfvypbGbw58WD588RYCARKMAGhq9bSS9Odopte8ZYPul9FAuEtgA8kUu3Cmjc+JJAh9oal8AqDXdGg9LJpJwlDxOhyVO2C+evGeqUzWhFIB95qA3u/I+h34zDA88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wn8YXeFw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZR/eNgw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9PKjo3509316
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	luiRV3a8OsNa0Az4359IuHjf4gtWlkSrwaMSKrEcF8I=; b=Wn8YXeFweTe2QgL6
	xd66gOLIZBPvZW/LrX5YmnvRt2KrLJl+VjlUffJ6S7jp/GT4+mUpbLgaRkxTuqRz
	YZLaI2fN+eJE9aopl8DaLqqIPgXnEbh/OxOCsKtunvvMzvK38YcSvGkk/MSZjSeh
	16N8kl9BVxcX1x/C4ZTdlD/5shQeOE3DLTgpQPiYP5snVxvvIqaj9yHxMGfTuI1i
	bNh//D0xpyrFZ5Rwa8wTkimLVatBBNp57OP9tAk4CioA4BQUluo33pGU0lARjXWY
	51inaJtF2bSs45m/SsbDcqjjUCL6CTuHXvl/UPfDKlbVRPvLOilJpV0nI0hZPsf3
	c8CWEA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45cdga3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:10:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340299cc2ecso1077839a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 04:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761822603; x=1762427403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=luiRV3a8OsNa0Az4359IuHjf4gtWlkSrwaMSKrEcF8I=;
        b=CZR/eNgwlQa63TlmS0N4AJSmI+kwvcBkNYFMmIdiqJifLZMk9QytEl0ZqIxYCxiOJf
         2l98BmKa95TVQSpW7RcP1du0XxfqEySvBF27OW6z2jkEXiD08olZSW01mnMIO+h3ntPW
         dHoy57mVyjlBGo3Qj39/P/zhAdGXDFEExwiaq+BDDDw5gXak59cLFkFnKV7u5xMyYsvU
         eG9VEKKY/vPJBZawppy7oPng4zmwgXACywWr/U1vwz+CQpYG/TMO+uHDeCnv13/84qG4
         WfG2TPLvoJ2szRqnFVaKPPDRUdjEd5lnF3IxASlTG2iFI/EvS8NllyRTRkrsxI4iSiOM
         embQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761822603; x=1762427403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luiRV3a8OsNa0Az4359IuHjf4gtWlkSrwaMSKrEcF8I=;
        b=U3Nu3cPwP9SBXgterxZyXTUx4ydlW/ge80ayzXumz2g1djqPoz80X47XNY4CgWx3r1
         e3kOQiSYY9I9se+7dLRTWQ9Si0sGoqOALO547pyzUmKZkF8qDqLPP8DELMGvGJ8YFHwH
         0eYbcurmhsgd4UV9zVGwKrxe64vIi4rylUKth975SISme2rFTeEH+Mep8hN9u0iSG8Tp
         RoD3uQE19rf3pFcRHDfwp7xqnyH7+ibxaCoFwlhtKGYl/bvBLQwm1fTqBAmgpJzwWK+q
         I4nHIxVDRB5W3oIAzAa+Nj1HbFz//fH9KiUN/gUXlHD/IVqaZCZSwWXZKfBNAUk1EUH6
         zONA==
X-Forwarded-Encrypted: i=1; AJvYcCV6IrBwoqMlUW3BiMiGER6bXAJKCTTdwQBNLHx3XCKC7GszU0/0EciugxZQSNucriSjXGDk3NTH+5ijNdaG@vger.kernel.org
X-Gm-Message-State: AOJu0YyFxkTiAHBA4G8OMZdj9rvS1cVJ4JOzjljyduyl+t2BwLCwEn9Z
	Ezq6g2wSRCtLcHz3UFW5B/1uknqicD562K9KuAwOd+uRSrH1mmE8dZ27t20lt6nW4KiZMi5dqvB
	0R3CZH1LxQf/SYUXZiaVnusij4UfSKhW2/KyYErkKh9C6M1jyMcjW98WpKDb4aJHkXSMQ
X-Gm-Gg: ASbGncsDl3u0Ls2kh3ipHe423MHNJcLV+zKgMA5WlsYm/w6d/fBnRaszaJ2RQAzVCbb
	kpPhLL1U489vLQCVK47HuYQqUM2s8dmJ2FX8Dk4U5nuP3lZ4tKdIZa5rP7m6QPyDA9tOOn84ewO
	JaAVIb2ZX6WqqzRRebnf11cbpa11p0eZQ71rWDHOLukzDTV8sfWzwgjTyBSZiV+63+lDsDSgjMW
	AKS0Fxkgo6MAVygw0ekJO/XouHHHtYQd1I2hiFNwTTDY7ZxcjLMhJjVOOcb2P+UZO00ZdKj9yD8
	HImqukgY4A3vd0eUmxUdov/6+lD0daZeCzyZIiGuuJDx5CEPxo/CN+MgltweKMItnCo9hKS+SXv
	IxBx3SrMkLc3SGyQKyILRsXw=
X-Received: by 2002:a17:90b:2d47:b0:32d:e027:9b26 with SMTP id 98e67ed59e1d1-3404ac69f33mr3270707a91.13.1761822603192;
        Thu, 30 Oct 2025 04:10:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbHC1HFelmDHqObOwIowGBB16arZT3vxABxH1mnb+tfbjHa+mNJCBky8fkK7KVVG+4T5c4Vg==
X-Received: by 2002:a17:90b:2d47:b0:32d:e027:9b26 with SMTP id 98e67ed59e1d1-3404ac69f33mr3270665a91.13.1761822602653;
        Thu, 30 Oct 2025 04:10:02 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340509727fesm2262839a91.4.2025.10.30.04.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 04:10:02 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 16:39:08 +0530
Subject: [PATCH v2 5/6] clk: qcom: Add TCSR clock driver for Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-gcc_kaanapali-v2-v2-5-a774a587af6f@oss.qualcomm.com>
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
In-Reply-To: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: vEplXMn2JFwakeE8lzAVaQk2U2m6rlk7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5MCBTYWx0ZWRfX6Uthy1gZ3J7l
 DGNzIk5eesZ0vVUD5rKmB4wx611bvjoBhYF4GnJFBf2MTbzFlYOzvZ7L3F4OQHpYieYd/K8RTrP
 nanT69h3uWIiwnaSHRHPRfwEX3ge7yEIEzyzOkZYox86PshNaAiL/UC/eukx4uTlP/7ncyGwIRT
 qTsgZRmvN2a62T/wjszkHrz0IUSAE7Gfx4ev8R9+gCbqMFBFT1KXEWs11T0V8fFEtMDHXnk+3of
 6JUIubBZz6H/RLQbhPQ7uCWprfy35BrUpabs98VPERa7zWgTuLm9xZfs7bA+tLpldDo0Hu01llN
 ddNyGKSEkhGRAhZ4PKPu/ycalRUnBtP8/ELTxsZRiFwxyb/3TyEpKuxxQvvPn595ViCNo2Ynib3
 G9IdlP5FyP9uhJj1sSnCkNgj/2RkwA==
X-Proofpoint-ORIG-GUID: vEplXMn2JFwakeE8lzAVaQk2U2m6rlk7
X-Authority-Analysis: v=2.4 cv=ItUTsb/g c=1 sm=1 tr=0 ts=6903478c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dL8Wr0w3JFnQZPpevKkA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300090

Add the TCSR clock controller that provides the refclks on Kaanapali
platform for PCIe, USB and UFS subsystems.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig            |   8 ++
 drivers/clk/qcom/Makefile           |   1 +
 drivers/clk/qcom/tcsrcc-kaanapali.c | 141 ++++++++++++++++++++++++++++++++++++
 3 files changed, 150 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 4a78099e706c2cee5162d837cad3723db75039d0..8ec1803af76cb87da59ca3ef28127c06f3e26d2b 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -46,6 +46,14 @@ config CLK_GLYMUR_TCSRCC
 	  Support for the TCSR clock controller on GLYMUR devices.
 	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
 
+config CLK_KAANAPALI_TCSRCC
+	tristate "KAANAPALI TCSR Clock Controller"
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
index 5a0fd1d843c87a6f0a805706fcfad91c3f705340..2350631814779ad086d5c8304b250b0cc2f5203b 100644
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
index 0000000000000000000000000000000000000000..14cfa75e892cc5ee1b03909f8c03d92de8ae2cd6
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
+	.halt_reg = 0x10,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10,
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
+	.halt_reg = 0x18,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x18,
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
+	.halt_reg = 0x8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x8,
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
+	.max_register = 0x18,
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
+MODULE_DESCRIPTION("QTI TCSR_CC KAANAPALI Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


