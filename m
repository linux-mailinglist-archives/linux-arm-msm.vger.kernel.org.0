Return-Path: <linux-arm-msm+bounces-53780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4E5A83DCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 11:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CEF94445B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A40214213;
	Thu, 10 Apr 2025 09:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n96fn5kV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1203213E8E;
	Thu, 10 Apr 2025 09:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275697; cv=none; b=dO3WGOkjHsL1sDrRqfkyQCw1y1MoZ9FnUus1pgzk16esH5MDojL1pDHXJ4w80joOTqMT6TvCSdu842K1PS3LP17vz9fRusOY9i2hC5xgt8GKxI3ooctNdoYlYnB61GO3ZOIdEx7t4+7tdjrAx/ob+k3bDBQnVjljb0H/QVJ5NkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275697; c=relaxed/simple;
	bh=MPBFnG1nvtPbAIvYdqcmDndgQzSlQ7is3IPdbtLCjzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tPpwwwfkYHSKD/cspBcudFGPW3VYWMx535p4YBxtotyFBnfjaWMsu3x2XEna1NLMITGx1fVSL+6t9ZKA9aN/ueinx86R4TRxq9wcHQP0EPBuGGzv1gR/D3BZkC0dEfUBWtcPMBoJntO8ojbxjAztup79aisndyxtFYg3ebrlcQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n96fn5kV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75KQ4032542;
	Thu, 10 Apr 2025 09:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R9v4yAabA8w
	ouf+6rlKco7OSf6hSWFTCPBVMFeLZj3I=; b=n96fn5kVzrcPP8bQkchCet9h9KW
	LwX4DWCSHNhm506UmZ6q6z0uK/NuIboBk2epMexXJGU5nZ2z6rLQaNSHOFHi4CjB
	L4MQ5dU7dpQuTIrkEHx3yln8XgfR+0XB9BEvdBSNxOX28DgegHKgadfk2IsGutvQ
	W2arFoRm0TdE5vzwG9ICxquqcQj1IM45yla2jWB8UdQmQlXQ3XTcbvRQ0lRDsGq9
	OICMo7VI1Y6o61qKbmgKQsPahAtF3dav2NCuceoQoSA8+LQ5jltsyXmJ7l9Nt1tW
	e9mA5564EHvfuZnArzRyccRdk+mz+H2ZeV7iMJUEhle/PU73ht2X56nKWrQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkp46k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 09:01:12 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53A919nu008774;
	Thu, 10 Apr 2025 09:01:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 45ue7g3rbn-1;
	Thu, 10 Apr 2025 09:01:09 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53A919b1008767;
	Thu, 10 Apr 2025 09:01:09 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 53A919f5008765;
	Thu, 10 Apr 2025 09:01:09 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 39B7C50158F; Thu, 10 Apr 2025 14:31:08 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V3 2/9] phy: qcom-qmp-ufs: Rename qmp_ufs_enable and qmp_ufs_power_on
Date: Thu, 10 Apr 2025 14:30:55 +0530
Message-ID: <20250410090102.20781-3-quic_nitirawa@quicinc.com>
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
X-Proofpoint-GUID: Bh5iRtOcp7G7PtgbNr7X0OiqpXsrvORg
X-Proofpoint-ORIG-GUID: Bh5iRtOcp7G7PtgbNr7X0OiqpXsrvORg
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f788d9 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=jENGRIT2ScPjwYuSNhQA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100067

Rename qmp_ufs_enable to qmp_ufs_power_on and qmp_ufs_power_on to
qmp_ufs_phy_calibrate to better reflect their functionality. Also
update function calls and structure assignments accordingly.

Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 45b3b792696e..bb836bc0f736 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1837,7 +1837,7 @@ static int qmp_ufs_init(struct phy *phy)
 	return 0;
 }
 
-static int qmp_ufs_power_on(struct phy *phy)
+static int qmp_ufs_phy_calibrate(struct phy *phy)
 {
 	struct qmp_ufs *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -1898,7 +1898,7 @@ static int qmp_ufs_exit(struct phy *phy)
 	return 0;
 }
 
-static int qmp_ufs_enable(struct phy *phy)
+static int qmp_ufs_power_on(struct phy *phy)
 {
 	int ret;
 
@@ -1906,7 +1906,7 @@ static int qmp_ufs_enable(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = qmp_ufs_power_on(phy);
+	ret = qmp_ufs_phy_calibrate(phy);
 	if (ret)
 		qmp_ufs_exit(phy);
 
@@ -1940,7 +1940,7 @@ static int qmp_ufs_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 }
 
 static const struct phy_ops qcom_qmp_ufs_phy_ops = {
-	.power_on	= qmp_ufs_enable,
+	.power_on	= qmp_ufs_power_on,
 	.power_off	= qmp_ufs_disable,
 	.set_mode	= qmp_ufs_set_mode,
 	.owner		= THIS_MODULE,
-- 
2.48.1


