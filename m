Return-Path: <linux-arm-msm+bounces-58104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BBAAB8C6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 18:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 252A41BC0231
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 16:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9447822D9F9;
	Thu, 15 May 2025 16:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YOIjngLg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2CE22C32D;
	Thu, 15 May 2025 16:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326480; cv=none; b=bYqolIvSYM0wJzX6TlLp/ayd8uvvq8gJ59W2V79ytdulXgWXwdVjeE2qV8fP6A1yLLGeEfT98mrLkCh3f4iD8PyxhiIr/pi/ilubjrmUubtugqKN5K8tiKm0xPEBfwqtt1na7Vu2j1nwx66nPD0j9JMvRqvsT3IClBZmIbF9sAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326480; c=relaxed/simple;
	bh=aoT2YLO6W/f5w1TjYAvLsRW8HFV8lGdKmI9ipOrUzq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBZ0iY3wnejNduzkKkVsmySV0FHGTL64CrRCwyxONpm0DAOCU6OE5S7bFhWTPA+JMMTZoAZPxUliR7eD8qhxA4g1XbGxd06LMKNTm8byKKujVn459U64pOcRm6deNTIpioWc0KRQhgMfvpLxTVPptwZyk+YW1rwdyvpVjRXbx0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YOIjngLg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFE5m016722;
	Thu, 15 May 2025 16:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Hdcg5qsZDm0
	Bb7cNNlxWWdFvaLQn7XF3mFXHX0KzKh4=; b=YOIjngLgmAZ3Mz3FjYere1WEkeI
	QV/mXgPZmhasDuc29V6K/WhLinHcOUqV8+5Ok/fo/wJGBVg5mz4CHkgRUwr3ofFb
	zYIpMvXpsC5+kJQmcNLjkK1WZDSQKzyMxwYoBUzQdmtGbOPCYmXH396mc4LaYldb
	XrlB8cFjqKycNei04FcEOF8SfF6q0nkhdNcp1f7Emrz6qFrDcDa+laQkfhp0Y0IV
	P1scisjgGjfKgX0vPk//kOBKkQZxDYqk97ZPGZ1FlyX6sey42zJfx+I6cVE7QXLB
	HcLjBuVFKC1H2FHhwDHwXeZEaiUZyuOVdYAHoTBoNiFFiw8RPTNQT749Uyw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmq0jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 16:27:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54FGRT6L023598;
	Thu, 15 May 2025 16:27:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46hyvmvnpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 15 May 2025 16:27:34 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54FGRXgH023658;
	Thu, 15 May 2025 16:27:33 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54FGRXiN023655;
	Thu, 15 May 2025 16:27:33 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 22AA15015B1; Thu, 15 May 2025 21:57:33 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V5 09/11] scsi: ufs: qcom : Refactor phy_power_on/off calls
Date: Thu, 15 May 2025 21:57:20 +0530
Message-ID: <20250515162722.6933-10-quic_nitirawa@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2MiBTYWx0ZWRfX5nxZOBpYAuF8
 JMpi5OPtR6JgOuj4I1KQ0m9KJaMP6CWBZDAqFTBjAqixx9I1PCYnbbv6hRPURNTF7ZwfX7F8B99
 Gg+XIwJHa1IK22cxrJS/qj5uQCnKrFEpJ+5DRMBSVGWz9gRZbFvaC9zvIMlCUN/Gyin+V78t/QE
 RJ8wWqH8eNf5oXjD/iqEjAlLGK9zNddTELzvTkjJVn3fjq3LwmLVVAIR2OdzeeZQNFlK7pAZTey
 zHmLfwUva6PIv2VisoNWXk4VAF4Okj7BYr+EbfkBr587TCfWRT7JHVdErixkmf3Y0VOO2S5EBxG
 M1TA4DtNM3MP0g3bAMJ2sMwEXf/Uky8HKBCWw6hHVrxekH3gstPz5zpuhFnbzQ0GBCEkThB9zyr
 TKeHYnuKbyKDcdzFZCY2Koh9QchD+uHZecI9Aa5Iqb2f7kZ8J/vsYxTOO8wHeUHKUY4bf2Du
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=682615f9 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=ylzO3PbLlNu0Q4qtwUgA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: va8ZlpkUkxKZwIvHRw-ot5mxEwNygFQx
X-Proofpoint-ORIG-GUID: va8ZlpkUkxKZwIvHRw-ot5mxEwNygFQx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150162

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
 drivers/ufs/host/ufs-qcom.c | 61 ++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 32 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 23b4fc84dc8c..3ee4ab90dfba 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -697,26 +697,17 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
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
@@ -724,26 +715,11 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
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
@@ -1133,12 +1109,20 @@ static void ufs_qcom_set_caps(struct ufs_hba *hba)
  * @on: If true, enable clocks else disable them.
  * @status: PRE_CHANGE or POST_CHANGE notify
  *
+ * There are certain clocks which comes from the PHY so it needs
+ * to be managed together along with controller clocks which also
+ * provides a better power saving. Hence keep phy_power_off/on calls
+ * in ufs_qcom_setup_clocks, so that PHY's regulators & clks can be
+ * turned on/off along with UFS's clocks.
+ *
  * Return: 0 on success, non-zero on failure.
  */
 static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 				 enum ufs_notify_change_status status)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct phy *phy = host->generic_phy;
+	int err;
 
 	/*
 	 * In case ufs_qcom_init() is not yet done, simply ignore.
@@ -1157,10 +1141,22 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 				/* disable device ref_clk */
 				ufs_qcom_dev_ref_clk_ctrl(host, false);
 			}
+
+			err = phy_power_off(phy);
+			if (err) {
+				dev_err(hba->dev, "phy power off failed, ret=%d\n", err);
+				return err;
+			}
 		}
 		break;
 	case POST_CHANGE:
 		if (on) {
+			err = phy_power_on(phy);
+			if (err) {
+				dev_err(hba->dev, "phy power on failed, ret = %d\n", err);
+				return err;
+			}
+
 			/* enable the device ref clock for HS mode*/
 			if (ufshcd_is_hs_mode(&hba->pwr_info))
 				ufs_qcom_dev_ref_clk_ctrl(host, true);
@@ -1343,9 +1339,10 @@ static int ufs_qcom_init(struct ufs_hba *hba)
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


