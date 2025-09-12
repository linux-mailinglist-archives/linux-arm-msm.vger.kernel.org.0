Return-Path: <linux-arm-msm+bounces-73344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BED16B54E63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 14:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A8FAAA642A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D0030DD34;
	Fri, 12 Sep 2025 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O8Jq+DOG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC1430C62A;
	Fri, 12 Sep 2025 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757681311; cv=none; b=JR/k9W78CMwvCIReYpCGagZn0zmvs4VHaLpfvaDudVKFo/InHDJI2y7OICrbEAh2ouRwy2LDCnyZfDtpU/MuFCxuE6k85rFZUuEtd/oz9QQ5xFM1YQ6w5fDG4+EkPRWomJiAKm2moonyhUA0QbX3lBRQuNwrJIBd77Q3DSPz4go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757681311; c=relaxed/simple;
	bh=4SFuEubmFaiGps0CP3Ly5iZC/s5WN25OLjJ+LpWzhts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TKwooeV7AOqODQrWf/54/JqZBIY1sC7Iv9v65hlNULHMQmRO4cOq80IcjgnQKZKA9OYq5frah8TuwiNxrG6sappuRZmSsWax3v6NRU0vydXHa3AnfNBW67Zl9kqKmWKAsW4DVmwqtK/+6YzDV/RnyobligRbwTA4oGeINUezMLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O8Jq+DOG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fKJC009094;
	Fri, 12 Sep 2025 12:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MsGGPNwY8cXigk7bjzPUFp93nvN9ZPJmkA14HYaXLBQ=; b=O8Jq+DOG4V66LTOc
	3a1E6sCuhHOPWdvHcUc4iySlnHRGKMAufqhqj++/l1FR5VCnzoKpJFE5XvoOMPR8
	l4MPVPfkEJCNsKeNeWoi0oYlEZjMQv+b7JrfwYXgsj9SEWNWbhP0w7l1mTXLUj+7
	3rKiNustZ4U/fGv090KhGJCQlmFuUHWLa8jOvv2alqhZ2mrMqi3Yemn0eCFppd3m
	9OT1SUoeQCkdy3ucN6r3hScmRj/eX9Haifad2jt1XSu9EPIDtCTgFMJbG9776GCl
	T1mehqMFD1bMeKZJXWQZUibYDR0eNFPz5SWDD6hYg3ksFhnr8mwjvdV0j6kcRAyR
	vCgCmQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj13mqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:48:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58CCmPXO014792
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:48:25 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 12 Sep 2025 05:48:23 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Fri, 12 Sep 2025 18:18:10 +0530
Subject: [PATCH v4 6/6] bus: mhi: host: pci_generic: Support independent
 DMA mask for VFs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250912-uevent_vdev_next-20250911-v4-6-fa2f6ccd301b@quicinc.com>
References: <20250912-uevent_vdev_next-20250911-v4-0-fa2f6ccd301b@quicinc.com>
In-Reply-To: <20250912-uevent_vdev_next-20250911-v4-0-fa2f6ccd301b@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757681290; l=3681;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=gWNq35DSTvJwD2BrTCkoj2BC1wvazwuSQspATqlZUbk=;
 b=M+56bPSVELGRXP/k56OnMe4dEpxh5XwWofbURhe9Ef7BqTNbt6hxJ0Nk01cFoUCEebazQmuw0
 DU87+ChbbYxCF9OtltP2GHiD/bFMtm3SdyUm3Z6YIHUuQs3ALe7nu+y
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sH7FGgFly8voxh4jOQqas3u5VZD6_78Q
X-Proofpoint-GUID: sH7FGgFly8voxh4jOQqas3u5VZD6_78Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX3RwYJ9NnkMG3
 hVZNStug9rRHBX0Z+crNPQbKelRyRc9J42pRIYdCLl9CbPzjWiunv6GHhPEYhX9eFIqHFhQEXq7
 X5MWJRSlo/UPjIDbxHx33qBsTV0sYhIJZ3wYiGagTdu1alQosPPphKoDSRGapAiIlCbI2z0BYzC
 kNKabI0rpCqY8wrDpTbauQ7hOdI8PaTgO2EgObnTDae/ciq9HH8YYylaIkf136t1osfR/A0PpPz
 OAc7+9pGyE8sokV3UQOBv46E/hya8Ne5hg92iNm+xxSu02A9i+nBBqkDuX680SLBNTpejeA3p/x
 D+sJHkKtiFTXQTSuDDuIbHA1FMM9pSg3fxoergVOPqWeC7Y5p90eaVQcVarsEWXYpvbKmh70545
 29JWuydW
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c4169a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=B_Hsn4pIL-mR84e0YfAA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

Certain devices like QDU100 bootloader support only up to a 32-bit DMA
address range. However, Virtual Functions (VFs) are enabled only after
the device enters Mission Mode and can support higher DMA address ranges
(up to 40 bits).

A 32-bit DMA mask limits addressable space to 4GiB, which is insufficient
for data transfer requirements over VFs on platforms like QDU100. These
devices require larger memory regions to be mapped for efficient VF
operation.

To address this, configure `dma_mask` independently for Physical Functions
(PFs) and Virtual Functions (VFs), allowing VFs to use higher DMA mask
values where supported.

As per PCIe SR-IOV specification (rev 0.9, Section 1), VFs are capable of
handling resources associated with the main data movement of the Function.

This change ensures compatibility with bootloaders that have limited DMA
capabilities while enabling full VF functionality once the device reaches
Mission Mode.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
 drivers/bus/mhi/host/pci_generic.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 4de7e56d4b8819f1b26a34b8a9649327314169dd..b188bbf7de042d8b9aa0dde1217d2c86558c3caf 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -41,6 +41,7 @@
  * @edl_trigger: capable of triggering EDL mode in the device (if supported)
  * @bar_num: PCI base address register to use for MHI MMIO register space
  * @dma_data_width: DMA transfer word size (32 or 64 bits)
+ * @vf_dma_data_width: DMA transfer word size for VF's (optional)
  * @mru_default: default MRU size for MBIM network packets
  * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
  *		   of inband wake support (such as sdx24)
@@ -56,6 +57,7 @@ struct mhi_pci_dev_info {
 	bool edl_trigger;
 	unsigned int bar_num;
 	unsigned int dma_data_width;
+	unsigned int vf_dma_data_width;
 	unsigned int mru_default;
 	bool sideband_wake;
 	bool no_m3;
@@ -300,6 +302,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
 	.config = &mhi_qcom_qdu100_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
+	.vf_dma_data_width = 40,
 	.sideband_wake = false,
 	.no_m3 = true,
 	.reset_on_remove = true,
@@ -1300,6 +1303,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	const struct mhi_controller_config *mhi_cntrl_config;
 	struct mhi_pci_device *mhi_pdev;
 	struct mhi_controller *mhi_cntrl;
+	unsigned int dma_data_width;
 	int err;
 
 	dev_info(&pdev->dev, "MHI PCI device found: %s\n", info->name);
@@ -1322,9 +1326,12 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
+	dma_data_width = (pdev->is_virtfn && info->vf_dma_data_width) ?
+			  info->vf_dma_data_width : info->dma_data_width;
+
 	mhi_cntrl->cntrl_dev = &pdev->dev;
 	mhi_cntrl->iova_start = 0;
-	mhi_cntrl->iova_stop = (dma_addr_t)DMA_BIT_MASK(info->dma_data_width);
+	mhi_cntrl->iova_stop = (dma_addr_t)DMA_BIT_MASK(dma_data_width);
 	mhi_cntrl->fw_image = info->fw;
 	mhi_cntrl->edl_image = info->edl;
 
@@ -1348,7 +1355,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		mhi_cntrl->wake_toggle = mhi_pci_wake_toggle_nop;
 	}
 
-	err = mhi_pci_claim(mhi_cntrl, info->bar_num, DMA_BIT_MASK(info->dma_data_width));
+	err = mhi_pci_claim(mhi_cntrl, info->bar_num, DMA_BIT_MASK(dma_data_width));
 	if (err)
 		return err;
 

-- 
2.34.1


