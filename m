Return-Path: <linux-arm-msm+bounces-104290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKGTBL766WnkpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:55:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D7B450F87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0E43830164DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2497D3DEAF6;
	Thu, 23 Apr 2026 10:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfDrT6Qc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Emp0Cuk9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EB53BF673
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776941756; cv=none; b=Wm2F6Pev65kuwCiCTXSKJWQb9+9u92uSL0gHefaTOIxmfQdVLiKI0D5ODLvU9J3wF11bCZisFAOzwuJeUvrPZ+dpJ/hMWPaKlr7lEx7b4yR0JT+0B1bSSDCAaQB3eZN5pd2gABOZdBKrlNJQaCduNXz1r8HXMwY5GEfnkudqLXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776941756; c=relaxed/simple;
	bh=oquimsdylq6e4dxvjPMxgAyu95+lTDYGZoRipPdYDCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rWCBaf8gwRTZ+F3KMQCoJNq+negxRjbu/+zqWpZGCzjGkiHL1zGANM4EcjJuj9D0F1xJD9og6qLBYrtuiTi8W34JOjckW2buT/kUThJJDqYZpAkR+Aox3tVSavhKkoY9znPHFciLwJnIz2l8KA5GC39dFuhb44QgnklP34LS5y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfDrT6Qc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Emp0Cuk9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8trSV028821
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MOVoovIndLii3OYcFvQGn2
	M/kt6pfSxGXHviuf+KjIA=; b=cfDrT6Qc3v7fLWn2w1vWjV7xIX5Q312B6LjIri
	au0TjdQiNnEvseJ9Oo+zfE8O1f9APEv8rJjZ4a/YjJsKlBpneorqrPTTSuqrMTtP
	meaCV6AA3nUl/rBYb3q4Q7JN5hQKpkQNcmtApwFsuIpli40PUuqTGGBLeFYrHVfZ
	uyZN/unhaGn+Z+VeRb8rBUW+YhfPf/NW+5fc+byzxm7mDPop2FqQ9besjKUcdBa1
	Oh1MUBp2/HgTuNVd+QOgjJm3Jtobbn1MGmloNfqOK2VHcMCU61aGCsxYJ0lGhLJ1
	fVlq9vttUUzTcF4x/MF9benaFu1R8AQnnv3pKuRlaUqgpWdA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqdjm14ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:55:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2d83e7461so109497315ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 03:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776941752; x=1777546552; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MOVoovIndLii3OYcFvQGn2M/kt6pfSxGXHviuf+KjIA=;
        b=Emp0Cuk9hkhll8EAOJkT9aXBRdQ+L1IuyVPwSCwVD5cPBGMDK2ApeEKoXAjI2YlFgB
         Njwl0/8g7nluoy/zhgsJAxTRCXieiIJD3nsOYR3DZxZM2X7N3mUB7r4mjpg8lB+lJSWp
         iMAz7p9KSgrA60IXPSMiig5Bd9fE82CBzlzfFURs3/uDTFEHp/9eCLMvQApa2YBCaNN5
         sDHLDDA93NOlF7glyUfqbVpaqHDaCq6nRsHgtL8bcjsD8Bg3Z+c9HLOp04tfb+h9IUnO
         9pb0DDpLMKKHFfwMf+n2yUsY92kQ/U2sGfQIJUwOQxsKDghnWOnUPYghsnVskK+ye0KH
         JLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776941752; x=1777546552;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOVoovIndLii3OYcFvQGn2M/kt6pfSxGXHviuf+KjIA=;
        b=pFxsGiwDc30a0LBLIrRqRbs/PyQSlnojXrKQPE1KjdaCFzvcpxCE1uDrN8mvju9SW+
         GcLKdLfX3NrRrEibuyS5e0TUN2Xub2oCXMmGtW87MCUjCwKmYjNFWG6LqQ/7TGhwA41K
         N653eGSY3MY0ChVZ3AqjxYgyXjF/xJbRzamws3lFTaY763XyIYW12OfTKY453xMdv2i2
         PRoXerCh6ErEkTsen+9/vX8lih7sr+dvgB93vGQf6RfUd/x3tGuXjUa33VyWLns5ZoVz
         VpqlsHtXAUOUpgFpelh/J1bFQgejcQ7Sa24LDYBIaM1KpQ+CAoYTRfJGWG/pREZ2q8l4
         325w==
X-Gm-Message-State: AOJu0Yz2yEj7A9E6Yoe98iQrrUhPoGMk53yy9pFUgxGq5HG0V0Gzvu0Y
	GUQj8ohnwBlZ4aab8DVbvq74wI4guVz3dBIzi8Wvj/kKhAlMJ2z0BBSBzwNkNPoEtbF8Y1KGvgW
	qDTufOJ1o+pyBbNS0Y+tdlf7W2TKotFF7Uib8yLC8WXR9HQXYGATI2lsGBL1TsjSksIlx
X-Gm-Gg: AeBDieuTtLU465OU0l+zpwMWpY0kibhtwkq8O3DNaYFMZsdUV6YvXwaFHRey5+vXKjz
	Z+owNfkingShfmnXXbTyeMeVK8KytzMk4rs4vFP+ki38PKduPtxkZEqMMnRVD+QU6kGugaekaA0
	2iP5HrBYAxhVCkUBXAmpGBp9TpNlid7WNHb9hqueS6qRCVYHefTTpXjtbU3EfhhA1Pn6xhLriBr
	bbVb7zrY+uLw6tVqnbauFFf1pwPMwn+B9uZr9FofKTUK/sYrQVMe8IMESHwKJQrrVcutLgvvtJm
	QOjzjt9EkNuBmr7KW49WwiiqWKUakBybCTWvmQTs/zy1XlQV/Kco3Fi/Mz50nCl2ecAvzGYP/zK
	lUaZW3uJLCCloict+7u/dALKcZ/7ZxGsY0Dla3os9RRplu7QZo3/TZA9M8mJ39gKcCVls/1M=
X-Received: by 2002:a05:6a20:4324:b0:39b:e321:784f with SMTP id adf61e73a8af0-3a08d8d7bbbmr30436168637.40.1776941752493;
        Thu, 23 Apr 2026 03:55:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:4324:b0:39b:e321:784f with SMTP id adf61e73a8af0-3a08d8d7bbbmr30436130637.40.1776941751957;
        Thu, 23 Apr 2026 03:55:51 -0700 (PDT)
Received: from hu-pphansal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797703059fsm15140508a12.24.2026.04.23.03.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 03:55:51 -0700 (PDT)
From: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 16:25:41 +0530
Subject: [PATCH v3] soc: qcom: smem: Switch partitions to xarray
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-smem-v3-1-582befff289a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKz66WkC/22MQQ7CIBBFr9KwloaZYmtdeQ/jgtLRkkhRUKJpu
 Lu0duHCzSRv8t+bWCBvKLB9MTFP0QTjxgzVpmB6UOOFuOkzMxRYCylaHixZXqGQBKSwaRTL05u
 ns3ktmeMp82DCw/n3Uo0wf9cAiG8gAge+o1Z23VZCreqDC6G8P9VVO2vLfNjcifjjYrW6mF0pN
 SjqQRPgHzel9AHCThcj2wAAAA==
X-Change-ID: 20260409-smem-3204e1ea277a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com,
        Tony Truong <tony.truong@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776941748; l=6953;
 i=pranav.phansalkar@oss.qualcomm.com; s=20260220; h=from:subject:message-id;
 bh=/lw9Z+iq7Chpy2itRAkxhrp+LFd/nYyBNtNCexJgLBU=;
 b=E8vsbaY0mRA7pxWA9OrQaBV+TvHuMxRhgF7Cjgb8VNUclvAKR8NFZza3RkhxBXNAklqzif86s
 IdQh+Jc4klqDCh8S9drORTlnWPCaEuwDGuFjvC/begNq92IzSmnV2DL
X-Developer-Key: i=pranav.phansalkar@oss.qualcomm.com; a=ed25519;
 pk=MI1mUPTtmeY/WO9GsLnjtoVy4wYL57rtVnRammLT8B8=
X-Authority-Analysis: v=2.4 cv=EZn4hvmC c=1 sm=1 tr=0 ts=69e9fab9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P3-4SwOkx1ZPlWZU1AYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 0lb4SclPxRyu6SZ1Immz0RkLejB4bszH
X-Proofpoint-ORIG-GUID: 0lb4SclPxRyu6SZ1Immz0RkLejB4bszH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEwNiBTYWx0ZWRfX17hI84jyd46z
 +/BlbsD0umsnfekq7JXCEFKvFqRSERZ4ipZjpDXLOvXSRnub7aXt0dHLnqb94RuZUSY4yRQwniR
 4rk9PHZydGuuqkfiT5NJ8SRH/i1X7J4K0r0sCsEV3a/GvAOVbRwpO1adeOfSOlVmJqzayVfiNzP
 LNzNeRDIk2qZVtf9U1DPI9y7bsexuOVfzgoFalA2h3hqsWASet8H38vBldB+FG6txlcSI6r8guD
 69B8NyZ0Iifk64f9gR+lRtCC2vTpfMQSfgbDY0a7AHALRgExkyNHHEVub4EQnBkZdxgG+dw12dT
 nisGRTvnJTMDZ+qmbkE+sdN/fPMrEtALAChLx62vlbi7abYrudR6qePpWEUs2IHFft7SzhlDyRH
 mBdXnqZTEunf5Rybv5/OXEkm2XVXc1IIn3F+clUDtd/uy+Nc7VB6t9QWGfewmsP1kZka4VTAm71
 gSEpiSFQZfcn2iVI9NA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104290-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[pranav.phansalkar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A5D7B450F87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Tony Truong <tony.truong@oss.qualcomm.com>

The partitions array is currently statically sized and uses the remote
host ID as an index.

Future protocol improvements to allow for more than two hosts in a
partition will require hostIDs to be bitwise significant integers.
This will result in large, sparse host IDs that generally exceed the
current static limit.

Switch to using xarray to efficiently handle these sparse indices and
allow for dynamic growth.

Signed-off-by: Tony Truong <tony.truong@oss.qualcomm.com>
Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com> # On Nord
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # Glymur CRD
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
---
Changes in v3:
- Include missing Reviewed-by and Tested-by tags.
- Link to v2: https://lore.kernel.org/r/20260423-smem-v2-1-44c1aed1ce12@oss.qualcomm.com

Changes in v2:
- Drop "drivers:" from the subject prefix.
- Link to v1: https://lore.kernel.org/r/20260410-smem-v1-1-8e94bb5416a6@oss.qualcomm.com
---
 drivers/soc/qcom/smem.c | 56 ++++++++++++++++++++++++++-----------------------
 1 file changed, 30 insertions(+), 26 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index d5c94b47f431..afb21a778fe7 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -85,9 +85,6 @@
 /* Processor/host identifier for the global partition */
 #define SMEM_GLOBAL_HOST	0xfffe
 
-/* Max number of processors/hosts in a system */
-#define SMEM_HOST_COUNT		25
-
 /**
   * struct smem_proc_comm - proc_comm communication struct (legacy)
   * @command:	current command to be executed
@@ -282,7 +279,7 @@ struct qcom_smem {
 	struct platform_device *socinfo;
 	struct smem_ptable *ptable;
 	struct smem_partition global_partition;
-	struct smem_partition partitions[SMEM_HOST_COUNT];
+	struct xarray partitions;
 
 	unsigned num_regions;
 	struct smem_region regions[] __counted_by(num_regions);
@@ -382,7 +379,7 @@ static struct qcom_smem *__smem = INIT_ERR_PTR(-EPROBE_DEFER);
 int qcom_smem_bust_hwspin_lock_by_host(unsigned int host)
 {
 	/* This function is for remote procs, so ignore SMEM_HOST_APPS */
-	if (host == SMEM_HOST_APPS || host >= SMEM_HOST_COUNT)
+	if (host == SMEM_HOST_APPS || !xa_load(&__smem->partitions, host))
 		return -EINVAL;
 
 	return hwspin_lock_bust(__smem->hwlock, SMEM_HOST_ID_TO_HWSPINLOCK_ID(host));
@@ -530,8 +527,8 @@ int qcom_smem_alloc(unsigned host, unsigned item, size_t size)
 	if (ret)
 		return ret;
 
-	if (host < SMEM_HOST_COUNT && __smem->partitions[host].virt_base) {
-		part = &__smem->partitions[host];
+	part = xa_load(&__smem->partitions, host);
+	if (part) {
 		ret = qcom_smem_alloc_private(__smem, part, item, size);
 	} else if (__smem->global_partition.virt_base) {
 		part = &__smem->global_partition;
@@ -697,8 +694,8 @@ void *qcom_smem_get(unsigned host, unsigned item, size_t *size)
 	if (item >= __smem->item_count)
 		return ERR_PTR(-EINVAL);
 
-	if (host < SMEM_HOST_COUNT && __smem->partitions[host].virt_base) {
-		part = &__smem->partitions[host];
+	part = xa_load(&__smem->partitions, host);
+	if (part) {
 		ptr = qcom_smem_get_private(__smem, part, item, size);
 	} else if (__smem->global_partition.virt_base) {
 		part = &__smem->global_partition;
@@ -730,8 +727,8 @@ int qcom_smem_get_free_space(unsigned host)
 	if (IS_ERR(__smem))
 		return PTR_ERR(__smem);
 
-	if (host < SMEM_HOST_COUNT && __smem->partitions[host].virt_base) {
-		part = &__smem->partitions[host];
+	part = xa_load(&__smem->partitions, host);
+	if (part) {
 		phdr = part->virt_base;
 		ret = le32_to_cpu(phdr->offset_free_cached) -
 		      le32_to_cpu(phdr->offset_free_uncached);
@@ -774,12 +771,11 @@ phys_addr_t qcom_smem_virt_to_phys(void *p)
 {
 	struct smem_partition *part;
 	struct smem_region *area;
+	unsigned long index;
 	u64 offset;
 	u32 i;
 
-	for (i = 0; i < SMEM_HOST_COUNT; i++) {
-		part = &__smem->partitions[i];
-
+	xa_for_each(&__smem->partitions, index, part) {
 		if (addr_in_range(part->virt_base, part->size, p)) {
 			offset = p - part->virt_base;
 
@@ -1016,16 +1012,20 @@ static int
 qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
 {
 	struct smem_partition_header *header;
+	struct smem_partition *part;
 	struct smem_ptable_entry *entry;
 	struct smem_ptable *ptable;
 	u16 remote_host;
 	u16 host0, host1;
+	int ret;
 	int i;
 
 	ptable = qcom_smem_get_ptable(smem);
 	if (IS_ERR(ptable))
 		return PTR_ERR(ptable);
 
+	xa_init(&smem->partitions);
+
 	for (i = 0; i < le32_to_cpu(ptable->num_entries); i++) {
 		entry = &ptable->entry[i];
 		if (!le32_to_cpu(entry->offset))
@@ -1042,12 +1042,7 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
 		else
 			continue;
 
-		if (remote_host >= SMEM_HOST_COUNT) {
-			dev_err(smem->dev, "bad host %u\n", remote_host);
-			return -EINVAL;
-		}
-
-		if (smem->partitions[remote_host].virt_base) {
+		if (xa_load(&smem->partitions, remote_host)) {
 			dev_err(smem->dev, "duplicate host %u\n", remote_host);
 			return -EINVAL;
 		}
@@ -1056,11 +1051,20 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
 		if (!header)
 			return -EINVAL;
 
-		smem->partitions[remote_host].virt_base = (void __iomem *)header;
-		smem->partitions[remote_host].phys_base = smem->regions[0].aux_base +
-										le32_to_cpu(entry->offset);
-		smem->partitions[remote_host].size = le32_to_cpu(entry->size);
-		smem->partitions[remote_host].cacheline = le32_to_cpu(entry->cacheline);
+		part = devm_kzalloc(smem->dev, sizeof(struct smem_partition), GFP_KERNEL);
+		if (!part)
+			return -ENOMEM;
+
+		part->virt_base = (void __iomem *)header;
+		part->phys_base = smem->regions[0].aux_base + le32_to_cpu(entry->offset);
+		part->size = le32_to_cpu(entry->size);
+		part->cacheline = le32_to_cpu(entry->cacheline);
+
+		ret = xa_insert(&smem->partitions, remote_host, part, GFP_KERNEL);
+		if (ret) {
+			dev_err(smem->dev, "fail to insert host %u\n", remote_host);
+			return ret;
+		}
 	}
 
 	return 0;
@@ -1229,7 +1233,6 @@ static int qcom_smem_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	BUILD_BUG_ON(SMEM_HOST_APPS >= SMEM_HOST_COUNT);
 	ret = qcom_smem_enumerate_partitions(smem, SMEM_HOST_APPS);
 	if (ret < 0 && ret != -ENOENT)
 		return ret;
@@ -1249,6 +1252,7 @@ static void qcom_smem_remove(struct platform_device *pdev)
 {
 	platform_device_unregister(__smem->socinfo);
 
+	xa_destroy(&__smem->partitions);
 	/* Set to -EPROBE_DEFER to signal unprobed state */
 	__smem = ERR_PTR(-EPROBE_DEFER);
 }

---
base-commit: 7f87a5ea75f011d2c9bc8ac0167e5e2d1adb1594
change-id: 20260409-smem-3204e1ea277a

Best regards,
-- 
Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>


