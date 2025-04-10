Return-Path: <linux-arm-msm+bounces-53787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB82A83DC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 11:04:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 924F47ADE12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B91E22171F;
	Thu, 10 Apr 2025 09:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FRMwpHKd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C6B21D00A;
	Thu, 10 Apr 2025 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275705; cv=none; b=YRbGIoq976h7TpO1UqCC/EynL0IQGVExMacD6b5ClJt1Enr57C/Q051wKA++C9zDIvgu99NUZ/cc90j3RAAALV+gCSL+r1+8vrDz2lFV2zPnQH57zyVp2mKikTStuWl/2pwyR6TNbd0gvb4sVlrOE/5PQh/llR1HWKTOZ5vyLfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275705; c=relaxed/simple;
	bh=yZUBdF8UHV5YH6DJki4WlUGa0o7sl4yxjjRgY6cHI88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q65wSRHNKFYnJhR9Qn9HGE6o/CwBIBqXUy/SgWg1kq/ddNa4he7vfUNUZXBUfhhz2mzRw453rrZym3Nm9iYM106nk1uhERtmnjpBwu+AhndumrybJFnxeWoEFxMNKiQJ5Nxq0++1Z/+RY8rcJ2D3g4/HmCwsWUOpMpz0ZVNKMiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FRMwpHKd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75LqK010615;
	Thu, 10 Apr 2025 09:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yChvvL4UPQI
	d5Vk5ZOD5eLPfbBTu3YBdwb/rkdHAkZY=; b=FRMwpHKdg/peWmVlnKOmbxBvge3
	hkWC5A+XL5GUvjZlBl13kB7UhR0vF6spDC3hDdmAyRGjPk5uaLRVFGk0J5jUZdGn
	UzfA0SkGmL3PYHh6Mexwz8lUq4s4/+dKC6ONC8XY3Ofpb5UXVCbsx3I8AB0eDQdp
	QDK0uxAPIUzGgSlpomRiGS7U5wNuGyFo0bgczAd2XmF1sm9G0nxrxTEqOR9n5R+C
	sc0pYJkHiCJ7AggLQTpTAX7hHPgTCcrazAvfX6OFvsgC3vwed7L+JXg+sn1453Yk
	i/O06tgY6GjNCn6uooTkEebFMXfuc1uAk6fHrZBtndBUN2nXAMq9sIdLmcg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3p85n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 09:01:18 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53A91AHc008790;
	Thu, 10 Apr 2025 09:01:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 45ue7g3rcw-1;
	Thu, 10 Apr 2025 09:01:15 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53A91FeS009202;
	Thu, 10 Apr 2025 09:01:15 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 53A91F4J009044;
	Thu, 10 Apr 2025 09:01:15 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 77C3D50158F; Thu, 10 Apr 2025 14:31:14 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>,
        Can Guo <quic_cang@quicinc.com>
Subject: [PATCH V3 7/9] scsi: ufs: qcom : Refactor phy_power_on/off calls
Date: Thu, 10 Apr 2025 14:31:00 +0530
Message-ID: <20250410090102.20781-8-quic_nitirawa@quicinc.com>
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
X-Proofpoint-GUID: tHPVMywPKnVHcOk47javHViyDbZrPmlW
X-Proofpoint-ORIG-GUID: tHPVMywPKnVHcOk47javHViyDbZrPmlW
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f788df cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=ylzO3PbLlNu0Q4qtwUgA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100067

Commit 3f6d1767b1a0 ("phy: ufs-qcom: Refactor all init steps into
phy_poweron") removes the phy_power_on/off from ufs_qcom_setup_clocks
to suspend/resume func.

To have a better power saving, remove the phy_power_on/off calls from
resume/suspend path and put them back to ufs_qcom_setup_clocks, so that
PHY regulators & clks can be turned on/off along with UFS's clocks.

Since phy phy_power_on is separated out from phy calibrate, make
separate calls to phy_power_on and phy_calibrate calls from ufs qcom
driver.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 55 ++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 32 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 4998656e9267..197e84d47eec 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -639,26 +639,17 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 	enum ufs_notify_change_status status)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-	struct phy *phy = host->generic_phy;
 
 	if (status == PRE_CHANGE)
 		return 0;
 
-	if (ufs_qcom_is_link_off(hba)) {
-		/*
-		 * Disable the tx/rx lane symbol clocks before PHY is
-		 * powered down as the PLL source should be disabled
-		 * after downstream clocks are disabled.
-		 */
+	if (!ufs_qcom_is_link_active(hba))
 		ufs_qcom_disable_lane_clks(host);
-		phy_power_off(phy);
 
-		/* reset the connected UFS device during power down */
-		ufs_qcom_device_reset_ctrl(hba, true);
 
-	} else if (!ufs_qcom_is_link_active(hba)) {
-		ufs_qcom_disable_lane_clks(host);
-	}
+	/* reset the connected UFS device during power down */
+	if (ufs_qcom_is_link_off(hba) && host->device_reset)
+		ufs_qcom_device_reset_ctrl(hba, true);
 
 	return ufs_qcom_ice_suspend(host);
 }
@@ -666,26 +657,11 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-	struct phy *phy = host->generic_phy;
 	int err;
 
-	if (ufs_qcom_is_link_off(hba)) {
-		err = phy_power_on(phy);
-		if (err) {
-			dev_err(hba->dev, "%s: failed PHY power on: %d\n",
-				__func__, err);
-			return err;
-		}
-
-		err = ufs_qcom_enable_lane_clks(host);
-		if (err)
-			return err;
-
-	} else if (!ufs_qcom_is_link_active(hba)) {
-		err = ufs_qcom_enable_lane_clks(host);
-		if (err)
-			return err;
-	}
+	err = ufs_qcom_enable_lane_clks(host);
+	if (err)
+		return err;
 
 	return ufs_qcom_ice_resume(host);
 }
@@ -1042,6 +1018,8 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 				 enum ufs_notify_change_status status)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct phy *phy = host->generic_phy;
+	int err;
 
 	/*
 	 * In case ufs_qcom_init() is not yet done, simply ignore.
@@ -1060,10 +1038,22 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 				/* disable device ref_clk */
 				ufs_qcom_dev_ref_clk_ctrl(host, false);
 			}
+			err = phy_power_off(phy);
+			if (err) {
+				dev_err(hba->dev, "%s: phy power off failed, ret=%d\n",
+					__func__, err);
+					return err;
+			}
 		}
 		break;
 	case POST_CHANGE:
 		if (on) {
+			err = phy_power_on(phy);
+			if (err) {
+				dev_err(hba->dev, "%s: phy power on failed, ret = %d\n",
+					__func__, err);
+				return err;
+			}
 			/* enable the device ref clock for HS mode*/
 			if (ufshcd_is_hs_mode(&hba->pwr_info))
 				ufs_qcom_dev_ref_clk_ctrl(host, true);
@@ -1246,9 +1236,10 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 static void ufs_qcom_exit(struct ufs_hba *hba)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct phy *phy = host->generic_phy;
 
 	ufs_qcom_disable_lane_clks(host);
-	phy_power_off(host->generic_phy);
+	phy_power_off(phy);
 	phy_exit(host->generic_phy);
 }
 
-- 
2.48.1


