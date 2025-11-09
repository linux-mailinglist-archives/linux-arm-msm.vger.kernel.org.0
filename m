Return-Path: <linux-arm-msm+bounces-80855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAA4C43A9B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 10:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B75C83AF08D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 09:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5999A283C82;
	Sun,  9 Nov 2025 09:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XgxWCiQb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A11C22157B;
	Sun,  9 Nov 2025 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762680313; cv=none; b=o1Fk37ARk2T7tlUXrJtuDYUjRxY2/Viwj66cCGYdnwm2zaQYMdpOy5REdzfue0bqx2upNnKkDr5qbeUS9g/m/yBIPC7os5IHehPb0BRzROhoxXkyaXIhCdJ30tXWCE9BQFPeRUaXh2RsTCCy7hI4BwD0RENW8N3w2Z/zVbpsYIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762680313; c=relaxed/simple;
	bh=3rBTFftEx9yZP0caOfMTuZ/B607GriXUCwwanemc1Ow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E5Jm2U+xbXlpEXWbC8DJ5AO9ntnsOrMsr7C2eB7VV4XmotGgNtK0JpA2q03Dkw21hh3SenLJqi9jDhaf8PvoYJE6c31RUXeCYx8xTaxabQ0Y5GEgtZjYVdaX2kT0DabWl+bGBhHmEJz4xcyY91tDjtfk7sBB1Yde4EwW2f8bnTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XgxWCiQb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A96cRUW4091830;
	Sun, 9 Nov 2025 09:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+sqidDvvAIg
	6DJnB2CrMhAwtro3M0D/wEBD0FhheAWo=; b=XgxWCiQbt+qcps5LwssEBKdHzvt
	QeFJgx/dwemuAqTpVFU1Jd8Ku5Ektf7jhT9rKhqTLzg8/GiNxyE9okj60o9pI/Aq
	+K6ey7SnO41iV4MUykdSssPqpPhnXmIc/hkFyyKYtGlYyFtLQloDfx63WFWYBL9v
	jeQYHXmQ+1/fxjtIQrastnGjBrFWU9GM/MsVjAGY8mJR10mQ2bAKSSs2PeXwH6IW
	tKeB7B/Y+B93If/LADPMp06/FbKYCMCELUSCgeHxaMHB8OBlIgSfOtgZ2PXnNPov
	oYHFiHXrBHcSkgQvCTzTdzBrYSQJyQQjanDFlwlziizKCKronLPkp2bA1qQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xu2swaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Nov 2025 09:25:08 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A99P549016200;
	Sun, 9 Nov 2025 09:25:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a9xxkrxr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Nov 2025 09:25:05 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5A99P5sh016195;
	Sun, 9 Nov 2025 09:25:05 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5A99P5mR016193
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Nov 2025 09:25:05 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 468B422923; Sun,  9 Nov 2025 17:25:04 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_chejiang@quicinc.com,
        quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com,
        Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v3 1/1] Bluetooth: btusb: add new custom firmwares
Date: Sun,  9 Nov 2025 17:24:37 +0800
Message-Id: <20251109092437.252022-2-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251109092437.252022-1-quic_shuaz@quicinc.com>
References: <20251109092437.252022-1-quic_shuaz@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=dMWrWeZb c=1 sm=1 tr=0 ts=69105df4 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=HSaFlmFXjmI1jj9ufZ4A:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: ik1dugxauojNBxQRGNDiM62cDAizOWCR
X-Proofpoint-ORIG-GUID: ik1dugxauojNBxQRGNDiM62cDAizOWCR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDA4MiBTYWx0ZWRfX859g1G/ILzTS
 ofGIwKiiDek6+0Hb4T/x5/+2U2p1NeqXxesSXHIuLykOQHCw+0RAXrIrSrxO3d253Hy/+IaAjhd
 MUO7jqmUCeDjjIjtqhlfC+GJBupBI7YG8HquzU61bW8CviTGwJI8PNG3NK4YrrzmrbwhiG8Jt1D
 aWLB8zetZInpnOF6LfZHS8QEnVNvvHjrdIOXG7tMWy2WgOmrShvYnP67WcpJ3npj2KAB1SmPwFn
 JEJDYY2bgRUuXA4gPO0ut9ZRIF9XGsdAasyu8AU1NfqPpeMejQqHqepAqnUVJc3Qmb25mO7q/Vj
 pMeXGMQgdg8hcvcaX4bPPHwhANDBXqxsBWgh3xf14HGDsLSoRmXLZe7c8mMgolBE/Y6UrsuIrU5
 JA/MBFctFxSxlnjbgsq6rewwJ0q47Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090082

The new platform uses the QCA2066 chip along with a new board ID, which
requires a dedicated firmware file to ensure proper initialization.
Without this entry, the driver cannot locate and load the correct
firmware, resulting in Bluetooth bring-up failure.

This patch adds a new entry to the firmware table for QCA2066 so that
the driver can correctly identify the board ID and load the appropriate
firmware from 'qca/QCA2066/' in the linux-firmware repository.

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


