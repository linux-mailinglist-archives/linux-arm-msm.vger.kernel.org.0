Return-Path: <linux-arm-msm+bounces-58536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA9EABC6A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 20:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5448189B06A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F041C28C2AF;
	Mon, 19 May 2025 17:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qv8Maxg9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A87D28C022;
	Mon, 19 May 2025 17:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677511; cv=none; b=Io7qODuxfN7H/PPTiRvuDp/B6bNSD1HfmEVd7bzC/K61+DA/qYQacyxyeShFc2bQrgabxIIalX9S/dKMOKoSLbu/fYkfIqKJb0wcC/w/4jvZ4ZOFqwe0yImCaFpjP9xsqlyLvJY7FI5U8Uplw/lDHWSUiBeAGSNJ9fOOJ3e3h4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677511; c=relaxed/simple;
	bh=j6bKjmoop+1/uaz6CfUQ2VZqh1wDm9EZSFTjlMrhnBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rxJqvBCvuE995G/YHRVV91aYHtmL4hy9na0ozsPg/wpfFShKlNwGOYAk3VWXOmPICDh4cR9YsdoKJRPscb3V0Ji3auEj3pfzLLt22VnJiqDAbVGSuf+tmr8XjxMt1n+idvuF2VGxL/y+Efkv5VYRPZKu7FjNMa9EPeakfTRtF90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qv8Maxg9; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7376e311086so5795542b3a.3;
        Mon, 19 May 2025 10:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677510; x=1748282310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQObzJ/G5smai1eIvIjNkPePS5oTUL5f/3qh2v6cVDU=;
        b=Qv8Maxg9TkyaD4BDmgeLW3E5nq4/25Grtygky8cnxtPWtYdluorHkB6JnnSsFj1uFW
         BeB3lmvngBFudPjrTQxS7GGGz4zLUCq0ieZznB/55DEiKtZhAh/43CxOGb9TrVbtsyE3
         cgjsx2/8afz4w6uDoOENQKm6D1yNd/fVJ7ZKBYyMxoMiq2wU55yvS4iZnaaQD9PqWR+k
         yZSDUiZr/xxI+YSev/JSawxlGhZAtWzDffpgDDVu2Xjg0bbzUMn08XNPUwLCsWNGr4Dg
         lZlcSQvBfFtW/LBMakoD1ZbhY+UVciI859qyvUCY3lJCRKzP3JaWLYCvHCSHP1k/qkh+
         AaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677510; x=1748282310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQObzJ/G5smai1eIvIjNkPePS5oTUL5f/3qh2v6cVDU=;
        b=b8UrEy4y9oIAWNBY2OY79+FO2KDCY+mpYFTJh3TyZuJtxelhejfBGK7hCr5KqkKVbT
         OU4Xk6OOIooluHUp45jJ2OGO/BKyhH38LmRV+QQnNkfkxu0ULmGaATt1JG007aOgdTs+
         pCkaykjmkcyY5LdveYJqmBCpYUFHqpOk+NJclHPX+qutIvpKPKhj/IxayS2wxLFu9kd8
         Ab6qhN1Gsgt9CWob9ZhnqhhKuEOcKc3gaWIlpoHECRStK1LJ3JP9o55cZuKcxvRbwmHb
         4Jor+bpOj76lVW4zxfMKqD4plosR4+WmFJbsau5x1uBl2BOe07XirQ40BlhZUwUN+33P
         MQrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvWakljM2Kl8H/i3F0HZs/yCDPF7Be1EoXGLQoCOpP+34tRxRCkJWY/iSFf0OBSLq126j/gAyEb/0B+l8y@vger.kernel.org, AJvYcCWAR+UFNMMU67A7LqBwGzLfDu4XnCLGt910sjlu9L+Iug9MI03uGeNTY9J/s8XrTsaQmwYbz7Mv4GHprfxH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk6UjY4T0RnAR5CQZQpD/g445W16IoA7j261yF4yD7KgN44C46
	SyqciivufcHQXfF/2iNo8RDSdzd0GLR9RDnlf/pO5+MGbC9egZLhAyRj
X-Gm-Gg: ASbGnctFYRSHlF7BUM5P2Hz288x/wEMmIEiP4JbcV7u6tseJ2zpzADp5mZvpoadL4Fu
	xHbCaka1fxb8dClrLArbNkMh92aBXqH9O/IYRDxlJr6O3c+4aT4aFqv2QdC1iE7YTWZvOwJSyJ2
	Dz+uZvc+fI3bm8T4/Z+vPjxUKLBbM242CzxlGRtc52QwKW2Eoi9RdMBvBcRiImW3LI7FpTFqYG2
	fO+5UPv4gqpimVSpAAyJVJ92kNjJKV/nUvpdJtQsUb6/lbEJWXRN+UxeSPuAKNvqTJngSFUSXXb
	MjGm7sg8+QPt0MMCg7Osh0bVQh2zD2hJ6dVGdyJfo7BSXX5+3yUCxAF172cCFk0IK4PGF95Y9FV
	B7bQoGTfiOyM0z6IhPAPRKxxzBEyHkY/NOSXF
X-Google-Smtp-Source: AGHT+IHFOJVq8mjGt4OQPxx9qu1OTBNCaGJXJ80cWCN7v0fVRfy0Hrt32g1zLejmVT6bVKwJz/WjxA==
X-Received: by 2002:a05:6a00:a86:b0:736:a8db:93b4 with SMTP id d2e1a72fcca58-742a97a71d6mr18340281b3a.2.1747677509539;
        Mon, 19 May 2025 10:58:29 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742bab0bc35sm4789417b3a.13.2025.05.19.10.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:58:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 25/40] drm/msm: Crashdump prep for sparse mappings
Date: Mon, 19 May 2025 10:57:22 -0700
Message-ID: <20250519175755.13037-13-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

In this case, userspace could request dumping partial GEM obj mappings.
Also drop use of should_dump() helper, which really only makes sense in
the old submit->bos[] table world.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 6503ce655b10..2eaca2a22de9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -219,13 +219,14 @@ static void msm_gpu_devcoredump_free(void *data)
 }
 
 static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
-		struct drm_gem_object *obj, u64 iova, bool full)
+				      struct drm_gem_object *obj, u64 iova,
+				      bool full, size_t offset, size_t size)
 {
 	struct msm_gpu_state_bo *state_bo = &state->bos[state->nr_bos];
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	/* Don't record write only objects */
-	state_bo->size = obj->size;
+	state_bo->size = size;
 	state_bo->flags = msm_obj->flags;
 	state_bo->iova = iova;
 
@@ -236,7 +237,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 	if (full) {
 		void *ptr;
 
-		state_bo->data = kvmalloc(obj->size, GFP_KERNEL);
+		state_bo->data = kvmalloc(size, GFP_KERNEL);
 		if (!state_bo->data)
 			goto out;
 
@@ -249,7 +250,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 			goto out;
 		}
 
-		memcpy(state_bo->data, ptr, obj->size);
+		memcpy(state_bo->data, ptr + offset, size);
 		msm_gem_put_vaddr(obj);
 	}
 out:
@@ -279,6 +280,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	state->fault_info = gpu->fault_info;
 
 	if (submit) {
+		extern bool rd_full;
 		int i;
 
 		if (state->fault_info.ttbr0) {
@@ -294,9 +296,10 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
 		for (i = 0; state->bos && i < submit->nr_bos; i++) {
-			msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
-						  submit->bos[i].iova,
-						  should_dump(submit, i));
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
+						  dump, 0, obj->size);
 		}
 	}
 
-- 
2.49.0


