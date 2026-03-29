Return-Path: <linux-arm-msm+bounces-100639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fUVEC2J5yWlIyQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 21:11:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F047353B8B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 21:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D71543002910
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 19:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0237927281D;
	Sun, 29 Mar 2026 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SFt7R2dO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49891264A97
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 19:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774811484; cv=none; b=f8brPPZiOc3wucRLjnT0IhnHODxsXzcnbMw55ioP/ewv6dZQ+ietPI24u7CJeZTYOXO13sJA0fuMtuPjxZWSWEROGV7W+xY3BFNtEkeR22IIPRA+xhc1SIJWtvSxhmQ9dxIE6iyVRf/8vLX1Q7XI5bWWKUsoSJJZTxZrPFLl6yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774811484; c=relaxed/simple;
	bh=JxY8o1taIUTkW76c8m6/9k/8DHFiwD0Khz2UU4u9cIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NzAdBdMbns4J1lq3T+Jy4iA8iPJjD01RQf+8vYCJ4FftBnBB6KuzReWa6Aa075DwjvuLbgVWP4zi1oVgQfquC9kPQWNb32vANqI0a4ne5Yk5pGdXC49fjjNmbI5L0+ZaAci+87q45YAnVzE33y77564fz99bmQAQFlbp8vpuyPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SFt7R2dO; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TJ60nm3273267;
	Sun, 29 Mar 2026 19:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=mTE7u88o0+2GLuFgLF2uKPKerQCEm
	OXvGRQIUIi7wT0=; b=SFt7R2dOB9KnforL7dAUX5YZIlvtAq0Az4QZew4motKPc
	O47zuEgmLmL2E8e/yvNFay4/0RwUd2uz2beneCAYOCwSo0Fi4pMk3bAT2WLMugX/
	Owf6gHfvfCr9WLGCYaZyabBqPPZ2S00SG9hwC7pCMjJVhPQI6EHpbx6AVT3rjDAJ
	27vqwmUQEIF4D6Dx9qyJkRoSnGweFHDAuYbYt12KMxLo8231LJnoiwll3SAum5dP
	QL10kni35VlP64oCboMUjrmZjyh8iRmjI/PJYyd8W245qxUs3p8Y5Cc6CiyqVVjw
	vQDTgDQm7un0jQ6G3jUWjZJO/xHVL/QfJfVudm0MQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d671as4yn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 29 Mar 2026 19:11:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62TGJgkF007537;
	Sun, 29 Mar 2026 19:11:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4d65e7p2re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 29 Mar 2026 19:11:18 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62TJBHjm025523;
	Sun, 29 Mar 2026 19:11:18 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4d65e7p2pa-1;
	Sun, 29 Mar 2026 19:11:17 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org
Cc: alok.a.tiwarilinux@gmail.com, alok.a.tiwari@oracle.com
Subject: [PATCH] soc: qcom: cmd-db: fix minor version decoding in debugfs output
Date: Sun, 29 Mar 2026 12:11:06 -0700
Message-ID: <20260329191110.1476304-1-alok.a.tiwari@oracle.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603290150
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDE1MCBTYWx0ZWRfXyd3tPGxQ7N2r
 QqrjhKn3UNSJq024Ymo4Slq6fxVYuJpyO2Sqw3xLoeUMn7UHefSJz4O0XumNucZKumVJfxL9LUh
 thmHiONLUGh5+GL7yMXVqDOwVBJXjxFlc5GeHZkbaVzEqzGVdm5xfFdsS8twD4hCj8RN027cRG3
 YfZkzNzkdG+nLSwKYhnOfw3EoaCd3Iigdm5pd6+3dpfW3kqh8e+Z/c0juMoNRjg0HcEL5gFJK9k
 Ic7veePBm6X6GDaHAvfH39GMPvOpzjiR/p2szafNKLRc/PF+NOmllqclu/3tzjXXiV4oWy6omsi
 UVPLA3i9Mz3oF6SsXrDFuIQocb/JiQ1rTe524Y6kzC0n33k6E7jjXk5ZzZvNF+Nw4KkIbgJg6IS
 IcS0aATg4foEph/zgmvkiS4+dEAX2dlqF+NXlVg8URNfUmiwzF9fUsbtVPu7zQ+W6718Oeaqn8f
 w8I8vA6gappT6jngB8g==
X-Authority-Analysis: v=2.4 cv=PJkCOPqC c=1 sm=1 tr=0 ts=69c97957 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=yPCof4ZbAAAA:8 a=cJNnAdIY5kokDA_VPnQA:9
X-Proofpoint-GUID: 1yN4LPvgHxnDd9tx3Y8mzCusmJom4gtA
X-Proofpoint-ORIG-GUID: 1yN4LPvgHxnDd9tx3Y8mzCusmJom4gtA
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100639-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[oracle.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alok.a.tiwari@oracle.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 0F047353B8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

cmd-db encodes the version as major in the high byte and minor in the low
byte. cmd_db_debugfs_dump() prints the full 16 bit value as the minor
version, resulting in incorrect output.

Extract minor from the low byte using (version & 0xff).

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/soc/qcom/cmd-db.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index 84a75d8c4b70..eed7013c7676 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -301,7 +301,7 @@ static int cmd_db_debugfs_dump(struct seq_file *seq, void *p)
 
 		version = le16_to_cpu(rsc->version);
 		major = version >> 8;
-		minor = version;
+		minor = version & 0xff;
 
 		seq_printf(seq, "Slave %s (v%u.%u)\n", name, major, minor);
 		seq_puts(seq, "-------------------------\n");
-- 
2.50.1


