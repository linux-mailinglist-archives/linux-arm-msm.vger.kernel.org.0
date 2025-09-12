Return-Path: <linux-arm-msm+bounces-73340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DE0B54E5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 14:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F3BA18969CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34811309DC0;
	Fri, 12 Sep 2025 12:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RPBOzsYU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714C93081D6;
	Fri, 12 Sep 2025 12:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757681303; cv=none; b=liVbQjN3rkZqcJhp/eBvb8jK4zW0SR2ow1MD32XwP4judbR4rpZwjs79os9+hcTczG5SmY+JP1pRj3GL3Toje39vTdhiMSjIi4x7wVeX5LDpnO4NHKK8B814tJ5CzsgU7ysJq2l4AFPuBgYwCMwYjxEuaBVtviFFynmnYt/bTWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757681303; c=relaxed/simple;
	bh=QOq3V9j4sMR9Cf3J9bhf8IOAukpm08eA++Tt7jLk2CA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gcU3IvISKHP7I4/Lwym5UunnFgxpa/pLWlO2LZhJgLlfJa/pYsjUVDkqkqnO6N7TVh0NgtFTbtJ0qc2UkMfhFxJNbF2PiyolFtpaGOLna8BPKZAuhI012dRVrJ2EhFZygITpuQ5Xcxrpp+iIxL6T+kDiy1VHG/HffM5p4trBjSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RPBOzsYU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CBBRwL017563;
	Fri, 12 Sep 2025 12:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LoeuIrkc+NE1IP6WAWmWrj0anbU9PNQRxeI3pV5ASq0=; b=RPBOzsYUUOAdfR6c
	6OBsmeB7fUH9QAEHyeM9eM3JarrQaBm/TXa4pCpg6/xGNauWOgbFG6fFobA+semc
	ROzp16Px8mtDettHsBCCW1Vhg240mUKNB8LlhkoGQEH8BJ9p0Z3nKjdh4BRoelMB
	7UYVrXyq0hZpfGAtzU7hwE6gPXy4WUssxmwvxFPIEs5h5DGco3hUr0+II22TG0BI
	hbBjaBM7vmKxmZY2ijamyY+qKye4PVFzXK73NuSrHbXd+lDa+Ii5NQDVqJJlEK6b
	ugpyYy10vQMTVM1mXDcTT57vKzrihSNtYhRFr2ZPd1lzpQHlwA3xpOPdJKy+Yvf/
	B3THKQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494jdx07yn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:48:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58CCmHcM031281
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:48:17 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 12 Sep 2025 05:48:15 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Fri, 12 Sep 2025 18:18:06 +0530
Subject: [PATCH v4 2/6] bus: mhi: host: pci_generic: Read
 SUBSYSTEM_VENDOR_ID for VF's to check status
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250912-uevent_vdev_next-20250911-v4-2-fa2f6ccd301b@quicinc.com>
References: <20250912-uevent_vdev_next-20250911-v4-0-fa2f6ccd301b@quicinc.com>
In-Reply-To: <20250912-uevent_vdev_next-20250911-v4-0-fa2f6ccd301b@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757681290; l=5108;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=AXyLfptTmmjYsJdMdKeFlbwmyFM1pw9zTX08UUH6tdo=;
 b=8DFT0Ez/agXCgi5pNjOMG8i9FhWz98qknTULvLYLIEfqJ7i2jRoEvpiWx9z1hhvipj+TYCkUk
 oG8IP9DWDDTDRea5Tby2RXuSwyQ1rn3/ise/1PCDCoz4+6Bm663S7vA
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDEwNiBTYWx0ZWRfX4+3/WsvkKplX
 LUYCYgw7+sudp9KhE1PaNKIZ4k97o3Gt3WhcPXhnX5wstNgPH1kngGcfR4uxufEFRX06133Yj8p
 s1vVb9zr76M+xSBnxvGQFy3au22uFpRqD4TTB/wCOeCB8+ZPXxS3o376Fec0OEvmku2zN0cLQcN
 LTKOqe/jW09mAOML38iLK2sNRw0aIsJ8FYyww1L4/+SRpsg+x1Hpw74KDXRn4ZZMKvBrvYICEDB
 ZZ1oKLMU7QRZIbxpMKEOIqB0dNqjhqKUhhWcOZZezu0bgsnQQ3VJb7fPXQ1tOUeypMsdK6lRx93
 wevfSAxdz4lpcJgGjO/xo8KuV0C0xjg0skNpxZXuWyLyBlkvreA0x0vjvOcko02Soc15MOeAFQY
 xv5EsPYU
X-Proofpoint-GUID: hBhTQYaB_0ivQPp7l2brl6z1zX9MuxCE
X-Authority-Analysis: v=2.4 cv=JMM7s9Kb c=1 sm=1 tr=0 ts=68c41692 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=xHIV5HlekO6mxpULEJIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: hBhTQYaB_0ivQPp7l2brl6z1zX9MuxCE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509120106

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

In SR-IOV enabled devices, reading the VF DEVICE/VENDOR ID register
returns `FFFFh`, as specified in section 3.4.1.1 of the PCIe SR-IOV spec.
To accurately determine device activity, read the PCIe VENDOR_ID of
the Physical Function (PF) instead.
Health check monitoring for Virtual Functions (VFs) has been disabled,
since VFs are not physical functions and lack direct hardware control.
This change prevents unnecessary CPU cycles from being consumed by VF
health checks, which are both unintended and non-functional.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 8a605cb3b8e1e54ef4e699700f3f2660ad5cb093..6fa16975e320212a50e0b68ddb34db5ce711589c 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1082,7 +1082,7 @@ static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
 	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
 	u16 vendor = 0;
 
-	if (pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor))
+	if (pci_read_config_word(pci_physfn(pdev), PCI_VENDOR_ID, &vendor))
 		return false;
 
 	if (vendor == (u16) ~0 || vendor == 0)
@@ -1193,7 +1193,9 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 
 	dev_warn(&pdev->dev, "device recovery started\n");
 
-	timer_delete(&mhi_pdev->health_check_timer);
+	if (pdev->is_physfn)
+		timer_delete(&mhi_pdev->health_check_timer);
+
 	pm_runtime_forbid(&pdev->dev);
 
 	/* Clean up MHI state */
@@ -1220,7 +1222,10 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 	dev_dbg(&pdev->dev, "Recovery completed\n");
 
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
-	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+
+	if (pdev->is_physfn)
+		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+
 	return;
 
 err_unprepare:
@@ -1307,7 +1312,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	else
 		mhi_cntrl_config = info->config;
 
-	timer_setup(&mhi_pdev->health_check_timer, health_check, 0);
+	/* Initialize health check monitor only for Physical functions */
+	if (pdev->is_physfn)
+		timer_setup(&mhi_pdev->health_check_timer, health_check, 0);
 
 	mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
@@ -1371,7 +1378,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
 
 	/* start health check */
-	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+	if (pdev->is_physfn)
+		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 
 	/* Allow runtime suspend only if both PME from D3Hot and M3 are supported */
 	if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
@@ -1396,7 +1404,8 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
-	timer_delete_sync(&mhi_pdev->health_check_timer);
+	if (pdev->is_physfn)
+		timer_delete_sync(&mhi_pdev->health_check_timer);
 	cancel_work_sync(&mhi_pdev->recovery_work);
 
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
@@ -1424,7 +1433,8 @@ static void mhi_pci_reset_prepare(struct pci_dev *pdev)
 
 	dev_info(&pdev->dev, "reset\n");
 
-	timer_delete(&mhi_pdev->health_check_timer);
+	if (pdev->is_physfn)
+		timer_delete(&mhi_pdev->health_check_timer);
 
 	/* Clean up MHI state */
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
@@ -1469,7 +1479,8 @@ static void mhi_pci_reset_done(struct pci_dev *pdev)
 	}
 
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
-	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+	if (pdev->is_physfn)
+		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 }
 
 static pci_ers_result_t mhi_pci_error_detected(struct pci_dev *pdev,
@@ -1534,7 +1545,9 @@ static int  __maybe_unused mhi_pci_runtime_suspend(struct device *dev)
 	if (test_and_set_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status))
 		return 0;
 
-	timer_delete(&mhi_pdev->health_check_timer);
+	if (pdev->is_physfn)
+		timer_delete(&mhi_pdev->health_check_timer);
+
 	cancel_work_sync(&mhi_pdev->recovery_work);
 
 	if (!test_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status) ||
@@ -1585,7 +1598,8 @@ static int __maybe_unused mhi_pci_runtime_resume(struct device *dev)
 	}
 
 	/* Resume health check */
-	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+	if (pdev->is_physfn)
+		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 
 	/* It can be a remote wakeup (no mhi runtime_get), update access time */
 	pm_runtime_mark_last_busy(dev);

-- 
2.34.1


