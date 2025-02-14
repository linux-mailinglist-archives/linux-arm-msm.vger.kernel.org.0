Return-Path: <linux-arm-msm+bounces-48009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C45A35BBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 11:46:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBF1C3AD915
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 10:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5123B245B0B;
	Fri, 14 Feb 2025 10:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BiYpQjTj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5572211497;
	Fri, 14 Feb 2025 10:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739529959; cv=none; b=BVwmGBLNg4g0oOBQOA0VEYlzUDEErKUkGSiGx41ohT6U2k2eQg8YxZTexrpNGgcdaq97l9Ai3NJIv+XdpUcOXCR4vdUqwyQjpL4XCco9CfJHF9cxC0X/yPq2mrgfpiJTSxmZ/mG4Lp0PTI4TR3XB8Ko537GxNuEhnrB7NemleL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739529959; c=relaxed/simple;
	bh=YUAKeC0doSW/WVGFBb10y5vtuPuYZbjma+/Dq6UmjWk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LdihzkQfp5HVeia398M4FDPX8Uch3E4ZqCmIh8WtjnwJ7jyq5EVEntJAKQOo12xsxYcOPdOmmcx7i18ZPdI9EFm88t6kPbueF9O6WGHBvvoGvqZRKVDy4+9hPjA1IjLUTWAZKjY/Xnklj+asGNKjDNSR3dJInY14I4iVQf7/M8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BiYpQjTj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E9RBwm015774;
	Fri, 14 Feb 2025 10:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=d99FY47Ls3a
	93+7l68xLJLovNrBa6XG+FOuKOwGMUK4=; b=BiYpQjTjIIx9lprtbi8bRPEKLZm
	0k+cQ3Akt2RSzx5pLrB9r25YEgiqABHKY3P3E+pZmZY75rAa1sWFAgER6yPD8/Tp
	EhrS3cazDsYqc7AIDuSCGvr3yCdsZzajJzXgpl4OIETqmx5RXfZfs04X5sWyvuQt
	JjeGKUelyKbsoLdlvYOHw9JD1IJnq3CdYtvJmsg4e+1jJ+dHZ8GX1Z6EsRFTmHEZ
	zmHz+U2uFu09trf0OSityqV/g4ImzyPAAEOQqcSw1X7JC6Tx0pywDB+I6jHvQNCb
	P6mhRCGqK+b5r8qmCHjgz1XiCDqtDL1bMPr3qVqtrZJvmS6UZVoFhoiE6cw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rgpgr0ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 10:45:50 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51EAjmgj010514;
	Fri, 14 Feb 2025 10:45:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 44p0bm4h3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 10:45:48 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51EAjmX6010501;
	Fri, 14 Feb 2025 10:45:48 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 51EAjmWZ010500
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 10:45:48 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id 92AB940BE6; Fri, 14 Feb 2025 18:45:47 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, p.zabel@pengutronix.de,
        dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
        quic_qianyu@quicinc.com, neil.armstrong@linaro.org,
        manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>
Subject: [PATCH v3 1/2] phy: qcom: pcie: Determine has_nocsr_reset dynamically
Date: Fri, 14 Feb 2025 18:45:38 +0800
Message-Id: <20250214104539.281846-2-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250214104539.281846-1-quic_wenbyao@quicinc.com>
References: <20250214104539.281846-1-quic_wenbyao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oZgry3hriptqT8HHTOZ3iKyhsRwg0ern
X-Proofpoint-GUID: oZgry3hriptqT8HHTOZ3iKyhsRwg0ern
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 mlxscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502140077

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Decide the in-driver logic based on whether the nocsr reset is present
and defer checking the appropriateness of that to dt-bindings to save
on boilerplate.

Reset controller APIs are fine consuming a nullptr, so no additional
checks are necessary there.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 873f2f9844c6..219266125cf2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -2793,8 +2793,6 @@ struct qmp_phy_cfg {
 
 	bool skip_start_delay;
 
-	bool has_nocsr_reset;
-
 	/* QMP PHY pipe clock interface rate */
 	unsigned long pipe_clock_rate;
 
@@ -3685,7 +3683,6 @@ static const struct qmp_phy_cfg sm8550_qmp_gen4x2_pciephy_cfg = {
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS_4_20,
-	.has_nocsr_reset	= true,
 
 	/* 20MHz PHY AUX Clock */
 	.aux_clock_rate		= 20000000,
@@ -3718,7 +3715,6 @@ static const struct qmp_phy_cfg sm8650_qmp_gen4x2_pciephy_cfg = {
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS_4_20,
-	.has_nocsr_reset	= true,
 
 	/* 20MHz PHY AUX Clock */
 	.aux_clock_rate		= 20000000,
@@ -3836,7 +3832,6 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x2_pciephy_cfg = {
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS_4_20,
-	.has_nocsr_reset	= true,
 };
 
 static const struct qmp_phy_cfg x1e80100_qmp_gen4x4_pciephy_cfg = {
@@ -3870,7 +3865,6 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x4_pciephy_cfg = {
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS_4_20,
-	.has_nocsr_reset	= true,
 };
 
 static const struct qmp_phy_cfg x1e80100_qmp_gen4x8_pciephy_cfg = {
@@ -3902,7 +3896,6 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x8_pciephy_cfg = {
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS_4_20,
-	.has_nocsr_reset	= true,
 };
 
 static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
@@ -4203,12 +4196,10 @@ static int qmp_pcie_reset_init(struct qmp_pcie *qmp)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get resets\n");
 
-	if (cfg->has_nocsr_reset) {
-		qmp->nocsr_reset = devm_reset_control_get_exclusive(dev, "phy_nocsr");
-		if (IS_ERR(qmp->nocsr_reset))
-			return dev_err_probe(dev, PTR_ERR(qmp->nocsr_reset),
-						"failed to get no-csr reset\n");
-	}
+	qmp->nocsr_reset = devm_reset_control_get_optional_exclusive(dev, "phy_nocsr");
+	if (IS_ERR(qmp->nocsr_reset))
+		return dev_err_probe(dev, PTR_ERR(qmp->nocsr_reset),
+				     "failed to get no-csr reset\n");
 
 	return 0;
 }
-- 
2.34.1


