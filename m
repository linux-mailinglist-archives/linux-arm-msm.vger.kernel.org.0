Return-Path: <linux-arm-msm+bounces-56664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E81D5AA81B1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 18:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0986188E21B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 16:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F71E27CCEF;
	Sat,  3 May 2025 16:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MSzuyLah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2061F1508;
	Sat,  3 May 2025 16:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746289521; cv=none; b=jpy/nqpUfOrHCCkBBj1+lffzqt9EoIxucd8Cc34tCN24RHumaaKLmxxJtg+m+ps17ECYbqGBv9vmrZ8tOQ+fXR94NjXgQA3TZldEEW795zr4C9OPNGse1X5I5E/G1ogsnGmxa8C6EKhK89PRYpdctFJrfti8Vi5xHSQ8RwQRdlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746289521; c=relaxed/simple;
	bh=eyLG5r5bsnKwyi1CqrrMeh5HanKIv5wosWS273pwKhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dXLcEfKIAMgue1cD4QHBgWxU3N/85zPgM+XX2zIrF+cpecN3fTowwPmdNzj95KdwTt3ieh7fJRZ/EApsvAfNgI+pQ/4IKSrPmkXNZYzw5DtcqlopCo/fHD4ZGACMNb7fsSB6njjzPRIJHrCaO27xN7zf7JtHtPngrlSi60nUnJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MSzuyLah; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543Dfv9h018687;
	Sat, 3 May 2025 16:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1ZrYWpYIFOX
	E4lncYahCirXdfyZ/wh/BZaUTmCDzCIU=; b=MSzuyLahw0NMiasQrkYpjOqECph
	cz9Ge4YXYs3Bgjw7xzrc4Mowa4x11yY8TyEsxDRf3wGfOaD32znXX3von54b4Djp
	t7qr7LfhYGTN9/o14SQWlsCL4vksSeD07P3Itvwl70cBOiSoHQZFAfprBbKgqf5V
	foftZygBO99cxXLAtcpjn9wmmIjweYtjvr8YL5MOn8K4PJAGlOYeMvo1UWFsielz
	Vqr8V6qp/el2corf2Tlzf9SvQvelTuddFsLuFdG+46GARKSo38IUt2Fziy3Y6QL/
	eA2rDHi8dxcByZU5PzAfIwhUUPf3H1PUCUUei0DnbNcoyp1Dz2auK70ezvA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc58ua5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 16:24:59 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 543GOjrm029804;
	Sat, 3 May 2025 16:24:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 46dc7kb1gt-1;
	Sat, 03 May 2025 16:24:56 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 543GOtDN029948;
	Sat, 3 May 2025 16:24:55 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 543GOt95029947;
	Sat, 03 May 2025 16:24:55 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 129265015A2; Sat,  3 May 2025 21:54:55 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V4 10/11] scsi: ufs: qcom : Introduce phy_power_on/off wrapper function
Date: Sat,  3 May 2025 21:54:39 +0530
Message-ID: <20250503162440.2954-11-quic_nitirawa@quicinc.com>
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
X-Proofpoint-GUID: XESIZspFT_M1wiU7xEmhe8Xqd60VLH6H
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=6816435b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=fCbX77z8Gh-i-5kHVyEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: XESIZspFT_M1wiU7xEmhe8Xqd60VLH6H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE1MCBTYWx0ZWRfXxEkBtkd/FEWd
 9Z2gi1P5g1CUO/s4o8rUEyA4pQbTHMDwFO9jEj025yqYnNav8hfks0FQ1yjjTLTkm5b0udE5BVa
 aFhh4l1XbHM7l6A8FMgiV7h1e7VNFO5AqzjcJJPhQRzc/2TKrcXZByAnDQ5E///5wtPKjH76PfJ
 M0kewx6tS+J7SRK1IjHZfLCkHj3RDD1uW/ilTshS6X0MMJqJKrp1n8wORFNGckWG2VYUyTUCZN8
 Y6weFkNXaid2jbnHbY6gTsLw+yjth2q34mdi1gUHTkEbcuQrT16wSYjBdoeMxRKwVXm78Baf0GV
 1LOh/hMTEXB9y2oeOmA4pYye3+BYnkMXyLKvdqlqExQ3cEpHVvziTs2DPn84lrBgF4TE/y7zTpk
 5+LHUjTQ2vMGYeJcAbTVNDG5+cD3c357kRXXQPaHTb0niw5ZdgkBJji89JVZQd34ifxBPlDD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_07,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030150

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
index ff35cd15c72f..a7e9e06847f8 100644
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
@@ -1018,7 +1050,6 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 				 enum ufs_notify_change_status status)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-	struct phy *phy = host->generic_phy;
 	int err;
 
 	/*
@@ -1038,7 +1069,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 				/* disable device ref_clk */
 				ufs_qcom_dev_ref_clk_ctrl(host, false);
 			}
-			err = phy_power_off(phy);
+			err = ufs_qcom_phy_power_off(hba);
 			if (err) {
 				dev_err(hba->dev, "%s: phy power off failed, ret=%d\n",
 					__func__, err);
@@ -1048,7 +1079,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 		break;
 	case POST_CHANGE:
 		if (on) {
-			err = phy_power_on(phy);
+			err = ufs_qcom_phy_power_on(hba);
 			if (err) {
 				dev_err(hba->dev, "%s: phy power on failed, ret = %d\n",
 					__func__, err);
@@ -1236,10 +1267,9 @@ static int ufs_qcom_init(struct ufs_hba *hba)
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


