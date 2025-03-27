Return-Path: <linux-arm-msm+bounces-52616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DE6A72D47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 11:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDDB816CEB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 10:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B761F20D4E9;
	Thu, 27 Mar 2025 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bn9K0wAH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208FF12CDA5;
	Thu, 27 Mar 2025 10:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743069781; cv=none; b=rdzsUGO6RCHUufiEba0fJgyE4xrAdo54omq7K6ZRCst3/jx/t0BJoxjr4XS2LQjup4NRgyYXDI4ZuzV5RujLpY8d8kRV6FjWUJll5n6JangVwMOglTXHUQOnK9U2u467absWMa4RmqN2iSRfjlvpgJSzFzKUAxsprcTfka5fo0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743069781; c=relaxed/simple;
	bh=Gbc2oOpUSKnap5FWQr2QLytGLwySKwbBDX/9Os98M4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=WeKcfJEGyj0krF9uY6ISKgTtbUiseWFjkqhd/eSJxKGW4LygfmgMeme4giXD6sIXy8ma/a9ESho1kztZMvUfYsRGxz6XwsTfV+Ec6Z/eam2dccBRWonQee2c24aYy4+uU7XSH49f/Py6xcjE/XZ/snbK2fOhM1BKQRJ+ECyq6SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bn9K0wAH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jFfq005967;
	Thu, 27 Mar 2025 10:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UO9wZaxTql4XgovHoi9zU4
	y3avUC6S/+JVf0xjZbnuI=; b=bn9K0wAHoUF6ot0OVY559ZzH1lGUdTfxsDVGap
	Ty+XMLjOkENNQYBO+nmmj7jdRmD2/V/ZW3GlHopDpcotfHf9FAc5SBmlj4XAsOzc
	dpsDU3JTmvUfQJp9BGLHDiFwiDWv6xuKgjBPqPRbxrs20Is7NGZAlgDWDkq/AUdI
	fdFN94V2Q5AWX9wRNQ0bRemD8zewpBfXVxfRoMbozR8I6syGYwlBGsdw3TsrCHgn
	ZQ57XugViLOt+lttLvh1zr/9wj4nNaOw3Z8iEHYhMzWExXOHYC5FQw1+TdE3YAcy
	Tn8/Hdvvu6IsMWZxL2goV+VyZzaz3fIBQ1D1KQFsPllNmwIQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m7nf4ueg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 10:02:56 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52RA2t4k010011
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 10:02:55 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 27 Mar 2025 03:02:52 -0700
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Thu, 27 Mar 2025 15:32:27 +0530
Subject: [PATCH v6] clk: qcom: Add support for Camera Clock Controller on
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250327-qcs8300-mm-patches-v6-1-b3fbde2820a6@quicinc.com>
X-B4-Tracking: v=1; b=H4sIADIi5WcC/22Nyw6CMBBFf4XM2jFtoSCu/A/DgkwHmQWvFhsN4
 d+tJO5cnpPcczcI7IUDXLMNPEcJMo0JylMG1Lfjg1FcYjDKWJUbhQuFS64UDgPO7Uo9B7SsOyL
 tyqouIA1nz528jui9SdxLWCf/Pj6i/dpfTv/LRYsaa1dZ7Souau5uy1NIRjrTNECz7/sHgix5I
 bYAAAA=
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
X-Proofpoint-ORIG-GUID: R0B_0A8dURBrd0G1kltG9LHnn5_hrvFg
X-Proofpoint-GUID: R0B_0A8dURBrd0G1kltG9LHnn5_hrvFg
X-Authority-Analysis: v=2.4 cv=IMMCChvG c=1 sm=1 tr=0 ts=67e52250 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=GX2mzFjyc8Gkx4eyK_sA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270068

The QCS8300 Camera clock controller is a derivative of SA8775P, but has
few additional clocks and offset differences. Hence, add support for
QCS8300 Camera clock controller by extending the SA8775P CamCC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
This patch series add support for GPUCC, CAMCC and VIDEOCC on Qualcomm
QCS8300 platform.

Changes in v6:
- Use device_is_compatible() as per Stephen's review comment.
- Link to v5: https://lore.kernel.org/r/20250321-qcs8300-mm-patches-v5-1-9d751d7e49ef@quicinc.com

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
index 11bd2e234811..50e5a131261b 100644
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
+	if (device_is_compatible(&pdev->dev, "qcom,qcs8300-camcc")) {
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


