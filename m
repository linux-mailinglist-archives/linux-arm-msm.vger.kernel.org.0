Return-Path: <linux-arm-msm+bounces-69219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 383C7B265D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 14:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C7F95C6478
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 12:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EBE2FCC1E;
	Thu, 14 Aug 2025 12:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UQn4NKyF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8A324293B;
	Thu, 14 Aug 2025 12:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755175632; cv=none; b=BGUr01QO8pb4XiqSx44epglkRzX8UGspbD2RC4C8YUoV9U0ook4wIq70opqRgAmKkuhHS0bD4bNVhGJcZKlCHn30tiSfz/cKJ0Ygo9FR3zq9I91tGN4mHXKwmZVSqr1KPnDcJq1GeGmz19hrrs6INmRtqmYqFn8Xr5xCTp/1aKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755175632; c=relaxed/simple;
	bh=GSEABq/X9uMQDH0d5uUEbzSUhiyQ9fZtpKtiYUmfHgc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F03TW50tnD3lTX29R2xfH1AOIFkRYh4hMEAj9emBkgFh8dXNHPauWp1ZZ43TjPWguSLBpChD8k9lYy6YnhmOxZ9wWTXc0fgicMEb9qM6bK+af6tjWCWJmHjmmku4InZ0g9+En4zpk11q+HzyuZL+boA6pGVjzMScAx6WxGMnhw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UQn4NKyF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9SESw012988;
	Thu, 14 Aug 2025 12:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yBv92asOwYi
	95tZcl5aCm1IDDrUiNQ42anU6ay0hD8E=; b=UQn4NKyFWHWdu4EY65ijQ5b5KAM
	aC+btycHLG6Ui+pnZ+MNRpo+E+25I3L8NnrIC5Ev8kzQA/ZNEenqIPjXA+vce+n6
	AerEltfDTaDn3gnSe7gKgbulzaVxNbX6rM/DuTVvwRriAfwoeoIpRaiZ/N0OggZe
	ayyqPECJwfuG1LH+5SHmVBO4m7fdCEcmAEjHRyhmuVxU6+oWuTRzmz6dcg16W4MK
	4he+QQbWrxG+rtncMy9rnIAxOVG+Ixp++K3vv6oHyuqn+3VKasTXg4aJIlFljjHB
	9iLWuqUqiU5OJoPsXwtSMxv5r3l3nmym2Dezpw2fyJT/ez+0IFjub6bltkA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6uj4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 12:47:10 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57ECl8RN027997;
	Thu, 14 Aug 2025 12:47:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 48dydm8hng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 12:47:08 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57ECl8sv027994;
	Thu, 14 Aug 2025 12:47:08 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 57ECl7Eb027993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 12:47:08 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 0CD4722C25; Thu, 14 Aug 2025 20:47:07 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v4 3/4] driver: bluetooth: hci_qca: Multiple triggers of SSR only generate one coredump file
Date: Thu, 14 Aug 2025 20:47:03 +0800
Message-Id: <20250814124704.2531811-4-quic_shuaz@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX2kfLUWYh1E7I
 dEkw9e2VP5VMI99Ip79ggp/puYIry9B1dZTlD4eZXn27WC8itF+aIPuTXd97H9ic+F4rqSryNp2
 OIGiD/RXlXeMv8VQnnnUSTJ0egnhkFc+QzJvXq2nslC/CWtwDM/g5ZVsI73rVpRuKEBz6UIXMJF
 wNPRGOhE7tQSi5b0Qw/yolzvXSk4+U3oa+/Wnz3lBPZbvK/6NKi8hf97F0pflJbvEyU8EOkUYh8
 C/vJoXGl34Kqgv0UKZBwuBUOsY7Hqz00+77t4SierOflmiR/SgoQfJdiXxeNj0FVjIiCUu4svv1
 o2QBjNXz6TtSbPL/6+JFW/KySjcOFSMeWqXulN5lD5NMLxrBMn6FL2oGptHWzp2Klddwcxjmmb/
 a+69L/Qd
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689ddace cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Z2vcJYTkWAVNmr-hFscA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YffAp9AAFCQKVcF_WBEHaQF99NV_DeAz
X-Proofpoint-ORIG-GUID: YffAp9AAFCQKVcF_WBEHaQF99NV_DeAz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

Multiple triggers of SSR only first generate coredump file,
duo to memcoredump_flag no clear.

add clear coredump flag when ssr completed.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index d37cd2368..1f7c1d621 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1663,11 +1663,14 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 	 *
 	 * Host will not download the firmware after SSR, controller to remain
 	 * in the IBS_WAKE state, and the host needs to synchronize with it
+	 *
+	 * Since the bluetooth chip has been reset, clear the memdump state.
 	 */
 	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
 		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
 		clear_bit(QCA_IBS_DISABLED, &qca->flags);
 		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
+		qca->memdump_state = QCA_MEMDUMP_IDLE;
 		msleep(50);
 	}
 
-- 
2.34.1


