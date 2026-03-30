Return-Path: <linux-arm-msm+bounces-100730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAz7CxhJymkQ7QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:57:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6C4358B30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 379CB306ECA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB68C38644E;
	Mon, 30 Mar 2026 09:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UDycexM1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F59939F175
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864315; cv=none; b=cNDQL9x9WWcjoRqb0S1mbVncdvaH2aM5Hsgdrcgo09OLndAl9axtdCd6ckaB8zXtBBDLTFVTmIcTnchK/wRuRRtc8C8ttbGFf9DuoIvt2Z7ihm+uecANSOQiis34u3YKwNXbc55i+oONuYxdyvWA3/Fv/roF60iUUvz4//q095Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864315; c=relaxed/simple;
	bh=Ka7q2VvJuW9vt/90Op3zIY3V1zMXHlmAXKdCFOKkuOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mZ99uwlJi67E9/QCRzGhp2DgXR6mXPkV0S/BS4mIs0L7RnTN7wr+2o+A6x/KM3XDvhwJ5iM1J3TAsgy8X1aSnpeRuMBa0Zu45DkPDIcRExYZU7ezzdQcvfnBKDekDg+vwn4KqTm3auXF5nhj4PVT8MDz1S6etg4+A0ZkdY/gxl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UDycexM1; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U2oNfc2698484;
	Mon, 30 Mar 2026 09:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=Qs4oUT0uSFNaSPkKmaRR8+mOEbISA
	Dm6iRDKOHt19R8=; b=UDycexM1SAejgXPWiWoPHL7ctn+J6XEP9/qUcoMFfKdAG
	WuH9DfxGV1PJyJtTQ4PI1OSw5wDQ8Kgj8ZLuNUPlSNWCqX/wISFMqc1R/ClZdsTc
	VCF7F+Urmp6ZcfPnC5sxasEy+vWWdoSB+sVoZ9LwCDlna4p2+ylsQpoEpcuibBEY
	oZS/kcmlHXWr5ghpvJ9rfRCYw4p9eg6tMzR4+56ntKv2t1M/6EByZkb+xE9ab0os
	aEJUXWqbOJxnZ43yCgYCdnyTv0TjsG8aCpB4Ob35uMVASfWAehThp14Ivxz9NA8H
	OBvGNLzATHs84tv8luYLQAQprrSwvYuJFkkBx9qbA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d65s0st96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Mar 2026 09:51:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62U87L8S022296;
	Mon, 30 Mar 2026 09:51:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4d65eehydd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Mar 2026 09:51:49 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62U9pm11014455;
	Mon, 30 Mar 2026 09:51:48 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4d65eehycr-1;
	Mon, 30 Mar 2026 09:51:48 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: konrad.dybcio@oss.qualcomm.com, mani@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org
Cc: alok.a.tiwarilinux@gmail.com, alok.a.tiwari@oracle.com
Subject: [PATCH] soc: qcom: llcc: fix v1 SB syndrome register offset
Date: Mon, 30 Mar 2026 02:51:11 -0700
Message-ID: <20260330095118.2657362-1-alok.a.tiwari@oracle.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603300076
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NyBTYWx0ZWRfX5cwVBpr8KIPa
 JhOXK0aemaFGhVR+rgwlcuSmPtZrRbqFAOLT8Fh2Su92D8FiIGYtThgjZJ+MhgOpciFjKgJEJo3
 hUqndPved/m+T2gi7+t1wrlx+iOr8eO6TUFr+HeDcNC1ROpcOZxaiLbkgVP8KpuCwi2t7fCe/PC
 2UdH4pUIHbOc4i+885FbYwQAwKu0U+4Cp/Y+BjZKcjBV3vM8DDnj53hXnExOB3u+zU7LwtKc1FB
 ksa764i1wNjS0s7eAa1Xrojd/kze6PtO4k/Nzj+athV3Pl73XwWjkypeLPkZl+gwtKoP7wT5exJ
 VyyknLPdbnWy9lPUAEWn15Aus1qT5X9PI0tMuAGTtYuobJxLTLfk8JxIZnHTFlEp+qesGnXh3zM
 uKsG+8EUM3AY63JZl7Eriko34GlniOuS+lyAiGUcGDOjsNSwdJiUPcybiH61CDpyKlXVDfCIwCE
 tThoT50IyW+uyZJIUnq+lqk+LzCMRLpkApauDju8=
X-Proofpoint-ORIG-GUID: FeZ3IFwp_W25JdJEkQbQAlbhhui3XsxF
X-Authority-Analysis: v=2.4 cv=BvOQAIX5 c=1 sm=1 tr=0 ts=69ca47b5 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8 a=FkhpNeE79AVwP5mYnSAA:9 cc=ntf
 awl=host:12275
X-Proofpoint-GUID: FeZ3IFwp_W25JdJEkQbQAlbhhui3XsxF
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alok.a.tiwari@oracle.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-100730-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[oracle.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:dkim,oracle.com:email,oracle.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9B6C4358B30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The llcc_v1_edac_reg_offset table uses 0x2304c for trp_ecc_sb_err_syn0,
which is inconsistent with the surrounding TRP ECC registers (0x2034x)
and with llcc_v2_1_edac_reg_offset, where trp_ecc_sb_err_syn0 is 0x2034c
adjacent to trp_ecc_error_status0/1 at 0x20344/0x20348.

Use 0x2034c for llcc v1 so the SB syndrome register follows the expected
+0x4 progression from trp_ecc_error_status1. This fixes EDAC reading the
wrong register for SB syndrome reporting.

Fixes: c13d7d261e36 ("soc: qcom: llcc: Pass LLCC version based register offsets to EDAC driver")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
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


