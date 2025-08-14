Return-Path: <linux-arm-msm+bounces-69216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5E4B265CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 14:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58C8E1CC058E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 12:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22AF2EAB9D;
	Thu, 14 Aug 2025 12:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BHZvbysE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F127318157;
	Thu, 14 Aug 2025 12:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755175632; cv=none; b=tv9MZIssGFfJpscP4N3tBSPxKJ9HILa4nzMJl5eR90YV66hhovuTwnp72sKZKfPdJGQu8fFpNyFAHSkAEy5Dmxsb5x7ldi+kIPN1eQgIKbWRMxn0e/0Il3bwsg6x/14bafSWf/N/9zKUvJZt4tUg4xuVBg0RAx1WIx0XJyAXtgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755175632; c=relaxed/simple;
	bh=nhxxWo9mcWHUOU63UXrb3suRO0cAk+TPf0ApsE59IWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZGNuvBCeBMM+S2GUUD9R7MHriu8TnfwHW3QYTAy24W/H0UmYd9ope4dbjA4SbYLOmziBIbzVltqr/6+REb1yWGTQyRqycoyqfywhfir2J1r4X64ONUOFx7UHi29IZMfJevb7m0FJ5xe5MXLA+VI2+lgk4MEbsZVcCrV8QDOybUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BHZvbysE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9Cekc013008;
	Thu, 14 Aug 2025 12:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nfVo/j7lLsM
	8GVyC8GLfj+Rkk4HmIcZ2S8SsXA8CBTg=; b=BHZvbysEOJUc68OAElKGhm4nrNb
	CbyYdyiBQA6HKzUcH7+2PBHRg7SoqUg3gKDkvPFGXGr146m+bqWFe7StXNT+76ce
	FifOosSgQDbU7MSj0jUwtfO77GCOfUmvxrMcu7ewQv+B7dt0LFWd9MN3HrDLENNd
	KKDB4yFmgumXuyENz3QE+JrSnC+HZFv3FJqrt1WsCeTedyQP0rPNqiMg3dZ3XTFN
	Sehvhe5y1VdmmeuGopzOo9derO12cMACfzoAknceEYx9EiO/YQPUmxj6FXkFvl96
	yU7YxoWn35Yi6kWKHGJtG15oKicswTtkCVee9AmsE+mi257kdCqoag7P/dA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6uj4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 12:47:10 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57ECl8d6028115;
	Thu, 14 Aug 2025 12:47:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 48dydmgwqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 12:47:08 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57ECl8tr028088;
	Thu, 14 Aug 2025 12:47:08 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 57ECl7Yf028084
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 12:47:08 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 1120322C31; Thu, 14 Aug 2025 20:47:07 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v4 4/4] driver: bluetooth: hci_qca: SSR(SubSystem Restart)process failed due to tx_idle_timer timeout
Date: Thu, 14 Aug 2025 20:47:04 +0800
Message-Id: <20250814124704.2531811-5-quic_shuaz@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX1jObJou/U+7J
 RszavhmLNq2grsVyeJtOnCGZyvcOY8Wn7ooDhLO8Ph5dKgYCSdfmVzVMTSOPzW6lCVat8G0IA5o
 RrkRdq96dbUc/pEinhcHBZGks0QJ4qzftYJVtRZRksop7f+ntp+coTy7XCm8299X5TIIACN3Jew
 5J3jaccZryv9+1Xci+1K4c56kzxtGIy+m40Zl9a4mBVTAJrLsL/szPjGJ83t3doXMm/ry+N9iXr
 Yf6svbSlwo/tmGL/dUKgMn0hlQ01d109H98UzifxSwHdv9Kyzdlk7ROZ+XkKtGcCLPoPQklXKCa
 Gy8zHCQsV2vBrp4dn5nxfzj6n4Q8onKgp3HQWA23bH3/t4p7Vof0na/aYqUCY7tm58u847JYdV8
 kaPeoalw
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689ddace cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=7-08G_DUf5nQLP0U7KQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wpPFtmvpi4QsXYcdrAbSKGzL2wPOXxHR
X-Proofpoint-ORIG-GUID: wpPFtmvpi4QsXYcdrAbSKGzL2wPOXxHR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

When the SSR (Sub-System Restart) duration exceeds 2 seconds, it triggers
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
index 1f7c1d621..660be5e11 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1669,6 +1669,15 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
 		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
 		clear_bit(QCA_IBS_DISABLED, &qca->flags);
+		/*
+		 * When the SSR (Sub-System Restart) duration exceeds 2 seconds,
+		 * it triggers host tx_idle_delay, which sets host TX state
+		 * to sleep. Reset tx_idle_timer after SSR to prevent
+		 * host enter TX IBS_Sloeep mode.
+		 */
+		mod_timer(&qca->tx_idle_timer, jiffies +
+				  msecs_to_jiffies(qca->tx_idle_delay));
+
 		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
 		qca->memdump_state = QCA_MEMDUMP_IDLE;
 		msleep(50);
-- 
2.34.1


