Return-Path: <linux-arm-msm+bounces-70165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 962B1B2F900
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 14:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB8417A4248
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A469322754;
	Thu, 21 Aug 2025 12:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Rgot1ZeM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEB8322539;
	Thu, 21 Aug 2025 12:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780953; cv=none; b=rBkNOMQ6Dr8fg3A8EhJFz0FUom7M73PO2oMk/gap2fRgKhbVHvzpQ2quQ+8D6hubAzkp5iuOkycHrFjyIInfkDAnQS+xJQTPDG6Jfjpr60ffAISACenY04QqXpwHLQxVYZzDweXvJt2CurQisYRSlLQ8sH/yrkqGKeg+cFTgOWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780953; c=relaxed/simple;
	bh=v+/LkWXSz1MPXWgym88nQtLSYkVaM1W4+Ge+uH56yT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LiVS3Y9kbF6ZcM8BYpQbb3wMXPz9PBevIBTTQsd0zSGQ5N+SMDrUkcsg9tPUFiydoBKegqYPFc3UKWEHFiBY4CV7z28padEJJ8mrxmP4hbyxrlPZ7pkcdx9TrGECcmG1VdjjSfjchSS0hzFSoFRsPu8dzBDTgTYOKf0S5ZgFip4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Rgot1ZeM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b6op024138;
	Thu, 21 Aug 2025 12:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dwpqknBUTEUVmc9LlApQVjk5b9jE5I7C0EidHYHz5Oo=; b=Rgot1ZeMGhVA0cwk
	Xg/PXhiQk7aqT1xa5l1J4AzlUYrL4uw5u22WveBznWtC85iola9aKaCMg2Yq3JIW
	J8snmuSz+LgH6N/5EK2dopfoMnXWhyNZsrTgzXPSpG4/I2vReztwERkzHfqrpfr/
	mhAfDODbp3NpnKzJr7/rslcAh9zWQxwV06XHeeGuwISf22a6I+aIfZGn/Pw0q+Wp
	Xb5k8WHHjxq2Yp88zA2mEWKIR3J/UmZG0HzOtKZRYX+OLgsibfAwuByrHUJIN5nq
	DelfcSPjsyX7eOrhOGxmhbF2ykCm8hUs5SSuFHUVqKgs4jBnZD0LAezmdBEgrf5e
	FGnJ2g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52adfsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 12:55:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LCtlTA031778
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 12:55:47 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 05:55:46 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Thu, 21 Aug 2025 18:25:36 +0530
Subject: [PATCH v3 4/6] bus: mhi: host: pci_generic: Remove MHI driver and
 ensure graceful device recovery
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250821-vdev_next-20250821_sriov-v3-4-e1b017c48d4a@quicinc.com>
References: <20250821-vdev_next-20250821_sriov-v3-0-e1b017c48d4a@quicinc.com>
In-Reply-To: <20250821-vdev_next-20250821_sriov-v3-0-e1b017c48d4a@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755780937; l=3667;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=4hJilM3nDcH84LujQplXdeBD0R0JQf5R6XL1tJQYKO4=;
 b=Mfpv1ALGwpZTbYcGACbNt2VkAcKbA2Zb31UY826HYw80O/btQGIrd2loHnS1N0NfwqUcQ200p
 9QVXaZ2fvujAk+X0XRzhZPciBOU9PapRjygZEd0V3tYpOPiWSGZjEMZ
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9CJ_SoXgFvI-Igl2EeD4uZTaJCCzlTiy
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a71754 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=lm7ItqwCKftSpRp_XnIA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9CJ_SoXgFvI-Igl2EeD4uZTaJCCzlTiy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX6GuB76YCjPGP
 UTIQN91pdbxbb2I7jNhi6BzaIkZUi7MQ9l1cqNpLLsYisfTV1cZSEdB3NK2FsFkbOuiHDalarwu
 jYMirtBLnyNJLS4G4jiWyJ34FH6HU33g8A+3CuYCacuyCKKHrQzXAv8jA2dhjAwohtY1BXVyY11
 kTtUourrYMNeHqF9TaVEYzZFwLK7ekUrfrm1M0RIo6h28R7kOTiBdCOe3hDRKy1FoHrBYeO4bEG
 twyB4iyDnT1MRC3/KJOgOjcJVdZI00eQBXpnVWTGBm+Nsl/DoDxDtIswx+5kj5lIHr71iEC3XQW
 2IRzdvFiz0i8dygffoRFU7I0Q+FZxiZe7eUGer4qj9aMmDvF5nI6cKfjg+l50KpQobXG6J9PpfV
 gDDGqU/ZGk6VvuxyUdTLdPSB3aNYFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

So, When the MHI driver is removed from the host side, it is essential to
ensure a clean and stable recovery of the device. This commit introduces
the following steps to achieve that:

1. Disable SR-IOV for any SR-IOV-enabled devices on the Physical Function.
2. Perform a SOC_RESET on the PF to fully reset the device.

Disabling SR-IOV ensures all Virtual Functions (VFs) are properly shutdown,
preventing issues during the reset process. The SOC_RESET guarantees that
the PF is restored to a known good state.

Note:
- The QDU100 platform supports 1 PF and 16 VFs.
- QDU100 does not support Function Level Reset (FLR) due to a hardware
  limitation. As a result, SOC_RESET is used to reset the device.
- On QDU100, any VF failure can cause the entire endpoint (EP)
  to go down, making this recovery mechanism critical.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
 drivers/bus/mhi/host/pci_generic.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 351b177cdf84057fb5a4e2f5b52279d7f1da41c2..f922cca0ab633aeae942587f0c40038342ce9c33 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -45,6 +45,8 @@
  * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
  *		   of inband wake support (such as sdx24)
  * @no_m3: M3 not supported
+ * @reset_on_remove: Set true for devices support SOC reset and perform it
+ *		     while drivee remove
  */
 struct mhi_pci_dev_info {
 	const struct mhi_controller_config *config;
@@ -58,6 +60,7 @@ struct mhi_pci_dev_info {
 	unsigned int mru_default;
 	bool sideband_wake;
 	bool no_m3;
+	bool reset_on_remove;
 };
 
 #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
@@ -300,6 +303,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
 	.dma_data_width = 32,
 	.sideband_wake = false,
 	.no_m3 = true,
+	.reset_on_remove = true,
 };
 
 static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
@@ -1039,6 +1043,7 @@ struct mhi_pci_device {
 	struct work_struct recovery_work;
 	struct timer_list health_check_timer;
 	unsigned long status;
+	bool reset_on_remove;
 };
 
 static int mhi_pci_read_reg(struct mhi_controller *mhi_cntrl,
@@ -1323,7 +1328,6 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	else
 		mhi_cntrl_config = info->config;
 
-	/* Initialize health check monitor only for Physical functions */
 	if (pdev->is_physfn)
 		timer_setup(&mhi_pdev->health_check_timer, health_check, 0);
 
@@ -1343,6 +1347,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->mru = info->mru_default;
 	mhi_cntrl->name = info->name;
 
+	if (pdev->is_physfn)
+		mhi_pdev->reset_on_remove = info->reset_on_remove;
+
 	if (info->edl_trigger)
 		mhi_cntrl->edl_trigger = mhi_pci_generic_edl_trigger;
 
@@ -1415,6 +1422,8 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
+	pci_disable_sriov(pdev);
+
 	if (pdev->is_physfn)
 		timer_delete_sync(&mhi_pdev->health_check_timer);
 	cancel_work_sync(&mhi_pdev->recovery_work);
@@ -1428,6 +1437,9 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	if (pci_pme_capable(pdev, PCI_D3hot))
 		pm_runtime_get_noresume(&pdev->dev);
 
+	if (mhi_pdev->reset_on_remove)
+		mhi_soc_reset(mhi_cntrl);
+
 	mhi_unregister_controller(mhi_cntrl);
 }
 

-- 
2.34.1


