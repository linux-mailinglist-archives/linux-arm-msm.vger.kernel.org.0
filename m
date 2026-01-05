Return-Path: <linux-arm-msm+bounces-87502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CDFCF4125
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:17:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E2AD303E02E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E85D34A3B4;
	Mon,  5 Jan 2026 14:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yy9xgM2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1086349B12;
	Mon,  5 Jan 2026 14:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622480; cv=none; b=PvGmXhuolkqRx8c2hXrhK+FoGy2WIoXOOK/LrIFz3j5U7Pjcvz4DvLAb+Gj3lssxGzQOErdhLz8YB+DpHwRQmpt2lWNkk0FHMhyOIWv9UhdtU4IHXvIjlNL/AoPWFldCvEwNhJp7Jm15jR42s/UHro1z9KMgsx0e4nu4QnXtuW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622480; c=relaxed/simple;
	bh=pA3R6XE2osHfdUMbYc//VWHQCj3H7+iaHhGlZhTIst8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VUvdwSLrYc5Wn983nN5GeVxTEwWctC4WGHLiNogrTqeuyNrO37JpWhYZm4fQg0Dzu6cwe6+p5RXLmU9XDrVDD+H9IC7rlwQGPZK9+XGTa05AVC91jvyEGWxNExvJba1DdC+pijZBBjCXlXft8XX4B7BDYZ9oiMyf10SvyaTdvkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yy9xgM2A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058TDhW3790255;
	Mon, 5 Jan 2026 14:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ANnn3wDqVYQ
	zewEaokqnba6UshHy1aIq5uy0JnrZKdY=; b=Yy9xgM2ATNlzSR4Hw2zDy6lHhhe
	6BlSzO/CapV4Kz4bXzGZOQeMpHhuJWa1LX7e1/MjIGCxlv7awnc5ZejIdnfuyz0p
	4x9dZ3j7ah9Sh0MftiwerowBbAL9Jgsa7X6Raud7hJEaEYmlAdyp7nLlosF7qtF9
	N74hs/PeDOApqFC3Q0kyjLgz5zXYAnmJDI4KkM6zyd4rQpEHww7yiiUD9eknyDtV
	AvtGRWDlYzSebMGsGNeTZ+vvvb3fY5TRo58rwyNu4c+2pm89dkNGr6jpWujqlvbV
	gsbyQNtIh/5Izeadgc49RQL6MrtJtGkXgeYfEMoOnlP5agZkt+YXQKQj8dQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd4pvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 14:14:34 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 605EEW74012373;
	Mon, 5 Jan 2026 14:14:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4bev6kt38a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 14:14:32 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 605EEV9A012366;
	Mon, 5 Jan 2026 14:14:32 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 605EEV6i012365
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 14:14:31 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id EF1D523A8A; Mon,  5 Jan 2026 22:14:30 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com
Subject: [PATCH v3 1/1] Bluetooth: hci_qca: Cleanup on all setup failures
Date: Mon,  5 Jan 2026 22:14:27 +0800
Message-Id: <20260105141427.196411-2-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105141427.196411-1-jinwang.li@oss.qualcomm.com>
References: <20260105141427.196411-1-jinwang.li@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 7RxqYXwawlJvtXhOCeDrUs1E3yFN8ox6
X-Proofpoint-GUID: 7RxqYXwawlJvtXhOCeDrUs1E3yFN8ox6
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=695bc74a cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=TShSeRwDY6ZUq1BdFX4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyNCBTYWx0ZWRfX9PNQk8+n9qGi
 Bc1qxxSiZ4n7xxav3vljbR8+NyAnq/fGPLYzCessZZ5mrEC1gwV3Bxrrjj7bddeIialXn4tY16G
 YcqARNyibrRJguF4r1e7Xi7/fsdN8orc7CTR5lD12Xdm/T4z9S9uDsXBuBZPj0fujSYW1lF6hvf
 yDsZ6g0f6hCfglRoJg3l0upxBco04Xt0wReSWQRez4jU+JWaIxxM5LVqe89nHulJA2aC+fnWImZ
 IgdSrEt7HlJqylpBdD2p04qD/kASZ9nG01qCHrD5lpWag0AMsX0XN+O6pP+sOAJV0/AKyz58I93
 M2m5nEXFO6ssUsBBe9aryekTe8/uBBEIGwSWxmmKrGQxL1rbWu/IqdiY+3sMckgzELHgvCwEAXT
 JugDzix6fM5KwAlg3bgXggjoIdimLbQywaOrlt/Uak1Cf8L9bQe1Q5WSa2jlMzxDq29zWmwLtt0
 zL1IE9x7Ec9KI5ad4+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050124

The setup process previously combined error handling and retry gating
under one condition. As a result, the final failed attempt exited
without performing cleanup.

Update the failure path to always perform power and port cleanup on
setup failure, and reopen the port only when retrying.

Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index a3c217571..4a69e66f6 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2045,19 +2045,24 @@ static int qca_setup(struct hci_uart *hu)
 	}
 
 out:
-	if (ret && retries < MAX_INIT_RETRIES) {
-		bt_dev_warn(hdev, "Retry BT power ON:%d", retries);
+	if (ret) {
 		qca_power_shutdown(hu);
-		if (hu->serdev) {
+		if (hu->serdev)
 			serdev_device_close(hu->serdev);
-			ret = serdev_device_open(hu->serdev);
-			if (ret) {
-				bt_dev_err(hdev, "failed to open port");
-				return ret;
+
+		if (retries < MAX_INIT_RETRIES) {
+			bt_dev_warn(hdev, "Retry BT power ON:%d", retries);
+			if (hu->serdev) {
+				ret = serdev_device_open(hu->serdev);
+				if (ret) {
+					bt_dev_err(hdev, "failed to open port");
+					return ret;
+				}
 			}
+			retries++;
+			goto retry;
 		}
-		retries++;
-		goto retry;
+		return ret;
 	}
 
 	/* Setup bdaddr */
-- 
2.34.1


