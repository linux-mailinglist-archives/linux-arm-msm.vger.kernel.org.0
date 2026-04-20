Return-Path: <linux-arm-msm+bounces-103848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKZWBu6o5mnTzQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 00:30:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C66434AF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 00:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A94D330488EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 22:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37E63D091E;
	Mon, 20 Apr 2026 22:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gLs6ZNZO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FC3jkSwb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CEA3D0935
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776724045; cv=none; b=U6dLATqeQZ0Qat3HjKqeJ6eURqQojCVFo6RLYWoQiLnkztLUTwIkBXdFUXzH2eTSUi0WUpOBHCx8d1Am3euO73SMINJ3IoRSTfGh/ScaopuewkwXaJvXk4TuT9P3htqzEUVvYzjDQMnCyyPVNpuVenOWziRrAq/fIbtlAh1Gn1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776724045; c=relaxed/simple;
	bh=bzzQ4aYxL3tMOEhcG6/I3PaERyeEXMJI+pElefAVGOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ucmWH0Uc0N+yRSvLT7ISwNLsF0csdNaNMxn1A+hBdHQTXh/PXJUqaoFFr6HAgA9ezHpEMjdpibL6FyWWXC5SDLWXu/yJ7/rqO4u2AN4b1oc/hN30bW4lqZ4moNJM3y4sfb4KOp10j5XVbM6FJLSwRGSn7y5nTO38XSqcPKRWLC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gLs6ZNZO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FC3jkSwb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFYOid1600585
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2tbDv2EIvIT
	EuQGnte4mfjJJTKVcwabfjQz6jqcfywA=; b=gLs6ZNZO1h7Lj/2qhZOJ/Efrodc
	ybLAyZE0plDpdvsTX8HLc1ekMOL+ePlK6zBr/Sd1uLbkP/Mkw9KjMZ6XEFTpM2QW
	QbknPWMG83ci5JV6vdXOLExWs7ODAtp/KEK13ybQbdaU7/NWklsQIF/IR++hYClz
	ZPapiaxuqkOrlzBv4DQ8NmW+ExyzNxQ+x/7WVS/0sjCUt9Iz9JN8BllcGmajS5JR
	IYVXhzRsLYIw/LyGhGpRNgKizhlTOCb2xgz8HVEo2VJFowsCXyJuyUqpD5Bmsd+2
	nT86+3UkJtZ/esicM2M6lvMZ32EpQdWfiVISIEThySS/V9A9u4J1LpJS/Lg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh89arnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:27:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso1447593b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776724040; x=1777328840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tbDv2EIvITEuQGnte4mfjJJTKVcwabfjQz6jqcfywA=;
        b=FC3jkSwbO8JWO5cW8tgS2ug1J+h/WURg1hD2boUdg6uKVjW3reTUspBYKnbKsR5So2
         k1UTVWBMuJiRdWk0duU+uzCgNKHEWGZF6HqDz0mDNv3R4SQxG8yPTsoxs2L2EWapks8p
         d/7erfiVMsSKzeurV2n+AMxNmIw1Sm5UkxCoF+oVpBSQ1WodYKqLInBvx2mCslMs8qP0
         rWh1K//+04oGdabxHbWXgo9GPsUQMwiylhVY1o5p1Bcn9FVLDbrjgMfOOZeepVyGqWcN
         4hwOfhEsuqQddHpLlwnTe3hNaIRlmb7w2Co4TKwbchlOACRUQ3kkbCW4P3VpCceEsJQR
         XC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776724040; x=1777328840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2tbDv2EIvITEuQGnte4mfjJJTKVcwabfjQz6jqcfywA=;
        b=Q8ZCxxUaqsMXpEU+kq2BYTDGFfjsaTN2btRTPYe9y2eeV6oybEyLF60S0thFnjFZ6V
         /3JWy3d8TFQgPYMiWloC8VYQdtH4849cIa9AskB1KLKJi2W4jGql9qtrBrC7gxy9x/fi
         PDGdvFgRhAiue3PbiQdgw+HE5dOc6wsH8siIrAomsbM6N4q5g1rt4fPhSbIXJo/BDqik
         KHRhi85GhyN0KvRxL4A4z7c16wIRpT7OMl/UhLZKHakJ3ZIWJTrbGe5NAYtZyhU29aRk
         TpjPVcZpmJsJB/89XKC7CTrutCppxWbSPrMHrxKXyuUHhm6qqruhbvz0fbFq3TN8xvxa
         0/eA==
X-Gm-Message-State: AOJu0YzfduODnMJN42La+MzmazSQloYwNi1vifO57vIbHp320QWlwO+8
	CTFKPZz66DxM1EjUhQSqmA0Lz5vsOin/sXCAPdl4/I3m3IWlpviqN1G9ZJSaPp61GzeG2GKxgV1
	sZM5O2lv0bL80khNmCJ25/CloXV3R7DS28E2oEdxh3nXX6u/l3shWIzb5ofoGXNH6tg5a
X-Gm-Gg: AeBDiet/vIGIbh9M/lqB9VQts3RDrt/uHqIF52sRqrF6CLcwSLjSaFn4TGPP4Fsvwcx
	kkXtkoX0x+uv+PoYr9/3JuXa7wWJAC9Yku+kMfXTQ3Qd4PEdS6KIF5w0NQ6/5bEvc8oI2JxXBII
	er+kSwue4flGUETN0TYFuzVBlyUVST3UweuG5LtxhgPM+rsxHtzPkfg7GMoTn38aaz9ZRM3fHEY
	okLJbVZFEG1xlXZNrRxMlB13+G6mibiOvcF5IpV3wBXTw5Be7wGvHs79YMD6F/a1ateWzV5WsUt
	LEyh4QYQh2lyNN7NykEWQBg8yWM16XLP52BKmRmyv+LrzMbO8wgqlsOTo671/Gvlhsfxk/Qdfod
	mZJVNk6Vb9mGQzu702eaeRAHz2Yufd4mND8voiPgnYcU=
X-Received: by 2002:a05:6a00:ab8c:b0:829:800b:9fe with SMTP id d2e1a72fcca58-82f8c99a9a3mr16205980b3a.39.1776724040104;
        Mon, 20 Apr 2026 15:27:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:ab8c:b0:829:800b:9fe with SMTP id d2e1a72fcca58-82f8c99a9a3mr16205962b3a.39.1776724039643;
        Mon, 20 Apr 2026 15:27:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981c07sm14029049b3a.1.2026.04.20.15.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:27:19 -0700 (PDT)
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
Subject: [PATCH 08/13] drm/msm/a6xx: Add yield & flush helper
Date: Mon, 20 Apr 2026 15:25:30 -0700
Message-ID: <20260420222621.417276-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIyMCBTYWx0ZWRfXxQFdRkc59sNK
 ra7oFuiV5ARb2XqTEBwmNAzA18dWvrkfRddMwc1aHtX6mlD9xfqMFbfP9ep36ndHHfnFjejdPDV
 RXLh8wz/7Hn3qJwXcuYTfq06jAKEy61DaaBsnZftlp49TmFjpqzC98aVkp8NfVOSMB+1c3fTj6E
 PHcZ+CRRnLHUjqx4HieDar6kMg5FSOOfo6rEhvsQJvse913ZUwEbypMecnFFfwzXBkFQ25l5E42
 fmtCTVGy70AIdAL/vLxlpyl263KgmCfHKcmbFmOS3UdjkPfS4ZYdcl5nkenmBsLvFyeCVaBrI6e
 V1pCxIjqqi3TY5jlBOZHiNFAwxSXoYk61bnNjCN7a/e+3eSZiliOlAaLDitVPpEcvcODVMvgP3D
 GCWiYlS0C8+D/LVmZZhfHxJ/6rskO5jOYKkXhjbY4pgzO5vGWUDDUr1si1GZTUxojecJimu4K8x
 5jiYSpqaNa77TVtYvgw==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e6a849 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=7a4_7rcHm0II5uOVc2AA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: QKKklzQCRsptiD_u6GGInut8C52XisLp
X-Proofpoint-GUID: QKKklzQCRsptiD_u6GGInut8C52XisLp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200220
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103848-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[14];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A9C66434AF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It's a common pattern, needing to insert a yield packet before flushing
the rb.  And we'll need this once again for configuring perfcntr SEL
regs.  So add a helper.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 55 +++++++++++++--------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 10 +----
 3 files changed, 28 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 71f54ab5425d..415902f6e5d7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -189,6 +189,30 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 }
 
+void
+a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	/* If preemption is enabled */
+	if (gpu->nr_rings > 1) {
+		/* Yield the floor on command completion */
+		OUT_PKT7(ring, CP_CONTEXT_SWITCH_YIELD, 4);
+
+		/*
+		 * If dword[2:1] are non zero, they specify an address for
+		 * the CP to write the value of dword[3] to on preemption
+		 * complete. Write 0 to skip the write
+		 */
+		OUT_RING(ring, 0x00);
+		OUT_RING(ring, 0x00);
+		/* Data value - not used if the address above is 0 */
+		OUT_RING(ring, 0x01);
+		/* generate interrupt on preemption completion */
+		OUT_RING(ring, 0x00);
+	}
+
+	a6xx_flush(gpu, ring);
+}
+
 static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
 		u64 iova)
 {
@@ -597,28 +621,9 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_PKT7(ring, CP_SET_MARKER, 1);
 	OUT_RING(ring, 0x100); /* IFPC enable */
 
-	/* If preemption is enabled */
-	if (gpu->nr_rings > 1) {
-		/* Yield the floor on command completion */
-		OUT_PKT7(ring, CP_CONTEXT_SWITCH_YIELD, 4);
-
-		/*
-		 * If dword[2:1] are non zero, they specify an address for
-		 * the CP to write the value of dword[3] to on preemption
-		 * complete. Write 0 to skip the write
-		 */
-		OUT_RING(ring, 0x00);
-		OUT_RING(ring, 0x00);
-		/* Data value - not used if the address above is 0 */
-		OUT_RING(ring, 0x01);
-		/* generate interrupt on preemption completion */
-		OUT_RING(ring, 0x00);
-	}
-
-
 	trace_msm_gpu_submit_flush(submit, adreno_gpu->funcs->get_timestamp(gpu));
 
-	a6xx_flush(gpu, ring);
+	a6xx_flush_yield(gpu, ring);
 
 	/* Check to see if we need to start preemption */
 	if (adreno_is_a8xx(adreno_gpu))
@@ -958,15 +963,7 @@ static int a7xx_preempt_start(struct msm_gpu *gpu)
 
 	a6xx_emit_set_pseudo_reg(ring, a6xx_gpu, NULL);
 
-	/* Yield the floor on command completion */
-	OUT_PKT7(ring, CP_CONTEXT_SWITCH_YIELD, 4);
-	OUT_RING(ring, 0x00);
-	OUT_RING(ring, 0x00);
-	OUT_RING(ring, 0x00);
-	/* Generate interrupt on preemption completion */
-	OUT_RING(ring, 0x00);
-
-	a6xx_flush(gpu, ring);
+	a6xx_flush_yield(gpu, ring);
 
 	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index eb431e5e00b1..99c3e55f5ca8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -317,6 +317,7 @@ void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_
 void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert);
 int a6xx_fenced_write(struct a6xx_gpu *gpu, u32 offset, u64 value, u32 mask, bool is_64b);
 void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
 void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index e022c9a162a4..124d315b2469 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -488,15 +488,7 @@ static int a8xx_preempt_start(struct msm_gpu *gpu)
 
 	a6xx_emit_set_pseudo_reg(ring, a6xx_gpu, NULL);
 
-	/* Yield the floor on command completion */
-	OUT_PKT7(ring, CP_CONTEXT_SWITCH_YIELD, 4);
-	OUT_RING(ring, 0x00);
-	OUT_RING(ring, 0x00);
-	OUT_RING(ring, 0x00);
-	/* Generate interrupt on preemption completion */
-	OUT_RING(ring, 0x00);
-
-	a6xx_flush(gpu, ring);
+	a6xx_flush_yield(gpu, ring);
 
 	return a8xx_idle(gpu, ring) ? 0 : -EINVAL;
 }
-- 
2.53.0


