Return-Path: <linux-arm-msm+bounces-56659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A058FAA81A0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 18:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9EB91B62B4B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 16:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CAA27B4EE;
	Sat,  3 May 2025 16:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cWdS1cDM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1082421FF34;
	Sat,  3 May 2025 16:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746289515; cv=none; b=iDbsMSm2xY/GxEE0pV88HtoGgQFLrDZiJhKUdP6Fb2RTYlitCbTHI6MdVtJSykH6j9i4AB/o9LKZ+Od67leIAvPjcScFKHJVOFdDo62I6SEa82HhdaxXkQUvI/afiii+7hcaapKKRMSBewXK2NOdfGXV/OtQnfDvbnPBtoZ8Tio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746289515; c=relaxed/simple;
	bh=1OYDL2FeRwnvIW8xXkYEP4zfLyLTTJ3I6Lb9c0alfVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PLRwu8E6dkedhIfjzgOeXFypGdD3d1yG5yjPOIGQ4zsUvm8PRfT+vafBdvKcQG9gb9amkjFNoNMeUReDs9zImSBGC+cs62OrAuzmuoJawppv5DpFFPG7+bIqkWFRncD7AMRWVgw3+ZF3y0Agv8Efprek5pqz7hmvgiZtLDrMJ5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cWdS1cDM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543BPE7C009817;
	Sat, 3 May 2025 16:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VPFNXVZrm6h
	Buy9GR//5NDTWQnV8h6eOyh6pCT5XNys=; b=cWdS1cDMpLudrInc0rGM/096jcn
	SGxqjuGWhrSB9e6krxyAz48hE1pFg030Fp+UK5tdC0XOI6xT6S6v+7I7sQAaEBp3
	mcKOp0dCg4vhtCIv0+kgspWqQ/FzFxAnrZDPThFlfnDSkgEMdXUdJhxGmTVZ8SAC
	V9jNOTx6y5eS6UbHh7XGtM6TSz9UVl7aW60BufIdXyPs/1m9ZJZZdQV25vJkh8Lw
	4ySt6Q98g2Hwr8pEKy/ZFw1Up936S9hUREXRfjpwM+MCxzSMJlWRR6C6WXNwcOVy
	mLDQCcGpCJFE0OXsNBS+wfsqogMUQyduQvZL81vXtc1NDOSNwsPsT3aANqA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakgrsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 16:24:53 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 543GOiF8029773;
	Sat, 3 May 2025 16:24:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 46dc7kb1g0-1;
	Sat, 03 May 2025 16:24:50 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 543GOos3029858;
	Sat, 3 May 2025 16:24:50 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 543GOodW029857;
	Sat, 03 May 2025 16:24:50 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 877685015A2; Sat,  3 May 2025 21:54:49 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V4 06/11] phy: qcom-qmp-ufs: Rename qmp_ufs_power_off
Date: Sat,  3 May 2025 21:54:35 +0530
Message-ID: <20250503162440.2954-7-quic_nitirawa@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE1MCBTYWx0ZWRfX62hAuAibIHO9
 BSbXhBd2e2oU+dbvxU4JSKHjFvmWE4vIs6x7s4hsgNhKO9u6TXA/tUHSAkcDK0gDZPH9vcdiooa
 gqxV06fLNJ5t71lsRDuW0i+0IGquTTdOxirj52/y5qt2l8lSM7p0h/Sp64q+DN60DlT6eUomP0w
 CufPcVD3EBm21L9OKph0QZOB+T3BEIjr2V/b5+/o+1hG4L/wsgYBi6BFB2apSPyP+JCMjeob3Dy
 kDrU30LnvkE5sueixXIDd7qsWpf5QimVjkbkJZzOplbqhB4k3rSbuz1DM49fP7OBVMLdliZuJkq
 0DADenLnV12zLmpSpvhdrQq+ZQUt22RNd2gbIvf8eyE8bhpCr/uTXi9khRM5X1I99q2CDc2w2k8
 mF0sinx8jwaEggwO4nunCEppQO7V2QH5R1y7kWhsxpAWY7rSPOjuW8WQVxIxjOUAnOnwQ4Ns
X-Proofpoint-ORIG-GUID: yR5tbnK4FFDmHfqhpQnJsLVML90TdsMg
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=68164356 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=Dix-ztu1IndEy_BlAjcA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: yR5tbnK4FFDmHfqhpQnJsLVML90TdsMg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_07,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030150

Rename qmp_ufs_disable to qmp_ufs_power_off to better represent its
functionality. Additionally, move the qmp_ufs_exit() call inside
qmp_ufs_power_off to preserve the functionality of .power_off.

There is no functional change.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 30 +++++++++----------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 94095393148c..c501223fc5f9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1835,6 +1835,15 @@ static int qmp_ufs_phy_calibrate(struct phy *phy)
 	return 0;
 }

+static int qmp_ufs_exit(struct phy *phy)
+{
+	struct qmp_ufs *qmp = phy_get_drvdata(phy);
+
+	qmp_ufs_com_exit(qmp);
+
+	return 0;
+}
+
 static int qmp_ufs_power_off(struct phy *phy)
 {
 	struct qmp_ufs *qmp = phy_get_drvdata(phy);
@@ -1851,28 +1860,11 @@ static int qmp_ufs_power_off(struct phy *phy)
 	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			SW_PWRDN);

-	return 0;
-}
-
-static int qmp_ufs_exit(struct phy *phy)
-{
-	struct qmp_ufs *qmp = phy_get_drvdata(phy);
-
-	qmp_ufs_com_exit(qmp);
+	qmp_ufs_exit(phy);

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
@@ -1921,7 +1913,7 @@ static int qmp_ufs_phy_init(struct phy *phy)
 static const struct phy_ops qcom_qmp_ufs_phy_ops = {
 	.init		= qmp_ufs_phy_init,
 	.power_on	= qmp_ufs_power_on,
-	.power_off	= qmp_ufs_disable,
+	.power_off	= qmp_ufs_power_off,
 	.calibrate	= qmp_ufs_phy_calibrate,
 	.set_mode	= qmp_ufs_set_mode,
 	.owner		= THIS_MODULE,
--
2.48.1


