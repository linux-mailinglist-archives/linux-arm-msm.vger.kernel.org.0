Return-Path: <linux-arm-msm+bounces-73721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B32B598ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 16:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B680D16666A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 14:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98AB6341651;
	Tue, 16 Sep 2025 14:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CSfXvnU5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B04129E6E;
	Tue, 16 Sep 2025 14:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758031399; cv=none; b=oYWKoIcvoKt31M0zd4EQBPwfijsaHOecQIpwqNa1Pxv1UT+0tyTcIbdOQLsWoAleBxJNP3qpKOxJzwyX0j/k5J+SyhwGNUO7jDGSDeAzQ7Od5+Zb+J3Ikiee2Lcdvajr2OyY07BK7lMHmj4JrdnWdqcUe6FyWB8NH7T0yFHZV7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758031399; c=relaxed/simple;
	bh=lFV+fw+L8i1jg9c+p1LCKtySyEmUlzqQ14ODWK6gkok=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MtdjnYCs6a1u/qZVty5ROvnwSBUirII/rCTooGy4uNr/WlE1PUyVPKpiacCANCTmr5TgtckNRCyD49Fa31U6CTjpoms4Nj1YJL1x5J/Gzm41zs/rUl5i6jB/6Mz3/Pp9RBCXN3tP1gtrmhZQ3XdzA+pXLOEwKaMxvK59rpqzOGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CSfXvnU5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAKlDS020394;
	Tue, 16 Sep 2025 14:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=v8Tu5LUQavuzbEX1FDO9TFCB23DnjS203lh
	5d2K19V4=; b=CSfXvnU5gc46rbapwyfyBELUnEhb/1hCwvFt3/NS3O04Nvr2/eN
	slmvlMCaMBMHREWkdg8ASCIPbZc3jGuIhW8H/Ale27Xc3WvDkmLzj0esHvAZkO4e
	LxL/M5W1ODESLAwOlWvonKjZsdoF4qCeZ71ZFDqtHqPnSEoWd5VqwGZjkBGn8C42
	7S9LpkX3uFZv5USwP/VMJDcf2X4yiaNFp34SaUva8q20013ZAFMD6eAMJftTJ2cY
	RPU6xpD1tf9nNYTuSJwfJmpv6lK/0Vn3kMyUtGI2zaaslJpccSKxEJ+tqIhUKUtU
	4e9MpcueM0GlRyxaFCId6MIK/quIEcx6lPQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951chh0v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 14:03:05 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58GE32Bt019834;
	Tue, 16 Sep 2025 14:03:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4951pmcha5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 14:03:02 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58GE31P4019819;
	Tue, 16 Sep 2025 14:03:02 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 58GE31aQ019807
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 14:03:01 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 9781523404; Tue, 16 Sep 2025 22:03:00 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marcel@holtmann.org,
        luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org, stable@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_chejiang@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v12] Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail when BT_EN is pulled up by hw
Date: Tue, 16 Sep 2025 22:02:59 +0800
Message-Id: <20250916140259.400285-1-quic_shuaz@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=eeo9f6EH c=1 sm=1 tr=0 ts=68c96e19 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=i1iVT939vnhokII3DuMA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Ol-zXOWSmWPWNRGqDV8MgV1kQVU1yDx_
X-Proofpoint-GUID: Ol-zXOWSmWPWNRGqDV8MgV1kQVU1yDx_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzNiBTYWx0ZWRfXx9VA/G0uZM/F
 UWC6R8VkKKFYmtwA73vDw6y032wNfEZP8dEFhw1kC75mQEBCOin4YXvWO217qcOxVlCgy2dzo+A
 IgDwa4D4jMwQiOmOT3Yr5LWB/BkSy/4fLQzE4UkhoYAoIy68kROH3B9x8qoNhk+C8B2QJ41ABb5
 2glz2q3unbX+H5V/ByL/aqPHP0ztyXlWAFYLo83lCIf/1YR4dZiSO8/IbQg+VLdAUzlyfrGkZ5c
 YG5KMccD1Uv0XHX1JIAdWLmPnYw6piiK0xCK5MTPtGChKb6vaZBfqdVGbGEUO9XzrqIzQ9iXgwb
 SPLeXqgK2xV/hBy8n2GRH0NcCXZAzcpfJYTqQENUeMXCG3Oh0ARsofKd9xsOwB9yVVUF6aKG0xZ
 ZcmA8O3+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130036

On QCS9075 and QCA8275 platforms, the BT_EN pin is always pulled up by hw
and cannot be controlled by the host. As a result, in case of a firmware
crash, the host cannot trigger a cold reset. Instead, the BT controller
performs a warm restart on its own, without reloading the firmware.

This leads to the controller remaining in IBS_WAKE state, while the host
expects it to be in sleep mode. The mismatch causes HCI reset commands
to time out. Additionally, the driver does not clear internal flags
QCA_SSR_TRIGGERED and QCA_IBS_DISABLED, which blocks the reset sequence.
If the SSR duration exceeds 2 seconds, the host may enter TX sleep mode
due to tx_idle_timeout, further preventing recovery. Also, memcoredump_flag
is not cleared, so only the first SSR generates a coredump.

Tell driver that BT controller has undergone a proper restart sequence:

- Clear QCA_SSR_TRIGGERED and QCA_IBS_DISABLED flags after SSR.
- Add a 50ms delay to allow the controller to complete its warm reset.
- Reset tx_idle_timer to prevent the host from entering TX sleep mode.
- Clear memcoredump_flag to allow multiple coredump captures.

Apply these steps only when HCI_QUIRK_NON_PERSISTENT_SETUP is not set,
which indicates that BT_EN is defined in DTS and cannot be toggled.

Refer to the comment in include/net/bluetooth/hci.h for details on
HCI_QUIRK_NON_PERSISTENT_SETUP.

Changes in v12:
- Rewrote commit to clarify the actual issue and affected platforms.
- Used imperative language to describe the fix.
- Explained the role of HCI_QUIRK_NON_PERSISTENT_SETUP.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
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


