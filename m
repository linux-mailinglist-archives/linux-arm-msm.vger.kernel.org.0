Return-Path: <linux-arm-msm+bounces-90637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPBzG+8oeGl7oQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 03:54:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E021F8F42D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 03:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDE723028C26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 02:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603F92DC359;
	Tue, 27 Jan 2026 02:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MBsXjMRU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D5128640C;
	Tue, 27 Jan 2026 02:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769482476; cv=none; b=EdMNJzk0b7VmT9Qnsxaeky47oMj897La+l3xzr5NM6eSMC6tKscJa6RGPbOhxnPvctMYKPoPMBWnVeOGWDeEY9GNjncVI2l0YJWWn2DhO1W3O2dRe+u3osulDF0qwhbxC07zYRnPjLgu7reeV6N9k7ZOieDMvWE9BnbNXGpIXDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769482476; c=relaxed/simple;
	bh=SwUZgm7B+buVikbN6TPiBSMYHkVLtq4c5zn1FAvy/KM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DFchLJQp0oVP4eq0cIKfBzPA/9/kpywFi+jOfdQoVEdqCkxzl5PuSiT2zPBsjy8H10R+2BtzCTbpo47gJp9zWn6EAsx3WKlcQOCITiHHIq1WHNkdFfLjIupTx3Qw8QLudBDOkSQLIPKvpyqCRypklBLB2HTw3EgWqg++GYbvRho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MBsXjMRU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgAZY3706785;
	Tue, 27 Jan 2026 02:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OkmyNL97T7C
	cuhwfgnV9q2DfM/0I5gfRldhseeYfQh4=; b=MBsXjMRUSWxa6YmUV3QYTVqDe/8
	OJK8A1hQ+7lW3f/wH7L83cj0QEpyWXSNgbvP/0bkAEvVYAbIC74rHIhT8LsKZE+G
	JCUiYt2pVYCOHVo3UuWQKV47pRFBU93steewV0Knz97bT3NkoSpZZT5yleu7qyZJ
	ipkVd4YM7lbOtXBMlv5xzT3IEOZ0JmC9XeTi8hFW+lNHvQHiCaQoRNb3xclTMSLU
	192Q1hM130gzUZK8r3jtABrShA3nXeZ5sQt953X9367LYirVbZY7QW/mwPjI95jb
	S+b/pDjTw8uGGL7+G7sKvg3BATykvgUBnRvZrZ1rBS/vi2otKucrOino8iQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3bgx33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 02:54:29 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60R2sRvr027889;
	Tue, 27 Jan 2026 02:54:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4bvq5m1726-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 02:54:27 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60R2sRUx027882;
	Tue, 27 Jan 2026 02:54:27 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 60R2sRfc027880
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 02:54:27 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4766378)
	id A815123993; Tue, 27 Jan 2026 10:54:26 +0800 (CST)
From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, shuai.zhang@oss.qualcomm.com,
        cheng.jiang@oss.qualcomm.com, chezhou@qti.qualcomm.com,
        wei.deng@oss.qualcomm.com, yiboz@qti.qualcomm.com,
        Mengshi Wu <mengshi.wu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 1/2] Bluetooth: hci_qca: Refactor HFP hardware offload capability handling
Date: Tue, 27 Jan 2026 10:54:22 +0800
Message-Id: <20260127025423.1418207-2-mengshi.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260127025423.1418207-1-mengshi.wu@oss.qualcomm.com>
References: <20260127025423.1418207-1-mengshi.wu@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: yYIj1wdNlkZ6gptUa8JPM76Ww1f3zrDJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAyMyBTYWx0ZWRfXy8UFFbR2Z/7X
 mcCzlBwUH9HiDCKK/ka3znXQqCCziYMDpUlCI3BWEkh4Rof+WlhCwdeqrtfNzqvK/oNqsRhq/hu
 g6YZn1/c1AIYXh5ozI50nGOedb3/rg+34UH4Ai1Ug9iSgD3z2DEH+h7nWLpDfHFZFjNJ0uZdSOA
 DkRjcZETltLnY3OpyC3MrtebZW03s1tpmkH8UAFrkuunTvqckS/9Mqfwatk2gIBm8IbepzW7qD5
 ryErqFV1eBo9Uquek1T255j+6DTXeRwj10pRBSHcUZ0KmMAYYrZsd4p/hjTkZLRtF6SVNh3LM+2
 nBLTda+z9vJj+TcxnMzPAnD7Ema0NpWY2P31A8p/LcwA99wd4FOvjvNK2wdlgwARsXueK0Zd4cu
 lDJ06Mhz1lMEhDDDVUyAHlXo5bejsltDvkgVAJlVX0CJ8E4gQrRMu/os/M1vfpeXgTjiJvip84n
 DBfttd6EA2wxte7/5fg==
X-Proofpoint-GUID: yYIj1wdNlkZ6gptUa8JPM76Ww1f3zrDJ
X-Authority-Analysis: v=2.4 cv=AOFXvqQI c=1 sm=1 tr=0 ts=697828e5 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=GUYL8w94h2HILO5x9hMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270023
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90637-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mengshi.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E021F8F42D
X-Rspamd-Action: no action

Replace SoC-specific check with capability-based approach for HFP
hardware offload configuration. Add QCA_CAP_HFP_HW_OFFLOAD capability
flag and support_hfp_hw_offload field to qca_serdev structure. Add
QCA_CAP_HFP_HW_OFFLOAD capability flag to QCA2066 device data
structures.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 888176b0f..b99fdda88 100644
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
@@ -2117,7 +2118,8 @@ static const struct qca_device_data qca_soc_data_wcn3998 __maybe_unused = {
 static const struct qca_device_data qca_soc_data_qca2066 __maybe_unused = {
 	.soc_type = QCA_QCA2066,
 	.num_vregs = 0,
-	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
+	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES |
+			QCA_CAP_HFP_HW_OFFLOAD,
 };
 
 static const struct qca_device_data qca_soc_data_qca6390 __maybe_unused = {
@@ -2502,6 +2504,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 		if (!(data->capabilities & QCA_CAP_VALID_LE_STATES))
 			hci_set_quirk(hdev, HCI_QUIRK_BROKEN_LE_STATES);
+
+		if (data->capabilities & QCA_CAP_HFP_HW_OFFLOAD)
+			qcadev->support_hfp_hw_offload = true;
 	}
 
 	return 0;
-- 
2.34.1


