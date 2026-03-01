Return-Path: <linux-arm-msm+bounces-94708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO+CExEDpGnAUwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 10:12:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B0C1CEF42
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 10:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CB9730136B9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 09:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA917261B71;
	Sun,  1 Mar 2026 09:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XYEaWKUQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D89E1F872D
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Mar 2026 09:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772356348; cv=none; b=U0gvZt3J8hRj2CyVAhNojI5gUKK0qiK84JWBarxYwZ4BMzvatX3Uh1m80iu1SknUJFPYYpy1iAxoOktkw8peT8ABEs2nfCtbNO4m7SywS3UvmBxVIn7k0zesD7DWhiG6L/UPc1autugxf8E8uMmsovquRgAathrrl/ZJIyeRWGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772356348; c=relaxed/simple;
	bh=PnUpFEfZWcoKNNpvFP7RIhDS0we71jfuG4sYUWaamqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DVMv637iDmIgfvaEhMnbGeQwT4p5E9vWd08fGl3PGDM5lzVb+FO0mjQlGbEXJyzWIrKI6ryNXcAegm/Y0V0WPzRWeTv+S3BdKl3a/sl767x1yFJFchRKxOO1vD7Yobi07iydJzkVX3NarcmAv5yUwbS7hWq71P1mo4G28PQWH4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XYEaWKUQ; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6215aH5L3307158;
	Sun, 1 Mar 2026 09:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=w2TMubsK5Uv5omFc/zf8YZlltsRBW
	fHnFcyubL2bOTY=; b=XYEaWKUQzOLHm0zlXTZivDiIXzjOCrtA/LoNKQBSPuyfG
	NBSeNTt7Ni12TDVIRj1QLxrPRV/dRdmqwwuf1JbZ+vDrtCYveRomhlUrhS9N5ySK
	C342WrJWGMOLD1uU6kqdDBMc/2cpblqSA7aFCr7vE99krJ8uceldSY06Z1ZG08of
	48kgoIuax172xCiYUXVinNZAXrxDkE/gJjC+T9+fqcrXCsTeuzKabN7l/aBiag35
	XRDG6HKoMB00yyjPDydHyqIuiCN4qmlJ7XqgleeLM6ZEZ+o8mjwH0jH2Q7t1t+Bw
	a7xPNa8RE0HbwCZcIlwUg4WbkFzxyhy6ZDbUwXixw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cksh8rwdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 01 Mar 2026 09:12:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6216gGh6026760;
	Sun, 1 Mar 2026 09:12:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ckpt7my81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 01 Mar 2026 09:12:17 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6219CHnx030447;
	Sun, 1 Mar 2026 09:12:17 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4ckpt7my7k-1;
	Sun, 01 Mar 2026 09:12:17 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: jacek.lawrynowicz@linux.intel.com, andersson@kernel.org,
        quic_pkanojiy@quicinc.com, ogabbay@kernel.org,
        jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc: alok.a.tiwarilinux@gmail.com, alok.a.tiwari@oracle.com
Subject: [PATCH] accel/qaic Fix HELLO_RESP mode sourced from wrong rx field
Date: Sun,  1 Mar 2026 01:12:11 -0800
Message-ID: <20260301091214.171263-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603010081
X-Proofpoint-ORIG-GUID: 57I6IiXNfMvD60XlgQ_PqftijMm_OM_1
X-Authority-Analysis: v=2.4 cv=D8VK6/Rj c=1 sm=1 tr=0 ts=69a402f2 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8 a=hrsLsOafKCSbcmJkmpsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA4MSBTYWx0ZWRfX6Ua2ds3IVs6r
 GZYuJ+Hf5UdTIhf5rhO4dCjU7+YS91xCrGZYiuTVTdETZoZwkMNmvb+P+kde4vQKZhcau1Cl6Mq
 +0DTn6y0S2WrYd13nChkpV2JinZHeQC3E5HJuGUHT941AC0h0ewrqvp0oFXGI2nJ7yrexIJVQ+w
 pS9NJyNVMXE96/9wYQJMCbuS81rItBd9vFwj6/SqzANQkUSPqR8fdYXwvuYij1aPexp2FdCi1cv
 aR2GM6W/hng1RZLHgFosuCYReoSsbgpAy5Q1xmezvxn/urPQzdE6CU749XiwANesJ4hjBkPI0Dy
 0iTkL43zQbR33HC5oy6t5XbLj/+nzo+4IWUaGzN2sAPLcv5iZAbWnuMj22x0A71DWEjr5iU6MMo
 GnMMVqwP5XDqcSStl6p+sul1AxsTfNU75IK022BSFwVGI/QqZ6XgGP/dyoafdK8DMl33sNWuMZY
 XJv0KyO63fhjVFjB7wQ==
X-Proofpoint-GUID: 57I6IiXNfMvD60XlgQ_PqftijMm_OM_1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alok.a.tiwari@oracle.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94708-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oracle.com:mid,oracle.com:dkim,oracle.com:email];
	DKIM_TRACE(0.00)[oracle.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 97B0C1CEF42
X-Rspamd-Action: no action

sahara_hello() handles SAHARA_HELLO_CMD and validates fields from
context->rx->hello. When building the HELLO_RESP, copy the mode from the
received HELLO request (rx->hello.mode) rather than rx->hello_resp.mode.

Fixes: 76b801aa2198 ("accel/qaic: Add Sahara implementation for firmware loading")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/accel/qaic/sahara.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index fd3c3b2d1fd3..99bf832e2825 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -325,7 +325,7 @@ static void sahara_hello(struct sahara_context *context)
 	context->tx[0]->hello_resp.version = cpu_to_le32(SAHARA_VERSION);
 	context->tx[0]->hello_resp.version_compat = cpu_to_le32(SAHARA_VERSION);
 	context->tx[0]->hello_resp.status = cpu_to_le32(SAHARA_SUCCESS);
-	context->tx[0]->hello_resp.mode = context->rx->hello_resp.mode;
+	context->tx[0]->hello_resp.mode = context->rx->hello.mode;
 
 	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
 			    SAHARA_HELLO_LENGTH, MHI_EOT);
-- 
2.50.1


