Return-Path: <linux-arm-msm+bounces-68771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A3DB226D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 14:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67069564185
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 12:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB0F24886F;
	Tue, 12 Aug 2025 12:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LoADWR5m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DA922154B;
	Tue, 12 Aug 2025 12:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755001777; cv=none; b=UUcs4I0SZvyjgw9ph8p8tJYcdspGtobHTAbGaOnyesOfdElMjtdMfdnGLjLHLewLvQOue3+U4Xc2NBSMPVv8Z9YgCgB1QiMHuffzkMOvXpMR6afroatvKAy/wnEKcXXdYt2jiEOQUOidQPIruq9zZqcULE+Wh9Fx5IthJ4P5pzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755001777; c=relaxed/simple;
	bh=/W1adCOJv3wLmC7VVdXsAo7RT4d/Lhpub4y9rZR0qCQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dv6q0/h1mk26ri9FbmEHTIht0OWD74f8a6Vvc7E2iD+ZspsFhDTsz3aLvM+QPYeaEfu/gN2xf89lXA8hdp1l8xBaY3yrBckiiLia4yuFMsI5oGRJFbwW6Y+G72PiM0LPXmfSALeLt3+Xi5bdVJ5/aYjxnzNkkn1iw0QigLQlbdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LoADWR5m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvf4V020363;
	Tue, 12 Aug 2025 12:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ONTm9qg7SPn
	VL/0BSObVUW367PVMY6bzajqeS8dDjHQ=; b=LoADWR5mAb3EmUEOfAYJ/7KREOz
	6iXIirvB0mQ2wfmO1bR+aalD8YuKCT56JC1dETqYlNyt/4cMjOcDFKhfyKMdmzsJ
	HGER99cF4XPMxg0vkFGLJ/6GVLcf6/YIzDze2N3iEHIEqHz3JEHEcT7bGJlb/dcJ
	xwxuBz1p/lxOlfyrtr3s4jpRj5N6ljDZGs5wHzRs01h9UwBDm/ADu4Yzvn52/qFg
	eIFFaSye9FuzP9uzWxe4gBq0L28rOcDrInend/eKJGK5m9zHFsGXSufzNYL1SPxE
	U9ZpoNVhL8XZXAg/Lx3UfNGrPx5AaP5bm0/cbPvA1Xs+LGohcoGxqUCMWVA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx69gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 12:29:35 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57CCTWGU029623;
	Tue, 12 Aug 2025 12:29:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 48dydkvpgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 12:29:32 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57CCTWgY029620;
	Tue, 12 Aug 2025 12:29:32 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 57CCTWsC029619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 12:29:32 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 4D99B22BD1; Tue, 12 Aug 2025 20:29:31 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH 2/4] driver: bluetooth: hci_qca: fix host IBS state after SSR
Date: Tue, 12 Aug 2025 20:29:25 +0800
Message-Id: <20250812122927.3183257-3-quic_shuaz@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX9wHce5VPrWaO
 Iz76vJr8K2NoI2k8Na6/AuBB4/cZM5ggQKFTqeXV9IEooIDRGcEsF303qYlUGKTL58j0VVJmHUY
 AiyHpPV1rKjTTt/uPPprfttKW+s8hA9kNs0E70YrFtiBqAQAoMxyrCtLovkiwBW2yOLL7xg/YlY
 698VT4jjBbA1vbTVk/pKrzoJT5G3J+FlZ7rJLM4Ji6qt/2PJMVzBu5uiE/2UgCCp4Kr2Hz1L21U
 wPjpwTQwtdyn7GdGagf+9zcjx2+Na+NprTtC68Vflb3aMkGv5DFYDgrAux/UDkb4s/hHxvWoN14
 58K7R01fWs6qoirq1GIxoLN1388K5aPVOvIZCHm+6+XPOx7mFxYc06iU9KfAFnJkLee+U31PWR4
 cg1PEY0d
X-Proofpoint-GUID: yPE_4FA_MTjiP_6dlso1S4cFe_rgfnJ3
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689b33af cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=0QvOL7ISX7D0ise33CwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: yPE_4FA_MTjiP_6dlso1S4cFe_rgfnJ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

After SSR, host will not download the firmware, causing
controller to remain in the IBS_WAKE state. Host needs
to synchronize with the controller to maintain proper operation.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 14b2d1bee..50ec9b155 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1659,10 +1659,14 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 	 * the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
 	 * This leads to a reset command timeout failure.
 	 * Also, add msleep delay to wait for controller to complete SSR.
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


