Return-Path: <linux-arm-msm+bounces-90590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLLZLvqVd2n0iwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:27:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AA98AA8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:27:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13EDE30818A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C04340277;
	Mon, 26 Jan 2026 16:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cgyc/lsj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812C033A9F1;
	Mon, 26 Jan 2026 16:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769444699; cv=none; b=TVhZ5B4usOFAKC/KJ3o0S7W8KfAs0eGD05AUCzfxZLRKC7rkTH9q4fOp+fKfSsuoxjyg3Imv8iLiV6K0bIxrVpfsQSRc1fEskuauX3NP5eaSvZI6WMIfwYyO+SkxisqKoF3C3IF0ivmiP8x4cu4fw5hoWuBrK29p0oQnL+m+ggA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769444699; c=relaxed/simple;
	bh=+nlZgQe8BQvGe9/2ZtExcDHoXD9HTdQMD0c7ZT4143Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o/pappZWIZcDd/FIX16ybeU3w8Ox3uLj/ReZb6RTVN5Es9A27isjFLRNYkLpC/Tq4fzkPMy7vl3/SC23+j9SjtDnMd9fQM1yFtm8BMW4Yl2shOikHSngV+A48cYbaU8/LS3yiZ7PEVCGpK6u+tdq7Xa1doqHXT+ymzYflEOBga8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cgyc/lsj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QBHPFs2536581;
	Mon, 26 Jan 2026 16:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IbCbhUQC6Rm
	KMCr86YPTQwfl0t1JmH7pg8KfTHGd1zU=; b=Cgyc/lsjbUeayxxFKmnXGU0ndXD
	DfmJ8TrEFx1gtzHAm+IEGupNa2imaiP3AzMQmscjZlnNJlvqSN2yLCXlvo5OsDQN
	oXU6LXjZRZayjaZYrJIeMfoJy+YAlMtR3AdLOUWZhgdPpXqUN9G/l1gwBmg3en+U
	AJyq6ENnIh1bAUtXnd00hqHiE/g27NYtRwkja/SNgHu+Tv37Ap4V1iv3zcJ8bZ8z
	hiZTCi3diT171QRZTpz8DD5iK0XJ8fvAw8qLksEtU2Ybe2TJ6PjOMFgWOOLCFU63
	NQriUx3QGLp2/0C8PKLbDbCt1h8UQU/4AMKNNqfMN0tHEMKk3hwrRrZHnHQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvwtyck23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 16:24:53 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60QGOp7L020937;
	Mon, 26 Jan 2026 16:24:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4bvq5kweyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 16:24:51 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60QGOppw020932;
	Mon, 26 Jan 2026 16:24:51 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 60QGOpjG020908
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 16:24:51 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4766378)
	id 52F0823960; Tue, 27 Jan 2026 00:24:50 +0800 (CST)
From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, shuai.zhang@oss.qualcomm.com,
        cheng.jiang@oss.qualcomm.com, chezhou@qti.qualcomm.com,
        wei.deng@oss.qualcomm.com, yiboz@qti.qualcomm.com,
        Mengshi Wu <mengshi.wu@oss.qualcomm.com>
Subject: [PATCH v2 2/2] Bluetooth: hci_qca: Enable HFP hardware offload for WCN6855
Date: Tue, 27 Jan 2026 00:24:44 +0800
Message-Id: <20260126162444.4194293-3-mengshi.wu@oss.qualcomm.com>
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
X-Proofpoint-GUID: ruX935OCqIm9CnSV82vi-2UsjlQDG6zh
X-Authority-Analysis: v=2.4 cv=BteQAIX5 c=1 sm=1 tr=0 ts=69779555 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=RcekqmAwbsI-zVS566AA:9
X-Proofpoint-ORIG-GUID: ruX935OCqIm9CnSV82vi-2UsjlQDG6zh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEzNiBTYWx0ZWRfX0VL+7HB4XpSg
 iOl131BPOgbbxqddjQTxiINlcN0sATbrSGCHiXHzzTy2HW6Dh5xiaO5gHIQFYuGs2oVGOMkgeLi
 i8SEQZc9NpsarnmcFHesiNsUlcOAjxcwmsBKR5fsWZS+chS5haOgweUwFPE05n5hqB0kWKE2kAn
 eWpiDmQt1UHiEbADtUkF4C01vbYlhxzzqsW4lM5a2Is9wk/C9jiBkOOypiVmk8UfowuCkMaPiBl
 ajPiFoO6VxF6Rnp4M0YOuq0m7mzGz1jeF7RLLQ07gugtbO6BcmVj0ZKDxqpPZJOswf3/inp0T7e
 sHnui5pVYj1vwDUAaa9hMCIgyz8DNVsVYK/GgjIpTIoC1TBuA++MEpgReSdFy7buUohAbtUZuY1
 VIo/Dk1am+Q8MW3gfbk0Ati9FKk+uZYbG1s75/qOUCHYQ/ZWIlTTRKVjQcsdCoTROS+QETy5+Ld
 n/8Opoes7JxZvcRidww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
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
	TAGGED_FROM(0.00)[bounces-90590-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 60AA98AA8B
X-Rspamd-Action: no action

Add QCA_CAP_HFP_HW_OFFLOAD capability flag to WCN6855 device
data structures to enable Hands-Free Profile (HFP) hardware
offload support on these Qualcomm Bluetooth chipsets.

Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index b99fdda88..212a92bbf 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2155,7 +2155,8 @@ static const struct qca_device_data qca_soc_data_wcn6855 __maybe_unused = {
 		{ "vddrfa1p2", 257000 },
 	},
 	.num_vregs = 6,
-	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
+	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES |
+			QCA_CAP_HFP_HW_OFFLOAD,
 };
 
 static const struct qca_device_data qca_soc_data_wcn7850 __maybe_unused = {
-- 
2.34.1


