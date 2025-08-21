Return-Path: <linux-arm-msm+bounces-70157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4C3B2F7AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 14:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DF451888CCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583A63C19;
	Thu, 21 Aug 2025 12:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n2bTW5F4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D324C9D;
	Thu, 21 Aug 2025 12:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755778599; cv=none; b=gAaYqNHW5WYhvwgtcJnaqOLnLd3H/PU9WYNaYNRLWavPJPnhn8IeX4VIyW8FEnT1H0tKOibqtBHrWpPgP/jKMwqhxAmZUP9Npnl9cMZmodHJgH5d2XZ0Yz7coWoWklmHuoJxRw+pq99jfs8cKggsuU3JHk1bcQA1XsFxpTdLBTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755778599; c=relaxed/simple;
	bh=+3GD7TzyzN1hp52chJbQNaT204DkAVn9fTVWn2s9rIE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OGjHugE4FPucXOSDdXXvdhgjtGzGE8qoJgj4BATfNN3eoPQK+KzaeGi4q7WkIFFOHRTOeYzmu3sLjFLGwEa5UyAo4PBIjsd0ahczyC2aQWRiBMOPtxZG/68kBLsFKvfGI741fgcFRFpglYWlH71r53ezFvv0sdxR4AdYH4JURxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n2bTW5F4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b9Mq012918;
	Thu, 21 Aug 2025 12:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QTkfN012JLVmsopUmDkmnS5cKvt0oC5JM6u
	hFBfTuYM=; b=n2bTW5F4hIsNyKaUW/v+A5COAPBipUEIOkC72LPMeQobTMHBCpF
	fTs7oXFUMV2cwmLq+F604qLHtCIXmRkHXo1NmCFQyuYEN5Dzn9GlqgPrHkNB/DSj
	GMWUa50m1eGWiZzNmdf3FIBkd9JusyYJ/ZzMzE+/mFjh9xI1fZ6bSZJ724EdMNBa
	6q2AbSibN3W/6cqUdcnyeWQYhV7H2uqPcvFF+GJRp2+wkQ+el+v/4bIOc5ey2TJ4
	51bkY7PFCVVqTsKoqyBrZWR8hEw5X0KImCHpjvdn50rVLfjU6EBt7GzFE79UxjPc
	ec18mg4so8R8dxfm0nkDNhG+3la8bnWLDGw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dn8ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 12:16:36 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57LCGXkd015249;
	Thu, 21 Aug 2025 12:16:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 48mvc92ufc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 12:16:33 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57LCGXZf015242;
	Thu, 21 Aug 2025 12:16:33 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 57LCGXk7015241
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 12:16:33 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id B6A702289D; Thu, 21 Aug 2025 20:16:32 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v6] Bluetooth: Fix SSR (SubSystem Restart) fail when BT_EN is pulled up by hw
Date: Thu, 21 Aug 2025 20:16:26 +0800
Message-Id: <20250821121627.2727387-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX5TK4GQrTzKVd
 744a+PyF+TmgPyCpHd+Yrhc8o+uENipgyZVQIOVZ1rvk4ld4hrkVHuBezNiD1dBz/+d6VEJZxgh
 gfA5IjIeRDW+50CK5Rmtsmm6R+Ny0SFm6XNzY1yvwjEaiVJTlnxbHyrmWMtJo3hUIoWMLxntoi5
 VZTGs1QthvmQPNVpDagezdpCGcuvbXKvY4558WEVx8Ig+HXID/+uRf3uVP7ZFPxcqejNcVhrdX3
 5vfY4u1spCU/G76+wa2QVnzJYDF38fBcNNAjaYxrU/Sa/JDXysHemBiNdjFsKsEWOw5/Yfnj98b
 UO9IptfODRt+7Rdzd7StV8Oe6NATNnTCv8mBvDFnb9QSy1OUJNOHy0umz1wKUcUKgFZzuWylaA1
 I3G4YxrFcG85TpKs7DUW47VcJkRaPg==
X-Proofpoint-ORIG-GUID: Cbpk3Z0VcB5CacVawEy3FP0RMhz2n1rd
X-Proofpoint-GUID: Cbpk3Z0VcB5CacVawEy3FP0RMhz2n1rd
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a70e24 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Zh3eq0SbisOj6M6HGuUA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
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
the comment in `include/net/bluetooth/hci.h`.

The HCI_QUIRK_NON_PERSISTENT_SETUP quirk is associated with BT_EN,
and its presence can be used to determine whether BT_EN is defined in DTS.

After SSR, host will not download the firmware, causing
controller to remain in the IBS_WAKE state. Host needs
to synchronize with the controller to maintain proper operation.

Multiple triggers of SSR only first generate coredump file,
due to memcoredump_flag no clear.

add clear coredump flag when ssr completed.

When the SSR duration exceeds 2 seconds, it triggers
host tx_idle_timeout, which sets host TX state to sleep. due to the
hardware pulling up bt_en, the firmware is not downloaded after the SSR.
As a result, the controller does not enter sleep mode. Consequently,
when the host sends a command afterward, it sends 0xFD to the controller,
but the controller does not respond, leading to a command timeout.

So reset tx_idle_timer after SSR to prevent host enter TX IBS_Sleep mode.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 4e56782b0..9dc59b002 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1653,6 +1653,39 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 		skb_queue_purge(&qca->rx_memdump_q);
 	}
 
+	/*
+	 * If the BT chip's bt_en pin is connected to a 3.3V power supply via
+	 * hardware and always stays high, driver cannot control the bt_en pin.
+	 * As a result, during SSR (SubSystem Restart), QCA_SSR_TRIGGERED and
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
+		 * When the SSR (SubSystem Restart) duration exceeds 2 seconds,
+		 * it triggers host tx_idle_delay, which sets host TX state
+		 * to sleep. Reset tx_idle_timer after SSR to prevent
+		 * host enter TX IBS_Sleep mode.
+		 */
+		mod_timer(&qca->tx_idle_timer, jiffies +
+				  msecs_to_jiffies(qca->tx_idle_delay));
+
+		/* Controller reset completion time is 50ms */
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


