Return-Path: <linux-arm-msm+bounces-115603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cIVDFTHMRGpU1AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:13:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C966EAFD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:13:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JSRSIxnv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TykgCEWT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115603-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115603-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D01E3056C31
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 08:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC8A3E075C;
	Wed,  1 Jul 2026 08:11:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F493DC4D9
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 08:11:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782893505; cv=none; b=lNNgx7+4mlejDPdtfX4zBcO+KZkzOhre9kr7RAKXQrM3plZ7jeIXgMiK/0PsPU4rP3AKxB26tt6jseLBDkPL7f+tyBiItjp2B3VXdIL3cAyN9UD/bmfZHizt8+5x4sRI7d1ux7789lP7bGuR4L9NY/lg2y+0/EktOku3mp1SGjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782893505; c=relaxed/simple;
	bh=s07d/KeS2ZtNoeIFJbl1rn4HC6wB79S5CwrU02vQ9/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CeXB89GJMEEGRj1yf7hVFw18E0uMdGQjhp9TwyrE2ju9aBs4ZPY2Z86fwOZQ2C6uC5cAc7Kj4FwLhhPQAAf2Zry66YZspL/5ThT4n06kh894dres8batYDn1OXbvb2Tvu5Gs+waqMPjWcPhTVJ64L0NrnwIyxIYOvTyYHuV8nE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JSRSIxnv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TykgCEWT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lWSp059158
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 08:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=umzU2CpFSZMS7JmI/ccMyh
	FV6ZNUMd1wMHgHsjP3Bz0=; b=JSRSIxnvAPZStuiv5aSdvVApUoCsYF6no3RKJR
	FrzCcO2IK6A0nr9g8E8iVtX+FPpY6GXiikqV5LtTcH1T/TO+iyv+LRpEKeiL/xDO
	d5QY4X1Kl1ywM2hrDig/bpSGvy/Xacj+pmBoEW2UG/nfwpr7psN5ylLtm6A023F1
	aWb7h6WuLHVv7TD6Ri854nOGaoXgTPyt/O0BRmA6qFhQ3gqdjbT1gxDuTm/YZKZr
	nRHQAUcBej8VLYoRmXCVX3enDAAr2W7ZimEZtYvBNteWhEQrbdGXN41RE4NhSUJJ
	cF0QK9lcRGw0u4O6iEv0Iz385vxG8dP7LPwEaqcBM+ESmtbg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sk1j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 08:11:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c9f452d260so6629495ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782893495; x=1783498295; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=umzU2CpFSZMS7JmI/ccMyhFV6ZNUMd1wMHgHsjP3Bz0=;
        b=TykgCEWTctDAIaeydWoJKTH0B5OBn8mLN7evOs/SNhKMwE3ek57Rlh4O1ZiLlUBuLk
         yTATpHAr33m3dvyQ5FoxAZnEQ/0PUMDcmcLQHwMtSSbRCMzSZbQ6TDbzKs9jsYi2xxYS
         kxY/UYy8qPMvyqdMXPVhRly96Hn3XGJb4KNw73UHMLD4Djy8ZFxWpnF2oh0obvYOPKQR
         JsYeinYrQ5ZYSDYD6Cm1UjFaU0HQ5R6VnJMYFhyawZ5sb8AxaR2SHaN9zXKV/FpK8Gg7
         V01R7fFmO1An61E33F7Ad3Og2hnew3Nn2QyM9FOn+QsjmNQM1Fw74hN/tf8tgVcw1vd2
         seFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782893495; x=1783498295;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umzU2CpFSZMS7JmI/ccMyhFV6ZNUMd1wMHgHsjP3Bz0=;
        b=VD+5bEGBFGDg46xlR1Gt+5K5r3fYMhLSeBnYyA5hbk6hu5pt4070V5VcEIhSkeHXEa
         rw3Hg0u9DduDmDBXYpIOY7z7m/PU7wpbxPf2+YjVBCSPgoVc3O4rKsunDbSsbRhUM7YA
         DWBy/A2BbwuFkI6JcFbimkS5ps0EFuInF7ePikGj1+bV5lZrhvtPkF8fhHwuQSvF9OSr
         BVF/Qf12F1dmSNj1cqEgpuRp6wboOMyq1Qb3SZYeHGRTLWQIaCy2329FB5OYK91hagJe
         m7Ih2wYS/3VZbV3pJzvbPiTVQ8PnrRYu8gE9jd1vXF97nyMrQP9W0BjjglowNnFo4tSc
         9tew==
X-Gm-Message-State: AOJu0YwiYN+kSmZ5ca6n2Vq7NJpvk24gVI/P9OIQs4U8HZwJtVSbyUwj
	gEDJyHTImVYVxui0VPQ2XOVMLLjxYMr5NGdtXjMtuCWiNN8erAHTTtJvZn6UhfvbGg1Ox42ZfW/
	qy8ywoDTppm/+tbLSFAhdD7miw/DNtEMpZClq7R82iHwjwAXq840paE0qbniMQ9SlXh5vOnYcjZ
	oL
X-Gm-Gg: AfdE7cmgHu1s52NDc7Wf9ctTOVIAb63kyhmTFX+SosxiDlR/qzb9EzplZBDSsATy6Qd
	zoQy21Nrqq3MB6l4g44w1BBpKbL2MZNzGxmuH5XddcoHfc/ERX2Rou8UFMZsNk8dpyZRxH9D3rU
	/Ufij06suRuTNB4dORWzh66smKw8ICsixYE0p9L1gbBQJnwhTwPa34X0vssRadAWsgJY2AcUWdN
	ObhdB9oSHiH76G5Cr65ZRjUgAxsjH/C0fQxIVj3KPXqQJ4mtbasxZFhdOTpgkSlDlAn/4RDVD3W
	RU5usIq5cU4Vyj7/yXvEnenWjrjV4WIBWegPTfJNLzaI8rC9Nu1N6QtGaMzsw0eiUhhsusJE/bp
	AM5LHc47UfrKszUZvZuon
X-Received: by 2002:a17:902:e889:b0:2c9:abe1:c352 with SMTP id d9443c01a7336-2ca7e739c10mr9068105ad.13.1782893494725;
        Wed, 01 Jul 2026 01:11:34 -0700 (PDT)
X-Received: by 2002:a17:902:e889:b0:2c9:abe1:c352 with SMTP id d9443c01a7336-2ca7e739c10mr9067745ad.13.1782893494147;
        Wed, 01 Jul 2026 01:11:34 -0700 (PDT)
Received: from [10.213.99.236] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c82810sm27808675ad.28.2026.07.01.01.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:11:33 -0700 (PDT)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 13:41:25 +0530
Subject: [PATCH v2] misc: fastrpc: fix context leak and hang on
 signal-interrupted invoke
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-master-v2-1-566bf8b7bd16@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKzLRGoC/yXM0QpAQBCF4VfRXNtak1a8ilwsBqMs7SClfXeLy
 6/+c24Q8kwCVXKDp5OFVxeBaQLdZN1IivtoQI1GFzpTi5WdvMLWGszNgGWfQYw3TwNf31Hd/Ja
 jnanb3zWE8ABAr8BsagAAAA==
X-Change-ID: 20260701-master-2ba6246f29d1
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: wNc2FA9WZFouIsN7gRETDUNGpHfYV_6D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4MSBTYWx0ZWRfXzrhm/E5Eoz6y
 leIe9w6L+Fyn9NN39PHlCj1itM7aCrE88LWgDiVejEIQtimDi17izQUuurnGD81UTyjjZTvewAc
 LAKO9Qv8XdDZQxoe99SGGib3c5XiFid1KDc7H2hgVtElv8jNd7jQjhZc4XNbBTVGA8qRn1DzbWR
 NSW7ZOzU7EepRwf2qGCTURUyQ7PRUcvmnIjAWywCa7xw1NiYo3AOj+Sg7wiT/txf86VEwStAjAa
 zKXMNmS9dgFJ5n9xhQtlDYTuDGXt0DSU67+Je7yzC5wz3xb3ZysXTuHNDMs+SQCMmvwKsOGehuy
 L30zylXlAdR1JcG/MP9XNYXu+Otk9OOBDL9C69ZMCdlvzKu86aE2h1fBwSjs4CdnGVdK0dSCajO
 8scJtS/zvDKzuwB/MbnNsMSnTMqCtFmTACyai9guTChHD+OMpzJaP0pS08j05Zh+4z+UyycWK4B
 ZA/06PDZVJ8JeYetdhw==
X-Proofpoint-ORIG-GUID: wNc2FA9WZFouIsN7gRETDUNGpHfYV_6D
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a44cbb7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=I77tMjNYA1nZ5Wqn6hEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4MSBTYWx0ZWRfXy9cYDYHsalNg
 QD1F5sz8VfLYqQ6y4tK7/KVM0/n14KW+DWVEkhy5ZqoTDOk5ZAVuuQMW5EpVympfyQlRtCMP2FB
 kKcMYSZqiVfg69AqTyc+IicMk4rk3BM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115603-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[anandu.e@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:jorge.ramirez@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:stable@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:anandu.e@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anandu.e@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4C966EAFD9

fastrpc invokes work by sending an RPC message to the DSP and blocking
in wait_for_completion_interruptible() until the DSP responds. If a
signal arrives during this wait, the syscall returns -ERESTARTSYS and
the invoke context which holds the in-flight DMA buffers and
completion state is left stranded in fl->pending.

On the next syscall attempt (either auto-restarted by the kernel via
SA_RESTART or manually retried by user-space after EINTR), a fresh
context is allocated and the RPC message is re-sent to the DSP. This
has two consequences:

  - The original context leaks in fl->pending until the file is closed.
  - The DSP receives a duplicate invocation. If the DSP was mid-way
    through processing the first request and had issued a reverse RPC
    call back to the host, the retry sends a new forward request
    instead of the expected reverse-RPC response. The DSP thread
    waiting for that response is never woken, causing a hang.

Fix this by saving the interrupted context to a new fl->interrupted
list on -ERESTARTSYS. When the same thread retries the invoke with a
matching sc, restore the context and jump directly to the wait,
skipping context allocation and message re-send.

Three additional bugs are also fixed:

1. fastrpc_context_save_interrupted() did not drop the extra kref that
   fastrpc_invoke_send() took, so the worker's put only reached 1 and
   the context was never freed.  Drop the reference in save_interrupted()
   so the worker's put reaches 0 and triggers context_free.

2. The bail path skipped context cleanup on -ETIMEDOUT, leaking the
   context.  Remove the -ETIMEDOUT exception so timed-out contexts are
   freed like any other error path.

3. fastrpc_context_free() did not remove the context from fl->interrupted
   before freeing it.  A context freed via a racing channel removal left
   a dangling node in the list.  Add list_del_init() guarded by fl->lock
   before releasing resources.

Also drain fl->interrupted on process exit, complete any sleeping
contexts with -EPIPE and schedule put_wq to drop the worker ref when
the rpmsg channel is removed, and add dev_warn() on TIMEOUT and
ERESTARTSYS to aid post-mortem debugging.

Remove the obsolete invoke_interrupted_mmaps mechanism from
fastrpc_channel_ctx; context resources are now kept alive through the
context refcount rather than by migrating mmaps to a channel-level list.

Fixes: 387f625585d1 ("misc: fastrpc: handle interrupted contexts")
Cc: stable@kernel.org
Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
This patch fixes a context leak and DSP hang that occur when a
fastrpc invoke syscall is interrupted by a signal, along with three
follow-on bugs found during review.

Changes in v2:
- Fix kref imbalance: fastrpc_context_save_interrupted() now drops the
  extra reference taken by fastrpc_invoke_send(), so the worker's put
  correctly reaches 0 and triggers context_free.
- Fix -ETIMEDOUT context leak: remove the ETIMEDOUT exception from the
  bail path so timed-out kernel invocations go through the same
  list_del_init + context_put cleanup as all other error paths.
- Fix dangling node: fastrpc_context_free() now calls list_del_init()
  under fl->lock before releasing resources, preventing a dangling node
  in fl->interrupted if a racing channel removal fires put_wq.
- fastrpc_notify_users() now calls schedule_work(&ctx->put_work) for
  interrupted contexts to drop the worker ref on channel removal.
- Add dev_warn() on TIMEOUT and ERESTARTSYS for post-mortem debugging.
- Use list_del_init() instead of list_del() in the bail path.

Link to v1: https://lore.kernel.org/all/20260525124222.3082420-1-anandu.e@oss.qualcomm.com/
---
 drivers/misc/fastrpc.c | 101 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 82 insertions(+), 19 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index f3a49384586d..c0859a501617 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -280,7 +280,6 @@ struct fastrpc_channel_ctx {
 	struct fastrpc_device *secure_fdevice;
 	struct fastrpc_device *fdevice;
 	struct fastrpc_buf *remote_heap;
-	struct list_head invoke_interrupted_mmaps;
 	bool secure;
 	bool unsigned_support;
 	u64 dma_mask;
@@ -297,6 +296,7 @@ struct fastrpc_user {
 	struct list_head user;
 	struct list_head maps;
 	struct list_head pending;
+	struct list_head interrupted;
 	struct list_head mmaps;
 
 	struct fastrpc_channel_ctx *cctx;
@@ -522,6 +522,11 @@ static void fastrpc_user_free(struct kref *ref)
 		fastrpc_context_put(ctx);
 	}
 
+	list_for_each_entry_safe(ctx, n, &fl->interrupted, node) {
+		list_del(&ctx->node);
+		fastrpc_context_put(ctx);
+	}
+
 	list_for_each_entry_safe(map, m, &fl->maps, node)
 		fastrpc_map_put(map);
 
@@ -557,6 +562,12 @@ static void fastrpc_context_free(struct kref *ref)
 	cctx = ctx->cctx;
 	fl = ctx->fl;
 
+	/* Remove from fl->interrupted if present; no-op for normal paths. */
+	spin_lock(&fl->lock);
+	if (!list_empty(&ctx->node))
+		list_del_init(&ctx->node);
+	spin_unlock(&fl->lock);
+
 	for (i = 0; i < ctx->nbufs; i++)
 		fastrpc_map_put(ctx->maps[i]);
 
@@ -594,6 +605,42 @@ static void fastrpc_context_put_wq(struct work_struct *work)
 	fastrpc_context_put(ctx);
 }
 
+static void fastrpc_context_save_interrupted(struct fastrpc_invoke_ctx *ctx)
+{
+	spin_lock(&ctx->fl->lock);
+	list_del(&ctx->node);
+	list_add_tail(&ctx->node, &ctx->fl->interrupted);
+	spin_unlock(&ctx->fl->lock);
+	/*
+	 * invoke_send bumped the kref to 2; the bail path skips the put
+	 * for ERESTARTSYS.  Drop it here so the worker's put reaches 0
+	 * and triggers context_free.
+	 */
+	fastrpc_context_put(ctx);
+}
+
+static struct fastrpc_invoke_ctx *fastrpc_context_restore_interrupted(
+			struct fastrpc_user *fl, u32 sc)
+{
+	struct fastrpc_invoke_ctx *ctx = NULL, *ictx, *n;
+
+	spin_lock(&fl->lock);
+	list_for_each_entry_safe(ictx, n, &fl->interrupted, node) {
+		if (ictx->pid != current->pid)
+			continue;
+		if (ictx->sc != sc || ictx->fl != fl) {
+			spin_unlock(&fl->lock);
+			return ERR_PTR(-EINVAL);
+		}
+		ctx = ictx;
+		list_del(&ctx->node);
+		list_add_tail(&ctx->node, &fl->pending);
+		break;
+	}
+	spin_unlock(&fl->lock);
+	return ctx;
+}
+
 #define CMP(aa, bb) ((aa) == (bb) ? 0 : (aa) < (bb) ? -1 : 1)
 static int olaps_cmp(const void *a, const void *b)
 {
@@ -1243,8 +1290,6 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 				   struct fastrpc_invoke_args *args)
 {
 	struct fastrpc_invoke_ctx *ctx = NULL;
-	struct fastrpc_buf *buf, *b;
-
 	int err = 0;
 
 	if (!fl->sctx)
@@ -1258,6 +1303,14 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 		return -EPERM;
 	}
 
+	if (!kernel) {
+		ctx = fastrpc_context_restore_interrupted(fl, sc);
+		if (IS_ERR(ctx))
+			return PTR_ERR(ctx);
+		if (ctx)
+			goto wait;
+	}
+
 	ctx = fastrpc_context_alloc(fl, kernel, sc, args);
 	if (IS_ERR(ctx))
 		return PTR_ERR(ctx);
@@ -1273,11 +1326,20 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	if (err)
 		goto bail;
 
+wait:
 	if (kernel) {
-		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
+		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ)) {
 			err = -ETIMEDOUT;
+			dev_warn(fl->sctx->dev,
+				"fastrpc_invoke: TIMEOUT ctxid=0x%llx handle=0x%x nscalars=%d\n",
+				ctx->ctxid, handle, ctx->nscalars);
+		}
 	} else {
 		err = wait_for_completion_interruptible(&ctx->work);
+		if (err == -ERESTARTSYS)
+			dev_warn(fl->sctx->dev,
+				"fastrpc_invoke: INTERRUPTED ctxid=0x%llx handle=0x%x nscalars=%d\n",
+				ctx->ctxid, handle, ctx->nscalars);
 	}
 
 	if (err)
@@ -1296,21 +1358,15 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 		goto bail;
 
 bail:
-	if (err != -ERESTARTSYS && err != -ETIMEDOUT) {
-		/* We are done with this compute context */
+	if (ctx && err == -ERESTARTSYS) {
+		fastrpc_context_save_interrupted(ctx);
+	} else if (ctx) {
 		spin_lock(&fl->lock);
-		list_del(&ctx->node);
+		list_del_init(&ctx->node);
 		spin_unlock(&fl->lock);
 		fastrpc_context_put(ctx);
 	}
 
-	if (err == -ERESTARTSYS) {
-		list_for_each_entry_safe(buf, b, &fl->mmaps, node) {
-			list_del(&buf->node);
-			list_add_tail(&buf->node, &fl->cctx->invoke_interrupted_mmaps);
-		}
-	}
-
 	if (err)
 		dev_dbg(fl->sctx->dev, "Error: Invoke Failed %d\n", err);
 
@@ -1662,6 +1718,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	spin_lock_init(&fl->lock);
 	mutex_init(&fl->mutex);
 	INIT_LIST_HEAD(&fl->pending);
+	INIT_LIST_HEAD(&fl->interrupted);
 	INIT_LIST_HEAD(&fl->maps);
 	INIT_LIST_HEAD(&fl->mmaps);
 	INIT_LIST_HEAD(&fl->user);
@@ -2460,7 +2517,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	rdev->dma_mask = &data->dma_mask;
 	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
 	INIT_LIST_HEAD(&data->users);
-	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
 	spin_lock_init(&data->lock);
 	idr_init(&data->ctx_idr);
 	data->domain_id = domain_id;
@@ -2493,13 +2549,23 @@ static void fastrpc_notify_users(struct fastrpc_user *user)
 		ctx->retval = -EPIPE;
 		complete(&ctx->work);
 	}
+	/*
+	 * Interrupted contexts hold two refs: one for the invoker and one
+	 * for the async worker from fastrpc_invoke_send.  Complete them so
+	 * any blocked retry wakes, and schedule put_wq to drop the worker
+	 * ref -- the invoker ref is released by fastrpc_user_free().
+	 */
+	list_for_each_entry(ctx, &user->interrupted, node) {
+		ctx->retval = -EPIPE;
+		complete(&ctx->work);
+		schedule_work(&ctx->put_work);
+	}
 	spin_unlock(&user->lock);
 }
 
 static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 {
 	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(&rpdev->dev);
-	struct fastrpc_buf *buf, *b;
 	struct fastrpc_user *user;
 	unsigned long flags;
 
@@ -2516,9 +2582,6 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	if (cctx->secure_fdevice)
 		misc_deregister(&cctx->secure_fdevice->miscdev);
 
-	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
-		list_del(&buf->node);
-
 	if (cctx->remote_heap)
 		fastrpc_buf_free(cctx->remote_heap);
 

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260701-master-2ba6246f29d1

Best regards,
--  
Anandu Krishnan E <anandu.e@oss.qualcomm.com>


