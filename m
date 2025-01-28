Return-Path: <linux-arm-msm+bounces-46377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8C5A209D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 12:40:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A6363A88A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 11:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3EC1A0BCD;
	Tue, 28 Jan 2025 11:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ob2tBffy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D39F1A08A0;
	Tue, 28 Jan 2025 11:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738064416; cv=none; b=FNxH+gWV/SLUic/dE7h/CWC+98lY3BmmezU/Pi0mOFHkkg3kiWq//4ambEzpS3XQND3h4kmFrPj39+diy31KB2AHD6fwCJjtwl98/KX/2L3wMc+8Mf6KSQcLc7XDEx41DMCHUuL/U8BdEvlA2Ww1wj6c3MpcbQ5csoRCvNeSUUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738064416; c=relaxed/simple;
	bh=DeZ6DWszU6EXJ0pzU8UHnmvtpqC04ROJsGshnLIxVnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=o5YEBExK29FVCN1fb2QSHmfCQBB634oa9P3ar1HLrUZFXz8ECsw1NltbLjN4ZTe+CPtX+cwFaaS8zhPFtC6Ybh8NIuQsbsOzQPQ80jAf7hH5kozVwfY2PJJ1PkQ8RlyKjtIAG1dzEuTTMaukl4gIh6+CdVdiX25kbr6lNlI4Xpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ob2tBffy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RMrTnf032637;
	Tue, 28 Jan 2025 11:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9G5cXrLKuXwsCCeFFeDmuR
	TMcJ5IEQXqUgUVfwhbOtg=; b=ob2tBffy9Fyi8Zk6gny2Sb+XOeQWdKVe4CUpIb
	zkScAWMuBU1S2zIHwlDdSFutCmku9r0/mKXJ95FAno05uM+lvzA9pHxf4RF6SSWS
	PmNcgfxMoavSyP7BmsLkWkHbXs80nkOtQhmwqTo9iCLuIeFoJZQODhsuCGcvuxQK
	A9B7CP6R5Wp0VzjvMfyunQYFFEe+eNrtLornlmAolNiRZLbx6hqrA0MlLSFCtVhx
	pc8uEWGz1XIc6yHuGCvVZmxsUYEWQSyGKakADt8M+7z65+xvBRmRKReyBaLheT7y
	smcS3s42Xac+MlA6iWTdRCMh8jJcYzXrCGSsRgxbHAN07L8w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ekb89bhq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 11:40:11 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50SBeA2m030148
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 11:40:10 GMT
Received: from hu-ajipan-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 Jan 2025 03:40:07 -0800
From: Ajit Pandey <quic_ajipan@quicinc.com>
Date: Tue, 28 Jan 2025 17:08:35 +0530
Subject: [PATCH] clk: qcom: clk-branch: Fix invert halt status bit check
 for votable clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250128-push_fix-v1-1-fafec6747881@quicinc.com>
X-B4-Tracking: v=1; b=H4sIALrBmGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQyML3YLS4oz4tMwKXUNj41TTVONkE1MjSyWg8oKiVKAw2Kjo2NpaAIk
 bMo1aAAAA
X-Change-ID: 20250128-push_fix-133e5e3c4529
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.15-dev-33ea6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kej9iebGeY_PSqdf9Np2OCXyC7uiij4h
X-Proofpoint-ORIG-GUID: kej9iebGeY_PSqdf9Np2OCXyC7uiij4h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=756 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501280090

BRANCH_HALT_ENABLE and BRANCH_HALT_ENABLE_VOTED flags are used to check
halt status of branch clocks, which have an inverted logic for the halt
bit in CBCR register. However, the current logic in the _check_halt()
method only compares the BRANCH_HALT_ENABLE flags, ignoring the votable
branch clocks.

Update the logic to correctly handle the invert logic for votable clocks
using the BRANCH_HALT_ENABLE_VOTED flags.

Fixes: 9092d1083a62 ("clk: qcom: branch: Extend the invert logic for branch2 clocks")
Cc: stable@vger.kernel.org
Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
---
This patch update the logic to correctly handle the invert logic for votable
clocks using the BRANCH_HALT_ENABLE_VOTED flags.
---
 drivers/clk/qcom/clk-branch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
index 229480c5b075..0f10090d4ae6 100644
--- a/drivers/clk/qcom/clk-branch.c
+++ b/drivers/clk/qcom/clk-branch.c
@@ -28,7 +28,7 @@ static bool clk_branch_in_hwcg_mode(const struct clk_branch *br)
 
 static bool clk_branch_check_halt(const struct clk_branch *br, bool enabling)
 {
-	bool invert = (br->halt_check == BRANCH_HALT_ENABLE);
+	bool invert = (br->halt_check & BRANCH_HALT_ENABLE);
 	u32 val;
 
 	regmap_read(br->clkr.regmap, br->halt_reg, &val);
@@ -44,7 +44,7 @@ static bool clk_branch2_check_halt(const struct clk_branch *br, bool enabling)
 {
 	u32 val;
 	u32 mask;
-	bool invert = (br->halt_check == BRANCH_HALT_ENABLE);
+	bool invert = (br->halt_check & BRANCH_HALT_ENABLE);
 
 	mask = CBCR_NOC_FSM_STATUS;
 	mask |= CBCR_CLK_OFF;

---
base-commit: 9a87ce288fe30f268b3a598422fe76af9bb2c2d2
change-id: 20250128-push_fix-133e5e3c4529

Best regards,
-- 
Ajit Pandey <quic_ajipan@quicinc.com>


