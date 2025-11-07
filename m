Return-Path: <linux-arm-msm+bounces-80682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D136DC3E38A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 03:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 772631885CC4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 02:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF982F1FE2;
	Fri,  7 Nov 2025 02:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mJaZk/BR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72AA26FA4E;
	Fri,  7 Nov 2025 02:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762481636; cv=none; b=eF0G0KHLUZ1SZyk8OjliEyCOIYJ5ip+8BQhHy6y2MlfjmQvSQyFXV5cqyxH6MhxqLYtlJDK5pb24ntj5RI4dRmT9+gr5rfcJktyGUDI7cRHmkEKVwFCPZF1B0rV7x09fbBPrDvMF58GuXefGs7E3XeKvSrYuarB6HqHKxM70xfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762481636; c=relaxed/simple;
	bh=X9R/ZQWOdt8n09fws3g4SuFInCqIiRcFmDI36CbBtDg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t2N6909X9lal9CMmaAak5sfeYS3ixkQvUKahEm4AVbgULEY2Zy5Yu9JNhy1tHR+by3aW73ir/g0H9BF2az9YPxj0iV8YHS1hFgwx4AfFI4e3PPn3R4JQL3XuzzeMl2B8BO/iKjFOtFcjwZARolfLOgoNfedyK7xtzHDApyrY0h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mJaZk/BR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6H3ns1557548;
	Fri, 7 Nov 2025 02:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yyShU7oxIVS1HxxAHS2zHkZ/mDoKpVXSN8H
	N4DeKOtc=; b=mJaZk/BRtaVEFz9kCJ9iR84XX7mIHoN4Xi7X8QNXoCnW8C5ndHX
	XNCix/YpQBAz9DYkzSXuswxfzuDoI6lprQkuMY9rH6CGm/39FweNG/XAqDtw9dqc
	0GTW8Unlnwm/bcNPDvMLBrF5PcqoJlcu4FPIi7nQ0hn4nlz+vYxSowNotGpGw3Ik
	kvP+yD6L4OLxgJA1+GBMEGPdHHblLakwhC1UajMLdYCUYYOTA8GaJ5qUA/aQcji4
	ScQUE4emtVbT99Jf75aB0oB20k5s5SHaXBND1sG204Jm9QKepIbBFCa1x3dyUfMs
	PQWHXOFIu5ARW1PnXiekPmIKozYGCFtlLNw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yr9sc7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 02:13:50 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A72DmFq025910;
	Fri, 7 Nov 2025 02:13:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a5b9nbjcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 02:13:48 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5A72Dm6u025903;
	Fri, 7 Nov 2025 02:13:48 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5A72Dm5I025902
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 02:13:48 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 191E722977; Fri,  7 Nov 2025 10:13:47 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_chejiang@quicinc.com, quic_jiaymao@quicinc.com,
        quic_chezhou@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v1] Bluetooth: btusb: add new custom firmwares
Date: Fri,  7 Nov 2025 10:13:45 +0800
Message-Id: <20251107021345.2759890-1-quic_shuaz@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=DrpbOW/+ c=1 sm=1 tr=0 ts=690d55de cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=FwBvamPKdgLavwmduaUA:9 a=zZCYzV9kfG8A:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: puVLsiBOTEaCg81mcRwBgR93ITFp6GW3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDAxNiBTYWx0ZWRfXwP9SsKUcOiAq
 Q9oAZeQExbSTMt8DZUdCTtAewU5sTTyAqggWxKlfP016uM0LqdTZ8syQhSvj848Cuo38kFXUGOn
 l8SJnsYynKw+DZO1pGZE7T6KqB6pI+PgDLJzxNAzKV0402IWJEymu/NZgP10bhquCWMZ4j2+J6v
 jro89ZowH9Q62YNXzfQIzJhwof5mRLjdDALnZDVKaB7H6sDUAteBB9w/2IgzxYAm47soB2Eeuda
 C0LClPzQDVwlhRcgADwk8iADUKHj+QOON0PXfJkaO7kzLHHkuvGOiEPDjQ5PncTy/69XvBHA/u1
 LG4KCjLebPnA9iTeLUJXzOk1/28xxs/6TIvDKCn/6k+5/pxcxMylih8AquF8hFDgUw/iDYM38e4
 jwW1gj6W83XEjoQvflIOeF99ceD9wQ==
X-Proofpoint-GUID: puVLsiBOTEaCg81mcRwBgR93ITFp6GW3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070016

There are custom-made firmwares based on board ID for a given QCA BT
chip sometimes, and they are different with existing firmwares and put
in a separate subdirectory to avoid conflict, for example:
QCA2066, as a variant of WCN6855, has firmwares under 'qca/QCA2066/'
of linux-firmware repository.

Cc: stable@vger.kernel.org
Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/btusb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index dcbff7641..7175e9b2d 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3273,6 +3273,7 @@ static const struct qca_device_info qca_devices_table[] = {
 
 static const struct qca_custom_firmware qca_custom_btfws[] = {
 	{ 0x00130201, 0x030A, "QCA2066" },
+	{ 0x00130201, 0x030B, "QCA2066" },
 	{ },
 };
 
-- 
2.34.1


