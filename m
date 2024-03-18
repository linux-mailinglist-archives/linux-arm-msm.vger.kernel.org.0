Return-Path: <linux-arm-msm+bounces-14325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E12887E33D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 06:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3954C282906
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 05:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE56721379;
	Mon, 18 Mar 2024 05:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LX2AxPsN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6581EB2B;
	Mon, 18 Mar 2024 05:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710740237; cv=none; b=n6Q8TrUQ0Z4z5BSuDmGFk9RoConvUqOwudDvS7lcw9rLNDmwgAfL9Om20qGlgI2+bTgYBxPFe4gudqG9xeEsW2a8Ejd3AiM+iiGm5l4U4WnAM7KY3kPfHFYa2yvwOPu7/JouTMUKLg85XCAHTo+gDqEZRbyN5w6fAu8MDOSOe20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710740237; c=relaxed/simple;
	bh=LN2D+lnYKrmJey3K5aVA79RG0luujSl26OrZjjXpZlM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aDCTA2IANOlIN4jqH4cUwd2YgQRSVbUm860kHlZr7niCYOCcEerq64kt4w9yiqykGbahRSAioHl+3nWAvl5sXU1xAaiYB0wa/EyvGaQGupPrsqGPBsU+LmEhkRMUdfJX14WEpJSyvCTS5ky5Ik04NEiFK/9+aj14O7TnY/6Bcvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LX2AxPsN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42I3ewm8011420;
	Mon, 18 Mar 2024 05:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=wpAVoHOEAoV8/RrzavSv
	z2P2yCK47RZud2MG3Rtckm0=; b=LX2AxPsNiBK8YkRET/fPrf6bjJT8IYRzb1S3
	WOPgXeyjAZJbYccgGAhkDHHQKJ9QTee3cPfXjSpk+MNOnRCOkZckZr5lZT1htJQm
	TfT9+Rog0lvkUM1QSa8X8KuHMx0kNYSx5cFVvgce3IkkOYUKSZe3pLOmZa+zMeHl
	IjkSJHImgXkmPxIyZBiHUByyk+D8/GLiD0heiwroqQx7/kjoN/kWec6nNn9IsRY8
	/F0jKeYKKHiEZpAXcyzLwywLHp8H0S2kdKSNRvO/RgE38Qx72NDYbDs4skweXNBS
	JrsaymqF1b6mooTIth/AKjz8FGHkFssaKrXj6Lk+4Sq8QBsMAg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wwxtds4m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 05:37:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42I5bBe0030727
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 05:37:12 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 17 Mar 2024 22:37:05 -0700
From: Taniya Das <quic_tdas@quicinc.com>
To: Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?=
	<mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Taniya Das <quic_tdas@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 6/8] clk: qcom: camcc-sc7280: Add parent dependency to all camera GDSCs
Date: Mon, 18 Mar 2024 11:05:53 +0530
Message-ID: <20240318053555.20405-7-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240318053555.20405-1-quic_tdas@quicinc.com>
References: <20240318053555.20405-1-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _4nzFSacQYe4by_r90PhVCDLegt8gjYc
X-Proofpoint-ORIG-GUID: _4nzFSacQYe4by_r90PhVCDLegt8gjYc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-17_12,2024-03-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 mlxlogscore=740 mlxscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403180040

Camera titan top GDSC is a parent supply to all other camera GDSCs. Titan
top GDSC is required to be enabled before enabling any other camera GDSCs
and it should be disabled only after all other camera GDSCs are disabled.
Ensure this behavior by marking titan top GDSC as parent of all other
camera GDSCs.

Fixes: 1daec8cfebc2 ("clk: qcom: camcc: Add camera clock controller driver for SC7280")
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/camcc-sc7280.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sc7280.c b/drivers/clk/qcom/camcc-sc7280.c
index 27bfb0f959c4..da29d3b953ee 100644
--- a/drivers/clk/qcom/camcc-sc7280.c
+++ b/drivers/clk/qcom/camcc-sc7280.c
@@ -2267,6 +2267,7 @@ static struct gdsc cam_cc_bps_gdsc = {
 		.name = "cam_cc_bps_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = HW_CTRL | RETAIN_FF_ENABLE,
 };

@@ -2279,6 +2280,7 @@ static struct gdsc cam_cc_ife_0_gdsc = {
 		.name = "cam_cc_ife_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = RETAIN_FF_ENABLE,
 };

@@ -2291,6 +2293,7 @@ static struct gdsc cam_cc_ife_1_gdsc = {
 		.name = "cam_cc_ife_1_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = RETAIN_FF_ENABLE,
 };

@@ -2303,6 +2306,7 @@ static struct gdsc cam_cc_ife_2_gdsc = {
 		.name = "cam_cc_ife_2_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = RETAIN_FF_ENABLE,
 };

@@ -2315,6 +2319,7 @@ static struct gdsc cam_cc_ipe_0_gdsc = {
 		.name = "cam_cc_ipe_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = HW_CTRL | RETAIN_FF_ENABLE,
 };

--
2.17.1


