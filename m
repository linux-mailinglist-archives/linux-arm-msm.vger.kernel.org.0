Return-Path: <linux-arm-msm+bounces-27058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8860B93CA97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 00:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA0781C20DBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 22:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA74713D51C;
	Thu, 25 Jul 2024 22:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gh9h2lbe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5961F17B;
	Thu, 25 Jul 2024 22:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721945193; cv=none; b=Ls93ONq931VNtsh/HOufwHFLJJeQxjymHQLye1kABjntfPuvWxUPGqLbVh6E5Vmsxd67Hmbj8PH0aW73IWqzQNDzKTU5LuwVGEo67Hm5EPySY1ZphtoIbNs8evarn2wTdWxwlKkU6Wb76dK6cvq8gEQCtcKmSada2Jo+Aqop1XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721945193; c=relaxed/simple;
	bh=tJtWZhb7p5kQVwzKtgQbh25VO7ZOPyb0Aa7ngzd0P6o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dRO1VKa0kZEF+NAulodHGjUlmnTAeTS5r/VRxaiuNfjDOhXSewzCDn6EuO//9dckTDeW79sRP9OIRlluI1WK6OMgOOZQr+41n2UH9rh1slLystcrttLCG2+25N/zBhRN5Y0lIHMEDGKSUyxsp972HsKLqrpJrdbcEFhUd2RQ1tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gh9h2lbe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46PK6CZf012977;
	Thu, 25 Jul 2024 22:06:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4Xr0VOoH9Oels4LwmfIWSB
	JBaoyGwRSVwoIfedkNq7Y=; b=gh9h2lbe392wrpN4cQ2n7DBhDEMYvSc8nUrvFL
	+rVEJeYYX3IP21EQ8/7oRHYOAjEEdvUmQuxCAwaB/S1mIlBsSMdWJga5VgPcDnTz
	UBAJqO8pQ+XKzzHQioRvj7xR+2zPjCdSTi0zxXFaN9CP5AoylFGXphQlFI2Xedj1
	OXaqipV3geSOzMbDT5ucOC2ASqhQYahxMOr11GNAIoonNneEUHCDXWdPNJhY1fT1
	yEVn7XkfDwx7jI8KDEOCjFONvCtA5Rw9XyHLY0DI5p2JJkbxUa2SSpHjvlsgkBqF
	fVyvXguHjpJRqhZmrLEbDr3stXMgylg6YTYTIqSlrQdvCo7Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g2xepf7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 22:06:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46PM6Hxd031735
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 22:06:17 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Jul 2024 15:06:17 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Vinod Koul <vkoul@kernel.org>,
        "Kishon
 Vijay Abraham I" <kishon@kernel.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] phy: qcom: com-qmp-combo: fix swing and pre-emphasis table for sm8350
Date: Thu, 25 Jul 2024 15:06:08 -0700
Message-ID: <20240725220608.131426-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1beyXof8fSBG02NUCTBuja8NNDMIGlF6
X-Proofpoint-ORIG-GUID: 1beyXof8fSBG02NUCTBuja8NNDMIGlF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_24,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407250151

Fix the voltage swing and pre-emphasis tables for sm8350 as the current
one do not match the hardware docs.

Fixes: ef14aff107bd ("phy: qcom: com-qmp-combo: add SM8350 & SM8450 support")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 31e43638a649..c15b01aa5a48 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1946,8 +1946,8 @@ static const struct qmp_phy_cfg sm8350_usb3dpphy_cfg = {
 
 	.swing_hbr_rbr		= &qmp_dp_v4_voltage_swing_hbr_rbr,
 	.pre_emphasis_hbr_rbr	= &qmp_dp_v4_pre_emphasis_hbr_rbr,
-	.swing_hbr3_hbr2	= &qmp_dp_v3_voltage_swing_hbr3_hbr2,
-	.pre_emphasis_hbr3_hbr2 = &qmp_dp_v4_pre_emphasis_hbr3_hbr2,
+	.swing_hbr3_hbr2	= &qmp_dp_v5_voltage_swing_hbr3_hbr2,
+	.pre_emphasis_hbr3_hbr2 = &qmp_dp_v5_pre_emphasis_hbr3_hbr2,
 
 	.dp_aux_init		= qmp_v4_dp_aux_init,
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
-- 
2.44.0


