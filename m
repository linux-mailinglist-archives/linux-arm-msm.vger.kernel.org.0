Return-Path: <linux-arm-msm+bounces-70161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59663B2F92D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 15:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7688C3BA598
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB2F31A063;
	Thu, 21 Aug 2025 12:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RMFUgNJt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2689E31A042;
	Thu, 21 Aug 2025 12:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780945; cv=none; b=Eih97IS1tkGPeav9pFwiWSayH60ZV+KHiIl2VElgqiT6llihCtnPU9CG/9EmwLJwPkvKgulDGln4H2ptxcQbiT5MvMKXV6pEM9myx+/IPD9sjaYYTo6Yy97yp7tp/ZV2iE0VIMq2wTAVKSN1/v7vz1Jl9+8R6sI18SqNEcg9Myw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780945; c=relaxed/simple;
	bh=DolLRzL4hcUkYaD+GH7vazSJN539HPamEWN9WWv01AU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=D6GMXjEX63MXYMfNe+AEAOTpzI9IEPtHcydpK8O4yRz092NjHUyTww+ZomT0W7nqdemB6x1LGSReoqNO/JCGHG3PjHRKKlO2YobbycQUMvpZWXM+CJ0d2pvKje5A1DqthBckduRtzeYHfA3rIZe3ss5B8a/ZJePLj2pZMgWAhRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RMFUgNJt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b9QV012918;
	Thu, 21 Aug 2025 12:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mNVjVos3YjYWgfb7waF6jy
	DQt3sM5CLb0Iagj0WSyys=; b=RMFUgNJtbQ6RDs7Y8uFWsQCV1v4WeJ+Py/gCIy
	sMFJLK56ENgvzkB+WAC/WiwBjGjfqqctsx+RFK5m6xO7X+kKHj+8jTIUijVuTFg0
	6HQYTPYPPQU5DoqJ1tI11UXnAYpdE4XID265w/F+6i1ICrcUto4y94kQSgQkSZp9
	Q1oyt6eWQMud5DbeM3AW2sUF4nwPRX2+LOkg7mNs0aLBLBCGbWp/szDVFvEvF1o3
	rq+OiOxJJPQgZ6odnT/1MEQgqNxplUFD9qpnYhw6d/f61pc4jvpL+aQ9VWs2dXjg
	xG1UKInP2FLxm1xJfCtYiPRUp7bWQrG1HsFMfHaieavenJwA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dnbsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 12:55:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LCtdbo031739
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 12:55:39 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 05:55:37 -0700
From: Vivek.Pernamitta@quicinc.com
Subject: [PATCH v3 0/6] bus: mhi: host: Enable SRIOV support in MHI driver
Date: Thu, 21 Aug 2025 18:25:32 +0530
Message-ID: <20250821-vdev_next-20250821_sriov-v3-0-e1b017c48d4a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEQXp2gC/zWMWwqAIBAAryL7nWCG9LhKhFi71f5YaEgg3T0J+
 pyBmQyRAlOEQWQIlDjy4Qs0lYBld34jyVgYtNJGdbqWCSlZT/clf2Vj4CNJp/u+nRFnhQZKfgZ
 a+f7W4/Q8LyObGhxqAAAA
X-Change-ID: 20250821-vdev_next-20250821_sriov-a2997bddb0d5
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755780937; l=3159;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=DolLRzL4hcUkYaD+GH7vazSJN539HPamEWN9WWv01AU=;
 b=J4ZjzDlkCusX2uyKgk6ZBprEUyRaaLlfp+ysIhx5hdCkzH0OHv5PBnr4djwh49/LtHwHp6sbx
 SIRf/QPJGUVDE6Q8FO/MDpb3DNVzPIfQSBWqUa2d6hEpPm5CwNiFdON
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXxtqNjvdFtYvN
 DejSL8v0atE7gISPlinYk47+E+PaMxx0eLMrwS9XdVebQuA9OtwkRpKfQOtirZ11TIE5idUR/VL
 kAYm5DFSi1pcIK9GmCXdg3kb2W9nGHuGXzsSDvaB2EzRydBbtdFkE1R29JdasDbchcZkzMK7KjK
 4fxVXCnXqMby5fKDjfvrzYy0TdVa8trXV7p9Ppd6q7GLuDoUXEkF89KJjQvP9ZboauEwweHpSH3
 uvF4i5z2qdm2hKE6ahcCoi/rAVVXjIyf9iQ834HA7r+xfKo3FLf6wrRz/skjHy6Es121QmMsGDt
 OVL9U0Yqcdsxz2Coxa8E41d8819hjsxr29BEF8n4jukJ+yLNV/PKWkUawZspiQkM2xfw6DpoJXt
 JOblZpq1yrDjU9jrs6E4OwpwSpSnvA==
X-Proofpoint-ORIG-GUID: m7H3KsjsoCAhYk02_6KWLxQOj85G46-K
X-Proofpoint-GUID: m7H3KsjsoCAhYk02_6KWLxQOj85G46-K
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a7174c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=2R5Bh164MekqeprxuscA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

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

Signed-off-by: 

---
Changes in v3:
- Updated commit messages for individual gerrits as per Konrad and Mani
- Disabled health check moniter for VF.
- reordered patchset 3 and 4.
- Removed empty lines, unsymmetric functions, comments and alinged mhi_pci_driver structure 
- Renamed struct member from reset_on_driver_unbind to reset_on_remove.
- Added support for higher DMA mask for VFs on QDU100.
-
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
      bus: mhi: host: pci_generic: Add SRIOV support for PCIe device
      bus: mhi: host: pci_generic: Remove MHI driver and ensure graceful device recovery
      bus: mhi: core: Improve mhi_sync_power_up handling for SYS_ERR state
      bus: mhi: host: pci_generic: Support independent DMA mask for VFs

 drivers/bus/mhi/host/internal.h    |  2 ++
 drivers/bus/mhi/host/pci_generic.c | 70 ++++++++++++++++++++++++++++++--------
 drivers/bus/mhi/host/pm.c          |  2 +-
 3 files changed, 58 insertions(+), 16 deletions(-)
---
base-commit: 7fa4d8dc380fbd81a9d702a855c50690c9c6442c
change-id: 20250821-vdev_next-20250821_sriov-a2997bddb0d5

Best regards,
-- 
Vivek Pernamitta <<quic_vpernami@quicinc.com>>


