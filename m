Return-Path: <linux-arm-msm+bounces-1429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C297F3EA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 08:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA0D9B21051
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 07:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 309AD18E09;
	Wed, 22 Nov 2023 07:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m1o0SJtb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0314F1AA;
	Tue, 21 Nov 2023 23:11:27 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AM4u8vM016527;
	Wed, 22 Nov 2023 07:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=Bo886srp5MIVH1wCxiVYC/PHqeZIjQZkwCjvvESOKhI=;
 b=m1o0SJtbfSaBIfymAP+XBDcS/KH+4/ejPr6oz1vy2plynrVNBweN9UguKSbRvP9YoBhX
 mJw+iKS8XSESKHh4IfpvH+mLmF4kbwDn36tRl7iI4vzbyW9vSWtSdxHcxQt3hqQmnOtv
 BqAc2VFIBgHPPalOM1j+IXk4iibT5cGGtqNZ5SVodjDahhxjV0V/jtXMWMibSsANBm2D
 i4PuX4DGLu2rcIcgeyHlPPPK0JX7Ce3U/ztHBOTawruTnbRqOjyp6+nfEPlUC4RBcTYK
 xiw7fjjyavcC7kibG1QbmM0t0cXkqMRkr9GzhqDmSyzml2OrfNhc9e4uS9B99bZpOB4X GA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugr85uah1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 07:11:05 +0000
Received: from pps.filterd (NASANPPMTA05.qualcomm.com [127.0.0.1])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3AM71nw6012999;
	Wed, 22 Nov 2023 07:11:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA05.qualcomm.com (PPS) with ESMTP id 3uhcusg3y4-1;
	Wed, 22 Nov 2023 07:11:04 +0000
Received: from NASANPPMTA05.qualcomm.com (NASANPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AM75bsG019002;
	Wed, 22 Nov 2023 07:11:03 GMT
Received: from stor-dylan.qualcomm.com (stor-dylan.qualcomm.com [192.168.140.207])
	by NASANPPMTA05.qualcomm.com (PPS) with ESMTP id 3AM7B3va027624;
	Wed, 22 Nov 2023 07:11:03 +0000
Received: by stor-dylan.qualcomm.com (Postfix, from userid 359480)
	id 06F0820A65; Tue, 21 Nov 2023 23:11:01 -0800 (PST)
From: Can Guo <quic_cang@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        stanley.chu@mediatek.com, adrian.hunter@intel.com, beanhuo@micron.com,
        avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com
Cc: "Bao D . Nguyen" <quic_nguyenb@quicinc.com>,
        Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-arm-msm@vger.kernel.org (open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...),
        linux-scsi@vger.kernel.org (open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 03/11] scsi: ufs: ufs-qcom: Setup host power mode during init
Date: Tue, 21 Nov 2023 23:10:34 -0800
Message-Id: <1700637042-11104-4-git-send-email-quic_cang@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1700637042-11104-1-git-send-email-quic_cang@quicinc.com>
References: <1700637042-11104-1-git-send-email-quic_cang@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rXay6qRCkP64GWd54eDRqsgUstZIJzLb
X-Proofpoint-ORIG-GUID: rXay6qRCkP64GWd54eDRqsgUstZIJzLb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_04,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220050
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Setup host power mode and its limitations during UFS host driver init to
avoid repetitive work during every power mode change.

Acked-by: Andrew Halaney <ahalaney@redhat.com>
Co-developed-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
Signed-off-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 21 ++++++++++++++-------
 drivers/ufs/host/ufs-qcom.h |  1 +
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index cc30ad9..cc0eb37 100644
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
-		ufshcd_init_host_param(&host_params);
-
-		/* This driver only supports symmetic gear setting i.e., hs_tx_gear == hs_rx_gear */
-		host_params.hs_tx_gear = host_params.hs_rx_gear = ufs_qcom_get_hs_gear(hba);
-
-		ret = ufshcd_negotiate_pwr_param(&host_params, dev_max_params, dev_req_params);
+		ret = ufshcd_negotiate_pwr_param(host_params, dev_max_params, dev_req_params);
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
+	ufshcd_init_host_param(host_params);
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


