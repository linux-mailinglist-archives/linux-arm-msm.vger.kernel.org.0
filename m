Return-Path: <linux-arm-msm+bounces-53782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE7CA83DBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 11:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9638A7B4A05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF362147E6;
	Thu, 10 Apr 2025 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ceo8Y/Ps"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6B82135D0;
	Thu, 10 Apr 2025 09:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275698; cv=none; b=LOhispOJaiLt3mA+3JCUu27yWDN5ZxyVISYT1tjzsW3DSNy2c5hcd3B/30wHohUloLw7kvmprWDZyp4kTFWmIKZCrHrBP7ZlkuvYhVMFhUgy9oTdCfOQEGGuPEJphOdpeWq2F1ttDGCrqxsOx6hVMxtqOGxCPAA6eg2xnhenRPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275698; c=relaxed/simple;
	bh=rLJT7PMYdDfrhBYoIO5yc6Lk35exnlExZd2ILrN7gh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UIidZlRXtCVMdUZyXZiSnmiZhrn0eC+1QLjv03X0/5dLPreJEgJxM6lKTKOCD8uHuRRyDXFdDnQsX+Lp6/pjsRwePamHoGyp9vYddZwX2cn6yJK/+tQq4ic+XibY/6XLJOhZjEEVQgCvrvJ11+P4IxZ0Wmfd+Y/mOZ5QcbbkLVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ceo8Y/Ps; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75Nal008265;
	Thu, 10 Apr 2025 09:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MLKXj7C9l9i
	fyhcdI8gARUUb6UfQFfE2X/Tjg91ybeg=; b=ceo8Y/PsREPXkLIw4gVwBz38a3U
	KYq7luvcU853ISx1/DDXrBZPI5MRIjFi1V9QnrELmtATHheOmDS9Q8HoxsEpE/VR
	Ndj2z0KB21lrVvXzBA2d2X9orjtyO7dYrJM4y722m/TAKL5N4Gp7wF4hRFQtHpJV
	6tw3bXI94gp1eoJg8z/RXBlZK5An/RmuX0PoW3AxodYX6uWBCzSkNKoRPF7gugAU
	WmGv9ez/l/xAt/eldt5FHOHMCb5YalI522fWTm2nXDmIOH59KSpW/HKGApQsPtw9
	1TPYd65IPCaZ4lDk1Aw5YRkr7aQu8YNhP/59quGukz7Xh8PRfd4H4W8Sncg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd06crt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 09:01:13 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53A91ABM008791;
	Thu, 10 Apr 2025 09:01:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 45ue7g3rbu-1;
	Thu, 10 Apr 2025 09:01:10 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53A91A2f008783;
	Thu, 10 Apr 2025 09:01:10 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 53A91AgM008782;
	Thu, 10 Apr 2025 09:01:10 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id A1F2750158F; Thu, 10 Apr 2025 14:31:09 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>,
        Can Guo <quic_cang@quicinc.com>
Subject: [PATCH V3 3/9] phy: qcom-qmp-ufs: Refactor phy_power_on and phy_calibrate callbacks
Date: Thu, 10 Apr 2025 14:30:56 +0530
Message-ID: <20250410090102.20781-4-quic_nitirawa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Soz8U48azUBrE3xYJVW0OfFX7MPrugiK
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f788da cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=ZEhkBkkNTqPGxlI-GDwA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Soz8U48azUBrE3xYJVW0OfFX7MPrugiK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100066

Commit 052553af6a31 ("ufs/phy: qcom: Refactor to use phy_init call")
puts enabling regulators & clks, calibrating UFS PHY, starting serdes
and polling PCS ready status into phy_power_on.

In Current code regulators enable, clks enable, calibrating UFS PHY,
start_serdes and polling PCS_ready_status are part of phy_power_on.

UFS PHY registers are retained after power collapse, meaning calibrating
UFS PHY, start_serdes and polling PCS_ready_status can be done only when
hba is powered_on, and not needed every time when phy_power_on is called
during resume. Hence keep the code which enables PHY's regulators & clks
in phy_power_on and move the rest steps into phy_calibrate function.

Refactor the code to retain PHY regulators & clks in phy_power_on and
move out rest of the code to new phy_calibrate function.

Also move reset_control_assert to qmp_ufs_phy_calibrate to align
with Hardware programming guide.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 26 ++++++-------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index bb836bc0f736..636dc3dc3ea8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1796,7 +1796,7 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
 	return 0;
 }

-static int qmp_ufs_init(struct phy *phy)
+static int qmp_ufs_power_on(struct phy *phy)
 {
 	struct qmp_ufs *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -1824,10 +1824,6 @@ static int qmp_ufs_init(struct phy *phy)
 				return ret;
 			}
 		}
-
-		ret = reset_control_assert(qmp->ufs_reset);
-		if (ret)
-			return ret;
 	}

 	ret = qmp_ufs_com_init(qmp);
@@ -1846,6 +1842,10 @@ static int qmp_ufs_phy_calibrate(struct phy *phy)
 	unsigned int val;
 	int ret;

+	ret = reset_control_assert(qmp->ufs_reset);
+	if (ret)
+		return ret;
+
 	qmp_ufs_init_registers(qmp, cfg);

 	ret = reset_control_deassert(qmp->ufs_reset);
@@ -1898,21 +1898,6 @@ static int qmp_ufs_exit(struct phy *phy)
 	return 0;
 }

-static int qmp_ufs_power_on(struct phy *phy)
-{
-	int ret;
-
-	ret = qmp_ufs_init(phy);
-	if (ret)
-		return ret;
-
-	ret = qmp_ufs_phy_calibrate(phy);
-	if (ret)
-		qmp_ufs_exit(phy);
-
-	return ret;
-}
-
 static int qmp_ufs_disable(struct phy *phy)
 {
 	int ret;
@@ -1942,6 +1927,7 @@ static int qmp_ufs_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 static const struct phy_ops qcom_qmp_ufs_phy_ops = {
 	.power_on	= qmp_ufs_power_on,
 	.power_off	= qmp_ufs_disable,
+	.calibrate	= qmp_ufs_phy_calibrate,
 	.set_mode	= qmp_ufs_set_mode,
 	.owner		= THIS_MODULE,
 };
--
2.48.1


