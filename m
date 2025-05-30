Return-Path: <linux-arm-msm+bounces-59874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69560AC8C27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 12:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A31E93B7A62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 10:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B5421170D;
	Fri, 30 May 2025 10:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H0ioXTbG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098C24685;
	Fri, 30 May 2025 10:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748601169; cv=none; b=lrZKLHFRvHy8X1JJd5EAbSGqIcY/Yc5NFuTolfbQwV8XtyudcQvyTfKhQRH4OU9htMp89iS0fhDDmBwW7EJpY5IiEceF7Sa0Mm8JjGVrDhen2NprwN+cv+6kDTmQQEUh1nqGCJlTjvnbnSO+vAhn96YeUnkQln7Kr7VyNxtM+2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748601169; c=relaxed/simple;
	bh=stNs+MLwfmvFrO9WFziWRRzwneo679wcSSsxm7O2lHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=gMCC6qQmk2PC40NkJoOKVUsdy4BLc1S0D6CIa9txu3eiMXWhi1iB4CHzf5z86itQAve/u864CXjkp4/3P7e+33arPENopThj9LEIACgwwOvjXSX/Bmp60BF/J5qswG0seU5DDDBC6An+sPs+vPKcFPa56ZI6cV76jfQ0IcPvDi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H0ioXTbG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAWXRi008272;
	Fri, 30 May 2025 10:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u5Dl1VPZeqVmjlMz6TRbk9
	uWVlha+O4qdSwPEZjbQNI=; b=H0ioXTbG48VPA2DPljRifxGLZcQhqIlQsoUcBK
	BVmMl1Xe6AgSVSw9IHXaaVuqIes8ggiYPM4E6TbIAjbbrCVOTwHcvsim/xvnZEXg
	DGbZRMsr1VzdvgtWDGK+iubFkvL+IUe5OMaQ8TgVpZzDwwpuBaptq1aaisl7+/tD
	aQTKxRIPSXqYqBX92Wz4utSmbZo4Nv7R+s7JfGaSz8MOjnMhvnPSJCKcbYe+BmRq
	VFJeFYNqpWbEhdn0YDlq7KLk/XYhE1oB1lAxxjuWxOMwRa4rj5XZXVe7qO5dsESa
	BvJNwzWqHneL9vFKt9t526hQgVmnS18onn7AjhhxpS4Z2o8A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992tu0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 10:32:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54UAWgeb001270
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 10:32:42 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 30 May 2025 03:32:39 -0700
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Fri, 30 May 2025 16:01:59 +0530
Subject: [PATCH v5] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for video
 GDSC's
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250530-switch_gdsc_mode-v5-1-657c56313351@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAB6JOWgC/23PwWrDMAyA4VcpPs/Fli1n3mnvMUZJZKXRockWd
 9lGybvXKZRCk+Mv0Cd0UZlH4azedhc18iRZhr4EvuwUdXV/ZC2ptAIDaNAZnX/lTN3hmDIdTkN
 iDRhc8JHYVqjK2tfIrfzdyI/P0p3k8zD+3y5MdpkumLcWYI1NVhvtArYmVkxNY96/f4Skpz0NJ
 7VwEzwIALdBQCG4QYqhZg4B1oS7E2isxQ3CFSLW4BO0qQJPa8I/CLCvG4QvBPrQBoqANT89Ms/
 zFRyVoqB7AQAA
X-Change-ID: 20250530-switch_gdsc_mode-2563649ce175
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        "Vikash
 Garodia" <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748601159; l=7251;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=Q7euKf03Sle99JOH4MUzlfPfquYXmQMtj9fhWEbiGGU=;
 b=/rfDiEnXpXIkKrUFsKeCAa/hGGeS2zHNT+9yCyJCm8f9yG94eL+bd1/x0QQfMcEE2vd7A2WSS
 jVqWxV/P/0ODUwxW3ktTQksI4/DIMR55vHB8UZX6BWw8iZ7j9SHmOOh
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA5MCBTYWx0ZWRfXzYUd3uvhgcZA
 gULMR8nyZsGNAElQoQtNGc2N9sjopUZ0Mmsc+dbQMxOkP3G7mTawJcL1pYXd7W5KGc3o4WnJxYQ
 eY6Tbvkj1qOM3/L+P3ikiUUCOx72MNX1KtqqkwfzNoxOIjojxTYCCUQ7N1BFxdFHrMG42qmhe10
 d+DlYkbLtGOEggX/mtwlQwBe2Y4tGJQW/t0O5oefn9zNGVrUTmSds+PKGMi7g2KXG2cZQixG5wl
 1D0CNaoGmOSDKlXQtd3W5oHf/HK+wTTy4vFF3Muon4AaKDik0v7bYvMTFA0OLO0Ti9780p9P4y9
 ZOVIPO4qq6VR25AFHiwPY3g4K2iKygvJOQ9DtoyGv7G8pgzOBRu+Ah0wuKOwHG6WSl66nrB2dM+
 ixYBWvcdv68eq52X9SkcbAeV0AAO2pr2RnR59qI3lSciP+cfoJgCYB1+5aoxl/zNpg4PBgnp
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=6839894b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=__jX16zl-YCOEXp__AEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: A25POxVFF9yrPpqL5B9nJxEaI-LfgTOT
X-Proofpoint-ORIG-GUID: A25POxVFF9yrPpqL5B9nJxEaI-LfgTOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1011
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=641 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300090

From: Taniya Das <quic_tdas@quicinc.com>

The video driver will be using the newly introduced
dev_pm_genpd_set_hwmode() API to switch the video GDSC to HW and SW
control modes at runtime.
Hence use HW_CTRL_TRIGGER flag instead of HW_CTRL for video GDSC's for
Qualcomm SoC SC7180, SDM845, SM7150, SM8150 and SM8450.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
The Venus driver requires vcodec GDSC to be ON in SW mode for clock
operations and move it back to HW mode to gain power benefits. Earlier,
as there is no interface to switch the GDSC mode from GenPD framework,
the GDSC is moved to HW control mode as part of GDSC enable callback and
venus driver is writing to its POWER_CONTROL register to keep the GDSC ON
from SW whereever required. But the POWER_CONTROL register addresses are
not constant and can vary across the variants.

Also as per the HW recommendation, the GDSC mode switching needs to be
controlled from respective GDSC register and this is a uniform approach
across all the targets. Hence use dev_pm_genpd_set_hwmode() API which
controls GDSC mode switching using its respective GDSC register.

Make venus driver to use dev_pm_genpd_set_hwmode() to switch GDSC mode on
v4.
- 1. the venus driver adds compatibility with the new way to switch GDSC
mode.
- 2. the clock driver uses the HW_CTRL_TRIGGER flag, which means the venus
driver needs to use the dev_pm_genpd_set_hwmode() API to switch GDSC mode.

Validated this series on QCS615 and SC7180.

Note:
This series only includes videocc patches and it can be picked
independently without having any functional dependency.
---
Changes in v5:
- 1. Remove venus driver patch from this patch series due to it has been
picked.
- Link to v4: https://lore.kernel.org/r/20250218-switch_gdsc_mode-v4-0-546f6c925ae0@quicinc.com

Changes in v4:
- 1. Update the order of patches.
- 2. Update vcodec_control_v4 to try dev_pm_genpd_set_hwmode first.
- 3. Add hwmode_dev to indicate whether to use HW_CTRL_TRIGGER flag.
- 4. Update commit message and cover letter message.
- 5. Remove the patch that cleaned up dead code and will submit this patch
with next patch series.
- Link to v3: https://lore.kernel.org/r/20250115-switch_gdsc_mode-v3-0-9a24d2fd724c@quicinc.com

Changes in v3:
- 1. Update commit message.
- 2. Add a patch to clean up the dead code for the venus driver.
- 3. Remove vcodec_control_v4() function.
- 4. Directly call dev_pm_genpd_set_hwmode() without vcodec_control_v4().
- Link to v2: https://lore.kernel.org/r/20241223-switch_gdsc_mode-v2-0-eb5c96aee662@quicinc.com

Changes in v2:
- 1. Add the HW_CTRL_TRIGGER flag for the targets SM7150/SM8150 and SM8450
video GDSCs supporting movement between HW and SW mode of the GDSC.
(Suggested by Dmitry Baryshkov)
- 2. There is a dependency of the clock driver introducing the new flag
and the video driver adapting to this new API. Missing either the clock
and video driver could potentially break the video driver.
- Link to v1: https://lore.kernel.org/r/20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com
---
 drivers/clk/qcom/videocc-sc7180.c | 2 +-
 drivers/clk/qcom/videocc-sdm845.c | 4 ++--
 drivers/clk/qcom/videocc-sm7150.c | 4 ++--
 drivers/clk/qcom/videocc-sm8150.c | 4 ++--
 drivers/clk/qcom/videocc-sm8450.c | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
index d7f84548039699ce6fdd7c0f6675c168d5eaf4c1..dd2441d6aa83bd7cff17deeb42f5d011c1e9b134 100644
--- a/drivers/clk/qcom/videocc-sc7180.c
+++ b/drivers/clk/qcom/videocc-sc7180.c
@@ -166,7 +166,7 @@ static struct gdsc vcodec0_gdsc = {
 	.pd = {
 		.name = "vcodec0_gdsc",
 	},
-	.flags = HW_CTRL,
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
index f77a0777947773dc8902c92098acff71b9b8f10f..6dedc80a8b3e18eca82c08a5bcd7e1fdc374d4b5 100644
--- a/drivers/clk/qcom/videocc-sdm845.c
+++ b/drivers/clk/qcom/videocc-sdm845.c
@@ -260,7 +260,7 @@ static struct gdsc vcodec0_gdsc = {
 	},
 	.cxcs = (unsigned int []){ 0x890, 0x930 },
 	.cxc_count = 2,
-	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -271,7 +271,7 @@ static struct gdsc vcodec1_gdsc = {
 	},
 	.cxcs = (unsigned int []){ 0x8d0, 0x950 },
 	.cxc_count = 2,
-	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
diff --git a/drivers/clk/qcom/videocc-sm7150.c b/drivers/clk/qcom/videocc-sm7150.c
index 14ef7f5617537363673662adc3910ddba8ea6a4f..b6912560ef9b7a84e7fd1d9924f5aac6967da780 100644
--- a/drivers/clk/qcom/videocc-sm7150.c
+++ b/drivers/clk/qcom/videocc-sm7150.c
@@ -271,7 +271,7 @@ static struct gdsc vcodec0_gdsc = {
 	},
 	.cxcs = (unsigned int []){ 0x890, 0x9ec },
 	.cxc_count = 2,
-	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -282,7 +282,7 @@ static struct gdsc vcodec1_gdsc = {
 	},
 	.cxcs = (unsigned int []){ 0x8d0, 0xa0c },
 	.cxc_count = 2,
-	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
index daab3237eec19b727d34512d3a2ba1d7bd2743d6..3024f6fc89c8b374f2ef13debc283998cb136f6b 100644
--- a/drivers/clk/qcom/videocc-sm8150.c
+++ b/drivers/clk/qcom/videocc-sm8150.c
@@ -179,7 +179,7 @@ static struct gdsc vcodec0_gdsc = {
 	.pd = {
 		.name = "vcodec0_gdsc",
 	},
-	.flags = HW_CTRL,
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -188,7 +188,7 @@ static struct gdsc vcodec1_gdsc = {
 	.pd = {
 		.name = "vcodec1_gdsc",
 	},
-	.flags = HW_CTRL,
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 static struct clk_regmap *video_cc_sm8150_clocks[] = {
diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
index 2e11dcffb6646d47b298c27ef68635a465dd728e..be68d9bf52a2df9c09828e3d636085d7f942a89d 100644
--- a/drivers/clk/qcom/videocc-sm8450.c
+++ b/drivers/clk/qcom/videocc-sm8450.c
@@ -347,7 +347,7 @@ static struct gdsc video_cc_mvs0_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.parent = &video_cc_mvs0c_gdsc.pd,
-	.flags = RETAIN_FF_ENABLE | HW_CTRL,
+	.flags = HW_CTRL_TRIGGER | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc video_cc_mvs1c_gdsc = {
@@ -372,7 +372,7 @@ static struct gdsc video_cc_mvs1_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.parent = &video_cc_mvs1c_gdsc.pd,
-	.flags = RETAIN_FF_ENABLE | HW_CTRL,
+	.flags = HW_CTRL_TRIGGER | RETAIN_FF_ENABLE,
 };
 
 static struct clk_regmap *video_cc_sm8450_clocks[] = {

---
base-commit: 3a83b350b5be4b4f6bd895eecf9a92080200ee5d
change-id: 20250530-switch_gdsc_mode-2563649ce175

Best regards,
-- 
Renjiang Han <quic_renjiang@quicinc.com>


