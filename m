Return-Path: <linux-arm-msm+bounces-64317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 42291AFFD67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 11:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1734A7BB565
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 09:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6F52D1F72;
	Thu, 10 Jul 2025 08:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YFjhPYlj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B7E2D12E7;
	Thu, 10 Jul 2025 08:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752137950; cv=none; b=EKboq+xifj78HMhqpaYiidYXvQuCpVAgjGKHyugeNthr4y5y+K8fl+BOSP5zVf1cuWO/7Kdn9GXYIaNhti5JTfXewpZN1MynHpgyfNiIuL03Jk6tX/ciKXo2VLCoIl90bdLLOTWoPQ00IRx/hi6srM5/CRmTHC9hT5X7K7bBM1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752137950; c=relaxed/simple;
	bh=SrM4VUjfSCs0bTi9+yIZ+9Fa3W1UqZz9fjuf81+unNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tuFq8ApArNNrA9bDwOUP3RqKS/MpVkDjwct6xRqQPICZpcmQ+R2GIGbCbFMh67dUOBBnbX4GLXNfzMhBdpms6DHNLyjqRCkCguK8UxEFc9O3yzt+xVlyzyXTmBOSbTMhuGNSb7uTq+zSZsiGcs+qNbbrvWg4YXxMgOFZ7+jnEPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YFjhPYlj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A0nQvI014506;
	Thu, 10 Jul 2025 08:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tup7uEvL0EaxjbGn3XFybR0wyRXNhRezSnLWn4t0d1E=; b=YFjhPYljkGSlwcAe
	EWcdg6xdpWj7OYLuGJLPoo6zbrPCfC5Dr4roIV10F8vZJuvkBC+lCxeg7eCKYlZn
	iLquXnO2OCxh6E35jLsqtDWK/twspzZbtSC9hmJZw2Wfx4XemYz/bq0nN+uSEICJ
	y8ApuJosAjGy46g31/rYUqzbvxRv211rQOo0gEY13pSNFST/wkfHyDPq7GBXP8ne
	WRJHAz0Az/7C8iK5pr6Bpv9ynmocCWNHKPQVNp+RG8nHhUqrplY+jM8AiPaS60Px
	RlmwQCg5ljwK4ofyWpMMyoaI6rVfCaR4WJfww0H53K97OESpMy2sCRvL/mKy1xI1
	12vlOA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b156eh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 08:59:06 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56A8x5N5009818
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 08:59:05 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Jul 2025 01:59:04 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Thu, 10 Jul 2025 14:28:34 +0530
Subject: [PATCH v2 3/5] bus: mhi: host: pci_generic: Remove MHI driver and
 ensure graceful device recovery
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250710-sriov_vdev_next-20250630-v2-3-4bd862b822e8@quicinc.com>
References: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
In-Reply-To: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752137937; l=3564;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=tdntDu4ioySgUT+p1YvqTwrQIPtSZDUvQFR4ZmOqeAU=;
 b=PssnBEoh2bJ0ZHGhxk3fGBN61/MEYyQ6vpX5+n/Q4hsPIBkf4kRFOXboTV38Y/NTUY9a8A6fw
 gZmChQeadGiC+akCo0/g9htZNd+4zkwlJiGGRXRN6AMQoTPfTmklC0K
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686f80da cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=f0iwCl2806sLzPXnTMgA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3NiBTYWx0ZWRfX8uxwe+J1UmFa
 cPoCTkXjOGKqfQ8VbJD+eDi76idjykHokd5VdrPPNEvtZpNq0LxemsuE1U/zZKgZG1lv0jlXjta
 xSzf988rs0KSVDmI72zaxXEhgBMAev4GOSMyyFBXKxQzjb2IBiMnK+m8CLKFUtnQCbN2/3CIxJr
 nfJMvjB1x/BPS3hlE+NUST/YM/tSFf0xC4m+jLqkayeut3bcNqhdlhnqPZubJMBhditi9HmuCtK
 JB/UR7W9eKo02dRUjXvlslw7FfdOgYmb+cmLYFOzC0TIfz7xoqhtZLkguIfFZ3rZnTFGgzEsljj
 QXT/KjPYQYS+mZKEDGtVpBsXKTuoD7grooTFwNDDDwax/FR+skfYqM0LXZ0ev8rtk9PziElQtkA
 aNslUdkARoXZJuuJETYCa3sSGIwpYR2RvIYSFab7LllATPF6KQ3jvciR/w4foJG5icX0V2jZ
X-Proofpoint-GUID: 0EzzaouVzZ9qoPxIqHse29ybF3Of_b-N
X-Proofpoint-ORIG-GUID: 0EzzaouVzZ9qoPxIqHse29ybF3Of_b-N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100076

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
 drivers/bus/mhi/host/pci_generic.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 4bafe93b56c54e2b091786e7fcd68a36c8247b8e..2d1381006293412fbc593316e5c7f0f59ac74da8 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -45,6 +45,8 @@
  * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
  *		   of inband wake support (such as sdx24)
  * @no_m3: M3 not supported
+ * @reset_on_driver_unbind: Set true for devices support SOC reset and
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
@@ -1352,6 +1362,20 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	/* balancing probe put_noidle */
 	if (pci_pme_capable(pdev, PCI_D3hot))
 		pm_runtime_get_noresume(&pdev->dev);
+}
+
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
 
 	mhi_unregister_controller(mhi_cntrl);
 }

-- 
2.34.1


