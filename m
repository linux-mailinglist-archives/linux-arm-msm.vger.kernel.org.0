Return-Path: <linux-arm-msm+bounces-10139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E99CA84DA29
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 07:29:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50883B21E1F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 06:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238B167E81;
	Thu,  8 Feb 2024 06:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A9KtD+f4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD2C67C40;
	Thu,  8 Feb 2024 06:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707373753; cv=none; b=PwhKiN8dBfkZFz2+gH6++XO3DDcvdsS3UphItnMvQx/hKxu30ffQFUTyWJOGIrd2gjwnU8pfrTvPkvMwoStKuwMlTwtPqIwCuJ4mS45bIuTR17sBctNDhOzIDOuWx6Za6DZFtpxxGN8Jwhn8mYRttGUd4J2UfHaeYnjL/MMj+NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707373753; c=relaxed/simple;
	bh=2jfpZjDRzJC98gY5xoyKlRzgEgFsdZGwQdl2rYJv6Qo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IGsSR2+ZAVP6DkIYlLRtmsQR/0Loe9QgU0CNB9qG9lGBInHqQJvFCLyWEqNj+lNmv2B4pRnAWPd1eFJlxXqWxiqfvEmPHBYyj9iMOUZ/QKZl9ofBInjXtbbljTra/YTSjPe1Kj/0hz4c64bGb4oRG0O+zKJtOUcyX0rn8dYugCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A9KtD+f4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41860BXZ027492;
	Thu, 8 Feb 2024 06:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=IBbw0Git1CPT2DKtf3GN
	EeATn3YdF7cMgLZdQPcxjW4=; b=A9KtD+f4PZ3bvaxRjZYFE+02iqEotI8zuybD
	LmMdt1IU9beZ9N9i8s0PMuwAnmOzpNgpy9uh0oGoEqC0mZKw3uBFjP+ndOdQgO6/
	X5GGtdR7hX4oJ/nKV3Nd6wVLEQlrj9nNGsZzYtzUVD8zmr7Oes8cgz/WT/gACCdQ
	uyYhFMqwXukk1VxBln4czvuAgh1qW/Eja1RKXXlFXlQn6f3efC/XNwTGBRz1jOhV
	HE3fZvQiZvKmLT27wQWQi6Mu9wh4KY8gyhqDdXg7yqjiw7Luj2AYVCdRccw9gNsk
	w9tWrhuuwsRqhsmgMe6HJ4cKmchfwbNS4IpMCJOwYpK646eqdQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w4frws7x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 06:29:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4186T69b030353
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Feb 2024 06:29:06 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 7 Feb 2024 22:29:02 -0800
From: Taniya Das <quic_tdas@quicinc.com>
To: Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?=
	<mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 4/5] clk: qcom: camcc-sc7280: Add parent dependency to all camera GDSCs
Date: Thu, 8 Feb 2024 11:58:35 +0530
Message-ID: <20240208062836.19767-5-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240208062836.19767-1-quic_tdas@quicinc.com>
References: <20240208062836.19767-1-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: awSF1hn0EXHNyMLXbaaBv2wk3oH-h9HM
X-Proofpoint-GUID: awSF1hn0EXHNyMLXbaaBv2wk3oH-h9HM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_01,2024-02-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=589 adultscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402080032

Camera titan top GDSC is a parent supply to all other camera GDSCs. Titan
top GDSC is required to be enabled before enabling any other camera GDSCs
and it should be disabled only after all other camera GDSCs are disabled.
Ensure this behavior by marking titan top GDSC as parent of all other
camera GDSCs.

Fixes: 1daec8cfebc2 ("clk: qcom: camcc: Add camera clock controller driver for SC7280")
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/camcc-sc7280.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sc7280.c b/drivers/clk/qcom/camcc-sc7280.c
index 4849b0e8c846..7f8ebcba30ce 100644
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


