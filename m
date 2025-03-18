Return-Path: <linux-arm-msm+bounces-51749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F3AA676E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 15:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABDDF19A6404
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6F72101AB;
	Tue, 18 Mar 2025 14:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b6k3jdJv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9123620F072;
	Tue, 18 Mar 2025 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742309406; cv=none; b=HeXr/3zlT3oZgNPELOaaTsnZwYNwFVuPZAvsA0P+QcXSCj6H64WqKdIrMe55E33E3Ekdk5ftRUUhilTwNTqoMcLsHOy1cDZ8u5qURZGoc99F35diWPx3NAr8GCG87j0gAKdCyNV9zGW+OcZfLZdhVjBNr2nNKTwFZWEdOgAEKw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742309406; c=relaxed/simple;
	bh=MQBE414Z7g+IzCDyDkQRXRJLP9VkD72AJ5M2zzuOeU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nN24OczosxLr2Qd6j6XGcvAbGWv+0+zw+7Vz9H4dOKz6ilMwSaPYSDjz1i7GyyldOCERmFDFPGmBa2+qZI0S8igGeMFi539bNiuoi9OWb72xMyASyhQEwxZ/81XY6btam0Ac/ReAMsVDnssqK+wJLBjs/w/VkuUdetVTJ45SfmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b6k3jdJv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I8w16b004704;
	Tue, 18 Mar 2025 14:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qDhoBmJHQpl
	Gj0Ufg3K3cYfGGWmK1b/c8ljPkz87FRA=; b=b6k3jdJv28Lezmu4ypXVNlgQ+t8
	JIzqiSvCfvMaQJzgwZXk9XEglFanhRZu+gwEHZ7ocHrysi5mgVT4Ql0MMMcM5wCu
	uMmE6zrpWK+9sb3pvY6v2ioP/edFvSHrvtRmL6WgxDD9cak9pbHMTLLitMOG9foC
	BZ4WNJoPZvrRLW8V3lnY2T1v5plGzON/IGYqvNm3541qLCqECVVpNs/DovudBWoi
	GXBNCZCOohDr2KllK2fzR6N7MU/GywTKIq0lzGdpF47q6WsiJmnRPXE6S3cnmt8f
	qR1Be3EuQDnV67HKpsh2TkPWY3PBp5vwBBUM1QyraGxmaiyD0kEeTVjVFgA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmbttdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 14:49:53 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52IEnl6T004273;
	Tue, 18 Mar 2025 14:49:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 45dkgmfv91-1;
	Tue, 18 Mar 2025 14:49:49 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52IEnmWR004296;
	Tue, 18 Mar 2025 14:49:49 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 52IEnmLY004293;
	Tue, 18 Mar 2025 14:49:49 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id DBBFC501582; Tue, 18 Mar 2025 20:19:48 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V2 4/6] phy: qcom-qmp-ufs: Refactor qmp_ufs_exit callback.
Date: Tue, 18 Mar 2025 20:19:42 +0530
Message-ID: <20250318144944.19749-5-quic_nitirawa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: DgxSMTydO0xIicwKNVSexuwLhnVCg75T
X-Proofpoint-GUID: DgxSMTydO0xIicwKNVSexuwLhnVCg75T
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67d98811 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=2ghFC8B1GUYIoq9qLGUA:9 a=7K3s5E3rCzI1cAiLShGS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180109

Rename qmp_ufs_disable to qmp_ufs_power_off and refactor
the code to move all the power off sequence to qmp_ufs_power_off.

Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 41 ++-----------------------
 1 file changed, 3 insertions(+), 38 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 3a80c2c110d2..675fef106d3b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1757,19 +1757,6 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
 	qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
 }

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
@@ -1839,39 +1826,17 @@ static int qmp_ufs_power_off(struct phy *phy)
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
@@ -1890,7 +1855,7 @@ static int qmp_ufs_set_mode(struct phy *phy, enum phy_mode mode, int submode)

 static const struct phy_ops qcom_qmp_ufs_phy_ops = {
 	.power_on	= qmp_ufs_power_on,
-	.power_off	= qmp_ufs_disable,
+	.power_off	= qmp_ufs_power_off,
 	.calibrate	= qmp_ufs_phy_calibrate,
 	.set_mode	= qmp_ufs_set_mode,
 	.owner		= THIS_MODULE,
--
2.48.1


