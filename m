Return-Path: <linux-arm-msm+bounces-73338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20273B54E56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 14:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C88FC17E005
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4983043DE;
	Fri, 12 Sep 2025 12:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SOd0pSg3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABD71E32B7;
	Fri, 12 Sep 2025 12:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757681299; cv=none; b=o3f1LIPs9xT7MCUm18iogdCUi0zwtryA0mFd3Vav5irSFJZtcKD9+0jRXKL2IaWBteUooRoWT7qjDbwBWPI/3YowjAyc4mc//jxjui+sot/1EB5NLbFxhH0qoR+RdEGHv4wF9mOqqGX6v8NwHtfvUFvDVYeWzV6iPWHfyb/oPEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757681299; c=relaxed/simple;
	bh=e3hBRC44Gz8G5GRz0HUmuDNqbENc0gpDmGu5i4BaQ44=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=h0bWlbp/OQ8+P5lgbanpHh0bJFned6C6f6BC844ZlJ6gpn+9XPZhtyKgfGpK4Yj0bafvNq/tiRN2mf5he88GiFxp3Ngul1dkJefVCp/jNaa1/E6L+vv/ybQ322K2owMhAhABI3h1dk3wRBqaTb4WFJXl1L2QRTWpEdiCNqZv4KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SOd0pSg3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CBBBNs017151;
	Fri, 12 Sep 2025 12:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=52BhLKvlrfANGBmor26Fr3
	iejb8XvzYlyAlZ0knbNMg=; b=SOd0pSg3E556NE2O+oJtCJGItxxs9vClkO+pxf
	Ibe8u5vfDna42NgG64N/Vbxfqh6SLBnRqzHafxgt94QorLZfgoCQiNfNOO9zWjMW
	/qGUbYr+cpnVYjsDEH0f+T8Uosh8yTgFwYXaDOOA8eNzO6EAsQ5rqdWUrR4H6kL7
	tF6LTBUijipYzpChiU5N0uY+bFBKaLwns8wx8OPz4cwgZMu0iev8ErE847PXTMUC
	qTz45VZIh7Ir0r5G2sqpkjjRoLXZoy2Wiq2fx1fs5qy+nE1dIFMnYvurl1rhz0gC
	PVZ6TW+AxeEtir0UqE7i1kKDDogOn2h/zNF00m9EesgSzHPQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494jdx07yf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:48:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58CCmCRi021524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:48:12 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 12 Sep 2025 05:48:10 -0700
From: Vivek.Pernamitta@quicinc.com
Subject: [PATCH v4 0/6] bus: mhi: host: Enable SRIOV support in MHI driver
Date: Fri, 12 Sep 2025 18:18:04 +0530
Message-ID: <20250912-uevent_vdev_next-20250911-v4-0-fa2f6ccd301b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIQWxGgC/y2MQQqAIBQFrxJ/naBSkF0lIsqe9TcWWhJEd0+i5
 TDM3BQRGJHa4qaAxJE3n6EqC7Lr6BcInjOTlrqWRmlxIsEfQ5qRBo/rEL9Rwk6TMc41UgOU+z3
 A8fW9u/55Xljki7lrAAAA
X-Change-ID: 20250912-uevent_vdev_next-20250911-cbb99ff802ee
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757681290; l=3538;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=e3hBRC44Gz8G5GRz0HUmuDNqbENc0gpDmGu5i4BaQ44=;
 b=tTynoyTuF/5fENh6dqXfu6knnkD4gvuO25pLee5xvuBr96Hf4mMVCjh9iQvXVquB/RR7w/kYl
 C9ZUOBYRUHEC7VlAWoC+s7SmcJ0UOs0Ju1Y9hnMTLabKM3suXzL/+oz
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDEwNiBTYWx0ZWRfXy+1zPW4eviFY
 J4MNW7wRowVSheRwPDl+jaHrdDWRn+SUXb0+mrPPlhj5O1kAlLux2X2PvsD9Mpmv+DDenZoUgCv
 R652CayxKmgXvCr+yEL+jPf+XFIpL2IpmfnCDc15+5Jftslk7SmeN/tI13WO34G2Mggb1S8abQG
 uQFr9MfffFDWv9+d4QrlVxls8jGCzcpicQWq7SUcRmx3JHKRQkYYOwbXEIe67C5W3dcmVEsOCbI
 M/TlXTSsOn/F1XZPayxt5y2j2++6eA5fWoBcqxf8965L27U8lD7wXgvWYdHlAP8pYqwhWOFSbPW
 sOVn5rJ4DEbU18fKUC9N8iYlyniw2IQcxrjV/+7P5tdfpmFP6NDN6z0vkBeSrh7rUhOgCb4uLGN
 P2LQpdOO
X-Proofpoint-GUID: X6qJOEQoGTsbSCiIdtk_xT96rw0hAYxh
X-Authority-Analysis: v=2.4 cv=JMM7s9Kb c=1 sm=1 tr=0 ts=68c4168d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=2R5Bh164MekqeprxuscA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: X6qJOEQoGTsbSCiIdtk_xT96rw0hAYxh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509120106

This patch introduces several enhancements for the SRIOV support in MHI driver
focusing on enabling SRIOV and improving the MHI driver removal process.

- Add support to enable SRIOV.

- Remove health check monitor for VF's and read PF's device id for VF.

- Implement support for separate controller configurations for both
  Virtual Functions (VF) and Physical Functions (PF).
  The PF takes on a supervisory role and will have bootup information
  such as SAHARA, DIAG, and NDB (for file system sync data, etc.).
  VFs can handle function-specific data transfers, such as data plane
  or hardware data.

- Perform a graceful removal of the MHI driver. Upon driver removal,
  the host driver will perform a SOC_RESET on the driver remove callback.
  This ensures device reset gracefully.
  
- Add support in mhi power up to handle sys_err state instread of treating
  as error.
  In power-up or recovery scenarios, the device may enter a valid SYS_ERR
  state due to a prior reset. Currently, mhi_sync_power_up() exits early
  when this state is detected, causing recovery to fail. This change
  ensures the host waits for the device to transition to Mission Mode even
  after SYS_ERR, allowing proper error handling and recovery.

- Add Support to configure DMA mask for VFs expliclty for QDU100.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
changes in v4:
- updated commit messages as per Mani's comments
- update macro name MHI_PM_IN_UNRECOVERABLE_STATE to MHI_PM_FATAL_ERROR
- Added return type and inline comments which got removed.
- link to V3: https://lore.kernel.org/mhi/20250821-vdev_next-20250821_sriov-v3-0-e1b017c48d4a@quicinc.com/T/#m6552b907b0c58d5ebd1d3019ea0a446d09210367

Changes in v3:
- Updated commit messages for individual gerrits as per Konrad and Mani
- Disabled health check moniter for VF.
- reordered patchset 3 and 4.
- Removed empty lines, unsymmetric functions, comments and alinged mhi_pci_driver structure 
- Renamed struct member from reset_on_driver_unbind to reset_on_remove.
- Added support for higher DMA mask for VFs on QDU100.

Changes in v2:
- Changed order of patchsets from V1 as per Konrad comments.
- Added spec version for separate controller configurations for both VF andi
  PF as per Krishna comments.
- Updated git commit message as per Krishna comments..
- Added mhi_pci_remove in shutdown callback in pci_generic instead of
  duplicating the same sequence in both as per Krishna comments..
- Link to v1: https://lore.kernel.org/r/20250703-sriov_vdev_next-20250630-v1-0-87071d1047e3@quicinc.com
---

---
Vivek Pernamitta (6):
      bus: mhi: host: Add support for separate controller configurations for VF and PF
      bus: mhi: host: pci_generic: Read SUBSYSTEM_VENDOR_ID for VF's to check status
      bus: mhi: host: pci_generic: Add SRIOV support
      bus: mhi: host: pci_generic: Remove MHI driver and ensure graceful device recovery
      bus: mhi: core: Improve mhi_sync_power_up handling for SYS_ERR state
      bus: mhi: host: pci_generic: Support independent DMA mask for VFs

 drivers/bus/mhi/host/internal.h    |  2 ++
 drivers/bus/mhi/host/pci_generic.c | 69 ++++++++++++++++++++++++++++++--------
 drivers/bus/mhi/host/pm.c          |  2 +-
 3 files changed, 58 insertions(+), 15 deletions(-)
---
base-commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
change-id: 20250912-uevent_vdev_next-20250911-cbb99ff802ee

Best regards,
-- 
Vivek Pernamitta <<quic_vpernami@quicinc.com>>


