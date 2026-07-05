Return-Path: <linux-arm-msm+bounces-116578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wuUJEz6tSmrCFwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:15:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D145570AECC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:15:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YunYPb6f;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116578-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116578-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20C403014254
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 19:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EEA73A7826;
	Sun,  5 Jul 2026 19:14:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BEB3A380C
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 19:14:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278883; cv=none; b=l9R9Lu6pEZqltJzJmUbsxcmj9uA4F+TlYXw0diENnPLm42aidj7NNoU1aGh9Ds6k1RmdT7ljP1G/U5w32VYqEiX9Sc1qpLNR9jt0CmwhnwhNf4LMiCdEFNwFrngCjXhXElheJyuIWyLeSchsjgklBF2Y3gqP/qp+SqpwvaQpyZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278883; c=relaxed/simple;
	bh=wmCqgt9bbc7y6girDLeQUG/lasgVe98klmVzcoHOM/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SS9HUvrqphaKmyu+b/xcirpe3NVqJkJ/F77rKg/JId9hXjR8+vTGPkNK23pinLf2BmCFsSRQMKoK7TO+iGe6WzTrg0hAlLbx9Pq/6JVTcwBtn7IXXhkjjzs+bGcz1EuSec0N/vLFBeanTzLdlj3lLcimoFBiKNmwPD/mRIWXmfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YunYPb6f; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso15622955e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 12:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278879; x=1783883679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8zcaiL31SCCh1YPdlPY6GbxJWdviTylW/ogJ//b4zE=;
        b=YunYPb6fLEi839drRXRBXRyV5+J1auPYZgtYJf8T4q/IpYGnN/qdlRWs2Oz/sgH083
         gh9znccHCwaDqgsc3H6fAzMaJnGxhSSdBzXccf8dkvp19A5wtDtK5sh2t5sn0Ey0PZ2u
         d6f2OsGzzf0DFIPFlNtOgdIbjBYow2SYLl5VJsXvo3gUrA2XHXwvGHjcjJzy15dBhAvz
         AfhshRCyJ9rlBGqlDd9c7yIXY2/sm1PPn4p+/M72AiWLDSWvw+pDTpA6xzuMePvbJAIz
         ekXRT7+HHqWkDD+vTdBZFUPnr8SKwwk84E9hi4Y/PF93KQKv501RMYKdgvHpZhqxmrIK
         CO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278879; x=1783883679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C8zcaiL31SCCh1YPdlPY6GbxJWdviTylW/ogJ//b4zE=;
        b=Ui7cZj5+OsePJ6RVyFjjDyAPzyzFw7dQM+jX/ef/ipJ/ieCQBvEFPfV7nQhHyThK1A
         EIC4X+EMyjNQAWQgUOQ6cEvM11YZM/ixi5LK3QE+gON0eGBXnkNaIO3lp/1e5YFXOirr
         KS7SraLxXmwAvowXZFYDQy+5bhm/UCf4FBEMVleDejXNj8ulHFl6AeVk4W3vJ1BTh8zK
         OCeJCgibq3gvxj4Cbz4gvhcER38RJzG1DI0hfxEjz7b7gg8eYhjda9FhKKb57/u7dLOf
         ZB/7KsVliZSPDZppRoWBA7ZO6+ntSZUq+RCIrXmtB37c9gzBH/cZs6d8RNDcqLIRCPBI
         vm3w==
X-Forwarded-Encrypted: i=1; AHgh+Rq6lQaagC6NOFQjCEiKuPtEa3RcsAdyP3E5jxgTylZCUh4729Azgv7utnVw6IG/mlAU7m9hAgile6zCPsaG@vger.kernel.org
X-Gm-Message-State: AOJu0YwXNACYak4iOQheldDEhwcB8awZFDlIGb0JkCsDRwh67ZYEBFMs
	wf6HmWbQj7M3Fplluo3D06lbHG/Tz/MG2mrAG4HEtYoj+GxE1jnp/8o=
X-Gm-Gg: AfdE7cmCZjgahIFgW3ZQbMTbyZuqHmx8b3nEHsLRMeJ3/CLI3ThwbNyjvriyYch50I9
	ON7x2m1t+c7ZX3Bqt221M0AaDz+8s/0M1ff03cFC4cWGu3Htsx8hGeNPtysiWZDD2JhZ/mgx5Ne
	l0rY2Ou/HAP94HvEs+K+ZsacmSowJPJhEyRtUMZllk0W0pQcy31RpYMAuv8aoqvy7www1D3Ed3z
	lp1HVCGY1EYKleDhKytnxd/QUOJt64d6rWV9k6+XLhyYvOcyqOkusaeP4nZKVlPdqBpIzC0TotH
	bA413oFt37lfY10fTuncvZ/5P367B6JorbpbXtFkoCjHvVxNhQuqZtAAuOjkHay8sIXR3funbJ6
	0aIUWQ/1Kyfn+11tvZOpWYJuVIivpmDH0tEK7cCQEb82EqK2UdjpxXonBZZ99SYHz/I//Y5vZIU
	JMSdFHd6ILEwaYhoc=
X-Received: by 2002:a05:600c:c16f:b0:492:523f:a3df with SMTP id 5b1f17b1804b1-493d52ac417mr60885215e9.5.1783278878843;
        Sun, 05 Jul 2026 12:14:38 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:38 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:47 +0200
Subject: [PATCH RFC 13/13] drm/msm: add lpac ring to devcoredump
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-13-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=2731;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=wmCqgt9bbc7y6girDLeQUG/lasgVe98klmVzcoHOM/o=;
 b=PVK05TezP6oByIlmJqXX6RCKZc0Sfa+FvqbaJD2D2MNQt18wh5zplyqPzMUoPj4wq2v3x/AHS
 ORhKtsBbYDeCcbFNugaM2rR3PLhNr8TrJkg/x8sEhnkPAzo9vnVPIw+
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-116578-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D145570AECC

Add the LPAC ring state to the devcoredump for debugging.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 19 ++++++++++---------
 drivers/gpu/drm/msm/msm_gpu.h           |  2 +-
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 94dbec9464a4..030bb1aeb7ee 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -782,25 +782,26 @@ int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state)
 
 	ktime_get_real_ts64(&state->time);
 
-	for (i = 0; i < gpu->nr_rings; i++) {
+	for (i = 0; i < gpu->nr_rings + !!gpu->lpac_rb; i++) {
+		struct msm_ringbuffer *ring = i < gpu->nr_rings ? gpu->rb[i] : gpu->lpac_rb;
 		int size = 0, j;
 
-		state->ring[i].fence = gpu->rb[i]->memptrs->fence;
-		state->ring[i].iova = gpu->rb[i]->iova;
-		state->ring[i].seqno = gpu->rb[i]->fctx->last_fence;
-		state->ring[i].rptr = get_rptr(adreno_gpu, gpu->rb[i]);
-		state->ring[i].wptr = get_wptr(gpu->rb[i]);
+		state->ring[i].fence = ring->memptrs->fence;
+		state->ring[i].iova = ring->iova;
+		state->ring[i].seqno = ring->fctx->last_fence;
+		state->ring[i].rptr = get_rptr(adreno_gpu, ring);
+		state->ring[i].wptr = get_wptr(ring);
 
 		/* Copy at least 'wptr' dwords of the data */
 		size = state->ring[i].wptr;
 
 		/* After wptr find the last non zero dword to save space */
 		for (j = state->ring[i].wptr; j < MSM_GPU_RINGBUFFER_SZ >> 2; j++)
-			if (gpu->rb[i]->start[j])
+			if (ring->start[j])
 				size = j + 1;
 
 		if (size) {
-			state->ring[i].data = kvmemdup(gpu->rb[i]->start, size << 2, GFP_KERNEL);
+			state->ring[i].data = kvmemdup(ring->start, size << 2, GFP_KERNEL);
 			if (state->ring[i].data)
 				state->ring[i].data_size = size << 2;
 		}
@@ -1001,7 +1002,7 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 
 	drm_puts(p, "ringbuffer:\n");
 
-	for (i = 0; i < gpu->nr_rings; i++) {
+	for (i = 0; i < gpu->nr_rings + !!gpu->lpac_rb; i++) {
 		drm_printf(p, "  - id: %d\n", i);
 		drm_printf(p, "    iova: 0x%016llx\n", state->ring[i].iova);
 		drm_printf(p, "    last-fence: %u\n", state->ring[i].seqno);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 263dafeb9652..4fbf0dedc334 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -639,7 +639,7 @@ struct msm_gpu_state {
 		void *data;
 		int data_size;
 		bool encoded;
-	} ring[MSM_GPU_MAX_RINGS];
+	} ring[MSM_GPU_MAX_RINGS+1];
 
 	int nr_registers;
 	u32 *registers;

-- 
2.54.0


