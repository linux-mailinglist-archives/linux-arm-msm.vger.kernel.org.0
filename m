Return-Path: <linux-arm-msm+bounces-102586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIPGD5aL2GkIewgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 07:33:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 943C03D255B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 07:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CD8C301DB80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455DD336EC9;
	Fri, 10 Apr 2026 05:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nqhkCkfR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNqc2JDN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6C03368B1
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 05:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775799164; cv=none; b=nlu1aVOUzj2bEB+WZ4Kq/8fPE4fl/qs3QtoB4Fmc0y8PnJGyqxQobZTize1T5SSI8IFQkW4SRWfeBAkzolqnWDuVJvGbBAtlHp4zW1BkAGSQRO4L5a8dGnxWty6Oq96iGnEArYsUI0AMwYIChrlP7EMZYCjuaMYohHEPSyVz+uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775799164; c=relaxed/simple;
	bh=nNDOyStEfKwxSRhlDiRLd1YPO4z/rxdnqy/71WIiF04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fQEVyhKHjAQjcREralKsY1flIjaXvrf5r5NwyJ954KIcRiK2bfG2i6l6MXgvUyIIaSnZ1gLMQEcFInpLI20wuu4EcEzRfEhHkThN3vfCJ07kXOVIusGeWvihNk4qCuon6z9c7UFkdMHOoDSWHKdnV/55Mjlz6ot9m+uUHxQBcK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nqhkCkfR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNqc2JDN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A0CaNg3935012
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 05:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HKtW7Uog/PnIe/VJ3VexUk
	pT0i2hZ5ozH2fSE7ogaNM=; b=nqhkCkfREP6dAK8Pj9xr/CFRmba/Du2+4gSy1K
	v+L6qeigH8t5XmU5NvdZsfbXFdexSFPC2wZkFb0ZeHciipaFkbwPAeNtn15csZsx
	Joki4OhAGsBVp1IDyeH7Pvn7E74pv+7f2JRl3Io25aos+S2zlBN9OE+LPfW9fsuj
	l+DS1j5HIRqKOORPF8zz7Dg0vB8QZMtvAt9uYBohh8gukB3/VCHRIMtAzB4E7A0T
	fzROJ8fcNc6WqSgcIhnXAzob90njD1KTYsrtGLSk8v0uGLO7PqyWnubtEap2Ldba
	OsVvgu9wNzQmnBDxGtkv4YMPXIpeeOisLUk51B3fCAZfEmsg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5sanvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 05:32:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b258636d16so19071035ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 22:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775799160; x=1776403960; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HKtW7Uog/PnIe/VJ3VexUkpT0i2hZ5ozH2fSE7ogaNM=;
        b=CNqc2JDNJttfFu4h+kXTA4pt5sIYcwjyvyke2krTUzQsaqHQpRGafvwOB/tFNS8CJK
         TKcWiFNb1XtOpluLgM7VphUdONw+fBE78cxQrcXZRgo0j5uGqlKu9HPo26SR7whe6SjO
         v/DFcuhi2z8Bs9BIWs6QCNCHsjtNUQBFYO0CIRjKLB7wNVO/P/lOhrOSpdq5rT5C6UBP
         HSqijUPbaoHnQYwjrEjKTMqIEVqdofM3CMHTobXBnDuZGpSaDrKFPyRTT4qZhbVt+T8K
         xhB0aJguYTm2qnNh+kZpDkoe9sttd6cbZqu/pVUdAKIiWl5eKq6LzGw3qkqm2qiRMwMx
         mmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775799160; x=1776403960;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKtW7Uog/PnIe/VJ3VexUkpT0i2hZ5ozH2fSE7ogaNM=;
        b=dughejZbYzKpZdR9E16GLgIHZ5jjPpaIG2mKWudZwwlU5mINv1lc07+u21pEC7+Nd8
         WCNsqNtiQSMRGfGRTvguoi/GX3UU6qqo6N7Dv0CSVmmWb8ADEyl7pw6OKu+s8Z0UvKXj
         YsONO9WUQrP/W6DRDdsompMUjOWSmfwYVskKzcImRF2Z3i5luFCtdaeT4Fp50RDQF1nf
         8irOecZfqGl6bynN5s5OO31jVBILfJNQWUn/V/Ih+zK1PECs3PayMQ4SdL93w+yb7De9
         iHzAIVbPquCFzQ5+Iv2i3Rlyw/wEdy4VhQIuGWDYbNSWMeO7I91/y5v28RGuMSnUvGU+
         sfdQ==
X-Gm-Message-State: AOJu0YxuaPpdAmNmaM7vlhY1xkFaH+/5isDQIk/6jeHeRpxlF3ExGGVR
	qKHJ5dVv6tnRZxoGZzS/51rgtwshhUyGFYfOmkRX2Lu6EDh4ZjINdBFah92/KA75vwWSRqCEXbK
	G6/SDp1Gb32a/7VEglugYuQJjCBmpT+qBsSeR9xWquQzBwuyMCtwZlDa7mhC1Zd9L2zeq
X-Gm-Gg: AeBDiesLFal3yufnM3nIwOo+KBiqB0vruepxjuR3wdp8SsZybYL68OV7g2nRZAmmcyq
	JRbNNSZEf0qR0FWZbF8SqPmfvvUML79K8oh4qay5QEDVw/SFLHsPtMfWf9KMjXv9n91nK8i7x9Z
	Kn+y3KwDRdc45+mOrD3fnpM55SkjLRX66AnWLpQjkzl4Xqe8hVvvA4s9LxxQGVkqCtzeaDgZd5+
	GNdtnT5gnMYudVEyMBWRDi2LW+vzfHZQt8BVDH+Y2+hf9+iIm8GQ5q8XMGh1L3rmJDt//ZawUCJ
	rZ+foxFkDM1s4a2rrbf7WJbKNENKNh6UEKKURufz06QvnLhfcpQW+3xcfOk7Imj9q2XmUpuoOfv
	ONxafzgybjOTPExADmLqlK0pc9c6OR3jvvQEGPmS4QtGHjoBwm9mV+HGDTBY9
X-Received: by 2002:a17:903:252:b0:2b2:4697:78f6 with SMTP id d9443c01a7336-2b2d5a8b81cmr19715795ad.37.1775799159632;
        Thu, 09 Apr 2026 22:32:39 -0700 (PDT)
X-Received: by 2002:a17:903:252:b0:2b2:4697:78f6 with SMTP id d9443c01a7336-2b2d5a8b81cmr19715365ad.37.1775799159104;
        Thu, 09 Apr 2026 22:32:39 -0700 (PDT)
Received: from hu-pphansal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4dd5cfasm18013255ad.18.2026.04.09.22.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 22:32:38 -0700 (PDT)
From: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:02:30 +0530
Subject: [PATCH] drivers: soc: qcom: smem: Switch partitions to xarray
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-smem-v1-1-8e94bb5416a6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG2L2GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNL3eLc1FxdYyMDk1TD1EQjc/NEJaDSgqLUtMwKsDHRsbW1AMHo3WN
 WAAAA
X-Change-ID: 20260409-smem-3204e1ea277a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com,
        Tony Truong <tony.truong@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775799156; l=6441;
 i=pranav.phansalkar@oss.qualcomm.com; s=20260220; h=from:subject:message-id;
 bh=0B0dSlijat1LaOx6iMYvEwg6JvXrUuooSoR1F5r1IP4=;
 b=H59GWDPQuaU/y69Xe0xZEa8w84HYdDdEBVlA4ZOQoRcbXkWryGBZoGKY8+BJztnfE+f0qjEAu
 WXlWVqIYnpUArA2HVedGK2q+pV+byr3Lehaoj11KrDgMH29mFKCG11A
X-Developer-Key: i=pranav.phansalkar@oss.qualcomm.com; a=ed25519;
 pk=MI1mUPTtmeY/WO9GsLnjtoVy4wYL57rtVnRammLT8B8=
X-Proofpoint-ORIG-GUID: usduOCvy823q0bOFwm7oCGwWUUS443z6
X-Proofpoint-GUID: usduOCvy823q0bOFwm7oCGwWUUS443z6
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d88b78 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=P3-4SwOkx1ZPlWZU1AYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA0OSBTYWx0ZWRfX/QnDeAhRCPKp
 kTvLt9r5XxOIZ29orX7QqGoH6eRCjqAH1ftQMVWhy4Oe4FSxJ/XkZT8+q5XosiJJg4W85VvV1ly
 mFGkJ0kTcWm5GdhJ1i2EkhDUnHiodmkbAbQldFPxtv8/jqd2gZcS5/jMTCA9gnEzs1B9aLn7r47
 cqGMVjt2nLCu40BLKbM6hqCAmzIwxnWEfKUNm4rHJanKGjemMP49GjdWiCFuVmj+hV9qzQTydrb
 ObSF6a3FIp1RTm4UoQKGwlXcyCQJqG8UeJSTLBCQIa8yUgHHjx9cEVIj0MXNc9DDYNS2f6ROb09
 NW6LA80NPWF4ev8Zq9YuT31FZ1CEF56Lu3hFhbbBBzmNa1tkCIpw+qFEK5AzfqvIfwXNPZn3/ys
 LQjY6B9MIAS84pP5El2kqcKrx1G1ldUHergGsFupb4TT/r99hFXNPNV501avAGL4gPPLeYO9i69
 0r+ffCduoiCxW0ho7mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100049
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102586-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 943C03D255B
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
Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
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


