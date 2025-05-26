Return-Path: <linux-arm-msm+bounces-59447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 868A1AC4263
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 17:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 419E13BA650
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 15:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D6A21578D;
	Mon, 26 May 2025 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o1UCZBFJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD04B212B0C;
	Mon, 26 May 2025 15:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748273935; cv=none; b=HACvpB4jbPgby4ukQDRGlgJ3BkXRX9WwuJryLiEO1VfZIQzqnm12plWzVmFjbIJAMl1k2r449RxJGz6TQxJEIwy9wVN7EWOKOPsS/cphu8nHJ6dbawhXqBUaUOL1b2sSHP5yO7Q3cbRCREOcCLIPZGVBpBPsySdlICFsljHJbMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748273935; c=relaxed/simple;
	bh=rjJ+msCNV5mAsxd66vsrk4qeolQnnnpBynPrd7AgO6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PbxAssWRZrkdKrs97BVnX5sQTB8NYEzMIFbXbktPPNz7Z/lm6/XJqYBwijJ79xqo60DAB3je23KPFm6tVy+mKMnSjrXo6mU189u+x7RRSI4dboDHn1TkGgroKf75YZseolJ317JxfP+WI6U8Xc6ZjTlxwaMZTMiuEOB12+IrInw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o1UCZBFJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QA4eUp014338;
	Mon, 26 May 2025 15:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TeLQV7E0+0X
	xy3c1TDWh6kOf3rPlAJi9Z8DgfopZNDA=; b=o1UCZBFJNUlrWjbO+xFGlBdRo9q
	8Aai0Egac3nc7e0IizmtahYxdih7zFlABgzeMePVvHNTCt9SEy/0y6/c5+BYaqaT
	8atj/W2KQQ33pBALQNDyTzj/6cReb9xRCX0V9cRPcjwFrM8xbHWzanEq2XRRNk5C
	LyzG/0mfTurh1wZwcXRaiMIK/x/avHksPtpbvcT0HbgsGIF1SeMaPMLh4jI6Oli8
	Nfxor+o6XhUVGGfn8azxc2Xj7uJINE5klWXBNNhK9weuBKb3fIz4yqPnER+yU7h/
	FEolkbLGnLRXq+/tuKQusstqD7Xs6460KOa+BhV1NMe8/6HvCavi1lXhzzQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjmhe7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 15:38:32 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54QFcT1O032501;
	Mon, 26 May 2025 15:38:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46u76m73h8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 26 May 2025 15:38:29 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54QFcRQL032457;
	Mon, 26 May 2025 15:38:28 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54QFcRBW032454;
	Mon, 26 May 2025 15:38:28 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id EE864602733; Mon, 26 May 2025 21:08:27 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V6 06/10] phy: qcom-qmp-ufs: Remove qmp_ufs_com_init()
Date: Mon, 26 May 2025 21:08:17 +0530
Message-ID: <20250526153821.7918-7-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250526153821.7918-1-quic_nitirawa@quicinc.com>
References: <20250526153821.7918-1-quic_nitirawa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=68348af9 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=qNV7bCZu-Ug6FuTvl7kA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bGQr86-KLrxs1pSns9OhkKCsZlWH8U8N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDEzMiBTYWx0ZWRfXzwWiFvUEFVzr
 TJGrV9Mepb6WlhQFTQmYAUd6zRRASjVneHYY7AevHfRuMPopchYOVOW9rUjcDsvhG6CBeVaCmCe
 oQkG0ldJpN9AAZ4DXMfijubrf/X3giHTjiKQZ1TKc9bcydYs9ma9lAPRp9+xOUQnw5eX/BOmPNJ
 E33GyhQIipRKWPkthWBVqZxNeJdwyeWZJmShoDYpM7nslkQFM2CNniWqVF35HbIwmtiH1oHgLzZ
 BX1kOCmtyR6ReBBX4vqTjKZ3jC5nJelxbkt6NzAKIhkoJb6LeDAe3pr3jT2OfppsP9Q0B3uVtl+
 Ojt9YpciZe9J6xPiqFIztHKUbZB9xBCFTDyKzsEXkcyqPZ6L0L+Zv5fXbUZxrZAvgBVrfsKnSck
 kqNxa8/SYQXGbBcbY7RDvoO3OQCqQ7+VNt1gT46T3lmO2rnTeIFZTY4jtlkGjbV8WfBtDZuv
X-Proofpoint-GUID: bGQr86-KLrxs1pSns9OhkKCsZlWH8U8N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_08,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505260132

The qmp_ufs_power_on() function acts as a wrapper, solely invoking
qmp_ufs_com_init(). Additionally, the code within qmp_ufs_com_init()
does not correspond well with its name.

Therefore, to enhance the readability and eliminate unnecessary
function call inline qmp_ufs_com_init() into qmp_ufs_power_on().

There is no change to the functionality.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 41 +++++++++----------------
 1 file changed, 15 insertions(+), 26 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 33d238cf49aa..eda0a59918ea 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1758,9 +1758,23 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
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

@@ -1775,35 +1789,10 @@ static int qmp_ufs_com_init(struct qmp_ufs *qmp)
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


