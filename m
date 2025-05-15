Return-Path: <linux-arm-msm+bounces-58100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E747AB8C62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 18:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 965631BC0702
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 16:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A91225A40;
	Thu, 15 May 2025 16:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BLS5vgng"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB172222D5;
	Thu, 15 May 2025 16:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326476; cv=none; b=qgVn50jqYrqXMIoZTgWVUUQy1JJ6TXK0BkgF633aIfXBElUMPL90GAx/l8YATrTfSL+/cDS04PGQpNaaLtW5uivvHXHLNcdHVH5b7YZovEJo/6zM+pG0QRbhF11ZD/PJtr6d5mtbId56cVtxq+a4lqEzORVVXchKycIQG0qVnCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326476; c=relaxed/simple;
	bh=vMvG086LZH7EDCKmJs6B/EcrvTnXZBxAWwzTCMigWFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zh3htRXES/hhKjeboWrFCKej26w6ax2D7SuW3aHSCAzmz/JGT9bsokEeJUju0v8nj2GgSkXqzWpIqwOx1iTa9Y5DnYd52PUYIpdSkq0VHY5yMoz+nd+hFuzp0TZ+izHhudDnv489SoM0maIm4R+olqXRrFHJ+rs/8B5/3PXaAqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BLS5vgng; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFYG2025719;
	Thu, 15 May 2025 16:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZZpGqg65WnK
	GHFKGlWQ+wUXMZ9IbixvVZzDq9YwdGeQ=; b=BLS5vgng5jbr5OFoVfrzt7wM0TR
	E0CedUFCt1700DuuBSv4H3Y96cfC0GUaMsBe5ec1R8ZNwrgXPvO11ADnp8JazkDW
	ff91K0FIN7swdguUucTuXpwtMUtOiH45MknOfxX+3rnscIMbb0r/gOcNGhN87hsv
	cw3/NWz9mRqQXYamGDN9gN3rqmxA6xtFzj6qwsVpNT5fS8GDhLnmM1e92eUqLep4
	YzeP59BGk1zwM4fj/jw9i0jvyU3e1aRgK7mc7xLKBCA+E5MeCn6kSNkisElcF4Xx
	pno9V0AoMlB2Pz5UuqbMx7Ktz5HM9etid4dvn4t49aIfLye5i6P2Zt0cuSA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnxw85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 16:27:34 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54FGRVP5023624;
	Thu, 15 May 2025 16:27:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46hyvmvnpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 15 May 2025 16:27:31 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54FGRRGS023551;
	Thu, 15 May 2025 16:27:31 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54FGRV9Z023613;
	Thu, 15 May 2025 16:27:31 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 793B85015B1; Thu, 15 May 2025 21:57:30 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V5 06/11] phy: qcom-qmp-ufs: Rename qmp_ufs_power_off
Date: Thu, 15 May 2025 21:57:17 +0530
Message-ID: <20250515162722.6933-7-quic_nitirawa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: DwhoVs59B6YED4IlvbGMxF5D9WWwxckS
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=682615f7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=OtgkZb4fJjdbvehu_hcA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2MyBTYWx0ZWRfX/g4TpB6e+P29
 5y8vh764EXf7UVghV9EFmcVs2q3Mh3lrPA2S1QNnybgr3DFrWKPxFBgOIsrxifdraPLJN+BU9Z/
 KBFKV/ypYXp6LXkfJn/eSZSTT/2+m/WAXvssY7EjnW7BS3pppMDrEi/F2kw+HCDnQckSx3PnwgP
 txx37NuZ+FrfbVUCoino++bwIoSZWMggXYKTEOwjVbSnwO55jti9uSDF4ovYLm2lvtUaWaHpgDt
 vDCFmqzULWdqI0UXrABMTLHys1KoSxQidXk+DQQAU2XdjdNx9rbjuvPr75OzsPan71V0w4PiEuR
 cAjXl0buaUoIuRg6AV4Zs3r4oOI9120IRqattJy1NQk75Ize4zOgvGEQeZfi4RIY/rDp10/wks0
 Mrgbtp6lmKkA4QEZYiTzSUgKy33fHa41gKCVOCv+uowBdGK8IsbGPBbIWd1pRg1pav+fq2ns
X-Proofpoint-GUID: DwhoVs59B6YED4IlvbGMxF5D9WWwxckS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150163

Rename qmp_ufs_disable to qmp_ufs_power_off to better represent its
functionality. Additionally, inline qmp_ufs_exit into qmp_ufs_power_off
function to preserve the functionality of .power_off.

There is no functional change.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index d3f9ee490a32..a5974a1fb5bb 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1851,28 +1851,11 @@ static int qmp_ufs_power_off(struct phy *phy)
 	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			SW_PWRDN);

-	return 0;
-}
-
-static int qmp_ufs_exit(struct phy *phy)
-{
-	struct qmp_ufs *qmp = phy_get_drvdata(phy);
-
 	qmp_ufs_com_exit(qmp);

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
@@ -1921,7 +1904,7 @@ static int qmp_ufs_phy_init(struct phy *phy)
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


