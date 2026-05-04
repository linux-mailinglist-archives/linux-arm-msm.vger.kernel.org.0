Return-Path: <linux-arm-msm+bounces-105799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP5jFj7v+GmU3QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:10:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E864C300C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1136306A5CA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 19:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E39853EFD12;
	Mon,  4 May 2026 19:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cf2cM+FH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UWgjTxIf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7003EF649
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 19:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921718; cv=none; b=PE0x0IlzjtDHn6Kijmhxglk/+fR3w/k/BDCChrEt6gVvh4lEmlgb13GN9ajR4/vtjWJE5RryN2pV3IO5rxkhCSHxEQ5iGMvp9tK7tP1fpXo93cogMzY1cuP77ykCrz7ffySgLdIQ9lC21s2d9AYirMZWXUW4GKdJgcOq5PROcO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921718; c=relaxed/simple;
	bh=nf/AzQJzAwD5Wdqnd6VCCPR5ecVd2qygEvoiPvLJ7Vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=crrXF+HN3XeW8u5oE96f4BE1ChPnmT8d25w5FOReya4sfJCM2MuCauEYQdDuJF8FWE/0UJzXDhjCDfnCycw3tJxM6pgs7pCW+Q+6ulf4AgFU+Hu2wEEiWOaozhmBG4UTGM5GRz03dc4hpijnLoeGSm2wNCZkUI8xJivpLTRo1Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cf2cM+FH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UWgjTxIf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644IB2FZ1150992
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 19:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZFtTLmOQAzj
	qHoC3Fafdx5s7yem/Cv9ClA1WpeTUDMw=; b=cf2cM+FH6ACHDWi0ShgqF+Lpf09
	/By6SaAMHztFm2ApbaYtnaM15NdXB/euzLVNLIsKq2uH5WTxZeUrUyf4zipqYHW0
	0x7wHXlyzvH9NWr3LuR6siIqrouAxjsLSCgkGuyOKRcBiLF2WuZfi3Ih+YgQQBm4
	cD7UXceANKX9CQrXQBNlKb0+PA26eB0Va1U8nbQekbE4YmW39mXnpWTyzuPx8Fc3
	4ZyC0iOLR0mzDLAyMSuG41W1kPCwQs6MPh0aDkQiy4nE5FkTxpysu5WrSKTb5w/H
	6THLiqNr9OGWLUrZrBH0wuWH5pW70GJ6v3Vrr2BqgzYLfOcZ52Y+FRXrYfw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscy9w7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 19:08:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c81086bf930so617193a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 12:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777921715; x=1778526515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFtTLmOQAzjqHoC3Fafdx5s7yem/Cv9ClA1WpeTUDMw=;
        b=UWgjTxIfI4lpjAUTsW+H2prg1g3+0ZkasMwxy9s6836UUKvXpXh1YiDXTnitsBXP3K
         rZxZ68yuxe+v4qyZB0ot5lDI35aK0WKYY7H+D1aXxdHkbuIxRB55Eq+MdNdVQeDAGXFM
         KrJC+lSUmwmL/BF/ySP+ITIHKgbLJxjTwBQ0bgpP/oy8KoLq5YSx1D2qeMIIevRsPJK8
         KGdn0Hc/swQj6ycp+1CUuA2o0gvnl1oIT+LvjOzFE8LhHPzQyv/xulCOiADok8nYcfOU
         Ik+d8f+2sGZUy0iSvm1KtStBBE8UzFs3sM5hSjyyCYh05jMIa9JT35mlXXK7G/UH99UL
         sgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777921715; x=1778526515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZFtTLmOQAzjqHoC3Fafdx5s7yem/Cv9ClA1WpeTUDMw=;
        b=W5XGUadIpdvJao08zC6QV8kGbuQ5INAFYEBUGO3C5xtfRGHJzPAidvU5JRblQT9YLW
         XK0ylzJblfL9P06gbIemV/AoEJ4SR0Grsf5eKkbUUo2Qg2NLWqCQC+Y1CUisfJDnhfUd
         WKj3NWPwlXR9YjFrrtsXk/9RlZs6NzTITbX5YfWWKzyZQ71lE9wL+g2r1Jq3/vm+9QhC
         1VEp9ALT8bNkguWMr9/2+PSEhRUACCrwUO7fhOW0nAbZory1BNI64n9xxE/g3hxTRBQv
         pQAF9Ke29KUTzNw/D2fJ4TxyrOCN51nKq1t6SZz6VYa+5mFM5+SCYWci2eMYBCdb0lwF
         3HRg==
X-Gm-Message-State: AOJu0Yza2rhB1Zqfv8iTwc/AIoW3rP4MLtoalThILxlzwSOfqfY8y9kA
	NE3z09qRpxmiU64UjVSqAJCnnahfjDRXQdllmmgrM9Tqk2XXvtkqiwNFbl/PKQCL+BEfYoeSGZx
	va5tB+5g3w6WTvBsBTgWSVQa+HXYcUg8+8DRxbwhM4GTfxjmsyKzpo2A/QItxdzhmCsUz
X-Gm-Gg: AeBDievv8YTaulbjC5G4gHTvN9s1L63daQy476DHvnRD5Ji/M+82Kj6+DaQdhetsDoz
	VBd/TLdHQkZ5RuWc3EALSNPmWexewFjB6VUDIRrsZEEGvOsW4VhCOysdUDjt+1yLKzD1U/XYYK7
	84JRLBKCjcvVhRTn3FU4uhJGwDZxnwSG5mmuF2J26ocSm8EVFUe1vTxjXrMvF6rn48hckeQ9QoH
	HapJuOrgrhDYpZyXTWFsiQb6GK1ffs0qQ4/wxD5pHcHw5+1hRlA5GmYsq9WwXs7emjQbkSN/Clc
	+PRwilMChCWGa2HbrWly1cL71+6OBVcfrVFTkBZM+FDx5DLw6X3gDUozScROe8qFflzmPfDTqOu
	1HvQi541SChCCXkuKBieRradVI2o1eBWjDx/6YAxKgjI=
X-Received: by 2002:a05:6a20:4305:b0:39b:ca34:96e3 with SMTP id adf61e73a8af0-3a9f77bd7a2mr567272637.37.1777921715027;
        Mon, 04 May 2026 12:08:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:4305:b0:39b:ca34:96e3 with SMTP id adf61e73a8af0-3a9f77bd7a2mr567242637.37.1777921714478;
        Mon, 04 May 2026 12:08:34 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbb05798sm10380209a12.0.2026.05.04.12.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:08:34 -0700 (PDT)
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
Subject: [PATCH v3 08/16] drm/msm/a6xx: Add yield & flush helper
Date: Mon,  4 May 2026 12:06:51 -0700
Message-ID: <20260504190751.61052-9-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3NSBTYWx0ZWRfXzrNhTdKhaAaR
 93qtionq3xvG2+2iRLBcDL1xPxtomt0uCkWwzLHUqo9Whw5e8JHAJbQ4/fhZ02audTLQUzFVrwp
 uZHCBsGVsHUWnCxwu8nDHFeyq9PRL0NC6rAv4LmxYtSDuZBRw41DNHKnQSiLO586mXBRam0zI2e
 bb75cy6U0wnBPnkefyAHqKgPwkGkDF4CqTsMxRqAz1n++mHDD1GsQPSmBVe+URqfzj1QS51Skkt
 m+pjUTVuBifzD2V1zO4Zy/Q68eGG+kmIOrrFrl2ZaGLhccm9w+yxziWa79LPscVXmrGQD+OJ9YE
 cXO4wPriLFMIiDjCUsO7526DN27BYn/HAaHExyW2PdBZfHKgLCMnFq/muG6bwnpGiQdKNwtipTe
 TcIfhf5S0P1s5DMSjZEnWSlneqKbNtuFRWKVkCCMykaVn9dp8OoKXNmcgiL8maIW/6HahEF9E0L
 tSs7+jUgfzpsapVaosw==
X-Proofpoint-ORIG-GUID: QDBB1__NaGuXf_T3K9L8gamyE-W3dd0S
X-Proofpoint-GUID: QDBB1__NaGuXf_T3K9L8gamyE-W3dd0S
X-Authority-Analysis: v=2.4 cv=C47ZDwP+ c=1 sm=1 tr=0 ts=69f8eeb3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=7a4_7rcHm0II5uOVc2AA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040175
X-Rspamd-Queue-Id: E1E864C300C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-105799-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
2.54.0


