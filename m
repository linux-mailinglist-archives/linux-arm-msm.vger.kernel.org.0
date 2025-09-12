Return-Path: <linux-arm-msm+bounces-73342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 254F3B54E5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 14:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 604051BC7867
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FA330B511;
	Fri, 12 Sep 2025 12:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iNsCxtD+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C170130AAC9;
	Fri, 12 Sep 2025 12:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757681307; cv=none; b=lBfPtKdWyf4TGrmOsVapc/iO2lWJzHFO2QjLI94lZYjnDjJrvFHg4sRA1y49YRtzHgoIaSokksqDVxilYRwZ580X1bGlOYFTYVE/nZLbVZ248agBTeD6l4i13/Tz/sVbRE9XTtkX15z2nwxS93t3h3oVNoeF8WPGwLYYoeAJ8fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757681307; c=relaxed/simple;
	bh=1/OAOf1Knm+GQqWP2XcBUU0iDLGnGgVhn0wCwTlsKEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=KtbIANmZHJbyJpBSJqBy+oJLugFfAaxz9spAY9fuJrT+kaw+knAaji+ZZL/1gZBqvI4eXDqi7ro4elL/DYN7QlO/8caIxGZSoEnFubPhZUV+oU/atj7lTqoxCpxEhCnmwLsQWhDy4D/E1lLpXkv4Ir37npif/DDI3RgJs5pTlQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iNsCxtD+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fJm1014005;
	Fri, 12 Sep 2025 12:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GqtXLX4RCyzYfLsMrU4yk0EetT6O5w+qHPjCzHo8z9M=; b=iNsCxtD+PNn5SJew
	WIRLAatt0sYCwk/2HneiKix4A3xjTZUvGyg3FRAr2gpuJkFDP0+GzzLVF56X1a2c
	WOMb253nmmb24vlGcxTDFK13UEIYBQj437lm7k4l1GWTedVgJXwCOF3FN40nApt0
	ETYP7sD+SVcIYg3Y0LwRoj6sk0CoHsEyr8jE2lqfsSkzZv5u4Dc4qoRkZnrlSRJ0
	6IkXcT1ryWKOho0A7K0XmY63mF/WFHdB+DS8FtfzpSOI0TnPmeeNW60snSzhcbQk
	pCp6b3+rBEm0IDQONYTLjO0Z08tfs8xefVV4SqsiPXmhpsQ7mKdoSSOK9ipLRrwJ
	7jq4Ng==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493qphwcqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:48:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58CCmLvO031744
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:48:21 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 12 Sep 2025 05:48:19 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Fri, 12 Sep 2025 18:18:08 +0530
Subject: [PATCH v4 4/6] bus: mhi: host: pci_generic: Remove MHI driver and
 ensure graceful device recovery
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250912-uevent_vdev_next-20250911-v4-4-fa2f6ccd301b@quicinc.com>
References: <20250912-uevent_vdev_next-20250911-v4-0-fa2f6ccd301b@quicinc.com>
In-Reply-To: <20250912-uevent_vdev_next-20250911-v4-0-fa2f6ccd301b@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757681290; l=3164;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=lTtKFTczPEu4XHkccAZ6GU/mhBb4jai0rmDJzFOiX5M=;
 b=MeYv66tc6pCUBIbBjtl4H5GDP3K68V/dzoo2OBM6SYylRvomkVxljZBpymv966naBIqLM6uVU
 x2Bu/R0BYO5A7OAd7CA1FVd57+/QuQiHwZDsdU50oPAegR1d4W7Foa2
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=aPDwqa9m c=1 sm=1 tr=0 ts=68c41696 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=WvyZO_AjdMnUHqvMN-4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: mJAb-pnePv7v-okrz5xFK8-z03Wj0Qks
X-Proofpoint-ORIG-GUID: mJAb-pnePv7v-okrz5xFK8-z03Wj0Qks
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA0MCBTYWx0ZWRfX5lca7WUdUJxC
 w9g4cIxn0hYRYtJk9M1goGQ3NUonuGtX6PMfjcR+LX/bAe3aibCX+KXHtOGLvG8AdEZm4HfOLxN
 5dqH/rIPMy2R2kxtgxEk5gsj9xxm4RGbHIfmvfq/Md5AlUjkHxy8nMliqF0aXHLrMz9G2Zdw9tz
 /JNYEhQi/XijtRlrV+v0GuT9yI7j50DKQk5ZSABGkSiN5RKFfeJ+LDihIbtGe5Oi8gU9BUQ7nLs
 AbFjFAJNDMC/HBNimB/0w3tveWp3aevzn/TBkZYWGYLUcbSZEtmRYUqtXLv1RKpEW62SONe5mcU
 fcjN7aPV1P8ews2gnZNu2ASCmgAWgaKmiR8WIOrv6zMa0lRaxPkD50gIKl5OR2LbaTpd3mePPjM
 o9IFk2BJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509110040

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

So, When the MHI driver is removed from the host side, it is essential to
ensure a clean and stable recovery of the device. This commit introduces
the following steps to achieve that:

1. Disable SR-IOV for any SR-IOV-enabled devices on the Physical Function.
2. Perform a SOC_RESET on the PF to fully reset the device.

Disabling SR-IOV ensures all Virtual Functions (VFs) are properly shutdown,
preventing issues during the reset process. The SOC_RESET guarantees that
the PF is restored to a known good state.

If soc_reset is not performed device at driver remove, device will be
stuck in mission mode state and subsequent driver insert/power_up will not
proceed further.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
 drivers/bus/mhi/host/pci_generic.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 6d0bade288265d9fdab8555c089c9153b642454f..4de7e56d4b8819f1b26a34b8a9649327314169dd 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -45,6 +45,7 @@
  * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
  *		   of inband wake support (such as sdx24)
  * @no_m3: M3 not supported
+ * @reset_on_remove: Set true for devices that require SoC during driver removal
  */
 struct mhi_pci_dev_info {
 	const struct mhi_controller_config *config;
@@ -58,6 +59,7 @@ struct mhi_pci_dev_info {
 	unsigned int mru_default;
 	bool sideband_wake;
 	bool no_m3;
+	bool reset_on_remove;
 };
 
 #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
@@ -300,6 +302,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
 	.dma_data_width = 32,
 	.sideband_wake = false,
 	.no_m3 = true,
+	.reset_on_remove = true,
 };
 
 static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
@@ -1027,6 +1030,7 @@ struct mhi_pci_device {
 	struct work_struct recovery_work;
 	struct timer_list health_check_timer;
 	unsigned long status;
+	bool reset_on_remove;
 };
 
 static int mhi_pci_read_reg(struct mhi_controller *mhi_cntrl,
@@ -1332,6 +1336,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->mru = info->mru_default;
 	mhi_cntrl->name = info->name;
 
+	if (pdev->is_physfn)
+		mhi_pdev->reset_on_remove = info->reset_on_remove;
+
 	if (info->edl_trigger)
 		mhi_cntrl->edl_trigger = mhi_pci_generic_edl_trigger;
 
@@ -1404,6 +1411,8 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
+	pci_disable_sriov(pdev);
+
 	if (pdev->is_physfn)
 		timer_delete_sync(&mhi_pdev->health_check_timer);
 	cancel_work_sync(&mhi_pdev->recovery_work);
@@ -1417,6 +1426,9 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	if (pci_pme_capable(pdev, PCI_D3hot))
 		pm_runtime_get_noresume(&pdev->dev);
 
+	if (mhi_pdev->reset_on_remove)
+		mhi_soc_reset(mhi_cntrl);
+
 	mhi_unregister_controller(mhi_cntrl);
 }
 

-- 
2.34.1


