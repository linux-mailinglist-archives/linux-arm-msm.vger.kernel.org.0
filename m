Return-Path: <linux-arm-msm+bounces-74794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D81B9CBE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48BB9422770
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15CF02D6409;
	Wed, 24 Sep 2025 23:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gUpxMWpN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987E52D3209
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758231; cv=none; b=bVFvBlm9mcUqDpvqqNYBTPcNpY6qKmajH3RRqZllozt3UEyochRSFPPlCFWCIOkda1zC8GwqVimsqKx9FKu8v1tc97pl3UopZ7XQ3qHYIr0p8NQl93JmA7kLJIbYV9tgUuXdfEYz0DkRenEVU71nLQRX9m2zwkOZ0Ww80cYE91Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758231; c=relaxed/simple;
	bh=spgGOAokAi4ckCuutp3GRjxz+mEmBk7K+GDePgRrG30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cj5B0SQ2igUaAokdTnLbcIw467TqlMo9klzz/CtuU5L6Idch34erUMNMVLjNazmkF+4K3w3PUgZeTrLv3m4FjwVB6GvD1J/fDYZjDeeUx1EmQm9FPazbmh4xB5T4R4ctcJwjZgPmAhoTjUvsohpxgZbRXfrLhDm9C2o8do/bASU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gUpxMWpN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCj0n4018025
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	glr23SjwFZTzfPhJB4MCp/UIFvG54qhFbCtMcCfOMWI=; b=gUpxMWpNXOJcwbua
	VX5Z4OUf1ZORjIFLYypJAMaSJtuRqBffCd/sLz+OPzuoAumvJ3W8BnPbwhp1qs+N
	6PIqikw4fdtHLUJzpex4u7N3ot3bJKNfDItCcG2ERfxwEOSNutc/5fw6ZnjrzHiD
	2Wa4iCSfF/k4ggJqkY4G7/9r+iqLwHF99GgGAD6LPqYhlDP6ii3IP0nTNEPJCMlm
	Wzt6kRBTSuYDOz0WcKD7l1oHafkueQfHjxhYb4S8sSbVq8CIjR52dlB8COLmlTbI
	Zmw3hbrjbLh2zoagTa0DSjQh2EYUigvTyR6WO2amfCeIKGBL0ilED95J7dkhkOz3
	onNsmw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kka2am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:57:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2697c4e7354so13711705ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758225; x=1759363025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glr23SjwFZTzfPhJB4MCp/UIFvG54qhFbCtMcCfOMWI=;
        b=ABsmdIyQGLMWWAfSGQT1vuq8zKq9IsdZmtX+OotfPcxPOQQWtwooiH7yezgImJcVAm
         zsDL9z7r5L7/bh5u+RsNza3hYN9epIYgW5j9EpzSD0SHNaqTpyponrc8E3ri6su5hrwp
         nTfCq50Gv/NaV/47ucQ55Y9j9ljploH0GxL/fvNmWlOAb9nEm/6Pmb3ReRU+AdK+OJIN
         b5ahYFyn2qR1kRISPYQ0CLBq3heqqjISiqkEXC+V2UCljpoMjWAQYsXXi7vBMBStHVKO
         Xl/kElgh707J3ahS2UXe15zLDkT63nR9CZzB0IEl/79ojNI242NjxF5lv3JpqzcyB7JT
         rCyQ==
X-Gm-Message-State: AOJu0YyS8zvCndrxiWSJpjLZjst+Hp0iFvio/Gw/w0Ybv0vyx8sWjIM6
	NyexwZLoalMJaJBB7Mo2aZh3pSODSvGDuOhdbf+F6mCRkJvzNeAQJauCgeRIlXO9KMO4M0ZmTdQ
	DXRcu0maKj3HKM1Ey2ryDK1NUxAMQx2kh/skiOKheBXGBVn4JOMb/MANgLyx83gCH7PND
X-Gm-Gg: ASbGncvbRfUbs7l9xJIZ9u3ch20alkDD4IbezQU9vPOcwg8NGBJtSUAXJGcNtBP6hUl
	f/BGy4O0wdil4XIXt7KHWOkUNM2TeHbYhP/zoXwvnVMrJRvjtpx+oS0TdmFX6g3LsaotVND6E9i
	prg74Pm/DRLERzF7SqZ50M9zVo9+GxMXcRVPPza6los5Tg4UBP+6Zz0rZI9XHsiGQ8UeOK2hRhe
	zoFoW5J9O1MQV5MmTEEzKf2+a97oJHKqmtCuomiuADDf2jm0QrOrdjkSHx0QMW9EiWaoO0OnELQ
	O+3+dqBu86Gq1Lga6KZpxKpXPO5GXUwH8A29Gm+LtW1y+FryqacUEojX01R3wYEm66AEgJGjqQu
	/24yZ27v6M7lRxmU=
X-Received: by 2002:a17:902:f60d:b0:267:fa8d:29a6 with SMTP id d9443c01a7336-27ed710a48dmr6246695ad.25.1758758224017;
        Wed, 24 Sep 2025 16:57:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1OwZ/Kq+/7uVX9lWVAnbX0LRtgbNjVlc8nyGDpVSoAeycRrbsXEonvkuNAhb5nfDPPVRy7A==
X-Received: by 2002:a17:902:f60d:b0:267:fa8d:29a6 with SMTP id d9443c01a7336-27ed710a48dmr6246405ad.25.1758758223194;
        Wed, 24 Sep 2025 16:57:03 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6881fd6sm4557185ad.87.2025.09.24.16.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:57:02 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:56:47 -0700
Subject: [PATCH 6/9] clk: qcom: dispcc: Add support for display clock
 controller Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-mmclk-v1-6-d7ea96b4784a@oss.qualcomm.com>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
In-Reply-To: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758212; l=61233;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=c9zg1mP6Uz7Fo5EIxhFBBejhLvvilATnaGXeB47yex4=;
 b=Onxsr5f3k17iqQGKg3ncWwDOzvXae/NeGBxUKW1i6DLmO85MrDtvdcoEgRGhWqA7wQ/vXr687
 IN5X5vQZn3QD0EIOLkjDkD80YUkEuj+3c9yZhoYe22XFrdefMCh66rq
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: 7Pvli8-HRE2MnT0JKFwbhT0VzXzv43Ny
X-Proofpoint-ORIG-GUID: 7Pvli8-HRE2MnT0JKFwbhT0VzXzv43Ny
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX/9QHKW+NQoV8
 EUWCTkwiYykJ+ZdOeyAzHx+9xYWGmXATyN2AD4hpezoId9LI7l9qHl7B1we3OKMvvwKiHbFMxKh
 nkc99ZRbd3yE3Ah6zE1e/Y9oWnhFID7ols1on11VZNevFPEssGjf0uQNmYR07D60SasduxrTCfP
 ByuvVsgoHYCXHopcEePy3YeN2jRnxNRAN0Zmk/fTcmQ1dtDwcs/693unw8sT8ZFYCyYrlr8P+8N
 koLTHKg1GYiVtEp3Xg0d32uncSltSBetyioT/3NsZuoV/1OvNLCveTdIZgIjJLUArzgsFA4BshG
 3HIeDYPXJjneAoGicQRrKucOV+v5W2BH/Ih8i7QSbmrW6SgvMAU3akVZ7PJ/7k9YtpU6H36VPBH
 mbFFx4Zw
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d48552 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=CTeyeF6quU7oAeRjbeoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

From: Taniya Das <taniya.das@oss.qualcomm.com>

Support the clock controller driver for Kaanapali to enable display SW to
be able to control the clocks.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig            |   10 +
 drivers/clk/qcom/Makefile           |    1 +
 drivers/clk/qcom/dispcc-kaanapali.c | 1956 +++++++++++++++++++++++++++++++++++
 3 files changed, 1967 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 8a58dff7ccf2..d9cec3e52c25 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -46,6 +46,16 @@ config CLK_GLYMUR_TCSRCC
 	  Support for the TCSR clock controller on GLYMUR devices.
 	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
 
+config CLK_KAANAPALI_DISPCC
+	tristate "KAANAPALI Display Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_KAANAPALI_GCC
+	help
+	  Support for the display clock controller on Qualcomm Technologies, Inc
+	  Kaanapali devices.
+	  Say Y if you want to support display devices and functionality such as
+	  splash screen.
+
 config CLK_KAANAPALI_GCC
 	tristate "KAANAPALI Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 5207e05e1c69..c42de903ef0d 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
+obj-$(CONFIG_CLK_KAANAPALI_DISPCC) += dispcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
diff --git a/drivers/clk/qcom/dispcc-kaanapali.c b/drivers/clk/qcom/dispcc-kaanapali.c
new file mode 100644
index 000000000000..a59f70c6ce6d
--- /dev/null
+++ b/drivers/clk/qcom/dispcc-kaanapali.c
@@ -0,0 +1,1956 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,kaanapali-dispcc.h>
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
+#define DISP_CC_MISC_CMD	0xF000
+
+enum {
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_AHB_CLK,
+	DT_SLEEP_CLK,
+	DT_DP0_PHY_PLL_LINK_CLK,
+	DT_DP0_PHY_PLL_VCO_DIV_CLK,
+	DT_DP1_PHY_PLL_LINK_CLK,
+	DT_DP1_PHY_PLL_VCO_DIV_CLK,
+	DT_DP2_PHY_PLL_LINK_CLK,
+	DT_DP2_PHY_PLL_VCO_DIV_CLK,
+	DT_DP3_PHY_PLL_LINK_CLK,
+	DT_DP3_PHY_PLL_VCO_DIV_CLK,
+	DT_DSI0_PHY_PLL_OUT_BYTECLK,
+	DT_DSI0_PHY_PLL_OUT_DSICLK,
+	DT_DSI1_PHY_PLL_OUT_BYTECLK,
+	DT_DSI1_PHY_PLL_OUT_DSICLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_DISP_CC_PLL0_OUT_MAIN,
+	P_DISP_CC_PLL1_OUT_EVEN,
+	P_DISP_CC_PLL1_OUT_MAIN,
+	P_DISP_CC_PLL2_OUT_MAIN,
+	P_DP0_PHY_PLL_LINK_CLK,
+	P_DP0_PHY_PLL_VCO_DIV_CLK,
+	P_DP1_PHY_PLL_LINK_CLK,
+	P_DP1_PHY_PLL_VCO_DIV_CLK,
+	P_DP2_PHY_PLL_LINK_CLK,
+	P_DP2_PHY_PLL_VCO_DIV_CLK,
+	P_DP3_PHY_PLL_LINK_CLK,
+	P_DP3_PHY_PLL_VCO_DIV_CLK,
+	P_DSI0_PHY_PLL_OUT_BYTECLK,
+	P_DSI0_PHY_PLL_OUT_DSICLK,
+	P_DSI1_PHY_PLL_OUT_BYTECLK,
+	P_DSI1_PHY_PLL_OUT_DSICLK,
+};
+
+static const struct pll_vco pongo_eko_t_vco[] = {
+	{ 38400000, 153600000, 0 },
+};
+
+static const struct pll_vco taycan_eko_t_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+/* 257.142858 MHz Configuration */
+static const struct alpha_pll_config disp_cc_pll0_config = {
+	.l = 0xd,
+	.cal_l = 0x48,
+	.alpha = 0x6492,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8062e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000008,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll disp_cc_pll0 = {
+	.offset = 0x0,
+	.config = &disp_cc_pll0_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+/* 300.0 MHz Configuration */
+static const struct alpha_pll_config disp_cc_pll1_config = {
+	.l = 0xf,
+	.cal_l = 0x48,
+	.alpha = 0xa000,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8062e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000008,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll disp_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &disp_cc_pll1_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+/* 38.4 MHz Configuration */
+static const struct alpha_pll_config disp_cc_pll2_config = {
+	.l = 0x493,
+	.cal_l = 0x493,
+	.alpha = 0x0,
+	.config_ctl_val = 0x60000f68,
+	.config_ctl_hi_val = 0x0001c808,
+	.config_ctl_hi1_val = 0x00000000,
+	.config_ctl_hi2_val = 0x040082f4,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x0080c496,
+	.test_ctl_hi1_val = 0x40100080,
+	.test_ctl_hi2_val = 0x001001bc,
+	.test_ctl_hi3_val = 0x002003d8,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00e50302,
+};
+
+static struct clk_alpha_pll disp_cc_pll2 = {
+	.offset = 0x2000,
+	.config = &disp_cc_pll2_config,
+	.vco_table = pongo_eko_t_vco,
+	.num_vco = ARRAY_SIZE(pongo_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_PONGO_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_pll2",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_SLEEP_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_pongo_eko_t_ops,
+		},
+	},
+};
+
+static const struct parent_map disp_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map disp_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
+	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
+	{ P_DSI1_PHY_PLL_OUT_DSICLK, 3 },
+	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_DSICLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_BYTECLK },
+};
+
+static const struct parent_map disp_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP3_PHY_PLL_VCO_DIV_CLK, 3 },
+	{ P_DP1_PHY_PLL_VCO_DIV_CLK, 4 },
+	{ P_DP2_PHY_PLL_VCO_DIV_CLK, 6 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP3_PHY_PLL_VCO_DIV_CLK },
+	{ .index = DT_DP1_PHY_PLL_VCO_DIV_CLK },
+	{ .index = DT_DP2_PHY_PLL_VCO_DIV_CLK },
+};
+
+static const struct parent_map disp_cc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP1_PHY_PLL_LINK_CLK, 2 },
+	{ P_DP2_PHY_PLL_LINK_CLK, 3 },
+	{ P_DP3_PHY_PLL_LINK_CLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP1_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP2_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP3_PHY_PLL_LINK_CLK },
+};
+
+static const struct parent_map disp_cc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
+	{ P_DISP_CC_PLL2_OUT_MAIN, 2 },
+	{ P_DSI1_PHY_PLL_OUT_DSICLK, 3 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_4[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK },
+	{ .hw = &disp_cc_pll2.clkr.hw },
+	{ .index = DT_DSI1_PHY_PLL_OUT_DSICLK },
+};
+
+static const struct parent_map disp_cc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP0_PHY_PLL_LINK_CLK, 1 },
+	{ P_DP0_PHY_PLL_VCO_DIV_CLK, 2 },
+	{ P_DP3_PHY_PLL_VCO_DIV_CLK, 3 },
+	{ P_DP1_PHY_PLL_VCO_DIV_CLK, 4 },
+	{ P_DP2_PHY_PLL_VCO_DIV_CLK, 6 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_5[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP0_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP0_PHY_PLL_VCO_DIV_CLK },
+	{ .index = DT_DP3_PHY_PLL_VCO_DIV_CLK },
+	{ .index = DT_DP1_PHY_PLL_VCO_DIV_CLK },
+	{ .index = DT_DP2_PHY_PLL_VCO_DIV_CLK },
+};
+
+static const struct parent_map disp_cc_parent_map_6[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
+	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_6[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_BYTECLK },
+};
+
+static const struct parent_map disp_cc_parent_map_7[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DISP_CC_PLL1_OUT_MAIN, 4 },
+	{ P_DISP_CC_PLL1_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_7[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &disp_cc_pll1.clkr.hw },
+	{ .hw = &disp_cc_pll1.clkr.hw },
+};
+
+static const struct parent_map disp_cc_parent_map_8[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP0_PHY_PLL_LINK_CLK, 1 },
+	{ P_DP1_PHY_PLL_LINK_CLK, 2 },
+	{ P_DP2_PHY_PLL_LINK_CLK, 3 },
+	{ P_DP3_PHY_PLL_LINK_CLK, 4 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_8[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DP0_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP1_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP2_PHY_PLL_LINK_CLK },
+	{ .index = DT_DP3_PHY_PLL_LINK_CLK },
+};
+
+static const struct parent_map disp_cc_parent_map_9[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DISP_CC_PLL0_OUT_MAIN, 1 },
+	{ P_DISP_CC_PLL1_OUT_MAIN, 4 },
+	{ P_DISP_CC_PLL1_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_9[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &disp_cc_pll0.clkr.hw },
+	{ .hw = &disp_cc_pll1.clkr.hw },
+	{ .hw = &disp_cc_pll1.clkr.hw },
+};
+
+static const struct parent_map disp_cc_parent_map_10[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DISP_CC_PLL2_OUT_MAIN, 2 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_10[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &disp_cc_pll2.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_disp_cc_esync0_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_esync0_clk_src = {
+	.cmd_rcgr = 0x80d4,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_4,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_esync0_clk_src",
+		.parent_data = disp_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_esync1_clk_src = {
+	.cmd_rcgr = 0x80ec,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_4,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_esync1_clk_src",
+		.parent_data = disp_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(100000000, P_DISP_CC_PLL1_OUT_EVEN, 3, 0, 0),
+	F(120000000, P_DISP_CC_PLL1_OUT_EVEN, 3, 0, 0),
+	F(165000000, P_DISP_CC_PLL1_OUT_EVEN, 3, 0, 0),
+	F(200000000, P_DISP_CC_PLL1_OUT_EVEN, 3, 0, 0),
+	F(233333333, P_DISP_CC_PLL1_OUT_EVEN, 3, 0, 0),
+	F(261666667, P_DISP_CC_PLL1_OUT_EVEN, 3, 0, 0),
+	F(283333333, P_DISP_CC_PLL1_OUT_EVEN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
+	.cmd_rcgr = 0x8378,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_7,
+	.freq_tbl = ftbl_disp_cc_mdss_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_ahb_clk_src",
+		.parent_data = disp_cc_parent_data_7,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_7),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
+	.cmd_rcgr = 0x8194,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_byte0_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_byte1_clk_src = {
+	.cmd_rcgr = 0x81b0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_byte1_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx0_aux_clk_src = {
+	.cmd_rcgr = 0x8248,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx0_aux_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx0_link_clk_src = {
+	.cmd_rcgr = 0x81fc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_8,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx0_link_clk_src",
+		.parent_data = disp_cc_parent_data_8,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_8),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx0_pixel0_clk_src = {
+	.cmd_rcgr = 0x8218,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_5,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx0_pixel0_clk_src",
+		.parent_data = disp_cc_parent_data_5,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx0_pixel1_clk_src = {
+	.cmd_rcgr = 0x8230,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_5,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx0_pixel1_clk_src",
+		.parent_data = disp_cc_parent_data_5,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
+	.cmd_rcgr = 0x82ac,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx1_aux_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx1_link_clk_src = {
+	.cmd_rcgr = 0x8290,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_3,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx1_link_clk_src",
+		.parent_data = disp_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx1_pixel0_clk_src = {
+	.cmd_rcgr = 0x8260,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx1_pixel0_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx1_pixel1_clk_src = {
+	.cmd_rcgr = 0x8278,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx1_pixel1_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx2_aux_clk_src = {
+	.cmd_rcgr = 0x8310,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx2_aux_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx2_link_clk_src = {
+	.cmd_rcgr = 0x82c4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_3,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx2_link_clk_src",
+		.parent_data = disp_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx2_pixel0_clk_src = {
+	.cmd_rcgr = 0x82e0,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx2_pixel0_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx2_pixel1_clk_src = {
+	.cmd_rcgr = 0x82f8,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx2_pixel1_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx3_aux_clk_src = {
+	.cmd_rcgr = 0x835c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx3_aux_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx3_link_clk_src = {
+	.cmd_rcgr = 0x8340,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_3,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx3_link_clk_src",
+		.parent_data = disp_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dptx3_pixel0_clk_src = {
+	.cmd_rcgr = 0x8328,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx3_pixel0_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
+	.cmd_rcgr = 0x81cc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_6,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_esc0_clk_src",
+		.parent_data = disp_cc_parent_data_6,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
+	.cmd_rcgr = 0x81e4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_6,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_esc1_clk_src",
+		.parent_data = disp_cc_parent_data_6,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_disp_cc_mdss_mdp_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(85714286, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(100000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(156000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(207000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(337000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(417000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(532000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(600000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(650000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
+	.cmd_rcgr = 0x8164,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_9,
+	.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_mdp_clk_src",
+		.parent_data = disp_cc_parent_data_9,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_9),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
+	.cmd_rcgr = 0x811c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_pclk0_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
+	.cmd_rcgr = 0x8134,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_pclk1_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_pclk2_clk_src = {
+	.cmd_rcgr = 0x814c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_pclk2_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
+	.cmd_rcgr = 0x817c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.freq_tbl = ftbl_disp_cc_esync0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_vsync_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_disp_cc_osc_clk_src[] = {
+	F(38400000, P_DISP_CC_PLL2_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_osc_clk_src = {
+	.cmd_rcgr = 0x8104,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_10,
+	.freq_tbl = ftbl_disp_cc_osc_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_osc_clk_src",
+		.parent_data = disp_cc_parent_data_10,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_10),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_ahb_swi_div_clk_src = {
+	.reg = 0x8374,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_ahb_swi_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_ahb_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
+	.reg = 0x81ac,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_byte0_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_byte0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
+	.reg = 0x81c8,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_byte1_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_byte1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_dptx0_link_div_clk_src = {
+	.reg = 0x8214,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx0_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_dptx1_link_div_clk_src = {
+	.reg = 0x82a8,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx1_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_dptx2_link_div_clk_src = {
+	.reg = 0x82dc,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx2_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_dptx3_link_div_clk_src = {
+	.reg = 0x8358,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "disp_cc_mdss_dptx3_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch disp_cc_esync0_clk = {
+	.halt_reg = 0x80cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_esync0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_esync0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_esync1_clk = {
+	.halt_reg = 0x80d0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80d0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_esync1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_esync1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_accu_shift_clk = {
+	.halt_reg = 0xe060,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xe060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_accu_shift_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_ahb1_clk = {
+	.halt_reg = 0xa028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_ahb1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_ahb_clk = {
+	.halt_reg = 0x80c4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80c4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_ahb_swi_clk = {
+	.halt_reg = 0x80c0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80c0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_ahb_swi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_ahb_swi_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_byte0_clk = {
+	.halt_reg = 0x8044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_byte0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_byte0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_byte0_intf_clk = {
+	.halt_reg = 0x8048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_byte0_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_byte0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_byte1_clk = {
+	.halt_reg = 0x804c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x804c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_byte1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_byte1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_byte1_intf_clk = {
+	.halt_reg = 0x8050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8050,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_byte1_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_byte1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx0_aux_clk = {
+	.halt_reg = 0x8074,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8074,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx0_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx0_crypto_clk = {
+	.halt_reg = 0x8068,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx0_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx0_link_clk = {
+	.halt_reg = 0x805c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x805c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx0_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx0_link_intf_clk = {
+	.halt_reg = 0x8064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx0_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx0_pixel0_clk = {
+	.halt_reg = 0x806c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x806c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx0_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx0_pixel1_clk = {
+	.halt_reg = 0x8070,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx0_pixel1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx0_usb_router_link_intf_clk = {
+	.halt_reg = 0x8060,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx0_usb_router_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx1_aux_clk = {
+	.halt_reg = 0x8090,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8090,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx1_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx1_crypto_clk = {
+	.halt_reg = 0x808c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x808c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx1_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx1_link_clk = {
+	.halt_reg = 0x8080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8080,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx1_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx1_link_intf_clk = {
+	.halt_reg = 0x8088,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8088,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx1_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx1_pixel0_clk = {
+	.halt_reg = 0x8078,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8078,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx1_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx1_pixel1_clk = {
+	.halt_reg = 0x807c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x807c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx1_pixel1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx1_usb_router_link_intf_clk = {
+	.halt_reg = 0x8084,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8084,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx1_usb_router_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx2_aux_clk = {
+	.halt_reg = 0x80a8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx2_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx2_crypto_clk = {
+	.halt_reg = 0x80a4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x80a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx2_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx2_link_clk = {
+	.halt_reg = 0x809c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x809c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx2_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx2_link_intf_clk = {
+	.halt_reg = 0x80a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx2_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx2_pixel0_clk = {
+	.halt_reg = 0x8094,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8094,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx2_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx2_pixel1_clk = {
+	.halt_reg = 0x8098,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8098,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx2_pixel1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_pixel1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx3_aux_clk = {
+	.halt_reg = 0x80b8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx3_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx3_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx3_crypto_clk = {
+	.halt_reg = 0x80bc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x80bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx3_crypto_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx3_link_clk = {
+	.halt_reg = 0x80b0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80b0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx3_link_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx3_link_intf_clk = {
+	.halt_reg = 0x80b4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx3_link_intf_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx3_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dptx3_pixel0_clk = {
+	.halt_reg = 0x80ac,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80ac,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_dptx3_pixel0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx3_pixel0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_esc0_clk = {
+	.halt_reg = 0x8054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8054,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_esc0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_esc0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_esc1_clk = {
+	.halt_reg = 0x8058,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8058,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_esc1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_esc1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_mdp1_clk = {
+	.halt_reg = 0xa004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_mdp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_mdp_clk = {
+	.halt_reg = 0x8010,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_mdp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_mdp_lut1_clk = {
+	.halt_reg = 0xa014,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xa014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_mdp_lut1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_mdp_lut_clk = {
+	.halt_reg = 0x8020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_mdp_lut_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_mdp_ss_ip_clk = {
+	.halt_reg = 0x8030,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_mdp_ss_ip_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_non_gdsc_ahb_clk = {
+	.halt_reg = 0xc004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xc004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_non_gdsc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_pclk0_clk = {
+	.halt_reg = 0x8004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_pclk0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_pclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_pclk1_clk = {
+	.halt_reg = 0x8008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_pclk1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_pclk1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_pclk2_clk = {
+	.halt_reg = 0x800c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x800c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_pclk2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_pclk2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_vsync1_clk = {
+	.halt_reg = 0xa024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_vsync1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_vsync_clk = {
+	.halt_reg = 0x8040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_mdss_vsync_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_osc_clk = {
+	.halt_reg = 0x80c8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80c8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "disp_cc_osc_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_osc_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc disp_cc_mdss_core_gdsc = {
+	.gdscr = 0x9000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "disp_cc_mdss_core_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL_TRIGGER,
+};
+
+static struct gdsc disp_cc_mdss_core_int2_gdsc = {
+	.gdscr = 0xb000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "disp_cc_mdss_core_int2_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL_TRIGGER,
+};
+
+static struct clk_regmap *disp_cc_kaanapali_clocks[] = {
+	[DISP_CC_ESYNC0_CLK] = &disp_cc_esync0_clk.clkr,
+	[DISP_CC_ESYNC0_CLK_SRC] = &disp_cc_esync0_clk_src.clkr,
+	[DISP_CC_ESYNC1_CLK] = &disp_cc_esync1_clk.clkr,
+	[DISP_CC_ESYNC1_CLK_SRC] = &disp_cc_esync1_clk_src.clkr,
+	[DISP_CC_MDSS_ACCU_SHIFT_CLK] = &disp_cc_mdss_accu_shift_clk.clkr,
+	[DISP_CC_MDSS_AHB1_CLK] = &disp_cc_mdss_ahb1_clk.clkr,
+	[DISP_CC_MDSS_AHB_CLK] = &disp_cc_mdss_ahb_clk.clkr,
+	[DISP_CC_MDSS_AHB_CLK_SRC] = &disp_cc_mdss_ahb_clk_src.clkr,
+	[DISP_CC_MDSS_AHB_SWI_CLK] = &disp_cc_mdss_ahb_swi_clk.clkr,
+	[DISP_CC_MDSS_AHB_SWI_DIV_CLK_SRC] = &disp_cc_mdss_ahb_swi_div_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE0_CLK] = &disp_cc_mdss_byte0_clk.clkr,
+	[DISP_CC_MDSS_BYTE0_CLK_SRC] = &disp_cc_mdss_byte0_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE0_DIV_CLK_SRC] = &disp_cc_mdss_byte0_div_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE0_INTF_CLK] = &disp_cc_mdss_byte0_intf_clk.clkr,
+	[DISP_CC_MDSS_BYTE1_CLK] = &disp_cc_mdss_byte1_clk.clkr,
+	[DISP_CC_MDSS_BYTE1_CLK_SRC] = &disp_cc_mdss_byte1_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE1_DIV_CLK_SRC] = &disp_cc_mdss_byte1_div_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE1_INTF_CLK] = &disp_cc_mdss_byte1_intf_clk.clkr,
+	[DISP_CC_MDSS_DPTX0_AUX_CLK] = &disp_cc_mdss_dptx0_aux_clk.clkr,
+	[DISP_CC_MDSS_DPTX0_AUX_CLK_SRC] = &disp_cc_mdss_dptx0_aux_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX0_CRYPTO_CLK] = &disp_cc_mdss_dptx0_crypto_clk.clkr,
+	[DISP_CC_MDSS_DPTX0_LINK_CLK] = &disp_cc_mdss_dptx0_link_clk.clkr,
+	[DISP_CC_MDSS_DPTX0_LINK_CLK_SRC] = &disp_cc_mdss_dptx0_link_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC] = &disp_cc_mdss_dptx0_link_div_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX0_LINK_INTF_CLK] = &disp_cc_mdss_dptx0_link_intf_clk.clkr,
+	[DISP_CC_MDSS_DPTX0_PIXEL0_CLK] = &disp_cc_mdss_dptx0_pixel0_clk.clkr,
+	[DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC] = &disp_cc_mdss_dptx0_pixel0_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX0_PIXEL1_CLK] = &disp_cc_mdss_dptx0_pixel1_clk.clkr,
+	[DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC] = &disp_cc_mdss_dptx0_pixel1_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK] =
+		&disp_cc_mdss_dptx0_usb_router_link_intf_clk.clkr,
+	[DISP_CC_MDSS_DPTX1_AUX_CLK] = &disp_cc_mdss_dptx1_aux_clk.clkr,
+	[DISP_CC_MDSS_DPTX1_AUX_CLK_SRC] = &disp_cc_mdss_dptx1_aux_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX1_CRYPTO_CLK] = &disp_cc_mdss_dptx1_crypto_clk.clkr,
+	[DISP_CC_MDSS_DPTX1_LINK_CLK] = &disp_cc_mdss_dptx1_link_clk.clkr,
+	[DISP_CC_MDSS_DPTX1_LINK_CLK_SRC] = &disp_cc_mdss_dptx1_link_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC] = &disp_cc_mdss_dptx1_link_div_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX1_LINK_INTF_CLK] = &disp_cc_mdss_dptx1_link_intf_clk.clkr,
+	[DISP_CC_MDSS_DPTX1_PIXEL0_CLK] = &disp_cc_mdss_dptx1_pixel0_clk.clkr,
+	[DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC] = &disp_cc_mdss_dptx1_pixel0_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX1_PIXEL1_CLK] = &disp_cc_mdss_dptx1_pixel1_clk.clkr,
+	[DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC] = &disp_cc_mdss_dptx1_pixel1_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK] =
+		&disp_cc_mdss_dptx1_usb_router_link_intf_clk.clkr,
+	[DISP_CC_MDSS_DPTX2_AUX_CLK] = &disp_cc_mdss_dptx2_aux_clk.clkr,
+	[DISP_CC_MDSS_DPTX2_AUX_CLK_SRC] = &disp_cc_mdss_dptx2_aux_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX2_CRYPTO_CLK] = &disp_cc_mdss_dptx2_crypto_clk.clkr,
+	[DISP_CC_MDSS_DPTX2_LINK_CLK] = &disp_cc_mdss_dptx2_link_clk.clkr,
+	[DISP_CC_MDSS_DPTX2_LINK_CLK_SRC] = &disp_cc_mdss_dptx2_link_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC] = &disp_cc_mdss_dptx2_link_div_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX2_LINK_INTF_CLK] = &disp_cc_mdss_dptx2_link_intf_clk.clkr,
+	[DISP_CC_MDSS_DPTX2_PIXEL0_CLK] = &disp_cc_mdss_dptx2_pixel0_clk.clkr,
+	[DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC] = &disp_cc_mdss_dptx2_pixel0_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX2_PIXEL1_CLK] = &disp_cc_mdss_dptx2_pixel1_clk.clkr,
+	[DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC] = &disp_cc_mdss_dptx2_pixel1_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX3_AUX_CLK] = &disp_cc_mdss_dptx3_aux_clk.clkr,
+	[DISP_CC_MDSS_DPTX3_AUX_CLK_SRC] = &disp_cc_mdss_dptx3_aux_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX3_CRYPTO_CLK] = &disp_cc_mdss_dptx3_crypto_clk.clkr,
+	[DISP_CC_MDSS_DPTX3_LINK_CLK] = &disp_cc_mdss_dptx3_link_clk.clkr,
+	[DISP_CC_MDSS_DPTX3_LINK_CLK_SRC] = &disp_cc_mdss_dptx3_link_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC] = &disp_cc_mdss_dptx3_link_div_clk_src.clkr,
+	[DISP_CC_MDSS_DPTX3_LINK_INTF_CLK] = &disp_cc_mdss_dptx3_link_intf_clk.clkr,
+	[DISP_CC_MDSS_DPTX3_PIXEL0_CLK] = &disp_cc_mdss_dptx3_pixel0_clk.clkr,
+	[DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC] = &disp_cc_mdss_dptx3_pixel0_clk_src.clkr,
+	[DISP_CC_MDSS_ESC0_CLK] = &disp_cc_mdss_esc0_clk.clkr,
+	[DISP_CC_MDSS_ESC0_CLK_SRC] = &disp_cc_mdss_esc0_clk_src.clkr,
+	[DISP_CC_MDSS_ESC1_CLK] = &disp_cc_mdss_esc1_clk.clkr,
+	[DISP_CC_MDSS_ESC1_CLK_SRC] = &disp_cc_mdss_esc1_clk_src.clkr,
+	[DISP_CC_MDSS_MDP1_CLK] = &disp_cc_mdss_mdp1_clk.clkr,
+	[DISP_CC_MDSS_MDP_CLK] = &disp_cc_mdss_mdp_clk.clkr,
+	[DISP_CC_MDSS_MDP_CLK_SRC] = &disp_cc_mdss_mdp_clk_src.clkr,
+	[DISP_CC_MDSS_MDP_LUT1_CLK] = &disp_cc_mdss_mdp_lut1_clk.clkr,
+	[DISP_CC_MDSS_MDP_LUT_CLK] = &disp_cc_mdss_mdp_lut_clk.clkr,
+	[DISP_CC_MDSS_MDP_SS_IP_CLK] = &disp_cc_mdss_mdp_ss_ip_clk.clkr,
+	[DISP_CC_MDSS_NON_GDSC_AHB_CLK] = &disp_cc_mdss_non_gdsc_ahb_clk.clkr,
+	[DISP_CC_MDSS_PCLK0_CLK] = &disp_cc_mdss_pclk0_clk.clkr,
+	[DISP_CC_MDSS_PCLK0_CLK_SRC] = &disp_cc_mdss_pclk0_clk_src.clkr,
+	[DISP_CC_MDSS_PCLK1_CLK] = &disp_cc_mdss_pclk1_clk.clkr,
+	[DISP_CC_MDSS_PCLK1_CLK_SRC] = &disp_cc_mdss_pclk1_clk_src.clkr,
+	[DISP_CC_MDSS_PCLK2_CLK] = &disp_cc_mdss_pclk2_clk.clkr,
+	[DISP_CC_MDSS_PCLK2_CLK_SRC] = &disp_cc_mdss_pclk2_clk_src.clkr,
+	[DISP_CC_MDSS_VSYNC1_CLK] = &disp_cc_mdss_vsync1_clk.clkr,
+	[DISP_CC_MDSS_VSYNC_CLK] = &disp_cc_mdss_vsync_clk.clkr,
+	[DISP_CC_MDSS_VSYNC_CLK_SRC] = &disp_cc_mdss_vsync_clk_src.clkr,
+	[DISP_CC_OSC_CLK] = &disp_cc_osc_clk.clkr,
+	[DISP_CC_OSC_CLK_SRC] = &disp_cc_osc_clk_src.clkr,
+	[DISP_CC_PLL0] = &disp_cc_pll0.clkr,
+	[DISP_CC_PLL1] = &disp_cc_pll1.clkr,
+	[DISP_CC_PLL2] = &disp_cc_pll2.clkr,
+};
+
+static struct gdsc *disp_cc_kaanapali_gdscs[] = {
+	[DISP_CC_MDSS_CORE_GDSC] = &disp_cc_mdss_core_gdsc,
+	[DISP_CC_MDSS_CORE_INT2_GDSC] = &disp_cc_mdss_core_int2_gdsc,
+};
+
+static const struct qcom_reset_map disp_cc_kaanapali_resets[] = {
+	[DISP_CC_MDSS_CORE_BCR] = { 0x8000 },
+	[DISP_CC_MDSS_CORE_INT2_BCR] = { 0xa000 },
+	[DISP_CC_MDSS_RSCC_BCR] = { 0xc000 },
+};
+
+static struct clk_alpha_pll *disp_cc_kaanapali_plls[] = {
+	&disp_cc_pll0,
+	&disp_cc_pll1,
+	&disp_cc_pll2,
+};
+
+static u32 disp_cc_kaanapali_critical_cbcrs[] = {
+	0xe064, /* DISP_CC_SLEEP_CLK */
+	0xe05c, /* DISP_CC_XO_CLK */
+	0xc00c, /* DISP_CC_MDSS_RSCC_AHB_CLK */
+	0xc008, /* DISP_CC_MDSS_RSCC_VSYNC_CLK */
+};
+
+static const struct regmap_config disp_cc_kaanapali_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x12094,
+	.fast_io = true,
+};
+
+static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Enable clock gating for MDP clocks */
+	regmap_update_bits(regmap, DISP_CC_MISC_CMD, BIT(4), BIT(4));
+}
+
+static struct qcom_cc_driver_data disp_cc_kaanapali_driver_data = {
+	.alpha_plls = disp_cc_kaanapali_plls,
+	.num_alpha_plls = ARRAY_SIZE(disp_cc_kaanapali_plls),
+	.clk_cbcrs = disp_cc_kaanapali_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_kaanapali_critical_cbcrs),
+	.clk_regs_configure = clk_kaanapali_regs_configure,
+};
+
+static const struct qcom_cc_desc disp_cc_kaanapali_desc = {
+	.config = &disp_cc_kaanapali_regmap_config,
+	.clks = disp_cc_kaanapali_clocks,
+	.num_clks = ARRAY_SIZE(disp_cc_kaanapali_clocks),
+	.resets = disp_cc_kaanapali_resets,
+	.num_resets = ARRAY_SIZE(disp_cc_kaanapali_resets),
+	.gdscs = disp_cc_kaanapali_gdscs,
+	.num_gdscs = ARRAY_SIZE(disp_cc_kaanapali_gdscs),
+	.use_rpm = true,
+	.driver_data = &disp_cc_kaanapali_driver_data,
+};
+
+static const struct of_device_id disp_cc_kaanapali_match_table[] = {
+	{ .compatible = "qcom,kaanapali-dispcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, disp_cc_kaanapali_match_table);
+
+static int disp_cc_kaanapali_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &disp_cc_kaanapali_desc);
+}
+
+static struct platform_driver disp_cc_kaanapali_driver = {
+	.probe = disp_cc_kaanapali_probe,
+	.driver = {
+		.name = "dispcc-kaanapali",
+		.of_match_table = disp_cc_kaanapali_match_table,
+	},
+};
+
+module_platform_driver(disp_cc_kaanapali_driver);
+
+MODULE_DESCRIPTION("QTI DISPCC KAANAPALI Driver");
+MODULE_LICENSE("GPL");

-- 
2.25.1


