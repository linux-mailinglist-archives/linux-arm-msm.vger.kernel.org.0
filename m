Return-Path: <linux-arm-msm+bounces-69972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A857B2DC12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 14:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D025C188C945
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 12:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7672C21507F;
	Wed, 20 Aug 2025 12:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F8eRlO4w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A546A1FCF41;
	Wed, 20 Aug 2025 12:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755691611; cv=none; b=gmJDMCGWCUXLjbSJ1JCiSlwN7DvHu+ZaIN6/2MF8H4bxNyvC8noSnbcwfQQKQaBDs8i2i9RncLphmplZzts4d3KISfgHMemMHjMm3u4xDuFi72wbn4SkUJb1SDeihUUO10kMN4PkgQJcdblgrXPeJIh39tk8xQTlSuWIUnXtirk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755691611; c=relaxed/simple;
	bh=L83qJ5G3ESEM3hjF/AdbOYptp1JAJAyvApLbvx+LrJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VS0ME74tKObR8kJh0GLFUzG0YRLhWPaI5O7WQ2iZyN8WfSFW/+wLHjpZULvVEd51rpMIgzmamxjWx4ZJH+v4dOtyS9mDky+Y7LIN/1u7iuMnSczcN0c7eE8wtYLoJhldrhxIWOnqCi7zhh8HYyLhAp6bfr3gMExlwX3FMIeOkIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F8eRlO4w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KA2F1J010893;
	Wed, 20 Aug 2025 12:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AHSc6ksXHqWetgSQ5cTA9hsL8y6O3QejlMO
	Sb0Qj47M=; b=F8eRlO4wD2jpWrUn9CvRpqCRknr9WYADeYRL8MV2U078CqToF/9
	660Dy+ltc6rmBUnKJK+8qNta64ROlg5g0gftsX6ApnbHpXzE4Rsr0NqMcsbh1R8S
	WFaQgi8HTJCmjvO+goj/KEx228wyEMKI/0N1oNu6d+q4Sj5oi93jCl4sqH4JDHQC
	nhmsuUaFHBRqwxr6WCZZEUWMuYKeUB5ehWWGHeooLP0XenkUkuGBRE/IG0nfEjtv
	80ZmxC/sZ7YuVP4OQz01C4BtUsexgu9WTKId3dEshpiBvjGSO4ixkS4yuzCdUtuT
	FGMPZGpJKioSumj6H4RfPPWk2KVONa8p2pw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52bhnc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 12:06:48 +0000 (GMT)
Received: from pps.filterd (NASANPPMTA05.qualcomm.com [127.0.0.1])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57KC3LqA027892;
	Wed, 20 Aug 2025 12:06:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA05.qualcomm.com (PPS) with ESMTPS id 48meaqyk2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 12:06:48 +0000
Received: from NASANPPMTA05.qualcomm.com (NASANPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57KC3FZS027805;
	Wed, 20 Aug 2025 12:06:48 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by NASANPPMTA05.qualcomm.com (PPS) with ESMTPS id 57KC6kWZ032532
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 12:06:48 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 30C9B22A91; Wed, 20 Aug 2025 20:06:45 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v5] Fix SSR(SubSystem Restart) fail when BT_EN is pulled up by hw
Date: Wed, 20 Aug 2025 20:06:41 +0800
Message-Id: <20250820120641.1622351-1-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX2HQiRrxSrc8E
 DGUB1ZoI7UZG1Ff8LBR4NGkHejtwpFtnSE76F+pDVn09YBNiGuhWLaQGgJpVbK0PSzeRfYuuewc
 Vv9kSvVfJ6O3VyxwWxN5zxfi6714qosv9tGOy6iA0tzqO2ODdBNGT3/WBPs28NsHovtsNnX01ME
 VtBIlQHN2E36YqTs0oVLOTOfeuayqHiB2bAAnu5GO/aoGvlzUovAy9KFTd5pixoloo4o2e2pKIj
 LGGYN61ozk7t5Rgxd09G9G2LWCCDnhMW2jbML3mPiny9JUXUfPQ2xiBOwbX800AvKmTjeQDubjD
 Wvm9PpAhNyeA9hmTDl49FLJY82ev6UE0rQIRPTbzSwcKF+cayYnnJbf8V9tn/5+gs5Z4vo0wArB
 czss3PNx5ud2tBLqtsl/0aFHUaAyjA==
X-Authority-Analysis: v=2.4 cv=cr3CU14i c=1 sm=1 tr=0 ts=68a5ba58 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Zh3eq0SbisOj6M6HGuUA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wCWz2DOoLEO6Ye70j0f_7Yc4ylPZjKqo
X-Proofpoint-ORIG-GUID: wCWz2DOoLEO6Ye70j0f_7Yc4ylPZjKqo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

When the host actively triggers SSR and collects coredump data,
the Bluetooth stack sends a reset command to the controller. However, due
to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
the reset command times out.

To address this, this patch clears the QCA_SSR_TRIGGERED and
QCA_IBS_DISABLED flags and adds a 50ms delay after SSR, but only when
HCI_QUIRK_NON_PERSISTENT_SETUP is not set. This ensures the controller
completes the SSR process when BT_EN is always high due to hardware.

For the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, please refer to
commit 740011cfe948 ("Bluetooth: Add new quirk for non-persistent setup
settings")

The HCI_QUIRK_NON_PERSISTENT_SETUP quirk is associated with BT_EN,
and its presence can be used to determine whether BT_EN is defined in DTS.

After SSR, host will not download the firmware, causing
controller to remain in the IBS_WAKE state. Host needs
to synchronize with the controller to maintain proper operation.

Multiple triggers of SSR only first generate coredump file,
duo to memcoredump_flag no clear.

add clear coredump flag when ssr completed.

When the SSR duration exceeds 2 seconds, it triggers
host tx_idle_timeout, which sets host TX state to sleep. due to the
hardware pulling up bt_en, the firmware is not downloaded after the SSR.
As a result, the controller does not enter sleep mode. Consequently,
when the host sends a command afterward, it sends 0xFD to the controller,
but the controller does not respond, leading to a command timeout.

So reset tx_idle_timer after SSR to prevent host enter TX IBS_Sloeep mode.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 4e56782b0..403d65952 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1653,6 +1653,37 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 		skb_queue_purge(&qca->rx_memdump_q);
 	}
 
+	/*
+	 * If the BT chip's bt_en pin is connected to a 3.3V power supply via
+	 * hardware and always stays high, driver cannot control the bt_en pin.
+	 * As a result, during SSR(SubSystem Restart), QCA_SSR_TRIGGERED and
+	 * QCA_IBS_DISABLED flags cannot be cleared, which leads to a reset
+	 * command timeout.
+	 * Add an msleep delay to ensure controller completes the SSR process.
+	 *
+	 * Host will not download the firmware after SSR, controller to remain
+	 * in the IBS_WAKE state, and the host needs to synchronize with it
+	 *
+	 * Since the bluetooth chip has been reset, clear the memdump state.
+	 */
+	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
+		/*
+		 * When the SSR (Sub-System Restart) duration exceeds 2 seconds,
+		 * it triggers host tx_idle_delay, which sets host TX state
+		 * to sleep. Reset tx_idle_timer after SSR to prevent
+		 * host enter TX IBS_Sloeep mode.
+		 */
+		mod_timer(&qca->tx_idle_timer, jiffies +
+				  msecs_to_jiffies(qca->tx_idle_delay));
+		msleep(50);
+
+		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
+		clear_bit(QCA_IBS_DISABLED, &qca->flags);
+
+		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
+		qca->memdump_state = QCA_MEMDUMP_IDLE;
+	}
+
 	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
 }
 
-- 
2.34.1


