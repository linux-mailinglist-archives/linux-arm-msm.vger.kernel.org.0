Return-Path: <linux-arm-msm+bounces-21240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C66D98D5EEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66A081F24463
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DCC140395;
	Fri, 31 May 2024 09:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TQSQYtcF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0037C6EB;
	Fri, 31 May 2024 09:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717149136; cv=none; b=p/gzMEwOka+mRSznX9Brk9py0rN6Zl5UrffEvkqX9iLgjnRKBIlrvpfpQyhF40cRg/bf+bdBN6LxCkOu7scNZVpGE40IPbZhK/o3uLWHnABturQe5SO6DDXQODMNGqwJsAecuE+eeEWAjQE5FQXBhzL8hHUPWrSDef1Dcvedb10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717149136; c=relaxed/simple;
	bh=omh52pzJwZb7qTxI82HwtZyMLz/9rgCMazvGD8ctzj8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VF5JFeVqGtPr/nMwJMwWBmq75Up+/UcfADjxSr7ogQRQcF4jYVS3ZkACXkPkLuxM+USkTb/5XdzAkcUt/zyX50BvrKFxKn99axbGKLb4I/lg2txYYdnYjOHKA5SNbQ1cJsLxmSgtdwgcAqyogZDtw7zdHO9+sgBHDJ4rndsO3rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TQSQYtcF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V9Ik5W015853;
	Fri, 31 May 2024 09:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/P6JYdvjNcY7mDXD4jQQZtQ9
	AOSRkP1qxWaI4oU07tk=; b=TQSQYtcFT0k960j4ceEE8dLAUwGc7Ak1ihmSr8Ui
	SeN8erV9OvOzIh3PRfOHOk0SsuyyRdD8XDHv+gDU9/4GDixBVPTvEJj4ZZynnqSq
	t8/hXOI8aiR9yqGRTS8NsZGt2udx6EQB063OQAsYrRHiI8cFFJqM6lQF3s+bhekS
	8jGPUbh6UUdTXaEMtrtVoI92kJyMisELfft2c7VOfMWwR6kHNi/wW68z3arb75Rc
	Cb2PyS4ETBLavgj8s1vBPQdllldRDxlO2PXqTi3ckYrspY9iSTMdX9+8UgS2JovA
	uSOMzn6IbnutHm5QG1v3ssGinMivCLOw0Q+IET59ugzeEQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yf23ssb0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:52:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V9q9qu000511
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:52:09 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 31 May 2024 02:52:06 -0700
From: Taniya Das <quic_tdas@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <quic_jkona@quicinc.com>, <quic_imrashai@quicinc.com>,
        Taniya Das
	<quic_tdas@quicinc.com>
Subject: [PATCH v3 3/3] clk: qcom: camcc-sc7280: Add parent dependency to all camera GDSCs
Date: Fri, 31 May 2024 15:21:42 +0530
Message-ID: <20240531095142.9688-4-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240531095142.9688-1-quic_tdas@quicinc.com>
References: <20240531095142.9688-1-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yM_jmYABCYz8RvPYr_GCjX0o7JZNtVMx
X-Proofpoint-GUID: yM_jmYABCYz8RvPYr_GCjX0o7JZNtVMx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_06,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxlogscore=782 bulkscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310073

Camera titan top GDSC is a parent supply to all other camera GDSCs. Titan
top GDSC is required to be enabled before enabling any other camera GDSCs
and it should be disabled only after all other camera GDSCs are disabled.
Ensure this behavior by marking titan top GDSC as parent of all other
camera GDSCs.

Fixes: 1daec8cfebc2 ("clk: qcom: camcc: Add camera clock controller driver for SC7280")
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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


