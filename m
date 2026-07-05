Return-Path: <linux-arm-msm+bounces-116576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3lP6JFWtSmrLFwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:15:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 022E970AEEB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:15:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FH4gihtn;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116576-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116576-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39E58302BCF1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 19:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ACD53A7595;
	Sun,  5 Jul 2026 19:14:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C7C3A0B24
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 19:14:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278880; cv=none; b=BLzSNYBMxtQPua8WhH4uzGpdr6jq0ulu8RA/xn+6vhBFwsgQzqdb62spGcQfpmIgMItf2a18UoFyTdcYL5WRF10wpudinFle7CxhjDnLDV5rO70yDMzondt16ioNoMGIUwNOaTcgIEJHa9WVM+HnPaABiVCvxuDb25n5xc785GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278880; c=relaxed/simple;
	bh=QVn4kOxQbknn82h4eX+EDDWOieltJQF858rkTdECiao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gZsYClCv7arNm1hjwhLF4avyaxAb+4TCdC4aDPpqaJRo7gPa4LQ1iqQHwiDTVfD9g4YY4s7SknYh0BB2YbI1g4c+6MEYVSQk8DnAMJdez+lNNAG8wni9a4KHQ7DlI2A+GHk79G5uAKrv1xyAinOEXuYeCVHYKVRaqZkg8dyNSJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FH4gihtn; arc=none smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-475881b9a4bso1930584f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 12:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278875; x=1783883675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cMcg9y67rwunE2DKGeLYI29d8HcuwR2xGbFAhvqNdDI=;
        b=FH4gihtnMWNoy5Jf2ezH4RDsUGkkCYknCDBSskUj7I9mv9ih2gzxgwREBSHShxr0IB
         ugR8rpk/ZhVZuJ431nj2eYACsdSFaC3ZfI6+FOkFzkHkLmpwgK8LkK7dccYzWeLmMFum
         WA9IVBmtE2dXCyQhCqvEajZP/qX5g4cTztAEcG5TLfHSAYiNRfRQDcVcYJ3TGQSqrNlK
         KnaIfGVC3E4Wmqwdimwq5XfEf9xQo8vpG4yixTjrtmWj7AiAda2CwVDKGMesKb4bNq3+
         UtMZ43yYR25Gicq3JPPbMGnz0bAZ8AVt54FaaJ//OjPDrVTY2yeE1HNkX8yGreLa4kiR
         TZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278875; x=1783883675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMcg9y67rwunE2DKGeLYI29d8HcuwR2xGbFAhvqNdDI=;
        b=BMu7okCiuA+agdC4q2pZXtWJVvh8YuCtOtgJhwyOd8bAJW8MKAsneukOsBl6fs3uJN
         NA0KkPXZOphJny3dSD08oZxyOGP7aUf+eRYdojtP2kKHbWh7q4bOmxC6LCVaY7dvBgg5
         LQ86vqi8eP/DhnE3RGSwT3CXZcE3vixc9J1hK0leF4e2U4PqnxmFzF84Sk+kN0PQGv9K
         L6p5KnemMZsPDl0gHUFSmBS3UesbXFnOpVyV9ub5p5r3jNBFa8d4AKYtBrAz8wGLlLAu
         1RRP6/7diDQVBq/S6c11iAMdxY+MJG8NlFZx/0vllVWmnkoyPhROz4UaPfHSdnOPESHu
         5ujA==
X-Forwarded-Encrypted: i=1; AHgh+RoZdCW06Pafjh8hnpfgRRWpOIz7iOM28oISHJ4KxdXuRNYqjm0JX7pSzrQaDcaGI2JTP1catHd/XDcgK/ZB@vger.kernel.org
X-Gm-Message-State: AOJu0Yynxk48pyv1a8x/ha1B71ASdY/y9PP5GasBAdx5H7nIrYoJ9BXx
	ttkuMw/+i9xs/Jtxf9fu5ruCw9xnl8sOn55KCIzF8lJPGedS1xwHSyU=
X-Gm-Gg: AfdE7cmHWNX9NFfIIwTzpLcHaYw4nd1xn8rvuJXUN1Jgx7qbn/XBPZDDU4HAAlL8qAw
	kOapiXecmQhf0uTU0suM7T0qFydghkxFK+cONG0Rvb6IsKgcEmzH4DRoKzljWTspg9poBBQM6ZY
	1W8FHI+25cIl8DUZ2UxPui+Rlm0YDAHQ5BccspRy83v362k7p9mrb2yTpqCFHWLCD+qsm9nI/As
	FBP1ESZsdJfV2AiTE2yJCnN39rVHY5AtL5fAo8nOnSVVvPSaVMIGMhFmqVWWNQczM4AgdNtgyLr
	ofMCH2XcVrmoBw8hsSXoitVxFn5HZPs7ILFJ7jcN9cUS8CPGplS9RDHAeA5s42mR9G4dTXJwGq6
	W9Ru6wVFXEh20d1KDjZcLs3QdI3+F8bmLs6iVv7lUo0cV1ogAxqc7Lh0oQUWbuIrUSWZ5eKq4ng
	dw/xA7e6SV32WIjBk=
X-Received: by 2002:adf:e014:0:10b0:460:67e0:563e with SMTP id ffacd0b85a97d-47aad54f110mr5661523f8f.35.1783278875081;
        Sun, 05 Jul 2026 12:14:35 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:34 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:45 +0200
Subject: [PATCH RFC 11/13] drm/msm: Add LPAC submitqueue
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-11-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=12622;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=QVn4kOxQbknn82h4eX+EDDWOieltJQF858rkTdECiao=;
 b=qgqiL6ZgqTya10uwOa+sdOJJc60i/UBr7933iu9z7wQw2WuosSibD6SgaGUPuNFU6OvwcK7Gr
 V9DFTssdykwBSfoa9LDlO7j5SA0jc2oy1m/9+kJ8wvFv/CEhL6RdkSP
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-116576-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:anna.maniscalco2000@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:annamaniscalco2000@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[annamaniscalco2000@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[annamaniscalco2000@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 022E970AEEB

Add UAPI and infostructure to support sending submission to the LPAC
ring.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 86 ++++++++++++++++++++++-------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c  |  6 ++-
 drivers/gpu/drm/msm/msm_gpu.c         |  8 ++--
 drivers/gpu/drm/msm/msm_gpu.h         |  4 +-
 drivers/gpu/drm/msm/msm_submitqueue.c | 11 ++++-
 include/uapi/drm/msm_drm.h            |  2 +
 7 files changed, 78 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9f69aada9b7b..4417a9d04d7c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -204,8 +204,10 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 void
 a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
+	bool is_lpac = ring == gpu->lpac_rb;
+
 	/* If preemption is enabled */
-	if (gpu->nr_rings > 1) {
+	if (gpu->nr_rings > 1 && !is_lpac) {
 		/* Yield the floor on command completion */
 		OUT_PKT7(ring, CP_CONTEXT_SWITCH_YIELD, 4);
 
@@ -244,6 +246,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	struct drm_gpuvm *vm = msm_context_vm(submit->dev, ctx);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	phys_addr_t ttbr;
+	bool is_lpac = ring == a6xx_gpu->base.base.lpac_rb;
 	u32 asid;
 	u64 memptr = rbmemptr(ring, ttbr0);
 
@@ -261,25 +264,27 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
 		OUT_RING(ring, submit->seqno - 1);
 
-		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
+		if (!is_lpac) {
+			OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+			OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
 
-		/* Reset state used to synchronize BR and BV */
-		OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);
-		OUT_RING(ring,
-			 CP_RESET_CONTEXT_STATE_0_CLEAR_ON_CHIP_TS |
-			 CP_RESET_CONTEXT_STATE_0_CLEAR_RESOURCE_TABLE |
-			 CP_RESET_CONTEXT_STATE_0_CLEAR_BV_BR_COUNTER |
-			 CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);
+			/* Reset state used to synchronize BR and BV */
+			OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);
+			OUT_RING(ring,
+				 CP_RESET_CONTEXT_STATE_0_CLEAR_ON_CHIP_TS |
+				 CP_RESET_CONTEXT_STATE_0_CLEAR_RESOURCE_TABLE |
+				 CP_RESET_CONTEXT_STATE_0_CLEAR_BV_BR_COUNTER |
+				 CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);
 
-		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
+			OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+			OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
 
-		OUT_PKT7(ring, CP_EVENT_WRITE, 1);
-		OUT_RING(ring, LRZ_FLUSH_INVALIDATE);
+			OUT_PKT7(ring, CP_EVENT_WRITE, 1);
+			OUT_RING(ring, LRZ_FLUSH_INVALIDATE);
 
-		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
+			OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+			OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
+		}
 	}
 
 	if (!sysprof) {
@@ -493,7 +498,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct msm_ringbuffer *ring = submit->ring;
-	u32 rbbm_perfctr_cp0, cp_always_on_context;
+	u32 rbbm_perfctr_cp0, cp_always_on_context,
+	    cp_always_on_counter;
+	bool is_lpac = ring == gpu->lpac_rb;
+	u64 timestamp_iova;
 	unsigned int i, ibs = 0;
 
 	adreno_check_and_reenable_stall(adreno_gpu);
@@ -511,19 +519,24 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	 * If preemption is enabled, then set the pseudo register for the save
 	 * sequence
 	 */
-	if (gpu->nr_rings > 1)
+	if (gpu->nr_rings > 1 && !is_lpac)
 		a6xx_emit_set_pseudo_reg(ring, a6xx_gpu, submit->queue);
 
 	if (adreno_is_a8xx(adreno_gpu)) {
 		rbbm_perfctr_cp0 = REG_A8XX_RBBM_PERFCTR_CP(0);
 		cp_always_on_context = REG_A8XX_CP_ALWAYS_ON_CONTEXT;
+		cp_always_on_counter = REG_A8XX_CP_ALWAYS_ON_COUNTER;
 	} else {
 		rbbm_perfctr_cp0 = REG_A7XX_RBBM_PERFCTR_CP(0);
 		cp_always_on_context = REG_A6XX_CP_ALWAYS_ON_CONTEXT;
+		cp_always_on_counter = REG_A6XX_CP_ALWAYS_ON_COUNTER;
 	}
 
 	get_stats_counter(ring, rbbm_perfctr_cp0, rbmemptr_stats(ring, index, cpcycles_start));
-	get_stats_counter(ring, cp_always_on_context, rbmemptr_stats(ring, index, alwayson_start));
+	if (is_lpac)
+		get_stats_counter(ring, cp_always_on_counter, rbmemptr_stats(ring, index, alwayson_start));
+	else
+		get_stats_counter(ring, cp_always_on_context, rbmemptr_stats(ring, index, alwayson_start));
 
 	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
 	OUT_RING(ring, CP_SET_THREAD_BOTH);
@@ -582,17 +595,19 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		OUT_RING(ring, submit->seqno);
 	}
 
-	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-	OUT_RING(ring, CP_SET_THREAD_BR);
+	if (!is_lpac) {
+		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+		OUT_RING(ring, CP_SET_THREAD_BR);
 
-	OUT_PKT7(ring, CP_EVENT_WRITE, 1);
-	OUT_RING(ring, CCU_INVALIDATE_DEPTH);
+		OUT_PKT7(ring, CP_EVENT_WRITE, 1);
+		OUT_RING(ring, CCU_INVALIDATE_DEPTH);
 
-	OUT_PKT7(ring, CP_EVENT_WRITE, 1);
-	OUT_RING(ring, CCU_INVALIDATE_COLOR);
+		OUT_PKT7(ring, CP_EVENT_WRITE, 1);
+		OUT_RING(ring, CCU_INVALIDATE_COLOR);
 
-	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-	OUT_RING(ring, CP_SET_THREAD_BV);
+		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+		OUT_RING(ring, CP_SET_THREAD_BV);
+	}
 
 	/*
 	 * Make sure the timestamp is committed once BV pipe is
@@ -638,10 +653,12 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	a6xx_flush_yield(gpu, ring);
 
 	/* Check to see if we need to start preemption */
-	if (adreno_is_a8xx(adreno_gpu))
-		a8xx_preempt_trigger(gpu);
-	else
-		a6xx_preempt_trigger(gpu);
+	if (!is_lpac) {
+		if (adreno_is_a8xx(adreno_gpu))
+			a8xx_preempt_trigger(gpu);
+		else
+			a6xx_preempt_trigger(gpu);
+	}
 }
 
 static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
@@ -1219,6 +1236,7 @@ int a6xx_zap_shader_init(struct msm_gpu *gpu)
 		       A6XX_RBBM_INT_0_MASK_PM4CPINTERRUPT | \
 		       A6XX_RBBM_INT_0_MASK_CP_RB_DONE_TS | \
 		       A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS | \
+		       A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS_LPAC | \
 		       A6XX_RBBM_INT_0_MASK_RBBM_ATB_BUS_OVERFLOW | \
 		       A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT | \
 		       A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
@@ -2030,6 +2048,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 		a6xx_preempt_trigger(gpu);
 	}
 
+	if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS_LPAC)
+		msm_gpu_retire(gpu);
+
 	if (status & A6XX_RBBM_INT_0_MASK_CP_SW)
 		a6xx_preempt_irq(gpu);
 
@@ -2500,6 +2521,9 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
 		return true;
 
+	if (ring == gpu->lpac_rb)
+		return true;
+
 	cp_state = (struct msm_cp_state) {
 		.ib1_base = gpu_read64(gpu, REG_A6XX_CP_IB1_BASE),
 		.ib2_base = gpu_read64(gpu, REG_A6XX_CP_IB2_BASE),
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index b50c57f427b4..d85f2536551c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -75,7 +75,7 @@ struct a6xx_gpu {
 	struct drm_gem_object *preempt_smmu_bo[MSM_GPU_MAX_RINGS];
 	void *preempt_smmu[MSM_GPU_MAX_RINGS];
 	uint64_t preempt_smmu_iova[MSM_GPU_MAX_RINGS];
-	uint32_t last_seqno[MSM_GPU_MAX_RINGS];
+	uint32_t last_seqno[MSM_GPU_MAX_RINGS + 1];
 
 	atomic_t preempt_state;
 	spinlock_t eval_lock;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 26ea8a28be47..45e7f8b72dc9 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -71,7 +71,8 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	submit->cmd = (void *)&submit->bos[nr_bos];
 	submit->queue = queue;
 	submit->pid = get_pid(task_pid(current));
-	submit->ring = gpu->rb[queue->ring_nr];
+	submit->ring = queue->ring_nr == gpu->nr_rings ?
+		gpu->lpac_rb : gpu->rb[queue->ring_nr];
 	submit->fault_dumped = false;
 
 	/* Get a unique identifier for the submission for logging purposes */
@@ -599,7 +600,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		goto out_post_unlock;
 	}
 
-	ring = gpu->rb[queue->ring_nr];
+	ring = queue->ring_nr == gpu->nr_rings ?
+		gpu->lpac_rb : gpu->rb[queue->ring_nr];
 
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
 		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 932e2a7c24b3..38fdf8d95cc0 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -537,8 +537,8 @@ static void recover_worker(struct kthread_work *work)
 	 * needs to happen after msm_rd_dump_submit() to ensure that the
 	 * bo's referenced by the offending submit are still around.
 	 */
-	for (i = 0; i < gpu->nr_rings; i++) {
-		struct msm_ringbuffer *ring = gpu->rb[i];
+	for (i = 0; i < gpu->nr_rings + !!gpu->lpac_rb; i++) {
+		struct msm_ringbuffer *ring = i < gpu->nr_rings ? gpu->rb[i] : gpu->lpac_rb;
 
 		uint32_t fence = ring->memptrs->fence;
 
@@ -561,8 +561,8 @@ static void recover_worker(struct kthread_work *work)
 	 * Replay all remaining submits starting with highest priority
 	 * ring
 	 */
-	for (i = 0; i < gpu->nr_rings; i++) {
-		struct msm_ringbuffer *ring = gpu->rb[i];
+	for (i = 0; i < gpu->nr_rings + !!gpu->lpac_rb; i++) {
+		struct msm_ringbuffer *ring = i < gpu->nr_rings ? gpu->rb[i] : gpu->lpac_rb;
 		unsigned long flags;
 
 		spin_lock_irqsave(&ring->submit_lock, flags);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 9a213fb65b4f..263dafeb9652 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -490,9 +490,11 @@ struct msm_context {
 	 * create at most one &drm_sched_entity per-process per-priority-
 	 * level.
 	 */
-	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
+	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * (MSM_GPU_MAX_RINGS + 1)];
+
 	/**
 	 * @ctx_mem:
+	 *
 	 * Total amount of memory of GEM buffers with handles attached for
 	 * this context.
 	 */
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 1a5a77b28016..042b4f90fb73 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -175,6 +175,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 	struct msm_drm_private *priv = drm->dev_private;
 	struct msm_gpu_submitqueue *queue;
 	enum drm_sched_priority sched_prio;
+	struct msm_ringbuffer *ring;
 	unsigned ring_nr;
 	int ret;
 
@@ -211,6 +212,13 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 		queue = kzalloc_obj(*queue);
 	}
 
+	if (flags & MSM_SUBMITQUEUE_LPAC) {
+		ring_nr = priv->gpu->nr_rings;
+		ring = priv->gpu->lpac_rb;
+	} else {
+		ring = priv->gpu->rb[ring_nr];
+	}
+
 	if (!queue)
 		return -ENOMEM;
 
@@ -227,8 +235,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 	} else {
 		queue->ring_nr = ring_nr;
 
-		queue->entity = get_sched_entity(ctx, priv->gpu->rb[ring_nr],
-						 ring_nr, sched_prio);
+		queue->entity = get_sched_entity(ctx, ring, ring_nr, sched_prio);
 	}
 
 	if (IS_ERR(queue->entity)) {
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 7f2e594be4eb..058228a56213 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -465,10 +465,12 @@ struct drm_msm_gem_madvise {
 
 #define MSM_SUBMITQUEUE_ALLOW_PREEMPT	0x00000001
 #define MSM_SUBMITQUEUE_VM_BIND	0x00000002  /* virtual queue for VM_BIND ops */
+#define MSM_SUBMITQUEUE_LPAC	0x00000004
 
 #define MSM_SUBMITQUEUE_FLAGS		    ( \
 		MSM_SUBMITQUEUE_ALLOW_PREEMPT | \
 		MSM_SUBMITQUEUE_VM_BIND | \
+		MSM_SUBMITQUEUE_LPAC | \
 		0)
 
 /*

-- 
2.54.0


