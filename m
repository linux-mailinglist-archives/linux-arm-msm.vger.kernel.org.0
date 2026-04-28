Return-Path: <linux-arm-msm+bounces-104892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qC2FDt1o8GkITAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:59:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8916547F720
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B879C3095724
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 07:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FD83D7D6F;
	Tue, 28 Apr 2026 07:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqD6CWrE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWqJBAD1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AE43D348C
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777361623; cv=none; b=Fmt2Mat1d2d9mw0fgHMX31kQzOkAxNCrTCA8wnXO1FlgJ1z94DZVQZSLb8j2+JPAHF+Gs4cQap9FJ/eiDHXM62P6ij6gttsnPmjilTrRX5C5nXBGJNA3DLP29fBs4rLVetXd9NtAprMNmKVODa+0TtXpfxpBa0Gi7bZk5OrHt1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777361623; c=relaxed/simple;
	bh=py3uAG345p27Z2RDh4vo9/NsaRtABQwTr75ViNA3pYU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Ou3J5fHBFkI3vws59uLHVWgUknrLMnamsVZWH0yaMv9c4W1hfz4np95ruSD+al609X2l4L7cc/7CIEtLzMguHFn8R/877EfHSKowQSK726O6FrWcpDGPJVUPvMv8Ooe/CDBVMP0yiPap4Ytl0e4f+zoF6xsB2gU1sa4yu7sEZ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqD6CWrE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWqJBAD1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S2fECG3123625
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Qpru+qluX0+pH7N4kcbo//
	xSN5otJGrfjPHoGqLaVww=; b=mqD6CWrEpY6tzdMiEEqMTCDvr58HXGsAEDNCQo
	SWThCm3lYTjipSsb9RSbjpGSCjxGuamAizx8vLx/xuzhjgc8gMWKOjYUT0XRoYBp
	veGkzq1HaZ2ScxOmHp1T6DIyOXtIsPxqJ7Wq6ZA+CR/ho/g02snXz7Wt1RMNb1nG
	VIyM8CsQ9uJqeob1mJu57h9c/U+nENviUSWCM9LIgG7A7ykhTCBT+A3qnKbVkXi0
	x9mctghCSIB9klq4zGEvKGqU4Q5hZ0fBZXnyE+1fkji/E4Hs7EvSZLQZdkkFZ3jx
	/+tsArF+V6pYGPdopq5DTXVZJZnWfDBCf3y344wk6N4HAStw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgmc27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:33:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3614272b00cso13662782a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 00:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777361620; x=1777966420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qpru+qluX0+pH7N4kcbo//xSN5otJGrfjPHoGqLaVww=;
        b=dWqJBAD17+1U54jKFA0wDnY/DWBo6SJcHU9k1i1X/HrjqQL9d3s6LYf5SpBORsSXRt
         q22151B7685cRdHhEKJ7RpJR8ef9CNbup76P9RtURzp8eyDJeZNTzbHvy5KEyjF6wZLT
         /Jo5nj/2iHp8272hkOirI4F3+ApdiZsUHbftSEDddLsP5Yw4EQqa62/q1HFxRpJRcnFs
         CkKf52chdX2XSsARArRSs0fzQke2XXgXg7wxdd1dNW0KJ5FAwCAYnBZQdp2xCVZuPvZT
         wb+gtTv4CRa1S5nGRA+P/NbVfXYnvzF32eAZzQiklMQENnEiju/9noERHmHUR7o4hiiW
         41TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777361620; x=1777966420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qpru+qluX0+pH7N4kcbo//xSN5otJGrfjPHoGqLaVww=;
        b=N1O8uzB7B+FxaaYQY7Zm9+ZPijtTO+NekJ1TnwHe9Q93n1su3oM58kKBZ88rFZ7g4H
         BD/utEIbOkfu6N7gyNje1kAuBArx3dOP5wFSZXPY0frr6aBoXISep98Haw8jcM/RAyVt
         eU3+9CFVqOMhQA9z8PZbF8aE7RzCWNqV1hbok7O47ue/9EPCDh36BPUVxOxv0MPDDoJN
         o6kN9mUGBIimV5gJCYdYH79lF9kXAHiYCh/118HAzISaMVvEP4boxooD58+oCgzV6JSF
         CSyiRoqVOB933Hu8IcrYzf+GHenrSSqkr4bb65D1vVGHLm/x/I+iGas9CAF57XXD1Kf4
         /gwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9WDd05frwBPAfcg8a4KnayvUSCVE9tExn/9glilZuhJUuGh3Yj9fAZ5K30gCu6i9vcvk+/ybgXAWnqGWK+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx69d+TjSSEFm8Ufd0SOoHllQB9JPZS3ee81OtcgfCG/Gzn8C8t
	Are666pS9G5zFFUGApUpYQG/qv9gHG2SdifeA+HIk+M6MUeTfNf+cnBe7oSDVNHLiBVkp9kKtHs
	uKAO3Txny5iJF+XfSRfVSTRRXAIhBSvhLtBSmu1fVs9AnBC6qF0hKTZx8UUn9MEUTJQWyJTOU0J
	AT
X-Gm-Gg: AeBDievAn3of6w1i6WXBmNneQHDStUIlbR6RNqHVDkkAvmv27iVXWCcxX/CggM0F3Gz
	DUoy2gbSFjBoWYkZNzajr+LP65DrPikpmSvHkpwIFZoVyI60543AIfttFkRora70KAKzGW3NRxJ
	preRmDqXSU9CxP7YxpjPT0neZuafRiovOykr/g7aTGEAHb3IOlWuAHcwwZPALifH4NOBg+PC2PH
	QDOq4ssUM9IFc0sEryn29OFX6egQqE/ZYJ8GsAQorx/1na1OzkpDDIvrjf84CC/PhXEKuOVy/t5
	Wm82DyZ/TiTjIT3Q20hIn9MfYRMPWh7/lWUPIL+y2QeZmbakBpYd6rgDPCilsJhX2n5KvMNrkio
	5n2tGgtehVogd/kPvHRuzvRcqnBso33mV0yrClRo3cWj7NaqIYUqMBbc=
X-Received: by 2002:a05:6300:86:b0:3a2:ecb8:56d8 with SMTP id adf61e73a8af0-3a39c2149e8mr2515437637.31.1777361620426;
        Tue, 28 Apr 2026 00:33:40 -0700 (PDT)
X-Received: by 2002:a05:6300:86:b0:3a2:ecb8:56d8 with SMTP id adf61e73a8af0-3a39c2149e8mr2515403637.31.1777361619963;
        Tue, 28 Apr 2026 00:33:39 -0700 (PDT)
Received: from hu-anane-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fc33d4c60sm1508477a12.23.2026.04.28.00.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 00:33:39 -0700 (PDT)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        ekansh.gupta@oss.qualcomm.com, stable@kernel.org
Subject: [PATCH v3] misc: fastrpc: fix use-after-free of fastrpc_user in workqueue context
Date: Tue, 28 Apr 2026 13:03:34 +0530
Message-Id: <20260428073334.934358-1-anandu.e@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA2OSBTYWx0ZWRfX0KwbSK73B1P6
 UXB69oAl7Yx3hwELo53hvfIzkgW8T2xzOJTXbfw9R37Jfz+zWvgiRrcA8/bdPR5QR9XDYytxyST
 vzUzXYHkhF5GhK8QK/txodCym448KiLE7zXox21XhTHYdDNgdxxa9UtfiZytCL1huuS9vc6F3sH
 UayYEvzsR2Dm99PvD/8j/FfsGemSZGS57kv76ayazE9zQPat5wP8nVx2wJY6E20OYsJQcV865oj
 RCbxIesmM6fRitXozBw4k8npsC2vuBy/wYddCEuYeBjoyGAF2dbVRwKcn8QJoeDF9pv8z7hgcAO
 N4k1uKcjjw9Q00ALKruEdKJY8MLgXAWTOUqwS2ZUr6Kwkz7mywd6voT5eKeNo/0orSnXbW5PeOE
 hjC8u35PkoqzeFfzp62TocJhMNMWZJ93zZV0Yarzy99rSDvtrfBqXAj5ihq3ZUIjFHLrLr0uObJ
 VK1Qbde4wxAa/38f4Tg==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69f062d5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-d8OuwpfmgTKOJIC24EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: dtUQS8Hjp4Y3pVfpEdhB2hquaM9t0X3E
X-Proofpoint-ORIG-GUID: dtUQS8Hjp4Y3pVfpEdhB2hquaM9t0X3E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280069
X-Rspamd-Queue-Id: 8916547F720
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104892-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[anandu.e@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

There is a race between fastrpc_device_release() and the workqueue
that processes DSP responses. When the user closes the file descriptor,
fastrpc_device_release() frees the fastrpc_user structure. Concurrently,
an in-flight DSP invocation can complete and fastrpc_rpmsg_callback()
schedules context cleanup via schedule_work(&ctx->put_work). If the
workqueue runs fastrpc_context_free() in parallel with or after
fastrpc_device_release() has freed the user structure, it dereferences
the freed fastrpc_user. Depending on the state of the context at the
time of the race, any one of the following accesses can be hit:

 1. fastrpc_buf_free() calls fastrpc_ipa_to_dma_addr(buf->fl->cctx, ...)
    to strip the SID bits from the stored IOVA before passing the
    physical address to dma_free_coherent().

 2. fastrpc_free_map() reads map->fl->cctx->vmperms[0].vmid to
    reconstruct the source permission bitmask needed for the
    qcom_scm_assign_mem() call that returns memory from the DSP VM
    back to HLOS.

 3. fastrpc_free_map() acquires map->fl->lock to safely remove the
    map node from the fl->maps list.

The resulting use-after-free manifests as:

  pc : fastrpc_buf_free+0x38/0x80 [fastrpc]
  lr : fastrpc_context_free+0xa8/0x1b0 [fastrpc]
  fastrpc_context_free+0xa8/0x1b0 [fastrpc]
  fastrpc_context_put_wq+0x78/0xa0 [fastrpc]
  process_one_work+0x180/0x450
  worker_thread+0x26c/0x388

Add kref-based reference counting to fastrpc_user. Have each invoke
context take a reference on the user at allocation time and release it
when the context is freed. Release the initial reference in
fastrpc_device_release() at file close. Move the teardown of the user
structure — freeing pending contexts, maps, mmaps, and the channel
context reference — into the kref release callback fastrpc_user_free(),
so that it runs only when the last reference is dropped, regardless of
whether that happens at device close or after the final in-flight
context completes.

Fixes: 6cffd79504ce ("misc: fastrpc: Add support for dmabuf exporter")
Cc: stable@kernel.org
Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
Changes in v3:
 - Fixed fastrpc_user_put()/fastrpc_channel_ctx_put() call order in
   fastrpc_context_free() and the err_idr path of fastrpc_context_alloc();
   the correct ordering from v1 was accidentally reversed in v2
- Link to v2: https://lore.kernel.org/all/20260427074021.3774769-1-anandu.e@oss.qualcomm.com/
Changes in v2:
 - Rewrote commit message to establish the problem first per review
   feedback; identified all three UAF dereference sites explicitly
 - Moved resource cleanup (pending contexts, maps, mmaps) into
   fastrpc_user_free() so teardown is consolidated in the kref
   release callback
- Link to v1: https://lore.kernel.org/all/20260226151121.818852-1-anandu.e@oss.qualcomm.com/

 drivers/misc/fastrpc.c | 75 +++++++++++++++++++++++++++++-------------
 1 file changed, 53 insertions(+), 22 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1080f9acf70a..49f0058824f0 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -310,6 +310,8 @@ struct fastrpc_user {
 	spinlock_t lock;
 	/* lock for allocations */
 	struct mutex mutex;
+	/* Reference count */
+	struct kref refcount;
 };
 
 /* Extract SMMU PA from consolidated IOVA */
@@ -497,15 +499,57 @@ static void fastrpc_channel_ctx_put(struct fastrpc_channel_ctx *cctx)
 	kref_put(&cctx->refcount, fastrpc_channel_ctx_free);
 }
 
+static void fastrpc_context_put(struct fastrpc_invoke_ctx *ctx);
+
+static void fastrpc_user_free(struct kref *ref)
+{
+	struct fastrpc_user *fl = container_of(ref, struct fastrpc_user, refcount);
+	struct fastrpc_invoke_ctx *ctx, *n;
+	struct fastrpc_map *map, *m;
+	struct fastrpc_buf *buf, *b;
+
+	if (fl->init_mem)
+		fastrpc_buf_free(fl->init_mem);
+
+	list_for_each_entry_safe(ctx, n, &fl->pending, node) {
+		list_del(&ctx->node);
+		fastrpc_context_put(ctx);
+	}
+
+	list_for_each_entry_safe(map, m, &fl->maps, node)
+		fastrpc_map_put(map);
+
+	list_for_each_entry_safe(buf, b, &fl->mmaps, node) {
+		list_del(&buf->node);
+		fastrpc_buf_free(buf);
+	}
+
+	fastrpc_channel_ctx_put(fl->cctx);
+	mutex_destroy(&fl->mutex);
+	kfree(fl);
+}
+
+static void fastrpc_user_get(struct fastrpc_user *fl)
+{
+	kref_get(&fl->refcount);
+}
+
+static void fastrpc_user_put(struct fastrpc_user *fl)
+{
+	kref_put(&fl->refcount, fastrpc_user_free);
+}
+
 static void fastrpc_context_free(struct kref *ref)
 {
 	struct fastrpc_invoke_ctx *ctx;
 	struct fastrpc_channel_ctx *cctx;
+	struct fastrpc_user *fl;
 	unsigned long flags;
 	int i;
 
 	ctx = container_of(ref, struct fastrpc_invoke_ctx, refcount);
 	cctx = ctx->cctx;
+	fl = ctx->fl;
 
 	for (i = 0; i < ctx->nbufs; i++)
 		fastrpc_map_put(ctx->maps[i]);
@@ -521,6 +565,8 @@ static void fastrpc_context_free(struct kref *ref)
 	kfree(ctx->olaps);
 	kfree(ctx);
 
+	/* Release the reference taken in fastrpc_context_alloc() */
+	fastrpc_user_put(fl);
 	fastrpc_channel_ctx_put(cctx);
 }
 
@@ -628,6 +674,8 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 
 	/* Released in fastrpc_context_put() */
 	fastrpc_channel_ctx_get(cctx);
+	/* Take a reference to user, released in fastrpc_context_free() */
+	fastrpc_user_get(user);
 
 	ctx->sc = sc;
 	ctx->retval = -1;
@@ -658,6 +706,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	spin_lock(&user->lock);
 	list_del(&ctx->node);
 	spin_unlock(&user->lock);
+	fastrpc_user_put(user);
 	fastrpc_channel_ctx_put(cctx);
 	kfree(ctx->maps);
 	kfree(ctx->olaps);
@@ -1579,9 +1628,6 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 {
 	struct fastrpc_user *fl = (struct fastrpc_user *)file->private_data;
 	struct fastrpc_channel_ctx *cctx = fl->cctx;
-	struct fastrpc_invoke_ctx *ctx, *n;
-	struct fastrpc_map *map, *m;
-	struct fastrpc_buf *buf, *b;
 	unsigned long flags;
 
 	fastrpc_release_current_dsp_process(fl);
@@ -1590,29 +1636,13 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 	list_del(&fl->user);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
-	if (fl->init_mem)
-		fastrpc_buf_free(fl->init_mem);
-
-	list_for_each_entry_safe(ctx, n, &fl->pending, node) {
-		list_del(&ctx->node);
-		fastrpc_context_put(ctx);
-	}
-
-	list_for_each_entry_safe(map, m, &fl->maps, node)
-		fastrpc_map_put(map);
-
-	list_for_each_entry_safe(buf, b, &fl->mmaps, node) {
-		list_del(&buf->node);
-		fastrpc_buf_free(buf);
-	}
-
 	fastrpc_session_free(cctx, fl->sctx);
-	fastrpc_channel_ctx_put(cctx);
 
-	mutex_destroy(&fl->mutex);
-	kfree(fl);
 	file->private_data = NULL;
 
+	/* Release the reference taken in fastrpc_device_open */
+	fastrpc_user_put(fl);
+
 	return 0;
 }
 
@@ -1655,6 +1685,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	spin_lock_irqsave(&cctx->lock, flags);
 	list_add_tail(&fl->user, &cctx->users);
 	spin_unlock_irqrestore(&cctx->lock, flags);
+	kref_init(&fl->refcount);
 
 	return 0;
 }
-- 
2.34.1


