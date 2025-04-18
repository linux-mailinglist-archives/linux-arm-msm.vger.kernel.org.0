Return-Path: <linux-arm-msm+bounces-54732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA349A936B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 13:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 621741B63FA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 11:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B1926FD8F;
	Fri, 18 Apr 2025 11:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Vp+kISfm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E4C212D8A;
	Fri, 18 Apr 2025 11:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744977031; cv=none; b=l+TsewaDCTSX1ZJBJRUjCMhH5DGLXNjeQOL4vCWf3fNI8CzxEiCUxS3ISbq59vFwn4u1JAkn0I6JkU/S4+rVP+Gv8fmDd/lCeJhIr7IPoFbCwvKT2scr1RHDFI8VOaoc9317iWUTCRanigx7Sf+GNd/7dq+zmatk0ajlD1Ko0hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744977031; c=relaxed/simple;
	bh=yPdsexh0RBmoEGSGoqi0jhSZ+wMfPYGmhgJMXRTvWpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=SXzwz4xJTTtGv126w3bYGaVpW2PjLZ5CnbTAWwylBS3UtZQjSbAn1Y4IZNecnbfMBmBVcS3GDeRCIocVftYrNDm7rgCdn4+RzlMKsS/ptHwhdqizqufG9St6U+U3oNOc6kKlPBx7gjAMdpXZl05E+4Pq+AxOTq2h3w+TuoaPmRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Vp+kISfm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2tAu6013274;
	Fri, 18 Apr 2025 11:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U4E12rCwVb3hlnjsHyB8Nx
	tgtGwFnoxCqbeAXkbWhZk=; b=Vp+kISfmpUaTpCqz2MvIKZJZbhRwsAREIgWorg
	IY9upyUbTgnYugCS5r2hST8d0WFBA5jsSbOi35tkD65cNevSqX6+g3vHLTPyRqaI
	hA2HuJ/mS2L25jpkPRBXA6wpVh/VjKvrSCiHaFcqFTZ6iWfYBVEOx4dJqL/e53tX
	Rt9NRkHIG5l7fpnwpXRmMGWV3KzOtBUbpdyQsFelkvkv6XQOsUcqVMpjGOY6RdYn
	0D10pLdwTsjqHFcU9NazUgzkRMUd+SutdKQzHZg6mFnpFLXsLX3I4LP9VrBuR5e+
	ZKL4Ra8MkQZc6165t5r2tOxAsYvwhu59kqPTiEyczYwMn2ew==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvf5kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 11:50:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53IBoRtn026066
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 11:50:27 GMT
Received: from [10.213.96.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Apr
 2025 04:50:25 -0700
From: Vivek Pernamitta <quic_vpernami@quicinc.com>
Date: Fri, 18 Apr 2025 17:20:15 +0530
Subject: [PATCH v2] bus: mhi: host: pci: Disable runtime PM for QDU100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250418-vdev_next-20250411_pm_disable-v2-1-27dd8d433f3b@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAHY8AmgC/42NQQ6CMBBFr0JmbQ0tFKIr7mEIqe0ok0iLLTYY0
 rtbiQdw85P3Fu9vENATBjgXG3iMFMjZDOJQgB6VvSMjkxlEKWRZ85pFg3GwuC7sp/gwT4OhoK4
 PZLIyErnSppYIuTF7vNG69y995pHC4vx7v4v8a/8tR844w1NTNW2bR6vu+SJNVh+1m6BPKX0AP
 otPYMwAAAA=
X-Change-ID: 20250414-vdev_next-20250411_pm_disable-53d5e1acd45e
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744977024; l=2583;
 i=quic_vpernami@quicinc.com; s=20241114; h=from:subject:message-id;
 bh=yPdsexh0RBmoEGSGoqi0jhSZ+wMfPYGmhgJMXRTvWpw=;
 b=UQkIZ57cKdGGer5Q7jHpOiw9vV7If4osrB+Nv5sj5Kex6FyC/oCHvDN7L3FenBH+wEqaDn9aG
 ZUDDR0ixl+rBF/IsG5JZ9c5B1FwXHT9pb9DhgkD1nGjKCnDJO4oJOR2
X-Developer-Key: i=quic_vpernami@quicinc.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tJ2ikZoE9w6gDi1dq8C0zXL1S73RCQEg
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=68023c83 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=BwJktTEAC3VXUIAVO-kA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tJ2ikZoE9w6gDi1dq8C0zXL1S73RCQEg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_03,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180087

The QDU100 device does not support the MHI M3 state, necessitating the
disabling of runtime PM for this device. It is essential to disable
runtime PM if the device does not support Low Power Mode (LPM).

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
Changes in v2:
- Updated device from getting runtime suspended by avoid skipping autosuspend.
- Updated commit message.
- Link to v1: https://lore.kernel.org/r/20250414-vdev_next-20250411_pm_disable-v1-1-e963677636ca@quicinc.com
---
 drivers/bus/mhi/host/pci_generic.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 03aa887952098661a488650053a357f883d1559b..bec1ca17ad69ac89e2ea9142024fef8bded258b6 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -43,6 +43,7 @@
  * @mru_default: default MRU size for MBIM network packets
  * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
  *		   of inband wake support (such as sdx24)
+ * @pm_disable: disables runtime PM (optional)
  */
 struct mhi_pci_dev_info {
 	const struct mhi_controller_config *config;
@@ -54,6 +55,7 @@ struct mhi_pci_dev_info {
 	unsigned int dma_data_width;
 	unsigned int mru_default;
 	bool sideband_wake;
+	bool pm_disable;
 };
 
 #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
@@ -295,6 +297,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
 	.sideband_wake = false,
+	.pm_disable = true,
 };
 
 static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
@@ -1270,8 +1273,11 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* start health check */
 	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 
-	/* Only allow runtime-suspend if PME capable (for wakeup) */
-	if (pci_pme_capable(pdev, PCI_D3hot)) {
+	/**
+	 * Disable Runtime PM if device doesn't support MHI M3 state
+	 * and Allow runtime-suspend if PME capable (for wakeup)
+	 */
+	if (pci_pme_capable(pdev, PCI_D3hot) && !(info->pm_disable)) {
 		pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
 		pm_runtime_use_autosuspend(&pdev->dev);
 		pm_runtime_mark_last_busy(&pdev->dev);

---
base-commit: 01c6df60d5d4ae00cd5c1648818744838bba7763
change-id: 20250414-vdev_next-20250411_pm_disable-53d5e1acd45e

Best regards,
-- 
Vivek Pernamitta <quic_vpernami@quicinc.com>


