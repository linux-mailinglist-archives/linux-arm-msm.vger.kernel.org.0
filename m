Return-Path: <linux-arm-msm+bounces-2368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E2C7FD0C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 09:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA0F0282A17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 08:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577B6125B0;
	Wed, 29 Nov 2023 08:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FdHIO0ch"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CB7F1BCC;
	Wed, 29 Nov 2023 00:29:15 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT0c1wP026202;
	Wed, 29 Nov 2023 08:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=B1stBXweFHGLo0FZ562PYkOASJIgvjARx2einm+rVNQ=;
 b=FdHIO0chEOw0EhLnLC8oXoMku4SAEwNZKIXVEPTYykYBQmPE/nkij9gvroEG9Opb+cUy
 7WTTOtNAiZ2KkmUn6tfcfWPti0TWzEwg208nolR8mf2kI10Pt67rCq/NuwBSQ4HYXebn
 ocITqoU5gjlaENLjLl4ZqZ9es5J0cOMHbVvP4c2z5wmPPupQWQpQOyiCuk500nGHCxA6
 VnjcGEB+733xtHNX++DPih0NZgvV3Ayj0aU9QNgxJujEYv7ZxNxIthf92AMGma+sI+Ku
 8MQhuO2XLeXsKLivQ9NhraglyhT0r9WXS5RF6VQvOiT1mK4A3plj16vJLES8HJWVP+Sa qg== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unnpesndy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 08:28:56 +0000
Received: from pps.filterd (NASANPPMTA03.qualcomm.com [127.0.0.1])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3AT8H9ST023384;
	Wed, 29 Nov 2023 08:28:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA03.qualcomm.com (PPS) with ESMTP id 3unmev6wy5-1;
	Wed, 29 Nov 2023 08:28:55 +0000
Received: from NASANPPMTA03.qualcomm.com (NASANPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AT8SsZO007540;
	Wed, 29 Nov 2023 08:28:55 GMT
Received: from stor-dylan.qualcomm.com (stor-dylan.qualcomm.com [192.168.140.207])
	by NASANPPMTA03.qualcomm.com (PPS) with ESMTP id 3AT8Ssse007534;
	Wed, 29 Nov 2023 08:28:54 +0000
Received: by stor-dylan.qualcomm.com (Postfix, from userid 359480)
	id 88EC120A5D; Wed, 29 Nov 2023 00:28:54 -0800 (PST)
From: Can Guo <quic_cang@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        adrian.hunter@intel.com, cmd4@qualcomm.com, beanhuo@micron.com,
        avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "Bao D . Nguyen" <quic_nguyenb@quicinc.com>,
        Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 03/10] scsi: ufs: ufs-qcom: Setup host power mode during init
Date: Wed, 29 Nov 2023 00:28:28 -0800
Message-Id: <1701246516-11626-4-git-send-email-quic_cang@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1701246516-11626-1-git-send-email-quic_cang@quicinc.com>
References: <1701246516-11626-1-git-send-email-quic_cang@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Hjbt9V35o9NguTUgbfLrfnroWd7AMMeq
X-Proofpoint-ORIG-GUID: Hjbt9V35o9NguTUgbfLrfnroWd7AMMeq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_06,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311290062
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Setup host power mode and its limitations during UFS host driver init to
avoid repetitive work during every power mode change.

Acked-by: Andrew Halaney <ahalaney@redhat.com>
Reviewed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Co-developed-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
Signed-off-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 21 ++++++++++++++-------
 drivers/ufs/host/ufs-qcom.h |  1 +
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index c21ff2c..9a90019 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -898,7 +898,7 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 				struct ufs_pa_layer_attr *dev_req_params)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-	struct ufs_host_params host_params;
+	struct ufs_host_params *host_params = &host->host_params;
 	int ret = 0;
 
 	if (!dev_req_params) {
@@ -908,12 +908,7 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 
 	switch (status) {
 	case PRE_CHANGE:
-		ufshcd_init_host_params(&host_params);
-
-		/* This driver only supports symmetic gear setting i.e., hs_tx_gear == hs_rx_gear */
-		host_params.hs_tx_gear = host_params.hs_rx_gear = ufs_qcom_get_hs_gear(hba);
-
-		ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
+		ret = ufshcd_negotiate_pwr_params(host_params, dev_max_params, dev_req_params);
 		if (ret) {
 			dev_err(hba->dev, "%s: failed to determine capabilities\n",
 					__func__);
@@ -1048,6 +1043,17 @@ static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
 		hba->quirks |= UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
 }
 
+static void ufs_qcom_set_host_params(struct ufs_hba *hba)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct ufs_host_params *host_params = &host->host_params;
+
+	ufshcd_init_host_params(host_params);
+
+	/* This driver only supports symmetic gear setting i.e., hs_tx_gear == hs_rx_gear */
+	host_params->hs_tx_gear = host_params->hs_rx_gear = ufs_qcom_get_hs_gear(hba);
+}
+
 static void ufs_qcom_set_caps(struct ufs_hba *hba)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
@@ -1272,6 +1278,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 
 	ufs_qcom_set_caps(hba);
 	ufs_qcom_advertise_quirks(hba);
+	ufs_qcom_set_host_params(hba);
 
 	err = ufs_qcom_ice_init(host);
 	if (err)
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 82cd143..11419eb 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -238,6 +238,7 @@ struct ufs_qcom_host {
 
 	struct gpio_desc *device_reset;
 
+	struct ufs_host_params host_params;
 	u32 phy_gear;
 
 	bool esi_enabled;
-- 
2.7.4


