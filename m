Return-Path: <linux-arm-msm+bounces-80616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E86C3B925
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 15:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 223CC4FBB6C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 14:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E455233A00C;
	Thu,  6 Nov 2025 14:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dlWUDpfX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0184D3321A7;
	Thu,  6 Nov 2025 14:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762437673; cv=none; b=gNFbvnTaMjGfXrbHIz87CL29EgbCmog4Fm2P1iLUX4094UAP/x5iabsi85Ro1I1k8UITGZ1XyCg0F90eL25yPfHB+TDtUYb8C5U76K3pw6L8U+DKQjsYh92Qc0cspVXLLzi00nEe84n7FpJ5PPrA/2kVPQEC58sE+GlZNDt1OPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762437673; c=relaxed/simple;
	bh=8uqtQ7durPRO80bDASrhdcsI7a+DO9vkGrPITvp2mFs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fDqS5iwnrnuS/RtcQYgNpFuJiXius9k3ks8/OMkpvMDwoQ3oyGFlGt8Y8Y3zq1FVubbBFefVTWryWMJpFnSEHUbv0avwgaT8cXSCg5FbGNuj19zmy+OanakS8U/13aJqHx3F4GEDg3/dnD9n88y11Ouzx8AcWTsIMGQ2tlx9yAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dlWUDpfX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A68jge63383421;
	Thu, 6 Nov 2025 14:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g3GN2Xwyx+E
	I5XBC1SLI+9n8ti44Se/rR8KLRFUW1Bk=; b=dlWUDpfXiXwExcT+cxWPSkZN5zN
	URVoUwCu4Yub/6WiHrt8vdWnsDzGgx/ABkR8CtLCXeKgs0fQ+08YYCG0yZMIWyUB
	9jC/jSRpw6TvjoLT+VAJJ43u8K48i2CaH5bJ9U6XuCRn9AzML5zhNaMfkmzD++f9
	THPHb0a/9xMpgWYxB97DdKRHR2KNL74BgdrjPxeifE6CN0w5vIPiFSM+R87NTNS5
	od/SvvFXV8DYik6/T2aoRwrG4Ep93NwV7z7E2DaXqcXIU2WFwuoI36p8XIYVhE9N
	VNeoRBAeDdZh7YyXrrfEyit2nWp35i9woN0NY4yeGPs+S49A1CZYMVHs3Ig==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8reurtnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 14:01:08 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A6E15S3022363;
	Thu, 6 Nov 2025 14:01:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a5b9n7upf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 14:01:05 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5A6E15tu022358;
	Thu, 6 Nov 2025 14:01:05 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5A6E14i2022354
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 14:01:05 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 2D30E2327E; Thu,  6 Nov 2025 22:01:04 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marcel@holtmann.org,
        luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org, stable@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_chejiang@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v2 1/2] Bluetooth: qca: Fix delayed hw_error handling due to missing wakeup during SSR
Date: Thu,  6 Nov 2025 22:01:02 +0800
Message-Id: <20251106140103.1406081-2-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106140103.1406081-1-quic_shuaz@quicinc.com>
References: <20251106140103.1406081-1-quic_shuaz@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDExMCBTYWx0ZWRfX9FeO2jYhkwDJ
 ZHhpo2xYBt4CKSBZmpEFXpv98beT+J/IsCWUusRYfTy1bRnwdbcMDR1dPYeoBRxfSPCLypXB26o
 flmVpbz3Hcnx7Bdlka9ymjF+cThf4M36fyTLXQkj4GSF8YZ4EZ6DN4Rm13Jtlbny+0NR2eru/Km
 ikUpgLwMOsQ1IBHwhUShZJQ2kmSKBhOH7OGQ8bgPTqZ7xep8UQXsWo69Z6io9mSudJoVSovFbWk
 Ey++L+6Ew36MTZQ2ktcIx1qB/v1cMMe/SxlVGxk6Wir3jxeCX9oKP0HAhjdHqMHhed2X4ryEuM2
 25QNPsd7J0ukjkeagpB4E2+tmdMhnVAbRpk/dlZB0ZJ0sD6CcJ0PXGcm7q2fY2quBcZcsyq4rPE
 hmAuvS6OtLGxRlybrvvRF+IQM+m+0Q==
X-Proofpoint-ORIG-GUID: UL-S8I2RDGQSCx0CGM9JQVP4BwDgMPUy
X-Authority-Analysis: v=2.4 cv=RrDI7SmK c=1 sm=1 tr=0 ts=690caa24 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=eIGlGOcC9ytwnVZZLkwA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: UL-S8I2RDGQSCx0CGM9JQVP4BwDgMPUy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060110

When Bluetooth controller encounters a coredump, it triggers
the Subsystem Restart (SSR) mechanism. The controller first
reports the coredump data, and once the data upload is complete,
it sends a hw_error event. The host relies on this event to
proceed with subsequent recovery actions.

If the host has not finished processing the coredump data
when the hw_error event is received,
it sets a timer to wait until either the data processing is complete
or the timeout expires before handling the event.

The current implementation lacks a wakeup trigger. As a result,
even if the coredump data has already been processed, the host
continues to wait until the timer expires, causing unnecessary
delays in handling the hw_error event.

To fix this issue, adds a `wake_up_bit()` call after the host finishes
processing the coredump data. This ensures that the waiting thread is
promptly notified and can proceed to handle the hw_error event without
waiting for the timeout.

Test case:
- Trigger controller coredump using the command: `hcitool cmd 0x3f 0c 26`.
- Use `btmon` to capture HCI logs.
- Observe the time interval between receiving the hw_error event
and the execution of the power-off sequence in the HCI log.

Cc: stable@vger.kernel.org
Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 888176b0f..fa6be1992 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1103,7 +1103,7 @@ static void qca_controller_memdump(struct work_struct *work)
 				qca->qca_memdump = NULL;
 				qca->memdump_state = QCA_MEMDUMP_COLLECTED;
 				cancel_delayed_work(&qca->ctrl_memdump_timeout);
-				clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
+				clear_and_wake_up_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
 				clear_bit(QCA_IBS_DISABLED, &qca->flags);
 				mutex_unlock(&qca->hci_memdump_lock);
 				return;
@@ -1181,7 +1181,7 @@ static void qca_controller_memdump(struct work_struct *work)
 			kfree(qca->qca_memdump);
 			qca->qca_memdump = NULL;
 			qca->memdump_state = QCA_MEMDUMP_COLLECTED;
-			clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
+			clear_and_wake_up_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
 		}
 
 		mutex_unlock(&qca->hci_memdump_lock);
-- 
2.34.1


