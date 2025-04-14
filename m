Return-Path: <linux-arm-msm+bounces-54163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 110FFA8795A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 09:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C0A11885A0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 07:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1459B1A9B28;
	Mon, 14 Apr 2025 07:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UItp4RW0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DB22628C;
	Mon, 14 Apr 2025 07:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616882; cv=none; b=G9oQfsUrw/VJ6C/t/mN8mvAvEMHdHcRlhZbUaxXFXDMaIs0yXctuR1XILyCXhqB5s6UaSrDGivVk+zIpy15piMfU86yJF74Ixxd8hwhRa1H/K2DrtLLZoTHh6NVF3jxPLV5CCe2GiS/2rvEoFIql2hBZQ3IxfYMdmhE7lZJ9Eec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616882; c=relaxed/simple;
	bh=63bZC/UOojIFZL/ZiazbPdnBHrTeP2s5s7dmTygc9nU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Cl2tv9NLAAFzXMUaVs91oBLFvTsTKjlL5jq+sYT/R0UgFEs8RRkAZ9+dTtsA6tH/aNBh5WMlGpZU8d1hyRZFDdkDLJaJe/HpfY3QnIn5FGPHFGGxwgdRMGuGe4EwmvzgM54/cYA4R/GswHQmKB2DJ2wrSad4BqTMbriLLmpvfgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UItp4RW0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E0BAXk025634;
	Mon, 14 Apr 2025 07:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eOODX3xwOi3xIRHGHvUmcR
	nRv7LJ5oFhJxA/OvjoVMY=; b=UItp4RW0Rc3ZhTDk+6elPVfxGXSGIdKDUlO7+y
	D5QZTfF3h1iVUP5dBqp1XJwXt1GU5rhLQEbgqn4rwQpstQMvrirKcBkKEHbyVPFs
	/VrGWW1GtSbI1gtOBy+pu1b11U1c2l56ZcfxUbLZAvpKxt9Aymnh024jzuXH7z1B
	0w9aitGCyehzlKaiZc9ORw4MpJyaw4PgZir/TxPt577XPAIUXxiHvOJWGRUVhIdA
	Gt7HpSkYgyVg5jiTxDmv5lxfmOjELpk8NK5TMHP+UGRWwbBi9ziSImqbUOii8yxl
	9hjamFQhi28Z3x8bsw9Av9gG8yFroRpLEBsHdWSNgd/r0dvA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs13s3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 07:47:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53E7lvYv032372
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 07:47:57 GMT
Received: from [10.213.96.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Apr
 2025 00:47:55 -0700
From: Vivek Pernamitta <quic_vpernami@quicinc.com>
Date: Mon, 14 Apr 2025 13:17:44 +0530
Subject: [PATCH] bus: mhi: host: pci: Disable runtime PM for QDU100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250414-vdev_next-20250411_pm_disable-v1-1-e963677636ca@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJ+9/GcC/y3MwQqEIBRG4VeJu07I0s28SoRY968uTBYaEkTvP
 jK0/M7i3JQQBYk+1U0RWZLsoUDXFU2rDwuUcDG1TWsbo43KjOwCrlO9SbtjcyzJj18o27GF9hM
 bCyqPI2KW6//vh+f5AbvFBCRvAAAA
X-Change-ID: 20250414-vdev_next-20250411_pm_disable-53d5e1acd45e
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744616875; l=2311;
 i=quic_vpernami@quicinc.com; s=20241114; h=from:subject:message-id;
 bh=63bZC/UOojIFZL/ZiazbPdnBHrTeP2s5s7dmTygc9nU=;
 b=zdvcOQUrgOOW/4hGO4RfjUqn/okbJhDE3vcaVnDBd2pLDCSTJqYE3oYw24ziIJNcBd91H7lPI
 JIYRZ4B14N2CEHWViK1wfbLY3tZGyo4wnoSbpFKb6o8GzlX+t7gX6rT
X-Developer-Key: i=quic_vpernami@quicinc.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fcbdae cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=NdffcxjtmGlxNBlw-1IA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1ac5Q5QsXfNrinJqYzHl_kOV8xXnajE-
X-Proofpoint-ORIG-GUID: 1ac5Q5QsXfNrinJqYzHl_kOV8xXnajE-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=944 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140055

The QDU100 device does not support the MHI M3 state, necessitating the
disabling of runtime PM for this device. Since the PCIe core framework
enables runtime PM by default for all clients, it is essential to disable
runtime PM if the device does not support Low Power Mode (LPM).

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
 drivers/bus/mhi/host/pci_generic.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 03aa887952098661a488650053a357f883d1559b..a011fd2d48c57cf9d1aec74040153267a206d797 100644
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
@@ -1270,6 +1273,13 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* start health check */
 	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 
+	/* Disable Runtime PM if device doesn't support MHI M3 state */
+	if (info->pm_disable) {
+		pm_runtime_disable(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+		return 0;
+	}
+
 	/* Only allow runtime-suspend if PME capable (for wakeup) */
 	if (pci_pme_capable(pdev, PCI_D3hot)) {
 		pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);

---
base-commit: 01c6df60d5d4ae00cd5c1648818744838bba7763
change-id: 20250414-vdev_next-20250411_pm_disable-53d5e1acd45e

Best regards,
-- 
Vivek Pernamitta <quic_vpernami@quicinc.com>


