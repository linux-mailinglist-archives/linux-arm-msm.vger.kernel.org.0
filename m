Return-Path: <linux-arm-msm+bounces-1657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6817E7F5A90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 09:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2345728176A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 08:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA7A1C29E;
	Thu, 23 Nov 2023 08:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OPEvdT3N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3175BD47;
	Thu, 23 Nov 2023 00:52:25 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AN8fL4t007760;
	Thu, 23 Nov 2023 08:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=IwN62VLEShy+VSKK0jRx0klroKj4fpZ9T+/MVP2hILs=;
 b=OPEvdT3N805RCFjM2YLvlHAYpGRiE67svHlQ0bYjg+Er5W8ktaVi7bBNPqk/0qtR745c
 DA8pyql4I0Kly6iMCww0J0VSl/CsjM7fIlYAX1yCYoxVx6YhcXjC66McW5dw8mHNVqdL
 bpsbzzj6bHh8vpidbjU6LCnU77V6bUDjqNOEJlqHCXZeqAzrEG7M/87j80mPtoYxGVoF
 a6m7q9eVa/4o4Tol2dLUrq2S/eRwkMK/cJ5D8scKq29sKu9b/WqxAvRbLGwYmdAFevWL
 Jse+tNMiftLpepCtf0spwluU20cKzBJoCFEJ0Mm3CotcS8pwJLHe/ERERFAsQcnk0foc wQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uj3ec00db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 08:47:11 +0000
Received: from pps.filterd (NASANPPMTA03.qualcomm.com [127.0.0.1])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3AN8hkmB007795;
	Thu, 23 Nov 2023 08:47:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA03.qualcomm.com (PPS) with ESMTP id 3uhwcrkkb6-1;
	Thu, 23 Nov 2023 08:47:10 +0000
Received: from NASANPPMTA03.qualcomm.com (NASANPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AN8anaq029807;
	Thu, 23 Nov 2023 08:47:10 GMT
Received: from stor-dylan.qualcomm.com (stor-dylan.qualcomm.com [192.168.140.207])
	by NASANPPMTA03.qualcomm.com (PPS) with ESMTP id 3AN8lAno012040;
	Thu, 23 Nov 2023 08:47:10 +0000
Received: by stor-dylan.qualcomm.com (Postfix, from userid 359480)
	id 285CB20A68; Thu, 23 Nov 2023 00:47:10 -0800 (PST)
From: Can Guo <quic_cang@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        adrian.hunter@intel.com, beanhuo@micron.com, avri.altman@wdc.com,
        junwoo80.lee@samsung.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 07/10] scsi: ufs: ufs-qcom: Set initial PHY gear to max HS gear for HW ver 5 and newer
Date: Thu, 23 Nov 2023 00:46:27 -0800
Message-Id: <1700729190-17268-8-git-send-email-quic_cang@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1700729190-17268-1-git-send-email-quic_cang@quicinc.com>
References: <1700729190-17268-1-git-send-email-quic_cang@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IDsJu7vftQwSmB2iUqODQ_Ua3PGXbQUR
X-Proofpoint-GUID: IDsJu7vftQwSmB2iUqODQ_Ua3PGXbQUR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_06,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 phishscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311230062
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Set the initial PHY gear to max HS gear for hosts with HW ver 5 and newer.

This patch is not changing any functionalities or logic but only a
preparation patch for the next patch in this series.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 6756f8d..7bbccf4 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1067,6 +1067,20 @@ static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
 		hba->quirks |= UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
 }
 
+static void ufs_qcom_set_phy_gear(struct ufs_qcom_host *host)
+{
+	struct ufs_host_params *host_params = &host->host_params;
+
+	host->phy_gear = host_params->hs_tx_gear;
+
+	/*
+	 * Power up the PHY using the minimum supported gear (UFS_HS_G2).
+	 * Switching to max gear will be performed during reinit if supported.
+	 */
+	if (host->hw_ver.major < 0x5)
+		host->phy_gear = UFS_HS_G2;
+}
+
 static void ufs_qcom_set_host_params(struct ufs_hba *hba)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
@@ -1303,6 +1317,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 	ufs_qcom_set_caps(hba);
 	ufs_qcom_advertise_quirks(hba);
 	ufs_qcom_set_host_params(hba);
+	ufs_qcom_set_phy_gear(host);
 
 	err = ufs_qcom_ice_init(host);
 	if (err)
@@ -1320,12 +1335,6 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 		dev_warn(dev, "%s: failed to configure the testbus %d\n",
 				__func__, err);
 
-	/*
-	 * Power up the PHY using the minimum supported gear (UFS_HS_G2).
-	 * Switching to max gear will be performed during reinit if supported.
-	 */
-	host->phy_gear = UFS_HS_G2;
-
 	return 0;
 
 out_variant_clear:
-- 
2.7.4


