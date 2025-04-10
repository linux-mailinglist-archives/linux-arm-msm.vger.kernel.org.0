Return-Path: <linux-arm-msm+bounces-53783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7377CA83DD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 11:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E3FA1B86222
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D681219314;
	Thu, 10 Apr 2025 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a45/fPIR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C00214A7B;
	Thu, 10 Apr 2025 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275700; cv=none; b=av4ANNqjp3JYRT8enWBJNY6ycnWl5/dwMPaBP8/Kra7agkRqTLf9iujCqXrbTlVKZkkYLFWoG8n5J8fmq2feoVUv6pLCi0NOIYcPWB8kAklqgCoUrLX5l21vOEp+3iOy/lUue+ikNUi+u/+Z7a2AOdtFi6acOk1AfOfKJBiEUFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275700; c=relaxed/simple;
	bh=CxYdX7c6e/sqGDwUb65dTSAE7mTpY3kg9iPTx8K3vVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g476SSwIo9/mYG3kdRo7SM/RFTDjhkudUOcIb7qnkov4kWDw6NGd0HxZx4jPq7ZrSaxIxLwysiWDiY7Aw51JOMSKWd6pZc5s0MudQq3utO7yAvqOosMnwh1a11qwzn6ZA3S9BvWwWKt8WdmYZCjiqca6MufYRgw8aGSliDBpG1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a45/fPIR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75IK1008192;
	Thu, 10 Apr 2025 09:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L6y2yBkJp6D
	EKRhcGV5eBPJzR7kuvqhFY9ZvTWf7fco=; b=a45/fPIRnzR5PguTFXED4ICSIFU
	5nhE081m6e002ak8XVYvkAhb1mKKcYEgqK8CtzS1JUwrQDZyttwO7+GQF1pXWqVm
	wxfhIZAMfrMfBYTsetdKJ9TuRwD93KHsI/Piezmy17edtOw0zvszWn8RR+O+uzeA
	0Sm4V55CeSFtAzxApVUlCiPwUwgvktI+BjlOIiEv9Z62yRjBSWTiKvs9HAyY522p
	rV45s+aHVP7UuMrfu608+ecoo7vILB5KJEoJFqzC2TXxO7RpCcZYHZs01KczwHZP
	ZISpD9gmf+LDNG0LVWA338w9a16rK+lUdvAVC4mJmVkQwROo9ffEnu3f26A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd06cs4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 09:01:17 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53A91EFj008890;
	Thu, 10 Apr 2025 09:01:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 45ue7g3rcr-1;
	Thu, 10 Apr 2025 09:01:14 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53A8xvrj007700;
	Thu, 10 Apr 2025 09:01:14 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 53A91Dve008867;
	Thu, 10 Apr 2025 09:01:14 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 565FB50158F; Thu, 10 Apr 2025 14:31:13 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V3 6/9] phy: qcom-qmp-ufs: Refactor qmp_ufs_exit callback.
Date: Thu, 10 Apr 2025 14:30:59 +0530
Message-ID: <20250410090102.20781-7-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: psVFb68R01RyLzxqTPx1i9Im8IuhxYv3
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f788dd cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=2ghFC8B1GUYIoq9qLGUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: psVFb68R01RyLzxqTPx1i9Im8IuhxYv3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100066

Rename qmp_ufs_disable to qmp_ufs_power_off and refactor
the code to move all the power off sequence to qmp_ufs_power_off.

Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 42 ++-----------------------
 1 file changed, 3 insertions(+), 39 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 2cc819089d71..7776c248ebd5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1757,20 +1757,6 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
 	qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
 }
 
-
-static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
-{
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
-
-	reset_control_assert(qmp->ufs_reset);
-
-	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
-
-	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
-
-	return 0;
-}
-
 static int qmp_ufs_power_on(struct phy *phy)
 {
 	struct qmp_ufs *qmp = phy_get_drvdata(phy);
@@ -1840,39 +1826,17 @@ static int qmp_ufs_power_off(struct phy *phy)
 	struct qmp_ufs *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
-	/* PHY reset */
-	if (!cfg->no_pcs_sw_reset)
-		qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
-
-	/* stop SerDes */
-	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_START_CTRL], SERDES_START);
-
 	/* Put PHY into POWER DOWN state: active low */
 	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			SW_PWRDN);
 
-	return 0;
-}
-
-static int qmp_ufs_exit(struct phy *phy)
-{
-	struct qmp_ufs *qmp = phy_get_drvdata(phy);
+	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 
-	qmp_ufs_com_exit(qmp);
+	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
 	return 0;
 }
 
-static int qmp_ufs_disable(struct phy *phy)
-{
-	int ret;
-
-	ret = qmp_ufs_power_off(phy);
-	if (ret)
-		return ret;
-	return qmp_ufs_exit(phy);
-}
-
 static int qmp_ufs_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 {
 	struct qmp_ufs *qmp = phy_get_drvdata(phy);
@@ -1891,7 +1855,7 @@ static int qmp_ufs_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 
 static const struct phy_ops qcom_qmp_ufs_phy_ops = {
 	.power_on	= qmp_ufs_power_on,
-	.power_off	= qmp_ufs_disable,
+	.power_off	= qmp_ufs_power_off,
 	.calibrate	= qmp_ufs_phy_calibrate,
 	.set_mode	= qmp_ufs_set_mode,
 	.owner		= THIS_MODULE,
-- 
2.48.1


