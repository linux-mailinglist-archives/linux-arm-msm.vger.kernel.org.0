Return-Path: <linux-arm-msm+bounces-105800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM8oI1rv+Gl93QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:11:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E273F4C302B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FADB307AA3F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 19:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BF23EFD30;
	Mon,  4 May 2026 19:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QdjsyUX9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ROXWmd5Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2413E6DD3
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 19:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921720; cv=none; b=V6ItHl6lHYsqQdRAUPJHE3Tv6YmBUBSEQSjHhpYv05VAlznRTK5WKldhHinZz/tU8J/TXsEwAwjdlaJem8VE/mm3/jxOomvb1yAI8+KDVWlBrZbCUwTfCl36Vh5Asx+9RdA02r5xwTR7ACu3Fdt7jlzdgP2k45mj8wC4RCFRH/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921720; c=relaxed/simple;
	bh=XZmlmpKq9dT2OjVxZaCDZBHXjS0SdHaDhZM+xjSaQsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y+nS90JyOgsQq0CNbuDJNXFPTvr8b6jTySGXxMNvtHMp2cNtznlno4X4Bip/ZNNQbCNrb1wnfbuDlssu4SK/OssFaCRoQKzJRM1jlsFqC902+90Ua4fvTbQLTyXmB17lfI8xniTHmSIzk970xv0Xs3ZB1vqOufcZcARx4HSczjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QdjsyUX9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ROXWmd5Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644DwwSZ3468153
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 19:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z+T7DF6d3yj
	uRFH4Z9NZjry6qzE7sW/NwEF2nzuN/uA=; b=QdjsyUX9GNUH6JmqK45M7BjYJ7i
	dNlw/I5Fi9YvkjszHEJtSu1cYtFk/P5MID8cZWnvmTQxGEsA0tc/XGVzebZH9zhS
	aTCD27siMCqhzIRZIt6hXJz8zP0N0BuNy9kGnVwkl4CH0vcAYvA+95x+X66IKIyP
	DVQlsPjcQ9PyCPVq4BAO4HadB+utUtir9aBQjZv1XVbSu+TE0B4XJgBGfFopbMop
	hh/awpWEJWMOYSIXY0GUNoUdx/bXO7hR59YTFC2BP0h6o4+Iu+HCS9oK8UWdAM6q
	vyxnn5++z5q4bXLP9iQn7WxVMUOcpQ7af9kk9DVTS7/w3jTTR59f/wPJFeQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvtjs94b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 19:08:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365161a9de4so2153454a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 12:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777921717; x=1778526517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+T7DF6d3yjuRFH4Z9NZjry6qzE7sW/NwEF2nzuN/uA=;
        b=ROXWmd5Z+FJang2QR02Ah1xlKz15TzJO0kLcHsgYXx1LGZyKaNIyI0f23x7e61VURB
         YAjF7ElHqhp9EozS3jiBSd9NSwbRM+ZZufFZ0/eYP8YZpTLfoQ+JY/t68+DcJXrzLEy+
         CBp0gOMGrvjmmg6CkxQMY6OGXATW9tYObh7tEZMjZzs2g9YYaiUovqtfPVZwtyLEwHOO
         fd95q7NLfbD7FhtNbco/HOjXi4Vo8dp9rrV3XPDqNebuCGdcEatwkzT/Ix2sBf3m3Y30
         H1Yp/9RZEVIK9Vr0JC4NU38TaqbEfnCNxC/nk/2h81WN/vhmRd/nbQ25KACW3DfQuvlr
         qBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777921717; x=1778526517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z+T7DF6d3yjuRFH4Z9NZjry6qzE7sW/NwEF2nzuN/uA=;
        b=caj+3qzHq08Bv6pMXaEq3jK6LaW7ZoE8yPOVvkwJq/QUTz+YoefaB6PDGLJAm8kXib
         RnYxegMN5NMFikKBFFWFWB2qHnyDoSocxpDNgKSyXy7T7faPs2Vm0m8LQ43ccsLhL+e3
         +aLdziPy2g2vQ98MMeRju6TJz0EADnz5xdOS9ZEh7D0EA/TGIK0ecRl9taPhZuAMIJ+o
         djIBAyUv8rTGgwXUTCbECyA23kGRvHsRvQIV92kAcBNzYAt4mqG6Hl9jWcskT78rRmIU
         falApvorxeANgQY/kMifBU5aAeSgiMNqEEGET+Rb91jtjhpqp5+pvHaPNXpobbKHINZg
         0DUw==
X-Gm-Message-State: AOJu0Yws4dek8qf3DCHrk/jJSDNAw/LhyGiM9wG8cv2vl8gBWHHx+JU0
	gDm78CWhYMyMm3PfIx285GS8HQc/5WkjN1hYqU0kzxd1LzvuMbo/QlpgnQU9fYgng3Rax0W1Du4
	vMApnVTNLzdnC9L4BaTXx+bZAoptGj0b9ZmkDbwBg81Qms9dtdbSlxgbEmoEHXbPzOcFd
X-Gm-Gg: AeBDies3jVWOp7VMJyq9lW8AVP82vRC2AN5zEPw+9lIz4cd9PicnHCW7GqjnsVeMlSq
	K65r5cTGDS+BkfC7xHuczg1UbpMHiAGgsMhdis5oHp1PK5cIfDPUj6MyKnMtVHlQF3QG+2R0m3Q
	F9CXQ+4hinECMzG9UIPTqnxAX8tnXpvhImAYqTWw98+f0hOiiEkI8wZI3+jCTwZREXDaKgj6KLj
	PphlONjs/riUwGhBwB6clfDRs9upzHWNzeLEAFf9bIDx4gR+W+KtaARJcq6n+TTjuLB8vRU1wHl
	Htpwv+9x4Ma6EzkVYpZtmIYwLHdyMOWE98zVCsu1FdBJmkGXPVys3A2Vp6DBwFoC/2kbDpTtZ8n
	IcdHDtnKdkynpQ3YEStQGsJgM4VxpeQ0C8v7UDKSTfbM=
X-Received: by 2002:a17:90b:33ca:b0:35f:b1f3:ac12 with SMTP id 98e67ed59e1d1-3650cd08154mr10029725a91.4.1777921716646;
        Mon, 04 May 2026 12:08:36 -0700 (PDT)
X-Received: by 2002:a17:90b:33ca:b0:35f:b1f3:ac12 with SMTP id 98e67ed59e1d1-3650cd08154mr10029689a91.4.1777921716094;
        Mon, 04 May 2026 12:08:36 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bdf2a71bsm15455932a91.1.2026.05.04.12.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:08:35 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 09/16] drm/msm: Add per-context perfcntr state
Date: Mon,  4 May 2026 12:06:52 -0700
Message-ID: <20260504190751.61052-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504190751.61052-1-robin.clark@oss.qualcomm.com>
References: <20260504190751.61052-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yDfm-LiJRpLzXllOrfg4PXbSqEnF5bi0
X-Authority-Analysis: v=2.4 cv=KuN9H2WN c=1 sm=1 tr=0 ts=69f8eeb5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=OtV_UDYxk2hhjaRdRjwA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3NSBTYWx0ZWRfX0hxjepM4lpD1
 u9GLB7LtxitGNu/Ef2ioWTX30K547Sq2METXgZmnRxe4Lo1gNa6PyRwafohaO7gFmWFuuQcgUPn
 jyiEn5v3I4YZ9CYXW27vdZ2uoHQuGF0tuJS5u3rmgqooN168WiA2AD7C07hdpmjATCTcnZK5dpH
 gBlV+/k/v5YnxOhJH/dQs6So4Deo6phCTLl5En8hWKD7cSSxjp1LqFTPGosAxH+0FCqvVsrmQeu
 oDgHLu6w7jLSy/I1rYg969+rJEyF3Go9q0+CbtUbZlD/oWR1ISjyYjI21foLNLzRSmU8MnGLQzh
 fUb95fEhbB0WjA3PpMEtmWud6BfBuW2wdzsfOUn/7cLDjJxR4ffXy54ri5pzJ5VA0tblR8NXOMh
 78lx5a/BBZZI/Oz/Y4TYa4OSIdJ6vsdZ53yXabb/XHnPfXA4t01uZGJbpFulL353ELOjSuwiZjA
 9G2Mz4o9Ts1i1sEe7Sw==
X-Proofpoint-ORIG-GUID: yDfm-LiJRpLzXllOrfg4PXbSqEnF5bi0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040175
X-Rspamd-Queue-Id: E273F4C302B
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-105800-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The upcoming PERFCNTR_CONFIG ioctl will allow for both global counter
collection, and per-context counter reservation for local (ie. within
a single GEM_SUBMIT ioctl) counter collection.

Any number of contexts can reserve the same counters, but we will need
to ensure that counters reserved for local counter collection do not
conflict with counters used for global counter collection.

So add tracking for per-context local counter reservations.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.h         |  5 +++++
 drivers/gpu/drm/msm/msm_perfcntr.h    | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_submitqueue.c |  1 +
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 9e5c753437c2..19484774f369 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -434,6 +434,11 @@ struct msm_context {
 	 * this context.
 	 */
 	atomic64_t ctx_mem;
+
+	/**
+	 * @perfcntrs: Per-context reserved perfcntrs state
+	 */
+	struct msm_perfcntr_context_state *perfctx;
 };
 
 struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx);
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.h b/drivers/gpu/drm/msm/msm_perfcntr.h
index 64a5d29feba1..7f0654182496 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.h
+++ b/drivers/gpu/drm/msm/msm_perfcntr.h
@@ -35,6 +35,27 @@ struct msm_perfcntr_group {
    const struct msm_perfcntr_counter *counters;
 };
 
+/**
+ * struct msm_perfcntr_context_state - per-msm_context counter state
+ *
+ * A given counter can either be unused, reserved for global counter
+ * collection exclusively, or reserved for local per-context counter
+ * collection inclusively.  Multiple contexts can reserve the same
+ * counter, since SEL reg programming and counter begin/end sampling
+ * happen locally (within a single GEM_SUBMIT ioctl).
+ */
+struct msm_perfcntr_context_state {
+	/** @dummy: Some compilers dislike structs with only a flex array */
+	unsigned dummy;
+
+	/**
+	 * @reserved_counters:
+	 *
+	 * The number of reserved counters indexed by perfcntr group.
+	 */
+	unsigned reserved_counters[];
+};
+
 extern const struct msm_perfcntr_group a6xx_perfcntr_groups[];
 extern const unsigned a6xx_num_perfcntr_groups;
 
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 2598d674a99d..a58fe41602c6 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -66,6 +66,7 @@ void __msm_context_destroy(struct kref *kref)
 	drm_gpuvm_put(ctx->vm);
 	kfree(ctx->comm);
 	kfree(ctx->cmdline);
+	kfree(ctx->perfctx);
 	kfree(ctx);
 }
 
-- 
2.54.0


