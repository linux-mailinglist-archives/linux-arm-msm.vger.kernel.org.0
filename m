Return-Path: <linux-arm-msm+bounces-90278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFvGEMkMc2ncrwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 06:53:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D4670914
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 06:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E90CC30156C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 05:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7BC39F307;
	Fri, 23 Jan 2026 05:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QMA0NTqT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5060B38B7CF;
	Fri, 23 Jan 2026 05:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769147585; cv=none; b=i3/YgkBVq+VGdTV0MVcAZF6r1rrsbGpOm3F7qk6d7kzTySeYV9PXk/KrwDol2h5BFduVVwcepOJAMI9BY2ypBoiioBu9qB60OryxZf+OBhoks538tKQ/eob5lRMWgLOZDw1+Ev7oLitCc89n29SzpbhPk3Jvveq/D5ub+4WrI2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769147585; c=relaxed/simple;
	bh=RQePsuASfjcu31PLkCs+F7ZsPPbZw3taKOFniOSgyKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ACj2A+MJZZf0UALpL70nNjvpqp8gtHb48UE9z7JiLBb6uE1C4/k0SSJ+0wieLfI+fk+kmTxssg10vkZGQEUc7ACJQO8c+Rv17r9ct1vq8P0+L8GHGIKrYUkvWjR2ndXvcpFWVHsmAOcOXof/0ZwYMKvoyDMlwsKJfCJ33ozx6QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QMA0NTqT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N5WDuV3704287;
	Fri, 23 Jan 2026 05:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+QfMc2yMbOb
	ueVS2HpRrJ8zl+E+KZD9TEwGwhTLqxOg=; b=QMA0NTqTgzbGbPTojkJZ94Ca4ky
	UZ5DDmBXMfq4R3NfVbfUS2dwjjPsfUKmB2h6sCIBNjR0n2fab1sW7Lutfnfi+mK6
	cJWgEHBG6e0tnWn71a+bXmnD+fMosO8SAiknYXhFg8kgnPp7XM22bIVxsyWtCTPW
	DQyMLcxCR+o5fT8rqUz099tCis314Qjfjlu9yxAZl4vJIWXecUmsWHmLQvYoU0iD
	GGhbdI7S00GLwxnBYW82sXVhQoY/wWc5LOlklDmXhMWpqy3gpJKG9ukO8g3HPF1s
	EovlIqMoyn9C3ENRSzsyaaJ+6ZaDMbCPwvwUMCukNfgzzTNWHC4jMsyMIrg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buuaysg3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 05:52:49 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60N5qlba004289;
	Fri, 23 Jan 2026 05:52:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4br3gn8ryp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 05:52:47 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60N5qlqU004284;
	Fri, 23 Jan 2026 05:52:47 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 60N5qkmE004280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 05:52:47 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4766378)
	id 19584238DB; Fri, 23 Jan 2026 13:52:46 +0800 (CST)
From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, shuai.zhang@oss.qualcomm.com,
        cheng.jiang@oss.qualcomm.com, chezhou@qti.qualcomm.com,
        wei.deng@oss.qualcomm.com, yiboz@qti.qualcomm.com,
        Mengshi Wu <mengshi.wu@oss.qualcomm.com>
Subject: [PATCH v1 1/2] Bluetooth: hci_qca: Refactor HFP hardware offload capability handling
Date: Fri, 23 Jan 2026 13:52:42 +0800
Message-Id: <20260123055243.2634107-2-mengshi.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123055243.2634107-1-mengshi.wu@oss.qualcomm.com>
References: <20260123055243.2634107-1-mengshi.wu@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=GP4F0+NK c=1 sm=1 tr=0 ts=69730cb1 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=GUYL8w94h2HILO5x9hMA:9
X-Proofpoint-ORIG-GUID: fBIxgsymngZ5fnSBVjvgLzybHHdbDE0j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA0MiBTYWx0ZWRfX84ToET4wPNJu
 ZcX6l25iU1R5/LshTSKeVWaIPOOxaRD1/xwW5GohNCbV8ZGRZmnyBcYzpp3ldKxLCApPI+9RQsB
 hjCcFrBbsALSH4p2dudSBCLRvtca9Du0+MepNPpX0YhvezeiD8bA22Ph7bnVcks2wvThIgGTWQd
 FBvG652VgdUn3vlfVBCYjlMBcjVfFsTnqblFcWdIA6gFLvDmZmlYp+BEAd4Q997xs30ZeYKHCsn
 bM15zxam+/2VXX9jbCmJ8JSR5+Dsxiuz7hDbeJt5LVvzczQ8eMvjH6i1FmSajUge1dGumSmwlxt
 J0Cd94pRcA8mvbU6mZaBoLre5dcrHHwKe1trRlXo6Pn4fsq55EZmoih6Oqafvs+xTrAfOXKgX3M
 rBY23Ik9JvIgqvz9ze8OoflbRjxRpmPG2DdkMAze9/qHSDpsjfsGhtm/7KhoV/pZh0v3eis5juG
 gKwHABWiEjg3u2wK/oQ==
X-Proofpoint-GUID: fBIxgsymngZ5fnSBVjvgLzybHHdbDE0j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230042
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-90278-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mengshi.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 01D4670914
X-Rspamd-Action: no action

Replace SoC-specific check with capability-based approach for HFP
hardware offload configuration. Add QCA_CAP_HFP_HW_OFFLOAD capability
flag and support_hfp_hw_offload field to qca_serdev structure.

Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 888176b0f..4e1e113f4 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -87,6 +87,7 @@ enum qca_flags {
 enum qca_capabilities {
 	QCA_CAP_WIDEBAND_SPEECH = BIT(0),
 	QCA_CAP_VALID_LE_STATES = BIT(1),
+	QCA_CAP_HFP_HW_OFFLOAD  = BIT(2),
 };
 
 /* HCI_IBS transmit side sleep protocol states */
@@ -229,6 +230,7 @@ struct qca_serdev {
 	u32 init_speed;
 	u32 oper_speed;
 	bool bdaddr_property_broken;
+	bool support_hfp_hw_offload;
 	const char *firmware_name[2];
 };
 
@@ -1879,7 +1881,7 @@ static int qca_setup(struct hci_uart *hu)
 	const char *rampatch_name = qca_get_rampatch_name(hu);
 	int ret;
 	struct qca_btsoc_version ver;
-	struct qca_serdev *qcadev;
+	struct qca_serdev *qcadev = serdev_device_get_drvdata(hu->serdev);
 	const char *soc_name;
 
 	ret = qca_check_speeds(hu);
@@ -1943,7 +1945,6 @@ static int qca_setup(struct hci_uart *hu)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
-		qcadev = serdev_device_get_drvdata(hu->serdev);
 		if (qcadev->bdaddr_property_broken)
 			hci_set_quirk(hdev, HCI_QUIRK_BDADDR_PROPERTY_BROKEN);
 
@@ -2033,7 +2034,7 @@ static int qca_setup(struct hci_uart *hu)
 	else
 		hu->hdev->set_bdaddr = qca_set_bdaddr;
 
-	if (soc_type == QCA_QCA2066)
+	if (qcadev->support_hfp_hw_offload)
 		qca_configure_hfp_offload(hdev);
 
 	qca->fw_version = le16_to_cpu(ver.patch_ver);
@@ -2502,6 +2503,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 		if (!(data->capabilities & QCA_CAP_VALID_LE_STATES))
 			hci_set_quirk(hdev, HCI_QUIRK_BROKEN_LE_STATES);
+
+		if (data->capabilities & QCA_CAP_HFP_HW_OFFLOAD)
+			qcadev->support_hfp_hw_offload = true;
 	}
 
 	return 0;
-- 
2.34.1


