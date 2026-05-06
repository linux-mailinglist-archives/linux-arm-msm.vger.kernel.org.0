Return-Path: <linux-arm-msm+bounces-106161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMbULH52+2lVbgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:12:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 617854DEAF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4FB6B300AB1C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 17:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8239C4B8DF6;
	Wed,  6 May 2026 17:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fGYgwlgH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6e3Qhrj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19D94A1382
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 17:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778087536; cv=none; b=QmXPMMQfzUZWCg8CXIe91MV0LZizV5LEaKTw9+ahwmqDaN2/Vs930ytAljKSABmN6OUAcb5t/w9hAdxRWcivYpFtCDAspxYMmqiH3U05XHYxuNqXd8/oBtLy19AzZqiFF/nS9/t2Tj7o2klYgC6r/VMmx3JyatqO+nsseyEcPrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778087536; c=relaxed/simple;
	bh=XZmlmpKq9dT2OjVxZaCDZBHXjS0SdHaDhZM+xjSaQsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oDm01e/u/OaxFoMgqAxBFlL9LGsWTJzLudX0qg2OsH5n4Boo3lNCbk+8bQkl/W9tw5Cn2TgixvEjyjMxKZBgK3nKgiwle5Clb+hoWCRr9DCeH+p+9W9J9iQelDwRgq/EQsUJKNWlUQnOvTVKl5Ol2rWINeZvGQUQfhrT1qEcMjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fGYgwlgH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H6e3Qhrj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646C5PTo3036600
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 17:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z+T7DF6d3yj
	uRFH4Z9NZjry6qzE7sW/NwEF2nzuN/uA=; b=fGYgwlgHu8M6zy37qKRjo7HNpRk
	aHr4OyhlJBEgpMbEvAZG2O3D9ECWnIhJ5LOgQBhcde3MFYtrV6VcpNPnyjnedE6Z
	F721tO1VaaF4aUHASVSmuZ+c8FaJ1CEaaiIG+mbI0gCsWQey+C/nprsfpsncJs6m
	9tUjp7FpJWwpQGTlN7ByoW4KxQgwxg0ersdqdPwboe4wS06KBlXWW4B4J7ebVrPY
	AHij2hWX6EWhw+77jrmYhXdCTwopMJO0MEdaVTc6YDC8/UZ97GdgvoxF1lTv2oeU
	OZDJ66bxwu2+8DogI3sMrX1uvLRXz7i8Vq6LSC+xNh+glRaPhf0ABnQ9TVA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e05bf171w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 17:12:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so648296a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 10:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778087523; x=1778692323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+T7DF6d3yjuRFH4Z9NZjry6qzE7sW/NwEF2nzuN/uA=;
        b=H6e3QhrjQXvBQo9Q0ghSz3kL68N0zn5vaS4lYHJk6I9anrA93VtW90rFrIQ0C/IoDx
         fwz3KfSPm2X97IUh31K5OE9EF62sW8fLgrwitzVa314prdI7865I1vF8hISN3Lnyso2G
         zbAHZwmwxubeFAOW6YVCWLk5CVnuLPEVCN95KxRi5eZHWGDHuQomdE/rLi5TASMinB0d
         MhXeEo0PskYcpT0Qfg6wbDp9bZIfUVFe45dBI0xzJuPQHBferjwPZGhfXi5Bf9sKe88N
         zbOp4n5MPJWR3pMUw/20s9u4x5tP3cpKXP/l8xKP4IDNvZ1M8w0FLtpvf7YKDia+zWVg
         ITmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778087523; x=1778692323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z+T7DF6d3yjuRFH4Z9NZjry6qzE7sW/NwEF2nzuN/uA=;
        b=ZzOcq4n3TwNoC27SVgN7UZcHKrgYNKSKYQiSKeDX42M2MLp6xwrm6dPhrUjFzLjinR
         3ZdeHicaKHP8WwXC2qAaINXJdeLYfsGscpuecjtnZJ+hQ8iO5h3IypVZnDM3QBa4Dq4h
         l6eZlCFZdJHJBe2NcJ30E9FNpgstAcpLHxWU6xNm1HRXXvZM7ek3lpLKewiyNfRHlFK2
         4UqAYfqIpzTW+r9nkxWa0cI1Dbl24SA+6SqGge0btUFpDXa6yikdBPrQkf+sopWFH3Ix
         7y/zvuYcVqcXXHBFViMW46gkqCc57gGkRxOQhtR359+1v2dXrv6ZXD6QNZCE3gJlBIBM
         pemQ==
X-Gm-Message-State: AOJu0YzBbMREI7sIWHBS1eY7rCajgzmwQ13yktfuIPUQwb9xylxO2gza
	+eNSg+U8SLbyNXds/xzcS48IxXl9EOSf9MgOhc0NGgTT8u29KxHBHwKmiSBeZW6uUqAjXXID+BG
	ToKYT9jVU7Rodw79pD954vDVCpl9oB9wJ7S/vHkJK+91Q3ONrVi9N4LT56xD1YyiadBgc
X-Gm-Gg: AeBDieuycDoJpfXAxFg7fb302AaKQrkNFehwd/WSZtMp9ClKdLNgjX8PEXx07+CC6R3
	Vs9ykkU3erUZgbSkMoj9LOTlR1qIPt6+QGfBcG4ahlJgvdxtHDzxstopK86/wwVsVBbEGCr+fPp
	RGWwYjEXxZ4UBYaRM6C5nliFDKR2xjMMEf1tafvu6PPgD2EMnn7gH6ZbESXk0bszh2bSRwKd87h
	dhKDbayPOfs720eXuq5Knwa8SHqsby4zoj37uIq6fK50PrSrpKcqBlpKwKQU6e8qw6J0TXMAmQS
	BFGhdUHiPDL4MFc3HC3Q7XaCr3gqRR6PuYlICIEWfgz14I1fbsmNnppX9DRpwF6QENp28FSwzVx
	iSUSIw2tsVg1f6Kzn6DAvk5IqLEPKMS7N1tZ8tdA0sHQ=
X-Received: by 2002:a05:6a20:2588:b0:3a2:e26b:295c with SMTP id adf61e73a8af0-3aa5a1eef35mr3888838637.18.1778087523244;
        Wed, 06 May 2026 10:12:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:2588:b0:3a2:e26b:295c with SMTP id adf61e73a8af0-3aa5a1eef35mr3888795637.18.1778087522709;
        Wed, 06 May 2026 10:12:02 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm7592511b3a.3.2026.05.06.10.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:12:02 -0700 (PDT)
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
Subject: [PATCH v4 09/16] drm/msm: Add per-context perfcntr state
Date: Wed,  6 May 2026 10:10:33 -0700
Message-ID: <20260506171127.133572-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506171127.133572-1-robin.clark@oss.qualcomm.com>
References: <20260506171127.133572-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2OCBTYWx0ZWRfXzE4xMKjxV7n6
 YkIN+vpz4MKcuBOsW5dUX8ekI5VXUru/qw40FkiKmY8d1Ts4W2k4mh5xOaJ8y8paLQx2M9wpf0r
 iFVqlSobaIFhLtN/SUceZzN+/V84EGKJDWkghpwGUT3M/3/zIeDox9QThT5vq+YqF5yHxVXGF8r
 QM6P+RzJ6LPJSoU4GAM1SdrmlskM937TDo/VMi6JzM/7mv7BfTOk0yp3u4GdvWzdbek+0hWWzhN
 4MMcLPP/zE01THFWk5f6xVNDnbFfLKcsK3rwuGLeFHSmgjl+DLTXRmH8d1/Y+JPwi38ay/eQsh6
 RTj6KEzhTxQ1nubsmu8Yzgshj6CgSbaMN6KVMr3h9TwqmETAT7dhii1HpyYb/foTdUC5cX7ykKD
 DKjEbsQ8Wp/sXImqmLY4qWgM0QuYSvyD5gAbhxJEQ5d1NRvpN8FGZ5EKK/f6cg4Y3DXTXUI9uJs
 iFlAbO5LjX+St9r6dvw==
X-Authority-Analysis: v=2.4 cv=PqmjqQM3 c=1 sm=1 tr=0 ts=69fb7664 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=OtV_UDYxk2hhjaRdRjwA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: JciQXhw3u8DaqWcnPJ2jZ5U95N_T7enX
X-Proofpoint-ORIG-GUID: JciQXhw3u8DaqWcnPJ2jZ5U95N_T7enX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060168
X-Rspamd-Queue-Id: 617854DEAF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-106161-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
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


