Return-Path: <linux-arm-msm+bounces-90589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNJ2Kd+Vd2n0iwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:27:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B0D8AA6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40301306B087
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248DD33C1A3;
	Mon, 26 Jan 2026 16:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNXUKHiU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0A132AAA1;
	Mon, 26 Jan 2026 16:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769444699; cv=none; b=NajWeg0F5bZ/kOcaMn18fBp+16v/cR6KFzBcNymTfCrhdMXWNkgMvwptkxRzJPoS52EItNpOCsGMy12K0dfSseBR+rDo+lVrxziJj0RGNtvPHRfCNhjCEJGmoxRMpfVBJfCzbjeuSoFPDEF7Y2g/Et++Hwz6Bc6gKWu0xlWJoVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769444699; c=relaxed/simple;
	bh=YP9VlNLjv+QY4ZiKV39oRjxOdB1OgcmVihLNwtblaho=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aZ04uKQbiy3EN5sJK82/5isOKBAPXOjB8o/FOJ/t7cCUH8wx9Z0zdoXEhbQELenLGZH/46a5602ICI6SkU78tRZcVcKy9kGyjvs7CiFLWiYE7+RvdL8WIK89b9ZdKAnpeLfUlWEjNYzZdmCvMgiftbNLn3IATJxgKdELvDag+io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNXUKHiU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QDwK7X1361512;
	Mon, 26 Jan 2026 16:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+2N4Wexb8a+
	AfmV6JypKsVfS7OKkW1K5xiA+W3qqjpE=; b=dNXUKHiUmxrm5M8vx6LB6z7cF+m
	9SaJCoGjbQM5w/SsR1XMAzyhDMtbXNErSRWeE9CjyGPQazN9LjlyluBeSVazRVKl
	6Kv4583fwOA46E7t7YksTbuaDSZkrUWz6TC7NKZuWbGa0ckfUOFhvy3yrpW2k4Dk
	QUjryttfztThDxHQAb/nnWtsV8i+HS5dmEJmQoFLJxHWFL6Qo9uqBdjptabQMYdA
	GVOaV6RfgAwUVTrQG8HuIYcK5DiZktoqkY5hRsMdWtDkmmCVowepE95y+Q8e7cXo
	bWoJ0NmhGg1e76wvU9OpAwdrAS10JdBu3OVC9XdFPSTAliJ6gtOxsU0+IKw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx0v31tdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 16:24:52 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60QGOomK011432;
	Mon, 26 Jan 2026 16:24:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4bvq5kwex7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 16:24:50 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60QGOoeT011422;
	Mon, 26 Jan 2026 16:24:50 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 60QGOoGW011419
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 16:24:50 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4766378)
	id 451BF2396D; Tue, 27 Jan 2026 00:24:49 +0800 (CST)
From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, shuai.zhang@oss.qualcomm.com,
        cheng.jiang@oss.qualcomm.com, chezhou@qti.qualcomm.com,
        wei.deng@oss.qualcomm.com, yiboz@qti.qualcomm.com,
        Mengshi Wu <mengshi.wu@oss.qualcomm.com>
Subject: [PATCH v2 1/2] Bluetooth: hci_qca: Refactor HFP hardware offload capability handling
Date: Tue, 27 Jan 2026 00:24:43 +0800
Message-Id: <20260126162444.4194293-2-mengshi.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126162444.4194293-1-mengshi.wu@oss.qualcomm.com>
References: <20260126162444.4194293-1-mengshi.wu@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEzNiBTYWx0ZWRfX+W4e+C8kWmt2
 TDSp0Y4F9Ba+PuHi0rfOH0a/M3f07Z0blj9pIpb8H0ZHCMUsOOtgQOsbKJz78upwxW8uG6RjjFI
 AcMviGQHaiUVyWH5/TyQAe96vlCFMiAwuURxQ7ki7IihLDxp9//wfj2Pu3M7xtZxCfq68m4MHBQ
 cWQ/lrEb272ugxA+TEF5LmxdMODZGWBA0SLOEdxnrRut8APE7cd9Dk0QTmsOtgAdur8X1pf8vAn
 VrslDnlVP0BANni7aP1Rozhj3UhMrRNLlJ5zBjaqWJHdGHXZ8i7qlQ/0yp77Veef+MAgC7jxeDM
 lEDOZqUmwHzHIAqWFcKoITU2Pp1VJOYmdqDQBvzmCtmcQg6xVzATGWsnaEbUcz6h6h3qbdzSEGr
 F3bekAlqRwNZqRcgcUv83u9TCiHOjuTpd0h9fmwAbolVK5vm/YK2TyFf23WcNHxg8CLXwmbzNRK
 Acyt7wQ+QsB9iIw+Eow==
X-Proofpoint-GUID: XzR1Eecov9_lPg3tdkcj5BJIKnrZBw5x
X-Proofpoint-ORIG-GUID: XzR1Eecov9_lPg3tdkcj5BJIKnrZBw5x
X-Authority-Analysis: v=2.4 cv=JYyxbEKV c=1 sm=1 tr=0 ts=69779554 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=GUYL8w94h2HILO5x9hMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260136
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90589-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mengshi.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 16B0D8AA6E
X-Rspamd-Action: no action

Replace SoC-specific check with capability-based approach for HFP
hardware offload configuration. Add QCA_CAP_HFP_HW_OFFLOAD capability
flag and support_hfp_hw_offload field to qca_serdev structure. Add
QCA_CAP_HFP_HW_OFFLOAD capability flag to QCA2066 device data
structures.

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


