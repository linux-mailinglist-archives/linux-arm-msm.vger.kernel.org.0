Return-Path: <linux-arm-msm+bounces-66959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6726B147C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 07:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C70564E3EA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 05:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D4C24676A;
	Tue, 29 Jul 2025 05:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="coWoQmo6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EFF238D54
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753767782; cv=none; b=pLpv4dGE3uDjdXjik3KEHNLf/LgfxYEGPKs7f7th7JWZfSdBIlKgF6rndtPbepbsp34/YlEICZ13wGIPWIkGCfJpQ5o1CXjxvbDEHCXSnqNF2VpBr8r2lvhcUEU4uGWcCbHH5AVbMqWrgoSW+pJH7kDApIReQWCOSZhbzX+HsU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753767782; c=relaxed/simple;
	bh=GOz6deeoQKoCXAx09DVVnjJFMsZv+iOREfAW2Q/Ullg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iEUx3mH75k9DFA0O8wWaCuX+78SU4tHMs+vqjrOZo8VPe88k3xSG+djV91lGZFGn8wbbP4oqUqvOmaWw+nEzksQqUD4Z0Dwlmd2bNndGXDb/d6nFuQdOedJczJ+26K0Ed52CWJC3jWC4JlADNEpMqth7WxHoQphoCgAKkWRuLYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=coWoQmo6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T01sY7028204
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q629kGjocs3IMs1ij/CL1sX8C9u3BP995nlAQZR3m7g=; b=coWoQmo6mvnBpSqc
	9n9UPTJ7Kh4mBWf4TzcQZpuWmf6tFBeUx8nQo6zDhX5o7q0OGrAN33G0sLrxI05f
	3fAfEChXfZkhzuzrOANDCcTaAuthQ+rg/YIwImunJSSyouhKi4OjrDzbjOdIk7PH
	EgTD3v8a2QixyY2jEMyDysK9Bx+djaJKm53sLc7/kezZWpCo4g1Ycry88bwsnIsQ
	GkoE1bKijPcmg6G8qODe1ewV+8FF3j3NyxByww4S+vHVZM+xpPFY+hThGCH4/twv
	QADx31E3z4hAeAqyMwOKy5RFcXmCVFc1UD9oDNjj5gBJEZjnWiNM9Uxr+t9RZFrZ
	ChHjrg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qd9xv23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:42:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235dd77d11fso54404285ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 22:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753767777; x=1754372577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q629kGjocs3IMs1ij/CL1sX8C9u3BP995nlAQZR3m7g=;
        b=e5ssehER3wPFl5nmz63aOpERtLTDT945tWlhhbelggbxKpGR+JkrM07UFrdZPKpsMo
         Y8AB4Tv/ZqDW/Hz9W0IXDT6EyPlek2hHXjodVH+TTL1omWbw24VUyhLY4tJot8M65Rmz
         CH6ISuJngNc3Ts59f2m859dwZ1lq1bXJ+ByBRhPsRAYrdV7TqgGJONa1AhyTbxiB5NjQ
         GwAhXIfoyISeUxsP2b1td2cHEW/4BibxJQfHodUs7yo61fyW4DLKEYN40mWXh/pC9PKA
         yRonZiKfE6ThRF5SkUrBW5Eal8PsOza1opqG69d8y7tPeMxfnDoYJq2pkbnmXnFBip7I
         /FkA==
X-Gm-Message-State: AOJu0YwBtjL1IXXpMGf+IWNucp8qxGC4Wqz68I0CEymWIYkGljt4+lm0
	xrhSqjdr4oBRTGbW0a1zC4iA0onBBaex5JcWN9BvKFYbF6rhU6Ww2bHE+0c5h19D3EYgznZ60lo
	eMmJIhAThybdS9wGOmKX6UPEVZjg/jIOQXmmlujYnYwVbVtM8ytB1t37dm75NtRzhTvB/
X-Gm-Gg: ASbGncuGJoumvnmH5T6aXtDVb8CV2UbQ/ks4UYShZv4m4jAVDWHH4RXyib/kmOughge
	94SI0Xx09/xY4VOqdBBee91ZnO0P2u5oEBLvidPQwBUAu/HynfRU6Iy43zZzb+Co5+CZs7O1Dht
	8YLI+EmAmyxu4UPE8MyPah2fTJycI9IN9WrB3vLVcHwLHXe1p8EIRgr5XLUa+2QPWWZBUdIHKeb
	O3h8tLwo4egUFKnlly4bvFADRKPY4NPbFlb9ZW5EJrwKwhYN0At+62u/8pZcBifEo7eoCEVXvJK
	tWNPBt/9vDODSPda48JX/a5XnwB894smdlRWPwp1a1oHHuc0Uz8IUMdC5hsO+1Ag
X-Received: by 2002:a17:902:ea0a:b0:240:7753:3bec with SMTP id d9443c01a7336-24077533e77mr3388835ad.51.1753767777152;
        Mon, 28 Jul 2025 22:42:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNlDr6XrQziY3nR7i+vCpVzBAWCzOyI6CKkyyifZga8XHlKEbSVWXuxjNuapIw0YF6qNCEig==
X-Received: by 2002:a17:902:ea0a:b0:240:7753:3bec with SMTP id d9443c01a7336-24077533e77mr3388515ad.51.1753767776719;
        Mon, 28 Jul 2025 22:42:56 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fe9b67485sm54505235ad.47.2025.07.28.22.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 22:42:56 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 11:12:37 +0530
Subject: [PATCH v3 3/7] clk: qcom: Add TCSR clock driver for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-3-227cfe5c8ef4@oss.qualcomm.com>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
To: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: Ifq3_a_sYDdKeBRCNlxy8zLWyMhrl9b6
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=68885f62 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=0Ipwna5hJchEWJtN1m4A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Ifq3_a_sYDdKeBRCNlxy8zLWyMhrl9b6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA0MSBTYWx0ZWRfX18ljW3fSoVCD
 gFKDrzOYv77B0D/V7NZtR6n5DueND8vp0B5+tf1JAT8tKbgPQ5G3Eiz0FFpEVMvLkux1Qw4YgrD
 8iEN0WdBpz2gfrpN96qDr+5Cbf7+Omch1EZDk4uLgr93LziJxMOYCeqFo1j/FuQsNGaYMxAsf3I
 BgKVge6CwMUtutpJlSJzvL1tjiaRlYgGfLNG83DAPR+vLC88d6H0mCJGqGT9ATki6gRA04N6SC8
 9VxPlFhNoDFWFRp37P3JIWNvrj3cDkvQYEJb9oeQwDP6q10wUpxaAux3JwByucMRS9ZOsRUUvV9
 xJRfLgxWS1jdWuHxAdqR6ZaSk6b5lq3d3dpPqvK2AK1D9dDEGukYbMpebA9KuV6mcRpvmdHqNDI
 Qt6YQsEiugr5l3Zt13nm+SsHRuRKezgD3NqB9E8uvXanitPzg90OO9f1lE35IpRYtd/82bhb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_01,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290041

Add a clock driver for the TCSR clock controller found on Glymur, which
provides refclks for PCIE, USB, and UFS.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig         |   8 ++
 drivers/clk/qcom/Makefile        |   1 +
 drivers/clk/qcom/tcsrcc-glymur.c | 257 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 266 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 36d6e6e1e7f0162d53f02f39125f4593517e0dba..ed523cf52a7613e2a518f2a802b9451bb73c43f6 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -19,6 +19,14 @@ menuconfig COMMON_CLK_QCOM
 
 if COMMON_CLK_QCOM
 
+config CLK_GLYMUR_TCSRCC
+	tristate "GLYMUR TCSR Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
+	help
+	  Support for the TCSR clock controller on GLYMUR devices.
+	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
+
 config CLK_X1E80100_CAMCC
 	tristate "X1E80100 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index ab59434338bb6d6f49b0af94ff0f85cb386a16db..e29f6e646ec69fc956ae4c55350dacab79398c18 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -21,6 +21,7 @@ clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
 obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
+obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
new file mode 100644
index 0000000000000000000000000000000000000000..7debfdc87a552a79bc081f28c34ae18e031ff2e6
--- /dev/null
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025, Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,glymur-tcsr.h>
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
+static struct clk_branch tcsr_edp_clkref_en = {
+	.halt_reg = 0x1c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_edp_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_1_clkref_en = {
+	.halt_reg = 0x4,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_1_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_2_clkref_en = {
+	.halt_reg = 0x8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_2_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_3_clkref_en = {
+	.halt_reg = 0x10,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_3_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_4_clkref_en = {
+	.halt_reg = 0x14,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x14,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_4_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_1_clkref_en = {
+	.halt_reg = 0x28,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x28,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_1_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_2_clkref_en = {
+	.halt_reg = 0x2c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x2c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_2_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_3_clkref_en = {
+	.halt_reg = 0x30,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x30,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_3_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_4_clkref_en = {
+	.halt_reg = 0x44,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x44,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_4_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb3_0_clkref_en = {
+	.halt_reg = 0x20,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x20,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb3_0_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb3_1_clkref_en = {
+	.halt_reg = 0x24,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x24,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb3_1_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb4_1_clkref_en = {
+	.halt_reg = 0x0,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb4_1_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb4_2_clkref_en = {
+	.halt_reg = 0x18,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x18,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb4_2_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *tcsr_cc_glymur_clocks[] = {
+	[TCSR_EDP_CLKREF_EN] = &tcsr_edp_clkref_en.clkr,
+	[TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
+	[TCSR_PCIE_2_CLKREF_EN] = &tcsr_pcie_2_clkref_en.clkr,
+	[TCSR_PCIE_3_CLKREF_EN] = &tcsr_pcie_3_clkref_en.clkr,
+	[TCSR_PCIE_4_CLKREF_EN] = &tcsr_pcie_4_clkref_en.clkr,
+	[TCSR_USB2_1_CLKREF_EN] = &tcsr_usb2_1_clkref_en.clkr,
+	[TCSR_USB2_2_CLKREF_EN] = &tcsr_usb2_2_clkref_en.clkr,
+	[TCSR_USB2_3_CLKREF_EN] = &tcsr_usb2_3_clkref_en.clkr,
+	[TCSR_USB2_4_CLKREF_EN] = &tcsr_usb2_4_clkref_en.clkr,
+	[TCSR_USB3_0_CLKREF_EN] = &tcsr_usb3_0_clkref_en.clkr,
+	[TCSR_USB3_1_CLKREF_EN] = &tcsr_usb3_1_clkref_en.clkr,
+	[TCSR_USB4_1_CLKREF_EN] = &tcsr_usb4_1_clkref_en.clkr,
+	[TCSR_USB4_2_CLKREF_EN] = &tcsr_usb4_2_clkref_en.clkr,
+};
+
+static const struct regmap_config tcsr_cc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x44,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc tcsr_cc_glymur_desc = {
+	.config = &tcsr_cc_glymur_regmap_config,
+	.clks = tcsr_cc_glymur_clocks,
+	.num_clks = ARRAY_SIZE(tcsr_cc_glymur_clocks),
+};
+
+static const struct of_device_id tcsr_cc_glymur_match_table[] = {
+	{ .compatible = "qcom,glymur-tcsr" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tcsr_cc_glymur_match_table);
+
+static int tcsr_cc_glymur_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &tcsr_cc_glymur_desc);
+}
+
+static struct platform_driver tcsr_cc_glymur_driver = {
+	.probe = tcsr_cc_glymur_probe,
+	.driver = {
+		.name = "tcsrcc-glymur",
+		.of_match_table = tcsr_cc_glymur_match_table,
+	},
+};
+
+static int __init tcsr_cc_glymur_init(void)
+{
+	return platform_driver_register(&tcsr_cc_glymur_driver);
+}
+subsys_initcall(tcsr_cc_glymur_init);
+
+static void __exit tcsr_cc_glymur_exit(void)
+{
+	platform_driver_unregister(&tcsr_cc_glymur_driver);
+}
+module_exit(tcsr_cc_glymur_exit);
+
+MODULE_DESCRIPTION("QTI TCSRCC GLYMUR Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


