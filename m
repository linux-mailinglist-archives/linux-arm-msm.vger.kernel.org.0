Return-Path: <linux-arm-msm+bounces-69215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FC8B265C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 14:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A48DD7BDFF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 12:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF5D25C706;
	Thu, 14 Aug 2025 12:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hMJ+9wdJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E532BE571;
	Thu, 14 Aug 2025 12:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755175632; cv=none; b=IwgPopFkbLQ4boPopMQk2DnQuPfEuf50bcPQSPVLHCVvwKu7AhtqR2/Z5KG4aWTz0j9oANgjBHdOJ4vnLEMq6Afuz3Pclvkv0gPvcNpPPeqwJ3dHujx8MLC4spgZ1TubXe2f7TZku2uIWB0IB6+RcZDpid4wqvkiwEbQLV1rYVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755175632; c=relaxed/simple;
	bh=yy95QHcCpi76Q3L8QUncXUfEH22tIck4Gw3Yb4+0Aow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O97+118JhvP8/Vl9b/+mpg83TY2VBW/9YSxn5T2h7oh2JxD9iMNGUrzlV8kfz3bo0vraUl4zc78gWX3gRghnjVHb6cnoHcgiYSQEJN/VM/HGqALaK6QoErb7T05D6avr3o2CAa8y1gg6oRdePDgBt1RftRcQlFRxNxP2HbksIJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hMJ+9wdJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9pIgJ025686;
	Thu, 14 Aug 2025 12:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zSjWoxu9a60
	t732ZDS7e7j4XtZCfdf5TqHZAvAYYbpE=; b=hMJ+9wdJ6OG4amsNZa8iTi9ofXC
	gYgpzssSm1nipfpuppaWbhkTxnon8pExFkHeRg5ABY9/S1P3zfmYYxPC7fjaGXwa
	bJ+wZrVx+uIAVeZByT7U2PbNUCoZoFQYQv+aZnagauBBLEskbNeGCXkJ+gT50Zo4
	6C0gESGFWPU6DGqqZV3E/Ebr/HGpPRzRqaZyS4AEKH9qyusx57mC6V/ocni5jhuT
	jmTZr0LyKY4ajozjdfxGqEMAv+wftt6zJofr2pWaVBXiW7w8Fi/noR1mr1AELcvI
	vFe76/y2TRFdWY3VzbjNRDlXDsZxfFddBLprOfIaen9sxNnPkANfl1x1JbQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gfkv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 12:47:10 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57ECl8HD028100;
	Thu, 14 Aug 2025 12:47:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 48dydmgwqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 12:47:08 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57ECl8Ce028091;
	Thu, 14 Aug 2025 12:47:08 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 57ECl7G5028087
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 12:47:08 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 08AC922C1D; Thu, 14 Aug 2025 20:47:07 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v4 2/4] driver: bluetooth: hci_qca: fix host IBS state after SSR
Date: Thu, 14 Aug 2025 20:47:02 +0800
Message-Id: <20250814124704.2531811-3-quic_shuaz@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689ddace cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=AQ13XcH8FaIGztzd-yoA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX83PwwOGhrt5t
 9cVb4Q2YPStK2VdqpOZ+IZBuB3i0Fb555RpLhzNjHeXjijzroQH9QAD28LTcdSlHnNnwTrXxOwN
 urPuZphmM2RCesWNNNq2wh0J4np8oYniNWREwBXLVFjqZM4bOKz9cAEqZGjIRK+pAuu0J335QCC
 zST4m3JdQCWUZV9+4OWBLqE+ldrbdIV+S9tCAfXAZRDdqqsOprbsyzR5ZD3+s1Gem5Sh1iwNRE8
 BZeHxJ/e7uTefSEegX4uZ02Hl2ZrwAtyVcryUr29yqwr/TiEBU83j7JuSuTLkpXHZxkGf5GoReg
 5U1csYS57z7qy0Y/EtTaEzYEz5ciIUHD1wHlyZ1kVcfgASPQ+hHQlMw2QBuAfoL4N3C1z0XhZG+
 13iW05+j
X-Proofpoint-GUID: MGhj4oLhkXhFNEiiG9tWgK-cbP3AUygY
X-Proofpoint-ORIG-GUID: MGhj4oLhkXhFNEiiG9tWgK-cbP3AUygY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

After SSR, host will not download the firmware, causing
controller to remain in the IBS_WAKE state. Host needs
to synchronize with the controller to maintain proper operation.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 91009c6a7..d37cd2368 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1660,10 +1660,14 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 	 * QCA_IBS_DISABLED flags cannot be cleared, which leads to a reset
 	 * command timeout.
 	 * Add an msleep delay to ensure controller completes the SSR process.
+	 *
+	 * Host will not download the firmware after SSR, controller to remain
+	 * in the IBS_WAKE state, and the host needs to synchronize with it
 	 */
 	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
 		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
 		clear_bit(QCA_IBS_DISABLED, &qca->flags);
+		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
 		msleep(50);
 	}
 
-- 
2.34.1


