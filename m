Return-Path: <linux-arm-msm+bounces-70167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67758B2F936
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 15:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D87C11CE2E93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA62B326D40;
	Thu, 21 Aug 2025 12:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iHN8gXH5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5050731DDA4;
	Thu, 21 Aug 2025 12:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780958; cv=none; b=B5hKTQXu4T9iw6f66EMs9Tb/lP4t5hnkhOlj6/x/OZWbr9Y7LkVZr3Ev4J6ap9QqabDVcB7q5Q/ITlgezTtBYgvfFwv7clQ394S1ojP+Qr+/oDJOayX38Vi/NKYp6JEtrbeeJgfxLgk/OZaZWNH6MAlIMCc3SdwhJXhTdOsN6RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780958; c=relaxed/simple;
	bh=dCtYdGMO3p6wwjjFcvFS6OqXdRvH3LOudWC9D/lwhgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cUQU47AFb0ZZj8DqbhR9PlkIRGAw97jg4gjqCc0enDiOdowC2Xfw4CxJ6UdTcOZcFyIaQdcMQLswo30RExNpfNKinu4OXpJk3gN5peILfuyT+y5XcwA+HFiQIkpWP7yG5LLlBnnnaRdrwrlHKMsA8XJANo9NwulkH0I9QCfigBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iHN8gXH5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bCC9027039;
	Thu, 21 Aug 2025 12:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiF9HVJcyAL5ojJkT4FVsov1E3wUxAD6QowinKOUMO8=; b=iHN8gXH5U7/Fz69c
	euAWjEY2AZ3/g0KZCHF1jRvNi7quEYRcLowZaSQuFxW53mT3umpjXHn+fHpVEDtO
	Tnz7/tKv3yUCzs3YxCOWH0M9MjCPz7unEcb0w8c+dfPvdSSvJfJLiEr7FYHa6Rmg
	QGZz/+FcMflr+47Xjw68/wwNXy8mRQXAncrIdB5UNwa/b82WcAm494HA0Ib3MajI
	wObKYuMRbtTX/HNPZ9GF8sZ9875tiO2XJvtI2VsNpKgIDSrELqgZJqyi55JGp2te
	Exvsueyy2k8YnxAOpywf2+uLSk6CmGk7Iu379w1Qx3X2LYCRQEBWqhwrC4NACTXo
	EYTbgA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528wdeb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 12:55:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LCtpX6021436
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 12:55:51 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 05:55:50 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Thu, 21 Aug 2025 18:25:38 +0530
Subject: [PATCH v3 6/6] bus: mhi: host: pci_generic: Support independent
 DMA mask for VFs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250821-vdev_next-20250821_sriov-v3-6-e1b017c48d4a@quicinc.com>
References: <20250821-vdev_next-20250821_sriov-v3-0-e1b017c48d4a@quicinc.com>
In-Reply-To: <20250821-vdev_next-20250821_sriov-v3-0-e1b017c48d4a@quicinc.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755780937; l=3681;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=N3XGz2AWFK7XomES4Irvh8L7T51wOjE/t5FWWaqLwTo=;
 b=uGLz8a8x/QPUPNbS350Dy3N1ClK514JV9uZdZVDB+kMo3Pyjozs4DFW7OHEiMGoinpGZ8Bf2j
 zwnKQ5xNHl8DI4x+QSPbIPsfyKjJvaiCjjGPYavGxMokqlgertbmMQm
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a71759 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=B_Hsn4pIL-mR84e0YfAA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: EVf2AA7JF3IqZOaBvspay009YFc0t-dE
X-Proofpoint-ORIG-GUID: EVf2AA7JF3IqZOaBvspay009YFc0t-dE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX1/jGa8GibXum
 oz4cpSpDSodwMWTQCVHd0/T4BAsrACezi8C3dtn2Rb/NjOdh/IJYfMKEbz7eZX4PO+EeLaaEAI0
 Y8tBjrmtetn2/093G8NmjZY3B3Yul9o+U3n5f8GjDmPGG1DY+gRZaQZ5iU8q+K4Ehq+Tvm4Hp14
 UanUUzcAVZcCFCWV3I5aCIGgBvpipFVQ+AXgpjJJm9ZKyI3opgUbWn5YmTuBzQ7t+Qt0drETbPo
 h+EB6hK7TtgsWENOxqKPVyBg0/f2TBTkJ1AhloHo/Y3+z1PuuKKmRqnz14pN9CJcZmAf7Yv/DH4
 RsJ3GA7RKmjDNGTzruiVQ2lGLvfH1Vb5Us2jbV1EM6XHWCc9W0em6FytrG5yGA0ErNb6cjTvP0R
 EI+QWXgamGTfjhRgznMHg5DFQsoTdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

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
index f922cca0ab633aeae942587f0c40038342ce9c33..fad08bdd59919a1cab05e9864fb38151ef79e457 100644
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
@@ -57,6 +58,7 @@ struct mhi_pci_dev_info {
 	bool edl_trigger;
 	unsigned int bar_num;
 	unsigned int dma_data_width;
+	unsigned int vf_dma_data_width;
 	unsigned int mru_default;
 	bool sideband_wake;
 	bool no_m3;
@@ -301,6 +303,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
 	.config = &mhi_qcom_qdu100_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
+	.vf_dma_data_width = 40,
 	.sideband_wake = false,
 	.no_m3 = true,
 	.reset_on_remove = true,
@@ -1312,6 +1315,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	const struct mhi_controller_config *mhi_cntrl_config;
 	struct mhi_pci_device *mhi_pdev;
 	struct mhi_controller *mhi_cntrl;
+	unsigned int dma_data_width;
 	int err;
 
 	dev_info(&pdev->dev, "MHI PCI device found: %s\n", info->name);
@@ -1333,9 +1337,12 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
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
 
@@ -1359,7 +1366,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		mhi_cntrl->wake_toggle = mhi_pci_wake_toggle_nop;
 	}
 
-	err = mhi_pci_claim(mhi_cntrl, info->bar_num, DMA_BIT_MASK(info->dma_data_width));
+	err = mhi_pci_claim(mhi_cntrl, info->bar_num, DMA_BIT_MASK(dma_data_width));
 	if (err)
 		return err;
 

-- 
2.34.1


