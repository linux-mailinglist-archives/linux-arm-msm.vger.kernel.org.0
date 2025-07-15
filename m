Return-Path: <linux-arm-msm+bounces-64919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7CAB050B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 07:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73EED1AA7738
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 05:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1942D3759;
	Tue, 15 Jul 2025 05:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RWXoI8xN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2591B2D3751;
	Tue, 15 Jul 2025 05:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752556601; cv=none; b=LN94tiyyB3FQ+m8bc0grvsXHj8qojoMj3J5I9Y0O9OjHHi/wjEORwAhtvkijAauKrfs8Gm15YYPRTyXHkx8ZBgOcOsLX20A+P92hf59yffpoeTHE+6Y7DBeDg/u1TwxnT5ClMrb+b15kupPjx2fhy6SLs9QL9G17niiucwFnNVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752556601; c=relaxed/simple;
	bh=XSkgauvtpmhc8i86TydDZJu2SQUWhHTpqLSHpuTq9+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cxvl7NcyuskCfUXqG2OfIBB+0a4ipu1qs7Rzx1vM+Dgn0fYL+Sagmcl471Ni41AEJQGCNpu6pzi3VqO5iffJM92g9Zl+xaUFdv/+bFp+IMZyDvwiY5RhCcJwgjXHE69tos/ssqx469Y/B9mdwU/xvZhKfNhrHoOmtiXwIpmxLT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RWXoI8xN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F4oOFG012384;
	Tue, 15 Jul 2025 05:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O3Ew/XtJw7T
	7rG8rIiYeIkIlU6KsbGpQngaWZW1zL1M=; b=RWXoI8xN/qNQL9kgD1sJ9trvPi4
	bCa58tO7HvwasjmRb6Yi6fvzEC0wkSj9UH2UWntNj/K6l/GzZv8/iIdz+T0iuam/
	ai1Wx7gUMkpGFG7Z1X8M0h7ssauXSIxiXZYo9h0VO5TdOragdWVuHZBlsznGvOOo
	0TO4T3dBnfoBZvyE7a4ljVgRhydMgowK9TZ5dmsbyB1Ng6IBi3onRbfAl7ye7dl4
	MwimvJ5JhRARegt1m+77vvfElUpm5oUmG1snfO4alQz2jvLYV3DuCkiXGMZa+0Zv
	HHMl0ler9uf01E0Bhq2KGZaJwN9If5IyBYBatVqr2XbeRNwsob9Q96ygeXQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w58yhqs5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 05:16:38 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56F5GZFF005859;
	Tue, 15 Jul 2025 05:16:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 47ugsmbjjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 05:16:35 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56F5GZcs005856;
	Tue, 15 Jul 2025 05:16:35 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 56F5GZu3005851
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 05:16:35 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 8531A22B2B; Tue, 15 Jul 2025 13:16:34 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH 2/3] driver: bluetooth: hci_qca: fix host IBS state after SSR
Date: Tue, 15 Jul 2025 13:16:17 +0800
Message-Id: <20250715051618.724475-3-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715051618.724475-1-quic_shuaz@quicinc.com>
References: <20250715051618.724475-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA0NiBTYWx0ZWRfX6wWCIMpTXeXH
 +XC5cdLv7oBAXFDFp0/3x2hdzLkiuGGcbu/5piyP62q3dFJxP1UVtmHhRZScpt743tDnTMEjQ0E
 eB1UDcbdMuO7sgVqxqRpUp1SaLeMFnSR0M7fRTyvISKQqamHdpaoozB3sm7juh6QENmfwOh/rzm
 fO+/HS4s0ZJgBRL2aaH69AanbztgEI7FsSCkScWy52T3V6NZYgmyomICfBGGCiovgXo+5Ei1H6E
 XpU/3tSkqUYI+/k0V0ed9hWL2Xl0hL+jaEav63+6AErHT/C3tKMyB1krgYLqLOowI3/jEgPeNaI
 URW2A2yNth/lR0G/+tMzr80uW549SIRZ9YgTOl00/8pk27eqAzU9UyYXl8mvS4+k4ts/PrU1wsv
 6qFchuRunrZWnZqQ/kNzyxEbyu8DnIlx4a0L3brFp2u9zbi21Bn4khN+X6TGhYpC3sFxIKqi
X-Proofpoint-GUID: lSV1eirbJdAzsf2Hq8tTlHRVhLoQ9Npe
X-Proofpoint-ORIG-GUID: lSV1eirbJdAzsf2Hq8tTlHRVhLoQ9Npe
X-Authority-Analysis: v=2.4 cv=Or9Pyz/t c=1 sm=1 tr=0 ts=6875e436 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=0QvOL7ISX7D0ise33CwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150046

After SSR, host will not download the firmware, causing
controller to remain in the IBS_WAKE state. Host needs
to synchronize with the controller to maintain proper operation.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 791f8d472..a17d3f7ae 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1658,10 +1658,14 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
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


