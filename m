Return-Path: <linux-arm-msm+bounces-100640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tkR9MlKDyWm7ygUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 21:53:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5D9353D75
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 21:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96D8A300DDEB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 19:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F8229B766;
	Sun, 29 Mar 2026 19:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a3p7z8Sr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D062B1A9B46
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 19:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774814032; cv=none; b=iPuf9ePm8fLZEqO3stUml9E/RCIo5uZc/CPniaFtBcyFL0s8Gt/I1oHb7KlzHi6CZX5Ii+DE+UvRP1cOBABae+lvSlNKttNhp6zzjyKLtRQ0q7iQgg+iWlyTov+Weq3h1ey3Tok3lDkDJmyQ2ccM41I9AzC2zgGGX7AVYnQi1w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774814032; c=relaxed/simple;
	bh=ojAxxs7YR1L7UTJ6ausqqFWOmxyeAXx8k+rs2487mZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LE7ig6kM8+xzHiGyelViorlhbvdCOIIThYUeiMcM2Bgq50PRYbf5voJtt/ApfAVrc8vpjPqnw3uo2vhLaoI3t6AgpSg8mseecTMdsD9pIfIBX6ln5roDPUyLaWVmcEZN9TU/yEcVzcHiPHxQiOFrZLmDYS8LYFAKwD0BAJlokcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a3p7z8Sr; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TJ01LT005536;
	Sun, 29 Mar 2026 19:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=z/Hkddi3N+Fftld5XTaz8A3WiMyfF
	xUm/OOzfXg7nzo=; b=a3p7z8SrLj0Bl006OABhQOUO5VDOm5muvEeH0ezIhGSzh
	FgcCpy44vNv7jCnjq+5R0Mjzwg6zJjBGJqkKZ/MdEnfHnBcZmoHHZgw8x81bH4u9
	7xUa7NZfBpG4ZoaHaTreFtHvIQgMHLxvrkGA6ZYDvFXWUcWkVq4QbSLxS1JhaVx0
	QAu5ZFb60KTTcgkElZfnJCtf+k3FxWAQRhHVDomtOd3OBOpEKnRKDLdeeWei+PPu
	Ma9BTQHCQncByPCfv28KcaDECr/Tq/zA4qBp5NzHbAgp7a+2imfdWodw7VTgOG3i
	ea/NWDpGmRmsepaA0FLlmq9VZgglc86a1IMjC0gNQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d67hq95yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 29 Mar 2026 19:53:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62TH5TqV036387;
	Sun, 29 Mar 2026 19:53:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4d65ee7k97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 29 Mar 2026 19:53:37 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62TJraM3016703;
	Sun, 29 Mar 2026 19:53:36 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4d65ee7k8q-1;
	Sun, 29 Mar 2026 19:53:36 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org
Cc: alok.a.tiwarilinux@gmail.com, alok.a.tiwari@oracle.com
Subject: [PATCH] soc: qcom: aoss: compare against normalized cooling state
Date: Sun, 29 Mar 2026 12:53:23 -0700
Message-ID: <20260329195333.1478090-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603290157
X-Authority-Analysis: v=2.4 cv=T7WBjvKQ c=1 sm=1 tr=0 ts=69c98342 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8 a=r0cJLuwjrJ73-EAWbbMA:9
 a=ZXulRonScM0A:10 cc=ntf awl=host:12276
X-Proofpoint-ORIG-GUID: Xu_lqpusXn25MvScCxXuAunxePXwmSs9
X-Proofpoint-GUID: Xu_lqpusXn25MvScCxXuAunxePXwmSs9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDE1NiBTYWx0ZWRfXx2ElDrhfLwRe
 M3/AH6s4z/e81uj58xSxl0UV1cN2pCHFBxtfcWolIUKuQsTseOa2ltUvnM/E812NEeW3e+Aeedz
 CDDD+W+iFkpggz+JCHYMsyATDPyNiDGxY8b3JMp2E+p+epjX4hxk2etavkJfiM33ZiP3kh4xWeB
 /uwddOfJaQjEBzglWQBz35aVjNqNV8toBa7/j7wIFyyhC7hDHIQ55zcEyckS1HPaYWhNilTwrs6
 Io/fxl1GxCALngVnx0n7irXQBDpbjDOsNXLULKqAIsqXDVFbqs/5nX2h1jAYiI9Mzl6ivDCE5Sa
 plO1qAnEL+6wWuFOVMrfH6ZU6fECv7yhui7hwUNH7Rm3l3ZyroxVoakILVxWuDVw2E9nfRXV7O3
 LAJffRQQpNW046lwYi0o5LqkVvZmXCh+/tO4kY0D9ZzGnAo2gPhcSxaUfGyvqeGKT7gGUaZzT2s
 ViVH4RmJTQ+JZqnohHbYUFJoysqZxUzjORH2dl64=
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100640-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[oracle.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alok.a.tiwari@oracle.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oracle.com:dkim,oracle.com:email,oracle.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 0E5D9353D75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

qmp_cdev_set_cur_state() normalizes the requested state to a boolean
(cdev_state = !!state). The existing early-return check compares
qmp_cdev->state == state, which can be wrong if state is non-boolean
(any non-zero value). Compare qmp_cdev->state against cdev_state instead,
so the check matches the effective state and avoids redundant updates.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/soc/qcom/qcom_aoss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index a543ab9bee6c..c255662b8fc3 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -355,7 +355,7 @@ static int qmp_cdev_set_cur_state(struct thermal_cooling_device *cdev,
 	/* Normalize state */
 	cdev_state = !!state;
 
-	if (qmp_cdev->state == state)
+	if (qmp_cdev->state == cdev_state)
 		return 0;
 
 	ret = qmp_send(qmp_cdev->qmp, "{class: volt_flr, event:zero_temp, res:%s, value:%s}",
-- 
2.50.1


