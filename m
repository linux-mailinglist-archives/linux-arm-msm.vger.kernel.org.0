Return-Path: <linux-arm-msm+bounces-51750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F21EA676DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 15:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADE6A3B0E7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F0020FAAC;
	Tue, 18 Mar 2025 14:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F4vs/Vj9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA2A20F078;
	Tue, 18 Mar 2025 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742309407; cv=none; b=GlwW//PnVoUVKaCjN3bhxJu6pt8+uhmyOYJv/tGOQavMNjBU6m4TnPNEJlSiSt229p7TB1Ok0+n6Mg73Y9Tmi+yFxvLL5Ob+Ux2BdUyQTBXzmT+Za0RqBuMg5KI5kh732GoX2sGY2PTn44QXrptDFT59GnDatOjRA/65xy50IDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742309407; c=relaxed/simple;
	bh=mI4UVHzOceiloteJjxxVBW7GcUVOlM9hmwARBhgFka8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZxC8yuWE2ij+4jvM+alaZk17HKC08gPVDI1bM1T7dm7eiDIeasDp45xIAyT2Q1nGDl+Cw5K1p3MAMzrWDB52ziDp6zRT4k73zluPhsEwGxYAVDmKhMFJuLDD4oijoogWZfsysSYlR3GMU2vv28v9BdDGUypHuPgcVeiNJfZNYng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F4vs/Vj9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I8hxst008664;
	Tue, 18 Mar 2025 14:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LjSmJgUMq2D
	a90Ju8YjEuxtoMwRv1GFoyxHSeviwSkk=; b=F4vs/Vj9834X6YnnP7SoRUgub0T
	1trkHpRwQFE0j6KGzUIUrBBFZSAL5D4J+WwjmkJXVc9e6dK+WtJvHHsCmWXgydFD
	1TZ1/u7i8qevORDn8F/4P4I0vGj6SeF4TWqOUy8u68Lk+8o3PJ7zZ8e6nyWMwpZa
	58vSxznNN2dUko6qV5ElI3XTUyoIhCD6AU3Vf1Dmcg3O1ylYYiiw01YE4onHLB92
	F9UWqeRTKrycqDgvBxROCysVMT4Ps5e730cmFe0ejfUmMs5PT2VOW0emq8Tqb3VB
	22mIJM0/v0Raf8iQTqzl1a9+BNjkkA5WqJkAW82TrUOTFjXd/JGy/yukdAA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1tx8jn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 14:49:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52IEnnoY004320;
	Tue, 18 Mar 2025 14:49:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 45dkgmfv8v-1;
	Tue, 18 Mar 2025 14:49:49 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52IEnmWO004296;
	Tue, 18 Mar 2025 14:49:49 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 52IEnmLW004293;
	Tue, 18 Mar 2025 14:49:49 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 27D99501583; Tue, 18 Mar 2025 20:19:48 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V2 3/6] phy: qcom-qmp-ufs: Refactor UFS PHY reset
Date: Tue, 18 Mar 2025 20:19:41 +0530
Message-ID: <20250318144944.19749-4-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318144944.19749-1-quic_nitirawa@quicinc.com>
References: <20250318144944.19749-1-quic_nitirawa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=W/I4VQWk c=1 sm=1 tr=0 ts=67d98810 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=UAcMnp6sUDXSVpzIzAMA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: NAxzUAMnxFfuNPSBFnlylnzm7KkBJ1y7
X-Proofpoint-ORIG-GUID: NAxzUAMnxFfuNPSBFnlylnzm7KkBJ1y7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180109

Refactor the UFS PHY reset handling to parse the reset logic only once
during probe, instead of every resume.

Move the UFS PHY reset parsing logic from qmp_phy_power_on to
qmp_ufs_probe to avoid unnecessary parsing during resume.

Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 104 ++++++++++++------------
 1 file changed, 50 insertions(+), 54 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 0089ee80f852..3a80c2c110d2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1757,32 +1757,6 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
 	qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
 }

-static int qmp_ufs_com_init(struct qmp_ufs *qmp)
-{
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	void __iomem *pcs = qmp->pcs;
-	int ret;
-
-	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
-	if (ret) {
-		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
-		return ret;
-	}
-
-	ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
-	if (ret)
-		goto err_disable_regulators;
-
-	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
-
-	return 0;
-
-err_disable_regulators:
-	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
-
-	return ret;
-}
-
 static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -1800,41 +1774,27 @@ static int qmp_ufs_power_on(struct phy *phy)
 {
 	struct qmp_ufs *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	void __iomem *pcs = qmp->pcs;
 	int ret;
-	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
-
-	if (cfg->no_pcs_sw_reset) {
-		/*
-		 * Get UFS reset, which is delayed until now to avoid a
-		 * circular dependency where UFS needs its PHY, but the PHY
-		 * needs this UFS reset.
-		 */
-		if (!qmp->ufs_reset) {
-			qmp->ufs_reset =
-				devm_reset_control_get_exclusive(qmp->dev,
-								 "ufsphy");
-
-			if (IS_ERR(qmp->ufs_reset)) {
-				ret = PTR_ERR(qmp->ufs_reset);
-				dev_err(qmp->dev,
-					"failed to get UFS reset: %d\n",
-					ret);
-
-				qmp->ufs_reset = NULL;
-				return ret;
-			}
-		}

-		ret = reset_control_assert(qmp->ufs_reset);
-		if (ret)
-			return ret;
+	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
+	if (ret) {
+		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
+		return ret;
 	}

-	ret = qmp_ufs_com_init(qmp);
+	ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
 	if (ret)
-		return ret;
+		goto err_disable_regulators;
+
+	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);

 	return 0;
+
+err_disable_regulators:
+	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
+
+	return ret;
 }

 static int qmp_ufs_phy_calibrate(struct phy *phy)
@@ -1846,6 +1806,10 @@ static int qmp_ufs_phy_calibrate(struct phy *phy)
 	unsigned int val;
 	int ret;

+	ret = reset_control_assert(qmp->ufs_reset);
+	if (ret)
+		return ret;
+
 	qmp_ufs_init_registers(qmp, cfg);

 	ret = reset_control_deassert(qmp->ufs_reset);
@@ -2088,6 +2052,34 @@ static int qmp_ufs_parse_dt(struct qmp_ufs *qmp)
 	return 0;
 }

+static int qmp_ufs_get_phy_reset(struct qmp_ufs *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	int ret;
+
+	if (!cfg->no_pcs_sw_reset)
+		return 0;
+
+	/*
+	 * Get UFS reset, which is delayed until now to avoid a
+	 * circular dependency where UFS needs its PHY, but the PHY
+	 * needs this UFS reset.
+	 */
+	if (!qmp->ufs_reset) {
+		qmp->ufs_reset =
+		devm_reset_control_get_exclusive(qmp->dev, "ufsphy");
+
+		if (IS_ERR(qmp->ufs_reset)) {
+			ret = PTR_ERR(qmp->ufs_reset);
+			dev_err(qmp->dev, "failed to get PHY reset: %d\n", ret);
+			qmp->ufs_reset = NULL;
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int qmp_ufs_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -2114,6 +2106,10 @@ static int qmp_ufs_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;

+	ret = qmp_ufs_get_phy_reset(qmp);
+	if (ret)
+		return ret;
+
 	/* Check for legacy binding with child node. */
 	np = of_get_next_available_child(dev->of_node, NULL);
 	if (np) {
--
2.48.1


