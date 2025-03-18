Return-Path: <linux-arm-msm+bounces-51751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D77A676D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 15:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AC2A7A1411
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37157211466;
	Tue, 18 Mar 2025 14:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R1Z0qkrm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B10210186;
	Tue, 18 Mar 2025 14:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742309408; cv=none; b=INBkDNorxvAi/LBBwE+aD8qCIwuTrMdZVugToUTFVLqSlJPNtLcopdrj8ph+/iJi9ECyXsrr2ZNRLiqQpLjuNcMgI78zhgN4y/A4SMZsACtPlZGTprt+3msDo5pYgnM2I4zk+KCSizpsU/W6U1iY07VZR6moNAyBW5aVzdb1hyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742309408; c=relaxed/simple;
	bh=ns5XGacYh+EIZsGY98O/M+pjK07EgFDJQD2Go3xbYpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gQ1uNKrLJzDeSy1pDnci8I9bRxXSsgiyj5RTlAwF4AvvJyJdCPnjivopxcGzgYSuLoRKVCIWpT28eFi71kEgO32/yegf14uiWtY7BVMSWbe9RAZf3Cww9sfXZoLX7BSWD+jIOh+7FIR+oqS57idu9pXGklTw+GIpf0D9Kc2LgXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R1Z0qkrm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I8pHcP005608;
	Tue, 18 Mar 2025 14:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4bNYjrybVRl
	RDBuG+fzQfTBGaozaDxuhECWkqz0hNe4=; b=R1Z0qkrmE1BnYbGFXJ6JDAdQno/
	UmMa2DVF789u7E3/bBYP2zmscZDlsKEi7YWBQiybh7xsJ5cwE4Xj03shbSHf2XlN
	MDO+zcTe6cdoe5X3iNrsNXJk3WwaiSE6DSIJITUapzenDyy0QEctqf0xq7qntCLA
	Dg1PYed3DHO/QOuTVninDI8iMbbOQEOHphFckHZssdFQ/PZ/jqcwc84bZ+KchQgg
	XdCGsBvpLAnLjMTM3tAhvYOs1gLMG/e2GU1DCyEBDuPB20XFZnf2/OLGT96wUTCA
	T55UkxjZ0mx18WwNtWR/050OFFULSqWRyQ79kBo4TK92lKUjJpSr2U6eIFw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmbttdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 14:49:54 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52IEnlVo004267;
	Tue, 18 Mar 2025 14:49:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 45dkgmfv9d-1;
	Tue, 18 Mar 2025 14:49:51 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52IEnmWX004296;
	Tue, 18 Mar 2025 14:49:51 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 52IEnmLc004293;
	Tue, 18 Mar 2025 14:49:51 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 67007501582; Tue, 18 Mar 2025 20:19:50 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>,
        Can Guo <quic_cang@quicinc.com>
Subject: [PATCH V2 6/6] scsi: ufs: host : Introduce phy_power_on/off wrapper function
Date: Tue, 18 Mar 2025 20:19:44 +0530
Message-ID: <20250318144944.19749-7-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318144944.19749-1-quic_nitirawa@quicinc.com>
References: <20250318144944.19749-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: QS5i6desbJK_NXXjAiLvF8OMGpN0-plh
X-Proofpoint-GUID: QS5i6desbJK_NXXjAiLvF8OMGpN0-plh
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67d98812 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=Dj_YmL__GzIFt5dFpcoA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180109

Introduce ufs_qcom_phy_power_on and ufs_qcom_phy_power_off wrapper
functions with mutex protection to ensure safe usage of is_phy_pwr_on
and prevent possible race conditions.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 44 +++++++++++++++++++++++++++++++------
 drivers/ufs/host/ufs-qcom.h |  4 ++++
 2 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 5c7b6c75d669..8f80724e64b9 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -421,6 +421,38 @@ static u32 ufs_qcom_get_hs_gear(struct ufs_hba *hba)
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
@@ -449,7 +481,7 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
 		return ret;

 	if (phy->power_count) {
-		phy_power_off(phy);
+		ufs_qcom_phy_power_off(hba);
 		phy_exit(phy);
 	}

@@ -466,7 +498,7 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
 		goto out_disable_phy;

 	/* power on phy - start serdes and phy's power and clocks */
-	ret = phy_power_on(phy);
+	ret = ufs_qcom_phy_power_on(hba);
 	if (ret) {
 		dev_err(hba->dev, "%s: phy power on failed, ret = %d\n",
 			__func__, ret);
@@ -1017,7 +1049,6 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 				 enum ufs_notify_change_status status)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-	struct phy *phy = host->generic_phy;
 	int err;

 	/*
@@ -1037,7 +1068,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 				/* disable device ref_clk */
 				ufs_qcom_dev_ref_clk_ctrl(host, false);
 			}
-			err = phy_power_off(phy);
+			err = ufs_qcom_phy_power_off(hba);
 			if (err) {
 				dev_err(hba->dev, "phy power off failed, ret=%d\n", err);
 					return err;
@@ -1046,7 +1077,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 		break;
 	case POST_CHANGE:
 		if (on) {
-			err = phy_power_on(phy);
+			err = ufs_qcom_phy_power_on(hba);
 			if (err) {
 				dev_err(hba->dev, "phy power on failed, ret = %d\n", err);
 				return err;
@@ -1233,10 +1264,9 @@ static int ufs_qcom_init(struct ufs_hba *hba)
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
index d0e6ec9128e7..3db29fbcd40b 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -252,6 +252,10 @@ struct ufs_qcom_host {
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


