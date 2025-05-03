Return-Path: <linux-arm-msm+bounces-56656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F88EAA8198
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 18:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B90A46150C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 16:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86662561A3;
	Sat,  3 May 2025 16:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ST5RF/L+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1246A8F58;
	Sat,  3 May 2025 16:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746289514; cv=none; b=BY2rRS35wTsHAFKcJM7u+I1K2ywYYYn4tF7VEuP1MugXdIeJ7Qy13qG6FJo0jgJZd3pirp0TciJEDXFRWv6aJMqA+vn2m4FaIEVvJWeioRfa27P8tXT0J7e6p3BcLYzkrY+I5qjVpmA3LhKJMqS5ePhutXS38TW8wuUyIRUOQyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746289514; c=relaxed/simple;
	bh=m1RhYle4gf2VgeZbmps26cmRhDcM7gdDqnL9uinBNmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dfzbRbmvzE42Fa3pCRFR2S+sU8+Dx3QNLu2gvKZjJ6N70dckAR6iIfN27/Nwzzx4RtY1GrGkmOrM5TOpV+7vMChWLK0uspzFGJ2anpBLV7Oi1plF98L+kRQ74o2Gdvh5rTWH91iLBay2TTfMvB9zFcrrSaLGvZl03ZvQjR+/hcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ST5RF/L+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433Zm2C015588;
	Sat, 3 May 2025 16:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2Kti/p/PWJw
	4dzf3ygolnQ5GeOuMTWMal28BD6nClQc=; b=ST5RF/L+5D/IIRghsHLcAoOYQ0d
	w5t6jOh4M9QQVa8BooPZmXi4UbV8JLXmMUtAPJGxJkQFl6KzTrDMwkWeX7gf9S7S
	ajgEZZIuu4Pko7+K2Lfe4+n1EVKMcMN98A/egdo8eFgZP1W725VvJ2cup8s6fyP/
	FXXk3TzcgoorCHl/4yzJjyJzAFBmw0ZR2GKNOkh0pAmfZaqkE+SQ1t6X0rgGFflE
	QLDwCduIogy6nfnqQ7DKfXbSX+GA65e3BofnGUFy3RDn+NMKxTJ44cU3fgpiHGdF
	tM2uLuU88ONhxDblXMRFhtfEkDVBVVDRd1nyVnRYYK7f7YGFhRRPQUUFIHg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc58ua1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 16:24:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 543GOjQI029799;
	Sat, 3 May 2025 16:24:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 46dc7kb1fv-1;
	Sat, 03 May 2025 16:24:49 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 543GOnFQ029844;
	Sat, 3 May 2025 16:24:49 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 543GOmA6029843;
	Sat, 03 May 2025 16:24:49 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 310D15015A2; Sat,  3 May 2025 21:54:48 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH V4 05/11] phy: qcom-qmp-ufs: Remove qmp_ufs_com_init()
Date: Sat,  3 May 2025 21:54:34 +0530
Message-ID: <20250503162440.2954-6-quic_nitirawa@quicinc.com>
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
X-Proofpoint-GUID: YFVNWhZXLAZ-kwi-KYncsA0O28mNiEAg
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=68164354 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=qNV7bCZu-Ug6FuTvl7kA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: YFVNWhZXLAZ-kwi-KYncsA0O28mNiEAg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE1MCBTYWx0ZWRfXyWyBl4oCGCaW
 IHCXgKV+7/bEznTp/dEOJ1r2MIZySeTzQAxkRrS+isMgxQWl5iTi0tYjHccubNyjbNS7V6wqxha
 oMFX2m3xM3Xxo0xPFvVY9HhOnQLeO/oeVRvUTqeDgdHAMqetvA0vgMRQQqT6lvdmLqnEDVaGlBK
 L0j1jkC+kH/aHXSE5L4MWK/M4cQ7pdQ0gG568kdSHETQyax7mY0owJy3nywWdp2zE1CKboLkU7q
 ZEqGIFJ9lB/K2KS0SRobctuUNG9QpIhr4KJ5vGrdWHWpBMuOsHKMkuD9Px1/KLFimL0U1amQi0K
 56sBsUiiIZUTTpRYGwaKkkVmiwhwqPEBLefRBciVMmbdNDSaJ7okKFU2ShIiKSNhxlCSxsDf9fE
 QTu7q+ziJ/Slez2f3SAsWzY3Q1PKn68QOtN1i9gx+XEijNVZGd0cToFrIYNLDrz25XM0CrWa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_07,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030150

The qmp_ufs_power_on() function acts as a wrapper, solely invoking
qmp_ufs_com_init(). Additionally, the code within qmp_ufs_com_init()
does not correspond well with its name.

Therefore, to enhance the readability and eliminate unnecessary
function call inline qmp_ufs_com_init() into qmp_ufs_power_on().

There is no change to the functionality.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 44 ++++++++++---------------
 1 file changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 43d2d714f28b..94095393148c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1757,31 +1757,6 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
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

 static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
 {
@@ -1799,10 +1774,27 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
 static int qmp_ufs_power_on(struct phy *phy)
 {
 	struct qmp_ufs *qmp = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	void __iomem *pcs = qmp->pcs;
 	int ret;
+
 	dev_vdbg(qmp->dev, "Initializing QMP phy\n");

-	ret = qmp_ufs_com_init(qmp);
+	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
+	if (ret) {
+		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
+		return ret;
+	}
+
+	ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
+	if (ret)
+		goto err_disable_regulators;
+
+	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
+	return 0;
+
+err_disable_regulators:
+	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 	return ret;
 }

--
2.48.1


