Return-Path: <linux-arm-msm+bounces-52135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DF7A6B37F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 04:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E43E3B0A2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 03:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DE51E3793;
	Fri, 21 Mar 2025 03:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LeAXkl7u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1761C174A;
	Fri, 21 Mar 2025 03:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742529429; cv=none; b=JSBSzZzAtvAaT6p0GhjbkZYGwOAT8BTkfTQ79C51100z0d9nxK7IGErv6XwDAO5Q3LFr9Wmmhjv/pDguRsvbuOIUU/+uONU88z4CCbJXnQbdt4QRN4EOc8jTZr2+SUsyC0qFNQanmr6yecGjNAspjv7sIQo4BfaqqHi13kVq8FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742529429; c=relaxed/simple;
	bh=qTrsTGdXNWu2G9qEf8s7n5UKFLe2LhpEys5/4YyuWow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Qk9r8E+xj8MX3j6oIw93U1fHpz6/Dz69XRVcAD7meHGiutvf2NAEv3eqtnUxFNfJDAMQ6hjqk+w6BWz2J5Yrm1fgi/kkpVPSm9JvvjFQpVzImzHDTq5Un72B0NwFQYM6T3+KBCaApeedY6ZMbhdQP8t00RCPXL/OdVsi1Ho0eBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LeAXkl7u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L1WZqH016168;
	Fri, 21 Mar 2025 03:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rflv5V+DF8RxSmFhtYuCqU
	A8PFZhbR9esRHaU6wuL7M=; b=LeAXkl7uicX0BRCoiVX+hKsIZFznB8KdNNQtDm
	pX0y1OIvMdiV3GimNainMlnAE9uvXlhVYN1zrBbc2852AujAHc52Z2IQWynvhHg2
	neAqjIXXCw5kKJIb1LH5o+3qHPVXDfnV4flguMWO/rMSOTsNBTotLWzuhgK7w1LT
	fSjh4QDjjxiBJjbxkeYlDwC5FjCoJyFfOx7ALNXitrlpIc+mrI13lFni2oI61hQ6
	igUvR85w/q5Weye4F8uJcnP91DjohSnDBEbVWiZRhrcN1+/57Kr2IFSOiXzlrmDj
	kDgZOpG8MH2gS60/0DoV9NC/2WeXw7j15ezRnGuHGOAJeBfQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g3sf4mft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 03:57:02 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52L3v1EH013508
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 03:57:01 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Mar 2025 20:56:58 -0700
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Fri, 21 Mar 2025 09:26:43 +0530
Subject: [PATCH v5] clk: qcom: Add support for Camera Clock Controller on
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250321-qcs8300-mm-patches-v5-1-9d751d7e49ef@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAHrj3GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyMD3cLkYgtjAwPd3FzdgsSS5IzUYl3TVMO05GTDFDNzSxMloMaCotS
 0zAqwodGxtbUAkMgKS2QAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9dvSY8M6wxh7568H1xsVcw0OdRW4kq_S
X-Proofpoint-ORIG-GUID: 9dvSY8M6wxh7568H1xsVcw0OdRW4kq_S
X-Authority-Analysis: v=2.4 cv=R9IDGcRX c=1 sm=1 tr=0 ts=67dce38e cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=GX2mzFjyc8Gkx4eyK_sA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_01,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1011 mlxscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210024

The QCS8300 Camera clock controller is a derivative of SA8775P, but has
few additional clocks and offset differences. Hence, add support for
QCS8300 Camera clock controller by extending the SA8775P CamCC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
This patch series add support for GPUCC, CAMCC and VIDEOCC on Qualcomm
QCS8300 platform.

Changes in v5:
- Subset of this patch series is alreday applied, but CamCC driver patch
is not picked yet. Hence resend the CamCC driver patch.
- Link to v4: https://lore.kernel.org/all/20250109-qcs8300-mm-patches-new-v4-0-63e8ac268b02@quicinc.com/

Changes in v4:
- Updated the commit text as per the comment from Bjorn.
- Fixed the CamCC QDSS clock offset.
- Link to v3: https://lore.kernel.org/all/20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com/

Changes in v3:
- Added new GPUCC and CAMCC binding headers for QCS8300 as per the review comments
- Updated the new bindings header files for GPUCC and CAMCC drivers.
- Added the R-By tags received in v2.
- Link to v2: https://lore.kernel.org/r/20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com

Changes in v2:
- Updated commit text details in bindings patches as per the review comments.
- Sorted the compatible order and updated comment in VideoCC driver patch as per the review comments.
- Added the R-By tags received in V1.
- Link to v1: https://lore.kernel.org/r/20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com
---
 drivers/clk/qcom/camcc-sa8775p.c | 103 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 98 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sa8775p.c b/drivers/clk/qcom/camcc-sa8775p.c
index 11bd2e234811..bd75f59d3ffe 100644
--- a/drivers/clk/qcom/camcc-sa8775p.c
+++ b/drivers/clk/qcom/camcc-sa8775p.c
@@ -10,7 +10,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
-#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
+#include <dt-bindings/clock/qcom,qcs8300-camcc.h>
 
 #include "clk-alpha-pll.h"
 #include "clk-branch.h"
@@ -1681,6 +1681,24 @@ static struct clk_branch cam_cc_sm_obs_clk = {
 	},
 };
 
+static struct clk_branch cam_cc_titan_top_accu_shift_clk = {
+	.halt_reg = 0x131f0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x131f0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_titan_top_accu_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct gdsc cam_cc_titan_top_gdsc = {
 	.gdscr = 0x131bc,
 	.en_rest_wait_val = 0x2,
@@ -1775,6 +1793,7 @@ static struct clk_regmap *cam_cc_sa8775p_clocks[] = {
 	[CAM_CC_SLEEP_CLK_SRC] = &cam_cc_sleep_clk_src.clkr,
 	[CAM_CC_SLOW_AHB_CLK_SRC] = &cam_cc_slow_ahb_clk_src.clkr,
 	[CAM_CC_SM_OBS_CLK] = &cam_cc_sm_obs_clk.clkr,
+	[CAM_CC_TITAN_TOP_ACCU_SHIFT_CLK] = NULL,
 	[CAM_CC_XO_CLK_SRC] = &cam_cc_xo_clk_src.clkr,
 	[CAM_CC_QDSS_DEBUG_XO_CLK] = &cam_cc_qdss_debug_xo_clk.clkr,
 };
@@ -1811,6 +1830,7 @@ static const struct qcom_cc_desc cam_cc_sa8775p_desc = {
 };
 
 static const struct of_device_id cam_cc_sa8775p_match_table[] = {
+	{ .compatible = "qcom,qcs8300-camcc" },
 	{ .compatible = "qcom,sa8775p-camcc" },
 	{ }
 };
@@ -1841,10 +1861,83 @@ static int cam_cc_sa8775p_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
 	clk_lucid_evo_pll_configure(&cam_cc_pll5, regmap, &cam_cc_pll5_config);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0x13194); /* CAM_CC_CAMNOC_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x131ec); /* CAM_CC_GDSC_CLK */
-	qcom_branch_set_clk_en(regmap, 0x13208); /* CAM_CC_SLEEP_CLK */
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcs8300-camcc")) {
+		cam_cc_camnoc_axi_clk_src.cmd_rcgr = 0x13154;
+		cam_cc_camnoc_axi_clk.halt_reg = 0x1316c;
+		cam_cc_camnoc_axi_clk.clkr.enable_reg = 0x1316c;
+		cam_cc_camnoc_dcd_xo_clk.halt_reg = 0x13174;
+		cam_cc_camnoc_dcd_xo_clk.clkr.enable_reg = 0x13174;
+
+		cam_cc_csi0phytimer_clk_src.cmd_rcgr = 0x15054;
+		cam_cc_csi1phytimer_clk_src.cmd_rcgr = 0x15078;
+		cam_cc_csi2phytimer_clk_src.cmd_rcgr = 0x15098;
+		cam_cc_csid_clk_src.cmd_rcgr = 0x13134;
+
+		cam_cc_mclk0_clk_src.cmd_rcgr = 0x15000;
+		cam_cc_mclk1_clk_src.cmd_rcgr = 0x1501c;
+		cam_cc_mclk2_clk_src.cmd_rcgr = 0x15038;
+
+		cam_cc_fast_ahb_clk_src.cmd_rcgr = 0x13104;
+		cam_cc_slow_ahb_clk_src.cmd_rcgr = 0x1311c;
+		cam_cc_xo_clk_src.cmd_rcgr = 0x131b8;
+		cam_cc_sleep_clk_src.cmd_rcgr = 0x131d4;
+
+		cam_cc_core_ahb_clk.halt_reg = 0x131b4;
+		cam_cc_core_ahb_clk.clkr.enable_reg = 0x131b4;
+
+		cam_cc_cpas_ahb_clk.halt_reg = 0x130f4;
+		cam_cc_cpas_ahb_clk.clkr.enable_reg = 0x130f4;
+		cam_cc_cpas_fast_ahb_clk.halt_reg = 0x130fc;
+		cam_cc_cpas_fast_ahb_clk.clkr.enable_reg = 0x130fc;
+
+		cam_cc_csi0phytimer_clk.halt_reg = 0x1506c;
+		cam_cc_csi0phytimer_clk.clkr.enable_reg = 0x1506c;
+		cam_cc_csi1phytimer_clk.halt_reg = 0x15090;
+		cam_cc_csi1phytimer_clk.clkr.enable_reg = 0x15090;
+		cam_cc_csi2phytimer_clk.halt_reg = 0x150b0;
+		cam_cc_csi2phytimer_clk.clkr.enable_reg = 0x150b0;
+		cam_cc_csid_clk.halt_reg = 0x1314c;
+		cam_cc_csid_clk.clkr.enable_reg = 0x1314c;
+		cam_cc_csid_csiphy_rx_clk.halt_reg = 0x15074;
+		cam_cc_csid_csiphy_rx_clk.clkr.enable_reg = 0x15074;
+		cam_cc_csiphy0_clk.halt_reg = 0x15070;
+		cam_cc_csiphy0_clk.clkr.enable_reg = 0x15070;
+		cam_cc_csiphy1_clk.halt_reg = 0x15094;
+		cam_cc_csiphy1_clk.clkr.enable_reg = 0x15094;
+		cam_cc_csiphy2_clk.halt_reg = 0x150b4;
+		cam_cc_csiphy2_clk.clkr.enable_reg = 0x150b4;
+
+		cam_cc_mclk0_clk.halt_reg = 0x15018;
+		cam_cc_mclk0_clk.clkr.enable_reg = 0x15018;
+		cam_cc_mclk1_clk.halt_reg = 0x15034;
+		cam_cc_mclk1_clk.clkr.enable_reg = 0x15034;
+		cam_cc_mclk2_clk.halt_reg = 0x15050;
+		cam_cc_mclk2_clk.clkr.enable_reg = 0x15050;
+		cam_cc_qdss_debug_xo_clk.halt_reg = 0x1319c;
+		cam_cc_qdss_debug_xo_clk.clkr.enable_reg = 0x1319c;
+
+		cam_cc_titan_top_gdsc.gdscr = 0x131a0;
+
+		cam_cc_sa8775p_clocks[CAM_CC_CCI_3_CLK] = NULL;
+		cam_cc_sa8775p_clocks[CAM_CC_CCI_3_CLK_SRC] = NULL;
+		cam_cc_sa8775p_clocks[CAM_CC_CSI3PHYTIMER_CLK] = NULL;
+		cam_cc_sa8775p_clocks[CAM_CC_CSI3PHYTIMER_CLK_SRC] = NULL;
+		cam_cc_sa8775p_clocks[CAM_CC_CSIPHY3_CLK] = NULL;
+		cam_cc_sa8775p_clocks[CAM_CC_MCLK3_CLK] = NULL;
+		cam_cc_sa8775p_clocks[CAM_CC_MCLK3_CLK_SRC] = NULL;
+		cam_cc_sa8775p_clocks[CAM_CC_TITAN_TOP_ACCU_SHIFT_CLK] =
+				&cam_cc_titan_top_accu_shift_clk.clkr;
+
+		/* Keep some clocks always enabled */
+		qcom_branch_set_clk_en(regmap, 0x13178); /* CAM_CC_CAMNOC_XO_CLK */
+		qcom_branch_set_clk_en(regmap, 0x131d0); /* CAM_CC_GDSC_CLK */
+		qcom_branch_set_clk_en(regmap, 0x131ec); /* CAM_CC_SLEEP_CLK */
+	} else {
+		/* Keep some clocks always enabled */
+		qcom_branch_set_clk_en(regmap, 0x13194); /* CAM_CC_CAMNOC_XO_CLK */
+		qcom_branch_set_clk_en(regmap, 0x131ec); /* CAM_CC_GDSC_CLK */
+		qcom_branch_set_clk_en(regmap, 0x13208); /* CAM_CC_SLEEP_CLK */
+	}
 
 	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sa8775p_desc, regmap);
 

---
base-commit: 73b8c1dbc2508188e383023080ce6a582ff5f279
change-id: 20250320-qcs8300-mm-patches-5e1fcc1d6794

Best regards,
-- 
Imran Shaik <quic_imrashai@quicinc.com>


