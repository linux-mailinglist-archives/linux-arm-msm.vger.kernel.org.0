Return-Path: <linux-arm-msm+bounces-94873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGLTEVZtpWlXAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:58:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8621D70DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 666CE3084C84
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA83B35A93B;
	Mon,  2 Mar 2026 10:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BjIwmnOF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jiiUe/kk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C0C35AC1D
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448836; cv=none; b=YOt/coOqUR01BFDkE7LHC43MNV8gXBbrZhqvLPWOS9sW26ElXPGrVxnc3879BY8ZnU6NAfX3pnz/+BR+0/H+dHuqVsz5zNN0bUR5AZnZin/h2RoZOb7ZhDxtm74u7hWJg56T1vaxnzCsVGZoncZ/44JEF+5glRIPAyP5OCVYVvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448836; c=relaxed/simple;
	bh=z48fVF0lJd2GDvLDQs+NfzoACzQIrm9lC8rVn6midEA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VBMKwPwgPOiWPWPxq8eWgY3Ar/Iwld+GBPOEm9AeSBU4wHUjSTIGB0vINdnqmJ5cxTckWMQYE5N7RXLErkLEUpp+QjTRdgJVFOULjHdiNY4jJEMwSpeLR1qWMs8vZ3O+NMngPGaZsIOkMa1qA9Hc1eBJ97gYs9b5oC+dNIqJovk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BjIwmnOF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jiiUe/kk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62288JCJ191536
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 10:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zzJN+64IcS+
	RyJd/VgnL88SzR2FVDldBCnYxEzN1kLw=; b=BjIwmnOF5xH6xDd6eec+v1itiva
	8gnAHGqfa7HB9TOX23fumeeEu7x9LkhVITQSlqnTzVPwZhgi865T2adIbcCQ8gg2
	bvk32JfgLwmqX91mz2TDszeV38RhsWqdEHu/AOQhXN4AmRBt2ETskS1bzH42BbA1
	aAFCksAcoSFF1j+cqLERlkHmKDgYDlnXfabpW3vdg7X+sXeD+H7Ov21JBjOdlulX
	zvh65MAyoFtH3xuMmv9A1ZQu+A1RIedG+mivrSd1Me1g7w7pRDmqRz4FKwpnbvMG
	VpwrEs/ZkhQ6OrTjKbC3obKp738lJL9YzF6NclqAHaioIGHQP8FHq8EZx6w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw64a23r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:53:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e1dab2235so2437382a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448834; x=1773053634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzJN+64IcS+RyJd/VgnL88SzR2FVDldBCnYxEzN1kLw=;
        b=jiiUe/kkZvjUMt5M7UvWhts2HjLlaJFEx456ap4CBvz+V8Zw+F6ezQ817um7FRS4QD
         cHaODCD7WF6+BBr2ohpP2kkIVmCFA1mcrWf/Eqw/md2lKg4TytPux404/wTxOSVMahG9
         6w1x88Rs0LpDIQ0x5bAJn18wpNyZHX9gNpOuU23TqwK50xA0fwX+jHeG8cvvYTQWyotr
         fxX7ppo2qOlO1jGQbqv87fPwVDnmRpPmX8cBzCujVzbRC4zgocTPYXiEQykzphaVHrtN
         4769Bj859BA6oKjmLwuJZY6FqAVC4eJBCzvUO/LWxn4D+BmWV2LyzScSasC5pYvw/Q2X
         wcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448834; x=1773053634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zzJN+64IcS+RyJd/VgnL88SzR2FVDldBCnYxEzN1kLw=;
        b=lEQ3J4GqY1tbKuFmTTG/+TCds2psU6eASSeSx/+yme/o+3fyczsUXmiMfNmq7Ke5Mf
         muGUOCR0gExGaZwXRW9Pdpttshtdwok4CLoSokMV7W3KM6eyLaPdT4Vrtrzu/DK8b/3M
         MaAecurH0CGu5Vk3xOGWXgl0JuclhgnQq1MpebpCvbHMrp1kUjTgXwfm37O5evQU6Ir4
         8qIBe7QGi/c4E6KL+k842WRzJRfHbKmFC3k7UFhKCE3vlEU/7KeLibrRLwQeUovMF1Bf
         TA3qww4O0Nm7dfDvWFs4La7pmMq+w92w/vt7eY9GXICN5Ts+k8dQh6dwl/2q8yJuTETn
         ts7A==
X-Forwarded-Encrypted: i=1; AJvYcCUGbzwIeQVFhgGbIv9wLOkM9amekcXu54Xzaqll8Vc3ORUZSQN0GnSErrexH1ValLne3mrDOBItQXDTs+OE@vger.kernel.org
X-Gm-Message-State: AOJu0YxDI1H5bBu6wUSGr4WfbIFq+jbsfyroVXHDBxjBbd4m56wdI921
	TfdztcD5JmWSxAnoX78pQ9MK8uqXaKFVOuX80FVH6JXe9qJilkdv0PBSAqEbmBaw7pI3DW6vBsW
	1kJOObB7rkgFR6acY5rZqv/PIJzjTZTJtow7EWojSj/R58LEW1I/OhQz+uOXOsUFLkEor
X-Gm-Gg: ATEYQzw9+sFG79tFMqAAUP9r5VewV52EVMs8famL3/bAw35x/+itp0mYkTENx4GQAWf
	pADhb2nkBRP6jNobjWhfGvFmTrcdxgiwb7vvcUGZ/sL/fHDEZ1h1b9FDYmRPeMgUG6GYz+iJBZJ
	8RxCkUAIUQtzIBk1zPdp+mLEqBPjeb9vM2wm6oQzOE5mMyqVO/194zY6sXWnvCgKv2zSbAHGxSP
	nwWgMNeKuVbGPzhBMzF6vXszGL6dA92YSPz7b1/ZyJg/DD//jqmFEG755zz+V+nACEYA6RORKlJ
	aUb8/9N26V4xWvPomtms2NNRqDOA+uHDZ7hOx9VSneVf/+j9XXnl42k4U1fwMiHap1k8ieUE/jD
	UHLw0V0+B7izt/UOithzx+KPR3xeJpjGkyaejXoPDUdKIhUeK2+m8
X-Received: by 2002:a05:6a20:d74a:b0:366:1880:7e06 with SMTP id adf61e73a8af0-395c372d14bmr10504460637.0.1772448833898;
        Mon, 02 Mar 2026 02:53:53 -0800 (PST)
X-Received: by 2002:a05:6a20:d74a:b0:366:1880:7e06 with SMTP id adf61e73a8af0-395c372d14bmr10504442637.0.1772448833428;
        Mon, 02 Mar 2026 02:53:53 -0800 (PST)
Received: from hu-kshaikkh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa632ddesm11847479a12.13.2026.03.02.02.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:53:52 -0800 (PST)
From: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
To: mark.rutland@arm.com
Cc: ada.coupriediaz@arm.com, catalin.marinas@arm.com, dev.jain@arm.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhiramat@kernel.org, will@kernel.org,
        yang@os.amperecomputing.com
Subject: [PATCH v3 0/1] kernel: kprobes: fix cur_kprobe corruption during
Date: Mon,  2 Mar 2026 16:23:46 +0530
Message-Id: <20260302105347.3602192-1-khaja.khaji@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
References: <aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: s-clUv6Qm6U-m_P3WlzKSeODBWRjQC6z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OCBTYWx0ZWRfX9+B4m01JwSRI
 UZ/KJNIS78COEzKJLaiTFP5ZDZfFBNUzwduC173NTJYS30d2+0Fz5nWDXvZj0T8Fo9W/2nhIqaG
 mG+V6nzc094fTcXf22iA+pxUym8A6FP9gkofkjXxrZcOiR8nr8O59SQeA1F+IF1Wy12qlUA6Y2q
 ur0RRcvNRATJeOZwmMj/9G/DSNYApz7+mHsJHNo+WOzaPkeVWoqFKNzT6yAk4XVEVDd7KTHNOYg
 Tkygb+eKLBbkO17QOPW/IHTvFMSiSsfr9fj+bGYCcMVp1f3V7H9HVdDdA4PmqKuejIj6gRdaVRt
 143pbFCuXvKvhsORYJg1b0sOsJcmzCwnRxbUo7zhgsKevALdd3T07Klm+HfNtVoPIDO4dgKfZ1Y
 ybHpcmU0VxtM64YP1lpeIgrmcMLyqYb5S+G0fW7oyM6PofLngvVBbD46a5tgalpg28lo21fxF5H
 JpAz38iVxDLBJXy8Tew==
X-Proofpoint-ORIG-GUID: s-clUv6Qm6U-m_P3WlzKSeODBWRjQC6z
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a56c42 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BfyKfM7flnzB51c3jB0A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-94873-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khaja.khaji@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AB8621D70DD
X-Rspamd-Action: no action

This patch fixes a kprobes failure observed due to lost current_kprobe
on arm64 during kretprobe entry handling under interrupt load.

v1 attempted to address this by simulating BTI instructions as NOPs and 
v2 attempted to address this by disabling preemption across the
out-of-line (XOL) execution window. Further analysis showed that this
hypothesis was incorrect: the failure is not caused by scheduling or
preemption during XOL.

The actual root cause is re-entrant invocation of kprobe_busy_begin()
from an active kprobe context. On arm64, IRQs are re-enabled before
invoking kprobe handlers, allowing an interrupt during kretprobe
entry_handler to trigger kprobe_flush_task(), which calls
kprobe_busy_begin/end and corrupts current_kprobe and kprobe_status.

[ 2280.630526] Call trace:
[ 2280.633044]  dump_backtrace+0x104/0x14c
[ 2280.636985]  show_stack+0x20/0x30
[ 2280.640390]  dump_stack_lvl+0x58/0x74
[ 2280.644154]  dump_stack+0x20/0x30
[ 2280.647562]  kprobe_busy_begin+0xec/0xf0
[ 2280.651593]  kprobe_flush_task+0x2c/0x60
[ 2280.655624]  delayed_put_task_struct+0x2c/0x124
[ 2280.660282]  rcu_core+0x56c/0x984
[ 2280.663695]  rcu_core_si+0x18/0x28
[ 2280.667189]  handle_softirqs+0x160/0x30c
[ 2280.671220]  __do_softirq+0x1c/0x2c
[ 2280.674807]  ____do_softirq+0x18/0x28
[ 2280.678569]  call_on_irq_stack+0x48/0x88
[ 2280.682599]  do_softirq_own_stack+0x24/0x34
[ 2280.686900]  irq_exit_rcu+0x5c/0xbc
[ 2280.690489]  el1_interrupt+0x40/0x60
[ 2280.694167]  el1h_64_irq_handler+0x20/0x30
[ 2280.698372]  el1h_64_irq+0x64/0x68
[ 2280.701872]  _raw_spin_unlock_irq+0x14/0x54
[ 2280.706173]  dwc3_msm_notify_event+0x6e8/0xbe8
[ 2280.710743]  entry_dwc3_gadget_pullup+0x3c/0x6c
[ 2280.715393]  pre_handler_kretprobe+0x1cc/0x304
[ 2280.719956]  kprobe_breakpoint_handler+0x1b0/0x388
[ 2280.724878]  brk_handler+0x8c/0x128
[ 2280.728464]  do_debug_exception+0x94/0x120
[ 2280.732670]  el1_dbg+0x60/0x7c
[ 2280.735815]  el1h_64_sync_handler+0x48/0xb8
[ 2280.740114]  el1h_64_sync+0x64/0x68
[ 2280.743701]  dwc3_gadget_pullup+0x0/0x124
[ 2280.747827]  soft_connect_store+0xb4/0x15c
[ 2280.752031]  dev_attr_store+0x20/0x38
[ 2280.755798]  sysfs_kf_write+0x44/0x5c
[ 2280.759564]  kernfs_fop_write_iter+0xf4/0x198
[ 2280.764033]  vfs_write+0x1d0/0x2b0
[ 2280.767529]  ksys_write+0x80/0xf0
[ 2280.770940]  __arm64_sys_write+0x24/0x34
[ 2280.774974]  invoke_syscall+0x54/0x118
[ 2280.778822]  el0_svc_common+0xb4/0xe8
[ 2280.782587]  do_el0_svc+0x24/0x34
[ 2280.785999]  el0_svc+0x40/0xa4
[ 2280.789140]  el0t_64_sync_handler+0x8c/0x108
[ 2280.793526]  el0t_64_sync+0x198/0x19c

This v3 patch makes kprobe_busy_begin/end re-entrant safe by preserving
the active kprobe state using a per-CPU depth counter and saved state.
The detailed failure analysis and justification are included in the
commit message.

Changes since v2:
  - Dropped the scheduling/preemption-based approach.
  - Identified the re-entrant kprobe_busy_begin() root cause.
  - Fixed kprobe_busy_begin/end to preserve active kprobe state.
  - Link to v2: https://lore.kernel.org/all/20260217133855.3142192-2-khaja.khaji@oss.qualcomm.com/

Khaja Hussain Shaik Khaji (1):
  kernel: kprobes: fix cur_kprobe corruption during re-entrant
    kprobe_busy_begin() calls

 kernel/kprobes.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

-- 
2.34.1


