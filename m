Return-Path: <linux-arm-msm+bounces-70163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 055B2B2F935
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 15:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44DF03BD87C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2CE93218A2;
	Thu, 21 Aug 2025 12:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lE0UjFrj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2601E31E0F8;
	Thu, 21 Aug 2025 12:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780949; cv=none; b=qP4gIubCweb59TyKzSPL5+5j4mkK0ETnahZ2tCZaIJenOaoHnpqAIsbaheFOSzBUhBV+bIMKwX3b0vqpL/0ydRkOKMm+IQ2iZYsnl9RLPGPMMFiXMkQGIwkwrk/EWdrF60y51znW7ZvF7596LuQOD65Hrzya2gyjcoeU97oU5+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780949; c=relaxed/simple;
	bh=BNygVsZdaBvmoXSbN+JS4KOD+xB61L5UyD5bC6FXSnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZsjjjAkVFB9/ZzMnVwucmzMy2nRe7hcwD3xiTXCxp/NA9bBwP4QKGUmsBiE499jyVfAp3IHOMh+s2PZSGx0Vzj4a12K+tDxKrEeAFoIKH78d+DNfYSGG3N1m+ZEIiC0P8pfadMGRdnDrWo1bpdy3HJQu5Yj9FolvGkcTeryYOqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lE0UjFrj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bE1h013043;
	Thu, 21 Aug 2025 12:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JT5FiHKoUvFRjhJLCvdVtyMmTnaKDk8NZoUzMJ7YYb8=; b=lE0UjFrjAzID+37C
	cI9TF3eL2oiS9o46IEDLIPwqWzZyLDT4VKuf82c/kJXbCYyAKGMNuI5aNxk3g9cI
	IkaRSS0BUlz9DB2xXC3/KVqZAjeAFmpO+EZIAYKy0RyQcaibdSBnwPOc3KSPs2Z6
	HN59nepbSXauqIYcvIr5Kim1KIp/BW++Y0gHtMWife9za2d0eBIwwU/LskmECaSt
	TA8vlLXlDQVAKcp/iskCD21vDOJe2EYTLaW+xnBeTQXDCLgEGeiorPegvHPhkuMz
	WhaUp0v5umUgi3EM00Ir9lP7UGhYOxrjP5Rmenf3emodM5eldMIIQZUWrW+4M6Gu
	GmOpRg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dnbsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 12:55:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LCthIS031752
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 12:55:43 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 05:55:41 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Thu, 21 Aug 2025 18:25:34 +0530
Subject: [PATCH v3 2/6] bus: mhi: host: pci_generic: Read
 SUBSYSTEM_VENDOR_ID for VF's to check status
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250821-vdev_next-20250821_sriov-v3-2-e1b017c48d4a@quicinc.com>
References: <20250821-vdev_next-20250821_sriov-v3-0-e1b017c48d4a@quicinc.com>
In-Reply-To: <20250821-vdev_next-20250821_sriov-v3-0-e1b017c48d4a@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755780937; l=5077;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=U5MV4au7n6e8nBeBB4ZNKzNxLXGGo7sDuffhhT4m+zA=;
 b=sJ9cf4QoUxJLWJ7RPXEoyPr4wi2Kh+EMKBvxLU1GM62A4c+wuFaZyzGx9Pk//gvJqilhPfIeP
 cnidmE/r4V2BLg4qvgC91PN0QZ9K9XwFJTsY5H+eR2L1p8IqgAbBSRs
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX9OxeYtI1+3NH
 J/nlikNfKABKxr/NB5w7kegAI5lmU0yFsdBcvdYZ7wIe5VR09JkjO4VAQCFhyN4nqN7JbcwxP2u
 B8Fsfx/UUX68Su/nbP87rXS66YBYcH65hiqka4scpoofQQMhwhszz9btoEWd/ii3ElpY5qf3GL3
 vOTXi4E4DXIUBkkBwrFlquJwLpQk7L3rVfPJRJPa5o0jF8LQZNyZtHYRtwYIj5CxmhlFHByZ8fv
 X6PiU+pEs4PIqTOYamfPrOXIrlja4pV+kSv0C7IpfZiOH2Hr2O40iAel/dorbQJJF//tI43ABoK
 UwBqWIkUJr0pd0RazBsQ3cgiVvtNKgspRKOwjE4U3OXBhXJHd35lXO1Eb+kTpcpEGdPeS4Zl/Ej
 FCGpaKMq8EQHEkzU30yx5616C2EtFw==
X-Proofpoint-ORIG-GUID: H_qetLDPmbB9TwdPSX4R1qCmFLqyZdxq
X-Proofpoint-GUID: H_qetLDPmbB9TwdPSX4R1qCmFLqyZdxq
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a71750 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=oNnMW-VMgOF42iEfvAIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

- In SR-IOV enabled devices, the VF DEVICE/VENDOR ID register returns
  FFFFh when read (as per PCIe SR-IOV spec section 3.4.1.1).
- To determine device activity, read the PCIe VENDOR_ID of the Physical
  Function (PF) instead.
- Disabled health check monitoring for Virtual Functions (VFs), as they
  are not physical functions and lack direct hardware control.
- This avoids unnecessary CPU cycles consumed by VF health checks, which
  are unintended and non-functional.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 2967ed4cec29d1c1eeb581ed44cf9afcea90f533..df18627a9feb4f2d53ba1ca6a4e8087dc23c7873 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1094,8 +1094,7 @@ static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
 	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
 	u16 vendor = 0;
 
-	if (pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor))
-		return false;
+	pci_read_config_word(pci_physfn(pdev), PCI_VENDOR_ID, &vendor);
 
 	if (vendor == (u16) ~0 || vendor == 0)
 		return false;
@@ -1205,7 +1204,9 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 
 	dev_warn(&pdev->dev, "device recovery started\n");
 
-	timer_delete(&mhi_pdev->health_check_timer);
+	if (pdev->is_physfn)
+		timer_delete(&mhi_pdev->health_check_timer);
+
 	pm_runtime_forbid(&pdev->dev);
 
 	/* Clean up MHI state */
@@ -1232,7 +1233,10 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 	dev_dbg(&pdev->dev, "Recovery completed\n");
 
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
-	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+
+	if (pdev->is_physfn)
+		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+
 	return;
 
 err_unprepare:
@@ -1319,7 +1323,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	else
 		mhi_cntrl_config = info->config;
 
-	timer_setup(&mhi_pdev->health_check_timer, health_check, 0);
+	/* Initialize health check monitor only for Physical functions */
+	if (pdev->is_physfn)
+		timer_setup(&mhi_pdev->health_check_timer, health_check, 0);
 
 	mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
@@ -1383,7 +1389,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
 
 	/* start health check */
-	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+	if (pdev->is_physfn)
+		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 
 	/* Allow runtime suspend only if both PME from D3Hot and M3 are supported */
 	if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
@@ -1408,7 +1415,8 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
-	timer_delete_sync(&mhi_pdev->health_check_timer);
+	if (pdev->is_physfn)
+		timer_delete_sync(&mhi_pdev->health_check_timer);
 	cancel_work_sync(&mhi_pdev->recovery_work);
 
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
@@ -1436,7 +1444,8 @@ static void mhi_pci_reset_prepare(struct pci_dev *pdev)
 
 	dev_info(&pdev->dev, "reset\n");
 
-	timer_delete(&mhi_pdev->health_check_timer);
+	if (pdev->is_physfn)
+		timer_delete(&mhi_pdev->health_check_timer);
 
 	/* Clean up MHI state */
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
@@ -1481,7 +1490,8 @@ static void mhi_pci_reset_done(struct pci_dev *pdev)
 	}
 
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
-	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+	if (pdev->is_physfn)
+		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 }
 
 static pci_ers_result_t mhi_pci_error_detected(struct pci_dev *pdev,
@@ -1546,7 +1556,9 @@ static int  __maybe_unused mhi_pci_runtime_suspend(struct device *dev)
 	if (test_and_set_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status))
 		return 0;
 
-	timer_delete(&mhi_pdev->health_check_timer);
+	if (pdev->is_physfn)
+		timer_delete(&mhi_pdev->health_check_timer);
+
 	cancel_work_sync(&mhi_pdev->recovery_work);
 
 	if (!test_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status) ||
@@ -1597,7 +1609,8 @@ static int __maybe_unused mhi_pci_runtime_resume(struct device *dev)
 	}
 
 	/* Resume health check */
-	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
+	if (pdev->is_physfn)
+		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 
 	/* It can be a remote wakeup (no mhi runtime_get), update access time */
 	pm_runtime_mark_last_busy(dev);

-- 
2.34.1


