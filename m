Return-Path: <linux-arm-msm+bounces-71001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 279F0B37FD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 12:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5D523B824B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 10:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6A82F1FE6;
	Wed, 27 Aug 2025 10:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QZDJAr+E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0943023D7EC;
	Wed, 27 Aug 2025 10:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756290330; cv=none; b=KF1z9BluPBdlpgAgFpagbj4JGbdJxaOkfcibN4tEXESUy1PaHjnfBbJwCREvpBwRPisDKxsm5qo2ND+j2iqCpiSZkrfu5IqWgknrj/HqTPSjQkkEL3aTFhtgfuP7CFjYCqED3Quwv2dUolSCRL+dXySKeM8w9hWATyBebD1bKTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756290330; c=relaxed/simple;
	bh=WECNxR80yEsMmZCFgrsq9NZC+dltMaq6d0aDT+T5ChM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BPncBZZLCcIIs6bJklqc0se1LLtQhv3H9tZeVDsvFc19kxaiVaFXtPlC/hkzNUasQMaLcHb5zykH82iwSoA2bQfKYbzad0GRu9HSFDrf1vNAo0DkY+vjkOMRcE4qT1uuOiJSg5+mzTHmckKWs9fu5ZHtw45AXylq5EHofG0pFZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QZDJAr+E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kMt2014895;
	Wed, 27 Aug 2025 10:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=26cwR5fHeg9uh4+QfgnvTvxx3M1y6aiB9h3
	YcFVNVzI=; b=QZDJAr+ENrf2gmCm4jgQ/j5ECoyNi1MKXf0h6WH7yXLzpGPKpdh
	sPnyyVpUh0xB08/fuhtW5XQI9EX3vk+fApBP06mg7wfu4s/C6eXwREnKcyG7XUMF
	7xSFqXpwZ3AtMFDPdUv+EU/iHjCTCEJBRtvvcn0dhloJxoZzscDrp+fm20LO9oFZ
	dTdkSdg3jG+EqD8WDXM/9HcR4DSf0pQsUnERKAJ8GI58LtPIVz4J/8wfPhA4yxU9
	LgK9tDMYNUy8UbTrRfqYcjitDxCiG+iV+Gu+HO3k2Nq+wtF5fucLFvmYQsIm7CFu
	f7uNsX1WMhfnYeWAk6t864t/Hh9trw7pxkQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5we4437-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 10:25:25 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57RAPMtL027536;
	Wed, 27 Aug 2025 10:25:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 48q6qm0mb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 10:25:22 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57RAPMqT027530;
	Wed, 27 Aug 2025 10:25:22 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 57RAPMtI027529
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 10:25:22 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id E38A52291A; Wed, 27 Aug 2025 18:25:20 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marcel@holtmann.org,
        luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org, stable@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_chejiang@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v11] Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail when BT_EN is pulled up by hw
Date: Wed, 27 Aug 2025 18:25:19 +0800
Message-Id: <20250827102519.195439-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-GUID: 99Ic9prYyiajxWR3acTWL2IDkeaAXJdt
X-Proofpoint-ORIG-GUID: 99Ic9prYyiajxWR3acTWL2IDkeaAXJdt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX9/GWBT3nlrOW
 slXO6gfBC01yuyjQWw+clKx0GXR5j+EGZ8o0mvO1LntjBLC9D+YtTILDJZ1gQ0xkjmJq2xh13SJ
 +J7l3eRBAMGRYgxZdusCXTXg8p428XBEfnquLhfesuylmKVNqq+nG1TWz505mOqXBJNS3LmIFBP
 9RK/Ld/odBDhGWenbQg2G5kyFhCJbfZ4+MVMlFg+q8m+wxYzNHZsL28RFyX46zl+65eN5Kp1Ej0
 0gLsI1KC67f9zESXer0WIzMI/2k6m+Zh5+fWIB9EPn0bzUX9lAAjPlzjYjaaa07UBvgKTP2ZFhi
 DcQdqVQQi8zstGsgm02WTEX+d6IyZJ06v+gUUp+20hIMW0/1gJ6I7azO0YvC6DipGC3QERXKFB4
 sxy4PUpC
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68aedd15 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Zh3eq0SbisOj6M6HGuUA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

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
Changs since v10:
-- Update base patch to latest patch.

Changs since v8-v9:
-- Update base patch to latest patch.
-- add Cc stable@vger.kernel.org on signed-of.

Changes since v6-7:
- Merge the changes into a single patch.
- Update commit.

Changes since v1-5:
- Add an explanation for HCI_QUIRK_NON_PERSISTENT_SETUP.
- Add commments for msleep(50).
- Update format and commit.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: stable@vger.kernel.org
---
 drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 4cff4d9be..2d6560482 100644
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
+	if (!hci_test_quirk(hu->hdev, HCI_QUIRK_NON_PERSISTENT_SETUP)) {
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


