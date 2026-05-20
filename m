Return-Path: <linux-arm-msm+bounces-108844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Oj8K3ALDmo35wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 21:28:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 191FA598596
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 21:28:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CC61311FFCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CB9370AF4;
	Wed, 20 May 2026 16:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pwO4ygww";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="knBCWAlY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16A436E498
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294337; cv=none; b=tKEVQSaNOjfha9RzxpdLkJ4Cw9V1Yjy3qcEiQP4uTZJOia4+sIo6yV7rXYel4IDTRSlUCIbq88InTBypcNkdrIA89DFY2DfCVavS80SGcHt9cMqKw+fdYruowm8m1Mg+sAhv8ahtRPLqi5sbwNuG1MdQGxiOtuvgAQs6h9duQ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294337; c=relaxed/simple;
	bh=hqi3tq0y9epWny4EPW7VeKw3SDVmkOb39hmH3jRlfjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nCUyYarAhrQwwEUf3uZebSykkBkq8u14HaSd2FuhiBja009GZk/4ap7X6Ygm2pBASW6pYmBxqZmTxQIkqK7/lkSKi3fGVpdzlkrG+5RR2tEq2Oc4Lct2vcX/8/Adz02N2oWg62jObLNbkroX7tzGsWZirFcFAoqRxlLnNPy/vrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pwO4ygww; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=knBCWAlY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KFT2IE4115399
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zUQTW5zoVnU
	p4nHccZutj+SQwGrJIr4wWIwttwIdYe4=; b=pwO4ygwwIW3AkFObGV9ks9gjtcV
	4QnyFTUlChK/O4ZitILh0OaSP6BIx2S90/J/dFhVa6/q9zRxvCy/kjGvHrC3kNcv
	rwogK0sAdQw8sf13sSUEGZ4qa+N+pa+ucgkVOfSq3SzAYQH7X+o/xrBpxnKWk7P+
	63WlMttw6FK13SqvjwfFi+I7B8YakPqffES/ojycVkB/P3whQsOHQhvvuUBwn8LK
	Rv7w1FoGBpTqGJxkQEZYcGA5aG4SIn54+KKuZfRuzEoppsGN6ZdduVd+z5Xeavl0
	HTMbM1HEFKxxyB64oJGLh/G4MXbYGwdx/szpiykGP6NAskgWe6YxfWVqYrw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e99w0hrcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:34 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fd55bf6cdso3126809b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779294334; x=1779899134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUQTW5zoVnUp4nHccZutj+SQwGrJIr4wWIwttwIdYe4=;
        b=knBCWAlYlZGOniw27tD0UTd90fvCHyUyouwT+KfFmIBrdDhfAAB3kXiJ7feHz9/z5B
         5LrWcNPpwXBUuSGTYPBncTQC3xqogVJY7wVQpbYah99Cwrqeb2que8xd4w1DQD0ZHhVe
         Xx27hKByA9YnEjJ7QiJX2F7o02UTjA6NCzW298IdlI7LTPuysf85pOv5si5h3cTdLFQh
         jztunmTRfUYj0pcJxxlLVENuoSpgFfFWz4hxLAL6lQgNQ6WyD6b2D+SgY5Xnkp6LQnKo
         8JcgG2sdcaJN8WN7apmwfuZG1Z5h89CHcO2h22NdC/ZrPd0ApUIEXhFvX/jzMy3lwW/K
         lH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294334; x=1779899134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zUQTW5zoVnUp4nHccZutj+SQwGrJIr4wWIwttwIdYe4=;
        b=AXdLzw4BWJ5HYGgaSuVa4fUfJSEeV5oFM+Ai0XmpLp7lXS5CQkAC7zz4DG+ZDC2n5d
         ++aty9D6PlVQoZXLV/j9CEXTdfnDcHCXAxmR64QPE87+Yr+ZnZyIF97JQN+qp/HMdoEp
         6Qk3APHvZ1WKQ7mrfsngboGy7Hvj9cwUGZ5T1Odyv2zAeodv3+W8PjzI+rCAnN+nfYUm
         W/JI8qg1nOWcrriyUuyEO9D75q6WHhfCMYrW3+Qm94Spt5n1c7a61ygDJrB6FhbHGjwh
         TI5F15NTKSM2sfvYUDyhedVVXYEuN2oxlfBUiXTqtYFl5sS5KZ3smXHRc1vnmhoEa9l3
         yVCQ==
X-Gm-Message-State: AOJu0Yxn7z9j88IwIXLT+if/tBO2l1H/b7gYe5/tL4D46Tm7kfKUTiFT
	V2NxdMn9CDZ2s3y4dm9taU109qJuxaNjHqBHSG3UjUyI8uM/THrb2SuDOo1iUFbmniFlh7uKiJz
	uxrxti5+IYWxjkgycoYvkd0fzisSQA1YEduzNDL8Q406DmK/WnqkX1HsY7rDIfL32rtTl
X-Gm-Gg: Acq92OGdLopPSAyE9XLDhC0CbOQdPKoupAb+/oxOL8f5OG8kkOmpBCFhg6M8xv4a91C
	2ZKKk1MadjT+6LrV944dr3w6E3HVAFKX2++ELB//2bzuKzTQP6s6ASZOhIKcNezALuVFqKVPGs+
	VNw+pzXFeSRFqv6/Lfrq0l5Iywx39Xx27YEkW7tDr8eqAXuOv8gcBuzg7XrRGBoRGkN+YB9lVSZ
	tOPOwmXd20LDiByA0Hz8YC4Qq0bjpmFIruFvg4PmOF0SFFj++Ute7CTXTOthXm0mw9GDTy6VISf
	v6UE7ttDHzboIXNSyvUqJgJowSnYKR3Q77FSvKkpv8s6qlo9vLl48rnxg7dJi0H2kMTlQ+ByJk+
	/QP38BLxxJcklUh4R1C1rXSeqrH8tpC0G
X-Received: by 2002:a05:6a00:18a9:b0:827:3b1b:43e6 with SMTP id d2e1a72fcca58-83f33d227c0mr24677345b3a.21.1779294333551;
        Wed, 20 May 2026 09:25:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:18a9:b0:827:3b1b:43e6 with SMTP id d2e1a72fcca58-83f33d227c0mr24677314b3a.21.1779294333020;
        Wed, 20 May 2026 09:25:33 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1977c494sm20995960b3a.21.2026.05.20.09.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:25:32 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 09/16] drm/msm: Add per-context perfcntr state
Date: Wed, 20 May 2026 09:23:56 -0700
Message-ID: <20260520162454.18391-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520162454.18391-1-robin.clark@oss.qualcomm.com>
References: <20260520162454.18391-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3w7JKQetzvFZ_CxyvLYgivDTXUin_vJy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1OSBTYWx0ZWRfX0KayB/wicslL
 4Mu3c77zY2T4jWdZHRushWm/JYiAnkwyAGrnaEC0lOXm2rkERmU3or1vFJKYaB38g06wvJZ6oQV
 bgXOwwNSVbeu3ji0gp5/8xwUPn6MrCgAojUyJ6vSs6GarmSmcs+q6leg/EUwByLdN6aiQunwL9t
 IgdYNxixd39AnaRpz0Je94NbeMQRQBS8TZ6mvBSPUYgAJvEhDuBbRm2ult2W2YGxkiIEUhlug7o
 yoROinq07Q7AJWZDGjWfDSpcF9NeDuMWRVCw5QScKjHadmstvud5dglI5f6prmXVILCnMP89e3J
 5Q7poSrTSxq2wrxyPL9Wab1bzDttbdvkV80tPIIfk09pHSAIhy95Pud3yf9zXFCUjIeyASWr606
 CwH4Phtg2y0yYhUAzNlFY99hOrJ/L+K9nE5F7mRdGXgRP8r6uFdTP4CsdFt0t2M/shzA37evUhl
 g1/DohHxSjVa7kO/OgQ==
X-Authority-Analysis: v=2.4 cv=RZigzVtv c=1 sm=1 tr=0 ts=6a0de07e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=OtV_UDYxk2hhjaRdRjwA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 3w7JKQetzvFZ_CxyvLYgivDTXUin_vJy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200159
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-108844-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 191FA598596
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The upcoming PERFCNTR_CONFIG ioctl will allow for both global counter
collection, and per-context counter reservation for local (ie. within
a single GEM_SUBMIT ioctl) counter collection.

Any number of contexts can reserve the same counters, but we will need
to ensure that counters reserved for local counter collection do not
conflict with counters used for global counter collection.

So add tracking for per-context local counter reservations.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
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


