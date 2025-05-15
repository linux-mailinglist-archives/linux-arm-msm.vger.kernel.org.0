Return-Path: <linux-arm-msm+bounces-58097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C019BAB8C5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 18:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3B8C4E0AFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 16:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4A9221F04;
	Thu, 15 May 2025 16:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bL2tigql"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6EE21FF2E;
	Thu, 15 May 2025 16:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326474; cv=none; b=PkA19VwPgK95FqZeZmkoIoAn8Z26O+Cmk/xfpmO4PAuy2iIYccW0tBBlFg0FlhZSko9tncZw8t28DFDe+uqmZMskFCEmdWXJm0Y4GAt2HA3qbEdP5b2A0Was70MI4fkeR2wFvJx1Tn7uunvSx88ogP5UtEWLrCkmhx3zdPTuMe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326474; c=relaxed/simple;
	bh=3fi6v8INgJue7ca4Y8kkzIylFIcTl3tjUPEwnyMvdJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XsSXSFe6A7L5h6eTOKh1GiAaN2DOeHUV9zOAPNSRxnufWJAfk9qyWW01Jh/Vatv5c+IirqNXyyQusheSerrRFdagDID8d+fe3MgpAo8sqy6smsRnXEqQBcxjtDYvzVNIL2PClANXWZZDGHmuIBQRBj7Q/UoZ5jYbVFB64NlNyaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bL2tigql; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFLTN002029;
	Thu, 15 May 2025 16:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eqw+UqbDQAR
	vMy8qDjzgBj4QqCxUtc/Ge5A9KiAe3Nw=; b=bL2tigql0qw2zY1/5nMco0cfINv
	Gh67VVzXjdEstiPvCYEReKFxY+MtlxdqVMbwHvmhTAY93r74b+LRNAueYGD/MUNb
	YIdlkVLmePLYyP2gz6P7xb2xyIJSbRjHqTUqlmsM491f8TP6+ipsJl2k19EvGFUZ
	SJT4zjrE6C50kBurarLQGa6cBp71aXjrA7rdF2HGLGfE+vLmH260QI50GRt4podW
	daLM5lg2T92vKcfvNVgMtVhej5L+Psm/FvrwTWTQyHUf76TU+M4i0YhoJzY9xH+q
	bGvIcvtsDRh7IwNThK8QQW9tN4y9uSA/L3hhSzcNEhXYWEu0pjzAjnFa2rQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrerq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 16:27:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54FGRRcw023562;
	Thu, 15 May 2025 16:27:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46hyvmvnnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 15 May 2025 16:27:27 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54FGRRGO023551;
	Thu, 15 May 2025 16:27:27 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54FGRQ2r023549;
	Thu, 15 May 2025 16:27:27 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 6F1445015B0; Thu, 15 May 2025 21:57:26 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V5 02/11] phy: qcom-qmp-ufs: Rename qmp_ufs_enable and qmp_ufs_power_on
Date: Thu, 15 May 2025 21:57:13 +0530
Message-ID: <20250515162722.6933-3-quic_nitirawa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: R_cR6di3rKaCRK1bGAXrlZvehQqvvwYJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2MyBTYWx0ZWRfX8RUSq3alCB9F
 9u/+CB4WPVfNRPkguq82qFEk3EyPM1mViRc5blgTVUFLYTslKg8S64Y1ybMobiGC23+z/wrbUlP
 AHZEPsy6KHlOPAymXC/pA/pehfHTu2YP4BHbUt2aQKbrxRmcMkRVmuRGzTrwH0nVeja/rrcE9za
 NdoSyEWhTi/RAJZV0DcFFZxgUa9uxSKhIO/+jmC8VT4AB+yTE4nDECXt8RgMsMUJmABd4FzyIvC
 /6KTZqcWs4L8n3Y80jQQjlenLFgE5HxbD6L0SGsz9s2p1l5xFcf773eq0H7U4OrFhM63mIFJy7k
 1pjtwYGvKoLBm3tna0bd9ONA0yLrEmx3g3J3vWVs2GuTdfa46cjeOesDwq5fUcIdmkYy3jLN1ei
 wo6ikqNZRATVE/PvhSjOU5yEJwM7Zy/UFcF23o0TlDRpo5f+IyBePGSP+UVF2VyQr6HugiNW
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=682615f2 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=jENGRIT2ScPjwYuSNhQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: R_cR6di3rKaCRK1bGAXrlZvehQqvvwYJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150163

Rename qmp_ufs_enable to qmp_ufs_power_on and qmp_ufs_power_on to
qmp_ufs_phy_calibrate to better reflect their functionality. Also
update function calls and structure assignments accordingly.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index b33e2e2b5014..a67cf0a64f74 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1838,7 +1838,7 @@ static int qmp_ufs_init(struct phy *phy)
 	return 0;
 }
 
-static int qmp_ufs_power_on(struct phy *phy)
+static int qmp_ufs_phy_calibrate(struct phy *phy)
 {
 	struct qmp_ufs *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -1899,7 +1899,7 @@ static int qmp_ufs_exit(struct phy *phy)
 	return 0;
 }
 
-static int qmp_ufs_enable(struct phy *phy)
+static int qmp_ufs_power_on(struct phy *phy)
 {
 	int ret;
 
@@ -1907,7 +1907,7 @@ static int qmp_ufs_enable(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = qmp_ufs_power_on(phy);
+	ret = qmp_ufs_phy_calibrate(phy);
 	if (ret)
 		qmp_ufs_exit(phy);
 
@@ -1941,7 +1941,7 @@ static int qmp_ufs_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 }
 
 static const struct phy_ops qcom_qmp_ufs_phy_ops = {
-	.power_on	= qmp_ufs_enable,
+	.power_on	= qmp_ufs_power_on,
 	.power_off	= qmp_ufs_disable,
 	.set_mode	= qmp_ufs_set_mode,
 	.owner		= THIS_MODULE,
-- 
2.48.1


