Return-Path: <linux-arm-msm+bounces-94326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJI+OfBjoGnajAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 16:17:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDED1A86AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 16:17:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E3293012C8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340383ED127;
	Thu, 26 Feb 2026 15:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/fiImOP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWQHc6bz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4374D3ED121
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 15:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772118691; cv=none; b=D29qUiwWVj7c4w/wbZMVYsuVOrdTXbtJj1vajeiPpoQnrPJPvRmr9CjMhcs4Hnv0d1BWl5+EQ/tGa2oGQkXicby0m6Cqlc4qWBoDnC1pBroHKsWRoohrVyNSaUlaa/Li+O2q2tW9cTiCmkLjpTaWNDYt/nZDybCO8gNW9+MNNbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772118691; c=relaxed/simple;
	bh=ZxyHhXSgA/a7eSsRPID2Lt1o5nPIFPEx/lFfjYE1EEY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W32pyYjhuL1TGkZGx09GbHnRkB0JK0w3T6ug/uG8Vb5QNPJgvocTOh829eaWirwzsLgK8p0RodRKZSFbdxXjiaX9CBCmwprLfDaXtcQCEdwXSz0WC8RBG3jjehiDRKtGv6AnMENcV7umxCRcA9CuJi/wJtWxRBfmCEOOAoqcNBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/fiImOP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWQHc6bz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAKl2G906822
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 15:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=J0r3jYLWEnp/BWKHaJsNvzTVG8pjtsxStmS
	gUqG+I9k=; b=a/fiImOPkyv4qUrGb1smtEAsLLo920aD8vqm9O6JL8y8s9gF9qq
	gh6ERprUhPKzfiKi+iXcn2cI8Ev20UVKMaPvRl2fk4s6l/fDV3T0kookGGcA6W12
	PKCoSgOx7sFetxd1402PyE0yoO4OoxwyphxG/GvQ8qFZaqT4ZmddETvkshg/91+v
	DiWTOO9+XkAL3Y1H+DQ+XPj9GT7RONaOjNl4mwSQr1Og1994tZIZ3E6sE8qVZSiL
	79iONeUdkobm6WnErZpGGo/rcnNHoCpKxziHFjJgEA8ZPz8GS4JEq+7xfBfSrX09
	19gRRucGswDVYMdulFt4fWqB7RfxIgogp4A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjk2v15gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 15:11:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354e7e705e3so531954a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 07:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772118688; x=1772723488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J0r3jYLWEnp/BWKHaJsNvzTVG8pjtsxStmSgUqG+I9k=;
        b=bWQHc6bzAyLf4Y6HhLXBgCp9KZBr8nZ2iqUayrny0fZ0grXUv4UM7ae2LsmkjkoKYb
         hLLT2Ij3P4Bv2+fnUP75k9ufKEdn5MbyvuDb4iT/VdzDOERrfIQdRMxBwL0BmyOAS2Oy
         ddtcFQrF4FO1ZOS0zbjTv2cWQ2Cmsw/MjwU6S179Krxk9Cb8rWEbUwwF8qQe7JBBVTnb
         at/ookL2YqTgRbIHG68/+qcekQwNt8l09n7rZyGKzIcxvmfeX450Zr/hg6XcK+35kYiq
         fOiKfTcqIV5lIWrs7yjHfpPxQBFFpIAQub+jGg9KVL5tNZwF00SANfN2ecBWSaDcSe/W
         /8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772118688; x=1772723488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0r3jYLWEnp/BWKHaJsNvzTVG8pjtsxStmSgUqG+I9k=;
        b=SaFzJbHqogG56jGb8vy5PTwgKaEqw9FVbep+MYperLnrUCgW8b8YF/3V/5s4Hzu8mC
         HGslxMbucBMOr5SGHnbeIMlICQPGasbQFuispXnF8EDSQoXgas/8BfbDPPqu4KLQXlu+
         UrOaK05tISjy+zVVYOjEWGzjyYzG9gsTHku0qWV5YN32+Zq+ADUd2c1PvmuhZIqBw3l+
         N49aySlBAAvK9HuyDQDilkMfCy2yOF2rNyyu8bBfn1LRaRGpaJbSu7fVRJvQOuZN3kHG
         +Xmr+hlDi2H9PC9OH4TpHKFdJM97Z/XNADH5koi+sst+m8kJiyHOolOFN2XqdlstQIs3
         SdWg==
X-Forwarded-Encrypted: i=1; AJvYcCXO2+2Wm+TDV+f2y4FM9tKstRertUeYWmqLIEJFJYB+pT3u2ZmOVfQ6kD2dof4SVSZssqvZA4FrUNiAqqtG@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ0mSUYtxxVHbXOA11SmHR5SUrorWmsZMECfWbxCKQ0oz3OEyS
	IzGSJryi8PF++/kxey9goFmp81hSrhnWyLqj2WgUv9LfGCZ++3RqZstHl3R3LyErOOHLP2aQod9
	mdC9eNpuGJdABa0oy/OwA1gYSVhHZrRPOxZKUBWK/mNOE4dP1O9/vOcMo+G55fUN4KeBP
X-Gm-Gg: ATEYQzwdG8GlZD9kXzDERgxk1RzdP06PtX7JJhhXeyMzPyg70ehvHI9onaLN3qZqTMi
	mPbRWhObUh+SD+vQiuR1roEG/wSWd0+7LFof3ZtxB7fDgZloCsfocGc4qo2EyGzoweHG2KSwvC2
	tFbiEZJaQmfS0G8VBGrG/shajc5iLn4arFpZO6p2TQL9zkz95Z1UQZaciRrlwrheuyCwKWfbs8N
	VcBmUW/kReC+F+Z15kwFTnZVwl/HPRHZhHxzpWy0o8QfzPY33YO6ENbuZG4MrHNdQGJny014tnj
	jOWOAjtPaQu+CUvf4oKyV8VLzIf1+o28ZBbysEF3Dna8iEXFXGIacGRB8Bmh8T4bkKg3CC9ff44
	JBZXOr6/xCPEAIzoKckpWZWdMvHpvJoY+rGePuE00W+ny
X-Received: by 2002:a17:90a:d645:b0:354:a57c:65dd with SMTP id 98e67ed59e1d1-358ae8c2efcmr18642454a91.24.1772118687404;
        Thu, 26 Feb 2026 07:11:27 -0800 (PST)
X-Received: by 2002:a17:90a:d645:b0:354:a57c:65dd with SMTP id 98e67ed59e1d1-358ae8c2efcmr18642420a91.24.1772118686829;
        Thu, 26 Feb 2026 07:11:26 -0800 (PST)
Received: from hu-anane-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359037af167sm6218250a91.15.2026.02.26.07.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:11:26 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        ekansh.gupta@oss.qualcomm.com, stable@kernel.org
Subject: [PATCH v1] misc: fastrpc: Add reference counting for fastrpc_user structure
Date: Thu, 26 Feb 2026 20:41:21 +0530
Message-Id: <20260226151121.818852-1-anandu.e@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8yPMqsP_pYln-dsRYEs9LbLW5ZH-H_3t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEzNyBTYWx0ZWRfX3TQdY+DipQVr
 hnkA14EAG+KXsLTaLuVsvFa+KugkCYeBpcUyinHfstUnrg4FYe4R0exprDJM7OzoCVgAKiL13ET
 QrKcSMwzMgv0ub3GlAU6rUKpBvpwEmCvl0b4FsVNdD1sxguNwuZaH/jqrflrtoqRhpHwsiC53rF
 wRSFy71ZWfHWS68EnrugKvH87qagOjIMzAU89OaSKCpst3I6PZrCbdSRq7x+loMZj96tPYREgJ3
 ddIzylRMrsRFMlIF9AWJhxdh9x8jzu6cz1CJyuacGs9n9/gnBqFI/sLycx8KdxYWjO1yKdB1m1n
 EOME2DTpHadAcHy9O7pH29MOWlVwxOr18paWLnD/ie1AzVXyI3W0U74ygRHX8aQV4eP24bo0Wn/
 syZ2mmoCZ7C4bQ74ifLbKWNy5LUBM8eYRBuPR48IP5suUYB6sREyDaT2r/sX3Slo+ym7hF0qkLn
 Ek2kRJJv3Nd9bCWD8iw==
X-Authority-Analysis: v=2.4 cv=PO8COPqC c=1 sm=1 tr=0 ts=69a062a0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ixtUXsZW3yA3m9atQOEA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 8yPMqsP_pYln-dsRYEs9LbLW5ZH-H_3t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260137
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-94326-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anandu.e@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6CDED1A86AE
X-Rspamd-Action: no action

Add reference counting using kref to the fastrpc_user structure to
prevent use-after-free issues when contexts are freed from workqueue
after device release.

The issue occurs when fastrpc_device_release() frees the user structure
while invoke contexts are still pending in the workqueue. When the
workqueue later calls fastrpc_context_free(), it attempts to access
buf->fl->cctx in fastrpc_buf_free(), leading to a use-after-free:

  pc : fastrpc_buf_free+0x38/0x80 [fastrpc]
  lr : fastrpc_context_free+0xa8/0x1b0 [fastrpc]
  ...
  fastrpc_context_free+0xa8/0x1b0 [fastrpc]
  fastrpc_context_put_wq+0x78/0xa0 [fastrpc]
  process_one_work+0x180/0x450
  worker_thread+0x26c/0x388

Implement proper reference counting to fix this:
- Initialize kref in fastrpc_device_open()
- Take a reference in fastrpc_context_alloc() for each context
- Release the reference in fastrpc_context_free() when context is freed
- Release the initial reference in fastrpc_device_release()

This ensures the user structure remains valid as long as there are
contexts holding references to it, preventing the race condition.

Fixes: 6cffd79504ce ("misc: fastrpc: Add support for dmabuf exporter")
Cc: stable@kernel.org
Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 47356a5d5804..3ababcf327d7 100644
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
@@ -497,15 +499,36 @@ static void fastrpc_channel_ctx_put(struct fastrpc_channel_ctx *cctx)
 	kref_put(&cctx->refcount, fastrpc_channel_ctx_free);
 }
 
+static void fastrpc_user_free(struct kref *ref)
+{
+	struct fastrpc_user *fl = container_of(ref, struct fastrpc_user, refcount);
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
@@ -521,6 +544,8 @@ static void fastrpc_context_free(struct kref *ref)
 	kfree(ctx->olaps);
 	kfree(ctx);
 
+	/* Release the reference taken in fastrpc_context_alloc() */
+	fastrpc_user_put(fl);
 	fastrpc_channel_ctx_put(cctx);
 }
 
@@ -628,6 +653,8 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 
 	/* Released in fastrpc_context_put() */
 	fastrpc_channel_ctx_get(cctx);
+	/* Take a reference to user, released in fastrpc_context_free() */
+	fastrpc_user_get(user);
 
 	ctx->sc = sc;
 	ctx->retval = -1;
@@ -658,6 +685,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 	spin_lock(&user->lock);
 	list_del(&ctx->node);
 	spin_unlock(&user->lock);
+	fastrpc_user_put(user);
 	fastrpc_channel_ctx_put(cctx);
 	kfree(ctx->maps);
 	kfree(ctx->olaps);
@@ -1606,11 +1634,9 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
 	}
 
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
@@ -1654,6 +1680,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	spin_lock_irqsave(&cctx->lock, flags);
 	list_add_tail(&fl->user, &cctx->users);
 	spin_unlock_irqrestore(&cctx->lock, flags);
+	kref_init(&fl->refcount);
 
 	return 0;
 }
-- 
2.34.1


