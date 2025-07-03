Return-Path: <linux-arm-msm+bounces-63548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5FFAF7AA7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 17:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5885A3A89E4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 15:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D252F1987;
	Thu,  3 Jul 2025 15:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C/cA+99T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF1C2EF67A;
	Thu,  3 Jul 2025 15:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555407; cv=none; b=VejKGb0kvWVyRSCxiDahUG8qu9eIsIzm7yQr+58BWPZIp2aaSBO2lqXDA6XhzWA8wsUkbC/hOGL6IQ+cmevWAHKMAXBFXLNdeJ+Yf3IbGU6ecGRHnG8eTF9ZKCsYdQwfnM8cl81w5z8P/9UopwNu5FTElKs2g9+P4m9hsx44fUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555407; c=relaxed/simple;
	bh=v7aFdXo2qMEeUqpViYpuWuKJQcjyXEsgTf/KSXNKUh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=k9Of1GJubZVb/Y8Uo5/WjgDPbeEb2+ZInCXJSYpAyuXgrqHxAwErSXCIXvxr7Gt2D9xke3ORqCpWalnwY5VVOm119CQWN3+VAzdf8+7XVvfQInNCknTpmQfmwMidz9baKawJusCofZ7k4ypTOnxvWIBykPOW1ydqCCWsnYDs1tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C/cA+99T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563CUqho020690;
	Thu, 3 Jul 2025 15:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2CptndvT1PP45JcJ9UfrUuwh82XAjUmQeFNWYcb0hBg=; b=C/cA+99TFyhbVC1d
	2AUlB0t5Sb4UC/a3SORFcf6b+PyPYaGo4c/rknPZ0h53Hk/yxS6CZRGDsASgGvHR
	T/A92vdjXmkYdL2s8vwKkhmohS9CzkVPgFDROnE7XQvYoF+4OujzBgFSbOSPFAel
	L2hVUD7hZM2un/FlZrFh50+nmRMfNpM0H/6R4SRNV7h6RiQ90oqbPVXjpTb5pjM4
	6fsO0CusK6FsyiS3xqeICxLsRaaOA8m82aTnFLVJA4FnUvML6/uzYq19AfN7U/mr
	+ATkSQ2MbOftdhILQePDPs0F8bcoWjMLK1tYp6dXApeJl7Z3q9wo5/D3iZ7SBsAz
	+0YHUg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn7jvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 15:09:57 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563F9u1b018203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 15:09:56 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 08:09:55 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Thu, 3 Jul 2025 20:39:43 +0530
Subject: [PATCH 4/5] bus: mhi: host: pci_generic: Remove MHI driver and
 ensure graceful device recovery
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250703-sriov_vdev_next-20250630-v1-4-87071d1047e3@quicinc.com>
References: <20250703-sriov_vdev_next-20250630-v1-0-87071d1047e3@quicinc.com>
In-Reply-To: <20250703-sriov_vdev_next-20250630-v1-0-87071d1047e3@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751555387; l=3942;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=qIok+X3vKyk2p9PbkpB2Wk57AXDB+WjZx3HGCE7IHBw=;
 b=mjo2LVrt2qKCLgiftCV/VEJKJB7xucsjioQMEbILCb+OB2AbtWRSENcLTcxSqD26/tEDYjPk3
 te4qIPNzC8jCgTzhGZ/kSdJG7hoEm7KYUV4+R/y89/p08DJQUumpYMU
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEyNyBTYWx0ZWRfX1vtSWKHJQUco
 hdJWkzBb4jCRRlzLcqfLn2fqORMbfb0+FEnye1CAvgb/L/r+oee20PYYktYJyBTcTrh8whyhyv4
 WCCHw8SRHGa8jAZpqsA1v/3ONdIl3i97Xj+qQ8eRSzkrn//ZaIfZcTgR5ZW0lAmVI4kgwBPRRUY
 pjJH3vbvyk8BxIelJ0PcZfP9UNj1cfZGS+336FAl0QwgyPl5rY+ZvwrprKwOEHkShvlMvF8k8A7
 r/o5W7JMvBATujWa4FJOvfFZi8FY6wjVnS22cqWL0OHjEQ6faPv9QyHE6sTPp4WgXxlZDhsRbPL
 FQ/QwMde8yB/l0pDZ/gOvzRoFaUdnxq1NdVj3QdYH0ppffvzhlTHD5qsdTWgfo/vWDHnZ2FG4Ut
 RjbWZu4wSYoZKir3SghFtNN+loJLfq88fPf/UGrn47sRA7gw6fSDfitFvcxgUTa3FYa+ZwuD
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=68669d46 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=f0iwCl2806sLzPXnTMgA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: L5mvjdyEbWy9sYMQXeqxbaYDETYm1ydq
X-Proofpoint-GUID: L5mvjdyEbWy9sYMQXeqxbaYDETYm1ydq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030127

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

When the MHI driver is removed from the host side, it is crucial to ensure
graceful recovery of the device. To achieve this, the host driver will
perform the following steps:

1. Disable SRIOV for any SRIOV-enabled devices on the Physical Function.
2. Perform a SOC_RESET on Physical Function (PF).

Disabling SRIOV ensures that all virtual functions are properly shut down,
preventing any potential issues during the reset process. Performing
SOC_RESET on each physical function guarantees that the device is fully
reset and ready for subsequent operations.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
 drivers/bus/mhi/host/pci_generic.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 938f37d306a18b9a47f302df85697f837c225f0d..ff9263d5dc4b54956c6ca4403e7b0b2429d0700e 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -45,6 +45,8 @@
  * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
  *		   of inband wake support (such as sdx24)
  * @no_m3: M3 not supported
+ * @bool reset_on_driver_unbind: Set true for devices support SOC reset and
+ *				 perform it when unbinding driver
  */
 struct mhi_pci_dev_info {
 	const struct mhi_controller_config *config;
@@ -58,6 +60,7 @@ struct mhi_pci_dev_info {
 	unsigned int mru_default;
 	bool sideband_wake;
 	bool no_m3;
+	bool reset_on_driver_unbind;
 };
 
 #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
@@ -300,6 +303,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
 	.dma_data_width = 32,
 	.sideband_wake = false,
 	.no_m3 = true,
+	.reset_on_driver_unbind = true,
 };
 
 static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
@@ -970,6 +974,7 @@ struct mhi_pci_device {
 	struct work_struct recovery_work;
 	struct timer_list health_check_timer;
 	unsigned long status;
+	bool reset_on_driver_unbind;
 };
 
 static int mhi_pci_read_reg(struct mhi_controller *mhi_cntrl,
@@ -1270,6 +1275,11 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->mru = info->mru_default;
 	mhi_cntrl->name = info->name;
 
+	/* Assign reset functionalities only for PF */
+	if (pdev->is_physfn)
+		mhi_pdev->reset_on_driver_unbind = info->reset_on_driver_unbind;
+
+
 	if (info->edl_trigger)
 		mhi_cntrl->edl_trigger = mhi_pci_generic_edl_trigger;
 
@@ -1336,7 +1346,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	return err;
 }
 
-static void mhi_pci_remove(struct pci_dev *pdev)
+static void mhi_pci_resource_deinit(struct pci_dev *pdev)
 {
 	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
@@ -1352,13 +1362,32 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	/* balancing probe put_noidle */
 	if (pci_pme_capable(pdev, PCI_D3hot))
 		pm_runtime_get_noresume(&pdev->dev);
+}
 
+static void mhi_pci_remove(struct pci_dev *pdev)
+{
+	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
+	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
+
+	/* Disable SRIOV */
+	pci_disable_sriov(pdev);
+	mhi_pci_resource_deinit(pdev);
+	if (mhi_pdev->reset_on_driver_unbind) {
+		dev_info(&pdev->dev, "perform SOC reset\n");
+		mhi_soc_reset(mhi_cntrl);
+	}
+
+	/* Perform FLR if supported*/
 	mhi_unregister_controller(mhi_cntrl);
 }
 
 static void mhi_pci_shutdown(struct pci_dev *pdev)
 {
-	mhi_pci_remove(pdev);
+	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
+	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
+
+	mhi_pci_resource_deinit(pdev);
+	mhi_unregister_controller(mhi_cntrl);
 	pci_set_power_state(pdev, PCI_D3hot);
 }
 

-- 
2.34.1


