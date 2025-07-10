Return-Path: <linux-arm-msm+bounces-64314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D24AFAFFD63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 11:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1FD95A7212
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 09:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE94294A0D;
	Thu, 10 Jul 2025 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VrJqjmAh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A892128C86D;
	Thu, 10 Jul 2025 08:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752137945; cv=none; b=a9gI7kjlO1zFVzSPAD320d/f/Met7kbcRQ0MNWlSKsvFehCsMSDhjr1TRaiYpr/dgsMPcJWiEEFxuzkwIFMNABbxcLMs67fOhuc+PRnyDygJQPjLw5t11sP4jcoTpPOJVtGdT+mJ9yct+Z76XM69FN7OZRFcl4b0nNPsv5u3/fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752137945; c=relaxed/simple;
	bh=eERbK6hqLjKS5s0UYONUwBE5I7h7uV6oRiLW4+nkNDw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=FEhTCm/N4HlI8qbd5I7ozeu4ukC/XmMEgAUqY+b+G8a82nl2UxTe1xQ1cOrjffDG28Q1heUUJizsar7VQ3yzy+PFrG4F72Ror906o4i9ithIMm6Rmcy8WV3ULc9YctSkgwW+6SXHdZiYkfMyYsbqHT9x4Gj5AcKjoTeXEWv4G/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VrJqjmAh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A8kUnF030233;
	Thu, 10 Jul 2025 08:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l/rRhjjEyKzn3kTvehTw4X
	fRBbBoWS+RK7fszN+pbTY=; b=VrJqjmAhajcVOc9HoCqoS+OAGQZATujyEEdf7l
	yr0TSirroqXLl83xy/GH9GYiBabmmgs6YCAnZy3ycmhG1HHAeSVf4F95ro++0U2X
	4dNzbHRn/Z8Mi0rl9vMqv5j2uDipJBGSqvusvoHq1Vz/C8MkVgW/c0ooUpnEOpN9
	sNoBCAvQp5EW2qhJkBuLrpoL4OZItL7mL6RIKH5hQtsbRsK2PkyFoIOEgRXsp+Rn
	dbLJO6xZEEgwq4cyim7QexSyXr0P9CwHjZh500ZBtIeMSMz0SfOp5J1ZWKkyBN8o
	ZHbsj1s2gx8XzBaCkySASz7uoGdP+YJis2De4kpTRpojQFrg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg48py-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 08:59:00 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56A8wxon024380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 08:58:59 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Jul 2025 01:58:57 -0700
From: Vivek.Pernamitta@quicinc.com
Subject: [PATCH v2 0/5] bus: mhi: host: Enable SRIOV support in MHI driver
Date: Thu, 10 Jul 2025 14:28:31 +0530
Message-ID: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALeAb2gC/3WNwQ7CIBBEf6XZs5iliBhP/odpGoWt3YOgUElN0
 38XSTx6fDOZNwskikwJjs0CkTInDr5Au2nAjhd/I8GuMLTYajQoRYoccp8d5d7TPIla7BUKJDJ
 6kNqhukKZPyINPFf1uSs8cppCfNenLL/pT6r+S7MUKA4GjXQSd4bU6fliy95ubbhDt67rB+C2I
 +fCAAAA
X-Change-ID: 20250701-sriov_vdev_next-20250630-0ee75f15d03b
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752137937; l=2710;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=eERbK6hqLjKS5s0UYONUwBE5I7h7uV6oRiLW4+nkNDw=;
 b=S3k1JOu4yGYV66gc72cpNcsvUdU/9NLIUkES+452xEPWkjZO3+cfAQ9GJUZc/M/lEIheFzoI4
 tFs7+nSmwf7D21yRnDc1WllWQXaUE6P5Tatw1w108ZlMGKwPhVq7HyK
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=686f80d4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=IZ3J-Pvvv7PwYCIF5DoA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: PoZfI5OaaitgxcXP_m0fMXpvEBCBWsjJ
X-Proofpoint-GUID: PoZfI5OaaitgxcXP_m0fMXpvEBCBWsjJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3NiBTYWx0ZWRfXx8Hgy5xz/CLj
 tPErxzLwOCutEqcI2DE8LJ6yA7HS9FIMhSr0vm9dXHwVStYJk2PODa8LxxNDYfD8PZ6rUNkW5EO
 5G7325LosDXRF9UBk1LTuzqhNGbkq1kUkGw7FeyZaPJ/FlKCu5E7iG+ebB4CazE3o5jk/ywOyn0
 BmOeYF1w0OeZlK+oxSDuVUlVTo0l+yhrwuAYSU/69moNNfxc/CFjBR7h5QnB7BRJXaNRcqDW7ne
 hIOXCLylrvNgJJZgnIJDxxsyNIHJpYE7yj+sw3H/6476QiDFTMcy7pBeay4wsz0OX0hh/f6wvDe
 hX9hrjBbfGMqCPQ5pRbZCMgPwI06XT7iADB0QMPl5W/MOXBUu3MFukAqDlOneQ4oZE4P+dGRdTK
 lpyQo0Ndt/2270YC65qOkErmrspAo8gah/dnhd0gBOpo/DbSVSTMhNbIYY0/fyN/n9gEEK0r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100076

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
Vivek Pernamitta (5):
      bus: mhi: host: Add support for separate controller configurations for VF and PF
      bus: mhi: host: pci_generic: Read SUBSYSTEM_VENDOR_ID for VF's to check status
      bus: mhi: host: pci_generic: Remove MHI driver and ensure graceful device recovery
      bus: mhi: host: pci_generic: Add SRIOV support for PCIe device
      bus: host: mhi: Need to honor sys_err at power_up state

 drivers/bus/mhi/host/internal.h    |  2 ++
 drivers/bus/mhi/host/pci_generic.c | 44 +++++++++++++++++++++++++++++++++-----
 drivers/bus/mhi/host/pm.c          |  2 +-
 3 files changed, 42 insertions(+), 6 deletions(-)
---
base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
change-id: 20250701-sriov_vdev_next-20250630-0ee75f15d03b

Best regards,
-- 
Vivek Pernamitta <<quic_vpernami@quicinc.com>>


