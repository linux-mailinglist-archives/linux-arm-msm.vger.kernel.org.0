Return-Path: <linux-arm-msm+bounces-45666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1451A17A6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 10:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFE267A16A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 09:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A521C1741;
	Tue, 21 Jan 2025 09:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bBe7BY72"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52441BB6BC;
	Tue, 21 Jan 2025 09:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737452637; cv=none; b=Kv6DLdKsJwzo4Ka4fwOsqXxZF/a/awSxA0B4G1yp2UrBk5lsml8rWH668JLwfXeXWTAYtqBJqZtNCgxvWwZUXZHh6xQRWdCA9obUGwfQymGqt9pFVUiw/SU65cHbsYBAn2nz835LGqnbfxrCdC7Qz++O5L6V5B4Xb2S/+kJh4kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737452637; c=relaxed/simple;
	bh=+2ZFhLfeen3PZbdDZ6hQ/Dry3X3lJDF3hnGLtcDAAC0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o9CWsz75Cf67rD9NOBDsUUAGJI7RsfFKGU9DTZ9SmxI058Okzlv6fEhy/BgTfCiUbkVtTCGNMWMo8bsWNjEPhzk31KIrP7Nvpz9567spw+fLwXnYITFLzuok0idZciHMJTULy73mZQp8fF/vWJbTwtHyDo6Jow7i44Mh+DLikKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bBe7BY72; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L8ZD0f020674;
	Tue, 21 Jan 2025 09:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5FF4zkRF1Gf
	V3Asy6uR6YVkHUvZmiPOr0yqypnc6hCU=; b=bBe7BY72mDr8GeZbJfhhq+031eK
	12OrwN/GyXI0FZ6y8RaQKrZXnRWWqKS+MPLVIfz70gDh07XdEio+OXHFFpV6K68i
	1mIw5uTbDJGHYf1vTxKsbkCQNhDuBT2pLZOoCWRvSajLKt4Fhn6QJ12jL4mckGIm
	YTfuQJCzC9mj21gdiIxS8TE0OisV3qn4xww7bsafootxaEtDtp/YGZe2YEPYDpwG
	0XgGeAiMqXIGM+ppdeP0twu9G5EVTs+PSJ5a/gUvCAd+uOTBjKeVnYerqDBhaIJA
	FSe3pDDkofmSFijElV+3RhcMzrC4un2MU30VDSXyJO7Kf5OxHYtjt9R1+3w==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a8658c3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 09:43:47 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50L9hjiT003850;
	Tue, 21 Jan 2025 09:43:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4485ckpnn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 09:43:45 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50L9hjLg003837;
	Tue, 21 Jan 2025 09:43:45 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 50L9higq003836
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 09:43:45 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id F045840BBC; Tue, 21 Jan 2025 17:43:43 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, p.zabel@pengutronix.de,
        dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
        quic_qianyu@quicinc.com, neil.armstrong@linaro.org,
        manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: quic_wenbyao@quicinc.com
Subject: [PATCH 1/2] phy: qcom: pcie: Determine has_nocsr_reset dynamically
Date: Tue, 21 Jan 2025 17:41:39 +0800
Message-Id: <20250121094140.4006801-2-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121094140.4006801-1-quic_wenbyao@quicinc.com>
References: <20250121094140.4006801-1-quic_wenbyao@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 6ZrczBpjgFbBrCqdC_k0SFvSW74PQ-z2
X-Proofpoint-GUID: 6ZrczBpjgFbBrCqdC_k0SFvSW74PQ-z2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_05,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210079

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Decide the in-driver logic based on whether the nocsr reset is present
and defer checking the appropriateness of that to dt-bindings to save
on boilerplate.

Reset controller APIs are fine consuming a nullptr, so no additional
checks are necessary there.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
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


