Return-Path: <linux-arm-msm+bounces-104640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNBgGAUT72kP5wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:40:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D00B446E7C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 058E9300A7E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 07:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4262637F758;
	Mon, 27 Apr 2026 07:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="URCg0Egv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MrwaQBR3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31A83806C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777275630; cv=none; b=j0bu6tTqGtM09zbirSUBrQDRcMJ52I/DVPQfAxtwURbR4ICh1EhIx+RQL7YgJVqs/FK1F9jBNX420WNKSwoBRpG998CJNVqzkKOOB8oofNH38kE+lD9JP8EKS5NgbxoKCVBD4NyrSwuxUDJWrZzQ45IGpsjSytutWRDXS3MSiWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777275630; c=relaxed/simple;
	bh=lxZWDu7rzbJGODTOK7xHjQUvMZ26quwk0m7D+CJXjRU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=KPH8F4RgHEQVb7xraw4VIcGJ6Khw2x030rQmeIK4eoAuLpxare7UMhE9+f/6Ec9ZqXWWEahqJwU7spd76rWYJn1GLJxLf0PhTyyqFi8OnInLv7VVSa/nworVFEhWJceVX9pEFl8pHFoEB16I5bsVHsq9Vum6DANV3FETjzKFULg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=URCg0Egv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MrwaQBR3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R1rPpG3294067
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JJOCYwwAvREjXQRgt0yQOK
	UxC5jJOFcFIqJRhmihN14=; b=URCg0EgvvJIjCLfwA8X9LCZvZ8DXFGb+7c/MUb
	FqGIcWcDAOLVWzdtCibRbRipB2awUz04oLZQxusR7v03NUAoM969pbWztGsS3gaM
	KTw2KW6qYZQZjDlZNzKq3ft0MVGTd0Xh27+M5JeEkcAurzPahDqYAYNzXiGv9Pr/
	Wq3WvxXRDAYLzWA02mZ3A83XdbnqrTMQmV7RmHUvRVlwY35CMWg0NRrwROx0Ps2t
	6AF0UHHv9ovvI4yzQdXZ/9XgVZ1zacg+x/20oVvyrcHf27BfVcsBXoiZUDGeiY0B
	c8RFDWjHBbcoBGN3oPolc0/JrJ5xw3vehyVRBxCqZwwdjHjA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4utxtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:40:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b465bf993cso101278015ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777275627; x=1777880427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JJOCYwwAvREjXQRgt0yQOKUxC5jJOFcFIqJRhmihN14=;
        b=MrwaQBR3z09XBDY/R9021XEzJkcT/IE/tYzLTUwyFUbJacuT5sv0IosoEklbTwesrv
         SK4lDLpbAB7NHr56gaY/6IbV5dwIHdFKsIPbkNmWoO9VAVM1pQAaVB/Z7tfArwELTpo1
         bhDKuIIUJp3wXgcuQYnVu2pzLLWB8NGtmkIDzOFooaE9hzjibn2yft8V4OsLWKG92dWv
         4Yht7R/aQsnnDT2VqXWTEoTU2Ffq6UvPn0dVnYww1+klx+Kjc0B5cF/GY9MavEB+U+Xr
         tcpJ+RuSojNBq3blm2vEcjDOIEkWcX5i8oNADh9NdVP3gae8U7kaXTYGJg4UP9GDEzPy
         5q/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777275627; x=1777880427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJOCYwwAvREjXQRgt0yQOKUxC5jJOFcFIqJRhmihN14=;
        b=qzH/ZcTIfJOKaNYl+y0aSnTcWLh0XuxLeggBt6M9d8codnDR2MswXtzVrFm/Bjm7XC
         Pwx0yOljgx+SbpEg0uXPfuPoMXo6+KiCF1hNGEoHVt1eiTeb3vsrWoL9FMxYHPRn0nTc
         NSOAlGVUZ1Udhsv4c9UOIDT3NVL7o3JxTxiHwItqZbQQYndigBJDDNLIO8fTzQFHaXJz
         CyzrUWq8xf1bVrrNey5OX9Z6/tdUoZAzFZ8sk3uMFN4zumvLzHVdSa0QMHXVwuDaKkgo
         YUkpV+Ze1ATCuStV1EtFwWraqbhaqq0qzkIrWrkFnj3J4rAVwMq54Mh50Oai0LbGxSLl
         dObw==
X-Gm-Message-State: AOJu0Yx3O1kiPXneQPHnJunU0hnUXoJ3HdJbIb+RKpQqYMihSNZbATes
	FGqJTkVDI7/c2FH9n5dbgBMJDLr+YpjKvNbJgHCLn2LG7jWxYjTgW8t/6//DaV23+wtuTUyJfqC
	MMtm2r/5618e3uSoSMkRcIeeikiaBogXzs+cpJcb4hUbmLK0JnKu/HuUh7TrjEYbu95Pn
X-Gm-Gg: AeBDietbzvaAtZqRhJJKvvJVBuSoB0CwujCAPz3QL9thZId5GlkElTJhYiqc9zQRJd6
	LPu8BS9rkx/ztVt7DyMb67RVIFcGVzDONZp3ub1JFQL2aoTQ7Om12wirxlbXs1K+u7ht/jQhx0F
	m2pf2WCd0sKMme2LWUGhD0GliOQCNMaT7pJFXutaUoqzH+3rSKwg+Fy5jJkAyfNFHt09yWKgvsi
	wVYkSIrBxTxdgUz51LCIjjsLLpYGEiDApNO7owXkd1FwFseE13QOjSUfmVc5U/7ypmeZjTzVq8t
	8pYIS+/TD2M5StSHb75FpOhHOG2/rbSdQHNVsHIoxzxPhhVppOXyrY/+sHHIlsdSH4kJ2VVq2wy
	uY/vNrD6zIQM8ptU70O8T6U5lOGanZcnBjSiCOdpUBYdljxgktpEw/go=
X-Received: by 2002:a17:902:fb03:b0:2b4:5f19:1d46 with SMTP id d9443c01a7336-2b5f9f3c5efmr297616355ad.19.1777275626951;
        Mon, 27 Apr 2026 00:40:26 -0700 (PDT)
X-Received: by 2002:a17:902:fb03:b0:2b4:5f19:1d46 with SMTP id d9443c01a7336-2b5f9f3c5efmr297616005ad.19.1777275626349;
        Mon, 27 Apr 2026 00:40:26 -0700 (PDT)
Received: from hu-anane-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa2f129sm277501945ad.29.2026.04.27.00.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:40:26 -0700 (PDT)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
To: srini@kernel.org
Cc: linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
        quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, ekansh.gupta@oss.qualcomm.com, stable@kernel.org
Subject: [PATCH v2] misc: fastrpc: fix use-after-free of fastrpc_user in workqueue context
Date: Mon, 27 Apr 2026 13:10:21 +0530
Message-Id: <20260427074021.3774769-1-anandu.e@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6eQntL27eWEdIsuMh9HMp6NMN47-vnTR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA4MSBTYWx0ZWRfX8pD/2mxNXXj+
 guHkXE+FV2aFpU443iLP7ewCna88RLoebdyPlLrlEwimukabYPhYVjRGv0nDyymNLqyP4OUSDXe
 Q+mCZCttxcipTzzE5LhMrYVTLgFNzTPFNMVmFunfK28px/BrK6EaRiMHJbhxLekXaYy2K1rZgw/
 /DadlYbYi6GK5zHfNbJaAAV6yhCN7BaauIGdYhmpNVNnwxle7A8XIr6AY/5NejehVmeJfujaja9
 xuG/EBfdJVQIva9ywW2iyBFqcKG69qIiZCZkeauVXhYImFsOtX+ZplRiwHr0FfkcdIPnLWKbEon
 9/oSEnfKizfPWr09JFreKmdbWFOm8sjt9yZlU9f7/tlrllswUhJ//V4euuvuUsbQVjXwuu/LpML
 vc50RKhgplNcG8RsQ7W1ArhB7OQGZ+mWCrWcZUGsKBOZ94KwjDAqm2tPLD9xaHsTEOjIyuV0+da
 0INy+XQOnwAzNEqpDMA==
X-Proofpoint-ORIG-GUID: 6eQntL27eWEdIsuMh9HMp6NMN47-vnTR
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69ef12eb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8KoG9AtTWN8LJ-d-xwUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270081
X-Rspamd-Queue-Id: D00B446E7C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104640-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
index 1080f9acf70a..7afbd470c9fd 100644
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
@@ -522,6 +566,8 @@ static void fastrpc_context_free(struct kref *ref)
 	kfree(ctx);
 
 	fastrpc_channel_ctx_put(cctx);
+	/* Release the reference taken in fastrpc_context_alloc() */
+	fastrpc_user_put(fl);
 }
 
 static void fastrpc_context_get(struct fastrpc_invoke_ctx *ctx)
@@ -628,6 +674,8 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 
 	/* Released in fastrpc_context_put() */
 	fastrpc_channel_ctx_get(cctx);
+	/* Take a reference to user, released in fastrpc_context_free() */
+	fastrpc_user_get(user);
 
 	ctx->sc = sc;
 	ctx->retval = -1;
@@ -659,6 +707,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	list_del(&ctx->node);
 	spin_unlock(&user->lock);
 	fastrpc_channel_ctx_put(cctx);
+	fastrpc_user_put(user);
 	kfree(ctx->maps);
 	kfree(ctx->olaps);
 	kfree(ctx);
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


