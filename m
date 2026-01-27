Return-Path: <linux-arm-msm+bounces-90638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOVhIkAqeGl7oQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 04:00:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6108F50B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 04:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B95A7305145B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 02:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFBB2F12B3;
	Tue, 27 Jan 2026 02:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ezkXDfPe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99892E9733;
	Tue, 27 Jan 2026 02:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769482478; cv=none; b=H9W8XNnegAw32J9GQL89IBVUGnzUV/myEiWK3fVkXFl2jT9ZPbHFSXCo0k+KYfqdsNMyPYMFva/Y5MuVtcbm7mPfhQDK349baGlfXvycheYgDOPE38XU9sa/zisB/XcCD22XxydbEiMiYv/Sr4ZWWoJUQkyJLArEpLBi/VTAe0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769482478; c=relaxed/simple;
	bh=tQNBGS0nbM5yDSeq0Al/NV8poZm0L+G3ZzrcXk1h5UM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BT6fnzkiJ3Zx3aRR1mdxqKuxhv9bfnOcpuCMlX4ViasWESZ5ZJLhzAgTVCZ58l/EbbLtgsWWMxifm6J5a6BrblJn5NxB2s60RZAqmVo0EDE5sJ/hvbrjq/SvT0aq/ZcZgUu9remwXxYI27k47a/5hOSqSWd6gyvg7ipm8mik1Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ezkXDfPe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgS4d3384719;
	Tue, 27 Jan 2026 02:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N2gC0a5XIky
	eEnG5wdg0b+x5SjKqkmOgAJmvoiVcIyQ=; b=ezkXDfPevUpKvK2OrJN/Qd5o0s/
	Bk4jtcxKhOwdEu2r2Q4YkxA7kYOmWrMrTxLFV0FaBEoUcXtGNltWvG59f2DPUkUd
	ov8asdHPqim2qPpNIC//Xx4UvZb3TA2BvuUKfSbDP1fVJbzzkcmPT/NqBwrIfUNq
	B1pJd+SLuxKx70lIjimOhCvxNvWZw8u3cN/KFADLleP0JzepKTimbqh2s7rVoahr
	bUcBWAXyU/3ylougAnbf3OxP5OSsQbaUxmJ8ZVX1zXtCGUCNGI2Rj/Iq91r9Km7I
	Qdhwvay2Fe7BeOcWO0xmwellWUUuiWGTkXWF5DbVyIOga9kapEAxYGHlGVA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3a0wsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 02:54:31 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60R2sSEk017381;
	Tue, 27 Jan 2026 02:54:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4bvq5m170w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 02:54:28 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60R2sSDj017376;
	Tue, 27 Jan 2026 02:54:28 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 60R2sSvK017373
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 02:54:28 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4766378)
	id 91C4A23977; Tue, 27 Jan 2026 10:54:27 +0800 (CST)
From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, shuai.zhang@oss.qualcomm.com,
        cheng.jiang@oss.qualcomm.com, chezhou@qti.qualcomm.com,
        wei.deng@oss.qualcomm.com, yiboz@qti.qualcomm.com,
        Mengshi Wu <mengshi.wu@oss.qualcomm.com>
Subject: [PATCH v3 2/2] Bluetooth: hci_qca: Enable HFP hardware offload for WCN6855 and WCN7850
Date: Tue, 27 Jan 2026 10:54:23 +0800
Message-Id: <20260127025423.1418207-3-mengshi.wu@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAyMyBTYWx0ZWRfX57FV1yd1V914
 SH7Po5g4N8v/K85kDdiz9LH+x32K0YgugCVimc2fD42wTvNeLUy5qDrAo1PG+nmrivOV2JoVaGs
 5yBFS4hUsCHjB0Klo7ays67fVWDfDo2pk9MQ+rj/6NLxFA74BKxaZlJ+lJr3UG5iZL1sGnU2imi
 x9iZMiAezW1zOX2gcskeIrmi+l3zEwdJhPfHDV7V8CDtokic4//aEhJVFKWwl2x1JGV008TclL2
 YdmMD5oiIC2PhSgjNw964ywlXDcOX+gK5nusv7P05Nn2qdojva1tcmFxPWgpH6RwhBYx7BPO+nI
 ieeXPfFeHlY2EyQc1V1faZPUqKQpR0aC+/Qubjhli+lKOCMiXtiJ70bWivaBgSpaRDngyFRX36k
 0abEvgNpzQgpNLX/ZaNx6n1nWprPh/Lmq4TwmVKuz2iZNMCIuTywpVCHaH3e1TDTIt8bIW6uDmz
 EkOOaDgtIFZ1QHJEb/g==
X-Proofpoint-ORIG-GUID: b8zFCsz7LvBU1c2ID-GuisXrnfnNYTmO
X-Proofpoint-GUID: b8zFCsz7LvBU1c2ID-GuisXrnfnNYTmO
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=697828e7 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=lTINfPR8oJ7KkP3lkikA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270023
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
	TAGGED_FROM(0.00)[bounces-90638-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mengshi.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0F6108F50B
X-Rspamd-Action: no action

Add QCA_CAP_HFP_HW_OFFLOAD capability flag to WCN6855 and WCN7850
device data structures to enable Hands-Free Profile (HFP) hardware
offload support on these Qualcomm Bluetooth chipsets.

Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index b99fdda88..6b4784dee 100644
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
@@ -2169,7 +2170,8 @@ static const struct qca_device_data qca_soc_data_wcn7850 __maybe_unused = {
 		{ "vddrfa1p9", 302000 },
 	},
 	.num_vregs = 6,
-	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
+	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES |
+			QCA_CAP_HFP_HW_OFFLOAD,
 };
 
 static void qca_power_shutdown(struct hci_uart *hu)
-- 
2.34.1


