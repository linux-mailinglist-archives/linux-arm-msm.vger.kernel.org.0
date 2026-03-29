Return-Path: <linux-arm-msm+bounces-100630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Km0DqljyWlXxwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 19:38:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BC935361F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 19:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1BC7B3002504
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 17:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF91C373BF1;
	Sun, 29 Mar 2026 17:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YikkFQY9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3779F1EF36E
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 17:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774805922; cv=none; b=fJt2xfdsieiMcqh0t8ua+HNOvVqR89MpQrnC7ekcCEoBTI0z54IY9U8afE5J2o9V2SP7M1e+ULUhqtLn+C92xsIs0aoKmj9CjqHRKg9tw2s3ObJyve3z567fhfehr8l7tVfby/lc6P3cEOUga6BKzxsV3Qyc7uqk/GbluUBcFeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774805922; c=relaxed/simple;
	bh=y9+WgH94xDEAHEply9e4IOVI/KPCWbCxJ2WbFcm63Bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pUTu0iGm11qOQ628qBZ8ZnTq7Ca6LYDbdlEGlvBIfI9p189zJCrkbjBiPO4z2rTjuvGERn7YuhgB13d9/DH51TXPd9RnTClfJ58r9GDsQVecarIfcCzSha/kIDHSomkaXlQoR1nqao/fVuBZnwlAocikDPJILktsoBCoIpLrfPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YikkFQY9; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62THWwWv1817593;
	Sun, 29 Mar 2026 17:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=ZRcyDmJUBq4EWmrC
	Z1Bh+p/7NgFWny0FzyLyr1oUh2A=; b=YikkFQY9wGj+Q3v/qvICg2uF+ClEQDL1
	WfKbDQnjfBjA3iNSt8g/jpJQHAkCbo8OkoHfb6ss8I2MlUH9UZLIGL4z7AXXqzlk
	hUJgYhObmvcKbZ8lWQJjL1ZGwIEoSYM63H4918rGpCAgakOlXfL7cbic5MWIA08s
	RnOR2BUgrBNUBK32ZdY6eOruGjszPQD+lOB+xfT6BbCPv3SnEzx1SB7QOMvmHY7D
	KwKKR61nQdR0L05rDRobZ3SKHc8MNefwHYNczBhnw1cRqDUEF4z1kN6oF4QcksN4
	KwCl1smFnGn2mOTx2h4sKGXLmcZxJY9RTRRxsSM6hdXVzYwvmUUOWQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d65s0s48j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 29 Mar 2026 17:38:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62TF0Dwa036407;
	Sun, 29 Mar 2026 17:38:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4d65ee5n54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 29 Mar 2026 17:38:29 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62THcSnG038679;
	Sun, 29 Mar 2026 17:38:28 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4d65ee5mt7-1;
	Sun, 29 Mar 2026 17:38:28 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: mani@kernel.org, quic_saipraka@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org
Cc: alok.a.tiwarilinux@gmail.com, alok.a.tiwari@oracle.com
Subject: [question] soc: qcom: llcc: llcc_v1 sb_err_syn0 offset (0x2304c vs 0x2034c)
Date: Sun, 29 Mar 2026 10:37:54 -0700
Message-ID: <20260329173801.1471583-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603290138
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEzNyBTYWx0ZWRfX2pxIlznHH3oy
 7d4tcnLH00p7QQCUEZz6niQ1U0/6QoYVluT90Y/rRh7/UgLnZ2KMfKPDR5LtLJgXVzdgSo9ec8N
 5iheaX26DNbokuvWJtVrcXqkUb24C3g+lTootUya6AysAPhU/L0hbQsHOE1KtsT7yv39lA0eNiC
 KXUmlSF8h/b6qH5Y/6KR0fzFi/Zao0u77aYUeYPatLkHP2BkbfZJSR+t0Bez7aT+c0WtaBSWdyS
 HIEheAtwvj2MrdW9zZLbMPSEeZrZ+JldHdCSCx2VKDHCy+CSNVBSdRyT3+0WTDJB7qme4jelFB7
 mCrOXNvfhyBifjf+x6Zfc+2cpSIx4spSrMX3E3bWGnr3KqiT3p1MlJ28QnexqeCsgTmq0h2l/yw
 pqzVX9ED/hX4cqvUvM/csws9KUVCabktGEJimggwnpKT2npWeHkq8sSNGyXVuxtcvNjoE7F5Yxt
 cRnZvZoESa4rhDcPrZF7bldT5ohEcYhqi47xIhT4=
X-Proofpoint-ORIG-GUID: Dloe_vJqbuH2F7OyL2Y89eDeMEGzo_fJ
X-Authority-Analysis: v=2.4 cv=BvOQAIX5 c=1 sm=1 tr=0 ts=69c96395 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=bRMtQGqgFAz2uBVBhTYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12276
X-Proofpoint-GUID: Dloe_vJqbuH2F7OyL2Y89eDeMEGzo_fJ
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[oracle.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100630-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:dkim,oracle.com:mid];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alok.a.tiwari@oracle.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 39BC935361F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

In llcc_v1_edac_reg_offset, trp_ecc_sb_err_syn0 is set to 0x2304c, which
looks like a typo. The surrounding TRP ECC offsets are in the 0x203xx
range, and llcc_v2_1_edac_reg_offset uses 0x2034c for trp_ecc_sb_err_syn0
with the same status registers (0x20344/0x20348).

Fix v1 to use 0x2034c so it matches the v2.1 register map and the expected
+0x4 progression from trp_ecc_error_status1.

  trp_ecc_error_status0 = 0x20344
  trp_ecc_error_status1 = 0x20348
  trp_ecc_sb_err_syn0   = 0x2304c  (current)
  trp_ecc_db_err_syn0   = 0x20370

Also, llcc_v2_1_edac_reg_offset uses sb_syn0 = 0x2034c with the same
status0/status1 offsets, which suggests v1 should be 0x2034c as well
(next +0x4 from 0x20348)

Could you please confirm the correct v1 offset for trp_ecc_sb_err_syn0?
I haven’t been able to cross-check this against the register documentation.

Fixes: c13d7d261e36 ("soc: qcom: llcc: Pass LLCC version based register offsets to EDAC driver")

Thanks,
Alok
---
 drivers/soc/qcom/llcc-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index ad5899d083f3..b80d3f9cff64 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -3943,7 +3943,7 @@ static const struct llcc_slice_config x1e80100_data[] = {
 static const struct llcc_edac_reg_offset llcc_v1_edac_reg_offset = {
 	.trp_ecc_error_status0 = 0x20344,
 	.trp_ecc_error_status1 = 0x20348,
-	.trp_ecc_sb_err_syn0 = 0x2304c,
+	.trp_ecc_sb_err_syn0 = 0x2034c,
 	.trp_ecc_db_err_syn0 = 0x20370,
 	.trp_ecc_error_cntr_clear = 0x20440,
 	.trp_interrupt_0_status = 0x20480,
-- 
2.50.1
---

