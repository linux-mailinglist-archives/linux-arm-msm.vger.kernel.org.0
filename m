Return-Path: <linux-arm-msm+bounces-109381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NdKKvSVEGqBZwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:44:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF4C5B8766
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45E8630ABB3B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552BF36F8F3;
	Fri, 22 May 2026 17:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QnQGSMjr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cav/qZZ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79805477E
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471297; cv=none; b=Em4bY96G8pqxn4JoOVlP+UMtlmOJMYXRbuggV3XesIvCMmL+PKIkpvP4CWnOU3tyTFs0ZcTiXOHrVzEU051iSfGlVQaNactM5A8mBv2ZNssupCZaLh5q1gQUfKRxizzowMrRqCmJj03QBJFWyLDybZgUnyw4y8dQ4ktS1usus/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471297; c=relaxed/simple;
	bh=hqi3tq0y9epWny4EPW7VeKw3SDVmkOb39hmH3jRlfjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jETbWZh7/sEs+9VVgDrfB7ez9lbjVu2ApPr1vj//wXAUBQetSG0mf8ZIfhPUSOxhbNtrDbCZa5Llz6bPydf956RId7GBoKRXlSCzHVqu+WCg4hiM3L59/DvDQwQd18RwvxEpBey6BEv3EA86rIeoWRjq5T1Eubfmap6E5xXgmdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QnQGSMjr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cav/qZZ5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MGann41733031
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zUQTW5zoVnU
	p4nHccZutj+SQwGrJIr4wWIwttwIdYe4=; b=QnQGSMjr7L+VN214WZP6OnmkLWm
	KN73OQYNju3bGyQueFhrZrJ343ivwCF544ftjoOlvHDVC9cTqKBbFEOIwUdwtFp0
	DgFNngDqFixIdhx0CXR4FCoZ5a70PgP44K/z4V71+U2qKoX0Dou02dlzRnt/mOQe
	kEQMqy6fvDXfwswRgJqAUPRUEm9HxiUzzXGBl9nRfORcBpjNRNo46/T/Cn24lSgw
	oRzVRgbWLW7ab6jnurCP/YsisnuTMWC/O0yUaXUw1ETxljlKuN2B4BM+H5AJeu69
	Qi88ArG2EXh1x76B4Htd27osWPjWl833gf6wfvS2NanvVnoMyuiiA3fjI0w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eattq884m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:34:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c82ac893940so3730391a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779471292; x=1780076092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUQTW5zoVnUp4nHccZutj+SQwGrJIr4wWIwttwIdYe4=;
        b=cav/qZZ5Ni66gkpzJBXnectF8dOM1zc2uxb62QVVHgw9LPZf2CtQNUhclvXftd13t3
         YkA3WjWZhmf9YY4FBNaqLC3YOYz7vNqDlq5BUG5lM2SCQCuUk6BEt0arH+yymX4+JI+M
         PDgv1AMaElRBplBDohRx2/dBaLtVhhtKnsj4McMJV7DttNDkJJZ7SFtqxIz1XLWPFSkU
         i4tb+iUUgplsgeFxUzoCWmP9RFhAsmlm6tUzNaE0FFbVqmVOHVNkRLnrd58DNVZpqnvA
         MfVivgLSElv5o5WsOjYcjwQUwPqQML62S56ANrnwMzHYvB4XZQ+CUu6mnxWGdEaiXA6z
         dLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779471292; x=1780076092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zUQTW5zoVnUp4nHccZutj+SQwGrJIr4wWIwttwIdYe4=;
        b=bjYdF27Gf0pABBnOuS7HnT0tMVnvGuXL/aL6fWSQEoZSDjVCzM6pgMTdEdFSNu2+0Y
         WpanHTyI8iDMIsYuIh8YTJJmx635rhYEe1CcSWZJt9UNSYnTXo9EQa+fqQlJZnGgbWM8
         BE9dRBvfnL9WfuwHbNmZn2V901QWMfFrnY+6s0cji3PIhfBefQC9UBE1VbEh0xKe2SlL
         C/rMKjODHEScSzmFYXZ1fDXYSND8PoAyBDoBin76daLtxo/V3jJc3NMs/WJMeS6nATFz
         4vwIkUgl4Abi83tt7qz60JV2zpbgO835hYUeFixfhj0Wz2RlpeeiOw/8vp+aQmIfC6tT
         ml9g==
X-Gm-Message-State: AOJu0YyofOfHqJ4mFeV7Yw4GkZoDvewD/L72Gw96WM+IFXcDUq4FCnUw
	WtXMc+r+D0XKgHZPLTEa7jurvDa6jvNJxFFDf4FsuXbnsermgsc2wncpJJLFXz0tRrdsQu35tnc
	N1boR4Y4BXvZqfR43tui7ETupEVP1jkEK+G6K8LELRjXyHzSuG6eAdiXdRqi/NjTgiqVF
X-Gm-Gg: Acq92OGiS3Tr/WHoXo6BbjFbkSogwOeY1YbPO5G5xvNTshO3P1yPqa0Jf+fIAy1Dmxx
	Q+dyqJMufCAOpMUMVVtb7ABG/jVPGwM1H8HgKM+FFe177FJpA6/dnaPvUz41uuC9oWY2TEweNOp
	KWvCRSzj+tm8GAPE2JQpMmrQMJ5ezswvm3JcESUMaGxJIg7M5DnpKDsmiCrP5OpKtoOGf854jnx
	hEs6ekXzYBIHtszNCJIFf9sTAVQmQ2uVe/o7bGMCTeskW4Fn0SkprKrbOEwTED1n97zqhnW6Kyh
	x+O/BLMY29CycN+x1owG2U5eptquI/yKM/If1rXsgzfgcJ3JvynE3FBwRuXJi0pFazIbjgvQ3OK
	PB5kU0IDHAbIYRFzR/2K9eDFHKk4Bd3JW1HcFvrrwaSM=
X-Received: by 2002:a05:6a21:a97:b0:3b3:258f:7a1 with SMTP id adf61e73a8af0-3b328ca420dmr4892477637.15.1779471292400;
        Fri, 22 May 2026 10:34:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:a97:b0:3b3:258f:7a1 with SMTP id adf61e73a8af0-3b328ca420dmr4892438637.15.1779471291794;
        Fri, 22 May 2026 10:34:51 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852056dfb1sm1973705a12.28.2026.05.22.10.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:34:51 -0700 (PDT)
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
Subject: [PATCH v9 09/16] drm/msm: Add per-context perfcntr state
Date: Fri, 22 May 2026 10:32:55 -0700
Message-ID: <20260522173349.55491-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522173349.55491-1-robin.clark@oss.qualcomm.com>
References: <20260522173349.55491-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3NSBTYWx0ZWRfX1DvUXF8kakCX
 gQGgOSr+8Ig0SbZaxC3bFEVc936xEDJVoYN6kvrQx0K8Iq1NcZ6dwQcm/xkz6vGuC2BnIHMSHIz
 /NqsGl0gJRavHVdtd21sVl9vaBKuRVX7a7QKbVObTqVrQP9ki9w7TTHCc4q6KGRlGLo6P9o+s/r
 Wzrv9BXXDIyQemx3jey4G0DG3RZR/3Ng72+XsH1i5AG0InQGjfRzz6DUcpMkzdebUuugbhvhuB+
 Va4aDdvce2bzdHw9jisAQU5pEBvRTNPYC449yqAtUmAK57tQlDX+wiOHMRBKkxmcBrToRpQSznC
 /EwiJQ2QmNGYDgi3WvuZ2nM/86XUIyQh88sCh0UKyt9ph73Kr3P/WYZazdJmzSgcZfV+OhVzOGk
 V6PiN8qvSaQb6o92Y946I4Pz9e336HeK9RCve9ghIVLfrUWm2/I1ZFLDWvjy5AN3Og89eGWttYZ
 Neo2jmJTzhEsULS63JQ==
X-Proofpoint-GUID: PgW0XnA8jm3bvM3H5PRAfJMvZk-t1NmA
X-Proofpoint-ORIG-GUID: PgW0XnA8jm3bvM3H5PRAfJMvZk-t1NmA
X-Authority-Analysis: v=2.4 cv=S/zpBosP c=1 sm=1 tr=0 ts=6a1093bd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=OtV_UDYxk2hhjaRdRjwA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220175
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109381-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.985];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2BF4C5B8766
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


