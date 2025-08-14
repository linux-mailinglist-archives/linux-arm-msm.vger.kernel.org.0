Return-Path: <linux-arm-msm+bounces-69218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04405B265D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 14:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D3791CC0738
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 12:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEA52FC89A;
	Thu, 14 Aug 2025 12:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DSAURyU0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345593987D;
	Thu, 14 Aug 2025 12:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755175632; cv=none; b=m+1OpP0CUms/lWjWOfcPVkNgIftONT9TjRIagb1pVgk4vTBUgoc4CBoWRqdbcduUT8RM6r6rjQnu/PKVmRtq/CkLMzDtEVzN2ziHuHPoP4NeyAW0Su07U+qrXRzlpDTRXYUqq1ddUegic+37AR1/+LzSmGW9bZvV6xetfv51csk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755175632; c=relaxed/simple;
	bh=J7Iy5u4oZ4cGqX9TfdfYWYubTIxko2ZHMEnAWXg36T0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VH0ZsSWYWBkoofIiaIL4P+FqBAVc8ivtYu8i0ZSs/kVXcc44D/RhrObnjvMyi9v5mhkOTcwWQOvf5ytP7RII6s64jiJ/JUJfzBA1bR10bpGmAeH8AB2zknN7z2YBBkxF5900T6fRhPOxsNgsW89VVrBC5G5e1gQLbYc5OsIociY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DSAURyU0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9Se3P011665;
	Thu, 14 Aug 2025 12:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iIrnF+y0BhL
	IljY1oqXgJYNFfxR1D3Sgq7BJUxsPG7I=; b=DSAURyU0WLFuEZZl1/DqTatDQ6Y
	2iJkZ3dyYHMMI9Zl+bdcwdELsWSwuDuCRVi/ZbIeGXIVaJx9kX3XuT9vQ5tuQPwy
	qw5wfge5C763Ob+PHf7sr5/FsJm4RIWhlAXZR633tRURMYE9e/Ad717Ad9aIfhQ/
	CChj18n9oy9DVFj4BvjKnegWkMTjaTd0baXpue6n+vnzbdv8mPbRpvPM8xVhDFk4
	2OzyMHzZ235bsV5+LMOon2jjth6MzzUMv2aCWPxFy1b67q44DDJNK2Zza/8W6gCl
	lof/tJm23h66cDM4HLSzfw7/Do9bAW1Z+V6SkR2Po2sSkEriUxWmIj5h1hg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbjugf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 12:47:10 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57ECl8d7028115;
	Thu, 14 Aug 2025 12:47:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 48dydmgwqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 12:47:08 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57ECl8oq028089;
	Thu, 14 Aug 2025 12:47:08 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 57ECl7EK028085
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 12:47:08 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 04C4C21D7A; Thu, 14 Aug 2025 20:47:07 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v4 1/4] driver: bluetooth: hci_qca: fix ssr fail when BT_EN is pulled up by hw
Date: Thu, 14 Aug 2025 20:47:01 +0800
Message-Id: <20250814124704.2531811-2-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814124704.2531811-1-quic_shuaz@quicinc.com>
References: <20250814124704.2531811-1-quic_shuaz@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689ddace cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=zxD9FIJ19wtIjsr7aRAA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX2zBVHB6VCmMy
 9R2wiE3vHUigJdbq/aybVmM8keQtC567CrepURCro4tvxztgkERejX3BUmgHIFikouRJRAUbrsK
 vYW3DKxF7FTHQI12SpQ+JBxg/6EEqGxfaG+OiXrjC5NVeQAYY+qfjOJLozmge8TuMAJaJn5j1t4
 ZsXtmdxFH0rv5UwUCdCNvGrI3Plwflb0uyPYBUR4oy1X0yHaY5nPIS6yyd9NEu2159ZHdte4qIF
 q+ZHXr6lbQPNbesLBA0RTxFbBl9p0YTBtpYluI8NCXFTMQKtSvAY4oO1/2ss+vkt/iG7vjJXibe
 Pz8pcIG7XUoXccuNsZ53H3Cb+IqpphRt59QRhq7ARjV/tHu0fCuetWDAI3UrbeaDRJDDBWSFBdD
 zjTOstvX
X-Proofpoint-ORIG-GUID: -tdnvJ88QWqUlXWVmLIdF-637jtQ2vii
X-Proofpoint-GUID: -tdnvJ88QWqUlXWVmLIdF-637jtQ2vii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

When the host actively triggers SSR and collects coredump data,
the Bluetooth stack sends a reset command to the controller. However,due
to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
the reset command times out.

For the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, please refer to
commit: 740011cfe94859df8d05f5400d589a8693b095e7.

The change is placed under if (!HCI_QUIRK_NON_PERSISTENT_SETUP)
because this quirk is associated with BT_EN, and can be used to
determine whether BT_EN is present in the device tree (DTS).

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 4e56782b0..91009c6a7 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1653,6 +1653,20 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 		skb_queue_purge(&qca->rx_memdump_q);
 	}
 
+	/*
+	 * If the BT chip's bt_en pin is connected to a 3.3V power supply via
+	 * hardware and always stays high, driver cannot control the bt_en pin.
+	 * As a result, during SSR(SubSystem Restart), QCA_SSR_TRIGGERED and
+	 * QCA_IBS_DISABLED flags cannot be cleared, which leads to a reset
+	 * command timeout.
+	 * Add an msleep delay to ensure controller completes the SSR process.
+	 */
+	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
+		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
+		clear_bit(QCA_IBS_DISABLED, &qca->flags);
+		msleep(50);
+	}
+
 	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
 }
 
-- 
2.34.1


