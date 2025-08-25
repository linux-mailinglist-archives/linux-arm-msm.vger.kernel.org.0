Return-Path: <linux-arm-msm+bounces-70620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B258BB33E05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 13:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 767382069E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 11:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F582E973E;
	Mon, 25 Aug 2025 11:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f6JL0nK7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4CD2E2F09;
	Mon, 25 Aug 2025 11:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756121424; cv=none; b=Vz0cXsXA7w63RzsyI5bIgDlhNobCMf6/dcue9c/nrOEUmJw0BuUN/483wlaGwP5U0IMTa5OMcVPXLzeTX9HfVENG+PH7ZRPY+fh04ex2raH2M+2492TXKCSZIO8fMRNNAnBwjmy5BZW4CyDmgqNOKIlt48eGJpiSWrRLB1AQOVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756121424; c=relaxed/simple;
	bh=Ny83tiZGpNxp13IMp+CrTsc7eF7T5EWs+SQHNSbWiKA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z8vkRG9W6xveozpw8MS4/w+hsW7lfd7ilbUy8WvZlZO8gocOXJ9IACfog89Dv8P/WwUDWQcSqBmkpOSeuifT0uBT3rq3vh8PRs2OeQhQIaewX0A/8+M4eL21koabgkBdEp/B0AZUY/H2KRdNSSJk7tBwrXlpcT3TGTlfZAaTJjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f6JL0nK7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8fWVb032260;
	Mon, 25 Aug 2025 11:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nC3ayrpJSnYb2t7PFiJ0C4DN9i54q7UNusB
	K4I28woE=; b=f6JL0nK7bSVzq05LYXrj9ynRMOWbMdJcuV9vl8sBfcjBOu5UdMz
	YXr7acYupEjOND0O0gha6T1yXZ7O1XgobjPoi1mRt3k8H8Dk3KZ5DPP+ZoZ/c96c
	zsMjr9cWjVAODi8Vi0MBW8vb2brU+RcOs8L+3f55eXU59xO3c4k5z/1+tEbUewKB
	DYKwdFqfS9kI0sbSz+DehGTrj/a5JN1oRAUakcL6E3MrkFta7kfa9Btm7lFd0ZIN
	7lXy4hbKXo0kFPydUNdXNk975g7KjRWalRdHU2T76XEHiCkxCOkKcndQTjUUjGiO
	0V+xRsAa94tsJdf+KSjTHv4JabDRz7Rt/TA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thvvc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 11:30:18 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57PBUBBL005864;
	Mon, 25 Aug 2025 11:30:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 48q6qkm43j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 11:30:11 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57PBUAM3005846;
	Mon, 25 Aug 2025 11:30:11 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 57PBUAoV005841
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 11:30:10 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 94BF222A9B; Mon, 25 Aug 2025 19:30:09 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marcel@holtmann.org,
        luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org, stable@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_chejiang@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v9] Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail when BT_EN is pulled up by hw
Date: Mon, 25 Aug 2025 19:30:05 +0800
Message-Id: <20250825113005.4015375-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX7IC2uNhki9Cn
 DdtkUMfUFfP1b0xJpuaBsUdYWeiun0lxvLdxViDYinETtuHVoDQvVXsRfsC3prNScqKqc15WDrm
 cQELZHjiUIAUO7K2VHYuuY81vkRl/2qL8GH0u8H4WtS2b1nXhk/8yBKrjj+EOzsHh0H1qJjJL2b
 lEzbCp79rhdfRBg29K82ip6rVjPK0iKQZSJVGxHmY34UmRGn+oSxHQpyK1C44Zw03xCXEv+ApDF
 fNcaRPKv4QJ5Bpq+JlogUOYR+4IPBmBEYDZULQklUqnmdj9kZrUuP0zUSZTrat2skKCW5oT5kSr
 jRpguSo5tjmYJV0XEJMdzzNU+VHbzCbW48AZBAynBliQRakvAtZ3WLykLCurp4kSdMOWfKNnTpD
 iJYPoDzs
X-Proofpoint-ORIG-GUID: 4jCZM0kX9zN9hcqNPWXHlHj652MgWjuK
X-Proofpoint-GUID: 4jCZM0kX9zN9hcqNPWXHlHj652MgWjuK
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ac494a cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Zh3eq0SbisOj6M6HGuUA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043

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

---
Changes since v6-7:
- Merge the changes into a single patch.
- Update commit.

Changes since v1-5:
- Add an explanation for HCI_QUIRK_NON_PERSISTENT_SETUP.
- Add commments for msleep(50).
- Update format and commit.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 4cff4d9be..97aaf4985 100644
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


