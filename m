Return-Path: <linux-arm-msm+bounces-93190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GG1mGeBvlGk0DwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:40:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB30114CB44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5981304A591
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38C632AAA2;
	Tue, 17 Feb 2026 13:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YmxroiUI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gc82fOcW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E4F35893
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771335548; cv=none; b=cFLJIDxqM5IFdo0C5V6ukN99FstbUcytrVEmCkdkg3Q+EBS+5NCMr6bz4sKVIUaL9H1+nSSH86V1hkb3dxrWRWoXLNOwMmWLUqoxw90QVVamnVXyp4LJr237HlBmHPZ2VB6oeP+iDrlzjRN35/ycStty1+0o5FK7MTYLOR259C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771335548; c=relaxed/simple;
	bh=HJDNt91D/j2nXj4gnKdNb4azIcKmC5muEgMpaKp8Rzo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ft74jgsh3NZpXXanqmWrNCulYkU7+LCuCnVONoHu2Kbe6rlW9tkD6bW5Xuv8KwIk7pssor2rAl5EWBbJzzsCLPkkS0cpvg+JHumFq9cy3OppbFMA29vjq4rf6QQBMZpPgxnY4lP60MF5xO7ZdZ0uWdxwHCAx2IpTDJezomcGqt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YmxroiUI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gc82fOcW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8G6K1048833
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JGeXF8euT1K
	6JPhYp8BXUxoe6xjC4eB6jpYZkv5NCFI=; b=YmxroiUIkoGb4NbOS24CuIcoyAr
	twSF5KCIlgS4SuqwpbaX1RM37JQ19xsleByINu5aj60mMXaUHZz3dFq4gv2R7KDB
	HTyaSeGrPQ8d3M0RXT0E4v/1vIWcH0awp5Lh0NY4bRUAcQcTCet/N61xm/7tMHYR
	plzNDey2D2uGqSDxeOC9Rv1ACePn0kbApCO2+T0J4ycjtO0yZJ2uUDb+uVNAQWwR
	SzaDW9rrdd+lfo3Qpe9Y9q5mPe6i+JIJSdk7KkLBgp9/h14JPYUJuTuq6B97S87m
	Db/Daq7Q6ljlun9ctcGcsJxZubuBvbiSnNmHr52o4UM7XTKIz9OJW+65/gw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d82hux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:39:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-824bf5fe8cbso2033711b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771335546; x=1771940346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGeXF8euT1K6JPhYp8BXUxoe6xjC4eB6jpYZkv5NCFI=;
        b=gc82fOcWE3RxVJB4Y4gvt9DIjZznvi/HAB4pZT+bT2GGZ6+SqsQQ6tnh9HnrDl+BmG
         FbgU/DS4npeUuRUe9UWtCX1NAfU+/X8cOhD09ctCUvaPb/G+jvCDbQW22VkjQl9n+r9j
         mr2yCrI2Vq+B6ECWY0SDRAl1cS79to8tZWNnMTExaPa5P9XNWFqxgckrmI4yJiU+YawT
         t4nv6XxFNJTLQEYRpCPYqedYc3ieKRBr8xl2ncHd2oIZ7SnalXnSXqClXE86hdRYDgWy
         5W/Aj0NwqYTRBOl5GGfgA9dN53qh8fBmWoNRA2pHXvVDIG33j8NQm6SJcKr96hJMM09c
         snJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771335546; x=1771940346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JGeXF8euT1K6JPhYp8BXUxoe6xjC4eB6jpYZkv5NCFI=;
        b=Uwnt3vtK/8N3zb+t1E7MTvtOwTcrByHsYL3TvSf5NLsH0XvO9zpAZHYmSALju5/ghp
         88dJsGn2a1sH5wNmpN5ZUuP+85mlNdk+y4PzS7awUx1Y6dnwc+qx1uGyjL9ZyUTcSLX6
         Ur7ChwMLn68yG9VAPgYGuiF65lk4dusgjJzpAB0K2rC9s27FQVrB4XDbFbsylYENdQ6i
         5M4wJRWUlUFdwmQhD8e6kairQ4nUaMlS3LqoI/9QX4IHFrsj8ojMqLgXutUXxVfGwyGx
         EU8qbnZmPZV0M7MpccLlBoalzDmqL6V6Vjw44FhLT/BLcfOVuiDp0LETo/gg6s+8h1ek
         ekuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpqk8ZmkIxAaNJ6KfMVWlVgP7QkqDIqbkSJj92o+dAKZqnU9htrIu1vy9zDdCutpxAPWCchXbsCrf0bE9A@vger.kernel.org
X-Gm-Message-State: AOJu0YzWDu7Qa0GE7SnHuJOsSjCjWVcXmBOPkqQmQMwEPsnn5PrjQLW2
	GmAAm1PyynIFcXpN53ZlhnPZtjPISc5TVWHyDQ+u2WJHDzOOI4LDpCArD0TbR5yOeKpaZcYHF4f
	d3uHBJ7DTZeHCE1B7da1P3E1ay7vyGmhjzG0a7UgG6Ih2Rqw4Lnzr3cGwdNWP3I9bedcJ
X-Gm-Gg: AZuq6aJk7ccBGuMVI27ONHdcgE26gCRyOGOHKW9Oiq0jMobx8MCr/lb31O+BRAciL38
	0/5P4lp+VIuCOB+IH5+d1IWYfKPFcntfsZjtpyywYTLi62k0454m1/vK30bCrXhpOCfsCrPxXDJ
	V9RGQ/YAWnK4gMqp9p3p3S0H9eTDxLOiVnVcJaQmZiNwO8yarcgPl0/XRWgZmVERZ7LcE76/X4G
	Yxkzp4TPbZL7ug54TAtNPgCTFv4fheC2dmKFwkQpt3o5ARUuoXGeLtlNhx82etCRmF8bdnFPrhy
	fwoCVXVXDqAooH8TF/NLGGbZHQmRPsu5TQWm0dcRWll9C0rmZKSfif4FTORUZVDoRX7vGEQyydV
	JnoaXgWDX7zenwkqNAzQ7Ve2P3Mkoh2m8OZpY3ZMM/TABnBVr1mWr
X-Received: by 2002:a05:6a00:1c96:b0:81d:dd3a:b8f5 with SMTP id d2e1a72fcca58-824c963f32dmr11294311b3a.38.1771335546057;
        Tue, 17 Feb 2026 05:39:06 -0800 (PST)
X-Received: by 2002:a05:6a00:1c96:b0:81d:dd3a:b8f5 with SMTP id d2e1a72fcca58-824c963f32dmr11294291b3a.38.1771335545559;
        Tue, 17 Feb 2026 05:39:05 -0800 (PST)
Received: from hu-kshaikkh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b935c6sm14633207b3a.47.2026.02.17.05.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 05:39:05 -0800 (PST)
From: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org,
        yang@os.amperecomputing.com, dev.jain@arm.com, ada.coupriediaz@arm.com,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: kprobes: disable preemption across XOL single-step
Date: Tue, 17 Feb 2026 19:08:54 +0530
Message-Id: <20260217133855.3142192-2-khaja.khaji@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217133855.3142192-1-khaja.khaji@oss.qualcomm.com>
References: <20251106104955.2089268-1-khaja.khaji@oss.qualcomm.com>
 <20260217133855.3142192-1-khaja.khaji@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=69946f7a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=lireVsuIo57cRQcYBF4A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDExMCBTYWx0ZWRfXy12xs1R+y2XJ
 7jxK8lVVMKiWNTgQkOLlsLEOYG2vg97cMjiZOhrIqkf0NGVkM1eb0ORQiuCo2NFJgHGpyMaPN4y
 5GkmOX2tCLUzuVIbaeVQsOU6G1mzuAjMH4Q/bTruTYHfCRMrUFZjOH42m4RC9AlNa6Whac7JPXt
 +G7WhLw/xNECwFE1bdw1ynPbHiabcVIFmPjtdiSb+1vAERfyoMctDk6jHTTPV39+wXHkihTZiva
 c0oChOIhNDgbRNxBoWnC1DnqMkdEg8ENezioUsc52nk/kq6YaXpqVEUyv1FD7aVUHmds1EduLnb
 iM8y6vJN+0GLCYKWYmSIz5K71U+/I8tAIrs2M3Nngh5C7i4u1fhfQ6xNiCo3gCIoQbGvlINdRWp
 o3bqDTdZlevcMgiBy9IhupMfAvPQjUfHf5LrcEaeAuD/83Y/9wRADMCvNZHYICV9vzHvx87fqps
 5QxediOwKpWFRJSx8Vg==
X-Proofpoint-GUID: fRLQViVbd23Zo99_jV2xC95cEzzdIYCq
X-Proofpoint-ORIG-GUID: fRLQViVbd23Zo99_jV2xC95cEzzdIYCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1011
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170110
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93190-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[khaja.khaji@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB30114CB44
X-Rspamd-Action: no action

On arm64, non-emulatable kprobes instructions execute out-of-line (XOL)
after returning from the initial debug exception. The XOL instruction
runs in normal kernel context, while kprobe state is maintained per-CPU.

If the task is preempted or migrates during the XOL window, the subsequent
SS-BRK exception may be handled on a different CPU, corrupting per-CPU
kprobe state and preventing correct recovery.

Disable preemption across the XOL instruction and re-enable it in the
SS-BRK handler to prevent migration until control returns to the kprobe
handler.

Signed-off-by: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
---
 arch/arm64/kernel/probes/kprobes.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
index 43a0361a8bf0..d8a70c456543 100644
--- a/arch/arm64/kernel/probes/kprobes.c
+++ b/arch/arm64/kernel/probes/kprobes.c
@@ -227,6 +227,14 @@ static void __kprobes setup_singlestep(struct kprobe *p,
 
 		kprobes_save_local_irqflag(kcb, regs);
 		instruction_pointer_set(regs, slot);
+
+		/*
+		 * Disable preemption across the out-of-line (XOL) instruction.
+		 * The XOL instruction executes in normal kernel context and
+		 * kprobe state is per-CPU.
+		 */
+		preempt_disable();
+
 	} else {
 		/* insn simulation */
 		arch_simulate_insn(p, regs);
@@ -363,6 +371,11 @@ kprobe_ss_brk_handler(struct pt_regs *regs, unsigned long esr)
 		kprobes_restore_local_irqflag(kcb, regs);
 		post_kprobe_handler(cur, kcb, regs);
 
+		/*
+		 * Re-enable preemption after completing the XOL instruction.
+		 */
+		preempt_enable_no_resched();
+
 		return DBG_HOOK_HANDLED;
 	}
 
-- 
2.34.1


