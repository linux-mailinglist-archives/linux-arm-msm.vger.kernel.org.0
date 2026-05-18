Return-Path: <linux-arm-msm+bounces-108291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEzKHQ55C2rPIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 22:39:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0A15737A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 22:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 687F3301454F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 20:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F6932B9B6;
	Mon, 18 May 2026 20:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mMpEo46L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ajByw/zU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B526438F25C
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 20:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779136524; cv=none; b=mnPvAUTNNkk5igJPEScVxDNWTFT6rbGoaL4TZi9RjZgL+FlICZshxjAhST7hiha397tQudre9os9G3/34rdRbhn+gJxXtkHml8ZU6QSs4KNd3VW+1gNWv2vsxOjsaGVQUbdt+xuWDf5j6MvaqBeg75ABPQa0/zepNZjARr/qso4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779136524; c=relaxed/simple;
	bh=lSB+qk8+V3/bT4vKxa1PCL4etSOHiKuzSJnz90Sg9mU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=pA+6LbXbCpMyJiRf4FLxoGSbuFpBMJogMSHk41smryr7tx4LMWLqU7pyLOg8BZ1DjMLQYe9T11xUrTxeg2VVRBpptwSsMR4DWTqVVmr4QVgFEgmkvfn1ga6n076NrNHtTziojTNm8s44WuT7vFCV4h/AvMkO+L1TlgA4rH1KVFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mMpEo46L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ajByw/zU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IDOKfQ2188790
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 20:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KxpQ8qvZXX/EEKeXODhGQL
	t+l8ymJHRYKkRNEjmncAs=; b=mMpEo46LtkxbzrVoak3oUpll8mAE807oSGySsS
	XyQ8PUY/TmAoINrLbvnpyVUWUyJD93tN8llSH+zsy8y81iqhbl6OmLrbUcGyr73E
	T5xzn2ttnKSMZRxCnbPEq4QG++UuNK90V8tXiF/12QrxkblLyMA8E4TRaTV+8s5g
	2EPXIDSqSdYSVRfwuUbQ7ylpHWH1hsZCfBXNlUBprfHrOWVxFRAiO+2TqEjUddFZ
	ukaFIflzwRrBChx54eadKvbVRcvakRvkMTw2CGN909zJCofpSc/uEOwLJzBqvZig
	d5lNRLP/fryU3hrWuRfGgQ7C7VTCBafQG9fCK3wmcHc2aWgQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xkuk0w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 20:35:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3662e7756f0so2048370a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779136514; x=1779741314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KxpQ8qvZXX/EEKeXODhGQLt+l8ymJHRYKkRNEjmncAs=;
        b=ajByw/zUrKnlrkSxiHPGT+NbGoJh0LgsnJJxyxz3pqmwmPzHpmTMR/YSk+gCPP4X8J
         oz85WY4zUGvFgHgcqOMoasTQsu4xaA16YqGcCbZ4E06Ux6tTvkMfJeE8FNVV+x5WC/1l
         z1cv7FSVT9dtYtps9+eUA43qQ+hxGOp4b1q7nlpulN8U0c5TtMq2iVzX2TPrgeLCJ+zM
         Rp7h3rMrpBJq12FWutpuvuRBwUow35gpNBi6MjZoHL4S5iD0vSbsEHBf0t/CL21FPGZW
         F9vana5gBr/PRKmGOkg3DzO7B11i1tzVuOQ7qTtIuDwmCaNk+s8cbyMz9HA2ui4/61od
         3Cfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779136514; x=1779741314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxpQ8qvZXX/EEKeXODhGQLt+l8ymJHRYKkRNEjmncAs=;
        b=VOvVjqjUpESF6qvif44yp12yW0MZvSK/GmhLjwmjiMpccsBfdzb8t5Vr7ZzdHeFllJ
         /hb4WcPkxV9LpC5YurbeQaqflwFYRaEj0+Qvk3xc9altCaC1CDIt623GtBqMZmoi56O9
         Wkow9ZUuSsKF+g9SZOLOjzgHFV4e1suP1AVV70vbZmqpvtfjtOFZCONn/YfTEANiZ8nd
         JTINlJ1RSqoEuGBRL6fFOXiADnbyC62tmCwx48d5uNw/KTLSG90JDDQLY6r/CfstXs44
         lAOT/tJmbcFqDJVXmRswcahXx5H62YfI0T7010CL5FgUBVv6cXDd+NIVvizeENj/Owc+
         8S7A==
X-Forwarded-Encrypted: i=1; AFNElJ+RnH5RnCUvuJ1j5emrZUut2M6/2E1spl1zKFRUQ63rBtxbJBI9r7nwnl2h9R4AYPqq8ur0kAjnV3fjcfy3@vger.kernel.org
X-Gm-Message-State: AOJu0YzdITwZooyLLgqzqCeek8/o6zcoyztrw1cztvSgMSwBCVaCwfup
	2a1BgCP0BPTz4n/r26V487LawI/meSGGk7GLbaBGoP69u+/YKtLFOfjzBL80Ff6/3/oEtmAh+rS
	fc3/A8R/BYrI6/7mW5dJn+f668y4niQK6jIAbWiN6B0RRQrHsy+ROFVSR7TtiXuWEhjR9
X-Gm-Gg: Acq92OFjljbndkR1EfjX0yXWRqNh5aFGo6zpQwsjiW34RUHJQFqA+OR2EcRAqYoEvhs
	fRdJgiAmz6JcrqSmi8zzZMecTtVu6kpkz1hJO818SZi9pP0AxseELAcwziEBx6Y1RY0JDTzxWoX
	RxBue2xYdsSgn+r65FTSeEeRkcmBsovkgIU3ckAvk0tuaHOg9WDaCqaDumQnc4B4eSOo312BV/S
	S/9LOAdpbDAiUwIW/lUnxEmLmnqSvy9H+3BQOXvEmHdXK+4omn8TQRNiBY1PeucFUuMv75HVLTn
	Jh78YAcZpB0Z81SPQB6hX3ZaYxmolWDrl4A5hyNbzPVFug4XhS4dk2MWOR462mUPXnOKsauiA9R
	LZskflgdZHbueHAqJOE0n8Fc+gf/64skV8v572Mvz+17N
X-Received: by 2002:a17:90b:3505:b0:366:aba:4c86 with SMTP id 98e67ed59e1d1-36951dd5abemr16453637a91.27.1779136513487;
        Mon, 18 May 2026 13:35:13 -0700 (PDT)
X-Received: by 2002:a17:90b:3505:b0:366:aba:4c86 with SMTP id 98e67ed59e1d1-36951dd5abemr16453600a91.27.1779136512901;
        Mon, 18 May 2026 13:35:12 -0700 (PDT)
Received: from hu-anane-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600c3sm156725235ad.29.2026.05.18.13.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 13:35:12 -0700 (PDT)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        ekansh.gupta@oss.qualcomm.com, stable@kernel.org
Subject: [PATCH v4] misc: fastrpc: fix use-after-free of fastrpc_user in workqueue context
Date: Tue, 19 May 2026 02:05:07 +0530
Message-Id: <20260518203507.3754994-1-anandu.e@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDIwNCBTYWx0ZWRfX9wwcgWZ/2ElA
 ENIyStGQF0bS000l62QcPk5lcJnXQ2C0HxyikVgv2JnhOGOW3AiDmiw2e3iqFdxEqCXFtLXUzDz
 fy7rI+hn1e9kzDMFaEevrSD3tj7ni1RTzUeDNaSU84XWoZIH7TeapQHCVrCbxIWK9p2B0ZP4Z+f
 DbNgPjyoBzhGbMExviF9LoNmiNIzOnVnRoz976ZYq9xvgSM70qOLGpuSKyRCJ/H5BDhx31AtlGc
 5ms2goaA0VuoPIef+k7bhMH9VG4sNiEsBQQ+X71Ol1tBXsiYrePF40h/YJuEDpndk6G5E9N6hEJ
 Ozr7bgm1c6mNbbIrW56XxriGG63d8pm2bfZ2b/xFn87AqK9Wds9e+v2Ds7sq+IsND86cKvtuSwi
 y2Ft9W0HOzxctdZWfjHVP88nQfXlJsn42vmF8/MDUe3dBsP6awYUdzR0aeP6F+lEJaP8cXUNbCw
 M3CkrVJxqFcr5lDUA8A==
X-Proofpoint-GUID: 1U2MievDMTYE6vckVvLEOqEQrYMulanH
X-Proofpoint-ORIG-GUID: 1U2MievDMTYE6vckVvLEOqEQrYMulanH
X-Authority-Analysis: v=2.4 cv=FsY1OWrq c=1 sm=1 tr=0 ts=6a0b7802 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-d8OuwpfmgTKOJIC24EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1011 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180204
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108291-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[anandu.e@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE0A15737A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Changes in v4:
 - Fixed a blank line issue
 - Link to v3: https://lore.kernel.org/all/20260428073334.934358-1-anandu.e@oss.qualcomm.com/

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
 1 file changed, 52 insertions(+), 23 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1080f9acf70a..48f8262af539 100644
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
@@ -1590,28 +1636,10 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
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
-
-	mutex_destroy(&fl->mutex);
-	kfree(fl);
 	file->private_data = NULL;
+	/* Release the reference taken in fastrpc_device_open */
+	fastrpc_user_put(fl);
 
 	return 0;
 }
@@ -1655,6 +1683,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	spin_lock_irqsave(&cctx->lock, flags);
 	list_add_tail(&fl->user, &cctx->users);
 	spin_unlock_irqrestore(&cctx->lock, flags);
+	kref_init(&fl->refcount);
 
 	return 0;
 }
-- 
2.34.1


