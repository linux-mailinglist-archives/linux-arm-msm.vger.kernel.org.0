Return-Path: <linux-arm-msm+bounces-63543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D97E4AF7A7B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 17:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32E204A27FE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 15:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982C22EF9DA;
	Thu,  3 Jul 2025 15:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dBCiMoyQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE421E9B3D;
	Thu,  3 Jul 2025 15:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555396; cv=none; b=jg9kRtyvQdhc38mIwxitAwXbJMbzUhYmyS8AejDBVIZEldNuOSxet8d0uoSNFnAVCqSI1f5IreHCmdcK0vVOc2iKfmq36oPzH3lENe+6Ok0m4WejGSUkbdM1Qd3eRxWH0+NdCT8uJKkNeJdml8oxHe+vbArhP796MfFtdUrLsAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555396; c=relaxed/simple;
	bh=w5RnSFtp0MN5u7g8v7grTd4Pv2Ujqg7NjWQkyG/E58U=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=hboeFoG1weK0XdnXTPyyQwryLlr/jvcfplUHvefLYi8ffSBcAgL5CU4pESFX6NA8GiLno0EgB7OwunJBq4vXtot1UTVAagW2X3CAV3zCcRrmQT2rpGvsPxXTFmw5leCq4ETtFAH40gPBRYgx2mHxyeZJDF98fwGltXaxfgYA5B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dBCiMoyQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563ErnVF018568;
	Thu, 3 Jul 2025 15:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e1wKDrG+9ZY7B+fLpLH2lU
	EiCYmLinZ7W5F89oxGRj0=; b=dBCiMoyQFIJG6ZzBmMBNs1WaOhwB9SKUyOyP2n
	BFImKXBL3P8iwsTz9YJEFmY3XZFW2wODnaDZLQSy2Imx9LGVLVkQWE49/Zd7turv
	HuNmhpOB1Cuo3AluwpL2cUu+uYrt+nmJTESvXeBfJBSEQLm5dcBZd1vFP5lvjXJQ
	dhHwbNfXQJ0W03fteNEM0okQ966sQB4VLXutnMybbBnLOnvwAGYrGO7Xm9tyAZUj
	6G/bT7C7aOogRUdJ3i4twNqu7zn2uVJxiwWC6KBmYsexFEsATkEVUSOWBrR2UYo9
	IGPxRxBeqKZgR7JVcu3YYF9lA0voEfq2Mze8P/WdOhAQAiZw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxs014-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 15:09:49 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563F9nAq008711
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 15:09:49 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 08:09:47 -0700
From: Vivek.Pernamitta@quicinc.com
Subject: [PATCH 0/5] bus: mhi: host: Enable SRIOV support in MHI driver
Date: Thu, 3 Jul 2025 20:39:39 +0530
Message-ID: <20250703-sriov_vdev_next-20250630-v1-0-87071d1047e3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADOdZmgC/x2MUQqAIBAFrxL7nbAWJnSViKh81f5YaEgQ3j3pc
 xhmXooIgkh99VJAkiinL6DritZj9juUuMLUcGPYslYxyJmm5JAmj+dWv+haVgxYs2njuF2o5Ff
 AJs+/HsacPxE8UzpqAAAA
X-Change-ID: 20250701-sriov_vdev_next-20250630-0ee75f15d03b
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751555387; l=2212;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=w5RnSFtp0MN5u7g8v7grTd4Pv2Ujqg7NjWQkyG/E58U=;
 b=cbXtbUes05/PcdMKrMpYfXlW2609qbdatu58Es0hU4/jo6oz383K2A2CyoFb3hGiaqry5oAZ0
 Aa7mEM41+rLBb70ZDHdj8fX+C29JKldhUGkwge0V2T2WHjrYl3gu0yV
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEyNyBTYWx0ZWRfX8110F29U2NZq
 1HQyw8TGNwM85MBzdnee8JgpSGo0b5JXkmPkmtSQeCx1KeNL95Pwbdzl6MwwgM/PBu25i7ahWIp
 6pgTpOHxGqm1M7oEfcEZubKOkELp1WifSkHDHm4O8BPat5JuxTVKGQIymMGVGQxxC9x6L8sbHk7
 ADxsil4DWs3Bnc89qm0thgRR2idBiMNr5s7CSIMHL8PjcGODtZlEQmUhpvrtR8RCXCxQd9oqkPl
 99jlOSt0xfSILpMNU1SWWfwRGLn/CZYtv8YaWg9fh0UbHyf6XpHwJrufIMirjU1PqHltFTvhypP
 yQMVSl2DxgGandAEwJ7EoWWy6KFjdy8v4VvBfH6x+8rBzBU17K0KbLHfvXdrp5Vyw8V8Y8lH1E5
 3nMK5ZFS+SXGtZ0tlkl5E7oQ10atzxSn4cZ5c/M604M4Sfio81JjRtstB5c6x/K8QmRivTOQ
X-Proofpoint-GUID: X7kcvPHc_lm0LmZxQvkLFXlQ1FfcIQ-i
X-Proofpoint-ORIG-GUID: X7kcvPHc_lm0LmZxQvkLFXlQ1FfcIQ-i
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68669d3e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=IZ3J-Pvvv7PwYCIF5DoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=862 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030127

This patch introduces several enhancements for the SRIOV support in MHI driver
focusing on enabling SRIOV and improving the MHI driver removal process.

- Add support to enable SRIOV.

- Add support to read SUBSYSTEM_VENDOR_ID for VF's to check status.

- Implement support for separate controller configurations for both
  Virtual Functions (VF) and Physical Functions (PF).
  The PF takes on a supervisory role and will have bootup information
  such as SAHARA, DIAG, and NDB (for file system sync data, etc.).
  VFs can handle function-specific data transfers, such as data plane
  or hardware data.

- Perform a graceful removal of the MHI driver. Upon driver removal,
  the host driver will perform a SOC_RESET on the driver remove callback.
  This ensures device reset gracefully.
  
- honor sys_err at power_up state
  In mhi_sync_power_up() host waits for device to enter in to mission mode
  but SYS_ERR is an valid state, If device sends an SYS_ERR host will bail
  out for wait_event_timeout() as MHI is in error state and calls
  mhi_power_down which will teardown MHI driver probe.
  If there is any SYS_ERR, sys_err handler needs to process SYS_ERR state
  and queues the next state transition for device to bring in to Mission
  mode, so mhi_sync_power_up() will wait for device to enter in to
  mission mode.

Signed-off-by: 

---
Vivek Pernamitta (5):
      bus: mhi: host: pci_generic: Add SRIOV support for PCIe device
      bus: mhi: host: Add support for separate controller configurations for VF and PF
      bus: mhi: host: pci_generic: Read SUBSYSTEM_VENDOR_ID for VF's to check status
      bus: mhi: host: pci_generic: Remove MHI driver and ensure graceful device recovery
      bus: host: mhi: Need to honor sys_err at power_up state

 drivers/bus/mhi/host/internal.h    |  2 ++
 drivers/bus/mhi/host/pci_generic.c | 51 +++++++++++++++++++++++++++++++++-----
 drivers/bus/mhi/host/pm.c          |  2 +-
 3 files changed, 48 insertions(+), 7 deletions(-)
---
base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
change-id: 20250701-sriov_vdev_next-20250630-0ee75f15d03b

Best regards,
-- 
Vivek Pernamitta <<quic_vpernami@quicinc.com>>


