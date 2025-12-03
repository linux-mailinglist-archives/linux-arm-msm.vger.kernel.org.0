Return-Path: <linux-arm-msm+bounces-84138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5910FC9DA91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 04:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C402E348DAB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 03:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2287225392D;
	Wed,  3 Dec 2025 03:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmbS9j26"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733B923908B;
	Wed,  3 Dec 2025 03:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764733048; cv=none; b=pPZR0ujvOuwjUMBvEjGlHWZTZIW7nPQcqPb7M6Hb5ItadTLbbFsxXdA/k/TVDFG7Rinz5RmWwk25FJNI6c7+Wr9Kg8hBWTEolhum27IiPFlpGpwTCJCsDiUfjVd84HygCz5iUY5iqESZHRdxGIGZwqOzHFZm/KoVZa5aZphnW5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764733048; c=relaxed/simple;
	bh=8LYbJtgnEAhoQDdSY/IcYhsNjJ0/KYN8OcHCXlwqTks=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kKoSxI96/V8scbLCMP9nTOQEeK/F1lgFzneLUjJOEDGI68JO/osNgzTNH2jBqD7dzbvJIRDdhsbZfQQK4QXQ3a7qzL9kBXA2cBBQhpf8Yx29bhQ3LFRroJYB2wy4mFP2z/X5pJAAhKr5dGYThplz5rUq+JZfEdtxva6FEYxP/cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmbS9j26; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2ISl1L4130365;
	Wed, 3 Dec 2025 03:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1kf5kH9SgOT
	+bLrCJflerNmHyJAP8uxLoRhy3DGFocE=; b=CmbS9j26ZNm3mybGodXNjmiByml
	PQeoTTdOCmEpxjmGSPS0bTmlWCfk/9DNvwQ7tdMz0Q23XQapPg27szL6lAVlw/8w
	KoaGKx+DpVptIM+0p3gxUDuRHEtyREqPsyUgnEhniF2odmsiZWav54t1dK4XB9qJ
	HNwB0qwmfkTPwdgPOhxVx38xHr9vynPAltZv7nhKH3SlhZ9opNvA/r3ekX988Qlt
	q64q/HW5IGe+535pbOdqLbS3BiD7DqL1EnIOjy7TR8u3etPe8rNkfnrejYn0JPg9
	3A6OVmbJYg9MQShRYE50Pxk6TuNFKXjDRzJQDqxY1kXjeLDwhJzCX3JtYWA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at5e79avg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Dec 2025 03:37:22 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B33bJHb015805;
	Wed, 3 Dec 2025 03:37:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4aqswm45wu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Dec 2025 03:37:19 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5B33bJci015798;
	Wed, 3 Dec 2025 03:37:19 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5B33bJhm015793
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Dec 2025 03:37:19 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 58B93233F4; Wed,  3 Dec 2025 11:37:18 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v13 1/1] Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail when BT_EN is pulled up by hw
Date: Wed,  3 Dec 2025 11:37:12 +0800
Message-Id: <20251203033712.446632-2-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251203033712.446632-1-shuai.zhang@oss.qualcomm.com>
References: <20251203033712.446632-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDAyNiBTYWx0ZWRfXwOelUHl5LgK2
 WVRkd0ZM8UfzuYJ7jK4/WJpjU7H2wifRoOJ6bHo9eUZ0JCNdP/cATpoLni6xZZCsFqkyJrM53t2
 Bt/AQJ38YxQzS2lH/AwFXQ1hCvht4ryE049l7ZeC9cHWaFrI2j0HfzCPFebw/Eg/UahwLDpZS02
 y8+x5pgdplejhJT3SCsoRyzZRhatzaLwM1hXqvtoFjk0RAu0fxBsANBKQ4O2rCLS9nlrbijuoTE
 Ixi6aSj40pGu8zJVbmmP67WzWzvWg/vCdVUmF72BIUj/EEq0B1ITOsaA8NLCeSx3Y2nL6+fYsIF
 yyqj9x/+M1jiC8LbVfpnt7HlTvJiyVf6mn/LrcX0T7t3QAaXBcZLodpHLlpD+WCxLxt+2m9iwA+
 H9dcHFtaUT0a3BeIrrsrl6VbVm3Csg==
X-Authority-Analysis: v=2.4 cv=KcrfcAYD c=1 sm=1 tr=0 ts=692fb072 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=i1iVT939vnhokII3DuMA:9
X-Proofpoint-GUID: Wjh8k2xOd6L4vfpobgMIZE3FHaGzYc9S
X-Proofpoint-ORIG-GUID: Wjh8k2xOd6L4vfpobgMIZE3FHaGzYc9S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030026

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

Tell the driver that the BT controller has undergone a proper restart sequence:

- Clear QCA_SSR_TRIGGERED and QCA_IBS_DISABLED flags after SSR.
- Add a 50ms delay to allow the controller to complete its warm reset.
- Reset tx_idle_timer to prevent the host from entering TX sleep mode.
- Clear memcoredump_flag to allow multiple coredump captures.

Apply these steps only when HCI_QUIRK_NON_PERSISTENT_SETUP is not set,
which indicates that BT_EN is defined in DTS and cannot be toggled.

Refer to the comment in include/net/bluetooth/hci.h for details on
HCI_QUIRK_NON_PERSISTENT_SETUP.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
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


