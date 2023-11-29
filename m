Return-Path: <linux-arm-msm+bounces-2371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDA17FD0C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 09:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18DF428277D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 08:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D57412B82;
	Wed, 29 Nov 2023 08:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iZNdTKEP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C155E19B0;
	Wed, 29 Nov 2023 00:29:21 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT5r1Iw009338;
	Wed, 29 Nov 2023 08:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=3qRh83pvQAgfIrcOIyvWFSSKh0f4DJmsl0ckPvcfu/M=;
 b=iZNdTKEPT00nAetVt31VgjTAuSIjrrnqlMj5NZyGWO31awV8UZb1xKqKb8Fpryk3FNJh
 EKzyptrtZFtrBoL4soWOq2d7mVgDDPhn6WXL4+IWx4eeg+Acee71shaNsZc7nLPn/TB9
 fY4QhlCXBFpgvBAZ9j1+ajxexgq4dzKIDRNk7y0I55gYtIuF0aph0ZmUmsS1E5l3RXia
 4iyYENEq1SF7CFcJ4ZcHDlaw01JGJgeUC4dUexnN21t1QSu4g9A23d05rjUIUNU2xd/w
 Vzx45h3z/0TaptrUqZkHfDu2I8aDj6BLzMSpgbK1fp7EteZUMK6fVe2hSNIiXctGvPwQ oA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unmra9s82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 08:29:00 +0000
Received: from pps.filterd (NASANPPMTA02.qualcomm.com [127.0.0.1])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3AT8Sxmh027627;
	Wed, 29 Nov 2023 08:28:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA02.qualcomm.com (PPS) with ESMTP id 3unmevpybn-1;
	Wed, 29 Nov 2023 08:28:59 +0000
Received: from NASANPPMTA02.qualcomm.com (NASANPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AT8I6Af011850;
	Wed, 29 Nov 2023 08:28:59 GMT
Received: from stor-dylan.qualcomm.com (stor-dylan.qualcomm.com [192.168.140.207])
	by NASANPPMTA02.qualcomm.com (PPS) with ESMTP id 3AT8Sw4E027620;
	Wed, 29 Nov 2023 08:28:59 +0000
Received: by stor-dylan.qualcomm.com (Postfix, from userid 359480)
	id D0F8620A5D; Wed, 29 Nov 2023 00:28:58 -0800 (PST)
From: Can Guo <quic_cang@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        adrian.hunter@intel.com, cmd4@qualcomm.com, beanhuo@micron.com,
        avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 06/10] scsi: ufs: ufs-qcom: Set initial PHY gear to max HS gear for HW ver 4 and newer
Date: Wed, 29 Nov 2023 00:28:31 -0800
Message-Id: <1701246516-11626-7-git-send-email-quic_cang@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1701246516-11626-1-git-send-email-quic_cang@quicinc.com>
References: <1701246516-11626-1-git-send-email-quic_cang@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Oahkjb8nFJ6UwpaLkvmqMj51nPRwZU--
X-Proofpoint-ORIG-GUID: Oahkjb8nFJ6UwpaLkvmqMj51nPRwZU--
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_06,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311290062
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Since HW ver 4, max HS gear can be get from UFS host controller's register,
use the max HS gear as the initial PHY gear instead of UFS_HS_G2, so that
we don't need to update the hard code for newer targets in future.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index aca6199..30f4ca6 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1060,6 +1060,20 @@ static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
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
+	if (host->hw_ver.major < 0x4)
+		host->phy_gear = UFS_HS_G2;
+}
+
 static void ufs_qcom_set_host_params(struct ufs_hba *hba)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
@@ -1296,6 +1310,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 	ufs_qcom_set_caps(hba);
 	ufs_qcom_advertise_quirks(hba);
 	ufs_qcom_set_host_params(hba);
+	ufs_qcom_set_phy_gear(host);
 
 	err = ufs_qcom_ice_init(host);
 	if (err)
@@ -1313,12 +1328,6 @@ static int ufs_qcom_init(struct ufs_hba *hba)
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


