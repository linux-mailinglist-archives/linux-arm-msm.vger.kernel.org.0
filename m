Return-Path: <linux-arm-msm+bounces-58099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C268AB8C63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 18:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F1B03BF6D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 16:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED49225409;
	Thu, 15 May 2025 16:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q1hM8b30"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEE42222CB;
	Thu, 15 May 2025 16:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326476; cv=none; b=GQiit9Q+ea1IfJF/JMBFX6vPwSWMBHl3xy8TF4oBFQCv4SM94nwDiBkw643UA8srb37O7PbaTCJpJl/qBB4UHokJT3I6h3JGy6Pi0/24oWmg7jkHOUvtiBeUBGVTQYG7Sl+04g72CU3ZowXgUOYULUIx0nK7cQA3wQYlFjXdeIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326476; c=relaxed/simple;
	bh=IVghAn4RGEGFjEZQuxWeB3saEdmUltM/CAKDYmJV3hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K4IYZ7tWQueo3FahS50weD56DqCpoASmlUtdbRT9ap5LCUC1MZIXQ89xgRCnxqrXujgfWS7R2Vc3sa46+xxUbgT7nqGhy9UMhzLT3WR6rO74xOKbjvhwGKU4zGYsOI+cQiaK6zy5ZiebJ4qjRIQzFcWtCjYxKZVhvUJvKWQyM5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q1hM8b30; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFFSD009149;
	Thu, 15 May 2025 16:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EGREjxjW/az
	0FGJ+xF8oTbw6I2ArEE0Ba1eVC5TdpMw=; b=Q1hM8b30pEgBoeX62KhmKzismNm
	a6aO8+a37cL1+IJUXJxKBcXeD7RFiINKcFOi1MZzabwrV9fUTXUwKN5pHlvmLV83
	IawoUdMEERYt0C+ZnjJDnJwfhKcAQ5iqdDm+3E99qLqyb/Ytxr5yIedwtMMrO02h
	bKyr2YbAK4UFsxids+RL51Cnk9iAMGXh+FtwXpXBAV5LdghZ+2nTYHBRGF9rZrHh
	+jHjaUsA+saxb8R4DTv0u/Ourj7MJ/fxubi2KOya0B45aZvJXkJISVYvQcPhJRuD
	lvn/hC3KYafhqmjCIoMWkCfyywnYdFACW7s2uHVq/ysWBAfmyHAnlSf29hA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex6vas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 16:27:34 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54FGRVDJ023614;
	Thu, 15 May 2025 16:27:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46hyvmvnp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 15 May 2025 16:27:31 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54FGRSJB023569;
	Thu, 15 May 2025 16:27:30 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54FGRUGS023604;
	Thu, 15 May 2025 16:27:30 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id A8E2B5015B0; Thu, 15 May 2025 21:57:29 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V5 05/11] phy: qcom-qmp-ufs: Remove qmp_ufs_com_init()
Date: Thu, 15 May 2025 21:57:16 +0530
Message-ID: <20250515162722.6933-6-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2MyBTYWx0ZWRfXz9PS8tt6SYZY
 /ZEzjqO0kNXFxxDrOPxepKwOE1lLV3snvyvQduP5O5YGAFqgPjObPxVYSLwASSEjj6rJpJWCDnf
 kYzsj7QYD3deOU7M00cmZI0s+ycARb4KCMu8lPNSazlnc92BH8Gb/ejo7qG2SUNppRY7SUw8VO0
 FEkVIkA8SBa9YKaJPJj5vxIth00RW6DuxyNWQn/pCTqP7IhQU1T9ftzFWr37S52Sm2wqjPLTKag
 GflIj8703PuGzwAbfx+9syYpJnITfnCBPGL2uFXopnDeGfHqThH3BmWLC9XTEBQ5dGubvSgE4+h
 8MgacRCuIjWwa5tlI8EG/3ndvFNbDmM+gu8nj+QU9XyJ+TllL6pRb0vDdN1zF81PSgKYTfeGr/B
 BTXzrlo/tNrQ+MxMLbG0I0TKPL4qZtI8Myo2TvVbS3oaGXBJWrIwrnyTN+FIjpbn++NCrRDO
X-Proofpoint-ORIG-GUID: BD1qiAcQGd1ZdcVAmhmkaVzVPVL6GUgh
X-Proofpoint-GUID: BD1qiAcQGd1ZdcVAmhmkaVzVPVL6GUgh
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=682615f6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=qNV7bCZu-Ug6FuTvl7kA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150163

The qmp_ufs_power_on() function acts as a wrapper, solely invoking
qmp_ufs_com_init(). Additionally, the code within qmp_ufs_com_init()
does not correspond well with its name.

Therefore, to enhance the readability and eliminate unnecessary
function call inline qmp_ufs_com_init() into qmp_ufs_power_on().

There is no change to the functionality.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 43 ++++++++++---------------
 1 file changed, 17 insertions(+), 26 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 33d238cf49aa..d3f9ee490a32 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1758,12 +1758,28 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
 		qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
 }
 
-static int qmp_ufs_com_init(struct qmp_ufs *qmp)
+static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
+
+	reset_control_assert(qmp->ufs_reset);
+
+	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
+
+	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
+
+	return 0;
+}
+
+static int qmp_ufs_power_on(struct phy *phy)
+{
+	struct qmp_ufs *qmp = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *pcs = qmp->pcs;
 	int ret;
 
+	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
+
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
 	if (ret) {
 		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
@@ -1775,35 +1791,10 @@ static int qmp_ufs_com_init(struct qmp_ufs *qmp)
 		goto err_disable_regulators;
 
 	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
-
 	return 0;
 
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
-
-	return ret;
-}
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
-static int qmp_ufs_power_on(struct phy *phy)
-{
-	struct qmp_ufs *qmp = phy_get_drvdata(phy);
-	int ret;
-	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
-
-	ret = qmp_ufs_com_init(qmp);
 	return ret;
 }
 
-- 
2.48.1


