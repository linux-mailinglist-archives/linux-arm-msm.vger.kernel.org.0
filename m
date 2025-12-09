Return-Path: <linux-arm-msm+bounces-84762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE9ACAF569
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 09:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AE0D308B58D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 08:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B601B2D7DFF;
	Tue,  9 Dec 2025 08:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkmH7wFN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jbA4S1G/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BDA2D7DC6
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 08:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765270190; cv=none; b=susMYeI09rzQUz9fV83BCNkEIDOIvsaM2KP8CxCSXlT40fvyoCCAJOlc7ph8S6IvYkkAySAshHqyChOkbzc4mzwyxhXOEsy0w8mO4IGCetB/prF7aGheYcumg+W2C+HgD/JRAAt5dA3Varkv636HNyzjlf8/8rNuQwci7H6jPfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765270190; c=relaxed/simple;
	bh=c6q+GvyxIdiJ16xSX01MLRRVomRvfDD/Y62kRB+oPrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hC8+VXfCg287E+L/dd+SVo1fiomiXAfghqUMDoIQOeQXMbi12iXd5rhIFn4hJVALmHF2pGZO5JrFrVwkGm1V3+8AsUgvQ7Dw2tkm964Q6/xOB3e68+f2PFI9XkzXrw7mp4JSkEdvldSqFIFC6TLDzVszAOyMM244XSkzjT3L8E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkmH7wFN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jbA4S1G/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B98jlBQ3212417
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 08:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tIrlnvanRKm6ieeZu9WMEs25+41JIApwxKzDu2PV7yw=; b=KkmH7wFNFDNzgXJe
	gFTRO14mgmBLcoMMm9hC8T5My/2tCVzrZT20WJ8NISPJpVa5gUGynZjFRZSAO5wO
	Zlf5j++iJlHA7+5F88OJhYU/z03tvn1oXiDXOOWWPBy8BVpKcnHhEDCJbdZuBY6P
	LVf6cHqoU/d9Oi/UhPCPcSuVhSREoU+gmX7qA3VOOD6l5K+nI+Bg6WmECKRB7bKl
	TDoO7F1TmxuwL6bNGVxScZqC7Wh3Ou+KFcHAiulKGcn8GtB9cA1Yj3/UuUR50l1/
	O6FzLZth4xFHrT0OQyMnnTWiD3plJn5mcLZ7G34Y4IYrcYYx7tYzheIMXUFD+X3M
	HlVPgw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awwgmkf42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 08:49:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-299ddb0269eso61081045ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 00:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765270187; x=1765874987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIrlnvanRKm6ieeZu9WMEs25+41JIApwxKzDu2PV7yw=;
        b=jbA4S1G/CJUNLsFv1Y9mFSTZwTTX5Vcub6+jJ7tx6rqOewwaPmT3OyBsiShmevj0cd
         Ydidbud+2DNN8Xo4DCYe+hxD9DqMkE97apkiEv7Y2MFim+MOrggew2zQq623vcW1Ga4a
         jNwG1R876LhzIKqSBgUkLbND3BVSu6ck/gv4CdJzxWgHToJIJzdKHJnHTwUKLU3RGBIM
         qMSgPbfA/qRxf2rG7uzRIUoWjW6ArLrBD7W3CaObDmDYzK6mvIwFGA4r44WSqzQwFvYo
         yan9C2hyhJ9dX66lyX3b2w5+d0TCzV2N4qncEqqtmv3+JaFYkUnczTRkw4sc+9E8+vk0
         PzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765270187; x=1765874987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tIrlnvanRKm6ieeZu9WMEs25+41JIApwxKzDu2PV7yw=;
        b=iBOhhVSm2SmSZiP5FqQVdztKwVkLz/Q3NW8SDN1Rlmz73GMJOG83F0DCD1HN+9mIux
         IVPUrRKIUjUequNpiA16Nmpdq4NqBji2XOLJjHW3XnNgF6Ali1/CPoqdYN9vBMeowBPu
         MilvsRMtzdZUgw/i6Wt0ctEKXxTb2anKPufz0CwJJZ3TJxLn4Ecg41PYlJTdIgDwmywg
         DFc3eC3vW2rYDtxYRptX14B0j9yrdTYwq623uwBbddRakigVkpD/Z+EOnkanEGFWM+pz
         SwHzI1K7pEi6wuQTewxaccVQoxHUmxtrJ04spqkFbg4dl+UGYUhmQvTFF6c97G5Psnyz
         Tomg==
X-Forwarded-Encrypted: i=1; AJvYcCWaBkMw84lFED7nhgOp386mhLWqtQhOoFBVEG6KejYXIPVwxMDvyStKJS/WlXA2Nia48JbskLUaCtXZ+qhS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0grfvdlfp8c8+/squofxRO1/hXDafeNWXHNQcdm0LAjTVUmKD
	cduM3uzhLAJjg2oPcRqvhllNg0+zLFiQee5m7vQWPW061ckWq2TEK2Xvuih3eltdw4krSSXNAPj
	dCyntuKHbVkeLLWY0eUlH/BV0Em+M6xQbJPI61tmN5s1PRd5ykAAogHPlUBKXgMHzJmPM
X-Gm-Gg: AY/fxX4gA8V8jngLkDG+iaUY9Vr/8yy4GHhNTeXUf6FdqOyu9EAYgQgSvIKOM5kcuLE
	r8vr4N/O5bOAP8TH9R5V/uxKny1QHLTh4xrQDxdWfDDrmN+q6h5PeIi1oY9+fCBUNGEEUHCo/1Z
	X3wyT3Sln1pv8Cp9qfjM7+YMSGhYfNe053CQCdJk9cV2VqJWm1j3Og9Zrs1PJSZOClr4WgqNZFI
	mGjMXbFMpAUchXQcdAfChUo5CKGrGCuB4rY+pT5+kdls+hxH1Bp33M6CbImN9oUeeVtwLERVCew
	s78QJlfsSDS26bCQAmwKrbseE1T1E6MQ572wSi51PkGByDf9dda8pW7JOfV48AUlEKz+BWeds0t
	UqC5xZYQMYVFhucdv2OwsDt6MJji4wv1QVg==
X-Received: by 2002:a17:902:f603:b0:278:704:d6d0 with SMTP id d9443c01a7336-29df5aa3be9mr84208045ad.19.1765270187378;
        Tue, 09 Dec 2025 00:49:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdWajaNi8G1P9bOTcwIAIlChUUwocsLpoP6lEZp5EbqrPZZjz01q0aXqgAjIpSed045g4xmA==
X-Received: by 2002:a17:902:f603:b0:278:704:d6d0 with SMTP id d9443c01a7336-29df5aa3be9mr84207855ad.19.1765270186886;
        Tue, 09 Dec 2025 00:49:46 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f1cfsm148615065ad.55.2025.12.09.00.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 00:49:46 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 09 Dec 2025 14:19:26 +0530
Subject: [PATCH v5 3/4] clk: qcom: Add TCSR clock driver for Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-gcc_kaanapali-v3-v5-3-3af118262289@oss.qualcomm.com>
References: <20251209-gcc_kaanapali-v3-v5-0-3af118262289@oss.qualcomm.com>
In-Reply-To: <20251209-gcc_kaanapali-v3-v5-0-3af118262289@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=RtnI7SmK c=1 sm=1 tr=0 ts=6937e2ac cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=hY4tN0yg6o136M3hR0AA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _ZGrLZ9oqJyxlxTMxT6yN8e761WNTz4L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA2MSBTYWx0ZWRfX6/wDpcKD6+gd
 bVWW9XGgYDOwZ3KUJ8F+zyY4khvbM2w90lYs6bxU7e/UH5NvAyMQ6K1XsXOgdF4/gjsSGyeQDM+
 zR84Z4JCclz2RNv65TlnW4PjwDHc2hWzJIyAMCcWnReUJMZapUphJIS/7VGAW6SEfGY/lUFepUV
 oTl9TdupjIE4h3TjIc/BPfj3pxWiVWfMHVOs32gx0Ih0NXggtRgkjhbqeWnBc2fpYuDymxuy+LH
 yru26M/QUgQ4eMC3JEd+ZopC7Q9C7Yh80iLye7tBb36NQKT7S9Zi/xSIYg5vLsetTDohj2fiiKL
 zkGbuoAckAugawrfijoW7MmI4GyBs2rfs9VpkmfR41AHVu6PA7aDZM7ILi1Zeq/lNaOvaNLEg1d
 SR198ei/DOZM+UZQJRuomv1TxyWO3w==
X-Proofpoint-GUID: _ZGrLZ9oqJyxlxTMxT6yN8e761WNTz4L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090061

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


