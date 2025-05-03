Return-Path: <linux-arm-msm+bounces-56657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A9EAA819A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 18:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 764D77ABE92
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 16:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17AF2798EA;
	Sat,  3 May 2025 16:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NSCk+CwH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E5B190696;
	Sat,  3 May 2025 16:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746289514; cv=none; b=cbo+NbOPumWsMbCjRFS99/cs6dPVflQjWbRKQ5416P1ssOXM/5tH9PtuQE+zMjrt0EWuk+vAKRao5HR+ULaZXH9iS7TkBQnpV00k0YXPKLHl1nZVX7YMEkYoV+p/f3FVj4eFGUs7uTQgYKZPzPnGlMRA1aexay1Or2RhGsWi5oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746289514; c=relaxed/simple;
	bh=vwbG6FpPBe6A77uzV2oCOW1TLfsN7WhEAITLgCpV1eI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VlGyNGnCxyyykkRD/tfinmNKabpyZFkmklR/wr1S9VpD3cgr2RmzlN6QB40eJ4a7B1Y1Pl03MeHMkBHjIMVSZWpR6W47azz7qI8ZZffziSnUaD79a6eQkMl4eAu196cId16up8IwWwr05Q6KQItNc16qjqUXIvRXl2bmQlIUMcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NSCk+CwH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543FvM76027970;
	Sat, 3 May 2025 16:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WyDchYDX0sD
	gjTQUSTbl3LvJzICozV2vyEErxQ40wQY=; b=NSCk+CwH/S8Yu5DUcBkfem3KDpt
	A0VpWOqVdTky1RkDrSxSSsvV8Ykef6g5lmv0Lg/x9/RApcbHKKnZRYjjO0TME5WW
	0McG6s5t9ewwwxFnkRQ+VBpb2LdExQXD3dXt0FEDIYNxGwXKNXQDq/6HiNtFeX0/
	/ArfnTqo6Ssgo6VFmox5acZl5FTt4Ts1FOHBlQOa17zV76bLr8tdU5qG1nZanaVP
	4y0Fo2MjmqRoGs75yew6b7DMVVu8ilb0/F/7QXYyGqjm5YScM4luG05oufxUtFWf
	5aQj/BmIwwhz/9wy1dMoqIHdvoSy6pGk3Zrdi0MKj/6cwaF3A9PGAcxnzvQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rrwxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 16:24:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 543GOlVH029835;
	Sat, 3 May 2025 16:24:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 46dc7kb1fn-1;
	Sat, 03 May 2025 16:24:47 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 543GOlrh029826;
	Sat, 3 May 2025 16:24:47 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 543GOlV1029825;
	Sat, 03 May 2025 16:24:47 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id BB56C5015A2; Sat,  3 May 2025 21:54:46 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V4 04/11] phy: qcom-qmp-ufs: Refactor UFS PHY reset
Date: Sat,  3 May 2025 21:54:33 +0530
Message-ID: <20250503162440.2954-5-quic_nitirawa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: uzyxABBvh587BFNN1dKngaHKOfDuQ9cb
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=68164353 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=SnDgZOM3ual17WrlNmIA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uzyxABBvh587BFNN1dKngaHKOfDuQ9cb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE1MCBTYWx0ZWRfX8pYAbSTxn9br
 cm6Ss4TDkE3cI424QL3x+zVryq3NcMTgqDZ6rXeLsJQkxaNngo0VbFxr7ynhHOOjGYpJHbpGcS0
 HNjhUyZEWsGDYFXwmJmIreuIUUlkvRdPavbmuULBTTOPNKkNXu1T42XbEmdVRH1w+K4ePx0DoGJ
 DbuSibMXesMYMrOwD2EBrJ8vEAd+ISXzj3n893OJMxKqPY27vbbz3MyJNK5Iis+Xa9IHEdilQ+4
 etsWBjUqna5ZD81jlzgrVZUMxLv8BOY/p1EgJ/X1Mr9LdiZnW1NTA3CDiXDIRWkMl+MJ6xU4hfJ
 V9OCbUNI+HfKbaUkaL7ZKrMWcRJOAA5CsWKI1AqtDD3V07H9N9gjNlbp+HNdWG/Ojfx6YcCQ2FH
 61427fzkNGIHiJkbcoc+vv2M45zVU3FkjLYvv2bJH3E6FBiMKK5jy3d2ijDNtWtqnUT1h+w6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_07,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030150

Refactor the UFS PHY reset handling to parse the reset logic only once
during initialization, instead of every resume.

As part of this change, move the UFS PHY reset parsing logic from
qmp_phy_power_on to the new qmp_ufs_phy_init function.

Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 59 +++++++++++++------------
 1 file changed, 31 insertions(+), 28 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 636dc3dc3ea8..43d2d714f28b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1799,38 +1799,11 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
 static int qmp_ufs_power_on(struct phy *phy)
 {
 	struct qmp_ufs *qmp = phy_get_drvdata(phy);
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	int ret;
 	dev_vdbg(qmp->dev, "Initializing QMP phy\n");

-	if (cfg->no_pcs_sw_reset) {
-		/*
-		 * Get UFS reset, which is delayed until now to avoid a
-		 * circular dependency where UFS needs its PHY, but the PHY
-		 * needs this UFS reset.
-		 */
-		if (!qmp->ufs_reset) {
-			qmp->ufs_reset =
-				devm_reset_control_get_exclusive(qmp->dev,
-								 "ufsphy");
-
-			if (IS_ERR(qmp->ufs_reset)) {
-				ret = PTR_ERR(qmp->ufs_reset);
-				dev_err(qmp->dev,
-					"failed to get UFS reset: %d\n",
-					ret);
-
-				qmp->ufs_reset = NULL;
-				return ret;
-			}
-		}
-	}
-
 	ret = qmp_ufs_com_init(qmp);
-	if (ret)
-		return ret;
-
-	return 0;
+	return ret;
 }

 static int qmp_ufs_phy_calibrate(struct phy *phy)
@@ -1924,7 +1897,37 @@ static int qmp_ufs_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 	return 0;
 }

+static int qmp_ufs_phy_init(struct phy *phy)
+{
+	struct qmp_ufs *qmp = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	int ret;
+
+	if (!cfg->no_pcs_sw_reset)
+		return 0;
+
+	/*
+	 * Get UFS reset, which is delayed until now to avoid a
+	 * circular dependency where UFS needs its PHY, but the PHY
+	 * needs this UFS reset.
+	 */
+	if (!qmp->ufs_reset) {
+		qmp->ufs_reset =
+			devm_reset_control_get_exclusive(qmp->dev, "ufsphy");
+
+		if (IS_ERR(qmp->ufs_reset)) {
+			ret = PTR_ERR(qmp->ufs_reset);
+			dev_err(qmp->dev, "failed to get PHY reset: %d\n", ret);
+			qmp->ufs_reset = NULL;
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static const struct phy_ops qcom_qmp_ufs_phy_ops = {
+	.init		= qmp_ufs_phy_init,
 	.power_on	= qmp_ufs_power_on,
 	.power_off	= qmp_ufs_disable,
 	.calibrate	= qmp_ufs_phy_calibrate,
--
2.48.1


