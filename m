Return-Path: <linux-arm-msm+bounces-47535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3CCA30764
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 10:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6426D3A1A1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 09:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60EAA1F1528;
	Tue, 11 Feb 2025 09:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GZ3P1yaA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5731EE010;
	Tue, 11 Feb 2025 09:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266974; cv=none; b=GYFXmrh2+UkMFWlL42eLO19+YlKbMUlEkoLkgoORYjEad9v7xSom3BMGwtyKheKWmlgQPFS+ISYIqUHyJjrlOm0EM2JezLe4SJje3alccET+qSEz1pmMLEOYw8np73mZw7IR7lcXKRQ36WDxW44DeoBmBPF8QEM4MKp72NuC458=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266974; c=relaxed/simple;
	bh=OAy9yi4p2cCKv7DTsBSuFxXwLhYBmmURz5cMjVURiNM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GbRMUAo1FJCGu9CsOmvQkNRECsoVOYYznnFEcpuBTob1wL9yU9INbybbT7kUzTTqye5mAT5E9r5vlsrdU2Y+p8j+DAnWv4Xzl+6eGdBBVoeGA7DG8TZ2ge/cEUsDugEoPHZ23aH2a2gEPa3YET8X4LZV6UA5gkGt9qj1aeXk214=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GZ3P1yaA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B3wnsj007894;
	Tue, 11 Feb 2025 09:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K8LMwnODt4z
	2H0aVqijYUJMO6mbNtrlX5/Mh14g93oQ=; b=GZ3P1yaA2+zvAYACCBC04Pylkre
	VNWxTEodyAuqH7mfRrq5pCXXY9mck/KEAw/Q4LfgD9I+LrOkfbCITI9w8vQWXSoQ
	5taGs6LUw0W+mJCNbB/bOka5/pHYrwjRJygPXvU+YQxSAwRDFuWAjdEbCeSW4t0Q
	36+xnZ53JVLM8ZV1nS60F3AyX3Y00+1aXvpcuDXWVv/zk4UZPHElN3fWcCj45tgo
	38+fBPpO8jxPJKMGJSe5EUnfrYe57LAxTeCTfAFaYGzsuZQMRsXU3V9VfDp/0pQr
	dbHG2W9liL/30kXEZG8P0oP5opJQyaoHYbC6saMrNAnnznPvluBNKyzsvSQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qy4d8s67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 09:42:45 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51B9gfgJ012278;
	Tue, 11 Feb 2025 09:42:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 44p0bkpch5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 09:42:43 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51B9gg8h012285;
	Tue, 11 Feb 2025 09:42:43 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 51B9gg4B012284
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 09:42:42 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id C2AFB40BEB; Tue, 11 Feb 2025 17:42:41 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, p.zabel@pengutronix.de,
        dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
        quic_qianyu@quicinc.com, neil.armstrong@linaro.org,
        manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: quic_wenbyao@quicinc.com
Subject: [PATCH v2 1/2] phy: qcom: pcie: Determine has_nocsr_reset dynamically
Date: Tue, 11 Feb 2025 17:42:30 +0800
Message-Id: <20250211094231.1813558-2-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211094231.1813558-1-quic_wenbyao@quicinc.com>
References: <20250211094231.1813558-1-quic_wenbyao@quicinc.com>
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
X-Proofpoint-ORIG-GUID: FbVHcB1DjxP4265qZUNE55QyHtUUlNG4
X-Proofpoint-GUID: FbVHcB1DjxP4265qZUNE55QyHtUUlNG4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110060

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
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 873f2f9844c6..ac42e4b01065 100644
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
@@ -4203,11 +4196,14 @@ static int qmp_pcie_reset_init(struct qmp_pcie *qmp)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get resets\n");
 
-	if (cfg->has_nocsr_reset) {
-		qmp->nocsr_reset = devm_reset_control_get_exclusive(dev, "phy_nocsr");
-		if (IS_ERR(qmp->nocsr_reset))
+	qmp->nocsr_reset = devm_reset_control_get_exclusive(dev, "phy_nocsr");
+	if (IS_ERR(qmp->nocsr_reset)) {
+		if (PTR_ERR(qmp->nocsr_reset) == -ENOENT ||
+		    PTR_ERR(qmp->nocsr_reset) == -EINVAL)
+			qmp->nocsr_reset = NULL;
+		else
 			return dev_err_probe(dev, PTR_ERR(qmp->nocsr_reset),
-						"failed to get no-csr reset\n");
+					     "failed to get no-csr reset\n");
 	}
 
 	return 0;
-- 
2.34.1


