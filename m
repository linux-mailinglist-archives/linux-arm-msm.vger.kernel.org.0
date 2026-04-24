Return-Path: <linux-arm-msm+bounces-104486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHImHf+I62lBNwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:15:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD76460A52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D1D5301258B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 15:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2C03E2776;
	Fri, 24 Apr 2026 15:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmnA3vt5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EpoNe5a+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C282D0C98
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777043549; cv=none; b=GqaNimcJUlpYxwN5Fn/w5oIwD/HJgU7iDN3T3JqUkre2AJ1ek0dUp0b7Po6XhDUtAO2l5fUrcjYHajO2IubirElE/iYp4PcM9VErYfScADhFW0iQfdueX0WwjlxZvnlfNQCK8DaBEdekBJDLzK4cxpBp6xaqK8BfZA9nnKFNViQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777043549; c=relaxed/simple;
	bh=gJZPWBYc0+/WOvdak/85qdP6aNnAQ7WPayOG0QcvzXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5P/wI9dRAK2PK+US8qMIVGYm5cUdamRXaluDehZtEUDbdXZlP6QgNTLFy+1gsV6I8grEvHecJxz3A08lOCI9k1FW7XNHJCHf8MJCsER+LaKN95aiCExfsiXt/lWmAG/jUrSutnhOBk0JAarSL2CALMrIgUKNYfnm2wsAgNvqCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmnA3vt5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EpoNe5a+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O96Wmu1533422
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PSZvuLL+r9s
	fCfccBd2ob0WPVN+nCe6j9d//PM4k63k=; b=CmnA3vt55xpV8+HzhjvomPbH4/a
	bED7Ez48WbrzrbFSeQs0MkheZNscjbCezTyq/S8srV0bLo/m3YiQXAp7IOxgODgW
	aw/Ib7KHoZvNDXUWkHVhFf2TEaS0HJfTFqdlsKNPs6HLTZeP7ScJGtToMpi87eBK
	/56sY0HXoCwMo1V1RS7Ct78bZAvou0mHxNOJ852BFJYrLz9mt2F+zNwGDFGZpCFu
	rIm7CpdRDToUdOJ6olyUIp2WmPw1f5xn11qtzRzL4etOW6ulujiLeko6avWXk0a5
	Ub87ZLPrFccUjbQXPsQ3DeurgnptoBsX256fhz1ZncKbX7d82ax4w8y7TxQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr26mpgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fbceb0181so4356568b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777043545; x=1777648345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSZvuLL+r9sfCfccBd2ob0WPVN+nCe6j9d//PM4k63k=;
        b=EpoNe5a+r90YT11kYHOoYUsu2LweFnoGyrxpQ0X7UNjUzJ3VTlUJPmBmU3Cu0YRs6B
         01mBBKD8tzvfrTD1sM26qga2YL3n1BloGg48RpZXALRGtGEMYZ5Q0QV7hwXX5GbmN/t2
         gjyU4rM4y9Y4oYrrMYek5cx1/4mFSh4CzqBuH7tPh3HzcKyJft97V1KbjJDOfMbcpU+s
         vUKmrdeOgLZFHKJCWzclIhYfWmfm1YVo6wMZVdjNnH1410EsK7Gty9aBqD94DHnbWHu9
         Z3Z6Yib6yx9d0noKrZNzNyj9P0nYAg/ioSs231smtIvJpUkE1acrZS1KoV1q7CDafNP0
         yBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777043545; x=1777648345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PSZvuLL+r9sfCfccBd2ob0WPVN+nCe6j9d//PM4k63k=;
        b=OAbaScHHk6rbsk9V8eM4b8jVAoJpCSAqjfuxW3hF2bCJu/zTK5ZN2rKPKEnDLmnV+W
         3Lj73uCzY/qSCMJLk7xcMLIrleXwnavB38aUKkW9EDOj512mBtGjdqDOjRqRARmYVu0H
         h2jDoDZROJvvmvih1eLKuktELsJW93lZYm4WY7Wj75NXeulRTIP+6SMehv/D/urMkaf7
         vo+bGvyUnNo7zXhc7vj/826xH+wCGdnnQpZ7GB24ohEYuTf2CYicvhxv+yavfxuLb/S1
         9I8xoYmDrKjC92X5lDaGloj2FvJMKXnA5iCpadLAohRMPy+yabVFKHhOb6oKKI8ZC444
         YH0w==
X-Gm-Message-State: AOJu0Yz5bHpSdtpAGiCkxHJW47UhHrmFEwwqUmfNxLUXh/UG7mnYZfPA
	hjGf7Nf5d3UJv9GHGiRyqWYqDvD3OgLUpYJURY1STTXU7BOZYMiC4kESxbK8u9llxN6m/Z4rrQb
	tj9xm1yjZvQB6mtnFjWZt9f9THO/RDRj5z1Chy5ZqGzWnO8xDcXyNLmVnDdNTKf4Hvf63
X-Gm-Gg: AeBDiesCz8cuMDsv9KWw/GcdkfIlpZyhwAHhSvFqrpi3xxw5WWKVa4jmysgGZTR1kUS
	FpQVanWcFA6n99+elfzmB8QbYvq8we6QVoY8u/HaxaHYusc9/u44bB/FI4PgTLVCptfwaiEicTp
	Cy9R9P0/0+Jpu1jqlylgmDs52vfP+jOJ5Yach8zLcbpF5J5sBolztHXnXiueX6pS2vlD7zXbrYw
	BQ2JbupI771uuXHQtNP8A2bCltAdZsTCHfXIyKfbqTcTEQLj+omyTEXN1uriK8uMxFeJQgsAwSR
	F6SwCbbMsaFKWTQ1+BfLLmI0VuNi1cEEtdSRxeEuUxPfD7njNzCmr6x5OahId2Sw8JGOv6sSCFh
	c6S7SmDDfamz8bPaQ0o/8PADqMKdSJwx7Gw33cSSLYH4=
X-Received: by 2002:a05:6a00:bc90:b0:82f:1e5d:db62 with SMTP id d2e1a72fcca58-82f8c885af2mr34624379b3a.12.1777043545044;
        Fri, 24 Apr 2026 08:12:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:bc90:b0:82f:1e5d:db62 with SMTP id d2e1a72fcca58-82f8c885af2mr34624325b3a.12.1777043544374;
        Fri, 24 Apr 2026 08:12:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f97eb5ce8sm21767932b3a.61.2026.04.24.08.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:12:23 -0700 (PDT)
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
Subject: [PATCH v2 15/16] drm/msm/a6xx: Append SEL regs to dyn pwrup reglist
Date: Fri, 24 Apr 2026 08:10:50 -0700
Message-ID: <20260424151140.104093-16-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
References: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZCplznCOecojmg0Fh8jhQjpzOLhk3ktq
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=69eb885a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=pU0-7o-2YXwa03qK1oEA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: ZCplznCOecojmg0Fh8jhQjpzOLhk3ktq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE0NyBTYWx0ZWRfXwzqwitf6PnWn
 TzMveBqvhKa63D1qBPR7RW1nXpKRuXAco4BXVqIxCupK5Pzo1limzUdxHQk5jIJXFRGC+wEhnLg
 9WCDv63dtO57Y6lcySQYHc60P+bttmvqNf4TmzJEdCLAzBf78b3G2HDON0VYiEUmU6VJjV3+bVT
 yduLr96syjmKAVn75UPRX52900cC04wSprxOnLt56krqlIr97XR+yhrMhpU0jZFKKEjhNY0NY9M
 3XGb3TL0nHG9OELr91VxyS+T+7e22RClJj2N7Rs1f4cc1yqKCi1BN7gKs7ERVHdD1G+jpDHGLxx
 oaiBdSZV7kWkcV0Qej97Lwh3RXgjkBh5OrK8pNNA+zMnJEM5rcg2N7u1hjqK6wAe0o4sj1Gwhx0
 YQAvgLvw9ObzE1dX5OL/N3XYv9/uUJJR7LKgLuZ2bKBiHtaGW2G+W+y9eFi3Ak6snrsMePX63jf
 ugKoshlpUl/7J5YvBcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240147
X-Rspamd-Queue-Id: 6AD76460A52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-104486-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This is needed so that SEL reg values are restored on exit from IFPC.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 70 ++++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 11 ++++-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c |  1 +
 3 files changed, 75 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 04a6335ac5f4..c3305d18b87c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -946,6 +946,7 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 			  A7XX_CP_APERTURE_CNTL_HOST_PIPE(PIPE_NONE));
 	}
 	lock->dynamic_list_len = dyn_pwrup_reglist_count;
+	a6xx_gpu->dynamic_sel_reglist_offset = dyn_pwrup_reglist_count;
 }
 
 static int a7xx_preempt_start(struct msm_gpu *gpu)
@@ -2535,11 +2536,54 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return progress;
 }
 
+static void
+perfcntr_select(struct msm_ringbuffer *ring, enum adreno_pipe pipe,
+		uint32_t regidx, uint32_t *countables, uint32_t nr,
+		uint32_t **reglist)
+{
+	OUT_PKT4(ring, regidx, nr);
+	for (unsigned i = 0; i < nr; i++)
+		OUT_RING(ring, countables[i]);
+
+	if (!*reglist)
+		return;
+
+	for (unsigned i = 0; i < nr; i++) {
+		/*
+		 * Bitfield is in same position on a7xx, but only 2 bits..
+		 * which is sufficient for NONE/BR/BV:
+		 */
+		*(*reglist)++ = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe);
+		*(*reglist)++ = regidx + i;
+		*(*reglist)++ = countables[i];
+	}
+}
+
 static void
 a6xx_perfcntr_configure(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 			const struct msm_perfcntr_stream *stream)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	enum adreno_pipe pipe = PIPE_NONE;
+	uint32_t *reglist = NULL;
+	uint32_t *reglist_sel_start;
+
+	if (to_adreno_gpu(gpu)->info->family >= ADRENO_7XX_GEN1) {
+		WARN_ON(!a6xx_gpu->pwrup_reglist_emitted);
+
+		struct cpu_gpu_lock *lock = a6xx_gpu->pwrup_reglist_ptr;
+		int off = (2 * lock->ifpc_list_len) +
+			  (2 * lock->preemption_list_len) +
+			  (3 * a6xx_gpu->dynamic_sel_reglist_offset);
+
+		reglist = (uint32_t *)&lock->regs[0];
+		reglist += off;
+		reglist_sel_start = reglist;
+
+		/* Clear any previously configured SEL reg entries: */
+		WRITE_ONCE(lock->dynamic_list_len, a6xx_gpu->dynamic_sel_reglist_offset);
+	}
 
 	for (unsigned i = 0; i < stream->nr_groups; i++) {
 		unsigned group_idx = msm_perfcntr_group_idx(stream, i);
@@ -2567,17 +2611,15 @@ a6xx_perfcntr_configure(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 		const struct msm_perfcntr_counter *counter = &group->counters[base];
 		unsigned nr = group_state->allocated_counters;
-		OUT_PKT4(ring, counter->select_reg, nr);
-		for (unsigned c = 0; c < nr; c++)
-			OUT_RING(ring, group_state->countables[c]);
+		perfcntr_select(ring, pipe, counter->select_reg,
+				group_state->countables, nr, &reglist);
 
 		for (unsigned s = 0; i < ARRAY_SIZE(counter->slice_select_regs); s++) {
 			if (!counter->slice_select_regs[s])
 				break;
 
-			OUT_PKT4(ring, counter->slice_select_regs[s], nr);
-			for (unsigned c = 0; c < nr; c++)
-				OUT_RING(ring, group_state->countables[c]);
+			perfcntr_select(ring, pipe, counter->slice_select_regs[s],
+					group_state->countables, nr, &reglist);
 		}
 	}
 
@@ -2591,6 +2633,22 @@ a6xx_perfcntr_configure(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 	OUT_RING(ring, upper_32_bits(rbmemptr(ring, perfcntr_fence)));
 	OUT_RING(ring, stream->sel_fence);
 
+	/*
+	 * Update the pwrup reglist size before flushing.  Kgsl does a shared-
+	 * memory spinlock dance with SQE to avoid racing with IFPC exit.  But
+	 * we can skip that since the ringbuffer programming will be executed
+	 * by SQE after dynamic reglist size is updated.  So even if we lose
+	 * the race, the register programming in the rb will overwrite/correct
+	 * the SEL regs restored by SQE on IFPC exit, before sampling begins.
+	 */
+	if (reglist) {
+		struct cpu_gpu_lock *lock = a6xx_gpu->pwrup_reglist_ptr;
+		unsigned nr_regs = (reglist_sel_start - reglist) / 3;
+
+		/* Update dynamic reglist len to include new SEL reg programming: */
+		WRITE_ONCE(lock->dynamic_list_len, a6xx_gpu->dynamic_sel_reglist_offset + nr_regs);
+	}
+
 	a6xx_flush_yield(gpu, ring);
 
 	/* Check to see if we need to start preemption */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 3491a24a9320..f3cc9478b079 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -21,17 +21,19 @@ struct cpu_gpu_lock {
 	uint32_t cpu_req;
 	uint32_t turn;
 	union {
+		/* a6xx: */
 		struct {
 			uint16_t list_length;
 			uint16_t list_offset;
 		};
+		/* a7xx+: */
 		struct {
 			uint8_t ifpc_list_len;
 			uint8_t preemption_list_len;
 			uint16_t dynamic_list_len;
 		};
 	};
-	uint64_t regs[62];
+	uint64_t regs[];
 };
 
 /**
@@ -100,6 +102,13 @@ struct a6xx_gpu {
 	uint64_t pwrup_reglist_iova;
 	bool pwrup_reglist_emitted;
 
+	/*
+	 * Offset of start of SEL regs appended to pwrup_reglist.  This
+	 * is equal to lock->dynamic_list_len if no SEL regs are appended
+	 * to the end of the dynamic reglist.
+	 */
+	uint16_t dynamic_sel_reglist_offset;
+
 	bool has_whereami;
 
 	void __iomem *llc_mmio;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 6c040f718176..2ce7c6ac4521 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -468,6 +468,7 @@ static void a8xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 	}
 
 	lock->dynamic_list_len = dyn_pwrup_reglist_count;
+	a6xx_gpu->dynamic_sel_reglist_offset = dyn_pwrup_reglist_count;
 
 done:
 	a8xx_aperture_clear(gpu);
-- 
2.53.0


