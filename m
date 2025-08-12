Return-Path: <linux-arm-msm+bounces-68774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 952BFB226D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 14:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF6C262309F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 12:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7F5218827;
	Tue, 12 Aug 2025 12:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MnJi7uzq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6DC1E7C1C;
	Tue, 12 Aug 2025 12:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755001780; cv=none; b=F9ntnrVIQagFUeADWW7+g5mSUpTLyGcXTy9nXxPKF7pGBtWF3ccIhwPMnnzdSaGAWtyyLH8XfYi4hfJyGDESPm67VUrX/1OCXZC/8IfCu5NrZgQnv4Dh65BKNYbdpG0TO37TtyepZiUoeNZc2DlUiCodlAymjYEETUQ5lwmNgEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755001780; c=relaxed/simple;
	bh=sAJrDqktkOOAcZeZFXAD7sFJwcoemUteBsMDRMNq0nA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I0eSSOOPH9QmADWIHqZZB9NaNVqDYVkJvYorZxHfmDrSQNXnQ0PBabILZw4HICKvrDU+1+9Jndsx7yXlwQ6pG1Z3zaCEPmh5WzIukg0dgVJjnvThnP3wAiOqWrcvZWsS2gIpQaGx5JT3/8SYkzB7OT2kd3G0Cy/bONVIj+roKpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MnJi7uzq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvgqE012368;
	Tue, 12 Aug 2025 12:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e3vf8W7LhRh
	4J4rwYoBuKKQ/5Hcwqd2wr5wdSxxq5yM=; b=MnJi7uzqmk6RANrZsZ4JxOrxPbr
	3WFWMjcvXTcbQ91vdiF0/eTKNAePbhhRHYl602jMPd8q2BjaPI1ZgC+cYbkUokdA
	HDTRNyWtu+wRTKz7pyRkx0j4Dy/3aZPaj8AAdSN+A6pyzBvI01xLxl6GapwD3EGM
	bZdYfvwW2BRzr4vL7i91qxDPNDFfdw1ovKupNAs2aZsAUYRZ00mmSwNL2S0X45bS
	TPpvxMVV32OD+aOUzcdNyammdhBEfytf3XUUA5bdx7HTmG9WQWOw21qMNgglEinG
	kh7ltnbtCdWdFBhSUDwFKaeODt20gOOyzjSNB5X/UlPaArlSVeiUqIYGnVw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv03uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 12:29:37 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57CCPlOG026122;
	Tue, 12 Aug 2025 12:29:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 48dydkvpgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 12:29:34 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57CCTYX0029635;
	Tue, 12 Aug 2025 12:29:34 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 57CCTY59029633
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 12:29:34 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 7976A22B1E; Tue, 12 Aug 2025 20:29:33 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH 4/4] driver: bluetooth: hci_qca: SSR(SubSystem Restart)process failed due to tx_idle_timer timeout
Date: Tue, 12 Aug 2025 20:29:27 +0800
Message-Id: <20250812122927.3183257-5-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812122927.3183257-1-quic_shuaz@quicinc.com>
References: <20250812122927.3183257-1-quic_shuaz@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689b33b1 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=7-08G_DUf5nQLP0U7KQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zLmrgCe5eOGvs6BqfgtTC6GUgYNsBUOr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX5USC7IWREHEr
 FHd5waT6BYmQ1i2FYcSQEDM9HvV3Bz4fHgmEttxX8zrJQPfZeK0UAi3QJC47/enhHDeqGnr6Oky
 JUCLJGy12pwnA3/hS+DkKwtvOXxand+7DzMSygURNlXxQA6j6E9gloil7BXhcSTBa+OU/mhIe/O
 NDaDGLHlE/ft/f+eWfN4O7+ynyu8iy9Ql3ZUlQrAL1vdedgeQqeGiGIMKbB2t6NkG4uRtvC7eAi
 NJYanMEs4azNSFUcygWR58D2ZCZvbJQJt4irkRW7BvnxNNKCer8gAjFx6nyOfEWtDdcDtLQ0jrV
 FZVSaasAsImtfFTJWzn/MtoWsqfPQtUSYc1zXwbnyIShL9JfsImSe5z+e6tWWWqJvXsz4QEcMdo
 CY5MjMF7
X-Proofpoint-GUID: zLmrgCe5eOGvs6BqfgtTC6GUgYNsBUOr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

When the SSR (SubSystem Restart) duration exceeds 2 seconds, it triggers
host tx_idle_timeout, which sets host TX state to sleep. due to the
hardware pulling up bt_en, the firmware is not downloaded after the SSR.
As a result, the controller does not enter sleep mode. Consequently,
when the host sends a command afterward, it sends 0xFD to the controller,
but the controller does not respond, leading to a command timeout.

So reset tx_idle_timer after SSR to prevent host enter TX IBS_Sloeep mode.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 33c2dd7b8..1fb8eea09 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1668,6 +1668,15 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
 		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
 		clear_bit(QCA_IBS_DISABLED, &qca->flags);
+		/*
+		 * When the SSR (Sub-System Restart) duration exceeds 2 seconds,
+		 * it triggers host tx_idle_timeout, which sets host TX state
+		 * to sleep. Reset tx_idle_timer after SSR to prevent
+		 * host enter TX IBS_Sloeep mode.
+		 */
+		mod_timer(&qca->tx_idle_timer, jiffies +
+			  msecs_to_jiffies(qca->tx_idle_delay));
+
 		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
 		qca->memdump_state = QCA_MEMDUMP_IDLE;
 		msleep(50);
-- 
2.34.1


