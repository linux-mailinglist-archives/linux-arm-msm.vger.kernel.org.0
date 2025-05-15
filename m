Return-Path: <linux-arm-msm+bounces-58103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA8FAB8C75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 18:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 927A74E5DD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 16:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54EED22D7A5;
	Thu, 15 May 2025 16:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d0pGOsY2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6689822B5AD;
	Thu, 15 May 2025 16:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326480; cv=none; b=IKv7ibn8trtUxJbX4qbuaPG/OwZi1k3GuX88vetYw8HTWoC6k+GCyzKe+fbqr2wJL8HTuto0YjiWDBTnnRVsVBVoV/UQSoyJsy6c2QbFmhcBgll/v1mwkZQ2qfcpJjQP4joQyF9O8tdHHpUaca6xG3vf8n2Rm38ZCPO5C6b2OtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326480; c=relaxed/simple;
	bh=EdBxfW+Snlng58Crrzab4jaPqBuxgUg+wx3p96jqomk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qHZwXb4txYpYYepeRXs9xQo0O7EKEhTb1FNd2t8RUycpCNLZMC+1BFjYHHcMOdgmoHiwZCdyuz1UU+/V/RqSVaQKIDDlkXdRaNNc3qTrbnpsVdfQdiGnf3cmJ2p9ValZ6athwAVu2R+3/zngIZhsY68ySyYljsuZw7nuz9h/6qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d0pGOsY2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFnoi025311;
	Thu, 15 May 2025 16:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=t+RnysSDyDL
	Peif5c620gF9enFfldxyw8tQrkGefOP8=; b=d0pGOsY215vjO8BO7ognvMYLyuv
	3yGZGyPd5oDX009xg6AdSzBWnMAlxvx2ZzfplJdpdNnhHL4TT8QLdgPEgl3cGdiE
	3glmZiMkbk6xmrE8WIkjlMH5KeiGNh4BSSEnpxrGdG9RY7cPjGI8+w4DF8XDUCE0
	GGf7y5kVxQhftJWn+bLMx1fST2enZUPpqeW1o82W9+V2tycsJopjrq7cFf0QCfjt
	kUtAjeeKd1zOqAdg3lrbw8dWWXKRlKKVDwerTzyPcuq1nsoMSMJ3HKDAadF6iWnZ
	kNR0u7q/gPvPT0MHWrIeJXH+7VbiqoGgicHSpLFYO9en+Wjlyh+57uynx6w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmy1x7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 16:27:38 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54FGRZdp023676;
	Thu, 15 May 2025 16:27:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46hyvmvnq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 15 May 2025 16:27:35 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54FGRYOa023670;
	Thu, 15 May 2025 16:27:34 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54FGRYIq023668;
	Thu, 15 May 2025 16:27:34 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 019A35015B0; Thu, 15 May 2025 21:57:34 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V5 10/11] scsi: ufs: qcom : Introduce phy_power_on/off wrapper function
Date: Thu, 15 May 2025 21:57:21 +0530
Message-ID: <20250515162722.6933-11-quic_nitirawa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: HhdMT_DvDki77prnEpb3QdPcQu9fC4cR
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=682615fa cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=muU9dcZNfZ7YEnUq2GoA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: HhdMT_DvDki77prnEpb3QdPcQu9fC4cR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2MyBTYWx0ZWRfX1VG1uPTc5i10
 KnAl7f2UHKkvWe13xgdmc1SEiIhSEiCJFrWTj4ZqqCwF5nYGyG7/FNd4UFp3khpiMpAYwIigjj1
 88ZAYgYtJ4i4FdIfJ+lC19qbu+rIyfJFM6Xr/GiVvr5fApneqwGn5Ad0+c71Sv1b3F+WMUyVlY/
 x1UjuCZr7ZvEsPVsJRI/B0WqgXShknuR/keOTFhqkuZJrHtzWnY3UTnXh12wX+7QYh4GNmtl6BL
 WWXALxfQY+NyeIHfMdkHZY4/WN9Npri21cJTHjCbap6EZralntAh5BdbAU8gCgucmX6bhZ2MoWd
 yoBVKdKwflV46znEsTYt8IHZQXiM1KNsriSt3bgEaudasSAOnjYqzTc9prKhtR778UMma3Ekw0c
 BMRSuDk3qdMcyXsQgfZB12g90hHqxu6UYGaK1U7jlNgtE2vAzktDxneqFh5cePKaboa4orpG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150163

There can be scenarios where phy_power_on is called when PHY is
already on (phy_count=1). For instance, ufs_qcom_power_up_sequence
can be called multiple times from ufshcd_link_startup as part of
ufshcd_hba_enable call for each link startup retries(max retries =3),
causing the PHY reference count to increase and leading to inconsistent
phy behavior.

Similarly, there can be scenarios where phy_power_on or phy_power_off
might be called directly from the UFS controller driver when the PHY
is already powered on or off respectiely, causing similar issues.

To fix this, introduce ufs_qcom_phy_power_on and ufs_qcom_phy_power_off
wrappers for phy_power_on and phy_power_off. These wrappers will use an
is_phy_pwr_on flag to check if the PHY is already powered on or off,
avoiding redundant calls. Protect the is_phy_pwr_on flag with a mutex
to ensure safe usage and prevent race conditions.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 44 +++++++++++++++++++++++++++++++------
 drivers/ufs/host/ufs-qcom.h |  4 ++++
 2 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 3ee4ab90dfba..583db910efd4 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -479,6 +479,38 @@ static u32 ufs_qcom_get_hs_gear(struct ufs_hba *hba)
 	return UFS_HS_G3;
 }
 
+static int ufs_qcom_phy_power_on(struct ufs_hba *hba)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct phy *phy = host->generic_phy;
+	int ret = 0;
+
+	guard(mutex)(&host->phy_mutex);
+	if (!host->is_phy_pwr_on) {
+		ret = phy_power_on(phy);
+		if (!ret)
+			host->is_phy_pwr_on = true;
+	}
+
+	return ret;
+}
+
+static int ufs_qcom_phy_power_off(struct ufs_hba *hba)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct phy *phy = host->generic_phy;
+	int ret = 0;
+
+	guard(mutex)(&host->phy_mutex);
+	if (host->is_phy_pwr_on) {
+		ret = phy_power_off(phy);
+		if (!ret)
+			host->is_phy_pwr_on = false;
+	}
+
+	return ret;
+}
+
 static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
@@ -507,7 +539,7 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
 		return ret;
 
 	if (phy->power_count) {
-		phy_power_off(phy);
+		ufs_qcom_phy_power_off(hba);
 		phy_exit(phy);
 	}
 
@@ -524,7 +556,7 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
 		goto out_disable_phy;
 
 	/* power on phy - start serdes and phy's power and clocks */
-	ret = phy_power_on(phy);
+	ret = ufs_qcom_phy_power_on(hba);
 	if (ret) {
 		dev_err(hba->dev, "%s: phy power on failed, ret = %d\n",
 			__func__, ret);
@@ -1121,7 +1153,6 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 				 enum ufs_notify_change_status status)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-	struct phy *phy = host->generic_phy;
 	int err;
 
 	/*
@@ -1142,7 +1173,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 				ufs_qcom_dev_ref_clk_ctrl(host, false);
 			}
 
-			err = phy_power_off(phy);
+			err = ufs_qcom_phy_power_off(hba);
 			if (err) {
 				dev_err(hba->dev, "phy power off failed, ret=%d\n", err);
 				return err;
@@ -1151,7 +1182,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 		break;
 	case POST_CHANGE:
 		if (on) {
-			err = phy_power_on(phy);
+			err = ufs_qcom_phy_power_on(hba);
 			if (err) {
 				dev_err(hba->dev, "phy power on failed, ret = %d\n", err);
 				return err;
@@ -1339,10 +1370,9 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 static void ufs_qcom_exit(struct ufs_hba *hba)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-	struct phy *phy = host->generic_phy;
 
 	ufs_qcom_disable_lane_clks(host);
-	phy_power_off(phy);
+	ufs_qcom_phy_power_off(hba);
 	phy_exit(host->generic_phy);
 }
 
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 0a5cfc2dd4f7..f51b774e17be 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -281,6 +281,10 @@ struct ufs_qcom_host {
 	u32 phy_gear;
 
 	bool esi_enabled;
+	/* flag to check if phy is powered on */
+	bool is_phy_pwr_on;
+	/* Protect the usage of is_phy_pwr_on against racing */
+	struct mutex phy_mutex;
 };
 
 struct ufs_qcom_drvdata {
-- 
2.48.1


