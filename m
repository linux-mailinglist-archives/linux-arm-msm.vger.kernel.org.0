Return-Path: <linux-arm-msm+bounces-56660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC85CAA81A4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 18:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26649987EC6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 16:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6620127C146;
	Sat,  3 May 2025 16:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZoehMgxe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB29D27B4FE;
	Sat,  3 May 2025 16:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746289517; cv=none; b=RF0RKLF9BpRMjiE1Oai0pNRE91h/KlzG5Ekb0PyagRQ07MsHuphtmaWJGfbfOnPwYIuuLpRyneeVDQtJz7srGVaVA4ve/2dv+XbaIgLGrp7zkB60SyQRG3Rlpg+Hwjf2eo6SvHiz3xU2DmCvZPNNhpTf/flBgfdySXYkKFlKYhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746289517; c=relaxed/simple;
	bh=dcI8wG2JtpOya7s4UeZOHPJSYmkb6bJdkoyGMflZ1Zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LI2qcazINJOp0yAXy/HDiwsQKgAM+Z9ZTLCcDoMxOXWG183uUb3mndC5mYQ9pIpgQ0aeR4PIm/ROZw8yokh6bacDk2aBmi3UTN8dgGhBA5t4uSbiRM5VE6LwDVJjO+l2n4jUSCCfengyQnyjespMwY2zp9eYmfBAf187kidammU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZoehMgxe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543FtUFM024678;
	Sat, 3 May 2025 16:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h3MNwfHwSqG
	1QK/mXK08N/kezTizjwlomtUT+CquWV0=; b=ZoehMgxeSK6V5LjkJQL+x7NWpkg
	Dbtndfo+oJoVPsdQ1/t/a+dUtqoJdCUHNOVJjOUWqOFxxC9abIwxmDTIEX3ass24
	q3660IKgilUu09DVls/B0vrD6dyGGN09DqvVjTm6z6sMhgoJHYwfo0ge5V/WhHbj
	chohYuFt323XridAj6/5jBomkk+mim3KP6rjET9a6xjWonaCllMYoIkgZLnwOxG5
	nnXS5ks2glMXz240ygVGWsR4ugxwOPiLRMrhGgame3j840zreV1xdjfhyARqG7Rh
	xsGGCyz7nMQPW5E5ybQ1vS6uFR6/7M6lVROJVHc1REOPTuZ7ReMSEs2hrRQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rrwxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 16:24:55 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 543GOi4m029770;
	Sat, 3 May 2025 16:24:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 46dc7kb1g6-1;
	Sat, 03 May 2025 16:24:51 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 543GOpbm029873;
	Sat, 3 May 2025 16:24:51 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 543GOpQU029872;
	Sat, 03 May 2025 16:24:51 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id DC82A5015A2; Sat,  3 May 2025 21:54:50 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V4 07/11] phy: qcom-qmp-ufs: Remove qmp_ufs_exit() and Inline qmp_ufs_com_exit()
Date: Sat,  3 May 2025 21:54:36 +0530
Message-ID: <20250503162440.2954-8-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: UC1OCos2Ou00ejXFJLwIt_f-_a74fgPY
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=68164357 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=ckjLh8WlKRlJn9_E0bwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: UC1OCos2Ou00ejXFJLwIt_f-_a74fgPY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE1MCBTYWx0ZWRfX7vsxm0Mkyz0q
 ImUbIy6n0XxewtesPYy69V2ifZgYGhhi7PoH8BzP8DXskcaMKmgSlbNCqkTrr8wO4mLBw7ADFJb
 Ec3cylpbl8hC4szLn0jCaOXH+RTw/8h71jHC92Szvx1U3KRNcUGaJTye6pwR1wih8XzP/Y+VRYF
 mYQWi4Pa6QWQGcH1a5W3hN0jc3HxSpd1tKihfugJN5pwB0K30+2T2NNb1akh+DvkCThm5FxPNXq
 U7xLvsYUX6nCrO7Sngeur9q3QDPKreQVB1IoeRwjPploX5CIBfBSMPDk85eUJQUDuXuO4PoJ+Ij
 ojUeiwnzZqMn55odufBIUTfXgj4GA7a3Vs9kPazXdv9G3BAOWl81HbZHuo29XmtngUuUm1+r4ik
 1TwJBgvj60MTYdnjpHKTh0uAWkKgkhKvnWRBB46+Hhbqkz6LbyDMtmsETnDsdzmJlkmFOw4q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_07,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030150

qmp_ufs_exit() is a wrapper function. It only calls qmp_ufs_com_exit().
Remove it to simplify the ufs phy driver.

Additonally partial Inline(dropping the reset assert) qmp_ufs_com_exit
into qmp_ufs_power_off function to avoid unnecessary function call.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 29 +++++--------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index c501223fc5f9..2df61ec68dc7 100644
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
@@ -1835,15 +1821,6 @@ static int qmp_ufs_phy_calibrate(struct phy *phy)
 	return 0;
 }

-static int qmp_ufs_exit(struct phy *phy)
-{
-	struct qmp_ufs *qmp = phy_get_drvdata(phy);
-
-	qmp_ufs_com_exit(qmp);
-
-	return 0;
-}
-
 static int qmp_ufs_power_off(struct phy *phy)
 {
 	struct qmp_ufs *qmp = phy_get_drvdata(phy);
@@ -1860,7 +1837,11 @@ static int qmp_ufs_power_off(struct phy *phy)
 	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			SW_PWRDN);

-	qmp_ufs_exit(phy);
+	/* Turn off all the phy clocks */
+	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
+
+	/* Turn off all the phy rails */
+	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);

 	return 0;
 }
--
2.48.1


