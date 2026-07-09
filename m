Return-Path: <linux-arm-msm+bounces-117851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q08ZOMQ+T2occwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:25:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5149E72D190
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:25:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=huaiW3w0;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117851-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117851-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CB4A303F24B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 06:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989563BED44;
	Thu,  9 Jul 2026 06:23:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3D73BED31
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 06:23:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578201; cv=none; b=HwVVkH5fP9QpbC8ZQ5PNx7Adx5mp9oknebdVsp+sbt6bYI2SBzHh0ZR3RZ4tPcpiQFospBdhbtxUqTt+t1MrC1q2ZTFPmp8+LqDnLlQOd1fOgkpNrHxr050msYLAeEkdzztaFHgdgOKb7g6hDf0OPA48iXDvGt3ZXzA2EoUPEtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578201; c=relaxed/simple;
	bh=DztzhJvSAMQjQSAwxbn1gzxvsM7T2uHdgcxGnlsaFEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cFHZeLXLA26+TryBZkKWlNoP7rfajDTk6jBn6TV9k0b5CwZDr5cingDe6lu0t7Y47AXI4IWgRhhWJX5jBN8iZ63KRbEJAkEgbXppVftUYh7hcqigkxWCB4Nyw7miOdP9xrJLyc+QgIsCbw+MiIgCwgR0GXrTjqBS7zh3/gLncW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huaiW3w0; arc=none smtp.client-ip=209.85.214.176
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc97653887so16912935ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 23:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783578198; x=1784182998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F+zTyO38kFOW42Ye072aTRdmVTUuZduS9Yzytq9n62s=;
        b=huaiW3w0qHN75iOi7GjmJtZ7kBq8B/c5H+Zjq/w3OdJPQXjDT0nUQIb6dN8BHELDLB
         RH99DVJLl0EcSbN+asB+tuUVJLImjCgj82Lk31Y1TVZBHoYFzHwbq0BfPXc3X+dvOQmT
         ScTp/bahZw19YuUtLalR+SkImI0Rp0qwKohvl+H3fxGK/qq8/Mvb9wWn49/oLXZzAFrR
         q7fvN9qauGH93DFrQ0GlgE2h5eoe8cXcpQ+DHoYPUPTBCRIu5lsfb78kqqGKNJ6ugeiJ
         rlkrtQtfhGlLzAO3oztIDZMi3jwfOr84O+2+Bs/9OaboDoU3nfYW8y4PYB5jTD8RnVoj
         +4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578198; x=1784182998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+zTyO38kFOW42Ye072aTRdmVTUuZduS9Yzytq9n62s=;
        b=K1ihH2gS90t+Vx6Sq9H+mlZ3DgftzRrvYN61leclzg4lSrZp1cpiKnOF7nUI2SBK3k
         NmsQJxyFOBxHRWUcNEWhqVn9rYKcEgaLp1VJeb73IoqYT7Ki4UPL7VRgLASDBSnHxA6F
         cAP8E3xbfI2rdAXb9GogffKwutyftgyik4PVx6E7WQy8fLj0LASp3D5vF71BgT3ubfwj
         J7Vbf9zlY6AvOCZJsTWUCxWI1Kt7FtZhmlVzbrShNnXRr1YK3f1EXCbYtqgRxv0Vr4bl
         zrMF/g6dZrAy2Bl8+l/qjVBfReBSZdhO7u15nZSJVZlN74yfhpY82Tu3C3ScnDtRyRJW
         +hEw==
X-Gm-Message-State: AOJu0YyU9u2Y/8gZov+4m5foNf1jdOnz4GasEWG/sGVWMab+GPSJbjKU
	dPddcdMPYshNhRtQf6uiuGXKXctPGRYT2n0+bXj4M4msiQlbAOhn+ZNK
X-Gm-Gg: AfdE7clJoppbVzZ+FEtApl4k6FJI6Tl4pP7NKqvbjuN7E3dPfAAIxiZD28dumGqjwUH
	cE1jaBe0eZeof5JJu++DNT64MahyO90qpx0LAw7bmNJaHZDpHtkeA36PiCq5Zp/Kr0XcrOZsGw+
	fi+9pdXoPWRBAyfun8fIjs9xsag7nOnLSHu0Wht8heewDfrVp/IjfuyLvV46YaFNXqUfbLN9UF1
	u60KU/LHuBngMAU52WwLj8yiGCmgfcQd6KuEX8q9ZlvaV5G6FJIAIC6RWS/XNS/k0ihlAaOtTJE
	7ucyCulKsjRR+fuTxWjctBN2usaL/AH/4XAtUTogizeIhjVLs/9mQbrvXkfxKXLIwe+AHTAN6pK
	Ar0wZlDJCGBDyd73dftwaTIzc7XIrNv0xsTHbgQ0OdRzU8hIptwC9zYDE1Rk3i5D1NxP6r8X8VE
	DlyWHMmpFrYLlJexd/8vLWYDRRbhqCKonQ
X-Received: by 2002:a17:903:230c:b0:2c9:fa31:84f9 with SMTP id d9443c01a7336-2ccea2d807cmr62949145ad.5.1783578197580;
        Wed, 08 Jul 2026 23:23:17 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:ea9b:46f2:6d0c:46c7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e26esm38741495ad.44.2026.07.08.23.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:23:16 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] drm/msm: Only fini scheduler after successful init
Date: Thu,  9 Jul 2026 14:23:09 +0800
Message-ID: <20260709062309.4168362-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-117851-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robdclark@gmail.com,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@linaro.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ruoyuw560@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,quicinc.com,linaro.org,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ruoyuw560@gmail.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruoyuw560@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5149E72D190

msm_ringbuffer_new() destroys a partially initialized ring through
msm_ringbuffer_destroy() when an allocation or scheduler setup step
fails.

If drm_sched_init() fails before it finishes initializing the scheduler,
the failure path still calls drm_sched_fini(). That teardown path assumes
the scheduler work items, lists, and workqueue state were initialized.

Track successful scheduler initialization and call drm_sched_fini() only
after drm_sched_init() returned 0.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: 1d8a5ca436ee ("drm/msm: Conversion to drm scheduler")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/gpu/drm/msm/msm_ringbuffer.c | 7 ++++---
 drivers/gpu/drm/msm/msm_ringbuffer.h | 1 +
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 0d14c31bd4e47..af2b0edc4d586 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -108,9 +108,9 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	ring->memptrs_iova = memptrs_iova;
 
 	ret = drm_sched_init(&ring->sched, &args);
-	if (ret) {
+	if (ret)
 		goto fail;
-	}
+	ring->sched_initialized = true;
 
 	INIT_LIST_HEAD(&ring->submits);
 	spin_lock_init(&ring->submit_lock);
@@ -132,7 +132,8 @@ void msm_ringbuffer_destroy(struct msm_ringbuffer *ring)
 	if (IS_ERR_OR_NULL(ring))
 		return;
 
-	drm_sched_fini(&ring->sched);
+	if (ring->sched_initialized)
+		drm_sched_fini(&ring->sched);
 
 	msm_fence_context_free(ring->fctx);
 
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index 28ca8c9f7463d..3631ec283c6e5 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -56,6 +56,7 @@ struct msm_ringbuffer {
 	 * The job scheduler for this ring.
 	 */
 	struct drm_gpu_scheduler sched;
+	bool sched_initialized;
 
 	/*
 	 * List of in-flight submits on this ring.  Protected by submit_lock.
-- 
2.51.0


