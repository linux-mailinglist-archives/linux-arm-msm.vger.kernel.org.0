Return-Path: <linux-arm-msm+bounces-86641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 289E8CDE94F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 11:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B7F73007FEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 10:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AAE314D0F;
	Fri, 26 Dec 2025 10:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cj1yph33"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F41285C8C;
	Fri, 26 Dec 2025 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766744841; cv=none; b=byI5apdXp9utO27mDNvDyEmIy3uKcsaK4B6uxLKdvPJ28CgAMeB4d35aBGCvvpof5A/iDFVu5C4Ylbizzg445O9osfoMdcFW+dsvpdjIOkMgsWeLVDbTvnbayHjKZZBZJYRndZp3sE56mJW77304dOEqKovt6znfLeZmryfDTLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766744841; c=relaxed/simple;
	bh=PRNXgH25Ie434c/0uSysKSAUiNWeidHfZ/+JTFC3vmA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IGfKg9J22tyD4E8cZdcR3ZPeHVh2pfXnj4Cp4D01aF399brF1RMqgI9GRlH9DlsF1FsiF2uGTLW7B2Kvto4/xfnYgbBTeyAE6QYLEh1eaRnJU/wE49biltkf24dLJN3bztubYEu1vjoPfstZwRt9xwv+JF7mUlJYGDdKDc7QojY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cj1yph33; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8bxLu2455258;
	Fri, 26 Dec 2025 10:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nc3mq3TluKK
	m02NsqG7q7kOd4phymiOSgmocAw47dqI=; b=cj1yph33P7hK25oYqGekaDZoSF6
	TWIQCy+72HL89gqKNdAI1ZbN9WmLqKRQdcs0DqrokvlqgRejlfoks1dp2pesg8Hg
	qolqp4KR8FwabHc1wj9ZyE9tRT4JK5ElvSBFBSJkuQEWRTUbMkLIODOmjoLvtjSt
	wjbdHZ6y7Ld1mnEePcAHwgOxMY9d7yuXXBPYxZymiahxBoavW+TJaggYEWSNIy/o
	9GVrihve4dTxHI/MAQMqqytGJbejov+joAwAfm3MqQcbSYMYXNtXGc5XqFO5FmaK
	s9O63e3lhj1tgmaMXyKsOIo6+SrUg2qsZIm7yX4PBVXHZp5iFnLOqHbGevQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8hwe3yrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Dec 2025 10:27:15 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BQARDO6005931;
	Fri, 26 Dec 2025 10:27:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4b5mvmprdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Dec 2025 10:27:13 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BQARCSE005921;
	Fri, 26 Dec 2025 10:27:12 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5BQARCvc005916
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Dec 2025 10:27:12 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id C27A0235B0; Fri, 26 Dec 2025 18:27:11 +0800 (CST)
From: jinwli <jinwang.li@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com
Subject: [PATCH v2 1/1] Bluetooth: hci_qca: Cleanup on all setup failures
Date: Fri, 26 Dec 2025 18:27:07 +0800
Message-Id: <20251226102707.3449789-2-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251226102707.3449789-1-jinwang.li@oss.qualcomm.com>
References: <20251226102707.3449789-1-jinwang.li@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDA5NyBTYWx0ZWRfX10JPWbEXnsze
 uMOEkYRRu+elw0HbvRPY4jHnx6bEvXJSzbP0jVVf8NiVj/pLjn4xZ2JyOfkeDCK3tEamlm32hxd
 NH+GTq/3wDkxG3nDvTBhdwwjyzhWQuK0JEtlcFKPvLPJ/qYDxR1c5hIW4GOfGC+3XP6YnqUOj6+
 TXLniUu+bvzI7kt6+bun7AiCeRtSh7xdMdHEmG8WvVpIVXZsG5x33GwlPARMdnbyky89ErDd03A
 0Acm0jbQPP99Yotf1wYDg84OFRbNdzj40WSRaRQh0TxQWzNYgdd11/1KWyfmkgVgEiHDYO0209e
 MqITADXPVUEBz6V+1RWx6JZPi6K3eZpaymDAt5IX/8+X2m5DoiO5wc//AfPPSwd36dP9Q3iaxgh
 Si3P5bfmhlLu25eVSfBxY04bik2t8EPxPyUgsfsxyjiQ0LcK5/Matnl6Oc0zYvzd1Whk//huvux
 W+qh2CqGKv8pnoQ5PwA==
X-Proofpoint-GUID: 4OH5d0Jv38b9QZGu3gohKtYaiPKn8P1M
X-Proofpoint-ORIG-GUID: 4OH5d0Jv38b9QZGu3gohKtYaiPKn8P1M
X-Authority-Analysis: v=2.4 cv=P9c3RyAu c=1 sm=1 tr=0 ts=694e6303 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=TShSeRwDY6ZUq1BdFX4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260097

The setup process previously combined error handling and retry gating
under one condition. As a result, the final failed attempt exited
without performing cleanup.

Update the failure path to always perform power and port cleanup on
setup failure, and reopen the port only when retrying.

Signed-off-by: jinwli <jinwang.li@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 1d3b62579..ca61e0afc 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2026,19 +2026,24 @@ static int qca_setup(struct hci_uart *hu)
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


