Return-Path: <linux-arm-msm+bounces-54191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 973EFA87B43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 11:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E15617352D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 09:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9418025DCEF;
	Mon, 14 Apr 2025 09:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eF6KQvyf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11C725D525;
	Mon, 14 Apr 2025 09:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744621269; cv=none; b=WHJYM6dmgz9p+UyCgI/EGPXzy2qch93R9+EenUTB3ymPZN3x1ivcUkchDHhY9gLxuWG6Yv2EKpUGMa1CvbZ6nFtEbtG/TgAa8LbKx6eE2kJLbKYjXBPVHkQiLSFGWRl46Vc6y0Wx8E4+InH+OU15yijtH9w94wbYRTFc73fBh5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744621269; c=relaxed/simple;
	bh=ZQtm9T4NrycaYskoqyxFrIdLOVARyAaNvhGhs/GOF5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Lh2KbfKuHEyNs0CVmlmrOu694AfZnShnfoGlb8Ts/CM2jUJ0hBzKqQHfLlPRrGFy3VGSmh6a5wi1yBOmWrE1abRrK39wKoM9LZekdYf3iaXYZ/HTZqDaJoRVnpHkNPnvZTHa315U/alwaFaOMdg+ySrtD8iSTUgJ54vyIjzoypc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eF6KQvyf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DKeZQr000521;
	Mon, 14 Apr 2025 09:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ccA8l5CsSHHGeerq9+TRiA8YPWXsoKKTA0kXCnuFyRI=; b=eF6KQvyfiMZCmp3i
	Bx1B9KqyBK1pVrx79soi+SMRIqFwwcOAnZgL8PdiRyk8uFd3k1bAQxCf4AlPtfJ9
	IM/tzdixG5NbGpDySOrBxNMPDTbuXylXmP7/4uzEloeTC2Lhp3ht2Eidh7Xy/PgG
	HIiYahE3+MAXMqHvREaJ2tKGvBqrott43Bi6JZcg4ZfacQQU7zlAYgk4fMlS96nf
	feuEep9Exj8inSsFvoEhiXDDf2xXIxYum0W8ns+PU19Czr6O4B7iZPmCUHznjSHp
	ttrOMvVbAR/2nvCEsGvLu0kNAoT2VjkGEKjFNAkVo0ewyiXaGvFiOgfW8AQfpC7f
	xCDxPg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjuv2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 09:01:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53E912GN021713
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 09:01:02 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Apr 2025 02:00:59 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Mon, 14 Apr 2025 14:30:40 +0530
Subject: [PATCH 1/2] clk: qcom: gcc: Set FORCE_MEM_CORE_ON for
 gcc_ufs_axi_clk for 8650/8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250414-gcc_ufs_mem_core-v1-1-67b5529b9b5d@quicinc.com>
References: <20250414-gcc_ufs_mem_core-v1-0-67b5529b9b5d@quicinc.com>
In-Reply-To: <20250414-gcc_ufs_mem_core-v1-0-67b5529b9b5d@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fccecf cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=LCVJNUpN9M47jZSEHX8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: o8Z9hXNIgxqEIT0qD0VOVfLXKBvLv-AY
X-Proofpoint-ORIG-GUID: o8Z9hXNIgxqEIT0qD0VOVfLXKBvLv-AY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=926 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140065

Update the force mem core bit for UFS AXI clock to force the core on
signal to remain active during halt state of the clk. If force mem
core bit of the clock is not set, the memories of the subsystem will
not retain the logic across power states. This is required for the MCQ
feature of the UFS driver.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/gcc-sm8650.c | 2 ++
 drivers/clk/qcom/gcc-sm8750.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
index fa1672c4e7d814e1e08c79f9cda9463bf1cd1598..24f98062b9dd50f8397dab8392fff45051ab3665 100644
--- a/drivers/clk/qcom/gcc-sm8650.c
+++ b/drivers/clk/qcom/gcc-sm8650.c
@@ -3817,7 +3817,9 @@ static int gcc_sm8650_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
 
+	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks  */
 	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
 
 	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
 	regmap_write(regmap, 0x52150, 0x0);
diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index b36d70976095834ae4f7936d83f228d81b2c31e8..8092dd6b37b56f4fd786e33d4f0e8aabcd6ecdfe 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -3244,8 +3244,9 @@ static int gcc_sm8750_probe(struct platform_device *pdev)
 	regmap_update_bits(regmap, 0x52010, BIT(20), BIT(20));
 	regmap_update_bits(regmap, 0x52010, BIT(21), BIT(21));
 
-	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
+	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks  */
 	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
 
 	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8750_desc, regmap);
 }

-- 
2.48.1


